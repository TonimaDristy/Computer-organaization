.model small
.stack 100h

.data
    val db 10110011b
    cnt db 5

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, val
    mov cl, cnt
    clc                 ; clear carry

rcr_loop:
    rcr al, 1
    loop rcr_loop

    mov val, al

    mov ah, 4Ch
    int 21h
main endp
end main
