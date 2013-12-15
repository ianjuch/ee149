	.file	"main.c"
	.arch msp430g2955
	.cpu 430
	.mpy none

 ;  GNU C (GCC) version 4.6.3 20120301 (mspgcc LTS 20120406 unpatched) (msp430)
 ; 	compiled by GNU C version 4.2.1 Compatible Apple LLVM 5.0 (clang-500.2.79), GMP version 5.1.2, MPFR version 3.1.1-p2, MPC version 1.0.1
 ;  GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ;  options passed:  -D__MSP430G2955__ main.c -mcpu=430 -mmpy=none
 ;  -mivcnt=16 -mmcu=msp430g2955 -mcpu=430 -mmpy=none -mivcnt=16 -g
 ;  -fverbose-asm
 ;  options enabled:  -fauto-inc-dec -fbranch-count-reg -fcommon
 ;  -fdelete-null-pointer-checks -fearly-inlining
 ;  -feliminate-unused-debug-types -ffunction-cse -fgcse-lm -fident
 ;  -finline-functions-called-once -fira-share-save-slots
 ;  -fira-share-spill-slots -fivopts -fkeep-static-consts
 ;  -fleading-underscore -fmath-errno -fmerge-debug-strings
 ;  -fmove-loop-invariants -fpeephole -fprefetch-loop-arrays
 ;  -freg-struct-return -fsched-critical-path-heuristic
 ;  -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
 ;  -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
 ;  -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fshow-column
 ;  -fsigned-zeros -fsplit-ivs-in-unroller -fstrict-volatile-bitfields
 ;  -ftrapping-math -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im
 ;  -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
 ;  -ftree-phiprop -ftree-pta -ftree-reassoc -ftree-scev-cprop
 ;  -ftree-slp-vectorize -ftree-vect-loop-version -funit-at-a-time
 ;  -fverbose-asm -fzero-initialized-in-bss

	.text
.Ltext0:
 ;  Compiler executable checksum: 78cacbd86c45da4ab49b26a4b48eff38

	.comm LED_T_L_value,1
	.comm LED_T_M_value,1
	.comm LED_T_R_value,1
	.p2align 1,0
.global	fadeOn
	.type	fadeOn,@function
/***********************
 * Function `fadeOn' 
 ***********************/
fadeOn:
.LFB0:
	.file 1 "main.c"
	.loc 1 35 0
	push	r4	 ; 
.LCFI0:
	mov	r1, r4	 ; ,
.LCFI1:
	add	#2, r4	 ; ,
.LCFI2:
	sub	#4, r1	 ; ,
.LCFI3:
	mov.b	r15, -4(r4)	 ;  ledAddr, ledAddr
	.loc 1 36 0
	mov.b	#0, -6(r4)	 ; , i
	.loc 1 37 0
	jmp	.L2	 ; 
.L3:
	.loc 1 39 0
	add.b	#5, -6(r4)	 ; , i
	.loc 1 40 0
	mov.b	#96, r13	 ; ,
	mov.b	-6(r4), r14	 ;  i,
	mov.b	-4(r4), r15	 ;  ledAddr,
	call	#i2cWriteByte	 ; 
	.loc 1 41 0
	mov	#2, r15	 ; ,
	call	#delay_ms	 ; 
.L2:
	.loc 1 37 0 discriminator 1
	cmp.b	#llo(-101), -6(r4)	 ; , i
	jlo	.L3	 ; 
	.loc 1 43 0
	add	#4, r1	 ; ,
	pop	r4	 ; 
	ret
.LFE0:
.Lfe1:
	.size	fadeOn,.Lfe1-fadeOn
;; End of function 

	.p2align 1,0
.global	fadeButtonOn
	.type	fadeButtonOn,@function
/***********************
 * Function `fadeButtonOn' 
 ***********************/
fadeButtonOn:
.LFB1:
	.loc 1 46 0
	push	r4	 ; 
.LCFI4:
	mov	r1, r4	 ; ,
.LCFI5:
	add	#2, r4	 ; ,
.LCFI6:
	sub	#2, r1	 ; ,
.LCFI7:
	mov.b	r15, -4(r4)	 ;  ledAddr, ledAddr
	.loc 1 48 0
	mov.b	-4(r4), r15	 ;  ledAddr, D.1608
	cmp	#12, r15	 ; , D.1608
	jeq	.L17	 ; 
	cmp	#14, r15	 ; , D.1608
	jeq	.L18	 ; 
	cmp	#6, r15	 ; , D.1608
	jeq	.L19	 ; 
	jmp	.L16	 ; 
.L10:
	.loc 1 53 0
	mov.b	&LED_T_L_value, r15	 ;  LED_T_L_value, LED_T_L_value.72
	add.b	#1, r15	 ; , LED_T_L_value.73
	mov.b	r15, &LED_T_L_value	 ;  LED_T_L_value.73, LED_T_L_value
	.loc 1 54 0
	mov.b	&LED_T_L_value, r15	 ;  LED_T_L_value, LED_T_L_value.74
	mov.b	#96, r13	 ; ,
	mov.b	r15, r14	 ;  LED_T_L_value.74,
	mov.b	#6, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 55 0
	mov	#2, r15	 ; ,
	call	#delay_ms	 ; 
	jmp	.L9	 ; 
.L19:
	.loc 1 51 0
	nop
.L9:
	.loc 1 51 0 is_stmt 0 discriminator 1
	mov.b	&LED_T_L_value, r15	 ;  LED_T_L_value, LED_T_L_value.75
	cmp.b	#llo(-1), r15	 ; , LED_T_L_value.75
	jne	.L10	 ; 
	.loc 1 57 0 is_stmt 1
	jmp	.L4	 ; 
.L13:
	.loc 1 62 0
	mov.b	&LED_T_M_value, r15	 ;  LED_T_M_value, LED_T_M_value.76
	add.b	#1, r15	 ; , LED_T_M_value.77
	mov.b	r15, &LED_T_M_value	 ;  LED_T_M_value.77, LED_T_M_value
	.loc 1 63 0
	mov.b	&LED_T_M_value, r15	 ;  LED_T_M_value, LED_T_M_value.78
	mov.b	#96, r13	 ; ,
	mov.b	r15, r14	 ;  LED_T_M_value.78,
	mov.b	#12, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 64 0
	mov	#2, r15	 ; ,
	call	#delay_ms	 ; 
	jmp	.L12	 ; 
