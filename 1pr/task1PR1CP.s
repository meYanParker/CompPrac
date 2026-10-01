	.file	"task1PR1CP.c"
	.text
	.section .rdata,"dr"
LC0:
	.ascii "Enter a natural number: \0"
LC1:
	.ascii "%llu\0"
LC2:
	.ascii "Invalid input!\0"
	.align 4
LC3:
	.ascii "The first digit of %llu is %llu\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	call	___main
	movl	$LC0, (%esp)
	call	___mingw_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	___mingw_scanf
	cmpl	$1, %eax
	jne	L2
	movl	-20(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	L3
L2:
	movl	$LC2, (%esp)
	call	_puts
	movl	$1, %eax
	jmp	L7
L3:
	movl	-20(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%eax, -12(%ebp)
	movl	%edx, -8(%ebp)
	jmp	L5
L6:
	movl	-12(%ebp), %eax
	movl	-8(%ebp), %edx
	movl	$10, 8(%esp)
	movl	$0, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	___udivdi3
	movl	%eax, -12(%ebp)
	movl	%edx, -8(%ebp)
L5:
	movl	$9, %edx
	movl	$0, %eax
	cmpl	-12(%ebp), %edx
	sbbl	-8(%ebp), %eax
	jc	L6
	movl	-20(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %ecx
	movl	-8(%ebp), %ebx
	movl	%ecx, 12(%esp)
	movl	%ebx, 16(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	$LC3, (%esp)
	call	___mingw_printf
	movl	$0, %eax
L7:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE6:
	.def	___udivdi3;	.scl	2;	.type	32;	.endef
	.def	___main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
