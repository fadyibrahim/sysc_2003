	.module _34.c
	.area text
	.dbfile 34.c
	.dbfunc e main _main fI
;     boolDetect -> -5,x
;      proximity -> -3,x
;          speed -> -1,x
_main::
	pshx
	tfr s,x
	leas -8,sp
	.dbline -1
	.dbline 6
; #include <stdio.h>
; int collision_detection (char *speed, unsigned int *proximity);
; void printInBinaryByte(char ByteValue);
; void printInBinaryWord(unsigned int hexValue);
; int main(void)
; {
	.dbline 7
; 	char speed=0x30;
	ldab #48
	stab -1,x
	.dbline 8
; 	unsigned int proximity=0x8330;
	ldd #0x8330
	std -3,x
	.dbline 10
; 	int boolDetect;
; 	printf("speed:  ");
	ldd #L2
	jsr _printf
	.dbline 11
; 	printInBinaryByte(speed);
	ldab -1,x
	clra
	jsr _printInBinaryByte
	.dbline 12
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 13
; 	printf("proximity:  ");
	ldd #L4
	jsr _printf
	.dbline 14
; 	printInBinaryWord(proximity);
	ldd -3,x
	jsr _printInBinaryWord
	.dbline 15
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 16
; 	boolDetect=collision_detection(&speed,&proximity);
	leay -3,x
	sty 0,sp
	leay -1,x
	xgdy
	jsr _collision_detection
	std -5,x
	.dbline 17
; 	printf("speed:  ");
	ldd #L2
	jsr _printf
	.dbline 18
; 	printInBinaryByte(speed);
	ldab -1,x
	clra
	jsr _printInBinaryByte
	.dbline 19
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 20
; 	printf("proximity:  ");
	ldd #L4
	jsr _printf
	.dbline 21
; 	printInBinaryWord(proximity);
	ldd -3,x
	jsr _printInBinaryWord
	.dbline 22
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 23
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 25
; 
; 	speed=0x30;
	ldab #48
	stab -1,x
	.dbline 26
; 	proximity=0x1320;
	ldd #4896
	std -3,x
	.dbline 27
; 	printf("speed:  ");
	ldd #L2
	jsr _printf
	.dbline 28
; 	printInBinaryByte(speed);
	ldab -1,x
	clra
	jsr _printInBinaryByte
	.dbline 29
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 30
; 	printf("proximity:  ");
	ldd #L4
	jsr _printf
	.dbline 31
; 	printInBinaryWord(proximity);
	ldd -3,x
	jsr _printInBinaryWord
	.dbline 32
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 33
; 	boolDetect=collision_detection(&speed,&proximity);
	leay -3,x
	sty 0,sp
	leay -1,x
	xgdy
	jsr _collision_detection
	std -5,x
	.dbline 34
; 	printf("speed:  ");
	ldd #L2
	jsr _printf
	.dbline 35
; 	printInBinaryByte(speed);
	ldab -1,x
	clra
	jsr _printInBinaryByte
	.dbline 36
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 37
; 	printf("proximity:  ");
	ldd #L4
	jsr _printf
	.dbline 38
; 	printInBinaryWord(proximity);
	ldd -3,x
	jsr _printInBinaryWord
	.dbline 39
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 40
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 42
; 
; 	speed=0x30;
	ldab #48
	stab -1,x
	.dbline 43
; 	proximity=0x8327;
	ldd #0x8327
	std -3,x
	.dbline 44
; 	printf("speed:  ");
	ldd #L2
	jsr _printf
	.dbline 45
; 	printInBinaryByte(speed);
	ldab -1,x
	clra
	jsr _printInBinaryByte
	.dbline 46
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 47
; 	printf("proximity:  ");
	ldd #L4
	jsr _printf
	.dbline 48
; 	printInBinaryWord(proximity);
	ldd -3,x
	jsr _printInBinaryWord
	.dbline 49
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 50
; 	boolDetect=collision_detection(&speed,&proximity);
	leay -3,x
	sty 0,sp
	leay -1,x
	xgdy
	jsr _collision_detection
	std -5,x
	.dbline 51
; 	printf("speed:  ");
	ldd #L2
	jsr _printf
	.dbline 52
; 	printInBinaryByte(speed);
	ldab -1,x
	clra
	jsr _printInBinaryByte
	.dbline 53
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 54
; 	printf("proximity:  ");
	ldd #L4
	jsr _printf
	.dbline 55
; 	printInBinaryWord(proximity);
	ldd -3,x
	jsr _printInBinaryWord
	.dbline 56
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 57
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 59
; 
; 	speed=0x30;
	ldab #48
	stab -1,x
	.dbline 60
; 	proximity=0x8323;
	ldd #0x8323
	std -3,x
	.dbline 61
; 	printf("speed:  ");
	ldd #L2
	jsr _printf
	.dbline 62
; 	printInBinaryByte(speed);
	ldab -1,x
	clra
	jsr _printInBinaryByte
	.dbline 63
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 64
; 	printf("proximity:  ");
	ldd #L4
	jsr _printf
	.dbline 65
; 	printInBinaryWord(proximity);
	ldd -3,x
	jsr _printInBinaryWord
	.dbline 66
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 67
; 	boolDetect=collision_detection(&speed,&proximity);
	leay -3,x
	sty 0,sp
	leay -1,x
	xgdy
	jsr _collision_detection
	std -5,x
	.dbline 68
; 	printf("speed:  ");
	ldd #L2
	jsr _printf
	.dbline 69
; 	printInBinaryByte(speed);
	ldab -1,x
	clra
	jsr _printInBinaryByte
	.dbline 70
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline 71
; 	printf("proximity:  ");
	ldd #L4
	jsr _printf
	.dbline 72
; 	printInBinaryWord(proximity);
	ldd -3,x
	jsr _printInBinaryWord
	.dbline 73
; 	printf("\n");
	ldd #L3
	jsr _printf
	.dbline -2
	.dbline 74
; }
L1:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l boolDetect -5 I
	.dbsym l proximity -3 i
	.dbsym l speed -1 c
	.dbend
	.dbfunc e collision_detection _collision_detection fI
