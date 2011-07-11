	.file	"algorithm-e2.c"
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
	jmp	.L3
.L2:
	call	banner
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	easter
.L3:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.string	"Usage: ./program-e.bin int year"
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
	.string	"Algorithm E2 (Calculate Easter Date) Page 160 1.3.2"
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
	.section	.rodata
.LC2:
	.string	"April"
.LC3:
	.string	"march"
	.align 4
.LC4:
	.string	"Easter for %d will be %d%s of %s\n"
	.text
.globl easter
	.type	easter, @function
easter:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$84, %esp
	movl	8(%ebp), %ecx
	movl	$1808407283, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	leal	1(%edx), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	3(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	subl	$12, %eax
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %eax
	leal	0(,%eax,8), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$5, %eax
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	3(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	subl	-20(%ebp), %eax
	subl	$10, %eax
	movl	%eax, -28(%ebp)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	$20, %eax
	addl	-24(%ebp), %eax
	movl	%eax, %ecx
	subl	-20(%ebp), %ecx
	movl	$-2004318071, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%edx,%ecx), %eax
	movl	%eax, %edx
	sarl	$4, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ebx
	subl	%eax, %ebx
	movl	%ebx, %eax
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	sall	$4, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -32(%ebp)
	cmpl	$25, -32(%ebp)
	jne	.L9
	cmpl	$11, -12(%ebp)
	jle	.L9
	addl	$1, -32(%ebp)
.L9:
	movl	$44, %eax
	subl	-32(%ebp), %eax
	movl	%eax, -36(%ebp)
	cmpl	$20, -36(%ebp)
	jg	.L10
	addl	$30, -36(%ebp)
.L10:
	movl	-36(%ebp), %eax
	leal	7(%eax), %ebx
	movl	-36(%ebp), %eax
	movl	-28(%ebp), %edx
	leal	(%edx,%eax), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%edx,%ecx), %eax
	movl	%eax, %edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	subl	%edx, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%ebx, %eax
	subl	%edx, %eax
	movl	%eax, -36(%ebp)
	cmpl	$31, -36(%ebp)
	jle	.L11
	movl	-36(%ebp), %eax
	subl	$31, %eax
	movl	%eax, -40(%ebp)
	movl	$.LC2, -44(%ebp)
	jmp	.L12
.L11:
	movl	-36(%ebp), %eax
	movl	%eax, -40(%ebp)
	movl	$.LC3, -44(%ebp)
.L12:
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	get_ord
	movl	$.LC4, %edx
	movl	-44(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-40(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	printf
	addl	$84, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	easter, .-easter
	.section	.rodata
.LC5:
	.string	"st"
.LC6:
	.string	"nd"
.LC7:
	.string	"rd"
.LC8:
	.string	"th"
	.text
.globl get_ord
	.type	get_ord, @function
get_ord:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	cmpl	$20, 8(%ebp)
	jle	.L15
	movl	8(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -8(%ebp)
	cmpl	$0, -8(%ebp)
	jne	.L16
	movl	-4(%ebp), %eax
	movl	%eax, 8(%ebp)
	jmp	.L15
.L16:
	movl	-8(%ebp), %eax
	movl	%eax, 8(%ebp)
.L15:
	movl	8(%ebp), %eax
	cmpl	$2, %eax
	je	.L19
	cmpl	$3, %eax
	je	.L20
	cmpl	$1, %eax
	jne	.L23
.L18:
	movl	$.LC5, %eax
	jmp	.L21
.L19:
	movl	$.LC6, %eax
	jmp	.L21
.L20:
	movl	$.LC7, %eax
	jmp	.L21
.L23:
	movl	$.LC8, %eax
.L21:
	leave
	ret
	.size	get_ord, .-get_ord
	.ident	"GCC: (Ubuntu/Linaro 4.4.4-14ubuntu5) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
