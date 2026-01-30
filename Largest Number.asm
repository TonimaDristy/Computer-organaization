
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
arr db 10, 25, 3, 40, 15
max db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, 0
    mov al, arr[si]
    mov max, al
    mov cx, 5

next:
    mov al, arr[si]
    cmp al, max
    jle skip
    mov max, al

skip:
    inc si
    loop next

    mov ah, 4Ch
    int 21h
main endp
end main


ret




