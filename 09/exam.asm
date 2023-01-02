[org 0x7c00]


mov ax, 3
int 0x10

xchg bx, bx


mov ax, 0
mov ss, ax
mov sp, 0x7c00

mov cx, 25
loop1:
    call print
    loop loop1

hlt

print:
    mov ax, 0xb800
    mov es, ax
    mov bx, [video]
    mov byte [es:bx], '.'
    add word [video], 2
    ret


video:
    dw 0x0

times 510-($-$$) db 0
db 0x55, 0xaa
