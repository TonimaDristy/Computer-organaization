
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
    num db 07h
    msg1 db "Even$"
    msg2 db "Odd$"
.code
main:
    mov ax, @data
    mov ds, ax

    mov al, num
    and al, 01h
    jz even

odd:
    lea dx, msg2
    mov ah, 09h
    int 21h
    jmp exit

even:
    lea dx, msg1
    mov ah, 09h
    int 21h

exit:
    mov ah, 4ch
    int 21h
end main


ret




