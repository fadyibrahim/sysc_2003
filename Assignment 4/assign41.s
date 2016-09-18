	.module Assign41.C
	.area text
	.dbfile Assign41.C
	.dbfunc e main _main fV
_main::
	.dbline -1
	.dbline 9
; /*
; Authors Fady Ibrahim 100876906, Gavez Smith 100857991 
; */
; #include "hcs12dp256.h"
; 
; 
; void printKeysPressed();
; 
; void main(){
	.dbline 12
; 
; 	 
; 	 printKeysPressed();
	jsr _printKeysPressed
	.dbline -2
	.dbline 15
; 
; 	
; }
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e printKeysPressed _printKeysPressed fV
;           loop -> -7,x
;     keypressed -> -5,x
;        counter -> -4,x
;              i -> -2,x
_printKeysPressed::
	pshx
	tfr s,x
	leas -8,sp
	.dbline -1
	.dbline 21
; 
; /*
; printKeysPressed gets the character pressed on the keyboard by pulling and then it prints out the value on the terminal.
; 
; */
; void printKeysPressed(){
	.dbline 22
; 	int i=0;
	ldd #0
	std -2,x
	.dbline 23
; 	int loop=0;
	ldd #0
	std -7,x
	.dbline 24
; 	char keypressed=0;
	clr -5,x
	.dbline 25
; 	int counter=1;
	ldd #1
	std -4,x
	.dbline 26
; 	SPI1CR1=0x00;
	clr 0xf0
	.dbline 28
; //enable the rows with 1. Also expect an output for PTP
; 	DDRP=0x0F;
	ldab #15
	stab 0x25a
	.dbline 30
; //enable the colums with 0. Also expect an input for PTH
; 	DDRH=0x00;
	clr 0x262
	lbra L6
L5:
	.dbline 32
; 	while (loop==0)
; 	{
	.dbline 34
; // enable the latch.
; 	PTM = 0x08;	  			   				
	ldab #8
	stab 0x250
	.dbline 35
; 	PTP=counter;
	ldd -4,x
	stab 0x258
	.dbline 37
; //get the input value from PTH
; 	keypressed=PTH;
	; vol
	ldab 0x260
	stab -5,x
	.dbline 38
; 	PTM &= 0x00;
	ldd #0
	stab 0x250
	.dbline 39
; 	keypressed &= 0xF0;
	bclr -5,x,#0xf
	.dbline 40
; 	if (keypressed==0x10 && counter==1)
	ldab -5,x
	cmpb #16
	bne L8
	ldd -4,x
	cpd #1
	bne L8
	.dbline 41
; 	{
	.dbline 42
; 	   printf("1" );
	ldd #L10
	jsr _printf
	.dbline 43
; 	}
	lbra L9
L8:
	.dbline 44
; 	else if (keypressed==0x20 && counter==1)
	ldab -5,x
	cmpb #32
	bne L11
	ldd -4,x
	cpd #1
	bne L11
	.dbline 45
; 	{
	.dbline 46
; 	   printf("2" );
	ldd #L13
	jsr _printf
	.dbline 47
; 	}
	lbra L12
L11:
	.dbline 48
; 	else if (keypressed==0x40 && counter==1)
	ldab -5,x
	cmpb #64
	bne L14
	ldd -4,x
	cpd #1
	bne L14
	.dbline 49
; 	{
	.dbline 50
; 	   printf("3" );
	ldd #L16
	jsr _printf
	.dbline 51
; 	}
	lbra L15
L14:
	.dbline 52
; 	else if (keypressed==0x80 && counter==1)
	ldab -5,x
	cmpb #128
	bne L17
	ldd -4,x
	cpd #1
	bne L17
	.dbline 53
; 	{
	.dbline 54
; 	   printf("A");
	ldd #L19
	jsr _printf
	.dbline 55
; 	}
	lbra L18
L17:
	.dbline 56
; 	else if (keypressed==0x10 && counter==2)
	ldab -5,x
	cmpb #16
	bne L20
	ldd -4,x
	cpd #2
	bne L20
	.dbline 57
; 	{
	.dbline 58
; 	   printf("4");
	ldd #L22
	jsr _printf
	.dbline 59
; 	}
	lbra L21
L20:
	.dbline 60
; 		else if (keypressed==0x20 && counter==2)
	ldab -5,x
	cmpb #32
	bne L23
	ldd -4,x
	cpd #2
	bne L23
	.dbline 61
; 	{
	.dbline 62
; 	   printf("5");
	ldd #L25
	jsr _printf
	.dbline 63
; 	}
	lbra L24
L23:
	.dbline 64
; 		else if (keypressed==0x40 && counter==2)
	ldab -5,x
	cmpb #64
	bne L26
	ldd -4,x
	cpd #2
	bne L26
	.dbline 65
; 	{
	.dbline 66
; 	   printf("6");
	ldd #L28
	jsr _printf
	.dbline 67
; 	}
	lbra L27
L26:
	.dbline 68
; 		else if (keypressed==0x80 && counter==2)
	ldab -5,x
	cmpb #128
	bne L29
	ldd -4,x
	cpd #2
	bne L29
	.dbline 69
; 	{
	.dbline 70
; 	   printf("B");
	ldd #L31
	jsr _printf
	.dbline 71
; 	}
	lbra L30
L29:
	.dbline 73
; 	
; 		else if (keypressed==0x10 && counter==4)
	ldab -5,x
	cmpb #16
	bne L32
	ldd -4,x
	cpd #4
	bne L32
	.dbline 74
; 	{
	.dbline 75
; 	   printf("7");
	ldd #L34
	jsr _printf
	.dbline 76
; 	}
	lbra L33
L32:
	.dbline 77
; 		else if (keypressed==0x20 && counter==4)
	ldab -5,x
	cmpb #32
	bne L35
	ldd -4,x
	cpd #4
	bne L35
	.dbline 78
; 	{
	.dbline 79
; 	   printf("8");
	ldd #L37
	jsr _printf
	.dbline 80
; 	}
	lbra L36
L35:
	.dbline 81
; 		else if (keypressed==0x40 && counter==4)
	ldab -5,x
	cmpb #64
	bne L38
	ldd -4,x
	cpd #4
	bne L38
	.dbline 82
; 	{
	.dbline 83
; 	   printf("9");
	ldd #L40
	jsr _printf
	.dbline 84
; 	}
	bra L39
L38:
	.dbline 85
; 		else if (keypressed==0x80 && counter==4)
	ldab -5,x
	cmpb #128
	bne L41
	ldd -4,x
	cpd #4
	bne L41
	.dbline 86
; 	{
	.dbline 87
; 	   printf("C");
	ldd #L43
	jsr _printf
	.dbline 88
; 	}
	bra L42
L41:
	.dbline 90
; 	
; 		else if (keypressed==0x10 && counter==8)
	ldab -5,x
	cmpb #16
	bne L44
	ldd -4,x
	cpd #8
	bne L44
	.dbline 91
; 	{
	.dbline 92
; 	   printf("E");
	ldd #L46
	jsr _printf
	.dbline 93
; 	}
	bra L45
L44:
	.dbline 94
; 		else if (keypressed==0x20 && counter==8)
	ldab -5,x
	cmpb #32
	bne L47
	ldd -4,x
	cpd #8
	bne L47
	.dbline 95
; 	{
	.dbline 96
; 	   printf("0");
	ldd #L49
	jsr _printf
	.dbline 97
; 	   loop=1;
	ldd #1
	std -7,x
	.dbline 98
; 	}
	bra L48
L47:
	.dbline 99
; 		else if (keypressed==0x40 && counter==8)
	ldab -5,x
	cmpb #64
	bne L50
	ldd -4,x
	cpd #8
	bne L50
	.dbline 100
; 	{
	.dbline 101
; 	   printf("F");
	ldd #L52
	jsr _printf
	.dbline 102
; 	}
	bra L51
L50:
	.dbline 103
; 		else if (keypressed==0x80 && counter==8)
	ldab -5,x
	cmpb #128
	bne L53
	ldd -4,x
	cpd #8
	bne L53
	.dbline 104
; 	{
	.dbline 105
; 	   printf("D");
	ldd #L55
	jsr _printf
	.dbline 106
; 	}
L53:
L51:
L48:
L45:
L42:
L39:
L36:
L33:
L30:
L27:
L24:
L21:
L18:
L15:
L12:
L9:
	.dbline 108
	ldd #0
	std -2,x
L56:
	.dbline 108
L57:
	.dbline 108
; 	//delay so that 1 character can get displayed at a time
; 	for ( i=0;i<10000;i++);
	ldd -2,x
	addd #1
	std -2,x
	.dbline 108
	ldd -2,x
	cpd #10000
	blt L56
	.dbline 111
; 
; 	//increament the counter and make sure it stays on 1,2,4,8 to set rows 1,2,3,4
; 	if(counter>=2)
	ldd -4,x
	cpd #2
	blt L60
	.dbline 112
; 	{
	.dbline 113
; 	counter=counter +2;
	ldd -4,x
	addd #2
	std -4,x
	.dbline 114
; 	}
	bra L61
L60:
	.dbline 116
; 	else
; 	{
	.dbline 117
; 	counter++;
	ldd -4,x
	addd #1
	std -4,x
	.dbline 118
; 	}
L61:
	.dbline 119
; 	if (counter==6)
	ldd -4,x
	cpd #6
	bne L62
	.dbline 120
; 	{
	.dbline 121
; 	counter=counter+2;
	ldd -4,x
	addd #2
	std -4,x
	.dbline 122
; 	}
L62:
	.dbline 123
; 	if (counter>8)
	ldd -4,x
	cpd #8
	ble L64
	.dbline 124
; 	{
	.dbline 125
; 	counter=1;
	ldd #1
	std -4,x
	.dbline 126
; 	}
L64:
	.dbline 127
L6:
	.dbline 31
	ldd -7,x
	lbeq L5
	.dbline -2
	.dbline 128
; 	}
; }
L4:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l loop -7 I
	.dbsym l keypressed -5 c
	.dbsym l counter -4 I
	.dbsym l i -2 I
	.dbend
L55:
	.byte 'D,0
L52:
	.byte 'F,0
L49:
	.byte 48,0
L46:
	.byte 'E,0
L43:
	.byte 'C,0
L40:
	.byte 57,0
L37:
	.byte 56,0
L34:
	.byte 55,0
L31:
	.byte 'B,0
L28:
	.byte 54,0
L25:
	.byte 53,0
L22:
	.byte 52,0
L19:
	.byte 'A,0
L16:
	.byte 51,0
L13:
	.byte 50,0
L10:
	.byte 49,0
