section .text
global strreverse

    ; reverse string
strreverse:
    ; prologue
    push ebp
    mov  ebp, esp
    push ebx

    ; body
    mov eax, [ebp + 8]
    mov ebx, eax

find_end:
    mov cl, [ebx]
    cmp cl, 0
    jz  correct_ptr
    inc ebx
    jmp find_end

correct_ptr:
    dec ebx

swap:
    cmp eax, ebx
    jge end
    mov ch, [eax]
    mov cl, [ebx]
    mov [eax], cl
    mov [ebx], ch
    inc eax
    dec ebx
    jmp swap

end:
    pop ebx
    pop ebp
    ret