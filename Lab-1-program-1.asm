;ALP to display "Hello World" on output device

section .data					; data segment

msg db "Hello, World!", 10, 13			;hello world string, 13, 10 linefeed character
len equ $ -msg					;length of hello world string

msg1 db "First 80386 Program", 10, 13		;second line
len1 equ $ -msg1				;length of second line

section .text					;code segment
	global _start				;must be declared for linker
					
_start:						;tell linker entry point

mov eax, 4					;system call number(sys_write)
mov ebx, 1					;file descriptor(stdout)
mov ecx, msg					;message write
mov edx, len					;message length
int 80h						;call kernel

mov eax, 4					;system call number(sys_write)
mov ebx, 1					;file descriptor(stdout)
mov ecx, msg1					;message write
mov edx, len1					;message length
int 80h						;call kernel

mov eax, 1					;system call number(sys_exit)
int 80h						;call kernel
