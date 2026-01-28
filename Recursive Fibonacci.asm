
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here

ret




          ; fib.asm
; nasm -f elf64 fib.asm && ld fib.o -o fib

section .data
    n       dq 40
    memo    times 100 dq -1
    msg     db "Fibonacci = ", 0

section .text
global _start

_start:
    mov rdi, [n]
    call fib

    mov rbx, rax

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall

fib:
    push rbp
    mov rbp, rsp

    cmp rdi, 1
    jbe .base

    mov rbx, rdi
    mov rax, [memo + rdi*8]
    cmp rax, -1
    jne .done

    dec rdi
    call fib
    push rax

    mov rdi, rbx
    sub rdi, 2
    call fib

    pop rcx
    add rax, rcx

    mov [memo + rbx*8], rax
    jmp .done

.base:
    mov rax, rdi

.done:
    pop rbp
    ret
