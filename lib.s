	.text
	.file	"lib.c"
	.globl	v_sparse_dot                    // -- Begin function v_sparse_dot
	.p2align	2
	.type	v_sparse_dot,@function
v_sparse_dot:                           // @v_sparse_dot
	.cfi_startproc
// %bb.0:
	movi	d0, #0000000000000000
	cbz	x4, .LBB0_9
// %bb.1:
	cbz	x5, .LBB0_9
// %bb.2:
	mov	x8, xzr
	mov	x9, xzr
.LBB0_3:                                // =>This Inner Loop Header: Depth=1
	ldr	w10, [x0, x9, lsl #2]
	ldr	w11, [x1, x8, lsl #2]
	cmp	w10, w11
	b.ne	.LBB0_5
// %bb.4:                               //   in Loop: Header=BB0_3 Depth=1
	ldr	s1, [x2, x9, lsl #2]
	add	x9, x9, #1
	ldr	s2, [x3, x8, lsl #2]
	fmadd	s0, s1, s2, s0
	b	.LBB0_7
.LBB0_5:                                //   in Loop: Header=BB0_3 Depth=1
	b.hs	.LBB0_7
// %bb.6:                               //   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #1
	cmp	x9, x4
	b.lo	.LBB0_8
	b	.LBB0_9
.LBB0_7:                                //   in Loop: Header=BB0_3 Depth=1
	add	x8, x8, #1
	cmp	x9, x4
	b.hs	.LBB0_9
.LBB0_8:                                //   in Loop: Header=BB0_3 Depth=1
	cmp	x8, x5
	b.lo	.LBB0_3
.LBB0_9:
	ret
.Lfunc_end0:
	.size	v_sparse_dot, .Lfunc_end0-v_sparse_dot
	.cfi_endproc
                                        // -- End function
	.globl	v_sparse_dot_omp                // -- Begin function v_sparse_dot_omp
	.p2align	2
	.type	v_sparse_dot_omp,@function
v_sparse_dot_omp:                       // @v_sparse_dot_omp
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #160
	.cfi_def_cfa_offset 160
	str	d8, [sp, #64]                   // 8-byte Folded Spill
	stp	x28, x27, [sp, #80]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            // 16-byte Folded Spill
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
	.cfi_offset b8, -96
	movi	d0, #0000000000000000
	mov	x8, xzr
	ands	x10, x4, #0xfffffffffffffff8
	b.eq	.LBB1_43
// %bb.1:
	movi	d1, #0000000000000000
	and	x11, x5, #0xfffffffffffffff8
	mov	x9, x8
	cbz	x11, .LBB1_42
// %bb.2:
	mov	w12, #8                         // =0x8
	movi	d1, #0000000000000000
	mov	x9, xzr
	mov	x8, xzr
	add	x14, sp, #32
	mov	x15, sp
	cntw	x13
	index	z2.s, #0, #1
	mov	z3.s, w13
	whilelo	p0.s, xzr, x12
	ptrue	p1.s
	mov	z4.s, #0                        // =0x0
	mov	z5.s, #2                        // =0x2
	mov	z6.s, #4                        // =0x4
	mov	z7.s, #8                        // =0x8
	mov	z16.s, #16                      // =0x10
	mov	z17.s, #32                      // =0x20
	mov	z18.s, #64                      // =0x40
	mov	z19.s, #128                     // =0x80
.LBB1_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_4 Depth 2
                                        //     Child Loop BB1_39 Depth 2
	add	x21, x1, x8, lsl #2
	add	x25, x8, #1
	add	x23, x8, #2
	add	x20, x8, #3
	add	x7, x8, #4
	add	x6, x8, #5
	add	x18, x8, #6
	add	x17, x8, #7
	add	x22, x1, x6, lsl #2
	add	x24, x1, x25, lsl #2
	add	x26, x1, x20, lsl #2
	add	x27, x1, x23, lsl #2
	add	x28, x1, x7, lsl #2
	ld1rw	{ z21.s }, p1/z, [x21]
	add	x21, x1, x18, lsl #2
	ldr	w16, [x1, x17, lsl #2]
	ld1rw	{ z22.s }, p1/z, [x24]
	ld1rw	{ z23.s }, p1/z, [x27]
	ld1rw	{ z24.s }, p1/z, [x26]
	ld1rw	{ z25.s }, p1/z, [x28]
	ld1rw	{ z26.s }, p1/z, [x22]
	ld1rw	{ z27.s }, p1/z, [x21]
	mov	x19, xzr
	add	x21, x0, x9, lsl #2
	mov	p2.b, p0.b
	mov	z20.d, z4.d
	mov	z28.d, z4.d
	mov	z29.d, z2.d
	mov	z30.s, w16
.LBB1_4:                                //   Parent Loop BB1_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z31.s }, p2/z, [x21, x19, lsl #2]
	add	x19, x19, x13
	cmpeq	p3.s, p1/z, z31.s, z21.s
	cmpeq	p4.s, p1/z, z31.s, z22.s
	cmpeq	p5.s, p1/z, z31.s, z23.s
	mov	z8.s, p3/z, #1                  // =0x1
	sel	p3.b, p3, p3.b, p4.b
	orr	z8.s, p4/m, z8.s, z5.s
	cmpeq	p4.s, p1/z, z31.s, z24.s
	sel	p3.b, p3, p3.b, p5.b
	orr	z8.s, p5/m, z8.s, z6.s
	cmpeq	p5.s, p1/z, z31.s, z25.s
	sel	p3.b, p3, p3.b, p4.b
	orr	z8.s, p4/m, z8.s, z7.s
	cmpeq	p4.s, p1/z, z31.s, z26.s
	sel	p3.b, p3, p3.b, p5.b
	orr	z8.s, p5/m, z8.s, z16.s
	cmpeq	p5.s, p1/z, z31.s, z27.s
	sel	p3.b, p3, p3.b, p4.b
	orr	z8.s, p4/m, z8.s, z17.s
	sel	p3.b, p3, p3.b, p5.b
	cmpeq	p4.s, p1/z, z31.s, z30.s
	sel	p3.b, p3, p3.b, p4.b
	orr	z8.s, p5/m, z8.s, z18.s
	mov	z31.s, p3/z, #1                 // =0x1
	orr	z8.s, p4/m, z8.s, z19.s
	lsl	z31.s, p1/m, z31.s, z29.s
	orr	z20.s, p2/m, z20.s, z8.s
	orr	z28.s, p2/m, z28.s, z31.s
	whilelo	p2.s, x19, x12
	add	z29.s, z29.s, z3.s
	b.mi	.LBB1_4
// %bb.5:                               //   in Loop: Header=BB1_3 Depth=1
	orv	s21, p1, z28.s
	fmov	w24, s21
	tbnz	w24, #0, .LBB1_8
// %bb.6:                               //   in Loop: Header=BB1_3 Depth=1
	mov	w19, wzr
	orv	s20, p1, z20.s
	fmov	w21, s20
	and	w21, w21, #0xff
	tbz	w21, #0, .LBB1_9
.LBB1_7:                                //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x8, lsl #2]
	mov	w22, #1                         // =0x1
	str	s20, [sp]
	and	w24, w24, #0xff
	tbnz	w24, #1, .LBB1_10
	b	.LBB1_11
.LBB1_8:                                //   in Loop: Header=BB1_3 Depth=1
	ldr	s21, [x2, x9, lsl #2]
	mov	w19, #1                         // =0x1
	str	s21, [sp, #32]
	orv	s20, p1, z20.s
	fmov	w21, s20
	and	w21, w21, #0xff
	tbnz	w21, #0, .LBB1_7
.LBB1_9:                                //   in Loop: Header=BB1_3 Depth=1
	mov	w22, wzr
	and	w24, w24, #0xff
	tbz	w24, #1, .LBB1_11
.LBB1_10:                               //   in Loop: Header=BB1_3 Depth=1
	add	x26, x2, x9, lsl #2
	add	w27, w19, #1
	ldr	s20, [x26, #4]
	str	s20, [x14, w19, uxtw #2]
	mov	w19, w27
.LBB1_11:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w21, #1, .LBB1_25
// %bb.12:                              //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #2, .LBB1_26
.LBB1_13:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w21, #2, .LBB1_27
.LBB1_14:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #3, .LBB1_28
.LBB1_15:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w21, #3, .LBB1_29
.LBB1_16:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #4, .LBB1_30
.LBB1_17:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w21, #4, .LBB1_31
.LBB1_18:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #5, .LBB1_32
.LBB1_19:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w21, #5, .LBB1_33
.LBB1_20:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #6, .LBB1_34
.LBB1_21:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w21, #6, .LBB1_35
.LBB1_22:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #7, .LBB1_36
.LBB1_23:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w21, #7, .LBB1_37
.LBB1_24:                               //   in Loop: Header=BB1_3 Depth=1
	cmp	w19, w22
	csel	w17, w19, w22, lo
	cbnz	w17, .LBB1_38
	b	.LBB1_40
.LBB1_25:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x25, lsl #2]
	add	w25, w22, #1
	str	s20, [x15, w22, uxtw #2]
	mov	w22, w25
	tbz	w24, #2, .LBB1_13
.LBB1_26:                               //   in Loop: Header=BB1_3 Depth=1
	add	x25, x2, x9, lsl #2
	add	w26, w19, #1
	ldr	s20, [x25, #8]
	str	s20, [x14, w19, uxtw #2]
	mov	w19, w26
	tbz	w21, #2, .LBB1_14
.LBB1_27:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x23, lsl #2]
	add	w23, w22, #1
	str	s20, [x15, w22, uxtw #2]
	mov	w22, w23
	tbz	w24, #3, .LBB1_15
.LBB1_28:                               //   in Loop: Header=BB1_3 Depth=1
	add	x23, x2, x9, lsl #2
	add	w25, w19, #1
	ldr	s20, [x23, #12]
	str	s20, [x14, w19, uxtw #2]
	mov	w19, w25
	tbz	w21, #3, .LBB1_16
.LBB1_29:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x20, lsl #2]
	add	w20, w22, #1
	str	s20, [x15, w22, uxtw #2]
	mov	w22, w20
	tbz	w24, #4, .LBB1_17
.LBB1_30:                               //   in Loop: Header=BB1_3 Depth=1
	add	x20, x2, x9, lsl #2
	add	w23, w19, #1
	ldr	s20, [x20, #16]
	str	s20, [x14, w19, uxtw #2]
	mov	w19, w23
	tbz	w21, #4, .LBB1_18
.LBB1_31:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x7, lsl #2]
	add	w7, w22, #1
	str	s20, [x15, w22, uxtw #2]
	mov	w22, w7
	tbz	w24, #5, .LBB1_19
.LBB1_32:                               //   in Loop: Header=BB1_3 Depth=1
	add	x7, x2, x9, lsl #2
	add	w20, w19, #1
	ldr	s20, [x7, #20]
	str	s20, [x14, w19, uxtw #2]
	mov	w19, w20
	tbz	w21, #5, .LBB1_20
.LBB1_33:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x6, lsl #2]
	add	w6, w22, #1
	str	s20, [x15, w22, uxtw #2]
	mov	w22, w6
	tbz	w24, #6, .LBB1_21
.LBB1_34:                               //   in Loop: Header=BB1_3 Depth=1
	add	x6, x2, x9, lsl #2
	add	w7, w19, #1
	ldr	s20, [x6, #24]
	str	s20, [x14, w19, uxtw #2]
	mov	w19, w7
	tbz	w21, #6, .LBB1_22
.LBB1_35:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x18, lsl #2]
	add	w18, w22, #1
	str	s20, [x15, w22, uxtw #2]
	mov	w22, w18
	tbz	w24, #7, .LBB1_23
.LBB1_36:                               //   in Loop: Header=BB1_3 Depth=1
	add	x18, x2, x9, lsl #2
	add	w6, w19, #1
	ldr	s20, [x18, #28]
	str	s20, [x14, w19, uxtw #2]
	mov	w19, w6
	tbz	w21, #7, .LBB1_24
.LBB1_37:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x17, lsl #2]
	add	w17, w22, #1
	str	s20, [x15, w22, uxtw #2]
	mov	w22, w17
	cmp	w19, w17
	csel	w17, w19, w17, lo
	cbz	w17, .LBB1_40
.LBB1_38:                               //   in Loop: Header=BB1_3 Depth=1
	mov	x18, xzr
	whilelo	p2.s, xzr, x17
.LBB1_39:                               //   Parent Loop BB1_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z20.s }, p2/z, [x14, x18, lsl #2]
	ld1w	{ z21.s }, p2/z, [x15, x18, lsl #2]
	add	x6, x18, x13
	add	x7, x13, x18
	mov	x18, x6
	fmul	z20.s, z20.s, z21.s
	fadda	s1, p2, s1, z20.s
	whilelo	p2.s, x7, x17
	b.mi	.LBB1_39
.LBB1_40:                               //   in Loop: Header=BB1_3 Depth=1
	add	x17, x0, x9, lsl #2
	add	x18, x9, #8
	ldr	w17, [x17, #28]
	cmp	w17, w16
	add	x16, x8, #8
	csel	x9, x9, x18, hi
	csel	x8, x8, x16, lo
	csel	x9, x18, x9, lo
	cmp	x9, x10
	b.hs	.LBB1_42
// %bb.41:                              //   in Loop: Header=BB1_3 Depth=1
	cmp	x8, x11
	b.lo	.LBB1_3
.LBB1_42:
	subs	x10, x5, x8
	b.ne	.LBB1_44
	b	.LBB1_52
.LBB1_43:
	movi	d1, #0000000000000000
	mov	x9, x8
	subs	x10, x5, x8
	b.eq	.LBB1_52
.LBB1_44:
	cmp	x4, x9
	b.eq	.LBB1_52
// %bb.45:
	lsl	x14, x9, #2
	lsl	x15, x8, #2
	movi	d0, #0000000000000000
	mov	x11, xzr
	mov	x12, xzr
	add	x8, x0, x14
	add	x13, x1, x15
	add	x14, x2, x14
	add	x15, x3, x15
	sub	x9, x4, x9
.LBB1_46:                               // =>This Inner Loop Header: Depth=1
	ldr	w16, [x8, x12, lsl #2]
	ldr	w17, [x13, x11, lsl #2]
	cmp	w16, w17
	b.ne	.LBB1_48
// %bb.47:                              //   in Loop: Header=BB1_46 Depth=1
	ldr	s2, [x14, x12, lsl #2]
	add	x12, x12, #1
	ldr	s3, [x15, x11, lsl #2]
	fmadd	s0, s2, s3, s0
	b	.LBB1_50
.LBB1_48:                               //   in Loop: Header=BB1_46 Depth=1
	b.hs	.LBB1_50
// %bb.49:                              //   in Loop: Header=BB1_46 Depth=1
	add	x12, x12, #1
	cmp	x12, x9
	b.lo	.LBB1_51
	b	.LBB1_52
.LBB1_50:                               //   in Loop: Header=BB1_46 Depth=1
	add	x11, x11, #1
	cmp	x12, x9
	b.hs	.LBB1_52
.LBB1_51:                               //   in Loop: Header=BB1_46 Depth=1
	cmp	x11, x10
	b.lo	.LBB1_46
.LBB1_52:
	ldp	x20, x19, [sp, #144]            // 16-byte Folded Reload
	fadd	s0, s1, s0
	ldp	x22, x21, [sp, #128]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             // 16-byte Folded Reload
	ldr	d8, [sp, #64]                   // 8-byte Folded Reload
	add	sp, sp, #160
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
	.cfi_restore b8
	ret
.Lfunc_end1:
	.size	v_sparse_dot_omp, .Lfunc_end1-v_sparse_dot_omp
	.cfi_endproc
                                        // -- End function
	.globl	v_sparse_dot_sve                // -- Begin function v_sparse_dot_sve
	.p2align	2
	.type	v_sparse_dot_sve,@function
v_sparse_dot_sve:                       // @v_sparse_dot_sve
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #288
	.cfi_def_cfa_offset 288
	str	x29, [sp, #256]                 // 8-byte Folded Spill
	stp	x20, x19, [sp, #272]            // 16-byte Folded Spill
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w29, -32
	.cfi_remember_state
	cntw	x10
	ptrue	p0.s
	neg	x8, x10
	and	x11, x8, x4
	and	x12, x8, x5
	cmp	x11, #0
	ccmp	x12, #0, #4, ne
	b.ne	.LBB2_12
// %bb.1:
	mov	x9, xzr
	mov	x8, xzr
	mov	z0.s, #0                        // =0x0
.LBB2_2:
	movi	d1, #0000000000000000
	subs	x10, x5, x9
	b.eq	.LBB2_11
// %bb.3:
	cmp	x4, x8
	b.eq	.LBB2_11
// %bb.4:
	lsl	x14, x8, #2
	lsl	x15, x9, #2
	mov	x11, xzr
	mov	x12, xzr
	add	x9, x0, x14
	add	x13, x1, x15
	add	x14, x2, x14
	add	x15, x3, x15
	sub	x8, x4, x8
.LBB2_5:                                // =>This Inner Loop Header: Depth=1
	ldr	w16, [x9, x12, lsl #2]
	ldr	w17, [x13, x11, lsl #2]
	cmp	w16, w17
	b.ne	.LBB2_7
// %bb.6:                               //   in Loop: Header=BB2_5 Depth=1
	ldr	s2, [x14, x12, lsl #2]
	add	x12, x12, #1
	ldr	s3, [x15, x11, lsl #2]
	fmadd	s1, s2, s3, s1
	b	.LBB2_9
.LBB2_7:                                //   in Loop: Header=BB2_5 Depth=1
	b.hs	.LBB2_9
// %bb.8:                               //   in Loop: Header=BB2_5 Depth=1
	add	x12, x12, #1
	cmp	x12, x8
	b.lo	.LBB2_10
	b	.LBB2_11
.LBB2_9:                                //   in Loop: Header=BB2_5 Depth=1
	add	x11, x11, #1
	cmp	x12, x8
	b.hs	.LBB2_11
.LBB2_10:                               //   in Loop: Header=BB2_5 Depth=1
	cmp	x11, x10
	b.lo	.LBB2_5
.LBB2_11:
	ldp	x20, x19, [sp, #272]            // 16-byte Folded Reload
	faddv	s0, p0, z0.s
	ldr	x29, [sp, #256]                 // 8-byte Folded Reload
	fadd	s0, s1, s0
	add	sp, sp, #288
	.cfi_def_cfa_offset 0
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w29
	ret
.LBB2_12:
	.cfi_restore_state
	rdvl	x13, #1
	mov	x8, xzr
	mov	x9, xzr
	lsr	x13, x13, #4
	and	x14, x10, #0x4
	and	x15, x10, #0x78
	add	x16, x1, #16
	mov	x17, sp
	ptrue	p1.b
	mov	z0.s, #0                        // =0x0
	pfalse	p2.b
.LBB2_13:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_20 Depth 2
                                        //     Child Loop BB2_38 Depth 2
	ld1w	{ z1.s }, p0/z, [x0, x8, lsl #2]
	cmp	x13, #2
	b.hs	.LBB2_18
// %bb.14:                              //   in Loop: Header=BB2_13 Depth=1
	mov	x18, xzr
	mov	x6, xzr
	mov	p3.b, p2.b
.LBB2_15:                               //   in Loop: Header=BB2_13 Depth=1
	cbnz	x14, .LBB2_36
.LBB2_16:                               //   in Loop: Header=BB2_13 Depth=1
	add	x6, x8, x10
	add	x7, x9, x10
	whilelo	p4.s, xzr, x18
	add	x19, x0, x6, lsl #2
	add	x18, x1, x7, lsl #2
	ld1w	{ z1.s }, p4/z, [x17]
	ld1w	{ z2.s }, p0/z, [x2, x8, lsl #2]
	ld1w	{ z3.s }, p0/z, [x3, x9, lsl #2]
	ldur	w19, [x19, #-4]
	ldur	w18, [x18, #-4]
	compact	z2.s, p3, z2.s
	tbl	z1.s, { z3.s }, z1.s
	cmp	w19, w18
	fmla	z0.s, p1/m, z2.s, z1.s
	csel	x8, x8, x6, hi
	csel	x9, x9, x7, lo
	csel	x8, x6, x8, lo
	cmp	x8, x11
	b.hs	.LBB2_2
// %bb.17:                              //   in Loop: Header=BB2_13 Depth=1
	cmp	x9, x12
	b.lo	.LBB2_13
	b	.LBB2_2
.LBB2_18:                               //   in Loop: Header=BB2_13 Depth=1
	mov	x18, xzr
	mov	x6, xzr
	add	x7, x16, x9, lsl #2
	mov	p3.b, p2.b
	b	.LBB2_20
.LBB2_19:                               //   in Loop: Header=BB2_20 Depth=2
	orr	p3.b, p1/z, p3.b, p4.b
	add	x6, x6, #8
	orr	p3.b, p1/z, p3.b, p5.b
	add	x7, x7, #32
	orr	p3.b, p1/z, p3.b, p6.b
	cmp	x15, x6
	orr	p3.b, p1/z, p3.b, p7.b
	orr	p3.b, p1/z, p3.b, p8.b
	orr	p3.b, p1/z, p3.b, p9.b
	orr	p3.b, p1/z, p3.b, p10.b
	orr	p3.b, p1/z, p3.b, p11.b
	b.eq	.LBB2_15
.LBB2_20:                               //   Parent Loop BB2_13 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	sub	x19, x7, #16
	ld1rw	{ z2.s }, p0/z, [x19]
	cmpeq	p4.s, p1/z, z2.s, z1.s
	ptest	p1, p4.b
	b.ne	.LBB2_28
// %bb.21:                              //   in Loop: Header=BB2_20 Depth=2
	sub	x19, x7, #12
	ld1rw	{ z2.s }, p0/z, [x19]
	cmpeq	p5.s, p1/z, z2.s, z1.s
	ptest	p1, p5.b
	b.ne	.LBB2_29
.LBB2_22:                               //   in Loop: Header=BB2_20 Depth=2
	sub	x19, x7, #8
	ld1rw	{ z2.s }, p0/z, [x19]
	cmpeq	p6.s, p1/z, z2.s, z1.s
	ptest	p1, p6.b
	b.ne	.LBB2_30
.LBB2_23:                               //   in Loop: Header=BB2_20 Depth=2
	sub	x19, x7, #4
	ld1rw	{ z2.s }, p0/z, [x19]
	cmpeq	p7.s, p1/z, z2.s, z1.s
	ptest	p1, p7.b
	b.ne	.LBB2_31
.LBB2_24:                               //   in Loop: Header=BB2_20 Depth=2
	ld1rw	{ z2.s }, p0/z, [x7]
	cmpeq	p8.s, p1/z, z2.s, z1.s
	ptest	p1, p8.b
	b.ne	.LBB2_32
.LBB2_25:                               //   in Loop: Header=BB2_20 Depth=2
	ld1rw	{ z2.s }, p0/z, [x7, #4]
	cmpeq	p9.s, p1/z, z2.s, z1.s
	ptest	p1, p9.b
	b.ne	.LBB2_33
.LBB2_26:                               //   in Loop: Header=BB2_20 Depth=2
	ld1rw	{ z2.s }, p0/z, [x7, #8]
	cmpeq	p10.s, p1/z, z2.s, z1.s
	ptest	p1, p10.b
	b.ne	.LBB2_34
.LBB2_27:                               //   in Loop: Header=BB2_20 Depth=2
	ld1rw	{ z2.s }, p0/z, [x7, #12]
	cmpeq	p11.s, p1/z, z2.s, z1.s
	ptest	p1, p11.b
	b.eq	.LBB2_19
	b	.LBB2_35
.LBB2_28:                               //   in Loop: Header=BB2_20 Depth=2
	add	x19, x18, #1
	str	w6, [x17, x18, lsl #2]
	mov	x18, x19
	sub	x19, x7, #12
	ld1rw	{ z2.s }, p0/z, [x19]
	cmpeq	p5.s, p1/z, z2.s, z1.s
	ptest	p1, p5.b
	b.eq	.LBB2_22
.LBB2_29:                               //   in Loop: Header=BB2_20 Depth=2
	add	w20, w6, #1
	add	x19, x18, #1
	str	w20, [x17, x18, lsl #2]
	mov	x18, x19
	sub	x19, x7, #8
	ld1rw	{ z2.s }, p0/z, [x19]
	cmpeq	p6.s, p1/z, z2.s, z1.s
	ptest	p1, p6.b
	b.eq	.LBB2_23
.LBB2_30:                               //   in Loop: Header=BB2_20 Depth=2
	add	w20, w6, #2
	add	x19, x18, #1
	str	w20, [x17, x18, lsl #2]
	mov	x18, x19
	sub	x19, x7, #4
	ld1rw	{ z2.s }, p0/z, [x19]
	cmpeq	p7.s, p1/z, z2.s, z1.s
	ptest	p1, p7.b
	b.eq	.LBB2_24
.LBB2_31:                               //   in Loop: Header=BB2_20 Depth=2
	add	w20, w6, #3
	add	x19, x18, #1
	str	w20, [x17, x18, lsl #2]
	mov	x18, x19
	ld1rw	{ z2.s }, p0/z, [x7]
	cmpeq	p8.s, p1/z, z2.s, z1.s
	ptest	p1, p8.b
	b.eq	.LBB2_25
.LBB2_32:                               //   in Loop: Header=BB2_20 Depth=2
	add	w20, w6, #4
	add	x19, x18, #1
	str	w20, [x17, x18, lsl #2]
	mov	x18, x19
	ld1rw	{ z2.s }, p0/z, [x7, #4]
	cmpeq	p9.s, p1/z, z2.s, z1.s
	ptest	p1, p9.b
	b.eq	.LBB2_26
.LBB2_33:                               //   in Loop: Header=BB2_20 Depth=2
	add	w20, w6, #5
	add	x19, x18, #1
	str	w20, [x17, x18, lsl #2]
	mov	x18, x19
	ld1rw	{ z2.s }, p0/z, [x7, #8]
	cmpeq	p10.s, p1/z, z2.s, z1.s
	ptest	p1, p10.b
	b.eq	.LBB2_27
.LBB2_34:                               //   in Loop: Header=BB2_20 Depth=2
	add	w20, w6, #6
	add	x19, x18, #1
	str	w20, [x17, x18, lsl #2]
	mov	x18, x19
	ld1rw	{ z2.s }, p0/z, [x7, #12]
	cmpeq	p11.s, p1/z, z2.s, z1.s
	ptest	p1, p11.b
	b.eq	.LBB2_19
.LBB2_35:                               //   in Loop: Header=BB2_20 Depth=2
	add	w20, w6, #7
	add	x19, x18, #1
	str	w20, [x17, x18, lsl #2]
	mov	x18, x19
	b	.LBB2_19
.LBB2_36:                               //   in Loop: Header=BB2_13 Depth=1
	add	x7, x1, x9, lsl #2
	mov	x19, x14
	b	.LBB2_38
.LBB2_37:                               //   in Loop: Header=BB2_38 Depth=2
	add	x6, x6, #1
	subs	x19, x19, #1
	orr	p3.b, p1/z, p3.b, p4.b
	b.eq	.LBB2_16
.LBB2_38:                               //   Parent Loop BB2_13 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x20, x7, x6, lsl #2
	ld1rw	{ z2.s }, p0/z, [x20]
	cmpeq	p4.s, p1/z, z2.s, z1.s
	ptest	p1, p4.b
	b.eq	.LBB2_37
// %bb.39:                              //   in Loop: Header=BB2_38 Depth=2
	add	x20, x18, #1
	str	w6, [x17, x18, lsl #2]
	mov	x18, x20
	b	.LBB2_37
.Lfunc_end2:
	.size	v_sparse_dot_sve, .Lfunc_end2-v_sparse_dot_sve
	.cfi_endproc
                                        // -- End function
	.ident	"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
