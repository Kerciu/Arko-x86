    section .text
    global reversedig

reversedig:
    ; prologue
    push ebp
    mov  ebp, esp
    push ebx
    push edi
    push esi

    ; body
    mov eax, [ebp + 8]
    mov ebx, eax

    ; make sure string is not empty
    mov cl, [eax]
    test cl, cl
    jz end

    ; count string length and put pointer at the end
count:
    mov cl, [ebx]
    test cl, cl
    jz adjust_ptrs
    inc ebx
    jmp count

adjust_ptrs:
    dec ebx

find_first_char:
    cmp eax, ebx
    jge end
    mov cl, [eax]
    cmp cl, '0'
    jb  no_first_char_found
    cmp cl, '9'
    ja  no_first_char_found
    jmp find_second_char

no_first_char_found:
    inc eax
    jmp find_first_char

find_second_char:
    cmp eax, ebx
    jge end
    mov ch, [ebx]
    cmp ch, '0'
    jb  no_second_char_found
    cmp cl, '9'
    ja  no_second_char_found
    jmp swap

no_second_char_found:
    dec ebx
    jmp find_second_char

swap:
    mov cl, [eax]
    mov ch, [ebx]
    cmp cl, '0'
    jb  char_swap_situation
    cmp cl, '9'
    ja  char_swap_situation
    cmp ch, '0'
    jb char_swap_situation
    cmp ch, '9'
    ja char_swap_situation
    mov [eax], ch
    mov [ebx], cl
    inc eax
    dec ebx
    jmp find_first_char

char_swap_situation:
    inc eax
    dec ebx
    jmp find_first_char

end:
    ; epilogue
    pop esi
    pop edi
    pop ebx
    pop ebp
    ret