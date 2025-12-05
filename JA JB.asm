
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
    M DB -5
    N DB 3

    msg1 DB "M < N (signed)$"
    msg2 DB "M > N (signed)$"
    msg3 DB "M > N (unsigned)$"
    msg4 DB "M < N (unsigned)$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; ----- Signed -----
    MOV AL, M
    CMP AL, N
    JL SIGN_LT
    JG SIGN_GT

SIGN_LT:
    LEA DX, msg1
    MOV AH, 9
    INT 21H
    JMP UNSIGNCMP

SIGN_GT:
    LEA DX, msg2
    MOV AH, 9
    INT 21H

UNSIGNCMP:
    ; ----- Unsigned -----
    MOV AL, M
    CMP AL, N
    JA UNS_GT
    JB UNS_LT

UNS_GT:
    LEA DX, msg3
    MOV AH, 9
    INT 21H
    JMP EXIT

UNS_LT:
    LEA DX, msg4
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

END MAIN


ret




