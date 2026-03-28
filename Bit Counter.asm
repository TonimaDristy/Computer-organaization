org 100h

.model small
.stack 100h

.data
    num db 11010010b
    rev db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num
    mov cl, 8
    xor bl, bl

reverse_loop:
    shl bl, 1       ; make space in result
    shr al, 1       ; get LSB
    jnc skip
    inc bl

skip:
    loop reverse_loop

    mov rev, bl

    mov ah, 4Ch
    int 21h
main endp
end main