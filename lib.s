	.text
	.file	"lib.c"
	.globl	v_sparse_dot                    // -- Begin function v_sparse_dot
	.p2align	4
	.type	v_sparse_dot,@function
v_sparse_dot:                           // @v_sparse_dot
	.cfi_startproc
// %bb.0:
	movi	d0, #0000000000000000
	cbz	x4, .LBB0_7
// %bb.1:
	cbz	x5, .LBB0_7
// %bb.2:
	mov	x8, xzr
	mov	x9, xzr
	.p2align	5, , 16
.LBB0_3:                                // =>This Inner Loop Header: Depth=1
	ldr	w10, [x0, x9, lsl #2]
	ldr	w11, [x1, x8, lsl #2]
	cmp	w10, w11
	b.ne	.LBB0_5
// %bb.4:                               //   in Loop: Header=BB0_3 Depth=1
	ldr	s1, [x2, x9, lsl #2]
	ldr	s2, [x3, x8, lsl #2]
	add	x9, x9, #1
	add	x8, x8, #1
	fmadd	s0, s1, s2, s0
	cmp	x9, x4
	b.lo	.LBB0_6
	b	.LBB0_7
	.p2align	5, , 16
.LBB0_5:                                //   in Loop: Header=BB0_3 Depth=1
	cinc	x9, x9, lo
	cinc	x8, x8, hs
	cmp	x9, x4
	b.hs	.LBB0_7
.LBB0_6:                                //   in Loop: Header=BB0_3 Depth=1
	cmp	x8, x5
	b.lo	.LBB0_3
.LBB0_7:
	ret
.Lfunc_end0:
	.size	v_sparse_dot, .Lfunc_end0-v_sparse_dot
	.cfi_endproc
                                        // -- End function
	.globl	v_sparse_dot_omp                // -- Begin function v_sparse_dot_omp
	.p2align	4
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
	cntw	x13
	mov	w12, #8                         // =0x8
	index	z2.s, #0, #1
	mov	z3.s, #0                        // =0x0
	mov	z4.s, #2                        // =0x2
	movi	d1, #0000000000000000
	ptrue	p0.s
	mov	z6.s, #4                        // =0x4
	mov	z7.s, #8                        // =0x8
	mov	x9, xzr
	mov	x8, xzr
	add	x14, sp, #32
	mov	x15, sp
	whilelo	p1.s, xzr, x12
	mov	z16.s, #16                      // =0x10
	mov	z17.s, #32                      // =0x20
	mov	z18.s, #64                      // =0x40
	mov	z19.s, #128                     // =0x80
	mov	z5.s, w13
	.p2align	5, , 16
.LBB1_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_4 Depth 2
                                        //     Child Loop BB1_39 Depth 2
	add	x25, x8, #1
	add	x23, x8, #2
	add	x20, x8, #3
	add	x7, x8, #4
	mov	z20.d, z3.d
	mov	z29.d, z3.d
	mov	z30.d, z2.d
	add	x6, x8, #5
	add	x18, x8, #6
	add	x17, x8, #7
	ldr	w16, [x1, x17, lsl #2]
	add	x28, x1, x8, lsl #2
	ld1rw	{ z21.s }, p0/z, [x28]
	add	x21, x1, x18, lsl #2
	ld1rw	{ z27.s }, p0/z, [x21]
	add	x22, x1, x6, lsl #2
	add	x24, x1, x7, lsl #2
	add	x26, x1, x20, lsl #2
	ld1rw	{ z24.s }, p0/z, [x26]
	ld1rw	{ z25.s }, p0/z, [x24]
	ld1rw	{ z26.s }, p0/z, [x22]
	add	x27, x1, x23, lsl #2
	ld1rw	{ z23.s }, p0/z, [x27]
	add	x28, x1, x25, lsl #2
	ld1rw	{ z22.s }, p0/z, [x28]
	mov	x19, xzr
	add	x21, x0, x9, lsl #2
	mov	p2.b, p1.b
	mov	z28.s, w16
	.p2align	5, , 16
.LBB1_4:                                //   Parent Loop BB1_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z31.s }, p2/z, [x21, x19, lsl #2]
	add	x19, x19, x13
	cmpeq	p3.s, p0/z, z31.s, z21.s
	cmpeq	p4.s, p0/z, z31.s, z22.s
	cmpeq	p5.s, p0/z, z31.s, z27.s
	mov	z8.s, p3/z, #1                  // =0x1
	sel	p3.b, p3, p3.b, p4.b
	orr	z8.s, p4/m, z8.s, z4.s
	cmpeq	p4.s, p0/z, z31.s, z23.s
	sel	p3.b, p3, p3.b, p4.b
	orr	z8.s, p4/m, z8.s, z6.s
	cmpeq	p4.s, p0/z, z31.s, z24.s
	sel	p3.b, p3, p3.b, p4.b
	orr	z8.s, p4/m, z8.s, z7.s
	cmpeq	p4.s, p0/z, z31.s, z25.s
	sel	p3.b, p3, p3.b, p4.b
	orr	z8.s, p4/m, z8.s, z16.s
	cmpeq	p4.s, p0/z, z31.s, z26.s
	sel	p3.b, p3, p3.b, p4.b
	orr	z8.s, p4/m, z8.s, z17.s
	cmpeq	p4.s, p0/z, z31.s, z28.s
	sel	p3.b, p3, p3.b, p5.b
	orr	z8.s, p5/m, z8.s, z18.s
	sel	p3.b, p3, p3.b, p4.b
	orr	z8.s, p4/m, z8.s, z19.s
	mov	z31.s, p3/z, #1                 // =0x1
	orr	z20.s, p2/m, z20.s, z8.s
	lsl	z31.s, p0/m, z31.s, z30.s
	add	z30.s, z30.s, z5.s
	orr	z29.s, p2/m, z29.s, z31.s
	whilelo	p2.s, x19, x12
	b.mi	.LBB1_4
// %bb.5:                               //   in Loop: Header=BB1_3 Depth=1
	orv	s21, p0, z29.s
	fmov	w24, s21
	tbnz	w24, #0, .LBB1_8
// %bb.6:                               //   in Loop: Header=BB1_3 Depth=1
	mov	w19, wzr
	orv	s20, p0, z20.s
	fmov	w21, s20
	and	w22, w21, #0xff
	tbz	w22, #0, .LBB1_9
.LBB1_7:                                //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x8, lsl #2]
	mov	w21, #1                         // =0x1
	str	s20, [sp]
	and	w24, w24, #0xff
	tbnz	w24, #1, .LBB1_10
	b	.LBB1_11
	.p2align	5, , 16
.LBB1_8:                                //   in Loop: Header=BB1_3 Depth=1
	ldr	s21, [x2, x9, lsl #2]
	mov	w19, #1                         // =0x1
	str	s21, [sp, #32]
	orv	s20, p0, z20.s
	fmov	w21, s20
	and	w22, w21, #0xff
	tbnz	w22, #0, .LBB1_7
.LBB1_9:                                //   in Loop: Header=BB1_3 Depth=1
	mov	w21, wzr
	and	w24, w24, #0xff
	tbz	w24, #1, .LBB1_11
.LBB1_10:                               //   in Loop: Header=BB1_3 Depth=1
	add	x26, x2, x9, lsl #2
	ldr	s20, [x26, #4]
	str	s20, [x14, w19, uxtw #2]
	add	w19, w19, #1
.LBB1_11:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w22, #1, .LBB1_25
// %bb.12:                              //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #2, .LBB1_26
.LBB1_13:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w22, #2, .LBB1_27
.LBB1_14:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #3, .LBB1_28
.LBB1_15:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w22, #3, .LBB1_29
.LBB1_16:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #4, .LBB1_30
.LBB1_17:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w22, #4, .LBB1_31
.LBB1_18:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #5, .LBB1_32
.LBB1_19:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w22, #5, .LBB1_33
.LBB1_20:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #6, .LBB1_34
.LBB1_21:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w22, #6, .LBB1_35
.LBB1_22:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w24, #7, .LBB1_36
.LBB1_23:                               //   in Loop: Header=BB1_3 Depth=1
	tbnz	w22, #7, .LBB1_37
.LBB1_24:                               //   in Loop: Header=BB1_3 Depth=1
	cmp	w19, w21
	csel	w17, w19, w21, lo
	cbnz	w17, .LBB1_38
	b	.LBB1_40
	.p2align	5, , 16
.LBB1_25:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x25, lsl #2]
	str	s20, [x15, w21, uxtw #2]
	add	w21, w21, #1
	tbz	w24, #2, .LBB1_13
.LBB1_26:                               //   in Loop: Header=BB1_3 Depth=1
	add	x25, x2, x9, lsl #2
	ldr	s20, [x25, #8]
	str	s20, [x14, w19, uxtw #2]
	add	w19, w19, #1
	tbz	w22, #2, .LBB1_14
.LBB1_27:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x23, lsl #2]
	str	s20, [x15, w21, uxtw #2]
	add	w21, w21, #1
	tbz	w24, #3, .LBB1_15
.LBB1_28:                               //   in Loop: Header=BB1_3 Depth=1
	add	x23, x2, x9, lsl #2
	ldr	s20, [x23, #12]
	str	s20, [x14, w19, uxtw #2]
	add	w19, w19, #1
	tbz	w22, #3, .LBB1_16
.LBB1_29:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x20, lsl #2]
	str	s20, [x15, w21, uxtw #2]
	add	w21, w21, #1
	tbz	w24, #4, .LBB1_17
.LBB1_30:                               //   in Loop: Header=BB1_3 Depth=1
	add	x20, x2, x9, lsl #2
	ldr	s20, [x20, #16]
	str	s20, [x14, w19, uxtw #2]
	add	w19, w19, #1
	tbz	w22, #4, .LBB1_18
.LBB1_31:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x7, lsl #2]
	str	s20, [x15, w21, uxtw #2]
	add	w21, w21, #1
	tbz	w24, #5, .LBB1_19
.LBB1_32:                               //   in Loop: Header=BB1_3 Depth=1
	add	x7, x2, x9, lsl #2
	ldr	s20, [x7, #20]
	str	s20, [x14, w19, uxtw #2]
	add	w19, w19, #1
	tbz	w22, #5, .LBB1_20
.LBB1_33:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x6, lsl #2]
	str	s20, [x15, w21, uxtw #2]
	add	w21, w21, #1
	tbz	w24, #6, .LBB1_21
.LBB1_34:                               //   in Loop: Header=BB1_3 Depth=1
	add	x6, x2, x9, lsl #2
	ldr	s20, [x6, #24]
	str	s20, [x14, w19, uxtw #2]
	add	w19, w19, #1
	tbz	w22, #6, .LBB1_22
.LBB1_35:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x18, lsl #2]
	str	s20, [x15, w21, uxtw #2]
	add	w21, w21, #1
	tbz	w24, #7, .LBB1_23
.LBB1_36:                               //   in Loop: Header=BB1_3 Depth=1
	add	x18, x2, x9, lsl #2
	ldr	s20, [x18, #28]
	str	s20, [x14, w19, uxtw #2]
	add	w19, w19, #1
	tbz	w22, #7, .LBB1_24
.LBB1_37:                               //   in Loop: Header=BB1_3 Depth=1
	ldr	s20, [x3, x17, lsl #2]
	str	s20, [x15, w21, uxtw #2]
	add	w21, w21, #1
	cmp	w19, w21
	csel	w17, w19, w21, lo
	cbz	w17, .LBB1_40
.LBB1_38:                               //   in Loop: Header=BB1_3 Depth=1
	whilelo	p2.s, xzr, x17
	mov	x18, xzr
	.p2align	5, , 16
.LBB1_39:                               //   Parent Loop BB1_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z20.s }, p2/z, [x14, x18, lsl #2]
	ld1w	{ z21.s }, p2/z, [x15, x18, lsl #2]
	add	x6, x13, x18
	add	x18, x18, x13
	fmul	z20.s, z20.s, z21.s
	fadda	s1, p2, s1, z20.s
	whilelo	p2.s, x6, x17
	b.mi	.LBB1_39
.LBB1_40:                               //   in Loop: Header=BB1_3 Depth=1
	add	x18, x0, x9, lsl #2
	add	x17, x9, #8
	add	x6, x8, #8
	ldr	w18, [x18, #28]
	cmp	w18, w16
	csel	x9, x9, x17, hi
	csel	x8, x8, x6, lo
	csel	x9, x17, x9, lo
	cmp	x9, x10
	b.hs	.LBB1_42
// %bb.41:                              //   in Loop: Header=BB1_3 Depth=1
	cmp	x8, x11
	b.lo	.LBB1_3
.LBB1_42:
	subs	x10, x5, x8
	b.ne	.LBB1_44
	b	.LBB1_50
.LBB1_43:
	movi	d1, #0000000000000000
	mov	x9, x8
	subs	x10, x5, x8
	b.eq	.LBB1_50
.LBB1_44:
	cmp	x4, x9
	b.eq	.LBB1_50
// %bb.45:
	lsl	x14, x9, #2
	lsl	x15, x8, #2
	movi	d0, #0000000000000000
	mov	x11, xzr
	mov	x12, xzr
	sub	x9, x4, x9
	add	x13, x0, x14
	add	x8, x1, x15
	add	x14, x2, x14
	add	x15, x3, x15
	.p2align	5, , 16
.LBB1_46:                               // =>This Inner Loop Header: Depth=1
	ldr	w16, [x13, x12, lsl #2]
	ldr	w17, [x8, x11, lsl #2]
	cmp	w16, w17
	b.ne	.LBB1_48
// %bb.47:                              //   in Loop: Header=BB1_46 Depth=1
	ldr	s2, [x14, x12, lsl #2]
	ldr	s3, [x15, x11, lsl #2]
	add	x12, x12, #1
	add	x11, x11, #1
	fmadd	s0, s2, s3, s0
	cmp	x12, x9
	b.lo	.LBB1_49
	b	.LBB1_50
	.p2align	5, , 16
.LBB1_48:                               //   in Loop: Header=BB1_46 Depth=1
	cinc	x12, x12, lo
	cinc	x11, x11, hs
	cmp	x12, x9
	b.hs	.LBB1_50
.LBB1_49:                               //   in Loop: Header=BB1_46 Depth=1
	cmp	x11, x10
	b.lo	.LBB1_46
.LBB1_50:
	ldr	d8, [sp, #64]                   // 8-byte Folded Reload
	ldp	x20, x19, [sp, #144]            // 16-byte Folded Reload
	fadd	s0, s1, s0
	ldp	x22, x21, [sp, #128]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             // 16-byte Folded Reload
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
	.p2align	4
	.type	v_sparse_dot_sve,@function
v_sparse_dot_sve:                       // @v_sparse_dot_sve
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #272
	.cfi_def_cfa_offset 272
	str	x29, [sp, #256]                 // 8-byte Folded Spill
	.cfi_offset w29, -16
	.cfi_remember_state
	cntw	x10
	neg	x8, x10
	ptrue	p0.s
	and	x11, x8, x4
	and	x12, x8, x5
	cmp	x11, #0
	ccmp	x12, #0, #4, ne
	b.ne	.LBB2_10
// %bb.1:
	mov	x9, xzr
	mov	x8, xzr
	mov	z0.s, #0                        // =0x0
.LBB2_2:
	movi	d1, #0000000000000000
	subs	x10, x5, x9
	b.eq	.LBB2_9
// %bb.3:
	cmp	x4, x8
	b.eq	.LBB2_9
// %bb.4:
	lsl	x14, x8, #2
	lsl	x15, x9, #2
	mov	x11, xzr
	mov	x12, xzr
	sub	x8, x4, x8
	add	x13, x0, x14
	add	x9, x1, x15
	add	x14, x2, x14
	add	x15, x3, x15
	.p2align	5, , 16
.LBB2_5:                                // =>This Inner Loop Header: Depth=1
	ldr	w16, [x13, x12, lsl #2]
	ldr	w17, [x9, x11, lsl #2]
	cmp	w16, w17
	b.ne	.LBB2_7
// %bb.6:                               //   in Loop: Header=BB2_5 Depth=1
	ldr	s2, [x14, x12, lsl #2]
	ldr	s3, [x15, x11, lsl #2]
	add	x12, x12, #1
	add	x11, x11, #1
	fmadd	s1, s2, s3, s1
	cmp	x12, x8
	b.lo	.LBB2_8
	b	.LBB2_9
	.p2align	5, , 16
.LBB2_7:                                //   in Loop: Header=BB2_5 Depth=1
	cinc	x12, x12, lo
	cinc	x11, x11, hs
	cmp	x12, x8
	b.hs	.LBB2_9
.LBB2_8:                                //   in Loop: Header=BB2_5 Depth=1
	cmp	x11, x10
	b.lo	.LBB2_5
.LBB2_9:
	faddv	s0, p0, z0.s
	ldr	x29, [sp, #256]                 // 8-byte Folded Reload
	fadd	s0, s1, s0
	add	sp, sp, #272
	.cfi_def_cfa_offset 0
	.cfi_restore w29
	ret
.LBB2_10:
	.cfi_restore_state
	ptrue	p1.b
	mov	z0.s, #0                        // =0x0
	mov	x8, xzr
	mov	x9, xzr
	mov	x13, sp
	pfalse	p2.b
	b	.LBB2_12
	.p2align	5, , 16
.LBB2_11:                               //   in Loop: Header=BB2_12 Depth=1
	whilelo	p4.s, xzr, x14
	add	x14, x8, x10
	add	x16, x9, x10
	add	x15, x0, x14, lsl #2
	add	x17, x1, x16, lsl #2
	ld1w	{ z1.s }, p4/z, [x13]
	ld1w	{ z2.s }, p0/z, [x2, x8, lsl #2]
	ld1w	{ z3.s }, p0/z, [x3, x9, lsl #2]
	ldur	w15, [x15, #-4]
	ldur	w17, [x17, #-4]
	cmp	w15, w17
	csel	x8, x8, x14, hi
	csel	x9, x9, x16, lo
	compact	z2.s, p3, z2.s
	tbl	z1.s, { z3.s }, z1.s
	csel	x8, x14, x8, lo
	cmp	x8, x11
	ccmp	x9, x12, #2, lo
	fmla	z0.s, p1/m, z2.s, z1.s
	b.hs	.LBB2_2
.LBB2_12:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_14 Depth 2
	ld1w	{ z1.s }, p0/z, [x0, x8, lsl #2]
	mov	x14, xzr
	mov	x15, xzr
	add	x16, x1, x9, lsl #2
	mov	p3.b, p2.b
	b	.LBB2_14
	.p2align	5, , 16
.LBB2_13:                               //   in Loop: Header=BB2_14 Depth=2
	add	x15, x15, #1
	orr	p3.b, p1/z, p3.b, p4.b
	cmp	x10, x15
	b.eq	.LBB2_11
.LBB2_14:                               //   Parent Loop BB2_12 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x17, x16, x15, lsl #2
	ld1rw	{ z2.s }, p0/z, [x17]
	cmpeq	p4.s, p1/z, z2.s, z1.s
	ptest	p1, p4.b
	b.eq	.LBB2_13
// %bb.15:                              //   in Loop: Header=BB2_14 Depth=2
	str	w15, [x13, x14, lsl #2]
	add	x14, x14, #1
	b	.LBB2_13
.Lfunc_end2:
	.size	v_sparse_dot_sve, .Lfunc_end2-v_sparse_dot_sve
	.cfi_endproc
                                        // -- End function
	.ident	"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
