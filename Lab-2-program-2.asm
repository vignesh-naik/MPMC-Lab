;ALP to accept 1 number and display

section .data
	msg1 db "Enter First number : "
	len1 equ $ -msg1
	msg2 db "First number : "
	len2 equ $ -msg2

section .bss
	num1 resb 5

section .text
	global _start
_start:

	mov ecx, msg1
	mov eax, 4
	mov ebx, 1
	mov edx, len1
	int 80h

	mov eax, 3
	mov ebx, 2
	mov ecx, num1
	mov edx, 5
	int 80h

	mov ecx, msg2
	mov eax, 4
	mov ebx, 1
	mov edx, len2
	int 80h
	
	mov ecx, num1
	mov eax, 4
	mov ebx, 1
	mov edx, 5
	int 80h


	mov eax, 1					
	int 80h	
