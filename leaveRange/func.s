section .text
global leaveRange

; remove last sequence of numbers
leaveRange:
    ; prologue
    push ebp
    mov  ebp, esp
    push ebx
    push esi
    push edi

    mov eax, [ebp + 8]
    mov dl, [ebp + 12]  ; a
    mov ch, [ebp + 16]  ; b

    cmp dl, ch
    ja  end

    cmp byte[eax], 0
    jz  end

begin:
    mov cl, [eax]
    test cl, cl
    jz  end

    mov esi, eax
    cmp cl, dl
    jb  delete
    cmp cl, ch
    ja  delete

    inc eax
    jmp begin

delete:
    inc esi
    mov cl, [esi]
    dec esi
    mov [esi], cl
    inc esi
    mov cl, [esi]
    test cl, cl
    jnz delete

    jmp begin

end:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret