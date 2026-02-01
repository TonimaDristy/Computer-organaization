
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
    choice db 2

.code
main:
    mov ax, @data
    mov ds, ax

    mov al, choice
    cmp al, 1
    je CASE1
    cmp al, 2
    je CASE2
    cmp al, 3
    je CASE3
    jmp DEFAULT

CASE1:
    mov bl, 11
    jmp EXIT

CASE2:
    mov bl, 22
    jmp EXIT

CASE3:
    mov bl, 33
    jmp EXIT

DEFAULT:
    mov bl, 0

EXIT:
    mov ah, 4Ch
    int 21h
end main


ret




