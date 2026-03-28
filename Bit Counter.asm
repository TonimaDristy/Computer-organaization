org 100h

.model small
.stack 100h

.data
    num db 16
    result db 0   ; 1 = power of 2

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num
    cmp al, 0
    je not_power

    mov bl, al
    dec bl        ; bl = n - 1
    and al, bl

    cmp al, 0
    jne not_power

power:
    mov result, 1
    jmp finish

not_power:
    mov result, 0

finish:
    mov ah, 4Ch
    int 21h
main endp
end main