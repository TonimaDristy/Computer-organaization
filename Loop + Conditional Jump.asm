
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
    count db 5

.code
main:
    mov ax, @data
    mov ds, ax

    mov cl, count

LOOP_START:
    cmp cl, 0
    je DONE

    dec cl
    jmp LOOP_START

DONE:
    mov ah, 4Ch
    int 21h
end main


ret




