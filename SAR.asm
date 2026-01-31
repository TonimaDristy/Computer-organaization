
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
    num db 10010110b     ; negative number

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num
    mov cl, 3

shift_again:
    sar al, 1
    loop shift_again

    mov num, al

    mov ah, 4Ch
    int 21h
main endp
end main


ret




