-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module Chococino.Par
  ( happyError
  , myLexer
  , pProgram
  ) where

import Prelude

import qualified Chococino.Abs
import Chococino.Lex

}

%name pProgram_internal Program
-- no lexer declaration
%monad { Err } { (>>=) } { return }
%tokentype {Token}
%token
  '!' { PT _ (TS _ 1) }
  '!=' { PT _ (TS _ 2) }
  '%' { PT _ (TS _ 3) }
  '&' { PT _ (TS _ 4) }
  '&&' { PT _ (TS _ 5) }
  '(' { PT _ (TS _ 6) }
  ')' { PT _ (TS _ 7) }
  '*' { PT _ (TS _ 8) }
  '+' { PT _ (TS _ 9) }
  '++' { PT _ (TS _ 10) }
  ',' { PT _ (TS _ 11) }
  '-' { PT _ (TS _ 12) }
  '--' { PT _ (TS _ 13) }
  '/' { PT _ (TS _ 14) }
  ';' { PT _ (TS _ 15) }
  '<' { PT _ (TS _ 16) }
  '<=' { PT _ (TS _ 17) }
  '=' { PT _ (TS _ 18) }
  '==' { PT _ (TS _ 19) }
  '>' { PT _ (TS _ 20) }
  '>=' { PT _ (TS _ 21) }
  '[' { PT _ (TS _ 22) }
  ']' { PT _ (TS _ 23) }
  'boolean' { PT _ (TS _ 24) }
  'break' { PT _ (TS _ 25) }
  'continue' { PT _ (TS _ 26) }
  'else' { PT _ (TS _ 27) }
  'false' { PT _ (TS _ 28) }
  'function' { PT _ (TS _ 29) }
  'if' { PT _ (TS _ 30) }
  'int' { PT _ (TS _ 31) }
  'lambda' { PT _ (TS _ 32) }
  'return' { PT _ (TS _ 33) }
  'string' { PT _ (TS _ 34) }
  'true' { PT _ (TS _ 35) }
  'void' { PT _ (TS _ 36) }
  'while' { PT _ (TS _ 37) }
  '{' { PT _ (TS _ 38) }
  '||' { PT _ (TS _ 39) }
  '}' { PT _ (TS _ 40) }
  L_Ident  { PT _ (TV _) }
  L_integ  { PT _ (TI _) }
  L_quoted { PT _ (TL _) }

%%

Ident :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Ident) }
Ident  : L_Ident { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Ident (tokenText $1)) }

Integer :: { (Chococino.Abs.BNFC'Position, Integer) }
Integer  : L_integ  { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), (read (tokenText $1)) :: Integer) }

String  :: { (Chococino.Abs.BNFC'Position, String) }
String   : L_quoted { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), ((\(PT _ (TL s)) -> s) $1)) }

Program :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Program) }
Program : ListTopDef { (fst $1, Chococino.Abs.Program (fst $1) (snd $1)) }

TopDef :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.TopDef) }
TopDef : Type Ident '(' ListArg ')' Block { (fst $1, Chococino.Abs.FnDef (fst $1) (snd $1) (snd $2) (snd $4) (snd $6)) }

ListTopDef :: { (Chococino.Abs.BNFC'Position, [Chococino.Abs.TopDef]) }
ListTopDef : TopDef { (fst $1, (:[]) (snd $1)) }
           | TopDef ListTopDef { (fst $1, (:) (snd $1) (snd $2)) }

Arg :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Arg) }
Arg : Type Ident { (fst $1, Chococino.Abs.ArgNoRef (fst $1) (snd $1) (snd $2)) }
    | Type '&' Ident { (fst $1, Chococino.Abs.ArgRef (fst $1) (snd $1) (snd $3)) }

ListArg :: { (Chococino.Abs.BNFC'Position, [Chococino.Abs.Arg]) }
ListArg : {- empty -} { (Chococino.Abs.BNFC'NoPosition, []) }
        | Arg { (fst $1, (:[]) (snd $1)) }
        | Arg ',' ListArg { (fst $1, (:) (snd $1) (snd $3)) }

Block :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Block) }
Block : '{' ListStmt '}' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Block (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1)) (snd $2)) }

ListStmt :: { (Chococino.Abs.BNFC'Position, [Chococino.Abs.Stmt]) }
ListStmt : {- empty -} { (Chococino.Abs.BNFC'NoPosition, []) }
         | Stmt ListStmt { (fst $1, (:) (snd $1) (snd $2)) }

Stmt :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Stmt) }
Stmt : ';' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Empty (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
     | Block { (fst $1, Chococino.Abs.BStmt (fst $1) (snd $1)) }
     | Type ListItem ';' { (fst $1, Chococino.Abs.Decl (fst $1) (snd $1) (snd $2)) }
     | Type ArrExpr { (fst $1, Chococino.Abs.ArrDecl (fst $1) (snd $1) (snd $2)) }
     | Ident '=' Expr ';' { (fst $1, Chococino.Abs.Ass (fst $1) (snd $1) (snd $3)) }
     | ArrExpr '=' Expr ';' { (fst $1, Chococino.Abs.ArrAss (fst $1) (snd $1) (snd $3)) }
     | Ident '++' ';' { (fst $1, Chococino.Abs.Incr (fst $1) (snd $1)) }
     | Ident '--' ';' { (fst $1, Chococino.Abs.Decr (fst $1) (snd $1)) }
     | 'return' Expr ';' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Ret (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1)) (snd $2)) }
     | 'return' ';' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.VRet (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
     | 'if' '(' Expr ')' Block { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Cond (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1)) (snd $3) (snd $5)) }
     | 'if' '(' Expr ')' Block 'else' Block { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.CondElse (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1)) (snd $3) (snd $5) (snd $7)) }
     | 'while' '(' Expr ')' Stmt { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.While (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1)) (snd $3) (snd $5)) }
     | Expr ';' { (fst $1, Chococino.Abs.SExp (fst $1) (snd $1)) }
     | 'break' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Break (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
     | 'continue' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Continue (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
     | TopDef ';' { (fst $1, Chococino.Abs.FnNestDef (fst $1) (snd $1)) }

Item :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Item) }
Item : Ident { (fst $1, Chococino.Abs.NoInit (fst $1) (snd $1)) }
     | Ident '=' Expr { (fst $1, Chococino.Abs.Init (fst $1) (snd $1) (snd $3)) }

