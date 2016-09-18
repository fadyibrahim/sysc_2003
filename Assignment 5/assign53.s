	.module assign53.C
	.area memory(abs)
	.org 0x3f8c
_interrupt_vectors::
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word _tempINT
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63687
	.word 63683
	.word 63691
	.word 63493
	.word 63497
	.word __start
	.dbfile M:\Sysc 2003\Assignment 5/vectors_dp256_NoICE2.c
	.dbsym e interrupt_vectors _interrupt_vectors A[116:58]pfV
	.area data
	.dbfile M:\Sysc 2003\Assignment 5/vectors_dp256_NoICE2.c
_ready::
	.blkb 2
	.area idata
	.word 1
	.area data
	.dbfile M:\Sysc 2003\Assignment 5/vectors_dp256_NoICE2.c
	.dbfile assign53.C
	.dbsym e ready _ready I
	.area text
	.dbfile assign53.C
	.dbfunc e main _main fV
_main::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 12
; #include "hcs12dp256.h"
; #include <stdio.h>
; #include "vectors_dp256_NoICE2.c"
; 
; #pragma interrupt_handler tempINT()
; void tempINT(void);
; 
; int temper;
; int ready=1;
; 
; void main(void)
; {
	.dbline 13
; SPI1CR1=0;
	clr 0xf0
	.dbline 14
; DDRM=0x80;
	ldab #128
	stab 0x252
	.dbline 15
; ATD0CTL2=0xFA;
	ldab #250
	stab 0x82
	.dbline 16
; ATD0CTL3=0x00;
	clr 0x83
	.dbline 17
; ATD0CTL4=0x60;
	ldab #96
	stab 0x84
	.dbline 18
; ATD0CTL5=0x86;
	ldab #134
	stab 0x85
	.dbline 19
; asm("cli");
		cli

	bra L5
L4:
	.dbline 21
; while (1==1)
; {
	.dbline 23
; 
; if (temper<=100 && ready==1)
	ldd _temper
	cpd #100
	bgt L7
	ldd _ready
	cpd #1
	bne L7
	.dbline 24
; {
	.dbline 25
; PTM|=0x80;
	bset 0x250,#128
	.dbline 26
; }
	bra L8
L7:
	.dbline 28
; else
; {
	.dbline 29
; ready=0;
	ldd #0
	std _ready
	.dbline 30
; PTM=0x00;
	clr 0x250
	.dbline 31
; }
L8:
	.dbline 32
	movw _temper,0,sp
	ldd #L9
	jsr _printf
	.dbline 33
L5:
	.dbline 20
	bra L4
X0:
	.dbline -2
	.dbline 35
; printf("Temp= %d \n",temper);
; }
; 
; }
L3:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e tempINT _tempINT fV
;              i -> -4,x
;          tempT -> -2,x
_tempINT::
	pshx
	tfr s,x
	leas -6,sp
	.dbline -1
	.dbline 38
; 
; void tempINT(void)
; {
	.dbline 41
; int tempT;
; int i;
; tempT=ATD0DR6H<<8;
	; vol
	ldab 0x9c
	clra
	tba
	clrb
	std -2,x
	.dbline 42
; tempT&=0x03FF;
	ldd -2,x
	anda #3
	andb #255
	std -2,x
	.dbline 43
; tempT+=ATD0DR6L;
	; vol
	ldab 0x9d
	clra
	std -6,x
	ldd -2,x
	addd -6,x
	std -2,x
	.dbline 44
; tempT=tempT/8;
	ldd -2,x
	ldy #8
	exg x,y
	idivs
	exg x,y
	sty -2,x
	.dbline 45
; tempT=tempT-5;
	ldd -2,x
	subd #5
	std -2,x
	.dbline 46
; temper=tempT;
	movw -2,x,_temper
	.dbline 47
; ATD0CTL5=0x86;
	ldab #134
	stab 0x85
	.dbline -2
	.dbline 48
; }
L10:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbsym l i -4 I
	.dbsym l tempT -2 I
	.dbend
	.area bss
	.dbfile assign53.C
_temper::
	.blkb 2
	.dbsym e temper _temper I
	.area text
	.dbfile assign53.C
L9:
	.byte 'T,'e,'m,'p,61,32,37,'d,32,10,0
