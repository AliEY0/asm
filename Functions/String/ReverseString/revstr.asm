

section .bss
    strIn resb 200
    strCc resb 200
section .data
    strOriginal db "Geef een string: ", 0
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
startRev:
    push ebp
    mov ebp, esp
    xor ecx, 2 ;int i
    xor edx, edx ;int j
midRev:
    cmp ecx, -1
    je fini
    mov ebx, [strIn 
    


main:
    push strOriginal
    call printf
    add esp, 4

    ;https://www.geeksforgeeks.org/c/taking-string-input-space-c-3-different-methods/    
    push dword [stdin]
    push dword 200
    push dword strIn
    call fgets
    add esp, 12

    push dword strIn
    call slen
    add esp, 4










    ret

       
