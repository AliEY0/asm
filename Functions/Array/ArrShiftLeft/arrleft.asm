
section .data
    arr dd 1, 2, 3, 4, 5
    len dd 5
    strD db "%d ", 0
    nwln db 10, 0

section .text
    global main
    extern printf

shftleft:
    push ebp
    mov ebp, esp
    xor ecx, ecx
    mov edx, [ebp + 8]
    dec dword [len]

begin:
    cmp ecx, [len] ;counter
    je fini
    mov eax, [edx + ecx * 4]
    inc ecx
    mov ebx, [edx + ecx * 4]
    dec ecx
    mov eax, ebx
    mov dword [edx + ecx * 4], eax
    inc ecx
    jmp begin
fini:
    mov eax, [len]
    ;eax
    mov dword [edx + eax* 4], 0
    ;inc dword [len]
    mov esp, ebp
    pop ebp
    ret



printarr:
    push ebp
    mov ebp, esp
    xor ecx, ecx
    mov edx, [ebp + 8]
begin2:
    cmp ecx, 5 
    je fini2
    
    push edx
    push ecx
    mov esi, dword[edx + ecx * 4]
    push esi
    push strD
    call printf
    add esp, 8
    pop ecx
    pop edx


    inc ecx
    jmp begin2

fini2:
    push nwln
    call printf
    add esp, 4
    mov esp, ebp
    pop ebp
    ret
main:
    push len
    push arr
    call shftleft
    add esp, 8

    xor ecx, ecx

    push arr
    call printarr
    add esp , 4
    xor ecx , ecx
    ret
