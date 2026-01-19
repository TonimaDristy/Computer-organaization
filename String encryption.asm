
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

org 100h

data db "HELLO WORLD$", 0

start:
    lea si, data

encrypt:
    mov al, [si]
    cmp al, '$'
    je done

    ror al, 2
    mov [si], al

    inc si
    jmp encrypt

done:
    ret


ret




