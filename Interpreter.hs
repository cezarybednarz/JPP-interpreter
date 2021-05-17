module Interpreter where


import Data.Map.Lazy as LazyMap
import Chococino.Abs
import Control.Monad.State
import Control.Monad.Error

-- types --

data Val = VInt Integer | VBool Bool | VString String | VFunc Env [Arg] Block | VNull
  deriving (Eq, Ord)

data RetInfo = Return Val | ReturnNothing | Break | Continue

type Loc = Int
type Env = LazyMap.Map Ident [Loc]
type Store = LazyMap.Map Loc Val
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
initStore = LazyMap.empty

initFreeLocs :: [Loc]
initFreeLocs = [1..2^16]

initEnv :: Env
initEnv = LazyMap.empty

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
  store = LazyMap.insert v x (store state)}

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
  let scopeLocs = mapMaybe (flip lookupEnv env) scope
  mapM_ free scopeLocs
  let env' = foldr (Map.update pop)env scope
  putEnv env' where
    pop :: [Loc] -> Maybe [Loc]
    pop [] = Nothing
    pop (x:xs) = Just xs

createVar :: Name -> IM Loc
createVar n = do
     l <- alloc
     modifyEnv (updateEnv n l)
     modifyScopes (addLocal n)
     return l

addLocal :: Name -> Scopes -> Scopes
addLocal n (h:t) =(n:h):t
addLocal n [] = []

lookupEnv :: Name -> Env -> Maybe Loc
lookupEnv n e = do
  stack <- Map.lookup n e
  case stack of
    [] -> Nothing
    (l:_) -> return l

updateEnv :: Name -> Loc -> Env -> Env
updateEnv n l = Map.insertWith (++) n [l]

getNameLoc :: Name -> IM Loc
getNameLoc n =  do
  env <- getEnv
  let res  = lookupEnv n env
  maybe (throwError $ unwords["Undefined var",n,"env is",show env]) return res

getVar :: Name -> IM Val
getVar v =  do
  loc <- getNameLoc v
  store <- getStore
  let res  = Map.lookup loc store
  maybe (throwError $ "Unallocated var"++ v) return res

-- run interpreter --

interpretProgram :: Program -> IO (Either String (Integer, IntState))
interpretProgram (Program program) =
  addTopDefs program >> runIM (evalExpr $ EApp (Ident "main")) initState

-- TopDef --

addTopDef :: TopDef -> IM ()
addTopDef (t,id,args,b) = do
  n <- (t,args,b)
  l <- createVar id
  updateStore l n

addTopDefs :: [TopDef] -> IM ()
addTopDefs [] = return ()
addTopDefs ((t,id,args,b):ds) = addTopDef t id args b >> addTopDefs ds

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
evalExpr (ELitInt i) = return i
-- evalExpr (ELiTrue b)
-- evalExpr (ELitFalse b)

evalExpr (EApp id exprs) = do
  enterScope
  (t,args,b) <- getVar id 
  declFunctionArgs exprs args
  retVal <- execBlock b
  leaveScope
  case retVal of
    Return val -> return val
    _ -> throwError $ unwords["Function ",id,"didn't return anything"]

-- evalExpr (EString s) 
-- evalExpr (EArr arr)


-- Stmt --

execBlock :: Block -> IM RetInfo
execBlock (BStmt []) = return ReturnNothing
execBlock (BStmt (s:ss)) = do
  ret <- execStmt s
  case ret of 
    Return val -> return (Return val)
    ReturnNothing -> execBlock ss
    breakOrCont -> return breakOrContinue


declItem :: Type -> Item -> IM ()
declItem t id = do
  n <- case t of
    VInt -> 0
    VStr -> ""
    VBool -> False
    _ -> 0
  l <- createVar id
  updateStore l n
  
declItem t id e = do
  n <- evalExpr e
  l <- createVar id
  updateStore l n

execDecl :: Type -> [Item] -> IM ()
execDecl t = Prelude.foldr ((>>) . declItem t) (return ())

-- execution Stmt -- 

execStmt :: Stmt -> IM RetInfo
execStmt (Empty) = return ReturnNothing
execStmt (BStmt b) = executeBlock b
execStmt (Decl t items) = execDecl t items
-- todo cala reszta
