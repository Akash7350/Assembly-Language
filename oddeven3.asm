data segment
    msg1 db "the no is even$"
    msg2 db "the no is odd$"
data ends
code segment
    assume cs:code,ds:data
    
    start:  mov ax,data
            mov ds,ax
            mov ax,155
            mov cl,2
            div cl
            cmp ah,01h
            jne L1
            
            mov dx,offset msg2
            mov ah,09h
            int 21h
            jmp L2
            
               
     L1:    mov dx,offset msg1
            mov ah,09h
            int 21h
            
     L2:    mov ah,4ch
            int 21h
            
        code ends
        end start       
            
            
            
            
            
            
            
            
  