.L17:
	.loc 1 60 0
	nop
.L12:
	.loc 1 60 0 is_stmt 0 discriminator 1
	mov.b	&LED_T_M_value, r15	 ;  LED_T_M_value, LED_T_M_value.79
	cmp.b	#llo(-1), r15	 ; , LED_T_M_value.79
	jne	.L13	 ; 
	.loc 1 66 0 is_stmt 1
	jmp	.L4	 ; 
.L15:
	.loc 1 71 0
	mov.b	&LED_T_R_value, r15	 ;  LED_T_R_value, LED_T_R_value.80
	add.b	#1, r15	 ; , LED_T_R_value.81
	mov.b	r15, &LED_T_R_value	 ;  LED_T_R_value.81, LED_T_R_value
	.loc 1 72 0
	mov.b	&LED_T_R_value, r15	 ;  LED_T_R_value, LED_T_R_value.82
	mov.b	#96, r13	 ; ,
	mov.b	r15, r14	 ;  LED_T_R_value.82,
	mov.b	#14, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 73 0
	mov	#2, r15	 ; ,
	call	#delay_ms	 ; 
	jmp	.L14	 ; 
.L18:
	.loc 1 69 0
	nop
.L14:
	.loc 1 69 0 is_stmt 0 discriminator 1
	mov.b	&LED_T_R_value, r15	 ;  LED_T_R_value, LED_T_R_value.83
	cmp.b	#llo(-1), r15	 ; , LED_T_R_value.83
	jne	.L15	 ; 
	.loc 1 75 0 is_stmt 1
	jmp	.L4	 ; 
.L16:
	.loc 1 77 0
	nop
.L4:
	.loc 1 85 0
	add	#2, r1	 ; ,
	pop	r4	 ; 
	ret
.LFE1:
.Lfe2:
	.size	fadeButtonOn,.Lfe2-fadeButtonOn
;; End of function 

	.p2align 1,0
.global	fadeButtonsOff
	.type	fadeButtonsOff,@function
/***********************
 * Function `fadeButtonsOff' 
 ***********************/
fadeButtonsOff:
.LFB2:
	.loc 1 88 0
	push	r4	 ; 
.LCFI8:
	mov	r1, r4	 ; ,
.LCFI9:
	add	#2, r4	 ; ,
.LCFI10:
	.loc 1 89 0
	jmp	.L21	 ; 
.L25:
	.loc 1 91 0
	mov.b	&LED_T_L_value, r15	 ;  LED_T_L_value, LED_T_L_value.57
	cmp.b	#0, r15	 ; , LED_T_L_value.57
	jeq	.L22	 ; 
	.loc 1 92 0
	mov.b	&LED_T_L_value, r15	 ;  LED_T_L_value, LED_T_L_value.58
	add.b	#llo(-1), r15	 ; , LED_T_L_value.59
	mov.b	r15, &LED_T_L_value	 ;  LED_T_L_value.59, LED_T_L_value
.L22:
	.loc 1 93 0
	mov.b	&LED_T_M_value, r15	 ;  LED_T_M_value, LED_T_M_value.60
	cmp.b	#0, r15	 ; , LED_T_M_value.60
	jeq	.L23	 ; 
	.loc 1 94 0
	mov.b	&LED_T_M_value, r15	 ;  LED_T_M_value, LED_T_M_value.61
	add.b	#llo(-1), r15	 ; , LED_T_M_value.62
	mov.b	r15, &LED_T_M_value	 ;  LED_T_M_value.62, LED_T_M_value
.L23:
	.loc 1 95 0
	mov.b	&LED_T_R_value, r15	 ;  LED_T_R_value, LED_T_R_value.63
	cmp.b	#0, r15	 ; , LED_T_R_value.63
	jeq	.L24	 ; 
	.loc 1 96 0
	mov.b	&LED_T_R_value, r15	 ;  LED_T_R_value, LED_T_R_value.64
	add.b	#llo(-1), r15	 ; , LED_T_R_value.65
	mov.b	r15, &LED_T_R_value	 ;  LED_T_R_value.65, LED_T_R_value
.L24:
	.loc 1 97 0
	mov.b	&LED_T_L_value, r15	 ;  LED_T_L_value, LED_T_L_value.66
	mov.b	#96, r13	 ; ,
	mov.b	r15, r14	 ;  LED_T_L_value.66,
	mov.b	#6, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 98 0
	mov.b	&LED_T_M_value, r15	 ;  LED_T_M_value, LED_T_M_value.67
	mov.b	#96, r13	 ; ,
	mov.b	r15, r14	 ;  LED_T_M_value.67,
	mov.b	#12, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 99 0
	mov.b	&LED_T_R_value, r15	 ;  LED_T_R_value, LED_T_R_value.68
	mov.b	#96, r13	 ; ,
	mov.b	r15, r14	 ;  LED_T_R_value.68,
	mov.b	#14, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 100 0
	mov	#2, r15	 ; ,
	call	#delay_ms	 ; 
.L21:
	.loc 1 89 0 discriminator 1
	mov.b	&LED_T_L_value, r15	 ;  LED_T_L_value, LED_T_L_value.69
	cmp.b	#0, r15	 ; , LED_T_L_value.69
	jne	.L25	 ; 
	.loc 1 89 0 is_stmt 0 discriminator 2
	mov.b	&LED_T_M_value, r15	 ;  LED_T_M_value, LED_T_M_value.70
	cmp.b	#0, r15	 ; , LED_T_M_value.70
	jne	.L25	 ; 
	.loc 1 89 0 discriminator 1
	mov.b	&LED_T_R_value, r15	 ;  LED_T_R_value, LED_T_R_value.71
	cmp.b	#0, r15	 ; , LED_T_R_value.71
	jne	.L25	 ; 
	.loc 1 102 0 is_stmt 1
	pop	r4	 ; 
	ret
.LFE2:
.Lfe3:
	.size	fadeButtonsOff,.Lfe3-fadeButtonsOff
;; End of function 

	.p2align 1,0
.global	fadeOff
	.type	fadeOff,@function
/***********************
 * Function `fadeOff' 
 ***********************/
fadeOff:
.LFB3:
	.loc 1 105 0
	push	r4	 ; 
.LCFI11:
	mov	r1, r4	 ; ,
.LCFI12:
	add	#2, r4	 ; ,
.LCFI13:
	sub	#4, r1	 ; ,
