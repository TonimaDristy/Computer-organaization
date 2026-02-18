
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
    num db 04h
.code
main:
    mov ax, @data
    mov ds, ax

    mov al, num
    shl al, 1      ; multiply by 2

    mov ah, 4ch
    int 21h
end main


ret




