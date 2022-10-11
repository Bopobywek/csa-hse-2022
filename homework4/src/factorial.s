.intel_syntax noprefix

.section .rodata
input_format:
	.string	"%d"
output_format:
	.string	"%lld\n"

.section .data
n: 
	.long 0

.text
.globl	factorial	
.type	factorial, @function
factorial:
	push rbp
	mov rbp, rsp

	mov rax, 1    # result = 1
	mov rcx, rdi  # i = n
loop:
	cmp rcx, 0        # / while (i != 0)
	je end_factorial  # \
	mul rcx           # result *= i
	dec rcx           # --i 
	jmp loop         
end_factorial:        # результат возвращается через rax      
	pop rbp	
	ret

.globl	main
.type	main, @function
main:
	push rbp
	mov rbp, rsp
scan_input_number:
	lea rdi, input_format[rip]
	lea rsi, n[rip]
	xor eax, eax
	call scanf@PLT
call_factorial:	
	mov rdi, n[rip]
	call factorial
print_result:	
	lea rdi, output_format[rip]
	mov rsi, rax
	xor eax, eax
	call printf@PLT
end_main:
	xor eax, eax
	pop rbp
	ret

