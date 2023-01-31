CC     = clang++

CFLAGS = -O3

OBJS   = main.o nnlist.o nnlist.hpp ran2.o ran2.hpp mt.o mt.hpp

NAME   = majvote

all  : $(NAME)

majvote : $(OBJS)
	$(CC) $(CFLAGS) main.cpp nnlist.cpp ran2.cpp mt.cpp -o $(NAME)

main.o: main.cpp nnlist.cpp nnlist.hpp ran2.hpp ran2.cpp mt.cpp
	$(CC) -c $(CFLAGS) main.cpp

nnlist.o: nnlist.cpp 
	$(CC) -c $(CFLAGS) nnlist.cpp

ran2.o: ran2.cpp
	$(CC) -c $(CFLAGS) ran2.cpp

mt.o: mt.cpp
	$(CC) -c $(CFLAGS) mt.cpp	

#========================================================

all : 
	@echo "*******************************************"
	@echo "*     Compiling -- Majority vote model    *" 
	@echo "*******************************************"

clean:
	rm -f *.gch
	rm -f *.o
	rm -f $(NAME)

