	.module assign54.C
	.include'basicLCD.s'

	.area data
_changingSpeed::
	.blkb 2
	.area idata
	.word 123
	.area data
	.dbfile assign54.C
	.dbsym e changingSpeed _changingSpeed I
_changingTemp::
	.blkb 2
	.area idata
	.word 23
	.area data
	.dbfile assign54.C
	.dbsym e changingTemp _changingTemp I
	.area text
	.dbfile assign54.C
	.dbfunc e main _main fV
;          ?temp -> -2,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 14
; /*
; Authors Gavez Smith 100857991, Fady Ibrahim 100876906
; */
; #include "hcs12dp256.h"
; #include"stdio.h"
; asm(".include'basicLCD.s'");
; #pragma interrupt_handler printKeysPressed()
; void printKeysPressed();
; void Inc_Dec_Speed(int speed, int temp );
; void displaySpeed_Temp(int speed, int temp);
; int changingSpeed=123;
; int changingTemp=23;
; 
; void main(){
	.dbline 16
; 
; 	 Lcd2PP_Init();
	jsr _Lcd2PP_Init
	.dbline 17
; 	 displaySpeed_Temp(++changingSpeed, changingTemp);
	movw _changingTemp,0,sp
	ldd _changingSpeed
	addd #1
	std -2,x
	movw -2,x,_changingSpeed
	ldd -2,x
	jsr _displaySpeed_Temp
	.dbline 18
; 	 DDRP |= 0x0F; // bitset PP0-3 as outputs (rows) 
	bset 0x25a,#15
	.dbline 19
; 	 DDRH &= 0x0F; // bitclear PH4..7 as inputs (columns)
	bclr 0x262,#0xf0
	.dbline 20
; 	 PTP = 0x0F; // Set scan row(s)
	ldab #15
	stab 0x258
	.dbline 21
; 	 PIFH = 0xFF; // Clear previous interrupt flags
	ldab #255
	stab 0x267
	.dbline 22
; 	 PPSH = 0xF0; // Rising Edge
	ldab #240
	stab 0x265
	.dbline 23
; 	 PERH = 0x00; // Disable pulldowns
	clr 0x264
	.dbline 24
; 	 PIEH |= 0xF0; // Local enable on columns inputs
	bset 0x266,#240
	.dbline 26
; 	 // enable the latch.
; 	 PTM |= 0x08;
	bset 0x250,#8
	.dbline 29
; 	 //
; 	 
; 	 asm("cli");
		cli

L4:
	.dbline 31
	.dbline 31
L5:
	.dbline 31
	bra L4
X0:
	.dbline 31
; 	 
; 	 while(1){};
	.dbline -2
	.dbline 33
; 	 
; }
L3:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e printKeysPressed _printKeysPressed fV
;          ?temp -> -8,x
;          ?temp -> -8,x
;          ?temp -> -6,x
;          count -> -4,x
;              i -> -2,x
_printKeysPressed::
	pshx
	tfr s,x
	leas -10,sp
	.dbline -1
	.dbline 41
