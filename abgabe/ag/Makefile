all:
	ox parser.y scanner.l
	bison -d oxout.y > parser.c
	gcc -c parser.c
	flex -t oxout.l > scanner.c
	gcc -c scanner.c
	gcc -o parser scanner.o parser.o -lfl

clean:
	-rm -f parser scanner ag *.o *.h *.c