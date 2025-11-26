
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
CHAR DB 'D'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AL, CHAR
    ADD AL,20H      ; uppercase ? lowercase
    MOV CHAR, AL

    MOV DL, AL
    MOV AH,2
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN


ret




