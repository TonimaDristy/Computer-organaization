
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
    num1 db 09h
    num2 db 04h
    result db ?
.code
main:
    mov ax, @data
    mov ds, ax

    mov al, num1
    sub al, num2
    mov result, al

    mov ah, 4ch
    int 21h
end main


ret




