{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module Chococino.Par
  ( happyError
  , myLexer
  , pProgram
  ) where

import Prelude

import qualified Chococino.Abs
import Chococino.Lex
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap4 = HappyWrap4 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Ident))
happyIn4 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Ident)) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap4 x)
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> HappyWrap4
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
newtype HappyWrap5 = HappyWrap5 ((Chococino.Abs.BNFC'Position, Integer))
happyIn5 :: ((Chococino.Abs.BNFC'Position, Integer)) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap5 x)
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> HappyWrap5
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
newtype HappyWrap6 = HappyWrap6 ((Chococino.Abs.BNFC'Position, String))
happyIn6 :: ((Chococino.Abs.BNFC'Position, String)) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap6 x)
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> HappyWrap6
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
newtype HappyWrap7 = HappyWrap7 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Program))
happyIn7 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Program)) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap7 x)
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> HappyWrap7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
newtype HappyWrap8 = HappyWrap8 ((Chococino.Abs.BNFC'Position, Chococino.Abs.TopDef))
happyIn8 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.TopDef)) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap8 x)
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> HappyWrap8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
newtype HappyWrap9 = HappyWrap9 ((Chococino.Abs.BNFC'Position, [Chococino.Abs.TopDef]))
happyIn9 :: ((Chococino.Abs.BNFC'Position, [Chococino.Abs.TopDef])) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap9 x)
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> HappyWrap9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
newtype HappyWrap10 = HappyWrap10 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Arg))
happyIn10 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Arg)) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap10 x)
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> HappyWrap10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
newtype HappyWrap11 = HappyWrap11 ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Arg]))
happyIn11 :: ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Arg])) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap11 x)
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> HappyWrap11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
newtype HappyWrap12 = HappyWrap12 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Block))
happyIn12 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Block)) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap12 x)
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> HappyWrap12
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
newtype HappyWrap13 = HappyWrap13 ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Stmt]))
happyIn13 :: ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Stmt])) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap13 x)
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> HappyWrap13
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
newtype HappyWrap14 = HappyWrap14 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Stmt))
happyIn14 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Stmt)) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap14 x)
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> HappyWrap14
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
newtype HappyWrap15 = HappyWrap15 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Item))
happyIn15 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Item)) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap15 x)
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> HappyWrap15
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
newtype HappyWrap16 = HappyWrap16 ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Item]))
happyIn16 :: ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Item])) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap16 x)
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> HappyWrap16
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
newtype HappyWrap17 = HappyWrap17 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Type))
happyIn17 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Type)) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap17 x)
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> HappyWrap17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
newtype HappyWrap18 = HappyWrap18 ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Type]))
happyIn18 :: ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Type])) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap18 x)
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> HappyWrap18
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
newtype HappyWrap19 = HappyWrap19 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr))
happyIn19 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr)) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap19 x)
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> HappyWrap19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
newtype HappyWrap20 = HappyWrap20 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr))
happyIn20 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr)) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap20 x)
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> HappyWrap20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
newtype HappyWrap21 = HappyWrap21 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr))
happyIn21 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr)) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap21 x)
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> HappyWrap21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
newtype HappyWrap22 = HappyWrap22 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr))
happyIn22 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr)) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap22 x)
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> HappyWrap22
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
newtype HappyWrap23 = HappyWrap23 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr))
happyIn23 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr)) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap23 x)
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> HappyWrap23
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
newtype HappyWrap24 = HappyWrap24 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr))
happyIn24 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr)) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap24 x)
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> HappyWrap24
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
newtype HappyWrap25 = HappyWrap25 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr))
happyIn25 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Expr)) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap25 x)
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> HappyWrap25
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
newtype HappyWrap26 = HappyWrap26 ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Expr]))
happyIn26 :: ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Expr])) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap26 x)
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> HappyWrap26
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
newtype HappyWrap27 = HappyWrap27 ((Chococino.Abs.BNFC'Position, Chococino.Abs.TupL))
happyIn27 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.TupL)) -> (HappyAbsSyn )
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap27 x)
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn ) -> HappyWrap27
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
newtype HappyWrap28 = HappyWrap28 ((Chococino.Abs.BNFC'Position, Chococino.Abs.TupL))
happyIn28 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.TupL)) -> (HappyAbsSyn )
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap28 x)
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn ) -> HappyWrap28
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
newtype HappyWrap29 = HappyWrap29 ((Chococino.Abs.BNFC'Position, [Chococino.Abs.TupL]))
happyIn29 :: ((Chococino.Abs.BNFC'Position, [Chococino.Abs.TupL])) -> (HappyAbsSyn )
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap29 x)
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn ) -> HappyWrap29
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
newtype HappyWrap30 = HappyWrap30 ((Chococino.Abs.BNFC'Position, Chococino.Abs.TupR))
happyIn30 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.TupR)) -> (HappyAbsSyn )
happyIn30 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap30 x)
{-# INLINE happyIn30 #-}
happyOut30 :: (HappyAbsSyn ) -> HappyWrap30
happyOut30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut30 #-}
newtype HappyWrap31 = HappyWrap31 ((Chococino.Abs.BNFC'Position, Chococino.Abs.TupR))
happyIn31 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.TupR)) -> (HappyAbsSyn )
happyIn31 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap31 x)
{-# INLINE happyIn31 #-}
happyOut31 :: (HappyAbsSyn ) -> HappyWrap31
happyOut31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut31 #-}
newtype HappyWrap32 = HappyWrap32 ((Chococino.Abs.BNFC'Position, [Chococino.Abs.TupR]))
happyIn32 :: ((Chococino.Abs.BNFC'Position, [Chococino.Abs.TupR])) -> (HappyAbsSyn )
happyIn32 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap32 x)
{-# INLINE happyIn32 #-}
happyOut32 :: (HappyAbsSyn ) -> HappyWrap32
happyOut32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut32 #-}
newtype HappyWrap33 = HappyWrap33 ((Chococino.Abs.BNFC'Position, Chococino.Abs.LArg))
happyIn33 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.LArg)) -> (HappyAbsSyn )
happyIn33 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap33 x)
{-# INLINE happyIn33 #-}
happyOut33 :: (HappyAbsSyn ) -> HappyWrap33
happyOut33 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut33 #-}
newtype HappyWrap34 = HappyWrap34 ((Chococino.Abs.BNFC'Position, Chococino.Abs.LArg))
happyIn34 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.LArg)) -> (HappyAbsSyn )
happyIn34 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap34 x)
{-# INLINE happyIn34 #-}
happyOut34 :: (HappyAbsSyn ) -> HappyWrap34
happyOut34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut34 #-}
newtype HappyWrap35 = HappyWrap35 ((Chococino.Abs.BNFC'Position, [Chococino.Abs.LArg]))
happyIn35 :: ((Chococino.Abs.BNFC'Position, [Chococino.Abs.LArg])) -> (HappyAbsSyn )
happyIn35 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap35 x)
{-# INLINE happyIn35 #-}
happyOut35 :: (HappyAbsSyn ) -> HappyWrap35
happyOut35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut35 #-}
newtype HappyWrap36 = HappyWrap36 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Lambda))
happyIn36 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Lambda)) -> (HappyAbsSyn )
happyIn36 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap36 x)
{-# INLINE happyIn36 #-}
happyOut36 :: (HappyAbsSyn ) -> HappyWrap36
happyOut36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut36 #-}
newtype HappyWrap37 = HappyWrap37 ((Chococino.Abs.BNFC'Position, Chococino.Abs.Lambda))
happyIn37 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.Lambda)) -> (HappyAbsSyn )
happyIn37 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap37 x)
{-# INLINE happyIn37 #-}
happyOut37 :: (HappyAbsSyn ) -> HappyWrap37
happyOut37 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut37 #-}
newtype HappyWrap38 = HappyWrap38 ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Lambda]))
happyIn38 :: ((Chococino.Abs.BNFC'Position, [Chococino.Abs.Lambda])) -> (HappyAbsSyn )
happyIn38 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap38 x)
{-# INLINE happyIn38 #-}
happyOut38 :: (HappyAbsSyn ) -> HappyWrap38
happyOut38 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut38 #-}
newtype HappyWrap39 = HappyWrap39 ((Chococino.Abs.BNFC'Position, Chococino.Abs.AddOp))
happyIn39 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.AddOp)) -> (HappyAbsSyn )
happyIn39 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap39 x)
{-# INLINE happyIn39 #-}
happyOut39 :: (HappyAbsSyn ) -> HappyWrap39
happyOut39 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut39 #-}
newtype HappyWrap40 = HappyWrap40 ((Chococino.Abs.BNFC'Position, Chococino.Abs.MulOp))
happyIn40 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.MulOp)) -> (HappyAbsSyn )
happyIn40 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap40 x)
{-# INLINE happyIn40 #-}
happyOut40 :: (HappyAbsSyn ) -> HappyWrap40
happyOut40 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut40 #-}
newtype HappyWrap41 = HappyWrap41 ((Chococino.Abs.BNFC'Position, Chococino.Abs.RelOp))
happyIn41 :: ((Chococino.Abs.BNFC'Position, Chococino.Abs.RelOp)) -> (HappyAbsSyn )
happyIn41 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap41 x)
{-# INLINE happyIn41 #-}
happyOut41 :: (HappyAbsSyn ) -> HappyWrap41
happyOut41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut41 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x42\x35\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x35\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x50\x0d\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x35\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x54\x03\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x80\x50\x0d\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x50\x0d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x10\x01\xee\xff\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x44\x02\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x42\x10\x01\xee\xff\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x41\x00\x80\x20\x70\x00\x00\x00\x00\x00\x42\x10\x00\x62\x3d\x1c\x00\x00\x00\x00\x80\x10\x04\x00\x08\x02\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x41\x04\x80\x20\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\x01\x00\x82\xc0\x01\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x10\x04\x80\x58\x0f\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x41\x00\x80\x20\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x10\x04\x80\x58\x0f\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x41\x00\x80\x20\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x10\x04\x00\x08\x02\x07\x00\x00\x00\x00\x20\x04\x01\x00\x82\xc0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x10\x00\x20\x08\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\x01\x00\x82\xc0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x10\x04\x00\x08\x02\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x22\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x41\x00\x80\x20\x70\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\x01\x00\x82\xc0\x01\x00\x00\x00\x00\x08\x41\x00\x80\x20\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x42\x10\x00\x20\x08\x1c\x00\x00\x00\x00\x80\x10\x04\x00\x08\x02\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x08\xd5\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\x01\x00\x82\xc0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x10\x00\x20\x08\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\x01\x20\xd6\xc3\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x10\x44\x80\xfb\x3f\x07\x00\x00\x00\x00\x20\x04\x11\xe0\xfe\xcf\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x08\xd5\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x41\x00\x80\x20\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x20\x04\x01\x00\x82\xc0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\x11\xe0\xfe\xcf\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram_internal","Ident","Integer","String","Program","TopDef","ListTopDef","Arg","ListArg","Block","ListStmt","Stmt","Item","ListItem","Type","ListType","Expr6","Expr5","Expr4","Expr3","Expr2","Expr1","Expr","ListExpr","TupL","TupL1","ListTupL","TupR","TupR1","ListTupR","LArg","LArg1","ListLArg","Lambda","Lambda1","ListLambda","AddOp","MulOp","RelOp","'!'","'!='","'%'","'&'","'&&'","'('","')'","'*'","'+'","'++'","','","'-'","'--'","'->'","'/'","';'","'<'","'<='","'='","'=='","'>'","'>='","'['","']'","'boolean'","'break'","'continue'","'else'","'false'","'function'","'if'","'int'","'return'","'string'","'true'","'tuple'","'void'","'while'","'{'","'||'","'}'","L_Ident","L_integ","L_quoted","%eof"]
        bit_start = st Prelude.* 86
        bit_end = (st Prelude.+ 1) Prelude.* 86
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..85]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x4d\x01\xe4\xff\x00\x00\x0d\x00\x4d\x01\x00\x00\x33\x00\x00\x00\x55\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x01\x83\x00\x00\x00\x4d\x01\x8d\x00\x4d\x01\x91\x00\xae\x00\x07\x00\x00\x00\x6e\x00\x94\x00\x4d\x01\xb3\x00\xb8\x00\xaf\x00\x4d\x01\x00\x00\x00\x00\x83\x01\x00\x00\x49\x02\x00\x00\x00\x00\xd1\x00\x00\x00\x9f\x00\x83\x01\xbd\x00\x00\x00\x00\x00\xc5\x01\x86\x00\xee\x01\xc2\x00\xdb\x00\xe1\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1e\x02\x93\x01\x1e\x02\x00\x00\x00\x00\x00\x00\x00\x00\xea\x00\xfb\x01\x00\x00\x07\x01\x00\x00\x00\x00\x00\x00\x00\x00\x1e\x02\x01\x00\x06\x01\xba\x01\x00\x00\x1e\x02\x2d\x00\x00\x00\x61\x02\xed\x00\x15\x01\xfa\xff\x19\x01\x30\x00\x3b\x01\x2e\x01\x00\x00\x46\x01\x60\x01\xca\x01\x2d\x00\x1e\x02\x00\x00\x1e\x02\x1e\x02\x00\x00\x1e\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1e\x02\x00\x00\x00\x00\x1e\x02\x00\x00\x00\x00\x00\x00\x34\x01\x69\x01\x5e\x01\x00\x00\x00\x00\x00\x00\x1e\x02\x82\x01\x85\x01\x1e\x02\x1e\x02\x80\x01\x8b\x01\x00\x00\x00\x00\x39\x00\xa4\x01\x00\x00\x90\x01\x1e\x02\x1e\x02\x59\x00\x85\x00\xb1\x00\xdd\x00\x09\x01\x35\x01\x5c\x00\x00\x00\xa6\x01\x13\x02\x00\x00\x00\x00\x1e\x02\x00\x00\x00\x00\x0d\x01\x00\x00\x00\x00\x1e\x02\xb5\x01\xf1\x01\x00\x00\xc0\x01\x83\x01\x83\x01\xb1\x01\x00\x00\xbf\x01\x00\x00\x0d\x01\x65\x00\x00\x00\x00\x00\x13\x02\xa7\x01\x00\x00\xb4\x01\x04\x00\xbc\x01\x00\x00\x00\x00\x1e\x02\x00\x00\xc6\x01\x1e\x02\x00\x00\x00\x00\x00\x00\xcb\x01\x00\x00\xcd\x01\x00\x00\x83\x01\x5c\x01\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x39\x01\x00\x00\x00\x00\x00\x00\x89\x01\x00\x00\xdb\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xde\x01\x00\x00\x00\x00\x63\x01\x00\x00\x32\x01\x00\x00\x00\x00\xe2\x01\x00\x00\xf9\x01\xe9\x01\x8a\x01\x00\x00\x00\x00\x00\x00\x36\x01\x00\x00\x00\x00\xbf\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe1\x02\xb9\x01\x00\x00\x00\x00\xd6\x01\xd8\x01\xd9\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd3\x03\x7b\x02\xe9\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x04\x00\x00\x00\x00\x63\x03\x00\x00\x2b\x04\x00\x00\x00\x00\x00\x00\x05\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9d\x02\x00\x00\x41\x04\x00\x00\x57\x04\x6d\x04\x00\x00\x83\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x99\x04\x00\x00\x00\x00\xaf\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8f\x03\x00\x00\x00\x00\xc5\x04\xdb\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd5\x01\xf1\x04\x07\x05\x00\x00\xe4\x01\x00\x00\xe3\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2b\x01\x00\x00\x00\x00\xa6\x03\x00\x00\x00\x00\x4c\x01\x00\x00\x00\x00\x1d\x05\x00\x00\x79\x03\x00\x00\x00\x00\x03\x03\x25\x03\x00\x00\x00\x00\x00\x00\x00\x00\x73\x01\x00\x00\x00\x00\x00\x00\xa5\x01\x01\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbc\x03\x00\x00\x00\x00\x33\x05\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x47\x03\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\xfe\xff\x00\x00\xf9\xff\xfb\xff\x00\x00\xd7\xff\x00\x00\xd9\xff\xd8\xff\xd5\xff\xd6\xff\x00\x00\x00\x00\xf8\xff\xf5\xff\x00\x00\xd3\xff\xf4\xff\x00\x00\x00\x00\xf7\xff\x00\x00\x00\x00\xf5\xff\xd2\xff\x00\x00\x00\x00\xd3\xff\xf3\xff\xfa\xff\xf1\xff\xf6\xff\xa2\xff\xcf\xff\xc9\xff\x00\x00\xee\xff\x00\x00\xf1\xff\x00\x00\xc4\xff\xc2\xff\xc0\xff\xbe\xff\xbc\xff\xba\xff\xaf\xff\x00\x00\xb4\xff\xce\xff\xad\xff\xcd\xff\xa0\xff\x00\x00\xa5\xff\x00\x00\xef\xff\xe0\xff\xdf\xff\xcb\xff\x00\x00\x00\x00\xcc\xff\x00\x00\xfd\xff\xfc\xff\xd1\xff\xd4\xff\x00\x00\xa2\xff\xaf\xff\xa5\xff\xe5\xff\x00\x00\xc4\xff\xaf\xff\xa2\xff\x00\x00\xaf\xff\x00\x00\x00\x00\xce\xff\x00\x00\xa4\xff\xa7\xff\x00\x00\xcd\xff\xa5\xff\xc4\xff\x00\x00\xe1\xff\x00\x00\x00\x00\x91\xff\x00\x00\x96\xff\x95\xff\x92\xff\x94\xff\x93\xff\x00\x00\x9b\xff\x9a\xff\x00\x00\x97\xff\x99\xff\x98\xff\xdd\xff\xdb\xff\x00\x00\xf0\xff\xf2\xff\xde\xff\xb9\xff\x00\x00\x00\x00\x00\x00\x00\x00\xaf\xff\xaf\xff\xe7\xff\xe8\xff\xaf\xff\x00\x00\xed\xff\x00\x00\x00\x00\x00\x00\xc2\xff\xc0\xff\xba\xff\xbe\xff\xaf\xff\xce\xff\x00\x00\x9f\xff\x00\x00\xa5\xff\xae\xff\xac\xff\xab\xff\xb5\xff\xb3\xff\xb2\xff\xc7\xff\xa8\xff\x00\x00\xaf\xff\xa5\xff\xe6\xff\xaf\xff\x00\x00\x00\x00\xaf\xff\xb6\xff\xb1\xff\xb0\xff\xb2\xff\xce\xff\xa9\xff\xa3\xff\x00\x00\x00\x00\xa6\xff\xaf\xff\xaf\xff\xdd\xff\xda\xff\xca\xff\xb9\xff\xeb\xff\xc8\xff\x00\x00\xb7\xff\xec\xff\xa1\xff\x00\x00\xc8\xff\xe4\xff\xe2\xff\x00\x00\xaf\xff\xe3\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x07\x00\x01\x00\x02\x00\x03\x00\x0b\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x04\x00\x0b\x00\x0c\x00\x2a\x00\x0b\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x10\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x01\x00\x02\x00\x03\x00\x2a\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x07\x00\x0b\x00\x0c\x00\x2d\x00\x0b\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x07\x00\x14\x00\x15\x00\x16\x00\x0b\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x01\x00\x02\x00\x03\x00\x2a\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x07\x00\x0b\x00\x0c\x00\x11\x00\x0b\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x07\x00\x14\x00\x15\x00\x16\x00\x0b\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x01\x00\x02\x00\x03\x00\x06\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x09\x00\x0b\x00\x0c\x00\x0c\x00\x06\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x2a\x00\x14\x00\x15\x00\x16\x00\x0b\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x01\x00\x02\x00\x03\x00\x07\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x27\x00\x0b\x00\x0c\x00\x0b\x00\x07\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x15\x00\x14\x00\x15\x00\x16\x00\x29\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x01\x00\x02\x00\x03\x00\x10\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x2a\x00\x0b\x00\x0c\x00\x28\x00\x10\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x06\x00\x14\x00\x15\x00\x16\x00\x13\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x01\x00\x02\x00\x03\x00\x06\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x06\x00\x0b\x00\x0c\x00\x10\x00\x2a\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x07\x00\x14\x00\x15\x00\x16\x00\x07\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x01\x00\x2a\x00\x0d\x00\x0b\x00\x06\x00\x06\x00\x03\x00\x04\x00\x05\x00\x0d\x00\x0e\x00\x0c\x00\x07\x00\x0d\x00\x0e\x00\x10\x00\x0d\x00\x13\x00\x1d\x00\x1e\x00\x1f\x00\x17\x00\x00\x00\x07\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x01\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x06\x00\x17\x00\x18\x00\x19\x00\x19\x00\x07\x00\x0c\x00\x06\x00\x07\x00\x1e\x00\x10\x00\x20\x00\x10\x00\x22\x00\x0d\x00\x24\x00\x25\x00\x00\x00\x0b\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x01\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x06\x00\x17\x00\x18\x00\x19\x00\x04\x00\x05\x00\x0c\x00\x06\x00\x07\x00\x10\x00\x10\x00\x01\x00\x10\x00\x0d\x00\x0d\x00\x18\x00\x06\x00\x07\x00\x10\x00\x19\x00\x1a\x00\x1b\x00\x0c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x07\x00\x19\x00\x2a\x00\x2b\x00\x2c\x00\x1d\x00\x1e\x00\x0d\x00\x20\x00\x0e\x00\x22\x00\x23\x00\x24\x00\x25\x00\x00\x00\x2a\x00\x01\x00\x07\x00\x2a\x00\x2b\x00\x2c\x00\x06\x00\x07\x00\x1d\x00\x1e\x00\x0b\x00\x0c\x00\x0c\x00\x07\x00\x03\x00\x18\x00\x0b\x00\x01\x00\x18\x00\x08\x00\x27\x00\x13\x00\x06\x00\x07\x00\x07\x00\x19\x00\x0f\x00\x00\x00\x0c\x00\x1d\x00\x1e\x00\x13\x00\x20\x00\x00\x00\x22\x00\x23\x00\x24\x00\x25\x00\x0b\x00\x0c\x00\x00\x00\x19\x00\x2a\x00\x2b\x00\x2c\x00\x1d\x00\x1e\x00\x1c\x00\x20\x00\x0d\x00\x22\x00\x23\x00\x24\x00\x25\x00\x02\x00\x08\x00\x01\x00\x05\x00\x2a\x00\x2b\x00\x2c\x00\x06\x00\x07\x00\x00\x00\x24\x00\x23\x00\x01\x00\x0c\x00\x25\x00\x11\x00\x12\x00\x06\x00\x14\x00\x15\x00\x16\x00\x00\x00\x23\x00\x0c\x00\x24\x00\x08\x00\x19\x00\x10\x00\xff\xff\xff\xff\x1d\x00\x1e\x00\xff\xff\x20\x00\xff\xff\x22\x00\x23\x00\x24\x00\x25\x00\xff\xff\x1d\x00\x06\x00\xff\xff\x2a\x00\x2b\x00\x2c\x00\x23\x00\x01\x00\xff\xff\xff\xff\xff\xff\xff\xff\x06\x00\x2a\x00\x2b\x00\x2c\x00\xff\xff\xff\xff\x0c\x00\xff\xff\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\x1e\x00\xff\xff\x20\x00\xff\xff\x22\x00\xff\xff\x24\x00\x25\x00\xff\xff\xff\xff\x1d\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x23\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x2a\x00\x2b\x00\x2c\x00\x02\x00\x03\x00\xff\xff\x05\x00\x06\x00\xff\xff\x08\x00\x09\x00\x0a\x00\xff\xff\x0c\x00\x0d\x00\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\xff\xff\xff\xff\x02\x00\x03\x00\xff\xff\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\xff\xff\x0b\x00\x0c\x00\xff\xff\xff\xff\x0f\x00\x28\x00\x11\x00\x12\x00\xff\xff\x14\x00\x15\x00\x16\x00\x17\x00\xff\xff\xff\xff\x00\x00\x01\x00\x02\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0d\x00\x28\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x00\x00\x01\x00\x02\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0d\x00\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x00\x00\x01\x00\x02\x00\xff\xff\x04\x00\xff\xff\xff\xff\xff\xff\x08\x00\x09\x00\x0a\x00\xff\xff\xff\xff\x0d\x00\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\x00\x00\x01\x00\x02\x00\xff\xff\x04\x00\xff\xff\xff\xff\xff\xff\x08\x00\x09\x00\x0a\x00\xff\xff\xff\xff\x0d\x00\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\x00\x00\x01\x00\x02\x00\xff\xff\x04\x00\xff\xff\xff\xff\xff\xff\x08\x00\xff\xff\x0a\x00\xff\xff\xff\xff\x0d\x00\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\x00\x00\x01\x00\x02\x00\xff\xff\x04\x00\xff\xff\xff\xff\xff\xff\x08\x00\xff\xff\x0a\x00\xff\xff\xff\xff\x0d\x00\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\x00\x00\x01\x00\x02\x00\xff\xff\x04\x00\xff\xff\xff\xff\xff\xff\x08\x00\xff\xff\x0a\x00\xff\xff\xff\xff\x0d\x00\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\xff\xff\x1a\x00\x1b\x00\x00\x00\x01\x00\x02\x00\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0d\x00\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\xff\xff\x0d\x00\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x00\x00\x01\x00\x02\x00\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\x1c\x00\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x00\x00\x01\x00\x02\x00\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\xff\xff\xff\xff\xff\xff\xff\xff\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\x20\x00\x21\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x91\x00\xa2\xff\xa2\xff\xa2\xff\x92\x00\xa2\xff\x74\x00\xa2\xff\xa2\xff\xa2\xff\x18\x00\xa2\xff\xa2\xff\x03\x00\xaf\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xaf\xff\xa2\xff\xa2\xff\xa2\xff\x95\x00\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xa2\xff\xc4\xff\xc4\xff\xc4\xff\x03\x00\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\x8e\x00\xc4\xff\xc4\xff\xff\xff\x8f\x00\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xaf\xff\xc4\xff\xc4\xff\xc4\xff\xac\x00\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc4\xff\xc2\xff\xc2\xff\xc2\xff\x03\x00\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xa6\x00\xc2\xff\xc2\xff\x0e\x00\x8c\x00\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xaa\xff\xc2\xff\xc2\xff\xc2\xff\x8f\x00\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc0\xff\xc0\xff\x6b\x00\x11\x00\xc0\xff\xc0\xff\xc0\xff\x6c\x00\xc0\xff\x68\x00\xc0\xff\xc0\xff\x69\x00\x13\x00\x6d\x00\xc0\xff\xc0\xff\xc0\xff\x03\x00\xc0\xff\xc0\xff\xc0\xff\x1a\x00\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xba\xff\xba\xff\xba\xff\x19\x00\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\x21\x00\xba\xff\xba\xff\x1e\x00\x1d\x00\xba\xff\xba\xff\xba\xff\xba\xff\x46\x00\xba\xff\xba\xff\xba\xff\x72\x00\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\xba\xff\x5e\x00\xba\xff\xba\xff\xba\xff\xba\xff\xbe\xff\xbe\xff\xbe\xff\x73\x00\xbe\xff\xbe\xff\xbe\xff\xbe\xff\x68\x00\x03\x00\xbe\xff\x69\x00\x5e\x00\x5d\x00\xbe\xff\xbe\xff\xbe\xff\xbe\xff\x4c\x00\xbe\xff\xbe\xff\xbe\xff\x5c\x00\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xbe\xff\xaf\xff\xaf\xff\xaf\xff\x47\x00\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xa0\x00\xaf\xff\xaf\xff\x98\x00\x03\x00\xaf\xff\xaf\xff\xaf\xff\xaf\xff\x93\x00\xaf\xff\xaf\xff\xaf\xff\x90\x00\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xce\xff\x03\x00\x4f\x00\x8c\x00\x11\x00\xce\xff\x03\x00\x04\x00\x05\x00\x1a\x00\x1b\x00\xce\xff\x8d\x00\x1a\x00\x44\x00\xce\xff\x06\x00\x81\x00\x55\x00\x56\x00\xa2\x00\x82\x00\x9c\x00\x8b\x00\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xce\xff\xaf\xff\xce\xff\xce\xff\xce\xff\xce\xff\xaf\xff\x9d\x00\x32\x00\x9e\x00\x08\x00\x8a\x00\xaf\xff\x13\x00\x14\x00\x09\x00\xaf\xff\x0a\x00\x7f\x00\x0b\x00\x15\x00\x0c\x00\x0d\x00\x9c\x00\x80\x00\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\xaf\xff\x38\x00\xaf\xff\xaf\xff\xaf\xff\xaf\xff\x39\x00\x51\x00\x32\x00\x52\x00\x04\x00\x0f\x00\x3a\x00\x13\x00\x1e\x00\x7c\x00\x3b\x00\x38\x00\x7b\x00\x06\x00\x15\x00\xae\x00\x5a\x00\xa5\xff\xad\x00\x08\x00\x3c\x00\x3d\x00\x3a\x00\x3e\x00\x09\x00\x3f\x00\x0a\x00\x40\x00\x0b\x00\x41\x00\x0c\x00\x0d\x00\x42\x00\x21\x00\xab\x00\x08\x00\x03\x00\x43\x00\x44\x00\x3e\x00\x09\x00\x4f\x00\x0a\x00\xa5\x00\x0b\x00\x41\x00\x0c\x00\x0d\x00\x6d\x00\x03\x00\x38\x00\x9b\x00\x03\x00\x43\x00\x44\x00\x97\x00\xa5\xff\xb2\x00\x56\x00\x6e\x00\x6f\x00\x3a\x00\x9a\x00\x6b\x00\xb4\x00\x92\x00\x38\x00\xb1\x00\x6c\x00\x21\x00\x81\x00\x5a\x00\xa5\xff\xa6\x00\x08\x00\x6d\x00\xa8\x00\x3a\x00\x3e\x00\x09\x00\xaf\x00\x0a\x00\x0e\x00\x0b\x00\x41\x00\x0c\x00\x0d\x00\x6e\x00\xa9\x00\x16\x00\x08\x00\x03\x00\x43\x00\x44\x00\x3e\x00\x09\x00\xb7\x00\x0a\x00\x11\x00\x0b\x00\x41\x00\x0c\x00\x0d\x00\x60\x00\x1f\x00\x38\x00\x61\x00\x03\x00\x43\x00\x44\x00\x97\x00\xa5\xff\x21\x00\x69\x00\x66\x00\x38\x00\x3a\x00\x5e\x00\x62\x00\x63\x00\x4a\x00\x64\x00\x65\x00\x66\x00\x93\x00\x66\x00\x3a\x00\x69\x00\xb1\x00\x08\x00\x4b\x00\x00\x00\x00\x00\x3e\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x41\x00\x0c\x00\x0d\x00\x00\x00\x3e\x00\xa4\x00\x00\x00\x03\x00\x43\x00\x44\x00\x41\x00\x38\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4a\x00\x03\x00\x43\x00\x44\x00\x00\x00\x00\x00\x3a\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x0d\x00\x00\x00\x00\x00\x3e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x43\x00\x44\x00\xa2\xff\xa2\xff\x00\x00\xa2\xff\x74\x00\x00\x00\xa2\xff\xa2\xff\x75\x00\x00\x00\xa2\xff\x76\x00\x00\x00\xa2\xff\xa2\xff\xa2\xff\xa2\xff\x77\x00\xa2\xff\xa2\xff\xa2\xff\x78\x00\x00\x00\x00\x00\xa2\xff\xa2\xff\x00\x00\xa2\xff\x74\x00\xa2\xff\xa2\xff\xa2\xff\x00\x00\xa2\xff\xa2\xff\x00\x00\x00\x00\xa2\xff\xa2\xff\xa2\xff\xa2\xff\x00\x00\xa2\xff\xa2\xff\xa2\xff\x95\x00\x00\x00\x00\x00\x4e\x00\x23\x00\x24\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4f\x00\xa2\xff\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x50\x00\x00\x00\x51\x00\x32\x00\x52\x00\x53\x00\x34\x00\x54\x00\x55\x00\x56\x00\x57\x00\x58\x00\x36\x00\x4e\x00\x23\x00\x24\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4f\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x50\x00\x00\x00\x51\x00\x32\x00\x52\x00\x53\x00\x34\x00\x54\x00\x88\x00\x56\x00\x57\x00\x58\x00\x36\x00\x22\x00\x23\x00\x24\x00\x00\x00\x25\x00\x00\x00\x00\x00\x00\x00\x26\x00\x27\x00\x28\x00\x00\x00\x00\x00\x29\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x00\x00\x31\x00\x32\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x22\x00\x23\x00\x24\x00\x00\x00\x25\x00\x00\x00\x00\x00\x00\x00\x26\x00\x70\x00\x28\x00\x00\x00\x00\x00\x29\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x00\x00\x31\x00\x32\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x22\x00\x23\x00\x24\x00\x00\x00\x25\x00\x00\x00\x00\x00\x00\x00\x26\x00\x00\x00\xb5\x00\x00\x00\x00\x00\x29\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x00\x00\x31\x00\x32\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x22\x00\x23\x00\x24\x00\x00\x00\x25\x00\x00\x00\x00\x00\x00\x00\x26\x00\x00\x00\xb4\x00\x00\x00\x00\x00\x29\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x00\x00\x31\x00\x32\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x22\x00\x23\x00\x24\x00\x00\x00\x25\x00\x00\x00\x00\x00\x00\x00\x26\x00\x00\x00\xb8\x00\x00\x00\x00\x00\x29\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x00\x00\x31\x00\x32\x00\x00\x00\x33\x00\x34\x00\x47\x00\x23\x00\x24\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4f\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x50\x00\x47\x00\x23\x00\x24\x00\x00\x00\x53\x00\x34\x00\x54\x00\x55\x00\x56\x00\x57\x00\x58\x00\x36\x00\x00\x00\x4f\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x50\x00\x47\x00\x23\x00\x24\x00\x00\x00\x53\x00\x34\x00\x54\x00\x88\x00\x56\x00\x57\x00\x58\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x7c\x00\x7d\x00\x47\x00\x23\x00\x24\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x4d\x00\x47\x00\x23\x00\x24\x00\x00\x00\xa0\x00\x34\x00\xa1\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x7c\x00\xaf\x00\x47\x00\x23\x00\x24\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x4d\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x4c\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x4d\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x48\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x98\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x95\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x4d\x00\x47\x00\x23\x00\x24\x00\x00\x00\x87\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x86\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x85\x00\x2e\x00\x2f\x00\x4d\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x84\x00\x4d\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x83\x00\x2d\x00\x2e\x00\x2f\x00\x4d\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x82\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x4d\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x79\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x78\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\xa7\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\xa6\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x9b\x00\x47\x00\x23\x00\x24\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\xb7\x00\x00\x00\x00\x00\x00\x00\x00\x00\x33\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x35\x00\x36\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 110) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84),
	(85 , happyReduce_85),
	(86 , happyReduce_86),
	(87 , happyReduce_87),
	(88 , happyReduce_88),
	(89 , happyReduce_89),
	(90 , happyReduce_90),
	(91 , happyReduce_91),
	(92 , happyReduce_92),
	(93 , happyReduce_93),
	(94 , happyReduce_94),
	(95 , happyReduce_95),
	(96 , happyReduce_96),
	(97 , happyReduce_97),
	(98 , happyReduce_98),
	(99 , happyReduce_99),
	(100 , happyReduce_100),
	(101 , happyReduce_101),
	(102 , happyReduce_102),
	(103 , happyReduce_103),
	(104 , happyReduce_104),
	(105 , happyReduce_105),
	(106 , happyReduce_106),
	(107 , happyReduce_107),
	(108 , happyReduce_108),
	(109 , happyReduce_109),
	(110 , happyReduce_110)
	]

happy_n_terms = 46 :: Prelude.Int
happy_n_nonterms = 38 :: Prelude.Int

happyReduce_1 = happySpecReduce_1  0# happyReduction_1
happyReduction_1 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn4
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Ident (tokenText happy_var_1))
	)}

happyReduce_2 = happySpecReduce_1  1# happyReduction_2
happyReduction_2 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn5
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), (read (tokenText happy_var_1)) :: Integer)
	)}

