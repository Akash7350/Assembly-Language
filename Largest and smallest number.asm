; Write an Algorithm/flow chart and Assembly Language Program for both largest with smallest
; from the array store in the data segment and show the result on screen.   

                    data segment
                        msg1 db 13,10, "The Smallest Number is:$"
                        msg2 db 13,10, "The largest Number is:$"
                        
                        array db 0A3h,79h,0f3h,0f3h
                        lgt dw 4
                        
                        data ends
                        code segment
                          
                assume  ds:data,cscode
                
                start:  mov ax,data
                        mov ds,ax
                        
                        mov si,0
                        mov cx,lgt
                        dec cx
                        
                        mov ah,array[si]
                        mov al,array[si]
                        
                 again: cmp ah,array[si+1]
                        jnc L1
                        
                        mov ah,array[si+1]
                        jmp L2
                        
                    L1: cmp al,array{si+1]
                        jc L2
                        mov al,array[si+1]
                        
                    L2: inc si
                        loop again
                        
                        mov ch,ah
                        mov cl,al
                        
                        mov dx,offset msg2
                        mov ah,09h
                        int 21h
                        
                        mov al,ch
                        call display
                        mov ah,4ch
                        int 21h
                        
               display: mov bl,al
                        shr al,4
                        call disp
                        mov al,bl
                        and al,0fh
                        call disp
                        ret
                        
                  disp: cmp al,09h
                        jbe L3
                        add al,07h
                        
                   L3:  add al,30h
                        mov dl,al
                        mov ah,02h
                        int 21h
                        ret 
                        
                        code ends
                        end start
           ===============================================
           
           Output= The largest number is:F3
           
           :)
                     
                                                  
                      