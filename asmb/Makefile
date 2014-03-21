cc	=	cc	# clang oder gcc

CFLAGS	=	-ansi -pedantic -Wall -D_BSD_SOURCE -g
CFLAGS	+=	-Wno-trigraphs

LDFLAGS	=	
ASFLAGS	=	

PRJ	=	asmb
CONV	=	
OBJS	=	$(PRJ).o

all: $(PRJ).o

$(PRJ).o: $(PRJ).s
	$(CC) $(CFLAGS) -c $(PRJ).s

clean:
	-rm -f $(OBJS) *~ 



