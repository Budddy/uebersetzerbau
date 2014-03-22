	.text
.globl asmb
	.type	asmb, @function
asmb:
.LFB0:
	.cfi_startproc

	movq $0, %r8

.L1:
	
	movdqu (%rdi,%r8), %xmm0
	movdqu (%rsi,%r8), %xmm1
	movdqu %xmm1, %xmm2

	pminub %xmm0, %xmm2
	movdqu %xmm2, (%rdx,%r8)
	addq $16, %r8

	PCMPISTRI $0, %xmm1, %xmm1
	jz .L2
	PCMPISTRI $0, %xmm0, %xmm0
	jnz .L1

.L2:

	rep
	ret
	.cfi_endproc
.LFE0:
	.size	asmb, .-asmb
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
