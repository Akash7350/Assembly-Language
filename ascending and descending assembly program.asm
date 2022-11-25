 
        data segment
            msg1 db 10,13,"The Descinding Sequence is: $"
            msg2 db 10,13,"The Ascending Sequence is: $"
            array db 37h,09fh,0a3h,37h,0fh
            lgt dw 5
            
            data ends
        
            stack segment
                dw 100 dup(0)
                stack ends
           
            code segment
                assume cs:code,ds:data
                
                start: mov ax,data
                       mov ds,ax
                       
                       mov ax,stack
                       mov ss,dx
                       mov sp,ax
                       
                       mov dx,offset msg1
                       mov ah,09h
                       int 21h
                       
                       mov dx,lgt
                       dec dx     
                again: mov cx,dx
                       mov si,0   
                   L2: mov al,array[si]
                       
                       cmp al,array[si+1] 
                       jc L1   
                       xchg al,array[si+1]
                       mov array[si],al
                       
                   L1: inc si
                       loop L2
                       dec dx
                       jnz again
                        
                        mov cx,lgt
                        mov si,0
                    L3: mov al,array[si]
                    
                        mov ah,0
                        push ax
                        
                        call display
                        inc si
                        loop L3  
                        
                        mov dx,offset msg2
                        mov ah,09h
                        int 21h  
                        
                        mov cx,lgt
                     L5:pop ax
                        call display
                        loop L5
                        
                        mov ah,4ch
                        int 21h  
                        
                        
                        
              display:  mov bl,al
                        shr al,4
                        
                        call disp
                        
                        mov al,bl
                        and al,0fh
                        call disp
                                 
                        mov dl,','
                        mov ah,02h
                        int 21h
                        ret
                        
                  disp: cmp al,09
                        jbe L4
                        add al,07h
                        
                   L4:  add al,30h
                        mov dl,al
                        
                        mov ah,02h
                        int 21h
                        ret 
                        
                        code ends
                        end start
 