.LCFI14:
	mov.b	r15, -4(r4)	 ;  ledAddr, ledAddr
	.loc 1 106 0
	mov.b	#llo(-101), -6(r4)	 ; , i
	.loc 1 107 0
	jmp	.L27	 ; 
.L28:
	.loc 1 109 0
	add.b	#llo(-5), -6(r4)	 ; , i
	.loc 1 110 0
	mov.b	#96, r13	 ; ,
	mov.b	-6(r4), r14	 ;  i,
	mov.b	-4(r4), r15	 ;  ledAddr,
	call	#i2cWriteByte	 ; 
	.loc 1 111 0
	mov	#2, r15	 ; ,
	call	#delay_ms	 ; 
.L27:
	.loc 1 107 0 discriminator 1
	cmp.b	#0, -6(r4)	 ; , i
	jne	.L28	 ; 
	.loc 1 113 0
	add	#4, r1	 ; ,
	pop	r4	 ; 
	ret
.LFE3:
.Lfe4:
	.size	fadeOff,.Lfe4-fadeOff
;; End of function 

	.section	.init9,"ax",@progbits
	.p2align 1,0
.global	main
	.type	main,@function
/***********************
 * Function `main' 
 ***********************/
main:
.LFB4:
	.loc 1 116 0
	mov	r1, r4	 ; ,
.LCFI15:
	add	#2, r4	 ; ,
.LCFI16:
	sub	#2, r1	 ; ,
.LCFI17:
	.loc 1 117 0
	call	#init	 ; 
	.loc 1 121 0
	mov.b	#llo(-64), &__P1DIR	 ; , P1DIR
	.loc 1 122 0
	mov.b	&__P1SEL, r15	 ;  P1SEL, P1SEL.48
	and.b	#llo(-65), r15	 ; , P1SEL.49
	mov.b	r15, &__P1SEL	 ;  P1SEL.49, P1SEL
	.loc 1 123 0
	mov.b	&__P1SEL, r15	 ;  P1SEL, P1SEL.50
	and.b	#127, r15	 ; , P1SEL.51
	mov.b	r15, &__P1SEL	 ;  P1SEL.51, P1SEL
	.loc 1 124 0
	mov.b	&__P1SEL2, r15	 ;  P1SEL2, P1SEL2.52
	and.b	#llo(-65), r15	 ; , P1SEL2.53
	mov.b	r15, &__P1SEL2	 ;  P1SEL2.53, P1SEL2
	.loc 1 125 0
	mov.b	&__P1SEL2, r15	 ;  P1SEL2, P1SEL2.54
	and.b	#127, r15	 ; , P1SEL2.55
	mov.b	r15, &__P1SEL2	 ;  P1SEL2.55, P1SEL2
	.loc 1 128 0
	mov.b	#96, r13	 ; ,
	mov.b	#0, r14	 ; ,
	mov.b	#0, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 129 0
	mov	#5, r15	 ; ,
	call	#delay_ms	 ; 
	.loc 1 130 0
	mov.b	#96, r13	 ; ,
	mov.b	#0, r14	 ; ,
	mov.b	#0, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 131 0
	mov	#5, r15	 ; ,
	call	#delay_ms	 ; 
	.loc 1 132 0
	mov.b	#96, r13	 ; ,
	mov.b	#llo(-86), r14	 ; ,
	mov.b	#20, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 133 0
	mov	#5, r15	 ; ,
	call	#delay_ms	 ; 
	.loc 1 134 0
	mov.b	#96, r13	 ; ,
	mov.b	#llo(-86), r14	 ; ,
	mov.b	#21, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 135 0
	mov	#5, r15	 ; ,
	call	#delay_ms	 ; 
	.loc 1 136 0
	mov.b	#96, r13	 ; ,
	mov.b	#llo(-86), r14	 ; ,
	mov.b	#22, r15	 ; ,
	call	#i2cWriteByte	 ; 
	.loc 1 137 0
	mov	#5, r15	 ; ,
	call	#delay_ms	 ; 
	.loc 1 138 0
	mov.b	#96, r13	 ; ,
	mov.b	#llo(-86), r14	 ; ,
	mov.b	#23, r15	 ; ,
	call	#i2cWriteByte	 ; 
	jmp	.L36	 ; 
.L38:
	.loc 1 230 0
	nop
.L36:
.LBB2:
	.loc 1 142 0
	mov.b	#7, r15	 ; ,
	call	#fadeOn	 ; 
	.loc 1 143 0
	call	#spiReadByte	 ; 
	mov.b	r15, -4(r4)	 ; , receivedByte
	.loc 1 144 0
	mov.b	#7, r15	 ; ,
	call	#fadeOff	 ; 
	.loc 1 145 0
	mov.b	-4(r4), r15	 ;  receivedByte, receivedByte.56
	cmp.b	#0, r15	 ; , receivedByte.56
	jge	.L38	 ; 
	.loc 1 147 0
	mov.b	-4(r4), r15	 ;  receivedByte, D.1580
	and	#127, r15	 ; , D.1581
	cmp	#2, r15	 ; , D.1581
	jeq	.L33	 ; 
	cmp	#3, r15	 ; , D.1581
	jeq	.L34	 ; 
	cmp	#1, r15	 ; , D.1581
	jne	.L37	 ; 
.L32:
	.loc 1 150 0
	mov.b	#8, r15	 ; ,
	call	#fadeOn	 ; 
	.loc 1 151 0
	call	#fadeButtonsOff	 ; 
	.loc 1 152 0
	mov.b	#8, r15	 ; ,
	call	#fadeOff	 ; 
	.loc 1 153 0
	mov.b	#5, r15	 ; ,
	call	#fadeOn	 ; 
	.loc 1 154 0
	mov.b	#6, r15	 ; ,
	call	#fadeButtonOn	 ; 
	.loc 1 155 0
	mov.b	#5, r15	 ; ,
	call	#fadeOff	 ; 
	.loc 1 156 0
	jmp	.L30	 ; 
.L33:
	.loc 1 158 0
	mov.b	#13, r15	 ; ,
	call	#fadeOn	 ; 
	.loc 1 159 0
	call	#fadeButtonsOff	 ; 
	.loc 1 160 0
	mov.b	#13, r15	 ; ,
	call	#fadeOff	 ; 
	.loc 1 161 0
	mov.b	#11, r15	 ; ,
	call	#fadeOn	 ; 
	.loc 1 162 0
	mov.b	#12, r15	 ; ,
	call	#fadeButtonOn	 ; 
	.loc 1 163 0
	mov.b	#11, r15	 ; ,
	call	#fadeOff	 ; 
	.loc 1 164 0
	jmp	.L30	 ; 
