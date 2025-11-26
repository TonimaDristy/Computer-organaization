
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
NUM1 DB 20
NUM2 DB 5
QUOT DB ?
REM DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; Load numbers
    MOV AL, NUM1
    MOV BL, NUM2
    XOR AH, AH       ; Clear AH before DIV (important!)
    DIV BL           ; AL / BL ? AL = quotient, AH = remainder
    MOV QUOT, AL
    MOV REM, AH

    ; Print quotient (assume quotient < 10)
    MOV AL, QUOT
    ADD AL, 30H      ; convert to ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Print a space
    MOV DL, ' '
    MOV AH, 2
    INT 21H

    ; Print remainder (assume remainder < 10)
    MOV AL, REM
    ADD AL, 30H      ; convert to ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Terminate program
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN



ret




