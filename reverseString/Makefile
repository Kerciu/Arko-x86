CC=gcc
CFLAGS=-m32 -Wextra -Wall

NASM_PATH = /mnt/c/Users/Kacper/AppData/Local/NASM/nasm.exe

all:	main.o func.o
	$(CC) $(CFLAGS) -o main main.o func.o

main.o:	main.c func.h
	$(CC) $(CFLAGS) -c main.c -L/mingw64/lib -lmsvcrt

func.o:	func.s
	$(NASM_PATH) -g -f elf32 func.s -o func.o

clean:
	rm -f *.o