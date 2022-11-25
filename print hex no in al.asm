data segment
    msg db 13,10,"The Hex no is:$"
data ends  

code segment
    assume cs:code,ds:data 
    
 start:     mov ax,data
            mov ds,ax 
           
            mov dx,offset msg
            mov ah,09h
            int 21h
          
            mov al,240
            mov bl,al
            shr al,4  
          
            call disp
          
            mov al,bl
            and al,0fh
          
            call disp
          
            mov ah,4ch
            int 21h
          
     disp:  cmp al,09h
            jbe L1
            add al,07h
          
       L1:  add al,30h
            mov dl,al
            mov ah,02h
            int 21h 
            ret  
          
       code ends
       end start
          
     
     
          
          
          
          