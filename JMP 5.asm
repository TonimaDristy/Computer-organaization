
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h

.model small
.stack 100h
.data
    num1   db 10 ,0dh ,0ah ,24h 
    num2   db 5  ,0dh ,0ah ,24h  
    result db ? 
    count  db 5
    msg1   db "result = $"              
    msg    db "closed message$"
.code

main proc
    mov ax, @data
    mov ds, ax

   
    mov al, num1
    sub al, num2
   
    mov result, al

print_loop:
    mov ah,09h
    mov dx,offset msg1
    int 21h
    
    
    mov al, result
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h        
    
    
    
    ;new line
    mov dl ,13
    mov ah,02h
    int 21h
    
    
     mov dl ,10
    mov ah,02h
    int 21h
    


    ; Decrease count
    dec count   
    jnz print_loop  ; jump 

    
    
    
   ; show message 
    mov dx, offset msg
    mov ah, 09h
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main


ret




