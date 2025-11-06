


section .bss
    val1 resd 1
    val2 resd 1

section .data
    strSum db "%d + %d = %d", 10, 0
    strA db "Geef waarde van a: ", 0
    strB db "Geef waarde van b: ", 0
    frmD db "%d", 0
    ansSum dd 0

section .text
    global main
    extern scanf
    extern printf

sum:
    push ebp
    mov  ebp, esp
    

    xor eax, eax
    mov eax, [val1]
    add eax, [val2]

    mov esp, ebp
    pop ebp
    ret

main:

    ;init van val1 (A)
    push strA
    call printf
    add esp, 4
    push val1
    push frmD
    call scanf
    add esp, 8

    ;init van val2 (B)
    push strB
    call printf
    add esp, 4
    push val2
    push frmD
    call scanf
    add esp, 8

    call sum
    
     
    mov dword [ansSum], eax
    
    push dword [ansSum]
    push dword [val2]
    push dword [val1]
    push strSum
    call printf
    add esp, 16
        


    ret
    
