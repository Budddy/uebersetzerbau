all:
	bison -d parser.y
	gcc -c parser.tab.c
	flex -t scanner.l > scanner.c
	gcc -c scanner.c
	gcc -o parser scanner.o parser.tab.o -lfl

clean:
	-rm -f parser scanner *.o *.h *.c