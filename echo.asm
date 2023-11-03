	; Echo implemented in x64 Assembly.
	; To assemble and run:
	;
	; nasm - f elf64 echo.asm && ld - nostdlib - s echo.o && . / a.out

global _start

section .bss
	buffer resb 3200 ; create 3200 bits ( 400 bytes ) memory on stack.

section .text
_start:

	; reading
	mov rax, 0                   ; set SYS_READ as SYS_CALL
	mov rdi, 0                   ; stdin as the file descriptor.
	mov rsi, buffer              ; store it in buffer memory.
	mov rdx, 3200                ; size of the input.
	syscall                      ; invoke syscall
	
	; writing
	mov rax, 1                   ; set SYS_WRITE as SYS_CALL
	mov rdi, 1                   ; stdout as the file descriptor.
	mov rsi, buffer              ; buffer to write.
	mov rdx, 3200                ; size of buffer to write.
	syscall                      ; invoke syscall
	
	; exiting
	mov rax, 60                  ; set SYS_EXIT as SYS_CALL
	mov rdi, 0                   ; exit code 0
	syscall                      ; invoke syscall