; 
; 
; 
; /*
; printKeysPressed gets the character pressed on the keyboard by pulling and then it prints out the value on the terminal.
; 
; */
; void printKeysPressed(){   
	.dbline 43
; 	int i, count;
; 	asm("sei");
		sei

	.dbline 45
; 
; 	for (count=1; count<=0x08; count<<=1)
	ldd #1
	std -4,x
L8:
	.dbline 46
; 	{
	.dbline 47
; 		PTH&=0x0F;
	bclr 0x260,#0xf0
	.dbline 48
; 		PTP = (PTP&0xF0) | count;
	; vol
	ldab 0x258
	clra
	anda #0
	andb #240
	ora -4,x
	orb -3,x
	stab 0x258
	.dbline 50
	ldd #0
	std -2,x
L12:
	.dbline 50
L13:
	.dbline 50
; 		
; 		for (i=0;i<1000;i++);
	ldd -2,x
	addd #1
	std -2,x
	.dbline 50
	ldd -2,x
	cpd #1000
	blt L12
	.dbline 51
; 		switch(PTH & 0xF0){
	; vol
	ldab 0x260
	clra
	anda #0
	andb #240
	std -6,x
	cpd #32
	lbeq L32
	ldd -6,x
	cpd #32
	bgt L72
L71:
	ldd -6,x
	cpd #16
	beq L19
	lbra L16
L72:
	ldd -6,x
	cpd #64
	lbeq L45
	ldd -6,x
	cpd #64
	lblt L16
L73:
	ldd -6,x
	cpd #128
	lbeq L58
	lbra L16
X1:
	.dbline 51
L19:
	.dbline 53
; 		     case 0x10:
; 			 	  if(PTP & 0x01) printf("1");
	brclr 0x258,#1,L20
	.dbline 53
	ldd #L22
	jsr _printf
	lbra L17
L20:
	.dbline 54
; 				  else if(PTP & 0x02) printf("4");
	brclr 0x258,#2,L23
	.dbline 54
	ldd #L25
	jsr _printf
	lbra L17
L23:
	.dbline 55
; 				  else if(PTP & 0x04) printf("7");
	brclr 0x258,#4,L26
	.dbline 55
	ldd #L28
	jsr _printf
	lbra L17
L26:
	.dbline 56
; 				  else if(PTP & 0x08){ 
	brclr 0x258,#8,X2
	bra X3
X2:	lbra L17
X3:
	.dbline 56
	.dbline 57
; 				      printf("E");
	ldd #L31
	jsr _printf
	.dbline 58
; 					  displaySpeed_Temp(++changingSpeed, changingTemp);
	movw _changingTemp,0,sp
	ldd _changingSpeed
	addd #1
	std -8,x
	movw -8,x,_changingSpeed
	ldd -8,x
	jsr _displaySpeed_Temp
	.dbline 59
; 			      }
	.dbline 60
; 			 break;
	lbra L17
L32:
	.dbline 63
; 
; 		     case 0x20:
; 			      if(PTP & 0x01) printf("2");
	brclr 0x258,#1,L33
	.dbline 63
	ldd #L35
	jsr _printf
	lbra L17
L33:
	.dbline 64
; 				  else if(PTP & 0x02) printf("5");
	brclr 0x258,#2,L36
	.dbline 64
	ldd #L38
	jsr _printf
	lbra L17
L36:
	.dbline 65
; 				  else if(PTP & 0x04) printf("8");
	brclr 0x258,#4,L39
	.dbline 65
	ldd #L41
	jsr _printf
	lbra L17
L39:
	.dbline 66
; 				  else if(PTP & 0x08){
	brclr 0x258,#8,X4
	bra X5
X4:	lbra L17
X5:
	.dbline 66
	.dbline 67
; 				      printf("0");
	ldd #L44
	jsr _printf
	.dbline 68
; 					  asm("swi");
		swi

	.dbline 69
; 				  }
	.dbline 70
; 			 break;
	lbra L17
L45:
	.dbline 73
; 		     
; 		     case 0x40:
; 			      if(PTP & 0x01) printf("3");
	brclr 0x258,#1,L46
	.dbline 73
	ldd #L48
	jsr _printf
	bra L17
L46:
	.dbline 74
; 				  else if(PTP & 0x02) printf("6");
	brclr 0x258,#2,L49
	.dbline 74
	ldd #L51
	jsr _printf
	bra L17
L49:
	.dbline 75
; 				  else if(PTP & 0x04) printf("9");
	brclr 0x258,#4,L52
	.dbline 75
	ldd #L54
	jsr _printf
	bra L17
L52:
	.dbline 76
; 				  else if(PTP & 0x08) printf("F");
	brclr 0x258,#8,L17
	.dbline 76
	ldd #L57
	jsr _printf
	.dbline 77
; 		     break;
	bra L17
L58:
	.dbline 80
; 			 
; 		     case 0x80:
; 			      if(PTP & 0x01) printf("A");
	brclr 0x258,#1,L59
	.dbline 80
	ldd #L61
	jsr _printf
	bra L17
L59:
	.dbline 81
; 				  else if(PTP & 0x02) printf("B");
	brclr 0x258,#2,L62
	.dbline 81
	ldd #L64
	jsr _printf
	bra L17
L62:
	.dbline 82
; 				  else if(PTP & 0x04) printf("C");
	brclr 0x258,#4,L65
	.dbline 82
	ldd #L67
	jsr _printf
	bra L17
L65:
	.dbline 83
; 				  else if(PTP & 0x08){
	brclr 0x258,#8,L17
	.dbline 83
	.dbline 84
; 				       printf("D");
	ldd #L70
	jsr _printf
	.dbline 85
; 					   displaySpeed_Temp(--changingSpeed, changingTemp);
	movw _changingTemp,0,sp
	ldd _changingSpeed
	subd #1
	std -8,x
	movw -8,x,_changingSpeed
	ldd -8,x
	jsr _displaySpeed_Temp
	.dbline 86
; 				  }
	.dbline 87
; 		     break; 
L16:
L17:
	.dbline 89
L9:
	.dbline 45
	ldd -4,x
	lsld
	std -4,x
	.dbline 45
	ldd -4,x
	cpd #8
	lble L8
	.dbline 92
; 		}
; 	 }
; 		
; 			 			
; 	PTP = 0x0F;
	ldab #15
	stab 0x258
	.dbline 93
; 	PIFH = PIFH; // Acknowledge (all) interrupts
	; vol
	ldab 0x267
	stab 0x267
	.dbline 94
;     asm("cli");
		cli

	.dbline -2
	.dbline 95
; }
L7:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbsym l count -4 I
	.dbsym l i -2 I
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
	.dbline 100
