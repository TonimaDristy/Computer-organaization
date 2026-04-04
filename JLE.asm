.MODEL SMALL
.STACK 100H
.DATA
    A DB 120
    B DB 120

    ofMsg DB "Overflow occurred$"
    noMsg DB "No overflow$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, A
    ADD AL, B

    JO OVERFLOW     ; Jump if Overflow Flag = 1

    LEA DX, noMsg
    MOV AH, 9
    INT 21H
    JMP EXIT

OVERFLOW:
    LEA DX, ofMsg
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
END MAIN