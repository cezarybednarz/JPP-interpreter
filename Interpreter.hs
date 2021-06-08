{-# LANGUAGE MultiParamTypeClasses, NamedFieldPuns #-}

module Interpreter where


import Data.Map as Map
import Choc.Abs
import Control.Monad.State
import Control.Monad.Error
import Control.Monad.Reader
import Control.Monad.Except
import Data.Maybe
-- Func and Val --

data Func = VFunc Type Ident [Arg] Block

data Val
    = VInt Integer
    | VBool Bool
    | VString String
    | VVoid
  deriving (Eq, Ord)

instance Show Val where
  show (VInt val) = show val
  show (VBool b) = show b
  show (VString str) = show str
  show VVoid = show "Error: Cannot show void value"

-- RetInfo --

data RetInfo = Return Val | ReturnNothing | RBreak | RContinue

-- Memory and Enviroment --

type Loc = Int
type ValEnv = Map.Map Ident Loc
type FuncEnv = Map.Map Ident Func
type Env = (ValEnv, FuncEnv)
type Store = Map.Map Loc Val

-- Init Enviroment --

initStore :: Store
initStore = Map.empty

initEnv :: Env
initEnv = (Map.empty, Map.empty)

-- IM --

type IM a = ReaderT Env (ExceptT String (StateT Store IO)) a
runIM :: IM a -> Store -> Env -> IO (Either String a, Store)
runIM m st en = runStateT (runExceptT (runReaderT m en)) st

-- Memory Management -- 

-- set values --

alloc :: IM Loc
alloc = do
  gets Map.size

insertValue :: Loc -> Val -> IM ()
insertValue loc val = do
  store' <- gets (Map.insert loc val)
  put store'

declareVar :: Ident -> Val -> IM ValEnv
declareVar id val = do
  loc <- alloc
  valEnv' <- asks (Map.insert id loc . fst)
  insertValue loc val
  return valEnv'

declareFunc :: Ident -> Func -> IM FuncEnv
declareFunc id func = do
  asks (Map.insert id func . snd)

-- get values -- 

getFunc :: Ident -> IM Func
getFunc id = do
  func <- asks (Map.lookup id . snd)
  case func of
    Just l -> return l
    Nothing -> throwError ("Function " ++ show id ++ " not defined")

getIdentLoc :: Ident -> IM Loc
getIdentLoc id = do
  loc <- asks (Map.lookup id . fst)
  case loc of
    Just l -> return l
    Nothing -> throwError ("Variable " ++ show id ++ " not declared")

getLocVal :: Loc -> IM Val
getLocVal loc = do
  val <- gets $ Map.lookup loc
  case val of
    Just v -> return v
    Nothing -> throwError $ "Location " ++ show loc ++ " has no value assigned"

getIdentVal :: Ident -> IM Val
getIdentVal id = do
  loc <- getIdentLoc id
  getLocVal loc

-- run interpreter --

interpretProgram :: Program -> IO (Either String Val, Store) -- todo zmienic IntState
interpretProgram program =
  runIM (runMain program) initStore initEnv


runMain :: Program -> IM Val
runMain (Program tds) = do
  addTopDefs tds
  evalExpr $ EApp (Ident "main") []

-- TopDef --

addTopDef :: TopDef -> IM Env
addTopDef (FnDef t id args b) = do
  (valEnv, _) <- ask
  funcEnv <- declareFunc id (VFunc t id args b)
  return (valEnv, funcEnv)

addTopDefs :: [TopDef] -> IM Env
addTopDefs [] = ask
addTopDefs (def:ds) = do
  newEnv <- addTopDef def
  local (const newEnv) $ addTopDefs ds

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

declFunctionArgs :: [Expr] -> [Arg] -> IM Env
declFunctionArgs [] [] = ask
declFunctionArgs [] (a:xa) = throwError "Number of arguments don't match"
declFunctionArgs (e:xe) [] = throwError "Number of arguments don't match"
declFunctionArgs (e:xe) (a:xa) = do
  v <- evalExpr e
  case a of
    (ArgNoRef t id) -> do
      (_, funcEnv) <- ask
      valEnv' <- declareVar id v
      local (const (valEnv', funcEnv)) $ declFunctionArgs xe xa
    (ArgRef t id) -> do 
      l <- getIdentLoc id
      insertValue l v
      env <- ask
      local(const env) $ declFunctionArgs xe xa

-- Evaluate Expr --

evalExpr :: Expr -> IM Val
evalExpr (EVar id) = getIdentVal id
evalExpr (ELitInt i) = return (VInt i)
evalExpr ELitTrue = return (VBool True)
evalExpr ELitFalse = return (VBool False)

evalExpr (EApp id exprs) = do
  (VFunc t id args (Block b)) <- getFunc id
  env <- declFunctionArgs exprs args
  retVal <- local (const env) $ execBlock b
  case retVal of
    Return val -> return val
    _ -> throwError $ unwords["Function ",show id,"didn't return anything"]

evalExpr (EString s) = return (VString s)
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

declItem :: Type -> Item -> IM Env
declItem t (NoInit id) = do
  (_, funcEnv) <- ask
  n <- case t of
    Int -> return (VInt 0)
    Bool -> return (VBool False)
    Str -> return (VString "")
  valEnv <- declareVar id n
  return (valEnv, funcEnv)
declItem t (Init id e) = do
  (_, funcEnv) <- ask
  n <- evalExpr e
  valEnv <- declareVar id n
  return (valEnv, funcEnv)

execDecl :: Type -> [Item] -> IM ()
execDecl t = Prelude.foldr ((>>) . declItem t) (return ())

-- Execute Stmt -- 

execStmt :: Stmt -> IM RetInfo
execStmt Empty = return ReturnNothing
execStmt (BStmt (Block b)) = execBlock b
execStmt (Decl t items) = execDecl t items >> return ReturnNothing
execStmt (Ass id expr) = do
  n <- evalExpr expr
  l <- getIdentLoc id
  insertValue l n
  return ReturnNothing

execStmt (Incr id) = do
  VInt v <- getIdentVal id
  l <- getIdentLoc id
  insertValue l (VInt $ v + 1)
  return ReturnNothing

execStmt (Decr id) = do
  VInt v <- getIdentVal id
  l <- getIdentLoc id
  insertValue l (VInt $ v - 1)
  return ReturnNothing

execStmt (Ret expr) = Return <$> evalExpr expr
execStmt VRet = return $ Return VVoid
execStmt (Cond expr (Block b)) = do
  VBool c <- evalExpr expr
  if c then do
    env <- ask
    local (const env) $ execBlock b
  else
    return ReturnNothing

execStmt (CondElse expr (Block b1) (Block b2)) = do
  VBool c <- evalExpr expr
  env <- ask
  if c then do
    local (const env) $ execBlock b1
  else do
    local (const env) $ execBlock b2

execStmt (While expr (Block b)) = do
  VBool c <- evalExpr expr
  env <- ask
  if c then do
    retVal <- local (const env) $ execBlock b
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
  liftIO $ print val
  return ReturnNothing