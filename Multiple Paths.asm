
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
                    .model small
.stack 100h
.data
    num db 7
    msg1 db 'Number is ZERO$'
    msg2 db 'Number is POSITIVE$'
    msg3 db 'Number is NEGATIVE$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov al, num
    cmp al, 0
    je ZERO
    jl NEGATIVE
    jg POSITIVE

ZERO:
    mov dx, offset msg1
    jmp PRINT

NEGATIVE:
    mov dx, offset msg3
    jmp PRINT

POSITIVE:
    mov dx, offset msg2

PRINT:
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
end main


ret




