.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV BL,1        ; start from 1

LOOP1:
    ADD BL,30H      ; convert number to ASCII
    MOV AH,2
    MOV DL,BL
    INT 21H

    SUB BL,30H      ; back to number
    INC BL
    CMP BL,10
    JL LOOP1

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
