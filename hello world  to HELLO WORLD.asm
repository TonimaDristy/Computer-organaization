
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
MSG DB "hello world$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA SI, MSG
CONVERT:
    MOV AL, [SI]
    CMP AL,'$'
    JE PRINT
    SUB AL,20H       ; lowercase ? uppercase
    MOV [SI], AL
    INC SI
    JMP CONVERT

PRINT:
    MOV AH,9
    LEA DX,MSG
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN


ret




