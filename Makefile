# Makefile generated by BNFC.

GHC        = ghc
HAPPY      = happy
HAPPY_OPTS = --array --info --ghc --coerce
ALEX       = alex
ALEX_OPTS  = --ghc

# List of goals not corresponding to file names.

.PHONY : all clean distclean

# Default goal.

all : Choc/Test

# Rules for building the parser.

Choc/Abs.hs Choc/Lex.x Choc/Par.y Choc/Print.hs Choc/Test.hs : Choc.cf
	bnfc --haskell -d Choc.cf

%.hs : %.y
	${HAPPY} ${HAPPY_OPTS} $<

%.hs : %.x
	${ALEX} ${ALEX_OPTS} $<

Choc/Test : Choc/Abs.hs Choc/Lex.hs Choc/Par.hs Choc/Print.hs Choc/Test.hs
	${GHC} ${GHC_OPTS} $@

# Rules for cleaning generated files.

clean :
	-rm -f Choc/*.hi Choc/*.o Choc/*.log Choc/*.aux Choc/*.dvi

distclean : clean
	-rm -f Choc/Abs.hs Choc/Abs.hs.bak Choc/ComposOp.hs Choc/ComposOp.hs.bak Choc/Doc.txt Choc/Doc.txt.bak Choc/ErrM.hs Choc/ErrM.hs.bak Choc/Layout.hs Choc/Layout.hs.bak Choc/Lex.x Choc/Lex.x.bak Choc/Par.y Choc/Par.y.bak Choc/Print.hs Choc/Print.hs.bak Choc/Skel.hs Choc/Skel.hs.bak Choc/Test.hs Choc/Test.hs.bak Choc/XML.hs Choc/XML.hs.bak Choc/AST.agda Choc/AST.agda.bak Choc/Parser.agda Choc/Parser.agda.bak Choc/IOLib.agda Choc/IOLib.agda.bak Choc/Main.agda Choc/Main.agda.bak Choc/Choc.dtd Choc/Choc.dtd.bak Choc/Test Choc/Lex.hs Choc/Par.hs Choc/Par.info Choc/ParData.hs Makefile
	-rmdir -p Choc/

main:
	ghc --make Main.hs
# EOF
