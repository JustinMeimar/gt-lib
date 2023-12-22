	.file	"main.c"
	.text
.Ltext0:
	.file 0 "/home/justin/projects/gt-lib" "main.c"
	.globl	gt_arr
	.bss
	.align 32
	.type	gt_arr, @object
	.size	gt_arr, 320
gt_arr:
	.zero	320
	.globl	cur_gt
	.align 8
	.type	cur_gt, @object
	.size	cur_gt, 8
cur_gt:
	.zero	8
	.section	.rodata
.LC0:
	.string	"------------"
.LC1:
	.string	"id: %d\n"
.LC2:
	.string	"state: %d\n"
	.text
	.globl	print_gt_table
	.type	print_gt_table, @function
print_gt_table:
.LFB6:
	.file 1 "main.c"
	.loc 1 41 23
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
.LBB2:
	.loc 1 42 14
	movl	$0, -100(%rbp)
	.loc 1 42 5
	jmp	.L2
.L3:
.LBB3:
	.loc 1 43 12 discriminator 3
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	gt_arr(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	8(%rdx,%rax), %rbx
	movq	%rcx, -96(%rbp)
	movq	%rbx, -88(%rbp)
	movq	16(%rdx,%rax), %rcx
	movq	24(%rdx,%rax), %rbx
	movq	%rcx, -80(%rbp)
	movq	%rbx, -72(%rbp)
	movq	32(%rdx,%rax), %rcx
	movq	40(%rdx,%rax), %rbx
	movq	%rcx, -64(%rbp)
	movq	%rbx, -56(%rbp)
	movq	48(%rdx,%rax), %rcx
	movq	56(%rdx,%rax), %rbx
	movq	%rcx, -48(%rbp)
	movq	%rbx, -40(%rbp)
	leaq	64(%rdx,%rax), %rdx
	movq	(%rdx), %rax
	movq	8(%rdx), %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 1 44 9 discriminator 3
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 45 9 discriminator 3
	movl	-96(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 46 33 discriminator 3
	movl	-24(%rbp), %eax
	.loc 1 46 9 discriminator 3
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 47 9 discriminator 3
	pushq	-48(%rbp)
	pushq	-56(%rbp)
	pushq	-64(%rbp)
	pushq	-72(%rbp)
	pushq	-80(%rbp)
	pushq	-88(%rbp)
	call	dump_regs
	addq	$48, %rsp
.LBE3:
	.loc 1 42 33 discriminator 3
	addl	$1, -100(%rbp)
.L2:
	.loc 1 42 22 discriminator 1
	cmpl	$3, -100(%rbp)
	jle	.L3
.LBE2:
	.loc 1 49 1
	nop
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_gt_table, .-print_gt_table
	.section	.rodata
.LC3:
	.string	"in gt_return"
.LC4:
	.string	"no more threads to run"
	.text
	.globl	gt_return
	.type	gt_return, @function
gt_return:
.LFB7:
	.loc 1 51 17
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 53 5
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 55 11
	movq	cur_gt(%rip), %rax
	.loc 1 55 19
	movl	$0, 72(%rax)
	.loc 1 56 10
	nop
.L5:
	.loc 1 56 11 discriminator 1
	movl	$0, %eax
	call	gt_yield
	testb	%al, %al
	jne	.L5
	.loc 1 59 5
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 61 5
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE7:
	.size	gt_return, .-gt_return
	.section	.rodata
.LC5:
	.string	"enter yield"
.LC6:
	.string	"print innocent variable: %d\n"
.LC7:
	.string	"cur_gt: %d, %d\n"
.LC8:
	.string	"yeilding thread: %d\n"
.LC9:
	.string	"iter"
.LC10:
	.string	"rdy_gt: %d, %d\n"
.LC11:
	.string	"yeilding from :%d to %d\n"
	.text
	.globl	gt_yield
	.type	gt_yield, @function
gt_yield:
.LFB8:
	.loc 1 65 17
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 67 9
	movl	$5, -28(%rbp)
	.loc 1 68 5
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 69 5
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 70 53
	movq	cur_gt(%rip), %rax
	movl	72(%rax), %eax
	.loc 1 70 5
	cmpl	$1, %eax
	sete	%al
	movzbl	%al, %edx
	.loc 1 70 38
	movq	cur_gt(%rip), %rax
	movl	72(%rax), %eax
	.loc 1 70 5
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 71 43
	movq	cur_gt(%rip), %rax
	.loc 1 71 5
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 73 9
	movq	cur_gt(%rip), %rax
	movq	%rax, -24(%rbp)
	.loc 1 75 11
	jmp	.L7
.L10:
	.loc 1 76 9
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 77 19
	movq	-24(%rbp), %rax
	leaq	80(%rax), %rdx
	movq	%rdx, -24(%rbp)
	.loc 1 77 12
	leaq	320+gt_arr(%rip), %rdx
	cmpq	%rdx, %rax
	jne	.L8
	.loc 1 78 20
	leaq	gt_arr(%rip), %rax
	movq	%rax, -24(%rbp)
.L8:
	.loc 1 79 20
	movq	cur_gt(%rip), %rax
	.loc 1 79 12
	cmpq	%rax, -24(%rbp)
	jne	.L7
	.loc 1 80 20
	movl	$0, %eax
	jmp	.L9
.L7:
	.loc 1 75 18
	movq	-24(%rbp), %rax
	movl	72(%rax), %eax
	.loc 1 75 26
	cmpl	$1, %eax
	jne	.L10
	.loc 1 83 50
	movq	cur_gt(%rip), %rax
	movl	72(%rax), %edx
	.loc 1 83 38
	movq	cur_gt(%rip), %rax
	.loc 1 83 5
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 84 50
	movq	-24(%rbp), %rax
	movl	72(%rax), %edx
	.loc 1 84 5
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 86 15
	movq	-24(%rbp), %rax
	movl	72(%rax), %eax
	.loc 1 86 8
	cmpl	$1, %eax
	jne	.L11
.LBB4:
	.loc 1 88 9
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	.loc 1 88 51
	movq	cur_gt(%rip), %rax
	.loc 1 88 9
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 92 23
	movq	-24(%rbp), %rax
	movl	$2, 72(%rax)
	.loc 1 94 22
	movq	cur_gt(%rip), %rax
	.loc 1 94 13
	addq	$8, %rax
	movq	%rax, -16(%rbp)
	.loc 1 95 13
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -8(%rbp)
	.loc 1 96 16
	movq	-24(%rbp), %rax
	movq	%rax, cur_gt(%rip)
	.loc 1 98 9
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gt_switch@PLT
	.loc 1 100 16
	movl	$1, %eax
	jmp	.L9
.L11:
.LBE4:
	.loc 1 102 12
	movl	$0, %eax
.L9:
	.loc 1 103 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	gt_yield, .-gt_yield
	.globl	gt_init
	.type	gt_init, @function
gt_init:
.LFB9:
	.loc 1 105 16
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 106 12
	leaq	gt_arr(%rip), %rax
	movq	%rax, cur_gt(%rip)
	.loc 1 107 11
	movq	cur_gt(%rip), %rax
	.loc 1 107 16
	movl	$1, (%rax)
	.loc 1 108 11
	movq	cur_gt(%rip), %rax
	.loc 1 108 19
	movl	$2, 72(%rax)
	.loc 1 109 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	gt_init, .-gt_init
	.globl	gt_start
	.type	gt_start, @function
gt_start:
.LFB10:
	.loc 1 111 37
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	.loc 1 116 20
	movl	$8192, %edi
	call	malloc@PLT
	.loc 1 116 18
	movq	%rax, -40(%rbp)
	.loc 1 117 24
	movq	-40(%rbp), %rax
	.loc 1 117 17
	addq	$8184, %rax
	.loc 1 117 49
	leaq	gt_return(%rip), %rdx
	.loc 1 117 47
	movq	%rdx, (%rax)
	.loc 1 118 24
	movq	-40(%rbp), %rax
	.loc 1 118 17
	leaq	8176(%rax), %rdx
	.loc 1 118 50
	movq	-120(%rbp), %rax
	.loc 1 118 48
	movq	%rax, (%rdx)
	.loc 1 120 39
	movq	-40(%rbp), %rax
	.loc 1 120 32
	addq	$8176, %rax
	.loc 1 120 20
	movq	%rax, -88(%rbp)
	.loc 1 121 18
	movl	$1, -24(%rbp)
	.loc 1 122 19
	movl	id.0(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, id.0(%rip)
	.loc 1 122 15
	movl	%eax, -96(%rbp)
	.loc 1 125 9
	movq	cur_gt(%rip), %rax
	movq	%rax, -104(%rbp)
	.loc 1 126 11
	jmp	.L14
.L17:
	.loc 1 127 12
	addq	$80, -104(%rbp)
	leaq	320+gt_arr(%rip), %rax
	cmpq	%rax, -104(%rbp)
	jne	.L15
	.loc 1 128 21
	leaq	gt_arr(%rip), %rax
	movq	%rax, -104(%rbp)
.L15:
	.loc 1 129 21
	movq	cur_gt(%rip), %rax
	.loc 1 129 12
	cmpq	%rax, -104(%rbp)
	jne	.L14
	.loc 1 130 20
	movl	$-1, %eax
	jmp	.L18
.L14:
	.loc 1 126 19
	movq	-104(%rbp), %rax
	movl	72(%rax), %eax
	.loc 1 126 27
	testl	%eax, %eax
	jne	.L17
	.loc 1 133 14
	movq	-104(%rbp), %rax
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rbx
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rbx
	movq	%rcx, 32(%rax)
	movq	%rbx, 40(%rax)
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rbx
	movq	%rcx, 48(%rax)
	movq	%rbx, 56(%rax)
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rbx
	movq	%rcx, 64(%rax)
	movq	%rbx, 72(%rax)
	.loc 1 135 12
	movl	$0, %eax
.L18:
	.loc 1 136 1 discriminator 1
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	gt_start, .-gt_start
	.section	.rodata
.LC12:
	.string	"gt switched to me!"
	.text
	.globl	gt_function
	.type	gt_function, @function
gt_function:
.LFB11:
	.loc 1 138 30
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 139 5
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 140 5
	movl	$1, %edi
	call	sleep@PLT
	.loc 1 141 12
	movl	$0, %eax
	.loc 1 142 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	gt_function, .-gt_function
	.section	.rodata
.LC13:
	.string	"returned to main thread"
	.text
	.globl	main
	.type	main, @function
main:
.LFB12:
	.loc 1 144 12
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 144 12
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 145 5
	movl	$0, %eax
	call	gt_init
	.loc 1 147 9
	movl	$6, -12(%rbp)
	.loc 1 149 5
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	gt_function(%rip), %rax
	movq	%rax, %rdi
	call	gt_start
	.loc 1 153 5
	movl	$0, %eax
	call	print_gt_table
	.loc 1 154 5
	movl	$0, %eax
	call	gt_return
	.loc 1 156 5
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	.loc 1 157 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.section	.rodata
.LC14:
	.string	"rsp: 0x%lx\n"
.LC15:
	.string	"rbp: 0x%lx\n"
.LC16:
	.string	"r12: 0x%lx\n"
.LC17:
	.string	"r14: 0x%lx\n"
.LC18:
	.string	"r15: 0x%lx\n"
.LC19:
	.string	"r16: 0x%lx\n"
	.text
	.globl	dump_regs
	.type	dump_regs, @function
dump_regs:
.LFB13:
	.loc 1 159 27
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 160 5
	movq	16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 161 5
	movq	24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 162 5
	movq	32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 163 5
	movq	40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 164 5
	movq	48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 165 5
	movq	56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 166 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	dump_regs, .-dump_regs
	.data
	.align 4
	.type	id.0, @object
	.size	id.0, 4
id.0:
	.long	2
	.text
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 5 "/usr/include/unistd.h"
	.file 6 "/usr/include/stdlib.h"
	.file 7 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x47a
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x11
	.long	.LASF42
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0x26
	.byte	0x17
	.long	0x2e
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x12
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.long	.LASF9
	.byte	0x2
	.byte	0x2a
	.byte	0x16
	.long	0x3c
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x2
	.long	.LASF11
	.byte	0x2
	.byte	0x2d
	.byte	0x1b
	.long	0x43
	.uleb128 0x13
	.byte	0x8
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x14
	.long	0x8c
	.uleb128 0x2
	.long	.LASF13
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.long	0x43
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF14
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x2
	.long	.LASF16
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.long	0x51
	.uleb128 0x2
	.long	.LASF17
	.byte	0x4
	.byte	0x1a
	.byte	0x14
	.long	0x6b
	.uleb128 0x2
	.long	.LASF18
	.byte	0x4
	.byte	0x1b
	.byte	0x14
	.long	0x7e
	.uleb128 0x2
	.long	.LASF19
	.byte	0x1
	.byte	0xe
	.byte	0x11
	.long	0xe2
	.uleb128 0x6
	.long	0xe7
	.uleb128 0x15
	.long	0x8a
	.long	0xf6
	.uleb128 0x4
	.long	0x8a
	.byte	0
	.uleb128 0xc
	.byte	0x30
	.byte	0x12
	.long	0x146
	.uleb128 0x3
	.string	"rsp"
	.byte	0x13
	.byte	0xe
	.long	0xca
	.byte	0
	.uleb128 0x3
	.string	"rbp"
	.byte	0x13
	.byte	0x13
	.long	0xca
	.byte	0x8
	.uleb128 0x3
	.string	"r12"
	.byte	0x13
	.byte	0x18
	.long	0xca
	.byte	0x10
	.uleb128 0x3
	.string	"r14"
	.byte	0x13
	.byte	0x1d
	.long	0xca
	.byte	0x18
	.uleb128 0x3
	.string	"r15"
	.byte	0x13
	.byte	0x22
	.long	0xca
	.byte	0x20
	.uleb128 0x3
	.string	"r16"
	.byte	0x13
	.byte	0x27
	.long	0xca
	.byte	0x28
	.byte	0
	.uleb128 0x2
	.long	.LASF20
	.byte	0x1
	.byte	0x14
	.byte	0x3
	.long	0xf6
	.uleb128 0x16
	.byte	0x7
	.byte	0x4
	.long	0x3c
	.byte	0x1
	.byte	0x1b
	.byte	0xa
	.long	0x173
	.uleb128 0x8
	.long	.LASF21
	.byte	0
	.uleb128 0x8
	.long	.LASF22
	.byte	0x1
	.uleb128 0x8
	.long	.LASF23
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.byte	0x50
	.byte	0x16
	.long	0x1b6
	.uleb128 0x3
	.string	"id"
	.byte	0x17
	.byte	0xe
	.long	0xbe
	.byte	0
	.uleb128 0x3
	.string	"ctx"
	.byte	0x18
	.byte	0xb
	.long	0x146
	.byte	0x8
	.uleb128 0xd
	.long	.LASF24
	.byte	0x19
	.byte	0xe
	.long	0x1b6
	.byte	0x38
	.uleb128 0x3
	.string	"tls"
	.byte	0x1a
	.byte	0xb
	.long	0x8a
	.byte	0x40
	.uleb128 0xd
	.long	.LASF25
	.byte	0x1f
	.byte	0x7
	.long	0x152
	.byte	0x48
	.byte	0
	.uleb128 0x6
	.long	0xb2
	.uleb128 0x17
	.string	"gt"
	.byte	0x1
	.byte	0x20
	.byte	0x3
	.long	0x173
	.uleb128 0x18
	.long	0x1bb
	.long	0x1d6
	.uleb128 0x19
	.long	0x43
	.byte	0x3
	.byte	0
	.uleb128 0xe
	.long	.LASF26
	.byte	0x26
	.byte	0x4
	.long	0x1c6
	.uleb128 0x9
	.byte	0x3
	.quad	gt_arr
	.uleb128 0xe
	.long	.LASF27
	.byte	0x27
	.byte	0x5
	.long	0x200
	.uleb128 0x9
	.byte	0x3
	.quad	cur_gt
	.uleb128 0x6
	.long	0x1bb
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x1d0
	.byte	0x15
	.long	0x3c
	.long	0x21c
	.uleb128 0x4
	.long	0x3c
	.byte	0
	.uleb128 0x9
	.long	.LASF29
	.byte	0x6
	.value	0x21c
	.byte	0xe
	.long	0x8a
	.long	0x233
	.uleb128 0x4
	.long	0x98
	.byte	0
	.uleb128 0x1a
	.long	.LASF43
	.byte	0x1
	.byte	0x22
	.byte	0xd
	.long	0x24a
	.uleb128 0x4
	.long	0x24a
	.uleb128 0x4
	.long	0x24a
	.byte	0
	.uleb128 0x6
	.long	0x146
	.uleb128 0x1b
	.long	.LASF30
	.byte	0x6
	.value	0x270
	.byte	0xd
	.long	0x262
	.uleb128 0x4
	.long	0x64
	.byte	0
	.uleb128 0x9
	.long	.LASF31
	.byte	0x7
	.value	0x164
	.byte	0xc
	.long	0x64
	.long	0x27a
	.uleb128 0x4
	.long	0x27a
	.uleb128 0x1c
	.byte	0
	.uleb128 0x6
	.long	0x93
	.uleb128 0x1d
	.long	.LASF32
	.byte	0x1
	.byte	0x9f
	.byte	0x6
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x2ac
	.uleb128 0x7
	.string	"ctx"
	.byte	0x9f
	.byte	0x16
	.long	0x146
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.long	.LASF33
	.byte	0x90
	.byte	0x5
	.long	0x64
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x2da
	.uleb128 0x5
	.string	"x"
	.byte	0x93
	.byte	0x9
	.long	0x64
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x10
	.long	.LASF34
	.byte	0x8a
	.byte	0x7
	.long	0x8a
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x30a
	.uleb128 0x7
	.string	"arg"
	.byte	0x8a
	.byte	0x19
	.long	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF35
	.byte	0x6f
	.byte	0x5
	.long	0x64
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x37a
	.uleb128 0x7
	.string	"f"
	.byte	0x6f
	.byte	0x17
	.long	0xd6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x7
	.string	"arg"
	.byte	0x6f
	.byte	0x20
	.long	0x8a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x5
	.string	"id"
	.byte	0x71
	.byte	0x15
	.long	0xbe
	.uleb128 0x9
	.byte	0x3
	.quad	id.0
	.uleb128 0xa
	.long	.LASF36
	.byte	0x73
	.byte	0x8
	.long	0x1bb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0xa
	.long	.LASF37
	.byte	0x7d
	.byte	0x9
	.long	0x200
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x1e
	.long	.LASF44
	.byte	0x1
	.byte	0x69
	.byte	0x6
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.long	.LASF38
	.byte	0x41
	.byte	0x6
	.long	0x3fe
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x3fe
	.uleb128 0x5
	.string	"x"
	.byte	0x43
	.byte	0x9
	.long	0x64
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xa
	.long	.LASF39
	.byte	0x49
	.byte	0x9
	.long	0x200
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xb
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x5
	.string	"old"
	.byte	0x59
	.byte	0x10
	.long	0x24a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.string	"new"
	.byte	0x59
	.byte	0x16
	.long	0x24a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1
	.byte	0x1
	.byte	0x2
	.long	.LASF40
	.uleb128 0x1f
	.long	.LASF45
	.byte	0x1
	.byte	0x33
	.byte	0x5
	.long	0x64
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.long	.LASF41
	.byte	0x1
	.byte	0x29
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x5
	.string	"i"
	.byte	0x2a
	.byte	0xe
	.long	0x64
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0xb
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x5
	.string	"tr"
	.byte	0x2b
	.byte	0xc
	.long	0x1bb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF45:
	.string	"gt_return"
.LASF8:
	.string	"__uint8_t"
.LASF30:
	.string	"exit"
.LASF25:
	.string	"state"
.LASF41:
	.string	"print_gt_table"
.LASF43:
	.string	"gt_switch"
.LASF10:
	.string	"long int"
.LASF24:
	.string	"stack"
.LASF18:
	.string	"uint64_t"
.LASF19:
	.string	"func_ptr"
.LASF6:
	.string	"signed char"
.LASF20:
	.string	"ctx_t"
.LASF2:
	.string	"unsigned char"
.LASF5:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF13:
	.string	"size_t"
.LASF9:
	.string	"__uint32_t"
.LASF35:
	.string	"gt_start"
.LASF32:
	.string	"dump_regs"
.LASF37:
	.string	"free_gt"
.LASF7:
	.string	"short int"
.LASF42:
	.string	"GNU C17 11.4.0 -mtune=generic -march=x86-64 -g -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF4:
	.string	"unsigned int"
.LASF15:
	.string	"long long unsigned int"
.LASF16:
	.string	"uint8_t"
.LASF34:
	.string	"gt_function"
.LASF22:
	.string	"READY"
.LASF33:
	.string	"main"
.LASF14:
	.string	"long long int"
.LASF38:
	.string	"gt_yield"
.LASF12:
	.string	"char"
.LASF39:
	.string	"rdy_gt"
.LASF21:
	.string	"UNUSED"
.LASF31:
	.string	"printf"
.LASF44:
	.string	"gt_init"
.LASF11:
	.string	"__uint64_t"
.LASF26:
	.string	"gt_arr"
.LASF17:
	.string	"uint32_t"
.LASF27:
	.string	"cur_gt"
.LASF23:
	.string	"RUNNING"
.LASF36:
	.string	"new_gt"
.LASF28:
	.string	"sleep"
.LASF40:
	.string	"_Bool"
.LASF29:
	.string	"malloc"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"main.c"
.LASF1:
	.string	"/home/justin/projects/gt-lib"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
