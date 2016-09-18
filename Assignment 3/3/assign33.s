	.module assign33.c
	.area text
	.dbfile M:\SYSC20~1\assign33.c
	.dbfunc e main _main fI
;    keysPressed -> -8,x
;      proximity -> -6,x
;    temperature -> -4,x
;          speed -> -3,x
;     boolResult -> -2,x
_main::
	pshx
	tfr s,x
	leas -14,sp
	.dbline -1
	.dbline 7
; #include <stdio.h>
; void printInBinaryByte(char ByteValue);
; void printInBinaryWord(unsigned int hexValue);
; int displaySystemStatus(char speed, char temperature, unsigned int proximity, unsigned int *keysPressed);
; 
;  int main(void)
; {
	.dbline 8
; char speed= 0x34;
	ldab #52
	stab -3,x
	.dbline 9
; char temperature=0x30;
	ldab #48
	stab -4,x
	.dbline 10
; unsigned int proximity=0x8890;
	ldd #0x8890
	std -6,x
	.dbline 11
; unsigned int keysPressed=1234;
	ldd #1234
	std -8,x
	.dbline 12
; int boolResult=0;
	ldd #0
	std -2,x
	.dbline 13
; printf("\n");
	ldd #L2
	jsr _printf
	.dbline 14
; boolResult=displaySystemStatus(speed,temperature,proximity,&keysPressed);
	leay -8,x
	sty 4,sp
	movw -6,x,2,sp
	ldab -4,x
	clra
	std 0,sp
	ldab -3,x
	clra
	jsr _displaySystemStatus
	std -2,x
	.dbline 15
; printf("\n");
	ldd #L2
	jsr _printf
	.dbline 16
; printf("%i\n",boolResult);
	movw -2,x,0,sp
	ldd #L3
	jsr _printf
	.dbline 17
; asm("SWI");
		SWI

	.dbline -2
	.dbline 18
; }
L1:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l keysPressed -8 i
	.dbsym l proximity -6 i
	.dbsym l temperature -4 c
	.dbsym l speed -3 c
	.dbsym l boolResult -2 I
	.dbend
	.dbfunc e displaySystemStatus _displaySystemStatus fI
