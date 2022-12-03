        data segment
            array1 db 0,0,0,0,0
            lgt dw 5
            msg db 13,10, "The array in reverse order is:$" 
            msg1 db 13,10, "Enter numbres in array:$"          
                    
        data ends
        
        code segment
            assume cs:code,ds:data
            
     start: mov ax,data
            mov ds,ax
            
            mov si,0
            mov cx,lgt
            
            mov dx,offset msg1
            mov ah,09h
            int 21h
     again: call accept
            mov array1[si],al
            inc si
            loop again  
            
            mov dx,offset msg
            mov ah,09h
            int 21h 
            
            
            mov si,lgt
            
  ; again1:  
           dec si
           
            
       L3: mov al,array1[si]
            call display  
            dec si
             cmp si,0                 
            jg L3
            js L4
            ;jmp L4
           ; loop again1
                
         L4:mov ah,4ch
            int 21h 
            

    accept: call acc
            shl al,4
            mov bl,al
            call acc
            add al,bl
         ;   mov dl,' '  
          ;  mov ah,02h
           ; int 21h 
            ret
            
            
       acc: mov ah,01h
            int 21h
            cmp al,30h
            jbe L1
            sub al,07h
        L1: sub al,30h
            ret
   display: mov dl,al
            shr al,4
            call disp
            mov al,dl
            and al,0fh
            call disp
          ;  mov dl,' '  
          ;  mov ah,02h
           ; int 21h 
            ret
            
      disp: cmp al,09h
            jbe L2
            add al,07h
        L2: add al,30h
            mov dl,al 
            mov ah,02h
            int 21h
      
            
            
            
           
            
            code ends
        end start