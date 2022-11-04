;Write a program to accept a lower/upper case between two
;character from keyboard and send its upper/lower case with proper message

data segment
    msg1 db 13,10,"Enter Lowercase any Alaphabet: $"
    msg2 db 13,10,"Enter Upper case alphabet: $"
    data ends
code segment
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    
    mov dx,offset msg1
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,20h
    mov bl,al
    
    mov dx,offset msg2
    mov ah,09h
    int 21h
    
    mov dl,bl
    mov ah,02
    int 21h
    
    mov ah,4ch
    int 21h
    
    end start
    code ends
   ======================
   ;Output= Enter Lowercase any Alaphabet:
         ;  Enter Upper case alphabet:
         
         ;Written by Akash Rathod