.L34:
	.loc 1 166 0
	call	#fadeButtonsOff	 ; 
	.loc 1 167 0
	mov.b	#14, r15	 ; ,
	call	#fadeButtonOn	 ; 
	.loc 1 168 0
	jmp	.L30	 ; 
.L37:
	.loc 1 171 0
	nop
.L30:
.LBE2:
	.loc 1 230 0
	jmp	.L38	 ; 
.LIRD0:
.LFE4:
.Lfe5:
	.size	main,.Lfe5-main
;; End of function 

	.text
	.p2align 1,0
.global	init
	.type	init,@function
/***********************
 * Function `init' 
 ***********************/
init:
.LFB5:
	.loc 1 237 0
	push	r4	 ; 
.LCFI18:
	mov	r1, r4	 ; ,
.LCFI19:
	add	#2, r4	 ; ,
.LCFI20:
	.loc 1 238 0
	mov	#23168, &__WDTCTL	 ; , WDTCTL
	.loc 1 241 0
	mov.b	#0, &__DCOCTL	 ; , DCOCTL
	.loc 1 242 0
	mov.b	&__CALBC1_1MHZ, r15	 ;  CALBC1_1MHZ, CALBC1_1MHZ.42
	mov.b	r15, &__BCSCTL1	 ;  CALBC1_1MHZ.42, BCSCTL1
	.loc 1 243 0
	mov.b	&__CALDCO_1MHZ, r15	 ;  CALDCO_1MHZ, CALDCO_1MHZ.43
	mov.b	r15, &__DCOCTL	 ;  CALDCO_1MHZ.43, DCOCTL
	.loc 1 250 0
	mov.b	&__P3DIR, r15	 ;  P3DIR, P3DIR.44
	bis.b	#8, r15	 ; , P3DIR.45
	mov.b	r15, &__P3DIR	 ;  P3DIR.45, P3DIR
	.loc 1 251 0
	mov.b	&__P3OUT, r15	 ;  P3OUT, P3OUT.46
	bis.b	#8, r15	 ; , P3OUT.47
	mov.b	r15, &__P3OUT	 ;  P3OUT.47, P3OUT
	.loc 1 254 0
	call	#i2cInit	 ; 
	.loc 1 256 0
	call	#spiInit	 ; 
	.loc 1 257 0
	pop	r4	 ; 
	ret
.LFE5:
.Lfe6:
	.size	init,.Lfe6-init
;; End of function 

	.p2align 1,0
.global	i2cInit
	.type	i2cInit,@function
/***********************
 * Function `i2cInit' 
 ***********************/
i2cInit:
.LFB6:
	.loc 1 260 0
	push	r4	 ; 
.LCFI21:
	mov	r1, r4	 ; ,
.LCFI22:
	add	#2, r4	 ; ,
.LCFI23:
	.loc 1 262 0
	mov.b	&__P3SEL, r15	 ;  P3SEL, P3SEL.36
	bis.b	#6, r15	 ; , P3SEL.37
	mov.b	r15, &__P3SEL	 ;  P3SEL.37, P3SEL
	.loc 1 263 0
	mov.b	&__UCB0CTL1, r15	 ;  UCB0CTL1, UCB0CTL1.38
	bis.b	#1, r15	 ; , UCB0CTL1.39
	mov.b	r15, &__UCB0CTL1	 ;  UCB0CTL1.39, UCB0CTL1
	.loc 1 264 0
	mov.b	#20, &__UCB0BR0	 ; , UCB0BR0
	.loc 1 265 0
	mov.b	#15, &__UCB0CTL0	 ; , UCB0CTL0
	.loc 1 266 0
	mov.b	#llo(-63), &__UCB0CTL1	 ; , UCB0CTL1
	.loc 1 267 0
	mov.b	&__UCB0CTL1, r15	 ;  UCB0CTL1, UCB0CTL1.40
	and.b	#llo(-2), r15	 ; , UCB0CTL1.41
	mov.b	r15, &__UCB0CTL1	 ;  UCB0CTL1.41, UCB0CTL1
	.loc 1 268 0
	pop	r4	 ; 
	ret
.LFE6:
.Lfe7:
	.size	i2cInit,.Lfe7-i2cInit
;; End of function 

	.p2align 1,0
.global	spiInit
	.type	spiInit,@function
/***********************
 * Function `spiInit' 
 ***********************/
spiInit:
.LFB7:
	.loc 1 271 0
	push	r4	 ; 
.LCFI24:
	mov	r1, r4	 ; ,
.LCFI25:
	add	#2, r4	 ; ,
.LCFI26:
	.loc 1 273 0
	mov.b	&__P3SEL, r15	 ;  P3SEL, P3SEL.16
	bis.b	#1, r15	 ; , P3SEL.17
	mov.b	r15, &__P3SEL	 ;  P3SEL.17, P3SEL
	.loc 1 274 0
	mov.b	&__P3SEL2, r15	 ;  P3SEL2, P3SEL2.18
	and.b	#llo(-2), r15	 ; , P3SEL2.19
	mov.b	r15, &__P3SEL2	 ;  P3SEL2.19, P3SEL2
	.loc 1 277 0
	mov.b	&__P3SEL, r15	 ;  P3SEL, P3SEL.20
	bis.b	#32, r15	 ; , P3SEL.21
	mov.b	r15, &__P3SEL	 ;  P3SEL.21, P3SEL
	.loc 1 278 0
	mov.b	&__P3SEL2, r15	 ;  P3SEL2, P3SEL2.22
	and.b	#llo(-33), r15	 ; , P3SEL2.23
	mov.b	r15, &__P3SEL2	 ;  P3SEL2.23, P3SEL2
	.loc 1 281 0
	mov.b	&__P3SEL, r15	 ;  P3SEL, P3SEL.24
	bis.b	#16, r15	 ; , P3SEL.25
	mov.b	r15, &__P3SEL	 ;  P3SEL.25, P3SEL
	.loc 1 282 0
	mov.b	&__P3SEL2, r15	 ;  P3SEL2, P3SEL2.26
	and.b	#llo(-17), r15	 ; , P3SEL2.27
	mov.b	r15, &__P3SEL2	 ;  P3SEL2.27, P3SEL2
	.loc 1 284 0
	mov.b	&__UCA0CTL1, r15	 ;  UCA0CTL1, UCA0CTL1.28
	bis.b	#1, r15	 ; , UCA0CTL1.29
	mov.b	r15, &__UCA0CTL1	 ;  UCA0CTL1.29, UCA0CTL1
	.loc 1 285 0
	mov.b	&__UCA0CTL0, r15	 ;  UCA0CTL0, UCA0CTL0.30
	bis.b	#9, r15	 ; , UCA0CTL0.31
	mov.b	r15, &__UCA0CTL0	 ;  UCA0CTL0.31, UCA0CTL0
	.loc 1 286 0
	mov.b	&__UCA0CTL1, r15	 ;  UCA0CTL1, UCA0CTL1.32
	bis.b	#llo(-63), r15	 ; , UCA0CTL1.33
	mov.b	r15, &__UCA0CTL1	 ;  UCA0CTL1.33, UCA0CTL1
	.loc 1 287 0
	mov.b	#1, &__UCA0BR0	 ; , UCA0BR0
	.loc 1 288 0
	mov.b	&__UCA0CTL1, r15	 ;  UCA0CTL1, UCA0CTL1.34
	and.b	#llo(-2), r15	 ; , UCA0CTL1.35
	mov.b	r15, &__UCA0CTL1	 ;  UCA0CTL1.35, UCA0CTL1
	.loc 1 289 0
	pop	r4	 ; 
	ret
