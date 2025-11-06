


section .bss
    valN resd 1
section .data
    strI db "Geef een getal: ", 0
    strAG db "Array getal %d: ", 0
    strSum db "Som getallen van array = %d: ",10, 0
    
    frmD db "%d", 0
    cpVal dd 0
    ptrarr dd 0
    cpptrarr dd 0


section .text
    global main
    extern printf
    extern scanf
    extern malloc

addsum:
    push ebp
    mov ebp, esp
    xor eax, eax
    xor ecx, ecx
    jmp test
    mov esp, ebp
    pop ebp
    ret
    
fini:
    push eax
    push strSum
    call printf
    add esp, 8
    mov esp, ebp
    pop ebp
    ret
test:
    cmp ecx, dword [valN]
    je fini
    add eax, [ptrarr + ecx * 4]
    inc ecx
    jmp test 
main:
    push strI
    call printf
    add esp, 4
    

    push valN
    push frmD
    call scanf
    add esp, 8
    
    mov eax, dword [valN]
    mov dword [cpVal], eax
    xor eax, eax
    mov eax, dword [valN]
    shl eax, 2 ; shift left 2 is gwn verdubbel verdubbel (eax * 4) 
    push eax
    ;push frmD
    ;call printf
    call malloc
    mov [ptrarr], eax
    mov [cpptrarr], eax
    ;add esp, 8
    add esp, 4
    mov ebx, 0
    mov ecx, 0
    fillarray:
        cmp ebx, dword [valN]
        je finished
        inc ecx
        inc ebx
        push ebx
        push strAG
        call printf
        add esp, 8
        dec ebx
        ;dec ecx
        mov eax, [ptrarr]
        add eax, 4
        mov [ptrarr], eax
        push ptrarr
        push frmD
        call scanf
        add esp, 8
        inc ebx
        jmp fillarray
    finished:
        mov eax, [cpptrarr]
        mov [ptrarr], eax
        ret
        ;push dword [valN]
        ;push ptrarr
        ;call addsum
        ;add esp, 8
    
        ;mov esp, ebp
        ;pop ebp
        ;ret
    

    ret    