ListItem :: { (Chococino.Abs.BNFC'Position, [Chococino.Abs.Item]) }
ListItem : Item { (fst $1, (:[]) (snd $1)) }
         | Item ',' ListItem { (fst $1, (:) (snd $1) (snd $3)) }

Type :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Type) }
Type : 'int' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Int (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
     | 'string' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Str (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
     | 'boolean' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Bool (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
     | 'void' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Void (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
     | 'function' '<' Type '(' ListType ')' '>' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Function (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1)) (snd $3) (snd $5)) }

ListType :: { (Chococino.Abs.BNFC'Position, [Chococino.Abs.Type]) }
ListType : {- empty -} { (Chococino.Abs.BNFC'NoPosition, []) }
         | Type { (fst $1, (:[]) (snd $1)) }
         | Type ',' ListType { (fst $1, (:) (snd $1) (snd $3)) }

ArrExpr :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.ArrExpr) }
ArrExpr : Ident '[' Expr ']' { (fst $1, Chococino.Abs.FirstDim (fst $1) (snd $1) (snd $3)) }
        | ArrExpr '[' Expr ']' { (fst $1, Chococino.Abs.MultDim (fst $1) (snd $1) (snd $3)) }

Expr6 :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Expr) }
Expr6 : Ident { (fst $1, Chococino.Abs.EVar (fst $1) (snd $1)) }
      | Integer { (fst $1, Chococino.Abs.ELitInt (fst $1) (snd $1)) }
      | 'true' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.ELitTrue (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
      | 'false' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.ELitFalse (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
      | Ident '(' ListExpr ')' { (fst $1, Chococino.Abs.EApp (fst $1) (snd $1) (snd $3)) }
      | String { (fst $1, Chococino.Abs.EString (fst $1) (snd $1)) }
      | ArrExpr { (fst $1, Chococino.Abs.EArr (fst $1) (snd $1)) }
      | '(' Expr ')' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), (snd $2)) }

Expr5 :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Expr) }
Expr5 : '-' Expr6 { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Neg (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1)) (snd $2)) }
      | '!' Expr6 { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Not (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1)) (snd $2)) }
      | Expr6 { (fst $1, (snd $1)) }

Expr4 :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Expr) }
Expr4 : Expr4 MulOp Expr5 { (fst $1, Chococino.Abs.EMul (fst $1) (snd $1) (snd $2) (snd $3)) }
      | Expr5 { (fst $1, (snd $1)) }

Expr3 :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Expr) }
Expr3 : Expr3 AddOp Expr4 { (fst $1, Chococino.Abs.EAdd (fst $1) (snd $1) (snd $2) (snd $3)) }
      | Expr4 { (fst $1, (snd $1)) }

Expr2 :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Expr) }
Expr2 : Expr2 RelOp Expr3 { (fst $1, Chococino.Abs.ERel (fst $1) (snd $1) (snd $2) (snd $3)) }
      | Expr3 { (fst $1, (snd $1)) }

Expr1 :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Expr) }
Expr1 : Expr2 '&&' Expr1 { (fst $1, Chococino.Abs.EAnd (fst $1) (snd $1) (snd $3)) }
      | Expr2 { (fst $1, (snd $1)) }

Expr :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Expr) }
Expr : Expr1 '||' Expr { (fst $1, Chococino.Abs.EOr (fst $1) (snd $1) (snd $3)) }
     | Lambda { (fst $1, Chococino.Abs.ELambda (fst $1) (snd $1)) }
     | Expr1 { (fst $1, (snd $1)) }

ListExpr :: { (Chococino.Abs.BNFC'Position, [Chococino.Abs.Expr]) }
ListExpr : {- empty -} { (Chococino.Abs.BNFC'NoPosition, []) }
         | Expr { (fst $1, (:[]) (snd $1)) }
         | Expr ',' ListExpr { (fst $1, (:) (snd $1) (snd $3)) }

Lambda :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.Lambda) }
Lambda : 'lambda' '<' Type '(' ListArg ')' '>' Block { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.LambdaDef (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1)) (snd $3) (snd $5) (snd $8)) }

AddOp :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.AddOp) }
AddOp : '+' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Plus (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
      | '-' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Minus (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }

MulOp :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.MulOp) }
MulOp : '*' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Times (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
      | '/' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Div (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
      | '%' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.Mod (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }

RelOp :: { (Chococino.Abs.BNFC'Position, Chococino.Abs.RelOp) }
RelOp : '<' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.LTH (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
      | '<=' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.LE (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
      | '>' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.GTH (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
      | '>=' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.GE (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
      | '==' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.EQU (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
      | '!=' { (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1), Chococino.Abs.NE (uncurry Chococino.Abs.BNFC'Position (tokenLineCol $1))) }
{

type Err = Either String

happyError :: [Token] -> Err a
happyError ts = Left $
  "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ (prToken t) ++ "'"

myLexer :: String -> [Token]
myLexer = tokens

-- Entrypoints

pProgram :: [Token] -> Err Chococino.Abs.Program
pProgram = fmap snd . pProgram_internal
}

