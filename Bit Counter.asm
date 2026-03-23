org 100h

.model small
.stack 100h

.data
    num db 10101110b
    count db 0

.code
main proc
    mov ax,@data
    mov ds,ax

    mov al,num
    mov cl,8
    xor bl,bl

check:
    ror al,1
    jc next
    inc bl

next:
    loop check

    mov count,bl

    mov ah,4Ch
    int 21h
main endp
end main