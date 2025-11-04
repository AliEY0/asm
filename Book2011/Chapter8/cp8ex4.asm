;Write an assembly program to determine if a string stored in memory 
;is a palindrome. A palindrome is a string which is the same after
;being reversed, like "refer" . Use at least one repeat instruction.



section .data
    woord db "apaxpa", 10, 0
    
    lptr dd 0
    rptr dd 6
    


section .text
    global _start

_start: 
    mov eax, dword [lptr]
    mov ebx, dword [rptr]
    dec ebx
    cmp eax, ebx
    jb wloop


wloop:
    mov cl, [woord + eax]
    mov ch, [woord + ebx]
    cmp eax, ebx
    jge juist
    cmp cl, ch
    jne fout
    inc eax
    dec ebx
    jmp wloop


juist:
    mov eax, 0xFF
    jmp end_prog

fout:
    mov eax, -1
    jmp end_prog


end_prog:

    nop
    nop
    mov ebx, 0
    mov eax, 1
    int 0x80

    
