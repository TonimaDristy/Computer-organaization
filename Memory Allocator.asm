
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; malloc.asm
; nasm -f elf64 malloc.asm && ld malloc.o -o malloc

section .data
    heap_end dq 0

section .text
global _start

_start:
    call init_heap

    mov rdi, 64
    call my_malloc
    mov rbx, rax

    mov rax, 60
    xor rdi, rdi
    syscall

init_heap:
    mov rax, 12
    xor rdi, rdi
    syscall
    mov [heap_end], rax
    ret

my_malloc:
    mov rbx, [heap_end]
    add rbx, rdi

    mov rax, 12
    mov rdi, rbx
    syscall

    mov rcx, [heap_end]
    mov [heap_end], rbx

    mov rax, rcx
    ret


ret




