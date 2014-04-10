	.text
.globl asma
	.type	asma, @function
asma:
.LFB0:
	.cfi_startproc
	movdqu (%rdi), %xmm0
	movdqu (%rsi), %xmm1
	PCMPEQb %xmm2, %xmm2

	PXOR %xmm2, %xmm0
	PXOR %xmm2, %xmm1
	pminub %xmm0, %xmm1
	PXOR %xmm2, %xmm1
	movdqu %xmm1, (%rdx)
	rep
	ret
	.cfi_endproc
.LFE0:
	.size	asma, .-asma
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
