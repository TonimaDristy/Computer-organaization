
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
    A DB 40
    B DB 25

    msg1 DB "A is greater or equal$"
    msg2 DB "B is greater$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, A
    CMP AL, B

    JGE PRINT1     ; A >= B
    JL  PRINT2     ; A < B

PRINT1:
    LEA DX, msg1
    MOV AH, 9
    INT 21H
    JMP EXIT

PRINT2:
    LEA DX, msg2
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
END MAIN


ret




