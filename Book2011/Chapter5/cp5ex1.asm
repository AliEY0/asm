global _start


section .data
    int1: dd 12
    int2: dd 0xAAFF
    int3: dd 0XFF
    int4: dd 0XFF



section .text
    _start:
    add eax, [int1]
    add eax, [int2]
    add eax, [int3]
    add eax, [int4]
    
    mov ebx, 0
    mov eax, 1
    int 0x80

