.MODEL SMALL
.STACK 100H
.DATA
    A DB -128
    B DB -1

    signedOF DB "Signed Overflow$"
    carryMsg DB "Unsigned Carry$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, A
    ADD AL, B

    ; Check signed overflow
    JO SIGNED_OVER

    ; Check unsigned carry
    JC UNSIGNED_CARRY

    JMP EXIT

SIGNED_OVER:
    LEA DX, signedOF
    MOV AH, 9
    INT 21H
    JMP EXIT

UNSIGNED_CARRY:
    LEA DX, carryMsg
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
END MAIN