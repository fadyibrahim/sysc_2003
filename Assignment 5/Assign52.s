	.module Assign52.c
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
	.word _printKeysPressed
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word _pacA_isr
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
	.dbfile M:\Assign51/vectors_dps256_NoICE.c
	.dbsym e interrupt_vectors _interrupt_vectors A[116:58]pfV
	.area data
	.dbfile M:\Assign51/vectors_dps256_NoICE.c
_changingSpeed::
	.blkb 2
	.area idata
	.word 9
	.area data
	.dbfile M:\Assign51/vectors_dps256_NoICE.c
	.dbfile M:\Assign51\Assign52.c
	.dbsym e changingSpeed _changingSpeed I
_changingTemp::
	.blkb 2
	.area idata
	.word 25
	.area data
	.dbfile M:\Assign51\Assign52.c
	.dbsym e changingTemp _changingTemp I
_counterInterrupt::
	.blkb 2
	.area idata
	.word 1
	.area data
	.dbfile M:\Assign51\Assign52.c
	.dbsym e counterInterrupt _counterInterrupt I
_optCount::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\Assign51\Assign52.c
	.dbsym e optCount _optCount I
	.area text
	.dbfile M:\Assign51\Assign52.c
	.dbfunc e main _main fV
;          ?temp -> -2,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 19
; /*
; Authors Gavez Smith 100857991, Fady Ibrahim 100876906
; */
; #include "hcs12dp256.h"
; #include"stdio.h"
; #include "vectors_dps256_NoICE.c"
; 
; void CollisionDetect(void);
; void Inc_Dec_Speed(int speed, int temp );
; void displaySpeed_Temp(int speed, int temp);
; int changingSpeed=9;
; int changingTemp=25;
; int counterInterrupt=1;
; int optCount = 0;
; int duty, i;
; #pragma interrupt_handler printKeysPressed()
; #pragma interrupt_handler CollisionDetect()
; #pragma interrupt_handler pacA_isr()
; void main(){
	.dbline 22
; 	 
; 	 
; 	 Lcd2PP_Init();
	jsr _Lcd2PP_Init
	.dbline 23
; 	 displaySpeed_Temp(++changingSpeed, changingTemp);
	movw _changingTemp,0,sp
	ldd _changingSpeed
	addd #1
	std -2,x
	movw -2,x,_changingSpeed
	ldd -2,x
	jsr _displaySpeed_Temp
	.dbline 24
; 	 DDRP |= 0x0F; // bitset PP0-3 as outputs (rows) 
	bset 0x25a,#15
	.dbline 25
; 	 DDRH &= 0x0F; // bitclear PH4..7 as inputs (columns)
	bclr 0x262,#0xf0
	.dbline 26
; 	 PTP = 0x0F; // Set scan row(s)
	ldab #15
	stab 0x258
	.dbline 27
; 	 PIFH = 0xFF; // Clear previous interrupt flags
	ldab #255
	stab 0x267
	.dbline 28
; 	 PPSH = 0xF0; // Rising Edge
	ldab #240
	stab 0x265
	.dbline 29
; 	 PERH = 0x00; // Disable pulldowns
	clr 0x264
	.dbline 30
; 	 PIEH |= 0xF0; // Local enable on columns inputs
	bset 0x266,#240
	.dbline 34
; 	 // enable the latch.
; 	 //PTM |= 0x08;
; 	 //
; 	 duty = 20; 
	ldd #20
	std _duty
	.dbline 35
; 	 PWMDTY7 = duty;
	ldd _duty
	stab 0xc3
	.dbline 37
; 	
;      PWMPOL = 0xFF; // Initial Polarity is high
	ldab #255
	stab 0xa1
	.dbline 38
;      PWMCLK &= 0x7F; //Select Clock B for channel 7
	bclr 0xa2,#0x80
	.dbline 39
;      PWMPRCLK = 0x70; //Prescale ClockB : busclock/128
	ldab #112
	stab 0xa3
	.dbline 40
;      PWMCAE &= 0x7F; //Channel 7 : left aligned
	bclr 0xa4,#0x80
	.dbline 41
;      PWMCTL &= 0xF3; //PWM in Wait and Freeze Modes
	bclr 0xa5,#0xc
	.dbline 42
;      PWMPER7 = 100; //Set period for PWM7
	ldab #100
	stab 0xbb
	.dbline 43
;      PWME = 0x80; //Enable PWM Channel 7
	ldab #128
	stab 0xa0
	.dbline 44
;      DDRP |= 0x40; //For Motor Direction Control 
	bset 0x25a,#64
	.dbline 45
;      PAFLG |= 1; //Clear out the interrupt flag
	bset 0x61,#1
	.dbline 46
;      PACTL = 0x51; //Enable PACA for Optical Sensor
	ldab #81
	stab 0x60
	.dbline 48
; 	 
; 	 CRGINT |= 0x80; //Enables timer interrupts
	bset 0x38,#128
	.dbline 49
; 	 RTICTL |= 0x72; //Sets the prescale factor
	bset 0x3b,#114
	.dbline 50
; 	 asm("cli");
		cli

L4:
	.dbline 52
	.dbline 52
L5:
	.dbline 52
	bra L4
X0:
	.dbline 52
; 	 
; 	 while(1){};
	.dbline -2
	.dbline 54
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
	.dbline 60
; 
; /*
; printKeysPressed gets the character pressed on the keyboard by through the keyboard ISR and then it prints out the value on the terminal.
; 
; */
; void printKeysPressed(){   
	.dbline 62
; 	int i, count;
; 	asm("sei");
		sei

	.dbline 64
; 
; 	for (count=1; count<=0x08; count<<=1)
	ldd #1
	std -4,x
L8:
	.dbline 65
; 	{
	.dbline 66
; 		PTH&=0x0F;
	bclr 0x260,#0xf0
	.dbline 67
; 		PTP = (PTP&0xF0) | count;
	; vol
	ldab 0x258
	clra
	anda #0
	andb #240
	ora -4,x
	orb -3,x
	stab 0x258
	.dbline 69
	ldd #0
	std -2,x
L12:
	.dbline 69
L13:
	.dbline 69
; 		
; 		for (i=0;i<1000;i++);
	ldd -2,x
	addd #1
	std -2,x
	.dbline 69
	ldd -2,x
	cpd #1000
	blt L12
	.dbline 70
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
	bgt L74
L73:
	ldd -6,x
	cpd #16
	beq L19
	lbra L16
L74:
	ldd -6,x
	cpd #64
	lbeq L45
	ldd -6,x
	cpd #64
	lblt L16
L75:
	ldd -6,x
	cpd #128
	lbeq L58
	lbra L16
X1:
	.dbline 70
L19:
	.dbline 72
; 		     case 0x10:
; 			 	  if(PTP & 0x01) printf("1");
	brclr 0x258,#1,L20
	.dbline 72
	ldd #L22
	jsr _printf
	lbra L17
L20:
	.dbline 73
; 				  else if(PTP & 0x02) printf("4");
	brclr 0x258,#2,L23
	.dbline 73
	ldd #L25
	jsr _printf
	lbra L17
L23:
	.dbline 74
; 				  else if(PTP & 0x04) printf("7");
	brclr 0x258,#4,L26
	.dbline 74
	ldd #L28
	jsr _printf
	lbra L17
L26:
	.dbline 75
; 				  else if(PTP & 0x08){ 
	brclr 0x258,#8,X2
	bra X3
X2:	lbra L17
X3:
	.dbline 75
	.dbline 77
; 				       
; 					  duty++; 
	ldd _duty
	addd #1
	std _duty
	.dbline 78
; 	 				  PWMDTY7 = duty;
	ldd _duty
	stab 0xc3
	.dbline 80
; 					 
; 					  printf("E");
	ldd #L31
	jsr _printf
	.dbline 82
; 					 
; 					  displaySpeed_Temp(++changingSpeed, changingTemp);
	movw _changingTemp,0,sp
	ldd _changingSpeed
	addd #1
	std -8,x
	movw -8,x,_changingSpeed
	ldd -8,x
	jsr _displaySpeed_Temp
	.dbline 84
; 			      
; 				}  
	.dbline 85
; 			 break;
	lbra L17
L32:
	.dbline 88
; 
; 		     case 0x20:
; 			      if(PTP & 0x01) printf("2");
	brclr 0x258,#1,L33
	.dbline 88
	ldd #L35
	jsr _printf
	lbra L17
L33:
	.dbline 89
; 				  else if(PTP & 0x02) printf("5");
	brclr 0x258,#2,L36
	.dbline 89
	ldd #L38
	jsr _printf
	lbra L17
L36:
	.dbline 90
; 				  else if(PTP & 0x04) printf("8");
	brclr 0x258,#4,L39
	.dbline 90
	ldd #L41
	jsr _printf
	lbra L17
L39:
	.dbline 91
; 				  else if(PTP & 0x08){
	brclr 0x258,#8,X4
	bra X5
X4:	lbra L17
X5:
	.dbline 91
	.dbline 92
; 				      printf("0");
	ldd #L44
	jsr _printf
	.dbline 94
; 					  
; 					  PWMDTY7=0;
	clr 0xc3
	.dbline 95
; 					  asm("swi");
		swi

	.dbline 96
; 				  }
	.dbline 97
; 			 break;
	lbra L17
L45:
	.dbline 100
; 		     
; 		     case 0x40:
; 			      if(PTP & 0x01) printf("3");
	brclr 0x258,#1,L46
	.dbline 100
	ldd #L48
	jsr _printf
	lbra L17
L46:
	.dbline 101
; 				  else if(PTP & 0x02) printf("6");
	brclr 0x258,#2,L49
	.dbline 101
	ldd #L51
	jsr _printf
	lbra L17
L49:
	.dbline 102
; 				  else if(PTP & 0x04) printf("9");
	brclr 0x258,#4,L52
	.dbline 102
	ldd #L54
	jsr _printf
	bra L17
L52:
	.dbline 103
; 				  else if(PTP & 0x08) printf("F");
	brclr 0x258,#8,L17
	.dbline 103
	ldd #L57
	jsr _printf
	.dbline 104
; 		     break;
	bra L17
L58:
	.dbline 107
; 			 
; 		     case 0x80:
; 			      if(PTP & 0x01) printf("A");
	brclr 0x258,#1,L59
	.dbline 107
	ldd #L61
	jsr _printf
	bra L17
L59:
	.dbline 108
; 				  else if(PTP & 0x02) printf("B");
	brclr 0x258,#2,L62
	.dbline 108
	ldd #L64
	jsr _printf
	bra L17
L62:
	.dbline 109
; 				  else if(PTP & 0x04) printf("C");
	brclr 0x258,#4,L65
	.dbline 109
	ldd #L67
	jsr _printf
	bra L17
L65:
	.dbline 110
; 				  else if(PTP & 0x08){
	brclr 0x258,#8,L17
	.dbline 110
	.dbline 111
; 				       printf("D");
	ldd #L70
	jsr _printf
	.dbline 112
; 					   if (optCount>0) {
	ldd _optCount
	ble L71
	.dbline 112
	.dbline 113
; 					  duty--; 
	ldd _duty
	subd #1
	std _duty
	.dbline 114
; 	 				  PWMDTY7 = duty;
	ldd _duty
	stab 0xc3
	.dbline 115
; 					  }
L71:
	.dbline 116
; 					   displaySpeed_Temp(--changingSpeed, changingTemp);
	movw _changingTemp,0,sp
	ldd _changingSpeed
	subd #1
	std -8,x
	movw -8,x,_changingSpeed
	ldd -8,x
	jsr _displaySpeed_Temp
	.dbline 117
; 				  }
	.dbline 118
; 		     break; 
L16:
L17:
	.dbline 120
L9:
	.dbline 64
	ldd -4,x
	lsld
	std -4,x
	.dbline 64
	ldd -4,x
	cpd #8
	lble L8
	.dbline 123
; 		}
; 	 }
; 		
; 			 			
; 	PTP = 0x0F;
	ldab #15
	stab 0x258
	.dbline 124
; 	PIFH = PIFH; // Acknowledge (all) interrupts
	; vol
	ldab 0x267
	stab 0x267
	.dbline 125
;     asm("cli");
		cli

	.dbline -2
	.dbline 126
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
	.dbline 131
; /*
; DisplaySpeed_Temp displays the speed and temp passed in to the lcd display.
; */
; 
; void displaySpeed_Temp(int speed, int temp){	
	.dbline 133
; 	 int number;
; 	 int index=3;
	ldd #3
	std -2,x
	.dbline 136
; 	 int arraychars[4];
; 	 int arraycharstemp[2];
; 	 int remainder=0;
	ldd #0
	std -4,x
	.dbline 137
; 	 int holderSpeed=speed;
	ldy 2,x
	sty -10,x
	.dbline 138
; 	 int holderTemp=temp;
	movw 6,x,-8,x
	.dbline 141
;      
; 	 
; 	 LCD_instruction(1);
	ldd #1
	jsr _LCD_instruction
	.dbline 142
; 	 LCD_display('S');
	ldd #83
	jsr _LCD_display
	.dbline 143
; 	 LCD_display('P');
	ldd #80
	jsr _LCD_display
	.dbline 144
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 145
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 146
; 	 LCD_display('D');
	ldd #68
	jsr _LCD_display
	bra L78
L77:
	.dbline 148
; 	 while (index>=0)
; 	 {
	.dbline 149
; 	  	   if(holderSpeed!=0)
	ldd -10,x
	beq L80
	.dbline 150
; 	 {
	.dbline 152
;      //takes the decimal value passed in and turns it into the decimal value representation in ASCII
; 	 remainder=holderSpeed%10;
	ldd -10,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	std -4,x
	.dbline 153
; 	 holderSpeed=holderSpeed/10;
	ldd -10,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	sty -10,x
	.dbline 154
; 	 remainder=remainder+0x30;
	ldd -4,x
	addd #48
	std -4,x
	.dbline 155
; 	 arraychars[index]=remainder;
	leay -18,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldd -4,x
	std 0,y
	.dbline 156
; 	 index=index-1;
	ldd -2,x
	subd #1
	std -2,x
	.dbline 157
; 	 }	 
	bra L81
L80:
	.dbline 159
; 	 else
; 	 {
	.dbline 160
; 	  	 	arraychars[index]=0x30;
	leay -18,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldd #48
	std 0,y
	.dbline 161
; 	  		index=index-1;
	ldd -2,x
	subd #1
	std -2,x
	.dbline 162
; 	 }
L81:
	.dbline 163
L78:
	.dbline 147
	ldd -2,x
	bge L77
	.dbline 164
; 	 }
; 	 LCD_display(' ');
	ldd #32
	jsr _LCD_display
	.dbline 165
; 	 for(index=0;index<4;index++)
	ldd #0
	std -2,x
L82:
	.dbline 166
	.dbline 167
	leay -18,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldy 0,y
	sty -6,x
	.dbline 168
	ldd -6,x
	jsr _LCD_display
	.dbline 169
L83:
	.dbline 165
	ldd -2,x
	addd #1
	std -2,x
	.dbline 165
	ldd -2,x
	cpd #4
	blt L82
	.dbline 171
; 	 {
; 	 	number=arraychars[index];
; 		LCD_display(number);
; 	 }
; 	 
; 	 index=1;
	ldd #1
	std -2,x
	.dbline 173
; 	 //goes to the next line.
; 	 LCD_instruction(0xC0);	
	ldd #192
	jsr _LCD_instruction
	.dbline 174
; 	 LCD_display('T');
	ldd #84
	jsr _LCD_display
	.dbline 175
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 176
; 	 LCD_display('M');
	ldd #77
	jsr _LCD_display
	.dbline 177
; 	 LCD_display('P');
	ldd #80
	jsr _LCD_display
	.dbline 178
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	.dbline 179
; 	 LCD_display('R');
	ldd #82
	jsr _LCD_display
	.dbline 180
; 	 LCD_display('A');
	ldd #65
	jsr _LCD_display
	.dbline 181
; 	 LCD_display('T');
	ldd #84
	jsr _LCD_display
	.dbline 182
; 	 LCD_display('U');
	ldd #85
	jsr _LCD_display
	.dbline 183
; 	 LCD_display('R');
	ldd #82
	jsr _LCD_display
	.dbline 184
; 	 LCD_display('E');
	ldd #69
	jsr _LCD_display
	bra L87
L86:
	.dbline 187
	.dbline 188
	ldd -8,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	std -4,x
	.dbline 189
	ldd -8,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	sty -8,x
	.dbline 190
	ldd -4,x
	addd #48
	std -4,x
	.dbline 191
	leay -22,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldd -4,x
	std 0,y
	.dbline 192
	ldd -2,x
	subd #1
	std -2,x
	.dbline 193
L87:
	.dbline 186
; 
; 	 while (index>=0)
	ldd -2,x
	bge L86
	.dbline 194
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
	.dbline 195
; 	 for(index=0;index<2;index++)
	ldd #0
	std -2,x
L89:
	.dbline 196
	.dbline 197
	leay -22,x
	sty -24,x
	ldd -2,x
	lsld
	addd -24,x
	xgdy
	ldy 0,y
	sty -6,x
	.dbline 199
	ldd -6,x
	jsr _LCD_display
	.dbline 200
L90:
	.dbline 195
	ldd -2,x
	addd #1
	std -2,x
	.dbline 195
	ldd -2,x
	cpd #2
	blt L89
	.dbline 202
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
	.dbline 203
; }
L76:
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
	.dbfunc e CollisionDetect _CollisionDetect fV
_CollisionDetect::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 210
; 
; /*
; This function is the Real-Time ISR and interruts the program when the user presses 5 on the keyboard. It executes the
; interrupt turns off the dc motor waits 3-4 second and turns the steppor motor then afterwards it turns on the dc motor again.
; */
;  void CollisionDetect(void)
; {
	.dbline 211
;  	 asm("sei");
		sei

	.dbline 213
; 
;      counterInterrupt++;
	ldd _counterInterrupt
	addd #1
	std _counterInterrupt
	.dbline 215
; 	 //printf("counterInterrupt = %d\n", counterInterrupt);
; 	 if (counterInterrupt==4) {
	ldd _counterInterrupt
	cpd #4
	bne L94
	.dbline 215
	.dbline 216
; 	      printf(" the RPS is \t%d",optCount);
	movw _optCount,0,sp
	ldd #L96
	jsr _printf
	.dbline 217
; 		  counterInterrupt=0;
	ldd #0
	std _counterInterrupt
	.dbline 218
; 		  optCount =0;
	ldd #0
	std _optCount
	.dbline 219
; 	 }
L94:
	.dbline 221
; 	 
; 	 CRGFLG = 0x80; //clear the RTI flag
	ldab #128
	stab 0x37
	.dbline 222
; 	 asm("cli");
		cli

	.dbline -2
	.dbline 223
; }
L93:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbend
	.dbfunc e pacA_isr _pacA_isr fV
_pacA_isr::
	.dbline -1
	.dbline 225
; 
; void pacA_isr(void) {
	.dbline 227
; 	//printf("MOTOR WORKS");
; 	INTR_OFF();
		sei

	.dbline 228
;     optCount++;
	ldd _optCount
	addd #1
	std _optCount
	.dbline 229
;     PAFLG |= 1;
	bset 0x61,#1
	.dbline 230
;     INTR_ON();
		cli

	.dbline -2
	.dbline 231
; }
L97:
	.dbline 0 ; func end
	rti
	.dbend
	.area bss
	.dbfile M:\Assign51\Assign52.c
_i::
	.blkb 2
	.dbsym e i _i I
_duty::
	.blkb 2
	.dbsym e duty _duty I
	.area text
	.dbfile M:\Assign51\Assign52.c
L96:
	.byte 32,'t,'h,'e,32,'R,'P,'S,32,'i,'s,32,9,37,'d,0
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
