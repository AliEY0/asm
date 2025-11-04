;Write an assembly program to count all the 1 bits in a byte stored
;in memory. Use repeated code rather than a loop.

section .data
    val dw 127
    ans dw 0
section .text
    global _start

_start:
    mov ax, [val]
    cmp ax, 0
    je end_prog
    
    mov dx, ax          
    and dx, 1           
    jne add_bit

    shr word [val], 1

    ;sub word [val], 1
    jmp _start

add_bit:
    inc word [ans] 
    shr word [val], 1
    jmp _start


end_prog:
    mov bx, [ans]
    mov eax, 1
    xor ebx, ebx
    int 0x80



