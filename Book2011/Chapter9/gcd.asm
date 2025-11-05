section .data
    frmS db "%d", 0
section .text
    global main
    ;global gcd
    extern printf
gcd:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]

    cmp ebx, 0
    je equalZero
    
    mov ecx, ebx       
    cdq               
    idiv ecx     

    push edx           
    push ecx           
    call gcd
    
    add esp, 8         
    
    mov esp, ebp
    pop ebp
    ret
equalZero:
    mov eax, [ebp+8]
    mov esp, ebp
    pop ebp
    ret
main:

    push ebp
    mov ebp, esp
    
    mov eax, 12
    mov ebx, 24

    push eax
    push ebx
    call gcd
    
    push eax
    push frmS
    call printf

    add esp, 8


    mov esp, ebp
    pop ebp
    ret

