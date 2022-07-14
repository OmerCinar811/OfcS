;
; A simple boot sector program that demonstrates addressing
;

mov ah, 0x0e

; ; First attempt
; mov al, the_secret
; int 0x10

; ; Attempt 2
; mov al, [the_secret]
; int 0x10

; Attempt 3 AKA THE ONE THAT WORKS
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; ; Attempt 4
; mov al, [0x7c1e]
; int 0x10

; Infinite hang
jmp $


the_secret:
    db "X"

; Padding zeros
times 510-($-$$) db 0
dw 0xaa55