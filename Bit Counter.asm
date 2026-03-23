org 100h

.model small
.stack 100h

.data
    num db 25
    result db 0

.code
main proc
    mov ax,@data
    mov ds,ax

    mov al,num
    and al,1

    cmp al,0
    jne odd

even:
    mov result,0
    jmp finish

odd:
    mov result,1

finish:
    mov ah,4Ch
    int 21h
main endp
end main