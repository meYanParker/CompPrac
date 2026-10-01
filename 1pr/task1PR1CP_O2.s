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
	.section	.text.startup,"x"
	.p2align 4
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB6:
	.cfi_startproc
	subl	$52, %esp
	.cfi_def_cfa_offset 56
	call	___main
	movl	$LC0, (%esp)
	call	___mingw_printf
	leal	28(%esp), %eax
	movl	$LC1, (%esp)
	movl	%eax, 4(%esp)
	call	___mingw_scanf
	cmpl	$1, %eax
	jne	L2
	movl	%esi, 40(%esp)
	.cfi_offset 6, -16
	movl	28(%esp), %esi
	movl	%edi, 44(%esp)
	.cfi_offset 7, -12
	movl	32(%esp), %edi
	movl	%esi, %eax
	orl	%edi, %eax
	je	L16
	movl	$9, %eax
	movl	%ebx, 36(%esp)
	movl	%esi, %ecx
	.cfi_offset 3, -20
	movl	%edi, %ebx
	cmpl	%esi, %eax
	movl	$0, %eax
	sbbl	%edi, %eax
	jnc	L4
	movl	%ebp, 48(%esp)
	.cfi_offset 5, -8
	movl	%esi, 20(%esp)
	movl	%edi, 24(%esp)
	.p2align 4
	.p2align 3
L3:
	movl	%ecx, %ebp
	movl	$-858993459, %eax
	movl	%ecx, %edi
	movl	%ebx, %esi
	addl	%ebx, %ebp
	adcl	$0, %ebp
	mull	%ebp
	movl	%edx, %eax
	andl	$-4, %edx
	shrl	$2, %eax
	addl	%eax, %edx
	subl	%edx, %ebp
	subl	%ebp, %ecx
	sbbl	$0, %ebx
	imull	$-858993460, %ecx, %eax
	imull	$-858993459, %ebx, %ebp
	addl	%eax, %ebp
	movl	$-858993459, %eax
	mull	%ecx
	movl	%edx, %ebx
	movl	%eax, %ecx
	movl	$99, %eax
	addl	%ebp, %ebx
	shrdl	$1, %ebx, %ecx
	shrl	%ebx
	cmpl	%edi, %eax
	movl	$0, %eax
	sbbl	%esi, %eax
	jc	L3
	movl	20(%esp), %esi
	movl	24(%esp), %edi
	movl	48(%esp), %ebp
	.cfi_restore 5
L4:
	movl	%ebx, 16(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	$LC3, (%esp)
	call	___mingw_printf
	movl	36(%esp), %ebx
	.cfi_restore 3
	movl	40(%esp), %esi
	.cfi_restore 6
	xorl	%eax, %eax
	movl	44(%esp), %edi
	.cfi_restore 7
	jmp	L1
L16:
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	movl	40(%esp), %esi
	.cfi_restore 6
	movl	44(%esp), %edi
	.cfi_restore 7
L2:
	movl	$LC2, (%esp)
	call	_puts
	movl	$1, %eax
L1:
	addl	$52, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE6:
	.def	___main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