;           prox -> -4,x
;   objectDetect -> -2,x
;      proximity -> 6,x
;          speed -> 2,x
_collision_detection::
	pshd
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 77
; 
; int collision_detection (char *speed, unsigned int *proximity)
; {
	.dbline 78
; 	unsigned int prox=*proximity;
	ldd [6,x]
	std -4,x
	.dbline 79
; 	unsigned int objectDetect=*proximity;
	ldd [6,x]
	std -2,x
	.dbline 80
; 	objectDetect=objectDetect>>15;
	ldd -2,x
	ldy #15
	cpy #0
	beq X0
X1:
	lsrd
	dbne y,X1
X0:
	std -2,x
	.dbline 81
; 	if(objectDetect==1)
	ldd -2,x
	cpd #1
	lbne L6
	.dbline 82
; 	{
	.dbline 83
; 		prox = prox & 0x0007;
	bclr -3,x,#0xf8
	bclr -4,x,#0xff
	.dbline 84
; 		if(prox==0 || prox==4)
	ldd -4,x
	beq L10
	ldd -4,x
	cpd #4
	bne L8
L10:
	.dbline 85
; 		{
	.dbline 86
; 			*proximity=*proximity | 0x0200;
	ldy 6,x
	pshy ; spill
	ldy 6,x
	puly ; reload
	bset 0,y,#0x2
	.dbline 87
; 			*proximity=*proximity & 0xFEFF;
	ldy 6,x
	pshy ; spill
	ldy 6,x
	puly ; reload
	bclr 0,y,#0x1
	.dbline 88
; 			return 1;
	ldd #1
	bra L5
L8:
	.dbline 90
; 		}
; 		else if(prox==2 || prox==7)
	ldd -4,x
	cpd #2
	beq L13
	ldd -4,x
	cpd #7
	bne L11
L13:
	.dbline 91
; 		{
	.dbline 92
; 			*proximity=*proximity | 0x0100;
	ldy 6,x
	pshy ; spill
	ldy 6,x
	puly ; reload
	bset 0,y,#0x1
	.dbline 93
; 			*proximity=*proximity & 0xFDFF;
	ldy 6,x
	pshy ; spill
	ldy 6,x
	puly ; reload
	bclr 0,y,#0x2
	.dbline 94
; 			return 1;
	ldd #1
	bra L5
L11:
	.dbline 96
; 		}
; 		else{
	.dbline 97
; 		*speed=*speed/8;
	ldy 2,x
	ldab 0,y
	clra
	ldy #8
	exg x,y
	idivs
	exg x,y
	xgdy
	ldy 2,x
	stab 0,y
	.dbline 99
; 
; 		return 1;
	ldd #1
	bra L5
L6:
	.dbline 103
; 		}
; 
; 	}
; 	else{
	.dbline 104
; 	*speed=*speed*2;
	ldy 2,x
	ldab 0,y
	clra
	lsld
	ldy 2,x
	stab 0,y
	.dbline 105
; 	return 0;
	ldd #0
	.dbline -2
L5:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l prox -4 i
	.dbsym l objectDetect -2 i
	.dbsym l proximity 6 pi
	.dbsym l speed 2 pc
	.dbend
	.dbfunc e printInBinaryWord _printInBinaryWord fV
;       constant -> -8,x
;           loop -> -6,x
;           temp -> -4,x
;     andCounter -> -2,x
;       hexValue -> 2,x
_printInBinaryWord::
	pshd
	pshx
	tfr s,x
	leas -8,sp
	.dbline -1
	.dbline 109
; 	}
; }
; void printInBinaryWord(unsigned int hexValue)
; {	
	.dbline 111
; 
; 	int andCounter=32768;
	ldd #0x8000
	std -2,x
	.dbline 112
; 	int constant=hexValue;
	ldd 2,x
	std -8,x
	.dbline 113
; 	int temp=0;
	ldd #0
	std -4,x
	.dbline 114
; 	int loop=0;
	ldd #0
	std -6,x
	bra L16
L15:
	.dbline 116
; 	while (loop!=16)
; 	{
	.dbline 117
; 		temp=constant;
	movw -8,x,-4,x
	.dbline 118
; 		temp=temp & andCounter;
	ldd -4,x
	anda -2,x
	andb -1,x
	std -4,x
	.dbline 119
; 		if(temp==andCounter)
	ldd -4,x
	cpd -2,x
	bne L18
	.dbline 120
; 		{
	.dbline 121
; 			printf("1");
	ldd #L20
	jsr _printf
	.dbline 122
; 		}
	bra L19
L18:
	.dbline 124
; 		else
; 		{
	.dbline 125
; 			printf("0");
	ldd #L21
	jsr _printf
	.dbline 126
; 			}
L19:
	.dbline 127
	ldd -6,x
	addd #1
	std -6,x
	.dbline 128
	ldd -2,x
	ldy #2
	exg x,y
	idivs
	exg x,y
	sty -2,x
	.dbline 129
L16:
	.dbline 115
	ldd -6,x
	cpd #16
	bne L15
	.dbline -2
	.dbline 131
; 		loop++;
; 		andCounter=andCounter/2;
; 	}
; 
; }
L14:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l constant -8 I
	.dbsym l loop -6 I
	.dbsym l temp -4 I
	.dbsym l andCounter -2 I
	.dbsym l hexValue 2 i
	.dbend
	.dbfunc e printInBinaryByte _printInBinaryByte fV
