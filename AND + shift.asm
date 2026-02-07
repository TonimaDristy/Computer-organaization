
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
    num  db 10101101b
    cnt  db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num
    mov cx, 8

bit_check:
    test al, 1
    jz skip
    inc cnt

skip:
    shr al, 1
    loop bit_check

    mov ah, 4Ch
    int 21h
main endp
end main

ret