happyReduce_3 = happySpecReduce_1  2# happyReduction_3
happyReduction_3 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn6
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), ((\(PT _ (TL s)) -> s) happy_var_1))
	)}

happyReduce_4 = happySpecReduce_1  3# happyReduction_4
happyReduction_4 happy_x_1
	 =  case happyOut9 happy_x_1 of { (HappyWrap9 happy_var_1) -> 
	happyIn7
		 ((fst happy_var_1, Chococino.Abs.Program (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_5 = happyReduce 6# 4# happyReduction_5
happyReduction_5 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut4 happy_x_2 of { (HappyWrap4 happy_var_2) -> 
	case happyOut11 happy_x_4 of { (HappyWrap11 happy_var_4) -> 
	case happyOut12 happy_x_6 of { (HappyWrap12 happy_var_6) -> 
	happyIn8
		 ((fst happy_var_1, Chococino.Abs.FnDef (fst happy_var_1) (snd happy_var_1) (snd happy_var_2) (snd happy_var_4) (snd happy_var_6))
	) `HappyStk` happyRest}}}}

happyReduce_6 = happySpecReduce_1  5# happyReduction_6
happyReduction_6 happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	happyIn9
		 ((fst happy_var_1, (:[]) (snd happy_var_1))
	)}

happyReduce_7 = happySpecReduce_2  5# happyReduction_7
happyReduction_7 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut9 happy_x_2 of { (HappyWrap9 happy_var_2) -> 
	happyIn9
		 ((fst happy_var_1, (:) (snd happy_var_1) (snd happy_var_2))
	)}}

happyReduce_8 = happySpecReduce_2  6# happyReduction_8
happyReduction_8 happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut4 happy_x_2 of { (HappyWrap4 happy_var_2) -> 
	happyIn10
		 ((fst happy_var_1, Chococino.Abs.ArgNoRef (fst happy_var_1) (snd happy_var_1) (snd happy_var_2))
	)}}

