
section .bss
    val1 resd 1

section .data
    strN db "Geef een getal en ik zal kijken of het even is: ", 0
    strEven db "Uw getal %d is even", 10, 0
    strOdd db "Uw getal %d is oneven", 10, 0

    frmD db "%d", 0
section .text
    global main
    extern scanf
    extern printf


check:
    push ebp
    mov ebp, esp
    mov eax, dword [val1]
    and eax, 1
    ;mov eax, [val1]
    
    mov esp, ebp
    pop ebp
    ret

isEven:
    push ebp
    mov ebp, esp
    
    push dword [val1]
    push strEven
    call printf
    add esp, 8
    
    mov esp, ebp
    pop ebp
    ret
    ;jmp end_prog

isOdd:
    push ebp
    mov ebp, esp
    push dword [val1]
    push strOdd
    call printf
    add esp, 8
    ;jmp end_prog
    mov esp, ebp
    pop ebp
    ret

end_prog:
    
main:
    

    push strN
    call printf
    add esp, 4
    push val1
    push frmD
    call scanf
    add esp, 8

    call check
    
    cmp eax, 0
    je isEven
    jmp isOdd

    ret


