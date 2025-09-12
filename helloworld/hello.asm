section .data
	text1 db "Hello World!", 10

global _start

section .text

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, text1
	mov rdx, 13
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
