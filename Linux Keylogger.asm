
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

section .bss
    buf resb 1

section .text
global _start

_start:
.loop:
    mov rax, 0
    mov rdi, 0
    lea rsi, [buf]
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, [buf]
    mov rdx, 1
    syscall

    jmp .loop


ret




