	.module Assign42.C
	.include'basicLCD.s'

	.area text
	.dbfile Assign42.C
	.dbfunc e main _main fV
_main::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 12
; /*
; Authors Fady Ibrahim 100876906, Gavez Smith 100857991 
; */
; 
; #include"stdio.h"
; #include <hcs12dp256.h>
; asm(".include'basicLCD.s'");
; 
; void Inc_Dec_Speed(int speed, int temp );
; void displaySpeed_Temp(int speed, int temp);
; 
; void main(){
	.dbline 13
; 	 Lcd2PP_Init();
	jsr _Lcd2PP_Init
	.dbline 14
;      Inc_Dec_Speed(123,32);
	ldd #32
	std 0,sp
	ldd #123
	jsr _Inc_Dec_Speed
	.dbline -2
	.dbline 15
; }
L3:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e displaySpeed_Temp _displaySpeed_Temp fV
; arraycharstemp -> -22,x
;     arraychars -> -18,x
;    holderSpeed -> -10,x
;     holderTemp -> -8,x
;         number -> -6,x
;      remainder -> -4,x
;          index -> -2,x
;           temp -> 6,x
;          speed -> 2,x
_displaySpeed_Temp::
	pshd
	pshx
	tfr s,x
	leas -24,sp
	.dbline -1
	.dbline 20
; /*
; DisplaySpeed_Temp displays the speed and temp passed in to the lcd display.
; */
; 
; void displaySpeed_Temp(int speed, int temp){	
	.dbline 22
; 	 int number;
; 	 int index=3;
	ldd #3
	std -2,x
	.dbline 25
; 	 int arraychars[4];
; 	 int arraycharstemp[2];
; 	 int remainder=0;
	ldd #0
	std -4,x
	.dbline 26
; 	 int holderSpeed=speed;
	ldy 2,x
	sty -10,x
	.dbline 27
; 	 int holderTemp=temp;
	movw 6,x,-8,x
	.dbline 28
;      LCD_instruction();
	jsr _LCD_instruction
	.dbline 29
; 	 LCD_display('S');
	ldd #83
	jsr _LCD_display
	.dbline 30
; 	 LCD_display('P');
	ldd #80
	jsr _LCD_display
	.dbline 31
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 32
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 33
; 	 LCD_display('D');
	ldd #68
	jsr _LCD_display
	bra L6
L5:
	.dbline 35
; 	 while (index>=0)
; 	 {
	.dbline 36
; 	 if(holderSpeed!=0)
	ldd -10,x
	beq L8
	.dbline 37
; 	 {
	.dbline 39
; //takes the decimal value passed in and turns it into the decimal value representation in ASCII
; 	 remainder=holderSpeed%10;
	ldd -10,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	std -4,x
	.dbline 40
; 	 holderSpeed=holderSpeed/10;
	ldd -10,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	sty -10,x
	.dbline 41
; 	 remainder=remainder+0x30;
	ldd -4,x
	addd #48
	std -4,x
	.dbline 42
; 	 arraychars[index]=remainder;
	leay -18,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldd -4,x
	std 0,y
	.dbline 43
; 	 index=index-1;
	ldd -2,x
	subd #1
	std -2,x
	.dbline 44
; 	 }	 
	bra L9
L8:
	.dbline 46
; 	 else
; 	 {
	.dbline 47
; 	  arraychars[index]=0x30;
	leay -18,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldd #48
	std 0,y
	.dbline 48
; 	  index=index-1;
	ldd -2,x
	subd #1
	std -2,x
	.dbline 49
; 	 }
L9:
	.dbline 50
L6:
	.dbline 34
	ldd -2,x
	bge L5
	.dbline 51
; 	 }
; 	 LCD_display(' ');
	ldd #32
	jsr _LCD_display
	.dbline 52
; 	 for(index=0;index<4;index++)
	ldd #0
	std -2,x
L10:
	.dbline 53
	.dbline 54
	leay -18,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldy 0,y
	sty -6,x
	.dbline 56
	ldd -6,x
	jsr _LCD_display
	.dbline 57
L11:
	.dbline 52
	ldd -2,x
	addd #1
	std -2,x
	.dbline 52
	ldd -2,x
	cpd #4
	blt L10
	.dbline 59
; 	 {
; 	 	number=arraychars[index];
; 
; 	 	 LCD_display(number);
; 	 }
; 	 
; 	 index=1;
	ldd #1
	std -2,x
	.dbline 61
; 	 //goes to the next line.
; 	 LCD_instruction(0xC0);	
	ldd #192
	jsr _LCD_instruction
	.dbline 62
; 	 LCD_display('T');
	ldd #84
	jsr _LCD_display
	.dbline 63
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 64
; 	 LCD_display('M');
	ldd #77
	jsr _LCD_display
	.dbline 65
; 	 LCD_display('P');
	ldd #80
	jsr _LCD_display
	.dbline 66
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 67
; 	 LCD_display('R');
	ldd #82
	jsr _LCD_display
	.dbline 68
; 	 LCD_display('A');
	ldd #65
	jsr _LCD_display
	.dbline 69
; 	 LCD_display('T');
	ldd #84
	jsr _LCD_display
	.dbline 70
; 	 LCD_display('U');
	ldd #85
	jsr _LCD_display
	.dbline 71
; 	 LCD_display('R');
	ldd #82
	jsr _LCD_display
	.dbline 72
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	bra L15
L14:
	.dbline 75
	.dbline 76
	ldd -8,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	std -4,x
	.dbline 77
	ldd -8,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	sty -8,x
	.dbline 78
	ldd -4,x
	addd #48
	std -4,x
	.dbline 79
	leay -22,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldd -4,x
	std 0,y
	.dbline 80
	ldd -2,x
	subd #1
	std -2,x
	.dbline 81
L15:
	.dbline 74
; 
; 	 while (index>=0)
	ldd -2,x
	bge L14
	.dbline 82
; 	 {
; 	 remainder=holderTemp%10;
;      holderTemp=holderTemp/10;
; 	 remainder=remainder+0x30;
; 	 arraycharstemp[index]=remainder;
; 	 index=index-1;
; 	 } 
; 	 LCD_display(' ');
	ldd #32
	jsr _LCD_display
	.dbline 83
; 	 	 for(index=0;index<2;index++)
	ldd #0
	std -2,x
L17:
	.dbline 84
	.dbline 85
	leay -22,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldy 0,y
	sty -6,x
	.dbline 87
	ldd -6,x
	jsr _LCD_display
	.dbline 88
L18:
	.dbline 83
	ldd -2,x
	addd #1
	std -2,x
	.dbline 83
	ldd -2,x
	cpd #2
	blt L17
	.dbline 90
; 	 {
; 	 	number=arraycharstemp[index];
; 
; 	 	 LCD_display(number);
; 	 }
; 	 
; 	 LCD_display('C');
	ldd #67
	jsr _LCD_display
	.dbline -2
	.dbline 91
; }
L4:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l arraycharstemp -22 A[4:2]I
	.dbsym l arraychars -18 A[8:4]I
	.dbsym l holderSpeed -10 I
	.dbsym l holderTemp -8 I
	.dbsym l number -6 I
	.dbsym l remainder -4 I
	.dbsym l index -2 I
	.dbsym l temp 6 I
	.dbsym l speed 2 I
	.dbend
	.dbfunc e Inc_Dec_Speed _Inc_Dec_Speed fV
