;**********************************************
;Fady Ibrahim
;100876906
;February 26 2013
;**********************************************
	ORG	$1000			;data area
;indexing into the stack
localProximity		equ	9
localspeed		equ	8

;general purpose counter used to print out the binary bits
counter:		rmb	1
copycounter1		db	7
copycounter2		db	15
Compare: 		db	00

;Strings to be displayed with path and object dection
msgObstacleY:		FCC	"  Obstacle near by!"		;string: display message
TerminateString5 	DB      0
msgObstacleN:		FCC	"  No obstacle near by!"		;string: display message
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

;speed and proximity array of binary ACII values
msgSpeed:		FCC	"Speed:  "		;string: display message
speedStr:		ds.b	8
TerminateString1 	DB      0
msgProx:		FCC	"Proximity:  "		;string: display message
ProximityStr		ds.w	8
TerminateString3 	DB      0

;variables
Speed			rmb	1
Proximity		rmw	1





	
		ORG	$4000

start:
			LDS	#$3DFF			;initialize stack pointer (details later)
			LDD	#BAUD19K		;program SCI0's baud rate
			JSR	setbaud

			LDD	#%1010100110010111
			STD	Proximity
			pshd
			lDA	#$28
			STAA	Speed
			psha
			jsr	displayProximityAndSpeed
			pula
			puld
			ldb	#$0A
			JSR	putChar_sc0
;test collision and southwest			
			LDD	#%1011001100010111
			STD	Proximity
			LDD	#Proximity
			pshd
			lDA	#$28
			STAA	Speed
			psha
			JSR	collision_detection
			pula
			sta	Speed
			puld	

			LDD	Proximity
			pshd
			LDA	Speed
			psha
			jsr	displayProximityAndSpeed
			pula
			puld
			ldb	#$0A
			JSR	putChar_sc0

;test no collision and southwest

			LDD	#%0010100000010111
			STD	Proximity
			LDD	#Proximity
			pshd
			lDA	#$28
			STAA	Speed
			psha
			JSR	collision_detection
			pula
			sta	Speed
			puld	
			
			LDD	Proximity
			pshd
			LDA	Speed
			psha
			jsr	displayProximityAndSpeed
			pula
			puld
			ldb	#$0A
			JSR	putChar_sc0
;test collision and NorthEast

			LDD	#%1010100000010101
			STD	Proximity
			LDD	#Proximity
			pshd
			lDA	#$28
			STAA	Speed
			psha
			JSR	collision_detection
			pula
			sta	Speed
			puld	

			LDD	Proximity
			pshd
			LDA	Speed
			psha
			jsr	displayProximityAndSpeed
			pula
			puld
			ldb	#$0A
			JSR	putChar_sc0
;test collision and East

			LDD	#%1010100000010010
			STD	Proximity
			LDD	#Proximity
			pshd
			lDA	#$28
			STAA	Speed
			psha
			JSR	collision_detection
			pula
			sta	Speed
			puld	

			LDD	Proximity
			pshd
			LDA	Speed
			psha
			jsr	displayProximityAndSpeed
			pula
			puld
			ldb	#$0A
			JSR	putChar_sc0
			BRA *

;*********************************************
;Display proximity and the binary value and Speed 
;it's corresponding value.
;**********************************************
displayProximityAndSpeed:
			pshd	
			pshx
			pshy
SpeedDisp:
			ldb	#8
			stab	counter
			ldb	copycounter1
			ldy	#speedstr
			ABY	
			ldb 	localspeed,sp
			lda	#$00
			jsr	DisplayBit
			LDY	#msgSpeed		;output the message
			JSR	putStr_sc0

ProxbitDisplay	
			ldb	#16
			stab	counter
			ldb	copycounter2
			ldy	#ProximitySTR
			ABY
			ldd	localProximity,sp
			JSR 	DisplayBit
			LDY	#msgProx		;output the message
			JSR	putStr_sc0
	
ProximityDisplay


			BRSET	localProximity,sp,$80,Collision
			BRA	NoCollision
Collision:		
			
			LDY	#msgObstacleY		;output the message
			JSR	putStr_sc0
			BRA	DirectionRobot

			
NoCollision:
			LDY	#msgObstacleN		;output the message
			JSR	putStr_sc0			

DirectionRobot:
						
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

;The constant message to display what path the robot is on
North:
			LDY	#msgNorth		;output the message
			JSR	putStr_sc0
			BRA	endDisplaySystemStatus

East:
			LDY	#msgEast		;output the message
			JSR	putStr_sc0
			BRA	endDisplaySystemStatus

West:
			LDY	#msgWest		;output the message
			JSR	putStr_sc0
			BRA	endDisplaySystemStatus

South:
			LDY	#msgSouth		;output the message
			JSR	putStr_sc0
			BRA	endDisplaySystemStatus

NorthEast:
			LDY	#msgNorthEast		;output the message
			JSR	putStr_sc0
			BRA	endDisplaySystemStatus

NorthWest:
			LDY	#msgNorthWest		;output the message
			JSR	putStr_sc0
			BRA	endDisplaySystemStatus

SouthEast:
			LDY	#msgSouthEast		;output the message
			JSR	putStr_sc0
			BRA	endDisplaySystemStatus

SouthWest:
			LDY	#msgSouthWest		;output the message
			JSR	putStr_sc0
endDisplaySystemStatus:	

			puly
			pulx
			puld
			rts
;*********************************************
;Displays bits in binary by taking the hex
;value and shifting it. Then it checks the carry
;if carry is one then add a "1" to the array
;add "0" to the array
;**********************************************

DisplayBit:
			LSRD
			XGDX	
			BCS	One
			BCC	Zero

One:
	
			ldab 	#$31
			stab	1,Y-
			DEC	Counter
			ldab	Counter
			CMPB	Compare
			XGDX
			BNE	DisplayBit
			BRA 	programEnd
		
		
Zero:

			ldab	#$30
			stab	1,Y-
			DEC	Counter
			ldab	Counter
			CMPB	Compare
			XGDX
			BNE	DisplayBit
			BRA 	programEnd


programEnd:
			rts	







;******************************************************************************************************
;collision detection checks the first bit if it is one then an object is near by
;else no object is near by.
;If and object is near by it checks the path if the path is recognized it executes the rotate
;else it will divide the speed by 8
;If no object is detected it will multiply the speed by two no matter which way it is going.
;******************************************************************************************************

collision_detection:
			pshd
			pshy
			pshx

CheckMSB:
			ldx		localProximity,sp
			BRSET	0,x,$80,ObstacleNear
			bra		noObstacle

ObstacleNear:
			ldx 	[localProximity,sp] 
			XGDX	
			ANDB	#7
			cmpb	#0
			BEQ		DirectionNorNE
			cmpb	#5
			BEQ		DirectionNorNE
			cmpb	#1
			BEQ		DirectionSorSW
			cmpb	#7
			BEQ		DirectionSorSW
			BRA		DirectionElse

DirectionNorNE:
			ldx		localProximity,sp
			BCLR	0,x,$01 ;the ones that are set are cleared
			BSET	0,x,$02 ;the ones that are set are set
			BRA		endcollision_detection
DirectionSorSW:
			ldx		localProximity,sp
			BCLR	0,x,$02
			BSET	0,x,$01
			BRA		endcollision_detection
DirectionElse:
			ldb		localSpeed,sp
			lda		#00
			ldx		#8
			IDIV
			XGDX
			STB		localSpeed,sp
			BRA		endcollision_detection
			
noObstacle:
			ldb		localSpeed,sp
			lda		#2
			mul
			stb		localSpeed,sp
endcollision_detection:
			pulx
			puly
			puld
			ldb	1
			rts
#include "DP256reg.asm"
#include "sci0api.asm"

	END