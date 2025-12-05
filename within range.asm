
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
    X DB 18

    msg1 DB "Too Small$"
    msg2 DB "Too Large$"
    msg3 DB "Within Range$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, X

    CMP AL, 10
    JL SMALL        ; X < 10

    CMP AL, 20
    JG LARGE        ; X > 20

    JMP WITHIN      ; 10 <= X <= 20

SMALL:
    LEA DX, msg1
    MOV AH, 9
    INT 21H
    JMP EXIT

LARGE:
    LEA DX, msg2
    MOV AH, 9
    INT 21H
    JMP EXIT

WITHIN:
    LEA DX, msg3
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
END MAIN


ret




