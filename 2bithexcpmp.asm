        data segment 
            msg1 db 13,10,"Enter 1st 2-bit hex number:$"
            msg2 db 13,10, "Enter 2nd 2-bit hex number:$"
            msg3 db 13,10,"First number is greater!$"
            msg4 db 13,10,"Second number is greater!$"
            msg5 db 13,10,"Both numbers are equal!$" 
            no1 db 0
            no2 db 0            
                    
        data ends
        
        code segment
            assume cs:code,ds:data
            
     start: mov ax,data
            mov ds,ax
            
            mov dx,offset msg1 
            mov ah,09h
            int 21h   
            call accept
            
            mov no1,al
            
            mov dx,offset msg2 
            mov ah,09h
            int 21h
            call accept
            mov no2,al
           
            mov al,no1
            cmp al,no2
            je L2
            jb L3 
             
            mov dx,offset msg3 
            mov ah,09h
            int 21h
            jmp L4         
            
            
        L3: mov dx,offset msg4 
            mov ah,09h
            int 21h 
            jmp L4
            
        L2: mov dx,offset msg5 
            mov ah,09h
            int 21h
            
        L4: mov ah,4ch
            int 21h
            
    accept: call acc
            shl al,4
            mov bl,al
            call acc
            add al,bl
            ret
            
            
       acc: mov ah,01h
            int 21h
            cmp al,30h
            jbe L1
            sub al,07h
        L1: sub al,30h
            ret
            
            
           
            
            code ends
        end start