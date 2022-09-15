.data

message:
	.ascii "Hello, world!\n"    # Сохраняем в памяти нужную строку
	.set length, . - message    # Вычисляем длину строки как разность текущего адреса 
                                # и адреса начала строки


.text
.global _start

_start:
	mov $1, %rax          # 1 = код системного вызова write
	mov $1, %rdi          # первый аргумент write -- файловый дескриптор (stdout=1)
	mov $message, %rsi    # передаем указатель на начало строки
					      # в качестве второго аргумента
	mov $length, %rdx     # передаем количество байт для записи (длину строки)
	syscall               # делаем системный вызов

	mov $60, %rax
	mov $0, %rdi
	syscall

