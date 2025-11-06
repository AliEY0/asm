

section .data
    strAns db "Grootste getal in je array is: %d", 10, 0
    arr dd 1, 3,-3,-5,-52 8, 22, 2, 39, 31, 293, 2227, 3333



section .text
    global main
    extern printf


maxval:
    push ebp
    mov ebp, esp
    mov edx, [ebp + 8]
    xor ecx, ecx
    xor eax, eax
checkval:
    cmp ecx, 13
    je fini
    cmp [edx + ecx * 4], eax
    jl changeval
    inc ecx
    jmp checkval

changeval:
    mov eax, [edx + ecx * 4]
    inc ecx
    jmp checkval
    
fini:
    mov esp, ebp
    pop ebp
    ret

main:
    push arr
    call maxval
    add esp, 4

    push eax
    push strAns
    call printf
    add esp, 8
    ret
