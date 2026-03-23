org 100h

.model small
.stack 100h

.data
    val db 10111001b
    ones db 0

.code
main proc
    mov ax,@data
    mov ds,ax

    mov al,val
    mov cl,8
    xor bl,bl

check_bit:
    test al,1
    jz skip
    inc bl

skip:
    shr al,1
    loop check_bit

    mov ones,bl

    mov ah,4Ch
    int 21h
main endp
end main