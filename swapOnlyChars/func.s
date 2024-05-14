section .text
global swapOnlyChars

; remove last sequence of numbers
swapOnlyChars:
    ; prologue
    push ebp
    mov  ebp, esp
    push ebx
    push esi
    push edi

    mov eax, [ebp + 8]
    mov ebx, eax

goto_end:
    mov cl, [ebx]
    test cl, cl
    jz  adjust_ptr
    inc ebx
    jmp goto_end

adjust_ptr:
    dec ebx

find_first_char:
    cmp eax, ebx
    jge  end
    mov cl, [eax]
    test cl, cl
    jz end
    cmp cl, 'a'
    jb  check_if_upper_begin
    cmp cl, 'z'
    ja  not_char_begin

find_second_char:
    mov ch, [ebx]
    cmp ch, 'a'
    jb  check_if_upper_end
    cmp ch, 'z'
    ja  not_char_end

swap:
    mov cl, [eax]
    mov ch, [ebx]
    mov [ebx], cl
    mov [eax], ch
    inc eax
    dec ebx
    jmp find_first_char

check_if_upper_begin:
    cmp cl, 'A'
    jb  not_char_begin
    cmp cl, 'Z'
    ja  not_char_begin
    jmp find_second_char

check_if_upper_end:
    cmp ch, 'A'
    jb  not_char_end
    cmp ch, 'Z'
    ja  not_char_end
    ; swap
    mov [ebx], ch
    mov [eax], cl
    inc eax
    dec ebx
    jmp find_first_char

not_char_begin:
    inc eax
    jmp find_first_char

not_char_end:
    dec ebx
    jmp find_second_char

end:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret