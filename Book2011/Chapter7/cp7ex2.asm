;Write an assembly program to swap 2 quad-words in memory using
;xor. Use the following algorithm:
;a = a ^ b
;b = a ^ b
;a = a ^ b


section .data
    vA dq 0x00000000000000FF
    vB dq 0x00000000000000AA



section .text
    global _start
    

_start:
    ; zet waardes op nul van registers
    xor rax, rax
    xor rcx, rcx
    xor rdx, rdx

    mov rax, [vA]
    mov rbx, qword [vB]
    

    xor rax, rbx
    mov rcx, rax
    xor rcx, rbx
    mov rbx, rcx

    xor rax, rbx



    jmp end_prog

end_prog:
    mov eax, 60
    mov edi, edi
    syscall



