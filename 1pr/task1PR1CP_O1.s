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
	leal	-56(%esp), %esp
	.cfi_def_cfa_offset 60
	call	___main
	movl	$LC0, (%esp)
	call	___mingw_printf
	leal	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	___mingw_scanf
	cmpl	$1, %eax
	jne	L2
	movl	%edi, 48(%esp)
	movl	%ebp, 52(%esp)
	.cfi_offset 7, -12
	.cfi_offset 5, -8
	movl	32(%esp), %ebp
	movl	36(%esp), %edi
	movl	%ebp, %eax
	orl	%edi, %eax
	je	L13
	movl	%ebx, 40(%esp)
	movl	%esi, 44(%esp)
	movl	$9, %eax
	cmpl	%ebp, %eax
	movl	$0, %eax
	sbbl	%edi, %eax
	movl	%ebp, %ecx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	movl	%edi, %ebx
	movl	$-858993459, %esi
	jnc	L4
	movl	%ebp, 24(%esp)
	movl	%edi, 28(%esp)
L3:
	movl	%ecx, %edi
	movl	%ebx, 20(%esp)
	movl	%ecx, %ebp
	addl	%ebx, %ebp
	adcl	$0, %ebp
	movl	%ebp, %eax
	mull	%esi
	movl	%edx, %eax
	shrl	$2, %eax
	andl	$-4, %edx
	addl	%eax, %edx
	subl	%edx, %ebp
	subl	%ebp, %ecx
	sbbl	$0, %ebx
	imull	$-858993459, %ebx, %ebp
	imull	$-858993460, %ecx, %eax
	addl	%eax, %ebp
	movl	%ecx, %eax
	mull	%esi
	movl	%eax, %ecx
	movl	%edx, %ebx
	addl	%ebp, %ebx
	shrdl	$1, %ebx, %ecx
	shrl	%ebx
	movl	$99, %eax
	cmpl	%edi, %eax
	movl	$0, %eax
	sbbl	20(%esp), %eax
	jc	L3
	movl	24(%esp), %ebp
	movl	28(%esp), %edi
L4:
	movl	%ecx, 12(%esp)
	movl	%ebx, 16(%esp)
	movl	%ebp, 4(%esp)
	movl	%edi, 8(%esp)
	movl	$LC3, (%esp)
	call	___mingw_printf
	movl	$0, %eax
	movl	40(%esp), %ebx
	.cfi_restore 3
	movl	44(%esp), %esi
	.cfi_restore 6
	movl	48(%esp), %edi
	.cfi_restore 7
	movl	52(%esp), %ebp
	.cfi_restore 5
	jmp	L1
L13:
	.cfi_offset 5, -8
	.cfi_offset 7, -12
	movl	48(%esp), %edi
	.cfi_restore 7
	movl	52(%esp), %ebp
	.cfi_restore 5
L2:
	movl	$LC2, (%esp)
	call	_puts
	movl	$1, %eax
L1:
	leal	56(%esp), %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE6:
	.def	___main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