happyReduce_9 = happySpecReduce_3  6# happyReduction_9
happyReduction_9 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut4 happy_x_3 of { (HappyWrap4 happy_var_3) -> 
	happyIn10
		 ((fst happy_var_1, Chococino.Abs.ArgRef (fst happy_var_1) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_10 = happySpecReduce_0  7# happyReduction_10
happyReduction_10  =  happyIn11
		 ((Chococino.Abs.BNFC'NoPosition, [])
	)

happyReduce_11 = happySpecReduce_1  7# happyReduction_11
happyReduction_11 happy_x_1
	 =  case happyOut10 happy_x_1 of { (HappyWrap10 happy_var_1) -> 
	happyIn11
		 ((fst happy_var_1, (:[]) (snd happy_var_1))
	)}

happyReduce_12 = happySpecReduce_3  7# happyReduction_12
happyReduction_12 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_1 of { (HappyWrap10 happy_var_1) -> 
	case happyOut11 happy_x_3 of { (HappyWrap11 happy_var_3) -> 
	happyIn11
		 ((fst happy_var_1, (:) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_13 = happySpecReduce_3  8# happyReduction_13
happyReduction_13 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut13 happy_x_2 of { (HappyWrap13 happy_var_2) -> 
	happyIn12
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Block (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_2))
	)}}

happyReduce_14 = happySpecReduce_0  9# happyReduction_14
happyReduction_14  =  happyIn13
		 ((Chococino.Abs.BNFC'NoPosition, [])
	)

happyReduce_15 = happySpecReduce_2  9# happyReduction_15
happyReduction_15 happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut13 happy_x_2 of { (HappyWrap13 happy_var_2) -> 
	happyIn13
		 ((fst happy_var_1, (:) (snd happy_var_1) (snd happy_var_2))
	)}}

happyReduce_16 = happySpecReduce_1  10# happyReduction_16
happyReduction_16 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn14
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Empty (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_17 = happySpecReduce_1  10# happyReduction_17
happyReduction_17 happy_x_1
	 =  case happyOut12 happy_x_1 of { (HappyWrap12 happy_var_1) -> 
	happyIn14
		 ((fst happy_var_1, Chococino.Abs.BStmt (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_18 = happySpecReduce_3  10# happyReduction_18
happyReduction_18 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut16 happy_x_2 of { (HappyWrap16 happy_var_2) -> 
	happyIn14
		 ((fst happy_var_1, Chococino.Abs.Decl (fst happy_var_1) (snd happy_var_1) (snd happy_var_2))
	)}}

happyReduce_19 = happyReduce 5# 10# happyReduction_19
happyReduction_19 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut4 happy_x_2 of { (HappyWrap4 happy_var_2) -> 
	case happyOut25 happy_x_4 of { (HappyWrap25 happy_var_4) -> 
	happyIn14
		 ((fst happy_var_1, Chococino.Abs.ArrDecl (fst happy_var_1) (snd happy_var_1) (snd happy_var_2) (snd happy_var_4))
	) `HappyStk` happyRest}}}

happyReduce_20 = happyReduce 4# 10# happyReduction_20
happyReduction_20 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	happyIn14
		 ((fst happy_var_1, Chococino.Abs.Ass (fst happy_var_1) (snd happy_var_1) (snd happy_var_3))
	) `HappyStk` happyRest}}

happyReduce_21 = happyReduce 6# 10# happyReduction_21
happyReduction_21 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	case happyOut25 happy_x_6 of { (HappyWrap25 happy_var_6) -> 
	happyIn14
		 ((fst happy_var_1, Chococino.Abs.ArrAss (fst happy_var_1) (snd happy_var_1) (snd happy_var_3) (snd happy_var_6))
	) `HappyStk` happyRest}}}

happyReduce_22 = happySpecReduce_3  10# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	case happyOut30 happy_x_3 of { (HappyWrap30 happy_var_3) -> 
	happyIn14
		 ((fst happy_var_1, Chococino.Abs.TupleAss (fst happy_var_1) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_23 = happySpecReduce_3  10# happyReduction_23
happyReduction_23 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	happyIn14
		 ((fst happy_var_1, Chococino.Abs.Incr (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_24 = happySpecReduce_3  10# happyReduction_24
happyReduction_24 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	happyIn14
		 ((fst happy_var_1, Chococino.Abs.Decr (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_25 = happySpecReduce_3  10# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut25 happy_x_2 of { (HappyWrap25 happy_var_2) -> 
	happyIn14
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Ret (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_2))
	)}}

happyReduce_26 = happySpecReduce_2  10# happyReduction_26
happyReduction_26 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn14
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.VRet (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_27 = happyReduce 5# 10# happyReduction_27
happyReduction_27 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	case happyOut14 happy_x_5 of { (HappyWrap14 happy_var_5) -> 
	happyIn14
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Cond (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_3) (snd happy_var_5))
	) `HappyStk` happyRest}}}

happyReduce_28 = happyReduce 7# 10# happyReduction_28
happyReduction_28 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	case happyOut14 happy_x_5 of { (HappyWrap14 happy_var_5) -> 
	case happyOut14 happy_x_7 of { (HappyWrap14 happy_var_7) -> 
	happyIn14
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.CondElse (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_3) (snd happy_var_5) (snd happy_var_7))
	) `HappyStk` happyRest}}}}

happyReduce_29 = happyReduce 5# 10# happyReduction_29
happyReduction_29 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	case happyOut14 happy_x_5 of { (HappyWrap14 happy_var_5) -> 
	happyIn14
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.While (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_3) (snd happy_var_5))
	) `HappyStk` happyRest}}}

