	.module Assign43b.C
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
	.word _CollisionDetect
	.word 63695
	.word 63687
	.word 63683
	.word 63691
	.word 63493
	.word 63497
	.word __start
	.dbfile M:\Sysc 2003\Assignment 4/vectors_dp256_NoICE.c
	.dbsym e interrupt_vectors _interrupt_vectors A[116:58]pfV
	.area data
	.dbfile M:\Sysc 2003\Assignment 4/vectors_dp256_NoICE.c
_x::
	.blkb 2
	.area idata
	.word 1
	.area data
	.dbfile M:\Sysc 2003\Assignment 4/vectors_dp256_NoICE.c
	.dbfile Assign43b.C
	.dbsym e x _x I
_motorOn::
	.blkb 2
	.area idata
	.word 1
	.area data
	.dbfile Assign43b.C
	.dbsym e motorOn _motorOn I
	.area text
	.dbfile Assign43b.C
	.dbfunc e main _main fV
_main::
	.dbline -1
	.dbline 14
; /*
; Authors Fady Ibrahim 100876906, Gavez Smith 100857991 
; */
; #include<stdio.h>
; #include "hcs12dp256.h"
; #include "vectors_dp256_NoICE.c"
; void delay();
; void printKeysPressed();
; int x=1;
; int motorOn=1;
; 
; 
; void main(void)
; {
	.dbline 15
; SPI1CR1=0;
	clr 0xf0
	.dbline 17
; 
; printKeysPressed();
	jsr _printKeysPressed
	.dbline -2
	.dbline 18
; }
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e CollisionDetect _CollisionDetect fV
;      clockwise -> -4,x
_CollisionDetect::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 26
; #pragma interrupt_handler CollisionDetect()
; 
; /*
; This function is the Real-Time ISR and interruts the program when the user presses 5 on the keyboard. It executes the
; interrupt turns off the dc motor waits 3-4 second and turns the steppor motor then afterwards it turns on the dc motor again.
; */
;  void CollisionDetect(void)
; {
	.dbline 28
; 
; 	if(motorOn==1)
	ldd _motorOn
	cpd #1
	bne L5
	.dbline 29
; 	{
	.dbline 30
; 	motorOn=0;
	ldd #0
	std _motorOn
	.dbline 31
; 	PTP=PTP & 0x7F;
	bclr 0x258,#0x80
	.dbline 32
; 	}	
L5:
	.dbline 33
; if (x==24)
	ldd _x
	cpd #24
	bne L7
	.dbline 34
; {
	.dbline 35
; double clockwise =0;   //counter clockwise incrementer
	ldy #L9
	jsr __tofp1
	leay -4,x
	jsr __fromfp1
	.dbline 37
; 
; 	DDRP = 0xF0;//enable port P for the stepper motor
	ldab #240
	stab 0x25a
	.dbline 38
; 	PTP = 0x20;
	ldab #32
	stab 0x258
	.dbline 39
; 	DDRT = 0xF0;//enable the bottom and left coils for the stepper motor
	ldab #240
	stab 0x242
	bra L11
L10:
	.dbline 41
	.dbline 42
	ldab #128
	stab 0x240
	.dbline 43
	jsr _delay
	.dbline 44
	ldab #32
	stab 0x240
	.dbline 45
	jsr _delay
	.dbline 46
	ldab #64
	stab 0x240
	.dbline 47
	jsr _delay
	.dbline 48
	clr 0x240
	.dbline 49
	jsr _delay
	.dbline 50
	leay -4,x
	jsr __tofp1
	ldy #L13
	jsr __tofp2
	jsr __fpadd
	leay -4,x
	jsr __fromfp1
	.dbline 51
L11:
	.dbline 41
; 	
; 	while(clockwise<=1){//spin the stepper motor clockwise
	leay -4,x
	jsr __tofp1
	ldy #L13
	jsr __tofp2
	jsr __fpcmp
	ble L10
	.dbline 52
; 	   PTT = 0x80;
; 	   delay();
; 	   PTT = 0x20;
; 	   delay();
; 	   PTT = 0x40;
; 	   delay();
; 	   PTT = 0x00;
; 	   delay();
; 	   clockwise++;
; 	}
; }
L7:
	.dbline 53
; if (x==40)
	ldd _x
	cpd #40
	bne L14
	.dbline 54
; {
	.dbline 55
; 	motorOn=1;
	ldd #1
	std _motorOn
	.dbline 56
; 	x=0;
	ldd #0
	std _x
	.dbline 57
; 	CRGINT= CRGINT & 0x7F;
	bclr 0x38,#0x80
	.dbline 58
; }
L14:
	.dbline 59
;  CRGFLG|= 0x80;
	bset 0x37,#128
	.dbline 60
; x++;
	ldd _x
	addd #1
	std _x
	.dbline -2
	.dbline 61
; } 
L4:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbsym l clockwise -4 D
	.dbend
	.dbfunc e delay _delay fV
