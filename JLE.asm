.MODEL SMALL
.STACK 100H
.DATA
    P DB 30
    Q DB 10

    msg1 DB "P > Q (unsigned)$"
    msg2 DB "P <= Q (unsigned)$"
    msg3 DB "P > Q (signed)$"
    msg4 DB "P <= Q (signed)$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; ----- Unsigned -----
    MOV AL, P
    CMP AL, Q
    JA  UGT
    JBE ULE

UGT:
    LEA DX, msg1
    MOV AH, 9
    INT 21H
    JMP SIGNEDCMP

ULE:
    LEA DX, msg2
    MOV AH, 9
    INT 21H

SIGNEDCMP:
    ; ----- Signed -----
    MOV AL, P
    CMP AL, Q
    JG SGT
    JLE SLE

SGT:
    LEA DX, msg3
    MOV AH, 9
    INT 21H
    JMP EXIT

SLE:
    LEA DX, msg4
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
