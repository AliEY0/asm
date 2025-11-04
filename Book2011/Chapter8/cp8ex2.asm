;Write an assembly program to compute Fibonacci numbers stor
;ing all the computed Fibonacci numbers in a quad-word array in
;memory. Fibonacci numbers are defined by
;fib(O) = 0
;fib{l) = 1
;fib (i) = fib(i - 1) + fib(i - 2) for i > 1
;What is the largest i for which you can compute fib(i)?




section .data
    lenArr equ 10
    arr dd lenArr dup(0)
    ind dd 0



section .text
    global _start

_start:
    xor edx, edx
    xor ecx, ecx
    mov dword [arr + 0 * 4], 0
    mov dword [arr + 1* 4], 1
    mov ecx, 2
    jmp _start2

_start2:
    cmp ecx, lenArr
    je debug
    xor eax, eax
    add eax, [arr + ecx* 4 - 4]
    add eax, [arr + ecx* 4 - 8]
    mov [arr + ecx * 4], eax
    inc ecx
    jmp _start2


debug:
    cmp edx, lenArr
    je end_prog
    mov eax, [arr + edx * 4] 
    inc edx 
    jmp debug

end_prog:
    mov ebx, 0
    mov eax, 1
    int 0x80



