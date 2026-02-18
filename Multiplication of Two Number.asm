
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
    num1 db 06h
    num2 db 02h
    result dw ?
.code
main:
    mov ax, @data
    mov ds, ax

    mov al, num1
    mov bl, num2
    mul bl
    mov result, ax

    mov ah, 4ch
    int 21h
end main

ret




