
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

org 100h          ; COM program

; ---------- 8-bit RCL ----------
mov al, 10110101b ; AL = B5h
clc               ; CF = 0
rcl al, 1         ; Rotate AL through CF

; ---------- 16-bit RCL ----------
mov ax, 7A3Ch     ; AX = 7A3Ch
clc
rcl ax, 1

; ---------- 32-bit Shift using RCL (DX:AX) ----------
mov dx, 1234h
mov ax, 5678h
clc
rcl ax, 1
rcl dx, 1

ret


ret




