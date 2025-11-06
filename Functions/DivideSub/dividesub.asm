


section .bss
    valA resd 1
    valB resd 2




section .data
    strAns db "A mod B = %d", 10, 0 
    strVal db "Geef de waarde van %c: ", 0
    ;strB db "Geef de waarde van B: ", 0
    frmD db "%d", 0
    strPV db "A = %d; B = %d", 10, 0
section .text
    global main
    extern scanf
    extern printf
modsub:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp + 8]  ;eax = valA
    mov ebx, [ebp + 12] ;ebx = valB
    xor ecx, ecx
test:
   
    cmp eax, ebx
    jl fini
    sub eax, ebx
    inc ecx
    jmp test

fini:
    xor eax, eax
    mov eax, ecx
    mov esp,ebp
    pop ebp
    ret

main:

    push 0x41
    push strVal
    call printf
    add esp, 8
    
    push valA
    push frmD
    call scanf
    add esp, 8

    push 0x42
    push strVal
    call printf
    add esp, 8
    
    push valB
    push frmD
    call scanf
    add esp, 8


    push dword [valB]
    push dword [valA]
    push strPV
    call printf
    add esp, 12
    
    xor eax, eax
    push dword [valB]
    push dword [valA]
    call modsub
    add esp, 8

    push eax
    push strAns
    call printf
    add esp, 8






    ret
