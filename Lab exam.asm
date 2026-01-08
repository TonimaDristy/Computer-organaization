.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter a Decimal Input: $'
    msgEven DB ' is Even$'
    msgOdd  DB ' is Odd$'
    newline DB 0DH, 0AH, '$'
    num DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display input message
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    ; Read a character (digit)
    MOV AH, 01H
    INT 21H
    SUB AL, 30H        ; ASCII to decimal
    MOV num, AL

    ; Print new line
    MOV AH, 09H
    LEA DX, newline
    INT 21H

    ; Check even or odd using TEST
    TEST AL, 01H
    JZ EVEN

ODD:
    ; Print number
    MOV DL, num
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    ; Print " is Odd"
    MOV AH, 09H
    LEA DX, msgOdd
    INT 21H
    JMP EXIT

EVEN:
    ; Print number
    MOV DL, num
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    ; Print " is Even"
    MOV AH, 09H
    LEA DX, msgEven
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
