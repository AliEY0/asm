;Write an assembly program to compute the dot product of 2 arrays,
;I .e. n - 1
;p = L ai * bi
;i=O

;Your arrays should be double word arrays in memory and the dot
;product should be stored in memory.


section .data
    arrA dd 1, 2, 3, 4, 5
    arrB dd 1, 2, 3, 4, 5
    ans dd 0
    som dd 0
    ind dd 0
section .text
    global _start
    
    

_start:
    
    cmp dword [ind], 5
    je end_prog
    mov ecx, [ind]
    
    mov eax, [arrA + ecx * 4] 
    mov ebx, [arrB + ecx * 4] 
    mul ebx
    add dword [ans], eax
    inc dword [ind]
    jmp _start
    
end_prog:
    xor eax, eax
    mov eax, [ans]
    
    mov ebx, 0
    mov eax, 1
    int 0x80

