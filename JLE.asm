.MODEL SMALL
.STACK 100H
.DATA
    A DB -5
    B DB 2
    C DB -1

    msg DB "Largest number selected$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, A

    CMP AL, B
    JGE CHECK_C
    MOV AL, B

CHECK_C:
    CMP AL, C
    JGE DONE
    MOV AL, C

DONE:
    ; AL now holds largest value
    LEA DX, msg
    MOV AH, 9
    INT 21H

    MOV AH, 4CH
    INT 21H
END MAIN