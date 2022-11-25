data segment
    msg db ,"the decimal equivalent is :$"
    hun db 0
    ten db 0
    unit db 0
data ends 
           
    code segment
            assume cs:code,ds:data,ss:stack
    start:  mov ax,data
            mov ds,ax
            
            mov dx,offset msg 
            mov ah,09h
            int 21h   
            
            mov ax,0bbh ;if we take 10111011b the program is for binary to dec and is equal to 187
            mov cl,100 ; divide the no by 10   
            div cl     ;  ah     al
                       ; 87(R)   1(Q)
            mov hun,al ; the quotient will go to variable hun
            mov al,ah
            mov ah,00h ; ax=00rem  (16 bit) 
            mov cl,10
            div cl
            mov ten,al
            mov unit,ah
            mov dl,hun
            call disp
            mov dl,ten
            call disp
            mov dl,unit
            call disp
              
            mov ah,4ch ; proper termination
            int 21h
            
     disp:  add dl,30h ; get ASCII
            mov ah,02h
            int 21h
            ret
            
      code ends
    end start