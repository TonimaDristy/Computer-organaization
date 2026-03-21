
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
    val  db 11100101b
    ones db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, val
    mov cl, 8
    xor bl, bl

count_bits:
    shr al, 1
    adc bl, 0       ; add carry to BL
    loop count_bits

    mov ones, bl

    mov ah, 4Ch
    int 21h
main endp
end main

ret




