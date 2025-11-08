section .bss
    valN resd 1


section .data
    strIn db "Voer een getal in: ", 0
    nwln db 10, 0
    frmD db "%d", 0
    strPrime db "%d is een priemgetal", 10, 0
    strNotPrime db "%d is niet een priemgetal", 10, 0
    


section .text
    global main
    extern printf
    extern scanf

isPrime:
    push ebp
    mov ebp, esp
    mov ebx, [ebp + 8]
    mov ecx, 2
    cmp ebx, 2
    je found
    cmp ebx, 2
    jl fini
check:

    xor edx, edx
    mov eax, ebx
    div ecx
    cmp edx, 0
    je fini
    
    inc ecx
    xor eax, eax
    xor edx, edx
    mov eax, ecx
    mul eax
    
    mov edx, 123321
    cmp eax, ebx
    jg found
    jmp check

found:
    push dword [valN]
    push strPrime
    call printf
    add esp, 8
    mov esp, ebp
    pop ebp
    ret

fini:
    push dword [valN]
    push strNotPrime
    call printf
    mov esp, ebp
    pop ebp
    ret

main:
    
    push strIn
    call printf
    add esp, 4

    push valN
    push frmD
    call scanf
    add esp, 8


    push nwln
    call printf
    add esp, 4

    push dword [valN]
    push frmD
    call printf
    add esp, 8

    
    push nwln
    call printf
    add esp, 4

    push dword [valN]
    call isPrime
    add esp, 4
    
    ret

    


