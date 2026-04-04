.MODEL SMALL
.STACK 100H
.DATA
    ARR DB -1, 5, -3, 2, -7
    COUNT DB 5
    NEG_CNT DB 0

    msg DB "Negative count calculated$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, COUNT
    LEA SI, ARR
    XOR BL, BL        ; counter = 0

CHECK_LOOP:
    MOV AL, [SI]
    OR AL, AL         ; set flags

    JS IS_NEG
    JMP NEXT

IS_NEG:
    INC BL

NEXT:
    INC SI
    LOOP CHECK_LOOP

    MOV NEG_CNT, BL

    LEA DX, msg
    MOV AH, 9
    INT 21H

    MOV AH, 4CH
    INT 21H
END MAIN