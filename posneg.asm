        data segment
            msg1 db 13,10,"Number is positive!$"
            msg2 db 13,10,"Number is negative!$"
            msg3 db 13,10,"Number is ZERO!$"
            no dw -346                                                
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
            
                                                              
        L2: mov dx,offset msg2                               
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