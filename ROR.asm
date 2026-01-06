
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MODEL SMALL
.STACK 100H
.DATA
msg DB 'ROR Output:',0DH,0AH,'$'
nl DB 0DH,0AH,'$'
num DB 8
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV AH,9
LEA DX,msg
INT 21H
MOV CX,4
L4:
MOV AL,num
ROR AL,1
ADD AL,'0'
MOV DL,AL
MOV AH,2
INT 21H
MOV AH,9
LEA DX,nl
INT 21H
INC num
LOOP L4
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN

ret




