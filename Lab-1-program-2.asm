;ALP to display 9 '*'s on output device

section .data						; data segment

msg db "Display 9 stars", 10, 13			;9 '*' string, 13, 10 linefeed character
len equ $ -msg						;length of the string

star times 9 db '*'

section .text						;code segment
	global _start					;must be declared for linker
					
_start:							;tell linker entry point

mov eax, 4						;system call number(sys_write)
mov ebx, 1						;file descriptor(stdout)
mov ecx, msg						;message write
mov edx, len						;message length
int 80h							;call kernel

mov eax, 4						;system call number(sys_write)
mov ebx, 1						;file descriptor(stdout)
mov ecx, star						;message write
mov edx, 9						;message length
int 80h							;call kernel

mov eax, 1						;system call number(sys_exit)
int 80h							;call kernel
