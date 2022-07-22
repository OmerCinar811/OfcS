mov ah, 0x0e

mov bp, 0x8000
mov sp, bp

push 'A'
push 'B'
push 'C'

; to show how stack grows downward
mov al, [0x7ffe]
int 0x10

; This shouldn't work cuz the stack only points to the top (0x7ffe)
mov al, [0x8000]
int 0x10

pop bx
mov al, bl
int 0x10 ; prints C

pop bx
mov al, bl
int 0x10 ; prints B

pop bx
mov al, bl
int 0x10 ; prints A

mov al, [0x8000]
int 0x10

jmp $
times 510-($-$$) db 0
dw 0xaa55
