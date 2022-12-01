data segment
    msg1 db "array's are same$"
    msg2 db "array's are not same$"
    array1 db 22,55,44,47,88
    array2 db 34, 55 ,44, 47,88 
    lgt dw 5
data ends

        code segment
            assume cs:code ds:data
            
            start: mov ax,data
                   mov ds,ax
                   mov cx,lgt
                   mov si,offset array1
                   mov di,offset array2
                   
            again: mov al,array1[si]
                   cmp array2[di],al
                   jne L1
                   inc si
                   inc di
                   loop again
                   mov dx,offset msg1
                   mov ah,09h
                   int 21h
                   jmp L2
                   
            L1:    mov dx,offset msg2
                   mov ah,09h
                   int 21h
                   
            L2:    mov ah,4ch
                   int 21h
                   
            code ends
                 end start
