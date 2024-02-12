;ALP to perform basic arithmetic operations

section .data
	summsg db " is the sum", 10, 13				;display statements
	len1 equ $ -summsg
	diffmsg db " is the difference", 10, 13
	len2 equ $ -diffmsg
	prodmsg db " is the product", 10, 13
	len3 equ $ -prodmsg
	quomsg db " is the Quotient", 10, 13
	len4 equ $ -quomsg
	remmsg db " is the Remainder", 10, 13
	len5 equ $ -remmsg

section .bss
	sum resb 2						;allocate register to store string in byte (2 bytes)
	diff resb 2
	prod resb 2
	quo resb 2
	rem resb 2

section .text
	global _start
_start:
	mov ax, '3'						;any positive integer(0-9)
	sub ax, '0'						;it reads the number as character so we minus the basic digit character '0' from the digit character to obtain the required digit's ASCII code.
	mov bx, '2'						;any positive integer(0-9)
	sub bx, '0'						
	add ax, bx
	add ax, '0'
	mov [sum], ax						;store the value in eax into sum register

	mov ax, '3'						;any positive integer(0-9)
	sub ax, '0'
	mov bx, '2'						;any positive integer(0-9) which is less than the number in ax register
	sub bx, '0'
	sub ax, bx
	add ax, '0'
	mov [diff], ax						;store the result in diff register

	mov ax, '3'						;any positive integer(0-9)
	sub ax, '0'
	mov bx, '2'						;any positive integer(0-9)
	sub bx, '0'
	mul bx
	add ax, '0'
	mov [prod], ax						;store the result in prod register

	;the dividend is stored in ax register and divisor is stored in bl register which is 8 bit register after "div bl" the quotient is stored in al register and remainder is stored in ah register 
	mov ax, '9'						;any positive integer(0-9)
	sub ax, '0'
	mov bl, '5'						;any positive integer(0-9) which is less than the number in ax register
	sub bl, '0'
	div bl
	add ah, '0'
	add al, '0'
	mov [quo], al						;store value of quotient in quo
	mov [rem], ah						;store value of quotient in rem
	
	;Display Statements

	mov ecx, sum
	mov eax, 4
	mov ebx, 1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, summsg
	mov edx, len1
	int 80h

	mov ecx, diff
	mov eax, 4
	mov ebx, 1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, diffmsg
	mov edx, len2
	int 80h

	mov ecx, prod
	mov eax, 4
	mov ebx, 1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, prodmsg
	mov edx, len3
	int 80h
	
	mov ecx, quo
	mov eax, 4
	mov ebx, 1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, quomsg
	mov edx, len4
	int 80h

	mov ecx, rem
	mov eax, 4
	mov ebx, 1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, remmsg
	mov edx, len5
	int 80h

	mov eax, 1					
	int 80h	
