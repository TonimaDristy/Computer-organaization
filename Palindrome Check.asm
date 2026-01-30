
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
str db "LEVEL$"
len db 5
flag db 1

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, 0
    mov di, len
    dec di

check:
    mov al, str[si]
    mov bl, str[di]
    cmp al, bl
    jne not_pal

    inc si
    dec di
    cmp si, di
    jl check
    jmp exit

not_pal:
    mov flag, 0

exit:
    mov ah, 4Ch
    int 21h
main endp
end main


ret




