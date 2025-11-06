

section .data
    strAns db "Grootste getal in je array is: %d", 10, 0
    arr dd 1, 3, 8, 22, 2, 39, 31, 293, 2227, 3333



section .text
    global main
    extern printf


maxval:
    push ebp
    mov ebp, esp
    





