



section .data
    msg1 db "Hoeveel users: ", 0
    frmS db "%s", 0

section .text
    global main
    extern printf


main:
    push msg1
    call printf
    add esp, 4


    xor eax, eax
    ret





