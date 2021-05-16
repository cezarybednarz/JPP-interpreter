module Interpreter where


import Data.Map.Lazy as LazyMap 
import Chococino.Abs 
import Control.Monad.State
import Control.Monad.Except
import Memory

-- types --

data Val = VInt Integer | VBool Bool | VString String | VFunc Env [Arg] Block | VNull 
  deriving (Eq, Ord)

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

type IM a = StateT IntState (ExceptT String IO) a
runIM :: IM a -> IntState -> IO (Either String (a, IntState))
runIM m st = runExceptT (runStateT m st)

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
  let scopeLocs = catMaybes $ map (flip lookupEnv env) scope
  mapM_ free scopeLocs
  let env' = foldr (\n e -> Map.update pop n e)env scope
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
interpretProgram (Program program) = do
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

evalExpr :: Expr -> IM Val





