
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
A DB 5
B DB 3
MSG1 DB "A is greater$"
MSG2 DB "B is greater$"
MSG3 DB "Both equal$"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AL,A
    CMP AL,B
    JE EQUAL
    JG AGREAT
    JL BGREAT

AGREAT:
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    JMP EXIT

BGREAT:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    JMP EXIT

EQUAL:
    MOV AH,9
    LEA DX,MSG3
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN


ret




