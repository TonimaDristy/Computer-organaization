org 100h

.model small
.stack 100h

.data
    val   db 11010101b
    zeros db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, val
    mov cl, 8
    xor bl, bl

count_zero:
    shr al,1
    jnc add_zero
    jmp skip

add_zero:
    inc bl

skip:
    loop count_zero

    mov zeros, bl

    mov ah,4Ch
    int 21h
main endp
end main