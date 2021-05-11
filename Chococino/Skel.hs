-- Haskell module generated by the BNF converter

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module Chococino.Skel where

import Prelude (($), Either(..), String, (++), Show, show)
import qualified Chococino.Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transIdent :: Chococino.Abs.Ident -> Result
transIdent x = case x of
  Chococino.Abs.Ident string -> failure x

transProgram :: Chococino.Abs.Program -> Result
transProgram x = case x of
  Chococino.Abs.Program topdefs -> failure x

transTopDef :: Chococino.Abs.TopDef -> Result
transTopDef x = case x of
  Chococino.Abs.FnDef type_ ident args block -> failure x

transArg :: Chococino.Abs.Arg -> Result
transArg x = case x of
  Chococino.Abs.ArgNoRef type_ ident -> failure x
  Chococino.Abs.ArgRef type_ ident -> failure x

transBlock :: Chococino.Abs.Block -> Result
transBlock x = case x of
  Chococino.Abs.Block stmts -> failure x

transStmt :: Chococino.Abs.Stmt -> Result
transStmt x = case x of
  Chococino.Abs.Empty -> failure x
  Chococino.Abs.BStmt block -> failure x
  Chococino.Abs.Decl type_ items -> failure x
  Chococino.Abs.ArrDecl type_ ident expr -> failure x
  Chococino.Abs.Ass ident expr -> failure x
  Chococino.Abs.ArrAss arrexpr expr -> failure x
  Chococino.Abs.Incr ident -> failure x
  Chococino.Abs.Decr ident -> failure x
  Chococino.Abs.Ret expr -> failure x
  Chococino.Abs.VRet -> failure x
  Chococino.Abs.Cond expr stmt -> failure x
  Chococino.Abs.CondElse expr stmt1 stmt2 -> failure x
  Chococino.Abs.While expr stmt -> failure x
  Chococino.Abs.SExp expr -> failure x
  Chococino.Abs.Break -> failure x
  Chococino.Abs.Continue -> failure x
  Chococino.Abs.FnNestDef topdef -> failure x

transItem :: Chococino.Abs.Item -> Result
transItem x = case x of
  Chococino.Abs.NoInit ident -> failure x
  Chococino.Abs.Init ident expr -> failure x

transType :: Chococino.Abs.Type -> Result
transType x = case x of
  Chococino.Abs.Int -> failure x
  Chococino.Abs.Str -> failure x
  Chococino.Abs.Bool -> failure x
  Chococino.Abs.Void -> failure x
  Chococino.Abs.Function type_ types -> failure x
  Chococino.Abs.Fun type_ types -> failure x

transArrExpr :: Chococino.Abs.ArrExpr -> Result
transArrExpr x = case x of
  Chococino.Abs.FirstDim ident expr -> failure x
  Chococino.Abs.MultDim arrexpr expr -> failure x

transExpr :: Chococino.Abs.Expr -> Result
transExpr x = case x of
  Chococino.Abs.EVar ident -> failure x
  Chococino.Abs.ELitInt integer -> failure x
  Chococino.Abs.ELitTrue -> failure x
  Chococino.Abs.ELitFalse -> failure x
  Chococino.Abs.EApp ident exprs -> failure x
  Chococino.Abs.EString string -> failure x
  Chococino.Abs.EArr arrexpr -> failure x
  Chococino.Abs.Neg expr -> failure x
  Chococino.Abs.Not expr -> failure x
  Chococino.Abs.EMul expr1 mulop expr2 -> failure x
  Chococino.Abs.EAdd expr1 addop expr2 -> failure x
  Chococino.Abs.ERel expr1 relop expr2 -> failure x
  Chococino.Abs.EAnd expr1 expr2 -> failure x
  Chococino.Abs.EOr expr1 expr2 -> failure x
  Chococino.Abs.ELambda lambda -> failure x

transLambda :: Chococino.Abs.Lambda -> Result
transLambda x = case x of
  Chococino.Abs.LambdaDef type_ args block -> failure x

transAddOp :: Chococino.Abs.AddOp -> Result
transAddOp x = case x of
  Chococino.Abs.Plus -> failure x
  Chococino.Abs.Minus -> failure x

transMulOp :: Chococino.Abs.MulOp -> Result
transMulOp x = case x of
  Chococino.Abs.Times -> failure x
  Chococino.Abs.Div -> failure x
  Chococino.Abs.Mod -> failure x

transRelOp :: Chococino.Abs.RelOp -> Result
transRelOp x = case x of
  Chococino.Abs.LTH -> failure x
  Chococino.Abs.LE -> failure x
  Chococino.Abs.GTH -> failure x
  Chococino.Abs.GE -> failure x
  Chococino.Abs.EQU -> failure x
  Chococino.Abs.NE -> failure x
