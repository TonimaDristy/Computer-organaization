
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

org 100h

mov al, 'A'     ; original character
ror al, 2       ; encrypt by rotating bits

; decrypt
rol al, 2       ; rotate back

ret


ret




