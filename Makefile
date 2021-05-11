# Makefile generated by BNFC.

GHC        = ghc
HAPPY      = happy
HAPPY_OPTS = --array --info --ghc --coerce
ALEX       = alex
ALEX_OPTS  = --ghc

# List of goals not corresponding to file names.

.PHONY : all clean distclean

# Default goal.

all : Chococino/Test

# Rules for building the parser.

Chococino/Abs.hs Chococino/Lex.x Chococino/Par.y Chococino/Print.hs Chococino/Test.hs : Chococino.cf
	bnfc --haskell -d Chococino.cf

%.hs : %.y
	${HAPPY} ${HAPPY_OPTS} $<

%.hs : %.x
	${ALEX} ${ALEX_OPTS} $<

Chococino/Test : Chococino/Abs.hs Chococino/Lex.hs Chococino/Par.hs Chococino/Print.hs Chococino/Test.hs
	${GHC} ${GHC_OPTS} $@

# Rules for cleaning generated files.

clean :
	-rm -f Chococino/*.hi Chococino/*.o Chococino/*.log Chococino/*.aux Chococino/*.dvi

distclean : clean
	-rm -f Chococino/Abs.hs Chococino/Abs.hs.bak Chococino/ComposOp.hs Chococino/ComposOp.hs.bak Chococino/Doc.txt Chococino/Doc.txt.bak Chococino/ErrM.hs Chococino/ErrM.hs.bak Chococino/Layout.hs Chococino/Layout.hs.bak Chococino/Lex.x Chococino/Lex.x.bak Chococino/Par.y Chococino/Par.y.bak Chococino/Print.hs Chococino/Print.hs.bak Chococino/Skel.hs Chococino/Skel.hs.bak Chococino/Test.hs Chococino/Test.hs.bak Chococino/XML.hs Chococino/XML.hs.bak Chococino/AST.agda Chococino/AST.agda.bak Chococino/Parser.agda Chococino/Parser.agda.bak Chococino/IOLib.agda Chococino/IOLib.agda.bak Chococino/Main.agda Chococino/Main.agda.bak Chococino/Chococino.dtd Chococino/Chococino.dtd.bak Chococino/Test Chococino/Lex.hs Chococino/Par.hs Chococino/Par.info Chococino/ParData.hs Makefile
	-rmdir -p Chococino/

# EOF
