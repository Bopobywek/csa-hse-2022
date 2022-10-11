.intel_syntax noprefix

.section .rodata        # /
format_string:          # | Форматная строка для вывода искомого числа	
	.string	"%d\n"  # \ 

.text
	.globl	main
	.type	main, @function
main:
	push rbp        # /Пролог функции 
	mov rbp, rsp    # \

	mov rax, 18446744073709551615    # Максимально допустимое значение 
                                     # в 64-х разрядном машинном слове
	mov r8d, 1      # Счётчик значения аргумента факториала
.loop:
	inc r8          # ++r8
	xor edx, edx    # Обнуляем rdx для корректного умножения, т.к. берутся регистры rdx:rax
	div r8          # Делим, частное попадает в rax
	cmp rax, r8     # / Если частное больше делителя, выполняем цикл ещё раз 
	ja .loop        # \ ja, т.к не учитываем знак числа
print_result:
	lea rdi, format_string[rip] 
	mov rsi, r8
	xor eax, eax
	call printf@PLT

	xor eax, eax
	pop rbp	
	ret

