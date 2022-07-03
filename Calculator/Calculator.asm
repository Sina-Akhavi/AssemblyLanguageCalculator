%include "asm_io.inc"

segment .data
	plusAsciiCode:  db 43
	minusAsciiCode:  db 45
	divAsciiCode:  db 47
	mulAsciiCode: db 42

segment .text

global asm_main
asm_main:
enter 0,0
pusha



call read_int
mov ebx, eax

call read_char
mov ecx, eax


call read_int
mov edx, eax

cmp ecx,[plusAsciiCode]
je ADD 

cmp ecx, [minusAsciiCode]
je SUB

cmp ecx,[mulAsciiCode]
je MUL

cmp ecx, [divAsciiCode]
je DIV

jmp end

DIV:
    mov ecx,edx
    mov edx,0
    mov eax,ebx
    div ecx
    call print_int
    jmp end

MUL:
    mov eax, ebx
    mov ecx, edx
    mul ecx
    call print_int
    
    jmp end

SUB:
    sub ebx, edx
    mov eax, ebx
    call print_int
    jmp end

ADD:
    add ebx,edx
    mov eax,ebx
    call print_int


end:
call print_nl

popa
leave
ret