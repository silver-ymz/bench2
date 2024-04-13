CC=clang-17
CFLAGS=-Wall -O3 -march=armv8-a+sve -fopenmp

all: main lib.s main.s

lib.o: lib.c
	$(CC) $(CFLAGS) -c -o lib.o lib.c

main: main.c lib.o
	$(CC) $(CFLAGS) -o main main.c lib.o

lib.s: lib.c
	$(CC) $(CFLAGS) -S -o lib.s lib.c

main.s: main.c
	$(CC) $(CFLAGS) -S -o main.s main.c

clean:
	rm -f main main.o lib.o lib.s main.s
