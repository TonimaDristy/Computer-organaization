
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
NUM DB 5
EVENMSG DB "Even$"
ODDMSG DB "Odd$"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AL,NUM
    AND AL,1        ; check last bit
    CMP AL,0
    JE EVEN

ODD:
    MOV AH,9
    LEA DX,ODDMSG
    INT 21H
    JMP EXIT

EVEN:
    MOV AH,9
    LEA DX,EVENMSG
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN


ret




