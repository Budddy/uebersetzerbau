all:
	bison -d parser.y > parser.c
	gcc -c parser.c
	flex -t scanner.l > scanner.c
	gcc -c scanner.c
	gcc -o parser scanner.o parser.o -lfl

clean:
	-rm -f parser scanner *.o *.h *.c