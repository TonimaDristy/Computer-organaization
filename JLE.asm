.MODEL SMALL
.STACK 100H
.DATA
    NUM DB -3

    negMsg DB "Negative (SF=1)$"
    posMsg DB "Positive (SF=0)$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, NUM
    OR AL, 0       ; update flags without changing value

    JS NEGATIVE    ; Jump if Sign Flag = 1

    LEA DX, posMsg
    MOV AH, 9
    INT 21H
    JMP EXIT

NEGATIVE:
    LEA DX, negMsg
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
END MAIN