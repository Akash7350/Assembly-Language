; Write an Algorithm/flow chart and Assembly Language Program for largest/smallest
; from the array store in the data segment and show the result on screen.  

                         data segment
                            msg db 13,10,"The largest Number is: $"
                            array db 9,8,4,3,6
                            
                            data ends
                            code segment
                            
                    assume  ds:data,cs:code
                            
                    start:  mov ax,data
                            mov ds,ax
                            mov dx,offset msg
                            mov ah,09
                            int 21h
                            
                            mov si,0
                            mov cx,4
                            
                            mov al,array[si]
                            
                    again:  cmp al, array[si+1]
                            jnc L1
                            mov al,array[si+1]
                            
                       L1:  inc si
                            loop again
                            
                  display:  mov bl,al
                            shr al,4
                            call disp
                            mov al,bl
                            and al,0fh
                            call disp
                            mov ah,4ch
                            int 21h
                            
                  disp:  cmp al,09h
                            jbe L2
                            add al,07h
                          
                      L2:   add al,30h
                            mov dl,al
                            mov ah,02h
                            int 21h
                            ret
                            
                            code ends
                            end start                    
                                        
                                       
                   ;output:- The largest Number is: 09
                                       
                                       




