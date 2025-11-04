

;Write an assembly language program to compute the distance squared
;between 2 points in the plane identified as 2 integer coordinates
;each, stored in memory.
;Remember the Pythagorean Theorem!

section .data
x1     dw 4
y1     dw 3
x2     dw 2
y2     dw 6
deltax dw 0
deltay dw 1
ans    dw 0

section .text
    global _start
    _start:
    mov ax, [x1]
    sub ax, [x2]
    mov [deltax], ax

    mov ax, [y1]
    sub ax, [y2]
    mov [deltay], ax

    mov ax, [deltax]
    imul ax               
    mov [ans], ax

    mov ax, [deltay]
    imul ax           
    add [ans], ax

    mov eax, 1
    xor ebx, ebx
    int 0x80

