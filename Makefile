CC=gcc
AS=nasm
ASFLAGS=-f elf64 -g  
CFLAGS=-Wall -g -O0     
LDFLAGS=

all: gt

gt: main.o switch.o
	$(CC) $(LDFLAGS) -o gt main.o switch.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

switch.o: switch.s
	$(AS) $(ASFLAGS) -o switch.o switch.s

clean:
	rm -f *.o main

dump-asm: main.c
	$(CC) $(CFLAGS) -S main.c -o main.s