;   objectDetect -> -4,x
;      direction -> -2,x
;    keysPressed -> 10,x
;      proximity -> 8,x
;    temperature -> 7,x
;          speed -> 3,x
_displaySystemStatus::
	pshd
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 22
; 
; 
; int displaySystemStatus(char speed, char temperature, unsigned int proximity, unsigned int *keysPressed)
; {
	.dbline 25
; unsigned int direction;
; unsigned int objectDetect;
; printf("Speed:  ");
	ldd #L5
	jsr _printf
	.dbline 26
; printInBinaryByte(speed);
	ldab 3,x
	clra
	jsr _printInBinaryByte
	.dbline 27
; printf("\n");
	ldd #L2
	jsr _printf
	.dbline 28
; printf("Temperature:  ");
	ldd #L6
	jsr _printf
	.dbline 29
; printInBinaryByte(temperature);
	ldab 7,x
	clra
	jsr _printInBinaryByte
	.dbline 30
; printf("\n");
	ldd #L2
	jsr _printf
	.dbline 31
; direction=proximity;
	movw 8,x,-2,x
	.dbline 32
; objectDetect=proximity;
	movw 8,x,-4,x
	.dbline 33
; objectDetect=objectDetect>>15;
	ldd -4,x
	ldy #15
	cpy #0
	beq X0
X1:
	lsrd
	dbne y,X1
X0:
	std -4,x
	.dbline 34
; if (objectDetect==1)
	ldd -4,x
	cpd #1
	bne L7
	.dbline 35
; 	{
	.dbline 36
; 		printf("Object detected!\n");
	ldd #L9
	jsr _printf
	.dbline 37
; 	}
	bra L8
L7:
	.dbline 39
; else
; 	{
	.dbline 40
; 	printf(" Noo bject detected!\n");
	ldd #L10
	jsr _printf
	.dbline 41
; 	}
L8:
	.dbline 42
; direction=direction &0x0007;
	bclr -1,x,#0xf8
	bclr -2,x,#0xff
	.dbline 43
; if (direction==0)
	ldd -2,x
	bne L11
	.dbline 44
; {
	.dbline 45
; 	printf("Direction North!");
	ldd #L13
	jsr _printf
	.dbline 46
; 	}
	bra L12
L11:
	.dbline 47
; else if (direction==1)
	ldd -2,x
	cpd #1
	bne L14
	.dbline 48
; {
	.dbline 49
; 	printf("Direction South!");
	ldd #L16
	jsr _printf
	.dbline 50
; 	}
	bra L15
L14:
	.dbline 51
; else if(direction==2)
	ldd -2,x
	cpd #2
	bne L17
	.dbline 52
; 	{
	.dbline 53
; 	printf("Direction East!");
	ldd #L19
	jsr _printf
	.dbline 54
; 	}
	bra L18
L17:
	.dbline 55
; else if(direction==3)
	ldd -2,x
	cpd #3
	bne L20
	.dbline 56
; 	{
	.dbline 57
; 	printf("Direction West!");
	ldd #L22
	jsr _printf
	.dbline 58
; 	}
	bra L21
L20:
	.dbline 59
; else if(direction==4)
	ldd -2,x
	cpd #4
	bne L23
	.dbline 60
; 	{
	.dbline 61
; 	printf("Direction NorthEast!");
	ldd #L25
	jsr _printf
	.dbline 62
; 	}
	bra L24
L23:
	.dbline 63
; else if(direction==5)
	ldd -2,x
	cpd #5
	bne L26
	.dbline 64
; 	{
	.dbline 65
; 	printf("Direction NorthWest!");
	ldd #L28
	jsr _printf
	.dbline 66
; 	}
	bra L27
L26:
	.dbline 67
; else if(direction==6)
	ldd -2,x
	cpd #6
	bne L29
	.dbline 68
; 	{
	.dbline 69
; 	printf("Direction SouthEast!");
	ldd #L31
	jsr _printf
	.dbline 70
; 	}
	bra L30
L29:
	.dbline 71
; else if(direction==7)
	ldd -2,x
	cpd #7
	bne L32
	.dbline 72
; 	{
	.dbline 73
; 	printf("Direction SouthWest!");
	ldd #L34
	jsr _printf
	.dbline 74
; 	}
L32:
L30:
L27:
L24:
L21:
L18:
L15:
L12:
	.dbline 75
; printf("\n");
	ldd #L2
	jsr _printf
	.dbline 76
; printf("keysPressed: ");
	ldd #L35
	jsr _printf
	.dbline 77
; printInBinaryWord(*keysPressed);
	ldd [10,x]
	jsr _printInBinaryWord
	.dbline 78
; return 1;
	ldd #1
	.dbline -2
L4:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l objectDetect -4 i
	.dbsym l direction -2 i
	.dbsym l keysPressed 10 pi
	.dbsym l proximity 8 i
	.dbsym l temperature 6 I
	.dbsym l temperature 7 c
	.dbsym l speed 2 I
	.dbsym l speed 3 c
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
	.dbline 82
; 
; }
; void printInBinaryWord(unsigned int hexValue)
; {	
	.dbline 83
; 	unsigned int andCounter=32768;
	ldd #0x8000
	std -2,x
	.dbline 84
; 	unsigned int constant=hexValue;
	movw 2,x,-8,x
	.dbline 85
; 	int temp=0;
	ldd #0
	std -4,x
	.dbline 86
; 	int loop=0;
	ldd #0
	std -6,x
	bra L38
L37:
	.dbline 88
; 	while (loop!=16)
; 	{
	.dbline 89
; 		temp=constant;
	ldd -8,x
	std -4,x
	.dbline 90
; 		temp=temp & andCounter;
	ldd -4,x
	anda -2,x
	andb -1,x
	std -4,x
	.dbline 91
; 		if(temp==andCounter)
	ldd -4,x
	cpd -2,x
	bne L40
	.dbline 92
; 		{
	.dbline 93
; 			printf("1");
	ldd #L42
	jsr _printf
	.dbline 94
; 		}
	bra L41
L40:
	.dbline 96
; 		else
; 		{
	.dbline 97
; 			printf("0");
	ldd #L43
	jsr _printf
	.dbline 98
; 			}
L41:
	.dbline 99
	ldd -6,x
	addd #1
	std -6,x
	.dbline 100
	ldd -2,x
	lsrd
	std -2,x
	.dbline 101
L38:
	.dbline 87
	ldd -6,x
	cpd #16
	bne L37
	.dbline -2
	.dbline 103
; 		loop++;
; 		andCounter=andCounter/2;
; 	}
; 
; }
L36:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l constant -8 i
	.dbsym l loop -6 I
	.dbsym l temp -4 I
	.dbsym l andCounter -2 i
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
	.dbline 105
