
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV DL,'A'

NEXT:
    MOV AH,2
    INT 21H
    INC DL
    CMP DL,'Z'+1
    JL NEXT

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN


ret




