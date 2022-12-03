        data segment
            array db 0,0,0,0,0
            lgt dw 5
          msg db 13,10,"The numbers in revrese order are : $"
          msg1 db "Enter five 2-bit hex numbers : $"  
         data ends
        
        code segment
            assume cs:code,ds:data
            
      start:    mov ax,data
                mov ds,ax
                
                mov dx,offset msg1
                mov ah,09h
                int 21h
                
                mov si,0
                mov cx,lgt
                
                
                
        again:  call accept
                mov array[si],al
                inc si
                loop again
                
                
                
                mov dx,offset msg
                mov ah,09h
                int 21h
                
             
                mov si,lgt 
                mov cx,lgt
              C1:  dec si        
                 
                 
               mov al,array[si]
                call display
               ;dec si
               ; cmp si,0
                ;jg L4 
                ;js L5
                ;jmp L5
               loop C1
                
             mov ah,4ch
                int 21h
                
      accept:   call acc
                shl al,4
                mov dl,al
                call acc
                add al,dl
               ; call space
                ret
               
       
          acc:  mov ah,01h
                int 21h
                cmp al,39h
                jbe L1
                sub al,07h
            L1: sub al,30h
                ret
                
    display:    mov bl,al
                shr al,4
                call disp
                mov al,bl
                and al,0Fh
                call disp
                
        disp:   cmp al,09h
                jbe L2
                add al,07h
         L2:    add al,30h
                mov dl,al
                mov ah,02h
                int 21h
                ;;call space
                ret      
                
         
                                                   
            code ends
        end start