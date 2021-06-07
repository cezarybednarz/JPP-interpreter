all:
	ghc --make Main.hs -o interpret

clean:
	rm interpret
	rm *.hi
	rm *.o
	rm *.bak


