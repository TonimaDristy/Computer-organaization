
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.MODEL SMALL
.STACK 100H
.DATA
    X DB 20
    Y DB 15
    Z DB 25

    msg1 DB "X is above Y (unsigned)$"
    msg2 DB "X is below Y (unsigned)$"
    msg3 DB "Y is greater than Z (signed)$"
    msg4 DB "Y is less than Z (signed)$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX


    ; 1. UNSIGNED COMPARISON: X and Y

    MOV AL, X
    CMP AL, Y

    JA  PRINT1     ; Jump if AL > Y (unsigned)
    JB  PRINT2     ; Jump if AL < Y (unsigned)

   
    ; 2. SIGNED COMPARISON: Y and Z
   
    MOV AL, Y
    CMP AL, Z

    JG  PRINT3     ; Jump if Y > Z (signed)
    JL  PRINT4     ; Jump if Y < Z (signed)

    JMP EXIT

PRINT1:
    LEA DX, msg1
    MOV AH, 9
    INT 21H
    JMP EXIT

PRINT2:
    LEA DX, msg2
    MOV AH, 9
    INT 21H
    JMP EXIT

PRINT3:
    LEA DX, msg3
    MOV AH, 9
    INT 21H
    JMP EXIT

PRINT4:
    LEA DX, msg4
    MOV AH, 9
    INT 21H
    JMP EXIT

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN


ret




