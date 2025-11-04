;Write an assembly program to sort an array of double words using
;bubble sort . Bubble sort is defined as

section .data
    lenArr equ 5
    arr dd 5, 4, 3, 2, 1
    temp dw 0


section .text
    global _start

_start:
    mov ecx, -1 ;counter i
    jmp loop_i

loop_i:
    inc ecx
    inc ecx
    mov edx, ecx ;countier j
    dec ecx
    cmp ecx, lenArr - 1
    je debuginit
        
loop_j:
    cmp edx, lenArr
    je loop_i
    
    mov eax, [arr + ecx * 4] ;eax = arr[i]
    mov ebx, [arr + edx * 4] ;ebx = arr[j]
    
    cmp ebx, eax
    jl change_val ;als arr[j] < arr[i]
    inc edx
    jmp loop_j

change_val:
    mov dword [temp], eax
    mov dword [arr + ecx * 4], ebx
    mov dword [arr + edx * 4], eax
    inc edx
    jmp loop_j

debuginit:
    mov edx, 0
    jmp debug
debug:
    cmp edx, lenArr
    je end_prog
    ;mov eax, [arr + edx * 4]
    ;inc edx
    jmp show_eax ;debug
show_eax:
    mov eax, [arr + edx * 4]
    jmp inc_edx
inc_edx:
    inc edx
    jmp debug

end_prog:
    mov eax, 1
    xor ebx, ebx
    int 0x80









