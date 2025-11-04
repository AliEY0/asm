

global _start



section .data
    een db 0xAA
    twee dw 0xAAAA
    vier dd 0xAAAAAAAA ;double word
    acht dq 0xAAAAAAAAAAAAAAAA
    antw dq 0

section .text
    _start:    
    movsx rax, byte [een]
    movsx rbx, word [twee]
    movsxd rcx, dword [vier]
    mov rdx,  [acht]

    add rax, rbx
    add rax, rcx
    add rax, rdx
    
    mov [antw], rax
    
    mov eax, 60
    mov edi, edi
    syscall

