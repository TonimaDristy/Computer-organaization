
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

org 100h

; ===============================
; RCL DEMO – ADVANCED
; ===============================

; ----- Data section -----
num8   db 10101101b     ; 8-bit value
num16  dw 9A3Ch         ; 16-bit value
num32  dw 1234h, 5678h  ; 32-bit value (low, high)

; ===============================
; 8-bit RCL with LOOP
; ===============================
mov cx, 4               ; rotate 4 times
mov al, num8
clc

rcl8_loop:
    rcl al, 1
loop rcl8_loop

mov num8, al            ; store result

; ===============================
; 16-bit RCL with count
; ===============================
mov ax, num16
stc                     ; CF = 1
mov cl, 3               ; rotate 3 times
rcl ax, cl
mov num16, ax

; ===============================
; 32-bit RCL using DX:AX
; ===============================
mov ax, [num32]         ; low word
mov dx, [num32+2]       ; high word
clc

mov cx, 5               ; rotate 5 times

rcl32_loop:
    rcl ax, 1
    rcl dx, 1
loop rcl32_loop

mov [num32], ax
mov [num32+2], dx

; ===============================
; Memory RCL (direct)
; ===============================
clc
rcl byte ptr num8, 1
rcl word ptr num16, 1

ret


ret




