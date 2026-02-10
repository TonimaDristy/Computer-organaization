
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here org 100h

; ================================
; 8086 SHIFT & ROTATE DEMO PROGRAM
; ================================

; ----------------
; DATA SECTION
; ----------------
data1   db 00010101b    ; 21 unsigned
data2   db 11111000b    ; -8 signed
result  db ?

count   db 4            ; shift count

; ----------------
; CODE STARTS
; ----------------
start:

; ================================
; LOGICAL LEFT SHIFT (SHL)
; ================================
mov al, data1           ; AL = 21
mov cl, 1
shl al, cl              ; AL = 42
mov result, al

; ================================
; LOGICAL RIGHT SHIFT (SHR)
; ================================
mov al, data1           ; AL = 21
mov cl, 1
shr al, cl              ; AL = 10
mov result, al

; ================================
; ARITHMETIC LEFT SHIFT (SAL)
; ================================
mov al, data2           ; AL = -8
mov cl, 1
sal al, cl              ; AL = -16
mov result, al

; ================================
; ARITHMETIC RIGHT SHIFT (SAR)
; ================================
mov al, data2           ; AL = -8
mov cl, 1
sar al, cl              ; AL = -4
mov result, al

; ================================
; MULTIPLE SHIFTS USING LOOP
; ================================
mov al, 2               ; AL = 2
mov cl, count           ; CL = 4

shift_loop:
shl al, 1               ; multiply by 2
dec cl
jnz shift_loop          ; repeat 4 times
; final AL = 32

mov result, al

; ================================
; ROTATE LEFT (ROL)
; ================================
mov al, 10000001b
mov cl, 3
rol al, cl              ; rotate left 3 times
mov result, al

; ================================
; ROTATE RIGHT (ROR)
; ================================
mov al, 10000001b
mov cl, 2
ror al, cl              ; rotate right 2 times
mov result, al

; ================================
; SHIFT MEMORY DIRECTLY
; ================================
mov cl, 1
shl data1, cl           ; data1 = 42
shr data1, cl           ; data1 = 21

; ================================
; SIGNED vs UNSIGNED DEMO
; ================================
mov al, 11110000b       ; -16 signed / 240 unsigned

shr al, 1               ; logical ? fills with 0
mov result, al          ; result = 120

mov al, 11110000b
sar al, 1               ; arithmetic ? keeps sign
mov result, al          ; result = -8

; ================================
; SHIFT 16-BIT REGISTER
; ================================
mov ax, 0000100000000001b
shl ax, 1               ; shift AX left
shr ax, 1               ; shift AX right

; ================================
; ROTATE WITH CARRY (BONUS)
; ================================
stc                     ; set carry flag
mov al, 01010101b
rcl al, 1               ; rotate through carry
rcr al, 1

; ================================
; PROGRAM END
; ================================
hlt


ret




