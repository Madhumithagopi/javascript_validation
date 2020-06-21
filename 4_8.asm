org 100h
.data 
    msg dw "malayalam$" 
    msglen dw $-msg
    pal dw "Strings are Palindrome$"
    npal dw "Strings are not Palindrome$"
.code
    mov ax,@data
    mov ds,ax   
    lea si,msg
    lea di,msglen-1
    mov ax,msglen
    