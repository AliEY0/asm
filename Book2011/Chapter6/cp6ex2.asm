;If we could do floating point division, this exercise would have you
;compute the slope of the line segment connecting 2 points. Instead
;you are to store the difference in x coordinates in 1 memory location
;and the difference in y coordinates in another. The input points are
;integers stored in memory. Leave register rax with the value 1 if
;the line segment it vertical (infinite or undefined slope) and 0 if it
;is not. You should use a conditional move to set the value of rax.

section .data
    x1 dq 0
    x2 dq 0
    y1 dq 0
    y2 dq 0
    


section .text
global _start
_start:
    mov rax, 0
    mov qword [x1], 3
    mov qword [x2], 3
    mov qword [y1], 4
    mov qword [y2], 8
    
    mov rbx, [x1]
    mov rcx, [x2]

    sub rbx, rcx
    

    
    cmp rbx, rbx
    je _setone
    
_setone:
    mov rax, 1
    jmp end_prog   

end_prog:
    mov eax, 1         
    xor ebx, ebx
    int 0x80   
    
    





