org 100h

.model small
.stack 100h

.data
    num db 11010010b
    rev db 0

.code
main proc
    mov ax,@data
    mov ds,ax

    mov al,num
    mov cl,8
    xor bl,bl

reverse:
    shl bl,1
    shr al,1
    adc bl,0
    loop reverse

    mov rev,bl

    mov ah,4Ch
    int 21h
main endp
end main