	.module Assign44.C
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
	.word _keyboardISR
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
	.dbfile M:\Sysc 2003\Assignment 4/vectors_dp256_NoICE1.c
	.dbsym e interrupt_vectors _interrupt_vectors A[116:58]pfV
	.area data
	.dbfile M:\Sysc 2003\Assignment 4/vectors_dp256_NoICE1.c
_x::
	.blkb 2
	.area idata
	.word 1
	.area data
	.dbfile M:\Sysc 2003\Assignment 4/vectors_dp256_NoICE1.c
	.dbfile Assign44.C
	.dbsym e x _x I
_motorOn::
	.blkb 2
	.area idata
	.word 1
	.area data
	.dbfile Assign44.C
	.dbsym e motorOn _motorOn I
	.area text
	.dbfile Assign44.C
	.dbfunc e main _main fV
;           next -> -1,x
_main::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 19
; /*
; Authors Fady Ibrahim 100876906, Gavez Smith 100857991 
; */
; #include<stdio.h>
; #include "hcs12dp256.h"
; #include "vectors_dp256_NoICE1.c"
; 
; void delay();
; char keypad();
; #pragma interrupt_handler CollisionDetect()
;  void CollisionDetect(void);
;  #pragma interrupt_handler keyboardISR()
;  void keyboardISR(void);
; int x=1;
; int motorOn=1;
; char key;
; 
; void main(void)
; {
	.dbline 21
; char next;
; Lcd2PP_Init();
	jsr _Lcd2PP_Init
	.dbline 22
;     LCD_instruction();
	jsr _LCD_instruction
	.dbline 23
; 	 LCD_display('P');
	ldd #80
	jsr _LCD_display
	.dbline 24
; 	 LCD_display('R');
	ldd #82
	jsr _LCD_display
	.dbline 25
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 26
; 	 LCD_display('S');
	ldd #83
	jsr _LCD_display
	.dbline 27
; 	 LCD_display('S');
	ldd #83
	jsr _LCD_display
	.dbline 28
; 	 LCD_display(' ');
	ldd #32
	jsr _LCD_display
	.dbline 29
; 	 LCD_display('5');
	ldd #53
	jsr _LCD_display
	.dbline 30
; SPI1CR1=0;
	clr 0xf0
	.dbline 31
; key = 0xFF;
	ldab #255
	stab _key
	.dbline 32
; DDRP |= 0x8F; // bitset PP0-3 as outputs (rows) 
	bset 0x25a,#143
	.dbline 33
; DDRH &= 0x0F; // bitclear PH4..7 as inputs (columns)
	bclr 0x262,#0xf0
	.dbline 34
; PTM=0x08;
	ldab #8
	stab 0x250
	.dbline 35
; PTP = 0x8F; // Set scan row(s)
	ldab #143
	stab 0x258
	.dbline 36
; PIFH = 0xFF; // Clear previous interrupt flags
	ldab #255
	stab 0x267
	.dbline 37
; PPSH = 0xF0; // Rising Edge
	ldab #240
	stab 0x265
	.dbline 38
; PERH = 0x00; // Disable pulldowns
	clr 0x264
	.dbline 39
; PIEH |= 0xF0; // Local enable on columns inputs
	bset 0x266,#240
	.dbline 40
; asm( "cli" );
		cli

	.dbline -2
	.dbline 43
; 
; 	
; }
L3:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l next -1 c
	.dbend
	.dbfunc e CollisionDetect _CollisionDetect fV
