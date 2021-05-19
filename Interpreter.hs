{-# LANGUAGE MultiParamTypeClasses, NamedFieldPuns #-}

module Interpreter where


import Data.Map as Map
import Choc.Abs
import Control.Monad.State
import Control.Monad.Error
import Data.Maybe
-- Val --

data Val
    = VInt Integer
    | VBool Bool
    | VString String
    | VFunc Type Ident [Arg] Block
    | VNull
    | VArr Type Ident [Val] [Val]
  deriving (Eq, Ord)

instance Show Val where
  show (VInt val) = show val
  show (VBool b) = show b
  show (VString str) = show str
  show (VFunc env id args block) = "Func" ++ show id
  show VNull = "Null"

-- RetInfo

data RetInfo = Return Val | ReturnNothing | RBreak | RContinue

-- Memory and Enviroment --
type Loc = Int
type Env = Map.Map Ident [Loc]
type Store = Map.Map Loc Val
type Scope = [Ident]
type Scopes = [Scope]

data IntState = IntState {
  store :: Store,
  freeLocs :: [Loc],
  env :: Env,
  scopes :: Scopes
}

-- Init Enviroment --

initStore :: Store
initStore = Map.empty

initFreeLocs :: [Loc]
initFreeLocs = [1..2^16]

initEnv :: Env
initEnv = Map.empty

emptyScope = []
initScopes :: Scopes
initScopes = [emptyScope]

initState = IntState initStore initFreeLocs initEnv initScopes

-- IM --

type IM a = StateT IntState (ErrorT String IO) a
runIM :: IM a -> IntState -> IO (Either String (a, IntState))
runIM m st = runErrorT (runStateT m st)

-- Memory Management -- 

alloc :: IM Loc
alloc = do
  locs <- getFreeLocs
  case locs of
    [] -> throwError "alloc: no more free locs"
    (l:ls) -> putFreeLocs ls >> return l

free :: Loc -> IM ()
free l = do
  ls <- getFreeLocs
  putFreeLocs (l:ls)

updateStore :: Loc -> Val -> IM ()
updateStore v x = modify $ \state -> state {
  store = Map.insert v x (store state)}

getStore :: IM Store
getStore = gets store

getFreeLocs :: IM [Loc]
getFreeLocs = gets freeLocs

putFreeLocs :: [Loc] -> IM ()
putFreeLocs freeLocs = modify $ \r -> r { freeLocs }

getEnv :: IM Env
getEnv = gets env

putEnv :: Env -> IM ()
putEnv env = modify $ \r -> r { env }

modifyEnv :: (Env -> Env) -> IM ()
modifyEnv f = getEnv >>= putEnv . f

getScopes ::  IM Scopes
getScopes = gets scopes

putScopes :: Scopes -> IM ()
putScopes scopes = modify $ \r -> r { scopes }

modifyScopes :: (Scopes -> Scopes) -> IM ()
modifyScopes f = getScopes >>= putScopes . f

popScope :: IM Scope
popScope = do
  (scope:scopes) <- getScopes
  putScopes scopes
  return scope

enterScope :: IM ()
enterScope = modifyScopes (emptyScope:)

leaveScope :: IM ()
leaveScope = do
  env <- getEnv
  scope <- popScope
  -- TODO: free scope vars
  let scopeLocs = catMaybes $ Prelude.map (flip lookupEnv env) scope
  mapM_ free scopeLocs
  let env' = Prelude.foldr (\n e -> Map.update pop n e) env scope
  putEnv env' where
    pop :: [Loc] -> Maybe [Loc]
    pop [] = Nothing
    pop (x:xs) = Just xs

createVar :: Ident -> IM Loc
createVar n = do
     l <- alloc
     modifyEnv (updateEnv n l)
     modifyScopes (addLocal n)
     return l

addLocal :: Ident -> Scopes -> Scopes
addLocal n (h:t) =(n:h):t
addLocal n [] = []

lookupEnv :: Ident -> Env -> Maybe Loc
lookupEnv n e = do
  stack <- Map.lookup n e
  case stack of
    [] -> Nothing
    (l:_) -> return l

updateEnv :: Ident -> Loc -> Env -> Env
updateEnv n l = Map.insertWith (++) n [l]

getIdentLoc :: Ident -> IM Loc
getIdentLoc n =  do
  env <- getEnv
  let res  = lookupEnv n env
  maybe (throwError $ unwords["Undefined var",show n,"env is",show env]) return res

getVar :: Ident -> IM Val
getVar v =  do
  loc <- getIdentLoc v
  store <- getStore
  let res  = Map.lookup loc store
  maybe (throwError $ "Unallocated var"++ show v) return res

-- run interpreter --

interpretProgram :: Program -> IO (Either String (Val, IntState))
interpretProgram program =
  runIM (runMain program) initState


runMain :: Program -> IM Val
runMain (Program tds) = do
  addTopDefs tds
  evalExpr $ EApp (Ident "main") []

-- TopDef --

addTopDef :: TopDef -> IM ()
addTopDef (FnDef t id args b) = do
  l <- createVar id
  updateStore l (VFunc t id args b)

addTopDefs :: [TopDef] -> IM ()
addTopDefs = Prelude.foldr ((>>) . addTopDef) (return ())

-- Expr Helpers --

negVInt :: Val -> Val
negVInt (VInt i) = VInt (-i)

notVBool :: Val -> Val
notVBool (VBool b) = VBool (not b)

relVInt :: RelOp -> Val -> Val -> Val
relVInt LTH (VInt a) (VInt b) = VBool (a < b)
relVInt LE (VInt a) (VInt b) = VBool (a <= b)
relVInt GTH (VInt a) (VInt b) = VBool (a > b)
relVInt GE (VInt a) (VInt b) = VBool (a >= b)
relVInt EQU (VInt a) (VInt b) = VBool (a == b)
relVInt NE (VInt a) (VInt b) = VBool (a /= b)

addVInt :: AddOp -> Val -> Val -> Val
addVInt Plus (VInt a) (VInt b) = VInt (a + b)
addVInt Minus (VInt a) (VInt b) = VInt (a - b)

mulVInt :: MulOp -> Val -> Val -> Val
mulVInt Times (VInt a) (VInt b) = VInt (a * b)
mulVInt Div (VInt a) (VInt b) =
  if b == 0 then
    error "Division by 0"
  else
    VInt (a `div` b)
mulVInt Mod (VInt a) (VInt b) =
  if b == 0 then
    error "Modulo by 0"
  else
    VInt (a `mod` b)

andVBool :: Val -> Val -> Val
andVBool (VBool a) (VBool b) = VBool (a && b)

orVBool :: Val -> Val -> Val
orVBool (VBool a) (VBool b) = VBool (a || b)

declFunctionArgs :: [Expr] -> [Arg] -> IM ()
declFunctionArgs [] [] = return ()
declFunctionArgs [] (a:xa) = throwError "Number of arguments don't match"
declFunctionArgs (e:xe) [] = throwError "Number of arguments don't match"
declFunctionArgs (e:xe) (a:xa) = do
  v <- evalExpr e
  case a of
    (ArgNoRef t id) -> do
      l <- createVar id
      updateStore l v
    (ArgRef t id) -> do -- todo change to reference
      l <- createVar id
      updateStore l v

-- Evaluate Expr --

evalExpr :: Expr -> IM Val
evalExpr (EVar id) = getVar id
evalExpr (ELitInt i) = return (VInt i)
evalExpr ELitTrue = return (VBool True)
evalExpr ELitFalse = return (VBool False)

evalExpr (EApp id exprs) = do
  enterScope
  (VFunc t id args (Block b)) <- getVar id
  declFunctionArgs exprs args
  retVal <- execBlock b
  leaveScope
  case retVal of
    Return val -> return val
    _ -> throwError $ unwords["Function ",show id,"didn't return anything"]

evalExpr (EString s) = return (VString s)
evalExpr (EArr arr) = throwError "EArr not implemented"
evalExpr (Neg expr) = negVInt <$> evalExpr expr
evalExpr (Not expr) = notVBool <$> evalExpr expr
evalExpr (EMul expr1 op expr2) = mulVInt op <$> evalExpr expr1 <*> evalExpr expr2
evalExpr (EAdd expr1 op expr2) = addVInt op <$> evalExpr expr1 <*> evalExpr expr2
evalExpr (EAnd expr1 expr2) = andVBool <$> evalExpr expr1 <*> evalExpr expr2
evalExpr (ERel expr1 op expr2) = relVInt op <$> evalExpr expr1 <*> evalExpr expr2
evalExpr (EOr expr1 expr2) = orVBool <$> evalExpr expr1 <*> evalExpr expr2
evalExpr (ELambda l) = throwError "ELambda not implemented"


-- Stmt --

execBlock :: [Stmt] -> IM RetInfo
execBlock [] = return ReturnNothing
execBlock (s:ss) = do
  ret <- execStmt s
  case ret of
    Return val -> return (Return val)
    ReturnNothing -> execBlock ss
    breakOrCont -> return breakOrCont

declItem :: Type -> Item -> IM ()
declItem t (NoInit id) = do
  n <- case t of
    Int -> return (VInt 0)
    Bool -> return (VBool False)
    Str -> return (VString "")
  l <- createVar id
  updateStore l n

declItem t (Init id e) = do
  n <- evalExpr e
  l <- createVar id
  updateStore l n

execDecl :: Type -> [Item] -> IM ()
execDecl t = Prelude.foldr ((>>) . declItem t) (return ())

declArray :: Type -> ArrExpr -> [Val] -> Integer -> IM ()
declArray t (FirstDim id e) dims size = do
  val <- evalExpr e
  l <- createVar id
  updateStore l (VArr t id dims (replicate (fromIntegral size) (VInt 0)))

declArray t (MultDim arrExpr e) dims prod = do
  (VInt val) <- evalExpr e
  declArray t arrExpr (VInt val:dims) (prod * val)


-- Execute Stmt -- 

execStmt :: Stmt -> IM RetInfo
execStmt Empty = return ReturnNothing
execStmt (BStmt (Block b)) = execBlock b
execStmt (Decl t items) = execDecl t items >> return ReturnNothing
execStmt (ArrDecl t aExpr) = declArray t aExpr [] 1 >> return ReturnNothing
execStmt (Ass id expr) = do
  n <- evalExpr expr
  l <- createVar id
  updateStore l n
  return ReturnNothing

execStmt (ArrAss arrExpr expr) = throwError "ArrAss not implemented"
execStmt (Incr id) = do
  VInt v <- getVar id
  l <- getIdentLoc id
  updateStore l (VInt $ v + 1)
  return ReturnNothing

execStmt (Decr id) = do
  VInt v <- getVar id
  l <- getIdentLoc id
  updateStore l (VInt $ v - 1)
  return ReturnNothing

execStmt (Ret expr) = Return <$> evalExpr expr
execStmt VRet = return $ Return VNull
execStmt (Cond expr (Block b)) = do
  VBool c <- evalExpr expr
  if c then do
    enterScope
    retVal <- execBlock b
    leaveScope
    return retVal
  else
    return ReturnNothing

execStmt (CondElse expr (Block b1) (Block b2)) = do
  VBool c <- evalExpr expr
  if c then do
    enterScope
    retVal <- execBlock b1
    leaveScope
    return retVal
  else do
    enterScope
    retVal <- execBlock b2
    leaveScope
    return retVal

execStmt (While expr (Block b)) = do
  VBool c <- evalExpr expr
  if c then do
    enterScope
    retVal <- execBlock b
    leaveScope
    case retVal of
      RBreak -> return ReturnNothing
      Return val -> return (Return val)
      _ -> execStmt (While expr (Block b))
  else
    return ReturnNothing

execStmt (SExp expr) = evalExpr expr >> return ReturnNothing
execStmt Break = return RBreak
execStmt Continue = return RContinue
execStmt (FnNestDef td) = throwError "FnNestDef not implemented"
execStmt (SPrint expr) = do
  val <- evalExpr expr
  liftIO $ putStr $ show val
  return ReturnNothing