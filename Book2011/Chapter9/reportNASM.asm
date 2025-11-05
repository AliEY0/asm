;TO BE CONTINUED (delusional)

section .bss
    num1 resd 1

section .data
    msg1 db "Hoeveel users: ", 0
    frmS db "%s", 0
    frmD db "%d", 0
    nwln db 10, 0    
    memptr dd 0


section .text
    global main
    extern printf
    extern scanf
    extern malloc



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

    
    mov eax, [num1]
    imul eax, 64
    push eax
    call malloc
    
    mov memptr, eax
    add esp, 4

    

    



    



    push dword [memptr]
    call free
    add esp, 4
    


    xor eax, eax
    ret





