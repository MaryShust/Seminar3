lib.o: lib.asm
	nasm -f elf64 -o lib.o lib.asm

main.o: main.asm
	nasm -f elf64 -o main.o main.asm

program: lib.o main.o
	ld -o program lib.o main.o
