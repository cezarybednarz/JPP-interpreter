{-# LANGUAGE MultiParamTypeClasses, NamedFieldPuns #-}

module Interpreter where


import Data.Map as Map
import Chococino.Abs
import Control.Monad.State
import Control.Monad.Error
import Data.Maybe(catMaybes)

-- types --n

data Val = VInt Integer | VBool Bool | VString String | VFunc Type Ident [Arg] Block | VNull
  deriving (Eq, Ord)

data RetInfo = Return Val | ReturnNothing | Break | Continue

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

-- init enviroment --

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

-- memory management -- 

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
  let scopeLocs = catMaybes $ Map.map (flip lookupEnv env) scope
  mapM_ free scopeLocs
  let env' = Map.foldr (\n e -> Map.update pop n e)env scope
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
  maybe (throwError $ unwords["Undefined var",n,"env is",show env]) return res

getVar :: Ident -> IM Val
getVar v =  do
  loc <- getIdentLoc v
  store <- getStore
  let res  = Map.lookup loc store
  maybe (throwError $ "Unallocated var"++ show v) return res

-- run interpreter --

interpretProgram :: Program -> IO (Either String (Val, IntState))
interpretProgram (Program program) = 
  addTopDefs program >> runIM (evalExpr $ EApp (Ident "main") []) initState

-- TopDef --

addTopDef :: TopDef -> IM ()
addTopDef (FnDef t id args b) = do
  l <- createVar id
  updateStore l (VFunc t id args b)

addTopDefs :: [TopDef] -> IM ()
addTopDefs = Prelude.foldr ((>>) . addTopDef) (return ())

-- Expr --

declFunctionArgs :: [Expr] -> [Arg] -> IM ()
declFunctionArgs exprs@(e:xe) args@(a:xa) =
  if length exprs /= length args then
    throwError "number of arguments don't match"
  else do
    v <- evalExpr e
    case a of
      (ArgNoRef t id) -> do
        l <- createVar id
        updateStore l v
      (ArgRef t id) -> do
        l <- createVar id
        updateStore l v


evalExpr :: Expr -> IM Val
evalExpr (ELitInt i) = return (VInt i)
-- evalExpr (ELiTrue b)
-- evalExpr (ELitFalse b)

evalExpr (EApp id exprs) = do
  enterScope
  (VFunc t id args (Block b)) <- getVar id
  declFunctionArgs exprs args
  retVal <- execBlock b
  leaveScope
  case retVal of
    Return val -> return val
    _ -> throwError $ unwords["Function ",show id,"didn't return anything"]

-- evalExpr (EString s) 
-- evalExpr (EArr arr)


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
    Int -> 0
    Bool -> 0
    _ -> 0 -- todo default value for Str
  l <- createVar id
  updateStore l n

declItem t (Init id e) = do
  n <- evalExpr e
  l <- createVar id
  updateStore l n

execDecl :: Type -> [Item] -> IM ()
execDecl t = Prelude.foldr ((>>) . declItem t) (return ())

-- execution Stmt -- 

execStmt :: Stmt -> IM RetInfo
execStmt Empty = return ReturnNothing
execStmt (BStmt (Block b)) = execBlock b
execStmt (Decl t items) = execDecl t items >> return ReturnNothing
-- todo cala reszta
