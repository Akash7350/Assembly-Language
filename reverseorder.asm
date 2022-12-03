data segment
    msg1 db "enter length of arry : $"
    msg2 db 13,10, "enter numbers :  $"
    msg3 db "the entered arry in reverse order is:$ "
    
    lgt dw 0
data ends

stack segment
    dw 20 dup(0)
stack ends

code segment
    assume cs:code,ds:data,ss:stack
        start: mov ax,data
               mov ds,ax
               mov ax,stack
               mov ss,ax
               mov sp,ax
               
               mov dx,offset msg1
               mov ah,09h
               int 21h 
               
               mov ah,01h
               int 21h
               
               sub al,30h
               mov ah,00h
               mov lgt,ax
               
               mov dx,offset msg2
               mov ah,09h
               int 21h
               mov cx,lgt
                    
        again: call acceptno
               mov ah,00h
               push ax
               loop again
               
       again1: pop ax
               call display
               loop again1
               jmp L5
               
    acceptno: call accept
               shl al,4
               mov bl,al
               call accept
               add al,bl
               ret
               
       accept: mov ah,01h
               int 21h 
               sub al,30h
               cmp al,09h
               jbe L1
               
               
           L1: sub al,07h
               ret 
               
      display: mov bl,al
               shr al,4
               call disp
               mov al,bl
               and al,0Fh
               call disp
               ret  
               
         disp: cmp al,09h
               jbe L2
               add al,07h  
               
           L2: add al,30h
               mov dl,al
               mov ah,02h
               int 21h
               ret  
               
           L5: mov ah,4ch
               int 21h 
               
           code ends
end start
               