;      clockwise -> -4,x
_CollisionDetect::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 50
; 
; /*
; This function is the Real-Time ISR and interruts the program when the user presses 5 on the keyboard. It executes the
; interrupt turns off the dc motor waits 3-4 second and turns the steppor motor then afterwards it turns on the dc motor again.
; */
;  void CollisionDetect(void)
; {
	.dbline 52
; 
; 	if(motorOn==1)
	ldd _motorOn
	cpd #1
	bne L5
	.dbline 53
; 	{
	.dbline 54
; 	motorOn=0;
	ldd #0
	std _motorOn
	.dbline 55
; 	PTP=PTP & 0x7F;
	bclr 0x258,#0x80
	.dbline 56
; 	}	
L5:
	.dbline 57
; if (x==24)
	ldd _x
	cpd #24
	bne L7
	.dbline 58
; {
	.dbline 59
; double clockwise =0;   //counter clockwise incrementer
	ldy #L9
	jsr __tofp1
	leay -4,x
	jsr __fromfp1
	.dbline 61
; 
; 	DDRP = 0xF0;//enable port P for the stepper motor
	ldab #240
	stab 0x25a
	.dbline 62
; 	PTP = 0x20;
	ldab #32
	stab 0x258
	.dbline 63
; 	DDRT = 0xF0;//enable the bottom and left coils for the stepper motor
	ldab #240
	stab 0x242
	bra L11
L10:
	.dbline 65
	.dbline 66
	ldab #128
	stab 0x240
	.dbline 67
	jsr _delay
	.dbline 68
	ldab #32
	stab 0x240
	.dbline 69
	jsr _delay
	.dbline 70
	ldab #64
	stab 0x240
	.dbline 71
	jsr _delay
	.dbline 72
	clr 0x240
	.dbline 73
	jsr _delay
	.dbline 74
	leay -4,x
	jsr __tofp1
	ldy #L13
	jsr __tofp2
	jsr __fpadd
	leay -4,x
	jsr __fromfp1
	.dbline 75
L11:
	.dbline 65
; 	
; 	while(clockwise<=5){//spin the stepper motor clockwise
	leay -4,x
	jsr __tofp1
	ldy #L14
	jsr __tofp2
	jsr __fpcmp
	ble L10
	.dbline 76
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
	.dbline 77
; if (x==40)
	ldd _x
	cpd #40
	bne L15
	.dbline 78
; {
	.dbline 79
; 	motorOn=1;
	ldd #1
	std _motorOn
	.dbline 80
; 	x=0;
	ldd #0
	std _x
	.dbline 81
; 	CRGINT= CRGINT & 0x7F;
	bclr 0x38,#0x80
	.dbline 82
; }
L15:
	.dbline 83
;  CRGFLG|= 0x80;
	bset 0x37,#128
	.dbline 84
; x++;
	ldd _x
	addd #1
	std _x
	.dbline -2
	.dbline 85
; } 
L4:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbsym l clockwise -4 D
	.dbend
	.dbfunc e keyboardISR _keyboardISR fV
;           temp -> -1,x
_keyboardISR::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 89
; 
; 
; void keyboardISR(void)
; {
	.dbline 91
; char temp;
; PIEH = 0x00; // Local disable
	clr 0x266
	.dbline 92
; PIFH = PIFH; // Acknowledge (all) interrupts
	; vol
	ldab 0x267
	stab 0x267
	.dbline 93
; PIEH |= 0xF0; // Local enable on columns inputs
	bset 0x266,#240
	.dbline 94
; asm("SEI");
		SEI

	.dbline 95
; temp = keypad();
	jsr _keypad
	stab -1,x
	.dbline 96
; if (temp ==0x35) 
	ldab -1,x
	cmpb #53
	bne L18
	.dbline 97
; {
	.dbline 98
; 	printf ("Obstacle detected. Robot turing right in three seconds (Look at stepper motor)!\n");	
	ldd #L20
	jsr _printf
	.dbline 99
; 	  LCD_instruction(0x00);
	ldd #0
	jsr _LCD_instruction
	.dbline 100
; 	 LCD_display('T');
	ldd #84
	jsr _LCD_display
	.dbline 101
; 	 LCD_display('U');
	ldd #85
	jsr _LCD_display
	.dbline 102
; 	 LCD_display('R');
	ldd #82
	jsr _LCD_display
	.dbline 103
; 	 LCD_display('N');
	ldd #78
	jsr _LCD_display
	.dbline 104
; 	 LCD_display('I');
	ldd #73
	jsr _LCD_display
	.dbline 105
; 	 LCD_display('N');
	ldd #78
	jsr _LCD_display
	.dbline 106
; 	 LCD_display('G');
	ldd #71
	jsr _LCD_display
	.dbline 107
; 	 LCD_display(' ');
	ldd #32
	jsr _LCD_display
	.dbline 108
; 	 LCD_display('R');
	ldd #82
	jsr _LCD_display
	.dbline 109
; 	 LCD_display('I');
	ldd #73
	jsr _LCD_display
	.dbline 110
; 	 LCD_display('G');
	ldd #71
	jsr _LCD_display
	.dbline 111
; 	 LCD_display('H');
	ldd #72
	jsr _LCD_display
	.dbline 112
; 	 LCD_display('T');
	ldd #84
	jsr _LCD_display
	.dbline 113
; 	CRGINT=0x80; //enable realtime interrupt
	ldab #128
	stab 0x38
	.dbline 114
; 	RTICTL=0x7F;// set the period frequency.
	ldab #127
	stab 0x3b
	.dbline 115
; 	asm("cli");
		cli

	.dbline 116
;  }
L18:
	.dbline 117
;  PTP=0x80;
	ldab #128
	stab 0x258
	.dbline 118
;  PIFH = PIFH; // Acknowledge (all) interrupts
	; vol
	ldab 0x267
	stab 0x267
	.dbline 119
; PIEH |= 0xF0; // Local enable on columns inputs
	bset 0x266,#240
	.dbline 120
; 	asm("cli");
		cli

	.dbline -2
	.dbline 121
; }
L17:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbsym l temp -1 c
	.dbend
	.dbfunc e delay _delay fV
;              i -> -2,x
_delay::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 123
; 
; void delay(){//delay for a considerable 10 ms
	.dbline 124
;    int i = 0;   //counter
	ldd #0
	std -2,x
	.dbline 125
	ldd #0
	std -2,x
L22:
	.dbline 125
	.dbline 126
L23:
	.dbline 125
;    for(i=0; i<10000; i++){
	ldd -2,x
	addd #1
	std -2,x
	.dbline 125
	ldd -2,x
	cpd #10000
	blt L22
	.dbline -2
	.dbline 127
;    }
; }
L21:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l i -2 I
	.dbend
	.dbfunc e keypad _keypad fc
;           loop -> -3,x
;     keypressed -> -1,x
_keypad::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 130
; 
; char keypad()
; {
	.dbline 131
;  	int loop=0;
	ldd #0
	std -3,x
	.dbline 132
;  	char keypressed=0;
	clr -1,x
	bra L28
L27:
	.dbline 134
; 	while (loop==0)
; 	{
	.dbline 136
; 	// turns on the motor and the the output pins for the rows on the keypad.
; 	DDRP=0x8F;
	ldab #143
	stab 0x25a
	.dbline 138
; 	//turns on the collums.
;   	DDRH=0x00;	
	clr 0x262
	.dbline 139
; 	PTM = 0x08;
	ldab #8
	stab 0x250
	.dbline 140
; 	if(motorOn==1)
	ldd _motorOn
	cpd #1
	bne L30
	.dbline 141
; 	{
	.dbline 142
; 	PTP=PTP | 0x80;
	bset 0x258,#128
	.dbline 143
; 	}			   				
L30:
	.dbline 144
; 	keypressed=PTH;
	; vol
	ldab 0x260
	stab -1,x
	.dbline 145
; 	PTP= PTP & 0x82;
	bclr 0x258,#0x7d
	.dbline 146
; 	PTM =PTM & 0x00;
	ldd #0
	stab 0x250
	.dbline 147
; 	keypressed &= 0xF0;
	bclr -1,x,#0xf
	.dbline 148
; 	if (keypressed==0x20 && PTP==0x82)
	ldab -1,x
	cmpb #32
	bne L32
	; vol
	ldab 0x258
	cmpb #130
	bne L32
	.dbline 149
; 	{
	.dbline 150
; 	 return '5';
	ldd #53
	bra L26
L32:
	.dbline 153
	ldd #0
	bra L26
L28:
	.dbline 133
	ldd -3,x
	beq L27
	.dbline -2
	.dbline 157
; 	}
; 
; 	return 0;
; 	
; 
; }
; }
L26:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l loop -3 I
	.dbsym l keypressed -1 c
	.dbend
	.include'basicLCD.s'

	.area bss
	.dbfile Assign44.C
_key::
	.blkb 1
	.dbsym e key _key c
	.area text
	.dbfile Assign44.C
L20:
	.byte 'O,'b,'s,'t,'a,'c,'l,'e,32,'d,'e,'t,'e,'c,'t,'e
	.byte 'd,46,32,'R,'o,'b,'o,'t,32,'t,'u,'r,'i,'n,'g,32
	.byte 'r,'i,'g,'h,'t,32,'i,'n,32,'t,'h,'r,'e,'e,32,'s
	.byte 'e,'c,'o,'n,'d,'s,32,40,'L,'o,'o,'k,32,'a,'t,32
	.byte 's,'t,'e,'p,'p,'e,'r,32,'m,'o,'t,'o,'r,41,33,10
	.byte 0
L14:
	.word 0x40a0,0x0
L13:
	.word 0x3f80,0x0
L9:
	.word 0x0,0x0
