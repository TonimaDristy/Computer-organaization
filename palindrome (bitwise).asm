
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
    num      db 10011001b
    reversed db 0
    flag     db 0       ; 1 = palindrome

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num
    mov bl, 0
    mov cx, 8
    clc

rev_loop:
    rcr al, 1
    rcl bl, 1
    loop rev_loop

    cmp bl, num
    jne not_pal

    mov flag, 1
    jmp exit

not_pal:
    mov flag, 0

exit:
    mov ah, 4Ch
    int 21h
main endp
end main


ret