; /*
; DisplaySpeed_Temp displays the speed and temp passed in to the lcd display.
; */
; 
; void displaySpeed_Temp(int speed, int temp){	
	.dbline 102
; 	 int number;
; 	 int index=3;
	ldd #3
	std -2,x
	.dbline 105
; 	 int arraychars[4];
; 	 int arraycharstemp[2];
; 	 int remainder=0;
	ldd #0
	std -4,x
	.dbline 106
; 	 int holderSpeed=speed;
	ldy 2,x
	sty -10,x
	.dbline 107
; 	 int holderTemp=temp;
	movw 6,x,-8,x
	.dbline 108
;      LCD_instruction(1);
	ldd #1
	jsr _LCD_instruction
	.dbline 109
; 	 LCD_display('S');
	ldd #83
	jsr _LCD_display
	.dbline 110
; 	 LCD_display('P');
	ldd #80
	jsr _LCD_display
	.dbline 111
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 112
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 113
; 	 LCD_display('D');
	ldd #68
	jsr _LCD_display
	bra L76
L75:
	.dbline 115
; 	 while (index>=0)
; 	 {
	.dbline 116
; 	  	   if(holderSpeed!=0)
	ldd -10,x
	beq L78
	.dbline 117
; 	 {
	.dbline 119
; //takes the decimal value passed in and turns it into the decimal value representation in ASCII
; 	 remainder=holderSpeed%10;
	ldd -10,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	std -4,x
	.dbline 120
; 	 holderSpeed=holderSpeed/10;
	ldd -10,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	sty -10,x
	.dbline 121
; 	 remainder=remainder+0x30;
	ldd -4,x
	addd #48
	std -4,x
	.dbline 122
; 	 arraychars[index]=remainder;
	leay -18,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldd -4,x
	std 0,y
	.dbline 123
; 	 index=index-1;
	ldd -2,x
	subd #1
	std -2,x
	.dbline 124
; 	 }	 
	bra L79
L78:
	.dbline 126
; 	 else
; 	 {
	.dbline 127
; 	  	 	arraychars[index]=0x30;
	leay -18,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldd #48
	std 0,y
	.dbline 128
; 	  		index=index-1;
	ldd -2,x
	subd #1
	std -2,x
	.dbline 129
; 	 }
L79:
	.dbline 130
L76:
	.dbline 114
	ldd -2,x
	bge L75
	.dbline 131
; 	 }
; 	 LCD_display(' ');
	ldd #32
	jsr _LCD_display
	.dbline 132
; 	 for(index=0;index<4;index++)
	ldd #0
	std -2,x
L80:
	.dbline 133
	.dbline 134
	leay -18,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldy 0,y
	sty -6,x
	.dbline 135
	ldd -6,x
	jsr _LCD_display
	.dbline 136
L81:
	.dbline 132
	ldd -2,x
	addd #1
	std -2,x
	.dbline 132
	ldd -2,x
	cpd #4
	blt L80
	.dbline 138
; 	 {
; 	 	number=arraychars[index];
; 		LCD_display(number);
; 	 }
; 	 
; 	 index=1;
	ldd #1
	std -2,x
	.dbline 140
; 	 //goes to the next line.
; 	 LCD_instruction(0xC0);	
	ldd #192
	jsr _LCD_instruction
	.dbline 141
; 	 LCD_display('T');
	ldd #84
	jsr _LCD_display
	.dbline 142
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 143
; 	 LCD_display('M');
	ldd #77
	jsr _LCD_display
	.dbline 144
; 	 LCD_display('P');
	ldd #80
	jsr _LCD_display
	.dbline 145
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 146
; 	 LCD_display('R');
	ldd #82
	jsr _LCD_display
	.dbline 147
; 	 LCD_display('A');
	ldd #65
	jsr _LCD_display
	.dbline 148
; 	 LCD_display('T');
	ldd #84
	jsr _LCD_display
	.dbline 149
; 	 LCD_display('U');
	ldd #85
	jsr _LCD_display
	.dbline 150
; 	 LCD_display('R');
	ldd #82
	jsr _LCD_display
	.dbline 151
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	bra L85
L84:
	.dbline 154
	.dbline 155
	ldd -8,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	std -4,x
	.dbline 156
	ldd -8,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	sty -8,x
	.dbline 157
	ldd -4,x
	addd #48
	std -4,x
	.dbline 158
	leay -22,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldd -4,x
	std 0,y
	.dbline 159
	ldd -2,x
	subd #1
	std -2,x
	.dbline 160
L85:
	.dbline 153
; 
; 	 while (index>=0)
	ldd -2,x
	bge L84
	.dbline 161
; 	 {
; 	  	   remainder=holderTemp%10;
;      	   holderTemp=holderTemp/10;
; 	 	   remainder=remainder+0x30;
; 	 	   arraycharstemp[index]=remainder;
; 	 	   index=index-1;
; 	 } 
; 	 LCD_display(' ');
	ldd #32
	jsr _LCD_display
	.dbline 162
; 	 for(index=0;index<2;index++)
	ldd #0
	std -2,x
L87:
	.dbline 163
	.dbline 164
	leay -22,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldy 0,y
	sty -6,x
	.dbline 166
	ldd -6,x
	jsr _LCD_display
	.dbline 167
L88:
	.dbline 162
	ldd -2,x
	addd #1
	std -2,x
	.dbline 162
	ldd -2,x
	cpd #2
	blt L87
	.dbline 169
; 	 {
; 	 	number=arraycharstemp[index];
; 
; 	 	LCD_display(number);
; 	 }
; 	 
; 	 LCD_display('C');
	ldd #67
	jsr _LCD_display
	.dbline -2
	.dbline 170
; }
L74:
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
L70:
	.byte 'D,0
L67:
	.byte 'C,0
L64:
	.byte 'B,0
L61:
	.byte 'A,0
L57:
	.byte 'F,0
L54:
	.byte 57,0
L51:
	.byte 54,0
L48:
	.byte 51,0
L44:
	.byte 48,0
L41:
	.byte 56,0
L38:
	.byte 53,0
L35:
	.byte 50,0
L31:
	.byte 'E,0
L28:
	.byte 55,0
L25:
	.byte 52,0
L22:
	.byte 49,0
