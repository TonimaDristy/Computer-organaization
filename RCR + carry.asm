
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
    num     db 11010010b
    result  db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num
    mov bl, 0
    mov cx, 8
    clc

reverse_loop:
    rcr al, 1          ; LSB ? Carry
    rcl bl, 1          ; Carry ? MSB of BL
    loop reverse_loop

    mov result, bl

    mov ah, 4Ch
    int 21h
main endp
end main


ret




