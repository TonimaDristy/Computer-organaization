
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
                      .MODEL SMALL
.STACK 100H
.DATA
N DB 5
SUM DB 0
MSG DB "Sum = $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV CL,N
    MOV AL,0

LOOP1:
    ADD AL,CL
    DEC CL
    JNZ LOOP1

    MOV SUM,AL

    MOV AH,9
    LEA DX,MSG
    INT 21H

    ADD AL,30H
    MOV AH,2
    MOV DL,AL
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN


ret