.LFE7:
.Lfe8:
	.size	spiInit,.Lfe8-spiInit
;; End of function 

	.p2align 1,0
.global	spiReadByte
	.type	spiReadByte,@function
/***********************
 * Function `spiReadByte' 
 ***********************/
spiReadByte:
.LFB8:
	.loc 1 292 0
	push	r4	 ; 
.LCFI27:
	mov	r1, r4	 ; ,
.LCFI28:
	add	#2, r4	 ; ,
.LCFI29:
	sub	#2, r1	 ; ,
.LCFI30:
	.loc 1 294 0
	mov.b	&__UCA0CTL1, r15	 ;  UCA0CTL1, UCA0CTL1.13
	and.b	#llo(-2), r15	 ; , UCA0CTL1.14
	mov.b	r15, &__UCA0CTL1	 ;  UCA0CTL1.14, UCA0CTL1
	.loc 1 298 0
	mov.b	#85, &__UCA0TXBUF	 ; , UCA0TXBUF
	.loc 1 299 0
	jmp	.L43	 ; 
.L44:
	.loc 1 301 0
#APP
 ;  301 "main.c" 1
	nop
 ;  0 "" 2
#NOAPP
.L43:
	.loc 1 299 0 discriminator 1
	mov.b	&__IFG2, r15	 ;  IFG2, IFG2.15
	mov.b	r15, r15	 ;  IFG2.15, D.1533
	and	#1, r15	 ; , D.1534
	cmp	#0, r15	 ; , D.1534
	jeq	.L44	 ; 
	.loc 1 303 0
	mov.b	&__UCA0RXBUF, -4(r4)	 ;  UCA0RXBUF, rv
	.loc 1 304 0
	mov.b	-4(r4), r15	 ;  rv, D.1535
	.loc 1 305 0
	add	#2, r1	 ; ,
	pop	r4	 ; 
	ret
.LFE8:
.Lfe9:
	.size	spiReadByte,.Lfe9-spiReadByte
;; End of function 

	.p2align 1,0
.global	i2cWriteByte
	.type	i2cWriteByte,@function
/***********************
 * Function `i2cWriteByte' 
 ***********************/
i2cWriteByte:
.LFB9:
	.loc 1 308 0
	push	r4	 ; 
.LCFI31:
	mov	r1, r4	 ; ,
.LCFI32:
	add	#2, r4	 ; ,
.LCFI33:
	sub	#4, r1	 ; ,
.LCFI34:
	mov.b	r15, -6(r4)	 ;  data0, data0
	mov.b	r14, -5(r4)	 ;  data1, data1
	mov.b	r13, -4(r4)	 ;  address, address
	.loc 1 309 0
	mov.b	&__UCB0CTL1, r15	 ;  UCB0CTL1, UCB0CTL1.0
	and.b	#llo(-2), r15	 ; , UCB0CTL1.1
	mov.b	r15, &__UCB0CTL1	 ;  UCB0CTL1.1, UCB0CTL1
	.loc 1 311 0
	mov.b	-4(r4), r15	 ;  address, UCB0I2CSA.2
	mov	r15, &__UCB0I2CSA	 ;  UCB0I2CSA.2, UCB0I2CSA
	.loc 1 312 0
	mov.b	&__UCB0CTL1, r15	 ;  UCB0CTL1, UCB0CTL1.3
	bis.b	#16, r15	 ; , UCB0CTL1.4
	mov.b	r15, &__UCB0CTL1	 ;  UCB0CTL1.4, UCB0CTL1
	.loc 1 313 0
	mov.b	&__UCB0CTL1, r15	 ;  UCB0CTL1, UCB0CTL1.5
	bis.b	#2, r15	 ; , UCB0CTL1.6
	mov.b	r15, &__UCB0CTL1	 ;  UCB0CTL1.6, UCB0CTL1
	.loc 1 314 0
	jmp	.L46	 ; 
.L47:
	.loc 1 316 0
#APP
 ;  316 "main.c" 1
	nop
 ;  0 "" 2
#NOAPP
.L46:
	.loc 1 314 0 discriminator 1
	mov.b	&__IFG2, r15	 ;  IFG2, IFG2.7
	mov.b	r15, r15	 ;  IFG2.7, D.1517
	and	#8, r15	 ; , D.1518
	cmp	#0, r15	 ; , D.1518
	jeq	.L47	 ; 
	.loc 1 318 0
	mov.b	-6(r4), &__UCB0TXBUF	 ;  data0, UCB0TXBUF
	.loc 1 319 0
	jmp	.L48	 ; 
.L49:
	.loc 1 321 0
#APP
 ;  321 "main.c" 1
	nop
 ;  0 "" 2
