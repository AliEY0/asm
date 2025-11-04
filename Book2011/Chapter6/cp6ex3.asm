
;Write an assembly language program to compute the average of 4
;grades. Use memory locations for the 4 grades. Make the grades all
;different numbers from 0 to 100. Store the average of the 4 grades in
;memory and also store the remainder from the division in memory.


section .data
    derest dw 0
    quotient dw 0
    val1 dw 100
    val2 dw 100
    val3 dw 100
    val4 dw 100

section .text
    global _start
_start:
    xor ax, ax 
    xor dx, dx
    mov  ax, [val1]

    

    add ax, [val2]
    add ax, [val3]
    add ax, [val4]
    mov bx, 6
    div bx 

    mov [quotient], ax
    mov [derest], dx

    mov eax, 1
    xor ebx, ebx
    int 0x80





