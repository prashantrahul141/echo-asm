all: echo

echo: echo.asm
	nasm -f elf64 echo.asm
	ld -nostdlib echo.o -o echo.out

clean:
	rm echo.o echo.out