#NOAPP
.L48:
	.loc 1 319 0 discriminator 1
	mov.b	&__IFG2, r15	 ;  IFG2, IFG2.8
	mov.b	r15, r15	 ;  IFG2.8, D.1520
	and	#8, r15	 ; , D.1521
	cmp	#0, r15	 ; , D.1521
	jeq	.L49	 ; 
	.loc 1 323 0
	mov.b	-5(r4), &__UCB0TXBUF	 ;  data1, UCB0TXBUF
	.loc 1 324 0
	jmp	.L50	 ; 
.L51:
	.loc 1 326 0
#APP
 ;  326 "main.c" 1
	nop
 ;  0 "" 2
#NOAPP
.L50:
	.loc 1 324 0 discriminator 1
	mov.b	&__IFG2, r15	 ;  IFG2, IFG2.9
	mov.b	r15, r15	 ;  IFG2.9, D.1523
	and	#8, r15	 ; , D.1524
	cmp	#0, r15	 ; , D.1524
	jeq	.L51	 ; 
	.loc 1 328 0
	mov.b	&__UCB0CTL1, r15	 ;  UCB0CTL1, UCB0CTL1.10
	bis.b	#4, r15	 ; , UCB0CTL1.11
	mov.b	r15, &__UCB0CTL1	 ;  UCB0CTL1.11, UCB0CTL1
	.loc 1 329 0
	jmp	.L52	 ; 
.L53:
	.loc 1 331 0
#APP
 ;  331 "main.c" 1
	nop
 ;  0 "" 2
#NOAPP
.L52:
	.loc 1 329 0 discriminator 1
	mov.b	&__UCB0CTL1, r15	 ;  UCB0CTL1, UCB0CTL1.12
	mov.b	r15, r15	 ;  UCB0CTL1.12, D.1528
	and	#4, r15	 ; , D.1529
	cmp	#0, r15	 ; , D.1529
	jeq	.L53	 ; 
	.loc 1 337 0
	add	#4, r1	 ; ,
	pop	r4	 ; 
	ret
.LFE9:
.Lfe10:
	.size	i2cWriteByte,.Lfe10-i2cWriteByte
;; End of function 

	.p2align 1,0
.global	delay_ms
	.type	delay_ms,@function
/***********************
 * Function `delay_ms' 
 ***********************/
delay_ms:
.LFB10:
	.loc 1 341 0
	push	r4	 ; 
.LCFI35:
	mov	r1, r4	 ; ,
.LCFI36:
	add	#2, r4	 ; ,
.LCFI37:
	sub	#4, r1	 ; ,
.LCFI38:
	mov	r15, -4(r4)	 ;  d, d
	.loc 1 343 0
	mov	#0, -6(r4)	 ; , i
	jmp	.L55	 ; 
.L57:
	.loc 1 344 0 discriminator 2
	mov	#332, r15	 ; , tmp24
.L56:
	dec	r15	 ;  tmp24
	cmp	#0, r15	 ; , tmp24
	jne	.L56	 ; 
	nop
	nop
	.loc 1 343 0 discriminator 2
	add	#1, -6(r4)	 ; , i
.L55:
	.loc 1 343 0 is_stmt 0 discriminator 1
	cmp	-4(r4), -6(r4)	 ;  d, i
	jl	.L57	 ; 
	.loc 1 345 0 is_stmt 1
	add	#4, r1	 ; ,
	pop	r4	 ; 
	ret
.LFE10:
.Lfe11:
	.size	delay_ms,.Lfe11-delay_ms
;; End of function 

	.section	.debug_frame,"",@progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -2
	.byte	0
	.byte	0xc
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x80
	.uleb128 0x1
	.p2align 1,0
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.2byte	.LFB0
	.2byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x2
	.p2align 1,0
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.2byte	.LFB1
	.2byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI4-.LFB1
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x2
	.p2align 1,0
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.2byte	.LFB2
	.2byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI8-.LFB2
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x2
	.p2align 1,0
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.2byte	.LFB3
	.2byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI11-.LFB3
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x2
	.p2align 1,0
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.2byte	.LFB4
	.2byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI15-.LFB4
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0
	.p2align 1,0
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.2byte	.LFB5
	.2byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI18-.LFB5
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x2
	.p2align 1,0
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.2byte	.LFB6
	.2byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI21-.LFB6
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x2
	.p2align 1,0
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.2byte	.LFB7
	.2byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI24-.LFB7
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x2
	.p2align 1,0
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.2byte	.LFB8
	.2byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI27-.LFB8
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x2
	.p2align 1,0
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.2byte	.LFB9
	.2byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI31-.LFB9
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x2
	.p2align 1,0
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.2byte	.LFB10
	.2byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI35-.LFB10
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x2
	.p2align 1,0
.LEFDE20:
	.text