happyReduce_30 = happySpecReduce_2  10# happyReduction_30
happyReduction_30 happy_x_2
	happy_x_1
	 =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
	happyIn14
		 ((fst happy_var_1, Chococino.Abs.SExp (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_31 = happySpecReduce_1  10# happyReduction_31
happyReduction_31 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn14
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Break (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_32 = happySpecReduce_1  10# happyReduction_32
happyReduction_32 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn14
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Continue (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_33 = happySpecReduce_2  10# happyReduction_33
happyReduction_33 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	happyIn14
		 ((fst happy_var_1, Chococino.Abs.FnNestDef (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_34 = happySpecReduce_1  11# happyReduction_34
happyReduction_34 happy_x_1
	 =  case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	happyIn15
		 ((fst happy_var_1, Chococino.Abs.NoInit (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_35 = happySpecReduce_3  11# happyReduction_35
happyReduction_35 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	happyIn15
		 ((fst happy_var_1, Chococino.Abs.Init (fst happy_var_1) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_36 = happySpecReduce_1  12# happyReduction_36
happyReduction_36 happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	happyIn16
		 ((fst happy_var_1, (:[]) (snd happy_var_1))
	)}

happyReduce_37 = happySpecReduce_3  12# happyReduction_37
happyReduction_37 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn16
		 ((fst happy_var_1, (:) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_38 = happySpecReduce_1  13# happyReduction_38
happyReduction_38 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Int (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_39 = happySpecReduce_1  13# happyReduction_39
happyReduction_39 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Str (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_40 = happySpecReduce_1  13# happyReduction_40
happyReduction_40 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Bool (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_41 = happySpecReduce_1  13# happyReduction_41
happyReduction_41 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Void (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_42 = happySpecReduce_1  13# happyReduction_42
happyReduction_42 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Tuple (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_43 = happyReduce 7# 13# happyReduction_43
happyReduction_43 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	case happyOut18 happy_x_5 of { (HappyWrap18 happy_var_5) -> 
	happyIn17
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Function (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_3) (snd happy_var_5))
	) `HappyStk` happyRest}}}

happyReduce_44 = happySpecReduce_0  14# happyReduction_44
happyReduction_44  =  happyIn18
		 ((Chococino.Abs.BNFC'NoPosition, [])
	)

happyReduce_45 = happySpecReduce_1  14# happyReduction_45
happyReduction_45 happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	happyIn18
		 ((fst happy_var_1, (:[]) (snd happy_var_1))
	)}

happyReduce_46 = happySpecReduce_3  14# happyReduction_46
happyReduction_46 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn18
		 ((fst happy_var_1, (:) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_47 = happySpecReduce_1  15# happyReduction_47
happyReduction_47 happy_x_1
	 =  case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	happyIn19
		 ((fst happy_var_1, Chococino.Abs.EVar (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_48 = happySpecReduce_1  15# happyReduction_48
happyReduction_48 happy_x_1
	 =  case happyOut5 happy_x_1 of { (HappyWrap5 happy_var_1) -> 
	happyIn19
		 ((fst happy_var_1, Chococino.Abs.ELitInt (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_49 = happySpecReduce_1  15# happyReduction_49
happyReduction_49 happy_x_1
	 =  case happyOut30 happy_x_1 of { (HappyWrap30 happy_var_1) -> 
	happyIn19
		 ((fst happy_var_1, Chococino.Abs.ELitTuple (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_50 = happySpecReduce_1  15# happyReduction_50
happyReduction_50 happy_x_1
	 =  case happyOut36 happy_x_1 of { (HappyWrap36 happy_var_1) -> 
	happyIn19
		 ((fst happy_var_1, Chococino.Abs.ELitLambd (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_51 = happySpecReduce_1  15# happyReduction_51
happyReduction_51 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn19
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.ELitTrue (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_52 = happySpecReduce_1  15# happyReduction_52
happyReduction_52 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn19
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.ELitFalse (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_53 = happyReduce 4# 15# happyReduction_53
happyReduction_53 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	case happyOut26 happy_x_3 of { (HappyWrap26 happy_var_3) -> 
	happyIn19
		 ((fst happy_var_1, Chococino.Abs.EApp (fst happy_var_1) (snd happy_var_1) (snd happy_var_3))
	) `HappyStk` happyRest}}

happyReduce_54 = happySpecReduce_1  15# happyReduction_54
happyReduction_54 happy_x_1
	 =  case happyOut6 happy_x_1 of { (HappyWrap6 happy_var_1) -> 
	happyIn19
		 ((fst happy_var_1, Chococino.Abs.EString (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_55 = happyReduce 4# 15# happyReduction_55
happyReduction_55 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	happyIn19
		 ((fst happy_var_1, Chococino.Abs.EArr (fst happy_var_1) (snd happy_var_1) (snd happy_var_3))
	) `HappyStk` happyRest}}

happyReduce_56 = happySpecReduce_3  15# happyReduction_56
happyReduction_56 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut25 happy_x_2 of { (HappyWrap25 happy_var_2) -> 
	happyIn19
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), (snd happy_var_2))
	)}}

happyReduce_57 = happySpecReduce_2  16# happyReduction_57
happyReduction_57 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	happyIn20
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Neg (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_2))
	)}}

happyReduce_58 = happySpecReduce_2  16# happyReduction_58
happyReduction_58 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	happyIn20
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Not (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_2))
	)}}

happyReduce_59 = happySpecReduce_1  16# happyReduction_59
happyReduction_59 happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	happyIn20
		 ((fst happy_var_1, (snd happy_var_1))
	)}

happyReduce_60 = happySpecReduce_3  17# happyReduction_60
happyReduction_60 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	case happyOut40 happy_x_2 of { (HappyWrap40 happy_var_2) -> 
	case happyOut20 happy_x_3 of { (HappyWrap20 happy_var_3) -> 
	happyIn21
		 ((fst happy_var_1, Chococino.Abs.EMul (fst happy_var_1) (snd happy_var_1) (snd happy_var_2) (snd happy_var_3))
	)}}}

happyReduce_61 = happySpecReduce_1  17# happyReduction_61
happyReduction_61 happy_x_1
	 =  case happyOut20 happy_x_1 of { (HappyWrap20 happy_var_1) -> 
	happyIn21
		 ((fst happy_var_1, (snd happy_var_1))
	)}

happyReduce_62 = happySpecReduce_3  18# happyReduction_62
happyReduction_62 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	case happyOut39 happy_x_2 of { (HappyWrap39 happy_var_2) -> 
	case happyOut21 happy_x_3 of { (HappyWrap21 happy_var_3) -> 
	happyIn22
		 ((fst happy_var_1, Chococino.Abs.EAdd (fst happy_var_1) (snd happy_var_1) (snd happy_var_2) (snd happy_var_3))
	)}}}

happyReduce_63 = happySpecReduce_1  18# happyReduction_63
happyReduction_63 happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	happyIn22
		 ((fst happy_var_1, (snd happy_var_1))
	)}

happyReduce_64 = happySpecReduce_3  19# happyReduction_64
happyReduction_64 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { (HappyWrap23 happy_var_1) -> 
	case happyOut41 happy_x_2 of { (HappyWrap41 happy_var_2) -> 
	case happyOut22 happy_x_3 of { (HappyWrap22 happy_var_3) -> 
	happyIn23
		 ((fst happy_var_1, Chococino.Abs.ERel (fst happy_var_1) (snd happy_var_1) (snd happy_var_2) (snd happy_var_3))
	)}}}

happyReduce_65 = happySpecReduce_1  19# happyReduction_65
happyReduction_65 happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	happyIn23
		 ((fst happy_var_1, (snd happy_var_1))
	)}

happyReduce_66 = happySpecReduce_3  20# happyReduction_66
happyReduction_66 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { (HappyWrap23 happy_var_1) -> 
	case happyOut24 happy_x_3 of { (HappyWrap24 happy_var_3) -> 
	happyIn24
		 ((fst happy_var_1, Chococino.Abs.EAnd (fst happy_var_1) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_67 = happySpecReduce_1  20# happyReduction_67
happyReduction_67 happy_x_1
	 =  case happyOut23 happy_x_1 of { (HappyWrap23 happy_var_1) -> 
	happyIn24
		 ((fst happy_var_1, (snd happy_var_1))
	)}

happyReduce_68 = happySpecReduce_3  21# happyReduction_68
happyReduction_68 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	happyIn25
		 ((fst happy_var_1, Chococino.Abs.EOr (fst happy_var_1) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_69 = happySpecReduce_1  21# happyReduction_69
happyReduction_69 happy_x_1
	 =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
	happyIn25
		 ((fst happy_var_1, (snd happy_var_1))
	)}

happyReduce_70 = happySpecReduce_0  22# happyReduction_70
happyReduction_70  =  happyIn26
		 ((Chococino.Abs.BNFC'NoPosition, [])
	)

happyReduce_71 = happySpecReduce_1  22# happyReduction_71
happyReduction_71 happy_x_1
	 =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
	happyIn26
		 ((fst happy_var_1, (:[]) (snd happy_var_1))
	)}

happyReduce_72 = happySpecReduce_3  22# happyReduction_72
happyReduction_72 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
	case happyOut26 happy_x_3 of { (HappyWrap26 happy_var_3) -> 
	happyIn26
		 ((fst happy_var_1, (:) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_73 = happySpecReduce_1  23# happyReduction_73
happyReduction_73 happy_x_1
	 =  case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	happyIn27
		 ((fst happy_var_1, Chococino.Abs.TupLId (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_74 = happySpecReduce_3  23# happyReduction_74
happyReduction_74 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	happyIn27
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.TupLPar (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_2))
	)}}

happyReduce_75 = happySpecReduce_1  23# happyReduction_75
happyReduction_75 happy_x_1
	 =  case happyOut28 happy_x_1 of { (HappyWrap28 happy_var_1) -> 
	happyIn27
		 ((fst happy_var_1, (snd happy_var_1))
	)}

happyReduce_76 = happySpecReduce_3  24# happyReduction_76
happyReduction_76 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut27 happy_x_2 of { (HappyWrap27 happy_var_2) -> 
	happyIn28
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), (snd happy_var_2))
	)}}

happyReduce_77 = happySpecReduce_0  25# happyReduction_77
happyReduction_77  =  happyIn29
		 ((Chococino.Abs.BNFC'NoPosition, [])
	)

happyReduce_78 = happySpecReduce_1  25# happyReduction_78
happyReduction_78 happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	happyIn29
		 ((fst happy_var_1, (:[]) (snd happy_var_1))
	)}

happyReduce_79 = happySpecReduce_3  25# happyReduction_79
happyReduction_79 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	case happyOut29 happy_x_3 of { (HappyWrap29 happy_var_3) -> 
	happyIn29
		 ((fst happy_var_1, (:) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_80 = happySpecReduce_1  26# happyReduction_80
happyReduction_80 happy_x_1
	 =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
	happyIn30
		 ((fst happy_var_1, Chococino.Abs.TupRExpr (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_81 = happySpecReduce_3  26# happyReduction_81
happyReduction_81 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut32 happy_x_2 of { (HappyWrap32 happy_var_2) -> 
	happyIn30
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.TupRPar (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_2))
	)}}

happyReduce_82 = happySpecReduce_1  26# happyReduction_82
happyReduction_82 happy_x_1
	 =  case happyOut31 happy_x_1 of { (HappyWrap31 happy_var_1) -> 
	happyIn30
		 ((fst happy_var_1, (snd happy_var_1))
	)}

happyReduce_83 = happySpecReduce_3  27# happyReduction_83
happyReduction_83 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { (HappyWrap30 happy_var_2) -> 
	happyIn31
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), (snd happy_var_2))
	)}}

happyReduce_84 = happySpecReduce_0  28# happyReduction_84
happyReduction_84  =  happyIn32
		 ((Chococino.Abs.BNFC'NoPosition, [])
	)

happyReduce_85 = happySpecReduce_1  28# happyReduction_85
happyReduction_85 happy_x_1
	 =  case happyOut30 happy_x_1 of { (HappyWrap30 happy_var_1) -> 
	happyIn32
		 ((fst happy_var_1, (:[]) (snd happy_var_1))
	)}

happyReduce_86 = happySpecReduce_3  28# happyReduction_86
happyReduction_86 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { (HappyWrap30 happy_var_1) -> 
	case happyOut32 happy_x_3 of { (HappyWrap32 happy_var_3) -> 
	happyIn32
		 ((fst happy_var_1, (:) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_87 = happySpecReduce_2  29# happyReduction_87
happyReduction_87 happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut4 happy_x_2 of { (HappyWrap4 happy_var_2) -> 
	happyIn33
		 ((fst happy_var_1, Chococino.Abs.LambdaArg (fst happy_var_1) (snd happy_var_1) (snd happy_var_2))
	)}}

happyReduce_88 = happySpecReduce_1  29# happyReduction_88
happyReduction_88 happy_x_1
	 =  case happyOut34 happy_x_1 of { (HappyWrap34 happy_var_1) -> 
	happyIn33
		 ((fst happy_var_1, (snd happy_var_1))
	)}

happyReduce_89 = happySpecReduce_3  30# happyReduction_89
happyReduction_89 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut33 happy_x_2 of { (HappyWrap33 happy_var_2) -> 
	happyIn34
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), (snd happy_var_2))
	)}}

happyReduce_90 = happySpecReduce_0  31# happyReduction_90
happyReduction_90  =  happyIn35
		 ((Chococino.Abs.BNFC'NoPosition, [])
	)

happyReduce_91 = happySpecReduce_1  31# happyReduction_91
happyReduction_91 happy_x_1
	 =  case happyOut33 happy_x_1 of { (HappyWrap33 happy_var_1) -> 
	happyIn35
		 ((fst happy_var_1, (:[]) (snd happy_var_1))
	)}

happyReduce_92 = happySpecReduce_3  31# happyReduction_92
happyReduction_92 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut33 happy_x_1 of { (HappyWrap33 happy_var_1) -> 
	case happyOut35 happy_x_3 of { (HappyWrap35 happy_var_3) -> 
	happyIn35
		 ((fst happy_var_1, (:) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_93 = happySpecReduce_1  32# happyReduction_93
happyReduction_93 happy_x_1
	 =  case happyOut4 happy_x_1 of { (HappyWrap4 happy_var_1) -> 
	happyIn36
		 ((fst happy_var_1, Chococino.Abs.LambdaId (fst happy_var_1) (snd happy_var_1))
	)}

happyReduce_94 = happyReduce 5# 32# happyReduction_94
happyReduction_94 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut35 happy_x_2 of { (HappyWrap35 happy_var_2) -> 
	case happyOut12 happy_x_5 of { (HappyWrap12 happy_var_5) -> 
	happyIn36
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.LambdaDef (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)) (snd happy_var_2) (snd happy_var_5))
	) `HappyStk` happyRest}}}

happyReduce_95 = happySpecReduce_1  32# happyReduction_95
happyReduction_95 happy_x_1
	 =  case happyOut37 happy_x_1 of { (HappyWrap37 happy_var_1) -> 
	happyIn36
		 ((fst happy_var_1, (snd happy_var_1))
	)}

happyReduce_96 = happySpecReduce_3  33# happyReduction_96
happyReduction_96 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut36 happy_x_2 of { (HappyWrap36 happy_var_2) -> 
	happyIn37
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), (snd happy_var_2))
	)}}

happyReduce_97 = happySpecReduce_0  34# happyReduction_97
happyReduction_97  =  happyIn38
		 ((Chococino.Abs.BNFC'NoPosition, [])
	)

happyReduce_98 = happySpecReduce_1  34# happyReduction_98
happyReduction_98 happy_x_1
	 =  case happyOut36 happy_x_1 of { (HappyWrap36 happy_var_1) -> 
	happyIn38
		 ((fst happy_var_1, (:[]) (snd happy_var_1))
	)}

happyReduce_99 = happySpecReduce_3  34# happyReduction_99
happyReduction_99 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut36 happy_x_1 of { (HappyWrap36 happy_var_1) -> 
	case happyOut38 happy_x_3 of { (HappyWrap38 happy_var_3) -> 
	happyIn38
		 ((fst happy_var_1, (:) (snd happy_var_1) (snd happy_var_3))
	)}}

happyReduce_100 = happySpecReduce_1  35# happyReduction_100
happyReduction_100 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn39
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Plus (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_101 = happySpecReduce_1  35# happyReduction_101
happyReduction_101 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn39
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Minus (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_102 = happySpecReduce_1  36# happyReduction_102
happyReduction_102 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn40
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Times (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_103 = happySpecReduce_1  36# happyReduction_103
happyReduction_103 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn40
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Div (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_104 = happySpecReduce_1  36# happyReduction_104
happyReduction_104 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn40
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.Mod (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_105 = happySpecReduce_1  37# happyReduction_105
happyReduction_105 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn41
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.LTH (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_106 = happySpecReduce_1  37# happyReduction_106
happyReduction_106 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn41
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.LE (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_107 = happySpecReduce_1  37# happyReduction_107
happyReduction_107 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn41
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.GTH (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_108 = happySpecReduce_1  37# happyReduction_108
happyReduction_108 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn41
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.GE (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_109 = happySpecReduce_1  37# happyReduction_109
happyReduction_109 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn41
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.EQU (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyReduce_110 = happySpecReduce_1  37# happyReduction_110
happyReduction_110 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn41
		 ((uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1), Chococino.Abs.NE (uncurry Chococino.Abs.BNFC'Position (tokenLineCol happy_var_1)))
	)}

happyNewToken action sts stk [] =
	happyDoAction 45# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (TS _ 20) -> cont 20#;
	PT _ (TS _ 21) -> cont 21#;
	PT _ (TS _ 22) -> cont 22#;
	PT _ (TS _ 23) -> cont 23#;
	PT _ (TS _ 24) -> cont 24#;
	PT _ (TS _ 25) -> cont 25#;
	PT _ (TS _ 26) -> cont 26#;
	PT _ (TS _ 27) -> cont 27#;
	PT _ (TS _ 28) -> cont 28#;
	PT _ (TS _ 29) -> cont 29#;
	PT _ (TS _ 30) -> cont 30#;
	PT _ (TS _ 31) -> cont 31#;
	PT _ (TS _ 32) -> cont 32#;
	PT _ (TS _ 33) -> cont 33#;
	PT _ (TS _ 34) -> cont 34#;
	PT _ (TS _ 35) -> cont 35#;
	PT _ (TS _ 36) -> cont 36#;
	PT _ (TS _ 37) -> cont 37#;
	PT _ (TS _ 38) -> cont 38#;
	PT _ (TS _ 39) -> cont 39#;
	PT _ (TS _ 40) -> cont 40#;
	PT _ (TS _ 41) -> cont 41#;
	PT _ (TV _) -> cont 42#;
	PT _ (TI _) -> cont 43#;
	PT _ (TL _) -> cont 44#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 45# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = ((>>=))
happyReturn :: () => a -> Err a
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pProgram_internal tks = happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (let {(HappyWrap7 x') = happyOut7 x} in x'))

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Prelude.Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else Prelude.False
         action
          | check     = indexShortOffAddr happyTable off_i
          | Prelude.otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `Prelude.mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