;       constant -> -8,x
;           loop -> -6,x
;           temp -> -4,x
;     andCounter -> -2,x
;      ByteValue -> 3,x
_printInBinaryByte::
	pshd
	pshx
	tfr s,x
	leas -8,sp
	.dbline -1
	.dbline 133
; void printInBinaryByte(char ByteValue)
; {	
	.dbline 135
; 
; 	int andCounter=128;
	ldd #128
	std -2,x
	.dbline 136
; 	int constant=ByteValue;
	ldab 3,x
	clra
	std -8,x
	.dbline 137
; 	int temp=0;
	ldd #0
	std -4,x
	.dbline 138
; 	int loop=0;
	ldd #0
	std -6,x
	bra L24
L23:
	.dbline 140
; 	while (loop!=8)
; 	{
	.dbline 141
; 		temp=constant;
	movw -8,x,-4,x
	.dbline 142
; 		temp=temp & andCounter;
	ldd -4,x
	anda -2,x
	andb -1,x
	std -4,x
	.dbline 143
; 		if(temp==andCounter)
	ldd -4,x
	cpd -2,x
	bne L26
	.dbline 144
; 		{
	.dbline 145
; 			printf("1");
	ldd #L20
	jsr _printf
	.dbline 146
; 		}
	bra L27
L26:
	.dbline 148
; 		else
; 		{
	.dbline 149
; 			printf("0");
	ldd #L21
	jsr _printf
	.dbline 150
; 			}
L27:
	.dbline 151
	ldd -6,x
	addd #1
	std -6,x
	.dbline 152
	ldd -2,x
	ldy #2
	exg x,y
	idivs
	exg x,y
	sty -2,x
	.dbline 153
L24:
	.dbline 139
	ldd -6,x
	cpd #8
	bne L23
	.dbline -2
	.dbline 155
; 		loop++;
; 		andCounter=andCounter/2;
; 	}
; 
; }
L22:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l constant -8 I
	.dbsym l loop -6 I
	.dbsym l temp -4 I
	.dbsym l andCounter -2 I
	.dbsym l ByteValue 2 I
	.dbsym l ByteValue 3 c
	.dbend
L21:
	.byte 48,0
L20:
	.byte 49,0
L4:
	.byte 'p,'r,'o,'x,'i,'m,'i,'t,'y,58,32,32,0
L3:
	.byte 10,0
L2:
	.byte 's,'p,'e,'e,'d,58,32,32,0
