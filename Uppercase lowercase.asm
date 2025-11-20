org 100h

.MODEL SMALL
.STACK 100H

.DATA
   MSG1   DB 'Enter Uppercase Letter: ', 0Dh, 0Ah, 24h
   MSG2   DB 'Uppercase: ', 24h
   MSG3   DB '  Lowercase: ', 24h

   MSG4   DB 0Dh, 0Ah, 'It''s a Vowel', 24h
   MSG5    DB 0Dh, 0Ah, 'It''s a Consonant', 24h

    CH          DB 0
    LOW         DB 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

   
    ; Ask for input

    MOV AH, 09h
    LEA DX, MSG1
    INT 21h

    
    ; Take uppercase input
    
    MOV AH, 01h
    INT 21h
    MOV CH, AL             ; store uppercase letter

    
    ; Print uppercase
    
    MOV AH, 09h
    LEA DX, MSG2
    INT 21h

    MOV DL, CH
    MOV AH, 02h
    INT 21h

    
    ; Convert to lowercase
   
    MOV AL, CH
    ADD AL, 32
    MOV LOW, AL

    
    ; Print lowercase
    
    MOV AH, 09h
    LEA DX, MSG3
    INT 21h

    MOV DL, LOW
    MOV AH, 02h
    INT 21h

   
    ; Check vowel
  
    MOV AL, LOW

    CMP AL, 'a'
    JE PRINT_VOWEL
    CMP AL, 'e'
    JE PRINT_VOWEL
    CMP AL, 'i'
    JE PRINT_VOWEL
    CMP AL, 'o'
    JE PRINT_VOWEL
    CMP AL, 'u'
    JE PRINT_VOWEL

    JMP PRINT_CONS

PRINT_VOWEL:
    MOV AH, 09h
    LEA DX, MSG4
    INT 21h
    JMP EXIT

PRINT_CONS:
    MOV AH, 09h
    LEA DX, MSG5
    INT 21h

EXIT:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
