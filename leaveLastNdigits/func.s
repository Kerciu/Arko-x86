section .text
global leaveLastNdigits

; leave last n- digits
leaveLastNdigits:
    ; prologue
    push ebp
    mov  ebp, esp
    push ebx
    push esi
    push edi

    mov eax, [ebp + 8]
    mov edi, [ebp + 12]
    mov ebx, 0
    mov esi, eax
count_len:
    mov cl, [esi]
    test cl, cl
    jz  end_count
    inc esi
    inc ebx
    jmp count_len

end_count:
    sub ebx, edi

begin:
    mov cl, [eax]
    test cl, cl
    jz end
    test ebx, ebx
    jz end
    dec ebx

    mov esi, eax
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