
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
num db 5
fact dw 1

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cl, num
    mov ax, 1

factorial:
    mul cl
    dec cl
    jnz factorial

    mov fact, ax

    mov ah, 4Ch
    int 21h
main endp
end main


ret




