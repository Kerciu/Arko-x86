section .text
global bubbleSort

; Bubble sort

bubbleSort:
; prologue
    push    ebp
    mov     ebp, esp
    push    ebx


; body
    mov     eax, [ebp + 8]
    mov     edx, 0

count_len:
    mov     cl, [eax]
    cmp     cl, 0
    jz      outer_loop
    inc     edx
    inc     eax
    jmp     count_len

outer_loop:
    mov     eax, [ebp + 8]
    cmp     edx, 0
    jz      end
    dec     edx


inner_loop:
    mov     cl, [eax]
    mov     ebx, eax
    inc     ebx
    mov     ch, [ebx]
    cmp     ch, 0
    jz      outer_loop

    cmp cl, ch
    jl no_swap

    mov [eax], ch
    mov [ebx], cl

no_swap:
    inc     eax
    jmp     inner_loop

end:
    pop ebx
    mov     esp, ebp
    pop     ebp
    ret
