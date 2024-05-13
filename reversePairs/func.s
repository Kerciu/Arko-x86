section .text
global reversePairs

    ; reverse string
reversePairs:
    ; prologue
    push ebp
    mov  ebp, esp
    push ebx
    push esi
    push edi

    ; body
    mov eax, [ebp + 8]
    mov ebx, eax
    mov edx, 0
    mov esi, eax

    mov cl, [eax]
    test cl, cl
    jz end

goto_string_end:
    mov cl, [ebx]
    test cl, cl
    jz adjust_ptr
    inc ebx
    inc edx
    jmp goto_string_end

adjust_ptr:
    dec ebx
    sar edx, 1
    add esi, edx

swap:
    dec esi
    cmp eax, esi
    jge end
    add esi, 2
    cmp ebx, esi
    jle end
    dec esi

    dec ebx
    mov cl, [eax]
    mov ch, [ebx]
    mov [eax], ch
    mov [ebx], cl
    inc ebx
    inc eax
    mov cl, [eax]
    mov ch, [ebx]
    mov [eax], ch
    mov [ebx], cl
    inc eax
    sub ebx, 2
    jmp swap

end:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