.Letext0:
	.file 2 "/opt/local/lib/gcc/msp430/4.6.3/../../../../msp430/include/msp430g2955.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x3b6
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x2
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x1
	.4byte	.LASF65
	.4byte	.LASF66
	.2byte	0
	.2byte	0
	.4byte	.Ldebug_ranges0+0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x1
	.4byte	.LASF2
	.byte	0x1
	.byte	0x22
	.byte	0x1
	.2byte	.LFB0
	.2byte	.LFE0
	.4byte	.LLST0
	.4byte	0x5c
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x1
	.byte	0x22
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x5
	.string	"i"
	.byte	0x1
	.byte	0x24
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x1
	.4byte	.LASF3
	.byte	0x1
	.byte	0x2d
	.byte	0x1
	.2byte	.LFB1
	.2byte	.LFE1
	.4byte	.LLST1
	.4byte	0x92
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x1
	.byte	0x2d
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x6
	.4byte	.LASF67
	.byte	0x1
	.byte	0x2f
	.4byte	0x92
	.byte	0
	.uleb128 0x7
	.byte	0x2
	.4byte	0x5c
	.uleb128 0x8
	.byte	0x1
	.4byte	.LASF7
	.byte	0x1
	.byte	0x57
	.2byte	.LFB2
	.2byte	.LFE2
	.4byte	.LLST2
	.uleb128 0x3
	.byte	0x1
	.4byte	.LASF5
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.2byte	.LFB3
	.2byte	.LFE3
	.4byte	.LLST3
	.4byte	0xd8
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x1
	.byte	0x68
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x5
	.string	"i"
	.byte	0x1
	.byte	0x6a
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x9
	.byte	0x1
	.4byte	.LASF68
	.byte	0x1
	.byte	0x73
	.byte	0x1
	.4byte	0x106
	.2byte	.LFB4
	.2byte	.LFE4
	.4byte	.LLST4
	.4byte	0x106
	.uleb128 0xa
	.2byte	.LBB2
	.2byte	.LBE2
	.uleb128 0xb
	.4byte	.LASF6
	.byte	0x1
	.byte	0x8f
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF69
	.byte	0x1
	.byte	0xec
	.byte	0x1
	.2byte	.LFB5
	.2byte	.LFE5
	.4byte	.LLST5
	.uleb128 0xe
	.byte	0x1
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x103
	.2byte	.LFB6
	.2byte	.LFE6
	.4byte	.LLST6
	.uleb128 0xe
	.byte	0x1
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x10e
	.2byte	.LFB7
	.2byte	.LFE7
	.4byte	.LLST7
	.uleb128 0xf
	.byte	0x1
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x123
	.4byte	0x5c
	.2byte	.LFB8
	.2byte	.LFE8
	.4byte	.LLST8
	.4byte	0x168
	.uleb128 0x10
	.string	"rv"
	.byte	0x1
	.2byte	0x129
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x133
	.byte	0x1
	.2byte	.LFB9
	.2byte	.LFE9
	.4byte	.LLST9
	.4byte	0x1ac
	.uleb128 0x12
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x133
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x12
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x133
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.sleb128 -7
	.uleb128 0x12
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x133
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x154
	.byte	0x1
	.2byte	.LFB10
	.2byte	.LFE10
	.4byte	.LLST10
	.4byte	0x1dd
	.uleb128 0x13
	.string	"d"
	.byte	0x1
	.2byte	0x154
	.4byte	0x106
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x10
	.string	"i"
	.byte	0x1
	.2byte	0x156
	.4byte	0x106
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x14
	.4byte	.LASF16
	.byte	0x2
	.byte	0x9e
	.4byte	.LASF70
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.4byte	0x5c
	.uleb128 0x16
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x124
	.4byte	.LASF19
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x126
	.4byte	.LASF20
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x1dd
	.4byte	.LASF22
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x1e5
	.4byte	.LASF24
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x1e7
	.4byte	.LASF26
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x207
	.4byte	.LASF28
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x209
	.4byte	.LASF30
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF31
	.byte	0x2
	.2byte	0x20b
	.4byte	.LASF32
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x2
	.2byte	0x20d
	.4byte	.LASF34
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x2
	.2byte	0x33d
	.4byte	.LASF36
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF37
	.byte	0x2
	.2byte	0x33f
	.4byte	.LASF38
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x341
	.4byte	.LASF40
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x349
	.4byte	.LASF42
	.4byte	0x2dd
	.byte	0x1
	.byte	0x1
	.uleb128 0x17
	.4byte	0x1ee
	.uleb128 0x16
	.4byte	.LASF43
	.byte	0x2
	.2byte	0x34b
	.4byte	.LASF44
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF45
	.byte	0x2
	.2byte	0x356
	.4byte	.LASF46
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF47
	.byte	0x2
	.2byte	0x358
	.4byte	.LASF48
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x2
	.2byte	0x35a
	.4byte	.LASF50
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF51
	.byte	0x2
	.2byte	0x364
	.4byte	.LASF52
	.4byte	0x1ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF53
	.byte	0x2
	.2byte	0x368
	.4byte	.LASF54
	.4byte	0x34e
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.4byte	0x25
	.uleb128 0x16
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x416
	.4byte	.LASF56
	.4byte	0x34e
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x452
	.4byte	.LASF58
	.4byte	0x2dd
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x454
	.4byte	.LASF60
	.4byte	0x2dd
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF61
	.byte	0x1
	.byte	0x1e
	.4byte	0x5c
	.byte	0x1
	.byte	0x3
	.byte	0x3
	.2byte	LED_T_L_value
	.uleb128 0x18
	.4byte	.LASF62
	.byte	0x1
	.byte	0x1f
	.4byte	0x5c
	.byte	0x1
	.byte	0x3
	.byte	0x3
	.2byte	LED_T_M_value
	.uleb128 0x18
	.4byte	.LASF63
	.byte	0x1
	.byte	0x20
	.4byte	0x5c
	.byte	0x1
	.byte	0x3
	.byte	0x3
	.2byte	LED_T_R_value
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.2byte	.LFB0
	.2byte	.LCFI0
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI0
	.2byte	.LCFI1
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI1
	.2byte	.LCFI2
	.2byte	0x2
	.byte	0x74
	.sleb128 4
	.2byte	.LCFI2
	.2byte	.LFE0
	.2byte	0x2
	.byte	0x74
	.sleb128 2
	.2byte	0
	.2byte	0
.LLST1:
	.2byte	.LFB1
	.2byte	.LCFI4
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI4
	.2byte	.LCFI5
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI5
	.2byte	.LCFI6
	.2byte	0x2
	.byte	0x74
	.sleb128 4
	.2byte	.LCFI6
	.2byte	.LFE1
	.2byte	0x2
	.byte	0x74
	.sleb128 2
	.2byte	0
	.2byte	0
.LLST2:
	.2byte	.LFB2
	.2byte	.LCFI8
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI8
	.2byte	.LCFI9
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI9
	.2byte	.LCFI10
	.2byte	0x2
	.byte	0x74
	.sleb128 4
	.2byte	.LCFI10
	.2byte	.LFE2
	.2byte	0x2
	.byte	0x74
	.sleb128 2
	.2byte	0
	.2byte	0
.LLST3:
	.2byte	.LFB3
	.2byte	.LCFI11
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI11
	.2byte	.LCFI12
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI12
	.2byte	.LCFI13
	.2byte	0x2
	.byte	0x74
	.sleb128 4
	.2byte	.LCFI13
	.2byte	.LFE3
	.2byte	0x2
	.byte	0x74
	.sleb128 2
	.2byte	0
	.2byte	0
.LLST4:
	.2byte	.LFB4
	.2byte	.LCFI15
	.2byte	0x2
	.byte	0x71
	.sleb128 0
	.2byte	.LCFI15
	.2byte	.LCFI16
	.2byte	0x2
	.byte	0x74
	.sleb128 0
	.2byte	.LCFI16
	.2byte	.LFE4
	.2byte	0x2
	.byte	0x74
	.sleb128 -2
	.2byte	0
	.2byte	0
