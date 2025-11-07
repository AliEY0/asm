

section .data
    strT db "Dit is een test string", 0
    strAns db "De lengte van uw string is: %d",10, 0
    nwln db 10, 0


section .text
    global main
    extern printf


slen:
    push ebp
    mov ebp, esp
    xor ebx, ebx
    mov ebx, [ebp + 8]
    xor eax, eax
tel:
    cmp byte [ebx + eax], 0
    je fini
    inc eax
    jmp tel

fini:
    mov esp, ebp
    pop ebp
    ret
    


main:
    
    push strT
    call printf
    add esp, 4
    
    push nwln
    call printf
    add esp, 4



    push strT
    call slen
    add esp, 4
    
    push eax
    push strAns
    call printf
    add esp, 8
    

    ret
    
