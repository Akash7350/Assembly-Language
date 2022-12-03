     
     data segment
            msg1 db 13,10,"enter number is prime$"
            msg2 db 13,10,"enter number is not prime$"
            no dw 5436
           
            data ends
            
            code segment
                assume cs:code,ds:data   
                
                start:  mov ax,data
                        mov ds,ax 
                        
                        mov ax,no; ax=16bit
                        mov cl,1;counter for divide the number
                        cmp ax,1;
                        je L1  
                        cmp ax,2
                        je L2
                        
                        inc cl
                    L3: div cl;ax/cl
                        cmp ah,0
                        je L1
                        mov bl,ah
                        
                        cmp cl,bl
                        jbe L3
                        jmp L2
                        
                    L2: mov dx,offset msg1
                        mov ah,09h
                        int 21h
                        jmp L4
                       
                        
                        
                        
                    L1: mov dx,offset msg2
                        mov ah,09h
                        int 21h
                        
                        mov ah,4ch
                        int 21h    
                        
                  L4:   mov ah,4ch
                        int 21h  
                    
                        code ends
                        end start