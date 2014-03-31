CC	=	gcc	# clang oder gcc
LEX = flex 

PRJ	=	scanner
OBJS	=	$(PRJ).o

all: $(PRJ).c $(PRJ).l
	$(CC) $(PRJ).c -o $(PRJ) -ll

$(PRJ).c: $(PRJ).l
	$(LEX) -t $(PRJ).l > $(PRJ).c

clean:
	-rm -f $(PRJ).c $(PRJ) 