.LLST5:
	.2byte	.LFB5
	.2byte	.LCFI18
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI18
	.2byte	.LCFI19
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI19
	.2byte	.LCFI20
	.2byte	0x2
	.byte	0x74
	.sleb128 4
	.2byte	.LCFI20
	.2byte	.LFE5
	.2byte	0x2
	.byte	0x74
	.sleb128 2
	.2byte	0
	.2byte	0
.LLST6:
	.2byte	.LFB6
	.2byte	.LCFI21
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI21
	.2byte	.LCFI22
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI22
	.2byte	.LCFI23
	.2byte	0x2
	.byte	0x74
	.sleb128 4
	.2byte	.LCFI23
	.2byte	.LFE6
	.2byte	0x2
	.byte	0x74
	.sleb128 2
	.2byte	0
	.2byte	0
.LLST7:
	.2byte	.LFB7
	.2byte	.LCFI24
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI24
	.2byte	.LCFI25
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI25
	.2byte	.LCFI26
	.2byte	0x2
	.byte	0x74
	.sleb128 4
	.2byte	.LCFI26
	.2byte	.LFE7
	.2byte	0x2
	.byte	0x74
	.sleb128 2
	.2byte	0
	.2byte	0
.LLST8:
	.2byte	.LFB8
	.2byte	.LCFI27
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI27
	.2byte	.LCFI28
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI28
	.2byte	.LCFI29
	.2byte	0x2
	.byte	0x74
	.sleb128 4
	.2byte	.LCFI29
	.2byte	.LFE8
	.2byte	0x2
	.byte	0x74
	.sleb128 2
	.2byte	0
	.2byte	0
.LLST9:
	.2byte	.LFB9
	.2byte	.LCFI31
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI31
	.2byte	.LCFI32
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI32
	.2byte	.LCFI33
	.2byte	0x2
	.byte	0x74
	.sleb128 4
	.2byte	.LCFI33
	.2byte	.LFE9
	.2byte	0x2
	.byte	0x74
	.sleb128 2
	.2byte	0
	.2byte	0
.LLST10:
	.2byte	.LFB10
	.2byte	.LCFI35
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI35
	.2byte	.LCFI36
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI36
	.2byte	.LCFI37
	.2byte	0x2
	.byte	0x74
	.sleb128 4
	.2byte	.LCFI37
	.2byte	.LFE10
	.2byte	0x2
	.byte	0x74
	.sleb128 2
	.2byte	0
	.2byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x14
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x2
	.byte	0
	.2byte	.Ltext0
	.2byte	.Letext0-.Ltext0
	.2byte	.LFB4
	.2byte	.LFE4-.LFB4
	.2byte	0
	.2byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.2byte	.Ltext0
	.2byte	.Letext0
	.2byte	.LFB4
	.2byte	.LFE4
	.2byte	0
	.2byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF56:
	.string	"__WDTCTL"
.LASF53:
	.string	"UCB0I2CSA"
.LASF16:
	.string	"IFG2"
.LASF23:
	.string	"P1SEL"
.LASF27:
	.string	"P3OUT"
.LASF42:
	.string	"__UCA0RXBUF"
.LASF61:
	.string	"LED_T_L_value"
.LASF36:
	.string	"__UCA0CTL0"
.LASF4:
	.string	"ledAddr"
.LASF50:
	.string	"__UCB0BR0"
.LASF69:
	.string	"init"
.LASF11:
	.string	"i2cWriteByte"
.LASF26:
	.string	"__P1SEL2"
.LASF24:
	.string	"__P1SEL"
.LASF66:
	.string	"/Users/jgb/msp430/smart_switch/main_processor"
.LASF9:
	.string	"spiInit"
.LASF55:
	.string	"WDTCTL"
.LASF1:
	.string	"unsigned char"
.LASF15:
	.string	"delay_ms"
.LASF10:
	.string	"spiReadByte"
.LASF7:
	.string	"fadeButtonsOff"
.LASF18:
	.string	"BCSCTL1"
.LASF58:
	.string	"__CALDCO_1MHZ"
.LASF46:
	.string	"__UCB0CTL0"
.LASF48:
	.string	"__UCB0CTL1"
.LASF8:
	.string	"i2cInit"
.LASF25:
	.string	"P1SEL2"
.LASF43:
	.string	"UCA0TXBUF"
.LASF57:
	.string	"CALDCO_1MHZ"
.LASF68:
	.string	"main"
.LASF39:
	.string	"UCA0BR0"
.LASF21:
	.string	"P1DIR"
.LASF59:
	.string	"CALBC1_1MHZ"
.LASF20:
	.string	"__BCSCTL1"
.LASF37:
	.string	"UCA0CTL1"
.LASF51:
	.string	"UCB0TXBUF"
.LASF0:
	.string	"unsigned int"
.LASF52:
	.string	"__UCB0TXBUF"
.LASF40:
	.string	"__UCA0BR0"
.LASF14:
	.string	"address"
.LASF44:
	.string	"__UCA0TXBUF"
.LASF54:
	.string	"__UCB0I2CSA"
.LASF30:
	.string	"__P3DIR"
.LASF12:
	.string	"data0"
.LASF13:
	.string	"data1"
.LASF5:
	.string	"fadeOff"
.LASF32:
	.string	"__P3SEL"
.LASF60:
	.string	"__CALBC1_1MHZ"
.LASF63:
	.string	"LED_T_R_value"
.LASF34:
	.string	"__P3SEL2"
.LASF65:
	.string	"main.c"
.LASF64:
	.string	"GNU C 4.6.3 20120301 (mspgcc LTS 20120406 unpatched)"
.LASF19:
	.string	"__DCOCTL"
.LASF67:
	.string	"ledValue"
.LASF3:
	.string	"fadeButtonOn"
.LASF28:
	.string	"__P3OUT"
.LASF6:
	.string	"receivedByte"
.LASF22:
	.string	"__P1DIR"
.LASF2:
	.string	"fadeOn"
.LASF45:
	.string	"UCB0CTL0"
.LASF47:
	.string	"UCB0CTL1"
.LASF49:
	.string	"UCB0BR0"
.LASF33:
	.string	"P3SEL2"
.LASF70:
	.string	"__IFG2"
.LASF35:
	.string	"UCA0CTL0"
.LASF29:
	.string	"P3DIR"
.LASF17:
	.string	"DCOCTL"
.LASF38:
	.string	"__UCA0CTL1"
.LASF41:
	.string	"UCA0RXBUF"
.LASF62:
	.string	"LED_T_M_value"
.LASF31:
	.string	"P3SEL"
