
section .bss
    strIn resb 200 ;max lengte 200 char

section .data
    strT db "Dit is een test string", 0
    strInvoer db "Voer een string in: ", 0
    frmS db "%s", 0
    strAns db "De lengte van uw string is: %d",10, 0
    strGeeks db "%[^\n]%*c", 0
    nwln db 10, 0


section .text
    global main
    extern printf
    extern scanf
    extern fgets
    extern stdin

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
    
    push strInvoer
    call printf
    add esp, 4

    ;https://www.geeksforgeeks.org/c/taking-string-input-space-c-3-different-methods/    
    push dword [stdin]
    push dword 255
    push dword strIn
    call fgets
    add esp, 12

    push strIn
    push frmS
    call printf
    add esp, 8
        

    push dword strIn
    call slen
    add esp, 4

    dec eax ;verwijdr nwline tel van teller
    push eax
    push strAns
    call printf
    add esp, 8
    

    ret
    
