a.out: lex.yy.o y.tab.o ass5_roll_translator.o
	g++ lex.yy.o y.tab.o ass5_roll_translator.o -lfl

ass5_roll_translator.o: ass5_roll_translator.cxx ass5_roll_translator.h
	g++ -c ass5_roll_translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

y.tab.o: y.tab.c
	g++ -c y.tab.c

lex.yy.c: ass5_roll.l y.tab.h ass5_roll_translator.h
	flex ass5_roll.l

y.tab.c y.tab.h: ass5_roll.y
	bison -dty --report=all ass5_roll.y

clean:
	rm a.out ass5_roll_translator.o lex.yy.* y.tab.* y.output

test: a.out
	./a.out <ass5_roll_test1.c> ass5_roll_quads1.out
	