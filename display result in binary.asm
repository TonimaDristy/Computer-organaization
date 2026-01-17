
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

org 100h

mov al, 10010110b
ror al, 1

; display binary result
mov ah, 0
call print_bin

ret

print_bin proc
    push ax
    push cx
    mov cx, 8

print_loop:
    shl al, 1
    mov dl, '0'
    jnc skip
    mov dl, '1'
skip:
    mov ah, 02h
    int 21h
    loop print_loop

    pop cx
    pop ax
    ret
print_bin endp


ret




