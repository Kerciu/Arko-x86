section .text
global remLastNum

; remove last sequence of numbers
remLastNum:
    ; prologue
    push ebp
    mov  ebp, esp
    push ebx
    push esi
    push edi

    mov eax, [ebp + 8]
    mov ebx, eax

go_to_last_char:
    mov cl, [eax]
    test cl, cl
    jz  adjust_ptr
    inc eax
    jmp go_to_last_char

adjust_ptr:
    mov esi, eax
    dec eax

find_digit:
    cmp eax, ebx
    je  end
    mov cl, [eax]
    cmp cl, '0'
    jb  no_digit
    cmp cl, '9'
    ja  no_digit
    jmp cut_digit_sequence

no_digit:
    dec eax
    jmp find_digit

cut_digit_sequence:
    mov cl, [eax]          ; Find char behind last num of sequence
    cmp cl, '0'
    jb  cut_it
    cmp cl, '9'
    ja  cut_it
    dec eax
    jmp cut_digit_sequence

cut_it:
    inc eax
    mov esi, eax

delete:
    inc eax
    mov cl, [eax]
    dec eax
    mov [eax], cl
    inc eax
    mov cl, [eax]
    test cl, cl
    jnz delete

go_to_next_digit:
    mov eax, esi
    cmp byte[eax], '0'
    jb  end
    cmp byte[eax], '9'
    ja  end
    jmp delete

end:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret