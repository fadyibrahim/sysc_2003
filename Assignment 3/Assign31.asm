;**********************************************
;Fady Ibrahim
;100876906
;February 26 2013
;**********************************************

		ORG	$1000			;data area

;Strings to display obstacle and path.
msgObstacleY:		FCC	"Obstacle near by!"		;string: display message
TerminateString5 	DB      0
msgObstacleN:		FCC	"No obstacle near by!"		;string: display message
TerminateString6 	DB      0
msgNorth:		FCC	"  Direction North!  "		;string: display message
TerminateString7 	DB      0
msgSouth:		FCC	"  Direction South!  "		;string: display message
TerminateString8 	DB      0
msgEast:		FCC	"  Direction East!   "		;string: display message
TerminateString9 	DB      0
msgWest:		FCC	"  Direction West!   "		;string: display message
TerminateString10 	DB      0
msgNorthEast:		FCC	"  Direction NorthEast!   "		;string: display message
TerminateString11 	DB      0
msgNorthWest:		FCC	"  Direction NorthWest!   "		;string: display message
TerminateString12 	DB      0
msgSouthEast:		FCC	"  Direction SouthEast!   "		;string: display message
TerminateString13	DB      0
msgSouthWest:		FCC	"  Direction SouthWest!   "		;string: display message
TerminateString14 	DB      0


;offests to index into the stack
localspeed		equ	8
localTemperature	equ	9
localProximity		equ	10	
localKeys		equ	12

;a general counter used for to shift a byte or word data
counter:		rmb	1
copycounter1		db	7
copycounter2		db	15
Compare: 		db	00

;prints out the variable name then the binary value of that variable.
msgSpeed:		FCC	"Speed:"		;string: display message
speedStr:		ds.b	8
TerminateString1 	DB      0
msgTemp:		FCC	"Temperature:"		;string: display message
TemperatureStr:		ds.b	8
TerminateString2 	DB      0
msgProx:		FCC	"Proximity:"		;string: display message
TerminateString3 	DB      0		
msgKeys:		FCC	"KeysPresed:"		;string: display message
KeyPressedStr		ds.w	8
TerminateString4 	DB      0



;variables
Speed			rmb	1
Temperature		rmb	1
Proximity		rmw	1
KeyPressed		rmw	1
boolResult:		rmb	1

		ORG	$4000			;program area	 			
start:
			LDS	#$3DFF			;initialize stack pointer (details later)

			LDD	#BAUD19K		;program SCI0's baud rate
			JSR	setbaud

			;initialize the variables
			lDA	#$34
			STAA	Speed
			LDB	#18
			STAB	Temperature
			LDD	#%0010100010010111
			STD	Proximity
			LDX	#$EFFF
			STX	KeyPressed
			;store the variables on the stack
			LDX	#KeyPressed
			PSHX
			LDY	Proximity
			pshy
			lda	Temperature
			psha
			ldb	Speed
			pshb
			jsr 	displaySystemStatus ;call the subroutine displaySystemStatus
			pulb
			pula
			puly
			pulx
			BRA *
			
#include "DP256reg.asm"
#include "sci0api.asm"			
			

			
			

;**********************************************
;displaySystemStatus Routine
;prints variable names and their value
;**********************************************
displaySystemStatus:
			pshd	
			pshx
			pshy

SpeedDisp:
			;initializes counter and register y to be taken by Display
			ldb	#8
			stab	counter	;sets the variable
			ldb	copycounter1
			ldy	#speedstr
			ABY	
			ldb 	localspeed,sp	;index into the stack
			lda	#$00		;clears a
			jsr	Display
TempratureDisp		
			
			;initializes counter and register y to be taken by Display
			ldb	#8
			stab	counter
			ldb	copycounter1
			ldy	#Temperaturestr
			ABY	
			ldb 	localTemperature,sp
			lda	#$00
			jsr	Display
ProximityDisp:
			;check to see if there is first an object near by or not.
			LDY	#msgProx		;output Prox the message
			JSR	putStr_sc0

			BRSET	localProximity,sp,$80,Collision ;branches if the msb is set to 1 else branch to no collision
			BRA	NoCollision

Collision:		
			
			LDY	#msgObstacleY		;output ObstacleY the message
			JSR	putStr_sc0
			BRA	Direction

			
NoCollision:
			LDY	#msgObstacleN		;output ObstacleN the message
			JSR	putStr_sc0			

Direction:
			;check to see what is in the first three bits in the LSB then branches to the appropriate location		
			ldb	localProximity+1,sp
			ANDB	#7
			cmpb	#0
			BEQ	North
			cmpb	#1
			BEQ	South
			cmpb	#2
			BEQ	East
			cmpb	#3
			BEQ	West
			cmpb	#4
			BEQ	NorthEast
			cmpb	#5
			BEQ	NorthWest
			cmpb	#6
			BEQ	SouthEast
			cmpb	#7
			BEQ	SouthWest
North:
			LDY	#msgNorth		;output North the message
			JSR	putStr_sc0
			BRA	KeysPressedDisp

East:
			LDY	#msgEast		;output East the message
			JSR	putStr_sc0
			BRA	KeysPressedDisp

West:
			LDY	#msgWest		;output West the message
			JSR	putStr_sc0
			BRA	KeysPressedDisp

South:
			LDY	#msgSouth		;output South the message
			JSR	putStr_sc0
			BRA	KeysPressedDisp

NorthEast:
			LDY	#msgNorthEast		;output NorthEast the message
			JSR	putStr_sc0
			BRA	KeysPressedDisp

NorthWest:
			LDY	#msgNorthWest		;output Nothwest the message
			JSR	putStr_sc0
			BRA	KeysPressedDisp

SouthEast:
			LDY	#msgSouthEast		;output Southeast the message
			JSR	putStr_sc0
			BRA	KeysPressedDisp

SouthWest:
			LDY	#msgSouthWest		;output Southwest the message
			JSR	putStr_sc0

KeysPressedDisp:
			;loads the value of keyspressed by dereferencing the address on the stack then calls display
			ldb	#16
			stab	counter
			ldb	copycounter2
			ldy	#KeyPressedStr	
			ABY	
			ldd 	[localKeys,sp]
			jsr	Display


endDisplaySystemStatus:	
			puly
			pulx
			puld

			LDD	#BAUD19K		;program SCI0's baud rate
			JSR	setbaud
		
			LDY	#msgSpeed		;output Speed the message
			JSR	putStr_sc0

			LDY	#msgTemp		;output Temp the message
			JSR	putStr_sc0


			LDY	#msgKeys		;output Keys the message
			JSR	putStr_sc0		
			rts



;**********************************************
;Displays bits in binary by taking the hex
;value and shifting it. Then it checks the carry
;if carry is one then add a "1" to the array
;add "0" to the array
;**********************************************

Display:
			LSRD	;shifts d to get the bits into the carry
			XGDX	;exchanges x and d so that it can load $31 into b
			BCS	One	;if carry is one then print "1"
			BCC	Zero	;if carry is zero then print "0"

One:
			;Stores 1 in to the array.
			ldab 	#$31
			stab	1,Y-
			DEC	Counter  ;decrement the counter 
			ldab	Counter
			CMPB	Compare
			XGDX
			BNE	Display
			BRA 	programEnd
		
		
Zero:
			;Stores "0" into the arry
			ldab	#$30
			stab	1,Y-
			DEC	Counter
			ldab	Counter
			CMPB	Compare
			XGDX
			BNE	Display
			BRA 	programEnd


programEnd:
			rts	




		END