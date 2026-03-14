
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
    high db 10101010b
    low  db 11001100b

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, high
    mov al, low

    mov cl, 3

rotate16:
    rol ax, 1
    loop rotate16

    mov high, ah
    mov low, al

    mov ah, 4Ch
    int 21h
main endp
end main


ret




