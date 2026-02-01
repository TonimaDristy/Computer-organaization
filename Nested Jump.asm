
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
    a db 10
    b db 5
    c db 15

.code
main:
    mov ax, @data
    mov ds, ax

    mov al, a
    cmp al, b
    jg CHECK_C
    jmp END

CHECK_C:
    cmp al, c
    jl FINAL
    jmp END

FINAL:
    ; a > b AND a < c
    mov bl, 1
    jmp EXIT

END:
    mov bl, 0

EXIT:
    mov ah, 4Ch
    int 21h
end main


ret




