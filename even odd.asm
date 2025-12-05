
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
    N DB 13

    msgEven DB "Even number$"
    msgOdd  DB "Odd number$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, N
    TEST AL, 01H   ; Check last bit

    JZ EVENNUM     ; Zero ? even
    JNZ ODDNUM     ; Non-zero ? odd

EVENNUM:
    LEA DX, msgEven
    MOV AH, 9
    INT 21H
    JMP EXIT

ODDNUM:
    LEA DX, msgOdd
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
END MAIN


ret




