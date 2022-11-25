data segment
    msg db ,"the binary equivalent is :$"
data ends 

stack segment
    dw 100 dup(0)
           
stack ends
    code segment
            assume cs:code,ds:data,ss:stack
    start:  mov ax,data
            mov ds,ax
            
            mov ax,stack
            mov ss,ax
            mov sp,ax
            
            mov dx,offset msg 
            mov ah,09h
            int 21h   
            
            mov ax,511
            mov cx,0 ; pointer to count how many times no is divided by 2  
            
    again:  mov bl,2
            
            div bl   ; divide decimal no by 2
            inc cx   ; increment counter by 1
            
            mov bh,al ;store the quotient temproray in al
            mov al,ah
            mov ah,00h
            push ax 
            mov al,bh ;get the quotient again
            cmp al,00h ; compare quotient with 0
            je print
            
            jmp again  
            
    print:  pop dx ; get last remainder in dl
            add dl,30h
            mov ah,02h
            int 21h
            
            loop print ; cx=cx-1 if cx==0 then go to pop
            
            mov ah,4ch
            int 21h
            
            code ends
                end start