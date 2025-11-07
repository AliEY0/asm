


section .bss
    val1 resd 1

section .data
    strI db "Hoeveel getallen wilt u: ", 0
    nwln db 10, 0
    strD db "%d ;", 10, 0
    frmD db "%d",0
    
    aptr dd 0


section .text
    global main
    extern scanf
    extern printf
    extern malloc

fill:
    push ebp
    mov ebp, esp
    xor edx, edx
    xor ebx, ebx

    mov edx, [ebp + 12]
    mov ebx, [ebp + 8]
    xor ecx, ecx
    ;jmp loop
loop:   
    cmp ecx, ebx
    je fini
    mov eax, 123321
    mov [edx + ecx * 4], eax
    inc ecx
    jmp loop
    
fini:
    mov esp, ebp
    pop ebp
    ret

test:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8] 

printarr:
    push ebp
    mov ebp, esp
    xor ecx, ecx
    mov edx, [ebp + 12]
    mov ebx, [ebp + 8]
begin2:
    cmp ecx, ebx
    je fini
    push ecx
    push ebx
    push edx 
    mov esi, dword [edx + ecx * 4]
    push esi
    push strD
    call printf
    add esp, 8
    pop edx
    pop ebx
    pop ecx
    inc ecx
    jmp begin2


main:
    push strI
    call printf
    add esp, 4

    push val1
    push frmD
    call scanf
    add esp, 8

    push dword [val1]
    push frmD
    call printf
    add esp, 8


    mov eax, dword [val1]
    shl eax, 2 ; eax * 4 (int = 4bytes)
    
    push eax
    call malloc
    add esp, 4
    mov dword [aptr], eax
    nop
    nop
    push dword [aptr]
    push dword [val1]    
    call fill 
    add esp,8
    
    push nwln
    call printf
    add esp, 4

    
    push dword [aptr]
    push dword [val1]    
    call printarr 
    add esp,8
    

    ret

