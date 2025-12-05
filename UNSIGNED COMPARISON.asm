
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
    A DB 8
    B DB 12
    C DB 12

    msg1 DB "A is above B$"
    msg2 DB "A is below or equal to B$"
    msg3 DB "B is greater than C (via JNLE)$"
    msg4 DB "B is NOT greater than C$"
    msg5 DB "A > C$"
    msg6 DB "A < C$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

   
    ; UNSIGNED COMPARISON: A and B
 
    MOV AL, A
    CMP AL, B

    JA  PRINT1        ; A > B
    JBE PRINT2        ; A <= B

    
    ; SIGNED COMPARISON: B and C using JNLE
   MOV AL, B
    CMP AL, C

    JNLE PRINT3       ; Jump if NOT (<=) ? means B > C
    JMP PRINT4        ; Otherwise B <= C

    
    ; A and C using JG and JL
    
PRINT_AC:
    MOV AL, A
    CMP AL, C

    JG PRINT5         ; A > C
    JL PRINT6         ; A < C
    JMP EXIT

PRINT1:
    LEA DX, msg1
    MOV AH, 9
    INT 21H
    JMP PRINT_AC

PRINT2:
    LEA DX, msg2
    MOV AH, 9
    INT 21H
    JMP PRINT_AC

PRINT3:
    LEA DX, msg3
    MOV AH, 9
    INT 21H
    JMP PRINT_AC

PRINT4:
    LEA DX, msg4
    MOV AH, 9
    INT 21H
    JMP PRINT_AC

PRINT5:
    LEA DX, msg5
    MOV AH, 9
    INT 21H
    JMP EXIT

PRINT6:
    LEA DX, msg6
    MOV AH, 9
    INT 21H
    JMP EXIT

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN


ret