;              i -> -2,x
_delay::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 63
; 
; void delay(){//delay for a considerable 10 ms
	.dbline 64
;    int i = 0;   //counter
	ldd #0
	std -2,x
	.dbline 65
	ldd #0
	std -2,x
L17:
	.dbline 65
	.dbline 66
L18:
	.dbline 65
;    for(i=0; i<10000; i++){
	ldd -2,x
	addd #1
	std -2,x
	.dbline 65
	ldd -2,x
	cpd #10000
	blt L17
	.dbline -2
	.dbline 67
;    }
; }
L16:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l i -2 I
	.dbend
	.dbfunc e printKeysPressed _printKeysPressed fV
;        counter -> -7,x
;           loop -> -5,x
;     keypressed -> -3,x
;              i -> -2,x
_printKeysPressed::
	pshx
	tfr s,x
	leas -8,sp
	.dbline -1
	.dbline 72
; 
; /*
; checks to see if key 5 is pressed if it is enable the realtime interrupt, else keep the dc motor running.
; */
; void printKeysPressed(){
	.dbline 73
; 	int i=0;
	ldd #0
	std -2,x
	.dbline 74
; 	int loop=0;
	ldd #0
	std -5,x
	.dbline 75
; 	char keypressed=0;
	clr -3,x
	.dbline 76
; 	int counter=1;
	ldd #1
	std -7,x
	.dbline 78
; 
; 	printf("No Obstacle detected!!! (press 5 to detect obstacle)\n");	
	ldd #L22
	jsr _printf
	.dbline 79
; 	SPI1CR1=0x00;
	clr 0xf0
	bra L24
L23:
	.dbline 83
; 
; 
; 	while (loop==0)
; 	{
	.dbline 85
; 	// turns on the motor and the the output pins for the rows on the keypad.
; 	DDRP=0x8F;
	ldab #143
	stab 0x25a
	.dbline 87
; 	//turns on the collums.
;   	DDRH=0x00;	
	clr 0x262
	.dbline 88
; 	PTM = 0x08;
	ldab #8
	stab 0x250
	.dbline 89
; 	if(motorOn==1)
	ldd _motorOn
	cpd #1
	bne L26
	.dbline 90
; 	{
	.dbline 91
; 	PTP=PTP | 0x80;
	bset 0x258,#128
	.dbline 92
; 	}			   				
L26:
	.dbline 93
; 	keypressed=PTH;
	; vol
	ldab 0x260
	stab -3,x
	.dbline 94
; 	PTP= PTP | 0x02;
	bset 0x258,#2
	.dbline 95
; 	PTM =PTM & 0x00;
	ldd #0
	stab 0x250
	.dbline 96
; 	keypressed &= 0xF0;
	bclr -3,x,#0xf
	.dbline 98
; 	
; 	if (keypressed==0x20 && PTP==0x82)
	ldab -3,x
	cmpb #32
	bne L28
	; vol
	ldab 0x258
	cmpb #130
	bne L28
	.dbline 99
; 	{
	.dbline 100
; 	printf ("Obstacle detected. Robot turing right in three seconds (Look at stepper motor)!\n");	
	ldd #L30
	jsr _printf
	.dbline 101
; 	CRGINT=0x80; //enable realtime interrupt
	ldab #128
	stab 0x38
	.dbline 102
; 	RTICTL=0x7F;// set the period frequency.
	ldab #127
	stab 0x3b
	.dbline 103
; 	asm("cli");
		cli

	.dbline 104
; 	}
L28:
	.dbline 107
	ldd #0
	std -2,x
L31:
	.dbline 107
L32:
	.dbline 107
	ldd -2,x
	addd #1
	std -2,x
	.dbline 107
	ldd -2,x
	cpd #30000
	blt L31
	.dbline 110
L24:
	.dbline 82
	ldd -5,x
	beq L23
	.dbline -2
	.dbline 112
; 
; 	
; 	for ( i=0;i<30000;i++);
; 	
; 
; 	}
; 		
; }
L21:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l counter -7 I
	.dbsym l loop -5 I
	.dbsym l keypressed -3 c
	.dbsym l i -2 I
	.dbend
L30:
	.byte 'O,'b,'s,'t,'a,'c,'l,'e,32,'d,'e,'t,'e,'c,'t,'e
	.byte 'd,46,32,'R,'o,'b,'o,'t,32,'t,'u,'r,'i,'n,'g,32
	.byte 'r,'i,'g,'h,'t,32,'i,'n,32,'t,'h,'r,'e,'e,32,'s
	.byte 'e,'c,'o,'n,'d,'s,32,40,'L,'o,'o,'k,32,'a,'t,32
	.byte 's,'t,'e,'p,'p,'e,'r,32,'m,'o,'t,'o,'r,41,33,10
	.byte 0
L22:
	.byte 'N,'o,32,'O,'b,'s,'t,'a,'c,'l,'e,32,'d,'e,'t,'e
	.byte 'c,'t,'e,'d,33,33,33,32,40,'p,'r,'e,'s,'s,32,53
	.byte 32,'t,'o,32,'d,'e,'t,'e,'c,'t,32,'o,'b,'s,'t,'a
	.byte 'c,'l,'e,41,10,0
L13:
	.word 0x3f80,0x0
L9:
	.word 0x0,0x0
