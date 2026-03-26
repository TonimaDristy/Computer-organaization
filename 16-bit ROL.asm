org 100h

.model small
.stack 100h

.data
    high db 00001111b
    low  db 11110000b

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, high
    mov al, low

    mov cl, 2

shift_left:
    shl ax, 1
    loop shift_left

    mov high, ah
    mov low, al

    mov ah, 4Ch
    int 21h
main endp
end main