
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

section .data
    expr db "3+5*2+4",0

section .text
global _start

_start:
    lea rsi, [expr]
    call eval_expr

    mov rbx, rax

    mov rax, 60
    xor rdi, rdi
    syscall

eval_expr:
    xor rax, rax
    xor rbx, rbx

.next:
    mov bl, [rsi]
    cmp bl, 0
    je .done

    cmp bl, '+'
    je .plus

    cmp bl, '*'
    je .mul

    sub bl, '0'
    imul rax, 10
    add rax, rbx

    inc rsi
    jmp .next

.plus:
    push rax
    xor rax, rax
    inc rsi
    jmp .next

.mul:
    inc rsi
    mov bl, [rsi]
    sub bl, '0'
    imul rax, rbx
    inc rsi
    jmp .next

.done:
    ret


ret




