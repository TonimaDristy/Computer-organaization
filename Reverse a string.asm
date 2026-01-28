
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; reverse.asm

section .data
    str db "AdvancedAssemblyProgramming", 0

section .text
global _start

_start:
    lea rsi, [str]
    mov rcx, 0

.find_len:
    cmp byte [rsi + rcx], 0
    je .got_len
    inc rcx
    jmp .find_len

.got_len:
    lea rdi, [str]
    lea rsi, [str + rcx - 1]

.loop:
    cmp rdi, rsi
    jge .done

    mov al, [rdi]
    mov bl, [rsi]

    mov [rdi], bl
    mov [rsi], al

    inc rdi
    dec rsi
    jmp .loop

.done:
    mov rax, 60
    xor rdi, rdi
    syscall


ret




