	.text
	.file	"main.c"
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	stp	d9, d8, [sp, #-112]!            // 16-byte Folded Spill
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	stp	x28, x27, [sp, #32]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             // 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 96
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_remember_state
	sub	sp, sp, #3, lsl #12             // =12288
	sub	sp, sp, #3776
	mov	x19, x1
	ldr	x0, [x1, #8]
	mov	x1, xzr
	mov	w2, #10                         // =0xa
	bl	strtol
	mov	x21, x0
	ldr	x0, [x19, #16]
	mov	x1, xzr
	mov	w2, #10                         // =0xa
	bl	strtol
	cmp	w21, #1000
	b.hs	.LBB0_23
// %bb.1:
	lsl	x9, x0, #32
	sxtw	x8, w0
	mov	x0, xzr
	stp	x9, x8, [sp, #8]                // 16-byte Folded Spill
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	mov	w8, #18140                      // =0x46dc
	add	x25, sp, #2, lsl #12            // =8192
	movk	w8, #3, lsl #16
	movi	v8.2s, #48, lsl #24
	add	x27, sp, #1, lsl #12            // =4096
	mov	x24, xzr
	smull	x21, w21, w8
	mov	x19, xzr
	mov	x20, xzr
	add	x25, x25, #3864
	add	x26, sp, #4056
	add	x27, x27, #3960
	add	x28, sp, #56
	mov	w23, #10000                     // =0x2710
	b	.LBB0_3
.LBB0_2:                                //   in Loop: Header=BB0_3 Depth=1
	add	x24, x24, #1
	cmp	x24, x23
	b.eq	.LBB0_9
.LBB0_3:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	cmp	x21, w0, sxtw
	b.ls	.LBB0_6
// %bb.4:                               //   in Loop: Header=BB0_3 Depth=1
	cmp	x20, #999
	b.hi	.LBB0_6
// %bb.5:                               //   in Loop: Header=BB0_3 Depth=1
	lsl	x22, x20, #2
	str	w24, [x25, x22]
	bl	rand
	scvtf	s0, w0
	add	x20, x20, #1
	fmul	s0, s0, s8
	str	s0, [x26, x22]
.LBB0_6:                                //   in Loop: Header=BB0_3 Depth=1
	bl	rand
	cmp	x21, w0, sxtw
	b.ls	.LBB0_2
// %bb.7:                               //   in Loop: Header=BB0_3 Depth=1
	cmp	x19, #999
	b.hi	.LBB0_2
// %bb.8:                               //   in Loop: Header=BB0_3 Depth=1
	lsl	x22, x19, #2
	str	w24, [x27, x22]
	bl	rand
	scvtf	s0, w0
	add	x19, x19, #1
	fmul	s0, s0, s8
	str	s0, [x28, x22]
	b	.LBB0_2
.LBB0_9:
	add	x1, sp, #40
	mov	w0, #1                          // =0x1
	stp	xzr, xzr, [sp, #40]
	stp	xzr, xzr, [sp, #24]
	bl	clock_gettime
	ldr	x23, [sp, #8]                   // 8-byte Folded Reload
	cbz	x23, .LBB0_13
// %bb.10:
	ldr	x22, [sp, #16]                  // 8-byte Folded Reload
	cmp	x22, #1
	csinc	x21, x22, xzr, hi
.LBB0_11:                               // =>This Inner Loop Header: Depth=1
	add	x0, sp, #2, lsl #12             // =8192
	add	x1, sp, #1, lsl #12             // =4096
	add	x0, x0, #3864
	add	x1, x1, #3960
	add	x2, sp, #4056
	add	x3, sp, #56
	mov	x4, x20
	mov	x5, x19
	bl	v_sparse_dot
	subs	x21, x21, #1
	b.ne	.LBB0_11
// %bb.12:
	fcvt	d8, s0
	b	.LBB0_14
.LBB0_13:
	ldr	x22, [sp, #16]                  // 8-byte Folded Reload
                                        // implicit-def: $d8
.LBB0_14:
	add	x1, sp, #24
	mov	w0, #1                          // =0x1
	bl	clock_gettime
	ldp	x8, x9, [sp, #24]
	ucvtf	d9, x22
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	ldp	x10, x11, [sp, #40]
	sub	x8, x8, x10
	mov	x10, #225833675390976           // =0xcd6500000000
	sub	x9, x9, x11
	movk	x10, #16845, lsl #48
	scvtf	d0, x8
	scvtf	d1, x9
	fmov	d2, x10
	fmadd	d0, d0, d2, d1
	fdiv	d1, d0, d9
	fmov	d0, d8
	bl	printf
	add	x1, sp, #40
	mov	w0, #1                          // =0x1
	bl	clock_gettime
	cbz	x23, .LBB0_18
// %bb.15:
	cmp	x22, #1
	csinc	x21, x22, xzr, hi
.LBB0_16:                               // =>This Inner Loop Header: Depth=1
	add	x0, sp, #2, lsl #12             // =8192
	add	x1, sp, #1, lsl #12             // =4096
	add	x0, x0, #3864
	add	x1, x1, #3960
	add	x2, sp, #4056
	add	x3, sp, #56
	mov	x4, x20
	mov	x5, x19
	bl	v_sparse_dot_omp
	subs	x21, x21, #1
	b.ne	.LBB0_16
// %bb.17:
	fcvt	d8, s0
.LBB0_18:
	add	x1, sp, #24
	mov	w0, #1                          // =0x1
	bl	clock_gettime
	ldp	x8, x9, [sp, #24]
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	ldp	x10, x11, [sp, #40]
	sub	x8, x8, x10
	mov	x10, #225833675390976           // =0xcd6500000000
	sub	x9, x9, x11
	movk	x10, #16845, lsl #48
	scvtf	d0, x8
	scvtf	d1, x9
	fmov	d2, x10
	fmadd	d0, d0, d2, d1
	fdiv	d1, d0, d9
	fmov	d0, d8
	bl	printf
	add	x1, sp, #40
	mov	w0, #1                          // =0x1
	bl	clock_gettime
	cbz	x23, .LBB0_22
// %bb.19:
	cmp	x22, #1
	csinc	x21, x22, xzr, hi
.LBB0_20:                               // =>This Inner Loop Header: Depth=1
	add	x0, sp, #2, lsl #12             // =8192
	add	x1, sp, #1, lsl #12             // =4096
	add	x0, x0, #3864
	add	x1, x1, #3960
	add	x2, sp, #4056
	add	x3, sp, #56
	mov	x4, x20
	mov	x5, x19
	bl	v_sparse_dot_sve
	subs	x21, x21, #1
	b.ne	.LBB0_20
// %bb.21:
	fcvt	d8, s0
.LBB0_22:
	add	x1, sp, #24
	mov	w0, #1                          // =0x1
	bl	clock_gettime
	ldp	x8, x9, [sp, #24]
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	ldp	x10, x11, [sp, #40]
	sub	x8, x8, x10
	mov	x10, #225833675390976           // =0xcd6500000000
	sub	x9, x9, x11
	movk	x10, #16845, lsl #48
	scvtf	d0, x8
	scvtf	d1, x9
	fmov	d2, x10
	fmadd	d0, d0, d2, d1
	fdiv	d1, d0, d9
	fmov	d0, d8
	bl	printf
	mov	w0, wzr
	add	sp, sp, #3, lsl #12             // =12288
	add	sp, sp, #3776
	.cfi_def_cfa wsp, 112
	ldp	x20, x19, [sp, #96]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	ldp	d9, d8, [sp], #112              // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore w25
	.cfi_restore w26
	.cfi_restore w27
	.cfi_restore w28
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore b8
	.cfi_restore b9
	ret
.LBB0_23:
	.cfi_restore_state
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	adrp	x1, .L.str.1
	add	x1, x1, :lo12:.L.str.1
	adrp	x3, .L__PRETTY_FUNCTION__.main
	add	x3, x3, :lo12:.L__PRETTY_FUNCTION__.main
	mov	w2, #23                         // =0x17
	bl	__assert_fail
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"n < 1000"
	.size	.L.str, 9

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"main.c"
	.size	.L.str.1, 7

	.type	.L__PRETTY_FUNCTION__.main,@object // @__PRETTY_FUNCTION__.main
.L__PRETTY_FUNCTION__.main:
	.asciz	"int main(int, char **)"
	.size	.L__PRETTY_FUNCTION__.main, 23

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"v_sparse_dot ------ Value: %f, Time: %.2fns/iter\n"
	.size	.L.str.2, 50

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"v_sparse_dot_omp -- Value: %f, Time: %.2fns/iter\n"
	.size	.L.str.3, 50

	.type	.L.str.4,@object                // @.str.4
.L.str.4:
	.asciz	"v_sparse_dot_sve -- Value: %f, Time: %.2fns/iter\n"
	.size	.L.str.4, 50

	.ident	"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
