org 100h

.model small
.stack 100h

.data
    num db 10101100b
    zeros db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num
    mov cl, 8
    xor bl, bl

count_loop:
    shl al, 1
    jc skip
    inc bl

skip:
    loop count_loop

    mov zeros, bl

    mov ah, 4Ch
    int 21h
main endp
end main