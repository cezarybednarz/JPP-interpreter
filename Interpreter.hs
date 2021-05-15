module Interpreter where


import Data.Map.Lazy as LazyMap 
import Chococino.Abs 
import Control.Monad.State
import Control.Monad.Except

-- types --

data Val = VInt Integer | VBool Bool | VString String | VFunc Env [Arg] Block | VNull 
  deriving (Eq, Ord)

type Loc = Int
type Env = LazyMap.Map Ident [Loc]
type Store = LazyMap.Map Loc Val

type Scope = [Ident]
type Scopes = [Scope]

emptyScope = []
initScopes = [emptyScope]

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

-- helpers --
alloc :: IM Loc

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

initFreeLocs :: [Loc]
initFreeLocs = [1..2^16]

getFreeLocs :: IM [Loc]
getFreeLocs = gets freeLocs

putFreeLocs :: [Loc] -> IM ()
putFreeLocs freeLocs = modify $ \r -> r { freeLocs }

-- interpreter --

interpretProgram :: Program -> IO (Either String (Integer, IntState))
interpretProgram (Program program) = do
  runIM (exec decl) initState -- todo zmienić to (powinno evalować "main")


addTopDef :: TopDef -> IM Env
-- todo
  

addTopDefs :: [TopDef] -> IM Env
-- todo

-- Expr --

evalExpr :: Expr -> IM Val
-- todo




