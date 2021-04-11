-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParChococino
  ( happyError
  , myLexer
  , pProgram
  ) where

import Prelude

import qualified AbsChococino
import LexChococino

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
  'boolean' { PT _ (TS _ 22) }
  'else' { PT _ (TS _ 23) }
  'false' { PT _ (TS _ 24) }
  'if' { PT _ (TS _ 25) }
  'int' { PT _ (TS _ 26) }
  'return' { PT _ (TS _ 27) }
  'string' { PT _ (TS _ 28) }
  'true' { PT _ (TS _ 29) }
  'void' { PT _ (TS _ 30) }
  'while' { PT _ (TS _ 31) }
  '{' { PT _ (TS _ 32) }
  '||' { PT _ (TS _ 33) }
  '}' { PT _ (TS _ 34) }
  L_Ident  { PT _ (TV _) }
  L_integ  { PT _ (TI _) }
  L_quoted { PT _ (TL _) }

%%

Ident :: { (AbsChococino.BNFC'Position, AbsChococino.Ident) }
Ident  : L_Ident { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Ident (tokenText $1)) }

Integer :: { (AbsChococino.BNFC'Position, Integer) }
Integer  : L_integ  { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), (read (tokenText $1)) :: Integer) }

String  :: { (AbsChococino.BNFC'Position, String) }
String   : L_quoted { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), ((\(PT _ (TL s)) -> s) $1)) }

Program :: { (AbsChococino.BNFC'Position, AbsChococino.Program) }
Program : ListTopDef { (fst $1, AbsChococino.Program (fst $1) (snd $1)) }

TopDef :: { (AbsChococino.BNFC'Position, AbsChococino.TopDef) }
TopDef : Type Ident '(' ListArg ')' Block { (fst $1, AbsChococino.FnDef (fst $1) (snd $1) (snd $2) (snd $4) (snd $6)) }

ListTopDef :: { (AbsChococino.BNFC'Position, [AbsChococino.TopDef]) }
ListTopDef : TopDef { (fst $1, (:[]) (snd $1)) }
           | TopDef ListTopDef { (fst $1, (:) (snd $1) (snd $2)) }

Arg :: { (AbsChococino.BNFC'Position, AbsChococino.Arg) }
Arg : Type Ident { (fst $1, AbsChococino.ArgNoRef (fst $1) (snd $1) (snd $2)) }
    | Type '&' Ident { (fst $1, AbsChococino.ArgRef (fst $1) (snd $1) (snd $3)) }

ListArg :: { (AbsChococino.BNFC'Position, [AbsChococino.Arg]) }
ListArg : {- empty -} { (AbsChococino.BNFC'NoPosition, []) }
        | Arg { (fst $1, (:[]) (snd $1)) }
        | Arg ',' ListArg { (fst $1, (:) (snd $1) (snd $3)) }

Block :: { (AbsChococino.BNFC'Position, AbsChococino.Block) }
Block : '{' ListStmt '}' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Block (uncurry AbsChococino.BNFC'Position (tokenLineCol $1)) (snd $2)) }

ListStmt :: { (AbsChococino.BNFC'Position, [AbsChococino.Stmt]) }
ListStmt : {- empty -} { (AbsChococino.BNFC'NoPosition, []) }
         | Stmt ListStmt { (fst $1, (:) (snd $1) (snd $2)) }

Stmt :: { (AbsChococino.BNFC'Position, AbsChococino.Stmt) }
Stmt : ';' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Empty (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
     | Block { (fst $1, AbsChococino.BStmt (fst $1) (snd $1)) }
     | Type ListItem ';' { (fst $1, AbsChococino.Decl (fst $1) (snd $1) (snd $2)) }
     | Ident '=' Expr ';' { (fst $1, AbsChococino.Ass (fst $1) (snd $1) (snd $3)) }
     | Ident '++' ';' { (fst $1, AbsChococino.Incr (fst $1) (snd $1)) }
     | Ident '--' ';' { (fst $1, AbsChococino.Decr (fst $1) (snd $1)) }
     | 'return' Expr ';' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Ret (uncurry AbsChococino.BNFC'Position (tokenLineCol $1)) (snd $2)) }
     | 'return' ';' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.VRet (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
     | 'if' '(' Expr ')' Stmt { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Cond (uncurry AbsChococino.BNFC'Position (tokenLineCol $1)) (snd $3) (snd $5)) }
     | 'if' '(' Expr ')' Stmt 'else' Stmt { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.CondElse (uncurry AbsChococino.BNFC'Position (tokenLineCol $1)) (snd $3) (snd $5) (snd $7)) }
     | 'while' '(' Expr ')' Stmt { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.While (uncurry AbsChococino.BNFC'Position (tokenLineCol $1)) (snd $3) (snd $5)) }
     | Expr ';' { (fst $1, AbsChococino.SExp (fst $1) (snd $1)) }

Item :: { (AbsChococino.BNFC'Position, AbsChococino.Item) }
Item : Ident { (fst $1, AbsChococino.NoInit (fst $1) (snd $1)) }
     | Ident '=' Expr { (fst $1, AbsChococino.Init (fst $1) (snd $1) (snd $3)) }

ListItem :: { (AbsChococino.BNFC'Position, [AbsChococino.Item]) }
ListItem : Item { (fst $1, (:[]) (snd $1)) }
         | Item ',' ListItem { (fst $1, (:) (snd $1) (snd $3)) }

Type :: { (AbsChococino.BNFC'Position, AbsChococino.Type) }
Type : 'int' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Int (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
     | 'string' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Str (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
     | 'boolean' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Bool (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
     | 'void' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Void (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }

ListType :: { (AbsChococino.BNFC'Position, [AbsChococino.Type]) }
ListType : {- empty -} { (AbsChococino.BNFC'NoPosition, []) }
         | Type { (fst $1, (:[]) (snd $1)) }
         | Type ',' ListType { (fst $1, (:) (snd $1) (snd $3)) }

Expr6 :: { (AbsChococino.BNFC'Position, AbsChococino.Expr) }
Expr6 : Ident { (fst $1, AbsChococino.EVar (fst $1) (snd $1)) }
      | Integer { (fst $1, AbsChococino.ELitInt (fst $1) (snd $1)) }
      | 'true' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.ELitTrue (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
      | 'false' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.ELitFalse (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
      | Ident '(' ListExpr ')' { (fst $1, AbsChococino.EApp (fst $1) (snd $1) (snd $3)) }
      | String { (fst $1, AbsChococino.EString (fst $1) (snd $1)) }
      | '(' Expr ')' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), (snd $2)) }

Expr5 :: { (AbsChococino.BNFC'Position, AbsChococino.Expr) }
Expr5 : '-' Expr6 { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Neg (uncurry AbsChococino.BNFC'Position (tokenLineCol $1)) (snd $2)) }
      | '!' Expr6 { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Not (uncurry AbsChococino.BNFC'Position (tokenLineCol $1)) (snd $2)) }
      | Expr6 { (fst $1, (snd $1)) }

Expr4 :: { (AbsChococino.BNFC'Position, AbsChococino.Expr) }
Expr4 : Expr4 MulOp Expr5 { (fst $1, AbsChococino.EMul (fst $1) (snd $1) (snd $2) (snd $3)) }
      | Expr5 { (fst $1, (snd $1)) }

Expr3 :: { (AbsChococino.BNFC'Position, AbsChococino.Expr) }
Expr3 : Expr3 AddOp Expr4 { (fst $1, AbsChococino.EAdd (fst $1) (snd $1) (snd $2) (snd $3)) }
      | Expr4 { (fst $1, (snd $1)) }

Expr2 :: { (AbsChococino.BNFC'Position, AbsChococino.Expr) }
Expr2 : Expr2 RelOp Expr3 { (fst $1, AbsChococino.ERel (fst $1) (snd $1) (snd $2) (snd $3)) }
      | Expr3 { (fst $1, (snd $1)) }

Expr1 :: { (AbsChococino.BNFC'Position, AbsChococino.Expr) }
Expr1 : Expr2 '&&' Expr1 { (fst $1, AbsChococino.EAnd (fst $1) (snd $1) (snd $3)) }
      | Expr2 { (fst $1, (snd $1)) }

Expr :: { (AbsChococino.BNFC'Position, AbsChococino.Expr) }
Expr : Expr1 '||' Expr { (fst $1, AbsChococino.EOr (fst $1) (snd $1) (snd $3)) }
     | Expr1 { (fst $1, (snd $1)) }

ListExpr :: { (AbsChococino.BNFC'Position, [AbsChococino.Expr]) }
ListExpr : {- empty -} { (AbsChococino.BNFC'NoPosition, []) }
         | Expr { (fst $1, (:[]) (snd $1)) }
         | Expr ',' ListExpr { (fst $1, (:) (snd $1) (snd $3)) }

AddOp :: { (AbsChococino.BNFC'Position, AbsChococino.AddOp) }
AddOp : '+' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Plus (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
      | '-' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Minus (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }

MulOp :: { (AbsChococino.BNFC'Position, AbsChococino.MulOp) }
MulOp : '*' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Times (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
      | '/' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Div (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
      | '%' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.Mod (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }

RelOp :: { (AbsChococino.BNFC'Position, AbsChococino.RelOp) }
RelOp : '<' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.LTH (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
      | '<=' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.LE (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
      | '>' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.GTH (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
      | '>=' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.GE (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
      | '==' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.EQU (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
      | '!=' { (uncurry AbsChococino.BNFC'Position (tokenLineCol $1), AbsChococino.NE (uncurry AbsChococino.BNFC'Position (tokenLineCol $1))) }
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

pProgram :: [Token] -> Err AbsChococino.Program
pProgram = fmap snd . pProgram_internal
}

