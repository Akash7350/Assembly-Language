        ;Enter the 2 hexadecimal number from keyboard and compare the number and send the proper message
        data segment
            msg1 db "Enter 2bit 1st hex no: $"
            msg2 db "Enter 2bit 2st hex no: $"
            msg3 db "1st no is Greater: $"
            msg4 db "2 st no is Greater: $"
            msg5 db "The no's same$"
            
            no1 db 0
            no2 db 0
            
            data ends

            code segment
                assume cs:code,ds:data
         start: mov ax,data
                mov dx,ax
                
                mov dx,offset msg1
                mov ah,09
                int 21h
                
                call accepthex
                mov no1,al
                
                mov dx,offset msg2
                mov ah,09h
                int 21h
                
                call accepthex
                mov no2,al
                
                mov al,no1
                mov al,no2
                je L2
                jb L3
                
            L3: mov dx,offset msg4
                mov ah,09h
                int 21h
                jmp L4
                
            L2: mov dx,offset msg5
                mov ah,09h
                int 21h 
           L4:  mov ah,4ch
                int 21h
                
    accepthex:  call accept
                shl al,4
                mov dl,al
                call accept
                add al,dl
                ret
                
        accept: mov ah,01h
                int 21h
                  
                cmp al,39h
                jbe L1
                  
                sub al,07h
            L1: sub al,30h
                ret
                code ends
                end start
             
                       
                        
                      