;           loop -> -9,x
;    speedholder -> -7,x
;     keypressed -> -5,x
;        counter -> -4,x
;              i -> -2,x
;           temp -> 6,x
;          speed -> 2,x
_Inc_Dec_Speed::
	pshd
	pshx
	tfr s,x
	leas -12,sp
	.dbline -1
	.dbline 99
; /*
; 
; Inc_Dec_speed checks to see if e or d was pressed if it was it will decrease the speed by 1 or increase the speed by 1
; then it will pass the values into displaySpeed_temp and display it on the LCD board.
; */
; 
; 
; void Inc_Dec_Speed(int speed, int temp ){
	.dbline 100
; 	int speedholder=speed;
	movw 2,x,-7,x
	.dbline 101
; 	int i=0;
	ldd #0
	std -2,x
	.dbline 102
; 	int loop=0;
	ldd #0
	std -9,x
	.dbline 103
; 	char keypressed=0;
	clr -5,x
	.dbline 104
; 	int counter=1;
	ldd #1
	std -4,x
	.dbline 105
; 	SPI1CR1=0x00;
	clr 0xf0
	.dbline 106
; 	DDRP=0x0F;
	ldab #15
	stab 0x25a
	.dbline 107
; 	DDRH=0x00;
	clr 0x262
	.dbline 108
; 	displaySpeed_Temp(speedholder, temp);
	movw 6,x,0,sp
	ldd -7,x
	jsr _displaySpeed_Temp
	lbra L23
L22:
	.dbline 110
; 	while (loop==0)
; 	{
	.dbline 111
; 	PTM = 0x08;	  			   				
	ldab #8
	stab 0x250
	.dbline 112
; 	PTP=counter;
	ldd -4,x
	stab 0x258
	.dbline 113
; 	keypressed=PTH;
	; vol
	ldab 0x260
	stab -5,x
	.dbline 114
; 	PTM &= 0x00;
	ldd #0
	stab 0x250
	.dbline 115
; 	keypressed &= 0xF0;
	bclr -5,x,#0xf
	.dbline 117
; 
; 	printf("PTH= %x\n", PTH);
	; vol
	ldab 0x260
	clra
	std 0,sp
	ldd #L25
	jsr _printf
	.dbline 118
; printf("Keypressed= %x\n", keypressed);
	ldab -5,x
	clra
	std 0,sp
	ldd #L26
	jsr _printf
	.dbline 119
; printf("Counter= %x\n", counter);				   	
	movw -4,x,0,sp
	ldd #L27
	jsr _printf
	.dbline 120
; 	 if (keypressed==0x10 && counter==1)
	ldab -5,x
	cmpb #16
	bne L28
	ldd -4,x
	cpd #1
	bne L28
	.dbline 121
; 	{
	.dbline 122
; 	 	speedholder+=1;
	ldd -7,x
	addd #1
	std -7,x
	.dbline 123
; 	    displaySpeed_Temp(speedholder, temp);
	movw 6,x,0,sp
	ldd -7,x
	jsr _displaySpeed_Temp
	.dbline 125
; 	   
; 	 }
	bra L29
L28:
	.dbline 126
; 	else if (keypressed==0x80 && counter==1)
	ldab -5,x
	cmpb #128
	bne L30
	ldd -4,x
	cpd #1
	bne L30
	.dbline 127
; 	{
	.dbline 128
; 	    speedholder-=1;
	ldd -7,x
	subd #1
	std -7,x
	.dbline 129
; 	    displaySpeed_Temp(speedholder,  temp);
	movw 6,x,0,sp
	ldd -7,x
	jsr _displaySpeed_Temp
	.dbline 130
; 	}
L30:
L29:
	.dbline 131
	ldd #0
	std -2,x
L32:
	.dbline 131
L33:
	.dbline 131
; 	for ( i=0;i<10000;i++);
	ldd -2,x
	addd #1
	std -2,x
	.dbline 131
	ldd -2,x
	cpd #10000
	blt L32
	.dbline 133
; 	
; 	if(counter>=2)
	ldd -4,x
	cpd #2
	blt L36
	.dbline 134
; 	{
	.dbline 135
; 	counter=counter +2;
	ldd -4,x
	addd #2
	std -4,x
	.dbline 136
; 	}
	bra L37
L36:
	.dbline 138
; 	else
; 	{
	.dbline 139
; 	counter++;
	ldd -4,x
	addd #1
	std -4,x
	.dbline 140
; 	}
L37:
	.dbline 141
; 	if (counter==6)
	ldd -4,x
	cpd #6
	bne L38
	.dbline 142
; 	{
	.dbline 143
; 	counter=counter+2;
	ldd -4,x
	addd #2
	std -4,x
	.dbline 144
; 	}
L38:
	.dbline 145
; 	if (counter>8)
	ldd -4,x
	cpd #8
	ble L40
	.dbline 146
; 	{
	.dbline 147
; 	counter=1;
	ldd #1
	std -4,x
	.dbline 148
; 	}
L40:
	.dbline 149
L23:
	.dbline 109
	ldd -9,x
	lbeq L22
	.dbline -2
	.dbline 150
; 	}
; }
L21:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l loop -9 I
	.dbsym l speedholder -7 I
	.dbsym l keypressed -5 c
	.dbsym l counter -4 I
	.dbsym l i -2 I
	.dbsym l temp 6 I
	.dbsym l speed 2 I
	.dbend
L27:
	.byte 'C,'o,'u,'n,'t,'e,'r,61,32,37,'x,10,0
L26:
	.byte 'K,'e,'y,'p,'r,'e,'s,'s,'e,'d,61,32,37,'x,10,0
L25:
	.byte 'P,'T,'H,61,32,37,'x,10,0
