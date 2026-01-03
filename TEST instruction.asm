
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB "Enter a digit (0-9): $"
    msgOdd DB 0DH,0AH,"The number is ODD.$"
    msgEven DB 0DH,0AH,"The number is EVEN.$"
    msgErr DB 0DH,0AH,"Invalid input! Not a digit.$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    LEA DX, msg1
    MOV AH, 09H
    INT 21H

   
    MOV AH, 01H
    INT 21H
    MOV BL, AL        

    
    CMP BL, '0'
    JL INVALID
    CMP BL, '9'
    JG INVALID

    
    SUB BL, 30H
    MOV AL, BL

    ; TEST for odd/even
    TEST AL, 01H
    JZ EVEN

ODD:
    LEA DX, msgOdd
    MOV AH, 09H
    INT 21H
    JMP EXIT

EVEN:
    LEA DX, msgEven
    MOV AH, 09H
    INT 21H
    JMP EXIT

INVALID:
    LEA DX, msgErr
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

ret




