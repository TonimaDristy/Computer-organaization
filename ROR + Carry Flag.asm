
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
    value db 11011010b
    cnt   db 8
    ones  db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, value
    mov cl, cnt
    xor bl, bl          ; BL = carry counter

next_ror:
    ror al, 1
    jc  carry_one
    jmp skip

carry_one:
    inc bl

skip:
    loop next_ror

    mov ones, bl

    mov ah, 4Ch
    int 21h
main endp
end main


ret




