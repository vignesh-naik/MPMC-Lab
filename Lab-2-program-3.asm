section .data
	msg1 db "Enter First number : "
	len1 equ $ -msg1
	msg2 db "Enter Second Number : "
	len2 equ $ -msg2
	msg3 db "The sum is : "
	len3 equ $ -msg3
	msg4 db "", 10, 13
	len4 equ $ -msg4

section .bss
	num1 resb 5
	num2 resb 5
    res resb 5
section .text
	global _start
_start:

    mov eax, 4
	mov ebx, 1
	mov ecx, msg1
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
	
	mov eax, 3
	mov ebx, 2
	mov ecx, num2
	mov edx, 5
	int 80h

    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'
    add eax, ebx
    add eax, '0'
    mov [res], eax
    
    
    mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, len3
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 80h
    
	mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, len4
	int 80h

	mov eax, 1					
	int 80h	
