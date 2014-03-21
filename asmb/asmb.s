	.text
.globl asmb
	.type	asmb, @function
asmb:
.LFB0:
	.cfi_startproc
	movq $0, %r8

.L1:

	movdqu (%rsi,%r8), %xmm1
	pminub (%rdi,%r8), %xmm1
	movdqu %xmm1, (%rdx,%r8)

	mov (%rdi,%r8), %rcx
	and (%rsi,%r8), %rcx
	addq $1, %r8
	jrcxz .L2
	jmp .L1

.L2:

	ret
	.cfi_endproc
.LFE0:
	.size	asmb, .-asmb
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
