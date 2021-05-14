module Interpreter where


import Data.Map.Lazy as LazyMap 
import Chococino.Abs 
import Control.Monad.State
import Control.Monad.Except

-- typy --

data Val = VInt Integer | VBool Bool | VString String | VFunc Env [Arg] Block | VNull 
  deriving (Eq, Ord)

type Loc = Int
type Env = LazyMap.Map Ident Loc
type Store = LazyMap.Map Loc Val

data IntState = IntState {
  store :: Store,
  env :: Env}

initEnv :: Env
initEnv = LazyMap.empty

initStore :: Store
initStore = LazyMap.empty

initState = IntState initStore initEnv

type IM a = StateT IntState (ExceptT String IO) a
runIM :: IM a -> IntState -> IO (Either String (a, IntState))
runIM m st = runExceptT (runStateT m st)

-- interpreter --

interpret :: Program -> IO (Either String (Integer, IntState))
interpret (Program decl) = do
  runIM (exec decl) initState

exec :: [TopDef] -> IM Integer
exec decl = return 1



