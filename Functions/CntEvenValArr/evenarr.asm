


section .data
    arr dd 2,2,2,1, 2, 3, 4, 5, 6, 7, 8
    strAns db "Er zijn %d even getallen in je array", 10, 0
    frmD db "%d", 0
    



section .text
    global main
    extern printf


begintellen:
    push ebp
    mov ebp, esp
    xor eax, eax
    xor ecx, ecx
tel:
    cmp ecx, 11
    je fini
    mov ebx, [arr + ecx * 4]
    and ebx, 1
    cmp ebx, 0
    je addeax
    inc ecx
    jmp tel

addeax:
    inc eax
    inc ecx
    jmp tel

fini:
    mov esp, ebp
    pop ebp
    ret


main:


    push arr
    call begintellen
    add esp, 4
    
    push eax
    push strAns
    call printf
    add esp, 8


    ret
