


section .bss
    val1 resd 1


section .data
    strSum db "Geef een getal: ", 0
    strAns db "1 + 2 + .. + %d + %d = %d",10, 0
    frmD db "%d", 0
    copyval dd 0
   
section .text
    global main
    extern scanf
    extern printf


finito:
    mov esp, ebp
    pop ebp
    ret

sigma:
    push ebp
    mov ebp, esp
    
    funcsum:
        add eax, [val1]
        dec dword [val1]
        cmp dword [val1], 0
        je finito
        jmp funcsum

    mov esp, ebp
    pop ebp
    ret
main:
    
    push strSum
    call printf
    add esp, 4


    push val1
    push frmD
    call scanf
    add esp, 8
    
    mov eax, dword [val1]
    mov dword [copyval], eax
    xor eax, eax
    call sigma
    
    push eax
    push dword [copyval]
    dec dword [copyval]
    push dword [copyval]
    push strAns
    call printf
    add esp, 16

    ret









