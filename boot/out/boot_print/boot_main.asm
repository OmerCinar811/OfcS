; Bootsector offset
[org 0x7c00]

; Hello messsage
mov bx, HELLO
call print

call print_nl

; Goodbye message
mov bx, GOODBYE
call print

call print_nl

mov dx, 0x12fe
call print_hex

; Hang
jmp $ 

%include "boot_funcstr.asm"
%include "boot_funhex.asm"

HELLO:
    db "Hello, World", 0

GOODBYE:
    db "Goodbye", 0



; padding
times 510-($-$$) db 0
dw 0xaa55