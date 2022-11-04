;8086 Assembly Program to Count Number of 0's and 1's from a String
data segment
    msg1 db 13,10,"No. of 1's are: $"
    msg2 db 13,10,"No. of 0's are: $"
    string db "10101111111100010"
    data ends

    code segment
        assume cs:code,ds:data
        start:
        mov ax,data
        mov ds,ax
        
        mov bp,offset string
        mov si,0h
        
        again:
        mov al,[bp+si]
        cmp al,'$'
        jz L1
        cmp al,'1'
        jz L2
        
        inc ch
        jmp L3
        
        L2:
        inc cl
        L3:
        inc si
        jmp again
        
        L1:
        mov dx,offset msg1
        mov ah,09h
        int 21h
        
        mov al,ch
        call display 
        
        mov dx,offset msg2
        mov ah,09h
        int 21h
        
        mov al,ch
        call display
        
        mov ah,4ch
        int 21h
        
        display:
        mov bl,al
        shr al,4
        call disp
        
        mov al,bl
        and al,0fh
        call disp
        ret
        
        disp:
        cmp al,09h
        jbe L4
        add al,07h
        
        L4:
        add al,30h
        mov dl,al
        mov ah,02h
        int 21h
        ret
        
        end start
        code ends
   ======================
   Output= No. of 1's are:  
           No. of 0's are:


