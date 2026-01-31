
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
    value   db 10110110b   ; original data
    count   db 4           ; number of rotations
    result  db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, value          ; load value
    mov cl, count          ; rotation count

rotate_again:
    ror al, 1              ; rotate right by 1 bit
    loop rotate_again      ; repeat CL times

    mov result, al         ; store result

    mov ah, 4Ch
    int 21h
main endp
end main


ret