; void printInBinaryByte(char ByteValue)
; {	
	.dbline 107
; 
; 	int andCounter=128;
	ldd #128
	std -2,x
	.dbline 108
; 	int constant=ByteValue;
	ldab 3,x
	clra
	std -8,x
	.dbline 109
; 	int temp=0;
	ldd #0
	std -4,x
	.dbline 110
; 	int loop=0;
	ldd #0
	std -6,x
	bra L46
L45:
	.dbline 112
; 	while (loop!=8)
; 	{
	.dbline 113
; 		temp=constant;
	movw -8,x,-4,x
	.dbline 114
; 		temp=temp & andCounter;
	ldd -4,x
	anda -2,x
	andb -1,x
	std -4,x
	.dbline 115
; 		if(temp==andCounter)
	ldd -4,x
	cpd -2,x
	bne L48
	.dbline 116
; 		{
	.dbline 117
; 			printf("1");
	ldd #L42
	jsr _printf
	.dbline 118
; 		}
	bra L49
L48:
	.dbline 120
; 		else
; 		{
	.dbline 121
; 			printf("0");
	ldd #L43
	jsr _printf
	.dbline 122
; 			}
L49:
	.dbline 123
	ldd -6,x
	addd #1
	std -6,x
	.dbline 124
	ldd -2,x
	ldy #2
	exg x,y
	idivs
	exg x,y
	sty -2,x
	.dbline 125
L46:
	.dbline 111
	ldd -6,x
	cpd #8
	bne L45
	.dbline -2
	.dbline 127
; 		loop++;
; 		andCounter=andCounter/2;
; 	}
; 
; }
L44:
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
L43:
	.byte 48,0
L42:
	.byte 49,0
L35:
	.byte 'k,'e,'y,'s,'P,'r,'e,'s,'s,'e,'d,58,32,0
L34:
	.byte 'D,'i,'r,'e,'c,'t,'i,'o,'n,32,'S,'o,'u,'t,'h,'W
	.byte 'e,'s,'t,33,0
L31:
	.byte 'D,'i,'r,'e,'c,'t,'i,'o,'n,32,'S,'o,'u,'t,'h,'E
	.byte 'a,'s,'t,33,0
L28:
	.byte 'D,'i,'r,'e,'c,'t,'i,'o,'n,32,'N,'o,'r,'t,'h,'W
	.byte 'e,'s,'t,33,0
L25:
	.byte 'D,'i,'r,'e,'c,'t,'i,'o,'n,32,'N,'o,'r,'t,'h,'E
	.byte 'a,'s,'t,33,0
L22:
	.byte 'D,'i,'r,'e,'c,'t,'i,'o,'n,32,'W,'e,'s,'t,33,0
L19:
	.byte 'D,'i,'r,'e,'c,'t,'i,'o,'n,32,'E,'a,'s,'t,33,0
L16:
	.byte 'D,'i,'r,'e,'c,'t,'i,'o,'n,32,'S,'o,'u,'t,'h,33
	.byte 0
L13:
	.byte 'D,'i,'r,'e,'c,'t,'i,'o,'n,32,'N,'o,'r,'t,'h,33
	.byte 0
L10:
	.byte 32,'N,'o,'o,32,'b,'j,'e,'c,'t,32,'d,'e,'t,'e,'c
	.byte 't,'e,'d,33,10,0
L9:
	.byte 'O,'b,'j,'e,'c,'t,32,'d,'e,'t,'e,'c,'t,'e,'d,33
	.byte 10,0
L6:
	.byte 'T,'e,'m,'p,'e,'r,'a,'t,'u,'r,'e,58,32,32,0
L5:
	.byte 'S,'p,'e,'e,'d,58,32,32,0
L3:
	.byte 37,'i,10,0
L2:
	.byte 10,0
