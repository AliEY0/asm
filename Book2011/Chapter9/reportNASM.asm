

section .bss
    num1 resd 1

section .data
    msg1 db "Hoeveel users: ", 0
    frmS db "%s", 0
    frmD db "%d", 0
    nwln db 10, 0    
section .text
    global main
    extern printf
    extern scanf

main:
    push msg1
    call printf
    add esp, 4

    push num1
    push frmD
    call scanf
    add esp, 8


    push dword [num1]
    push frmD
    call printf
    add esp, 8


    push nwln 
    call printf
    
    add esp, 4

    xor eax, eax
    ret





