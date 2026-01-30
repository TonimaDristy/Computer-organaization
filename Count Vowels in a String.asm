
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
str db "ASSEMBLYLANGUAGE$"
vowel db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, str

next:
    mov al, [si]
    cmp al, '$'
    je done

    cmp al, 'A'
    je inc_v
    cmp al, 'E'
    je inc_v
    cmp al, 'I'
    je inc_v
    cmp al, 'O'
    je inc_v
    cmp al, 'U'
    je inc_v

    jmp skip

inc_v:
    inc vowel

skip:
    inc si
    jmp next

done:
    mov ah, 4Ch
    int 21h
main endp
end main


ret




