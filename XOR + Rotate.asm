
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
    data db 01101001b
    key  db 10101010b

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, data
    xor al, key
    ror al, 3
    xor al, key

    mov data, al

    mov ah, 4Ch
    int 21h
main endp
end main


ret




