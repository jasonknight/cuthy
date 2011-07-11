	.file	"algorithm-p.c"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	cmpl	$1, 8(%ebp)
	jg	.L2
	call	help
	movl	$0, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	jmp	.L4
.L2:
	call	banner
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, 28(%esp)
	cmpl	$2, 28(%esp)
	jg	.L3
	movl	$3, 28(%esp)
.L3:
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	primes
.L4:
	leave
	ret
	.size	main, .-main
	.section	.rodata
.LC0:
	.string	"\nUsage: ./program-p.bin int"
	.text
.globl help
	.type	help, @function
help:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$.LC0, (%esp)
	call	puts
	leave
	ret
	.size	help, .-help
	.section	.rodata
	.align 4
.LC1:
	.string	"Algorithm P (Calculate Primes) Page 147 1.3.2"
	.text
.globl banner
	.type	banner, @function
banner:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$.LC1, (%esp)
	call	puts
	leave
	ret
	.size	banner, .-banner
.globl primes
	.type	primes, @function
primes:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$72, %esp
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, -12(%ebp)
.L10:
	movl	-12(%ebp), %eax
	addl	$4, %eax
	movl	$2, (%eax)
	movl	$3, -16(%ebp)
	movl	$1, -20(%ebp)
	jmp	.L11
.L19:
	nop
.L11:
	addl	$1, -20(%ebp)
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
.L12:
	movl	8(%ebp), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jne	.L13
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	print_table
	leave
	ret
.L18:
	nop
.L13:
	addl	$2, -16(%ebp)
	movl	$2, -24(%ebp)
.L14:
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -44(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-44(%ebp)
	movl	%eax, -28(%ebp)
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	-12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-16(%ebp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ecx
	movl	%edx, -32(%ebp)
	cmpl	$0, -32(%ebp)
	je	.L18
.L15:
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-28(%ebp), %eax
	jge	.L19
.L16:
	addl	$1, -24(%ebp)
	jmp	.L14
	.size	primes, .-primes
	.section	.rodata
	.align 4
.LC2:
	.string	"-----+ The first %d Primes +-----\n"
.LC3:
	.string	"\t%d"
	.text
.globl print_table
	.type	print_table, @function
print_table:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	$.LC2, %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$1, -16(%ebp)
	movw	$9, -10(%ebp)
	movw	$0, -12(%ebp)
	jmp	.L21
.L23:
	movl	-16(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	$.LC3, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	addl	$1, -16(%ebp)
	movzwl	-12(%ebp), %eax
	cmpw	-10(%ebp), %ax
	jne	.L22
	movl	$10, (%esp)
	call	putchar
	movw	$0, -12(%ebp)
	jmp	.L21
.L22:
	addw	$1, -12(%ebp)
.L21:
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L23
	movl	$10, (%esp)
	call	putchar
	leave
	ret
	.size	print_table, .-print_table
	.ident	"GCC: (Ubuntu/Linaro 4.4.4-14ubuntu5) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
