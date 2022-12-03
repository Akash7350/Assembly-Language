        data segment
            msg1 db "The positive is $"
            msg2 db 13,10,"The negative is $"
            msg3 db 13,10,"Number is not positvive neither negative $"
            no dw 0 
            data ends
            code segment
               
                assume cs:code,ds:data
               start:   mov ax,data
                        mov ds,ax
                        mov ax,no 
                        cmp ax,00h
                        
                        jz L1
                        js L2
                        
                        mov dx,offset msg1
                        mov ah,09h
                        
                        int 21h
                        jmp l3
                        
                   L2:  mov dx,offset msg2
                        mov ah,09h
                        int 21h
                        jmp L3
                        
                   L1:  mov dx,offset msg3
                        mov ah,09h
                        int 21h
                        
                   L3:  mov ah,4ch
                        int 21h
                        
                        
                        code ends
                        end start
                        
                      
            