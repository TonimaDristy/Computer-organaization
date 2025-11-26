
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
.MODEL SMALL
.STACK 100H
.DATA
A DB 10
B DB 2
SUM DB ?
DIFF DB ?
PROD DW ?
QUOT DB ?
REM DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; Addition
    MOV AL,A
    ADD AL,B
    MOV SUM,AL
    ; Print SUM
    MOV AL,SUM
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H

    ; Subtraction
    MOV AL,A
    SUB AL,B
    MOV DIFF,AL
    ; Print DIFF
    MOV AL,DIFF
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H

    ; Multiplication
    MOV AL,A
    MOV BL,B
    MUL BL
    MOV PROD,AX
    ; Print PROD (<100)
    MOV AX,PROD
    MOV AH,0
    MOV CX,10
    DIV CX
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H
    ADD AH,30H
    MOV DL,AH
    MOV AH,2
    INT 21H

    ; Division
    MOV AL,A
    DIV B
    MOV QUOT,AL
    MOV REM,AH
    ; Print quotient
    MOV AL,QUOT
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H
    ; Print remainder
    MOV AL,REM
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN


ret




