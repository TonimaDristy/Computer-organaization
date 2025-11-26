
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here.MODEL SMALL
.STACK 100H
.DATA
NUM1 DB 5
NUM2 DB 6
RES DW ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AL, NUM1
    MOV BL, NUM2
    MUL BL          ; AL * BL ? AX
    MOV RES, AX     ; store result

    ; Print result (assume < 100)
    MOV AX, RES
    MOV AH,0
    MOV CX,10
    DIV CX           ; AX/10 ? AL=tens, AH=units

    ADD AL,30H
    MOV DL, AL
    MOV AH,2
    INT 21H

    ADD AH,30H
    MOV DL, AH
    MOV AH,2
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN


ret




