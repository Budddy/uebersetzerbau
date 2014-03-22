	.text
.globl asmb
	.type	asmb, @function
asmb:
.LFB0:
	.cfi_startproc

	movq $0, %r8 				# zaehler initialisieren

.L1:
	
	movdqu (%rdi,%r8), %xmm0 	# die naechsten 16 bytes in xmm0 fuellen
	movdqu (%rsi,%r8), %xmm2 	# die naechsten 16 bytes in xmm2 fuellen

	pminub %xmm0, %xmm2			# minimum in xmm2 schreiben
	movdqu %xmm2, (%rdx,%r8)	# xmm2 in den hauptspeicher schreiben
	addq $16, %r8 				# schleifenzähler um 16 erhoehen

	PCMPISTRI $0, %xmm2, %xmm2 	# check ob ein null byte im ergebnis
	jnz .L1 					# wenn nicht nochmal von vorne starten

	rep
	ret
	.cfi_endproc
.LFE0:
	.size	asmb, .-asmb
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
