        data segment
            msg1 db 13,10,"The number is positive: $"
            msg2 db 13,10,"The number is Negative: $" 
            msg3 db 13,10,"The number is Zero not positive not negative: $"
            
            no dw 0
            
            data ends
            code segment
                assume cs:code,ds:data
                
         start: mov ax,data
                mov ds,ax
                
                mov ax,no
                cmp ax,0
                
                jz L1
                js L2
                
                mov dx,offset msg1
                mov ah,09h
                int 21h
                jmp L3
                
            
                
           L2:  mov dx,offset msg2
                mov ah,09h
                      
                int 21h
                 
                jmp L3
                
            L1: mov dx,offset msg3
                mov ah,09h
                int 21h
                
            L3: mov ah,4ch
                int 21h
                code ends
                end start
            