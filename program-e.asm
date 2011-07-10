	.file	"algorithm-e.c"
	.section	.rodata
	.align 4
.LC0:
	.string	"Finding the greatest common denominator for %d and %d\n"
	.align 4
.LC1:
	.string	"The greatest common denominator is %d\n"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	cmpl	$2, 8(%ebp)
	jg	.L2
	call	help
	movl	$0, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	jmp	.L6
.L2:
	call	banner
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, 28(%esp)
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, 24(%esp)
	movl	28(%esp), %eax
	cmpl	24(%esp), %eax
	jge	.L3
	movl	24(%esp), %eax
	movl	%eax, 16(%esp)
	movl	28(%esp), %eax
	movl	%eax, 24(%esp)
	movl	16(%esp), %eax
	movl	%eax, 28(%esp)
.L3:
	movl	$.LC0, %eax
	movl	24(%esp), %edx
	movl	%edx, 8(%esp)
	movl	28(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	28(%esp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	24(%esp)
	movl	%edx, 20(%esp)
	jmp	.L4
.L5:
	movl	24(%esp), %eax
	movl	%eax, 28(%esp)
	movl	20(%esp), %eax
	movl	%eax, 24(%esp)
	movl	28(%esp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	24(%esp)
	movl	%edx, 20(%esp)
.L4:
	cmpl	$0, 20(%esp)
	jne	.L5
	movl	$.LC1, %eax
	movl	24(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
.L6:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 4
.LC2:
	.string	"\nUsage: ./program-e.bin int int"
	.text
.globl help
	.type	help, @function
help:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$.LC2, (%esp)
	call	puts
	leave
	ret
	.size	help, .-help
	.section	.rodata
	.align 4
.LC3:
	.string	"Algorithm E (Euclid's algorithm) Page 2 1.1"
	.text
.globl banner
	.type	banner, @function
banner:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$.LC3, (%esp)
	call	puts
	leave
	ret
	.size	banner, .-banner
	.ident	"GCC: (Ubuntu/Linaro 4.4.4-14ubuntu5) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
