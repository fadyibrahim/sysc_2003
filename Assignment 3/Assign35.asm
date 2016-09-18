;**********************************************
;Fady Ibrahim
;100876906
;February 26 2013
;**********************************************
		ORG	$1000			;data area



;variable
Proximity		rmw	1

	
		ORG	$4000

start:
			LDS	#$3DFF			;initialize stack pointer (details later)

;Test case number 1 with collision detection and between N S E W
			LDD	#%1010100110010111
			STD	Proximity
			jsr	RobotIO
;Test case Number 2 with no collision detection and NSEW
			LDD	#%0010100110010001
			STD	Proximity
			jsr	RobotIO

;Test case Number 3 with collision detection and in the direction N S E W
			LDD	#%1010100110010000
			STD	Proximity
			jsr	RobotIO

			BRA *

;**********************************************
;RobotIO
;Turns on the led lights and the buzzer.
;**********************************************
RobotIO:
			movb #$FF,DDRK
			;checks the msb by shifting 15 times and if msb is 1 then object is near by else no object is near by.
collision_detection:
			ldx	#15
			ldd	Proximity
objloop:
			LSRD
			DBNE	x, objloop

CheckMSB:
			cmpb	#$01
			BEQ	ObstacleNear
			lbra	noObstacle

ObstacleNear:
			;if there is an object check to see if the path is N S E W by checking the first three bits
			ldx 	Proximity
			XGDX	
			ANDB	#7
			cmpb	#0
			BEQ	North
			cmpb	#1
			BEQ	South
			cmpb	#2
			BEQ	East
			cmpb	#3
			BEQ	West
			bra	betweenTwoDir

North:
			;set led 1 on and the buzzer
			bclr	PORTK,#$FF
			bset	PORTK,#$01
			bset	PORTK,#$20
			ldx	#$FFFF
delay1:			;delay the time by pushing onto and off the stack.
			psha
			pula
			psha
			pula
			dbne x, delay1
			LBRA	endRobotIO

East:			;set led 3 on and the buzzer
			bclr	PORTK,#$FF
			bset	PORTK,#$04
			bset	PORTK,#$20
			ldx	#$FFFF
delay2:			;delay the time by pushing onto and off the stack.
			psha
			pula
			psha
			pula
			dbne x, delay2
			lbra	endRobotIO
West:			;set led 3 on and the buzzer
			bclr	PORTK,#$FF
			bset	PORTK,#$02
			bset	PORTK,#$20
			ldx	#$FFFF
delay3:			;delay the time by pushing onto and off the stack.
			psha
			pula
			psha
			pula
			dbne x, delay3
			lbra	endRobotIO
South:;			set led 4 on and the buzzer
			bclr	PORTK,#$FF
			bset	PORTK,#$08
			bset	PORTK,#$20
			ldx	#$FFFF
delay4:			;delay the time by pushing onto and off the stack.
			psha
			pula
			psha
			pula
			dbne x, delay4
			bra	endRobotIO

betweenTwoDir:		
			
			bclr	PORTK,#$FF
			bset	PORTK,#$20
			ldx	#$FFFF
delay5:			;delay the time by pushing onto and off the stack.
			psha
			pula
			psha
			pula
			dbne x, delay5
			bra	endRobotIO
noObstacle: ;if there is no object check to see if the path is N S E W by checking the first three bits
			ldx 	Proximity
			XGDX	
			ANDB	#7
			cmpb	#0
			BEQ	North2
			cmpb	#1
			BEQ	South2
			cmpb	#2
			BEQ	East2
			cmpb	#3
			BEQ	West2
			bra	endRobotIO
North2:		;delay the time by pushing onto and off the stack.
			bclr	PORTK,#$FF
			bset	PORTK,#$01
			ldx	#$FFFF
delay6:
			psha
			pula
			psha
			pula
			dbne x, delay6
			bra	endRobotIO

East2:
			bclr	PORTK,#$FF
			bset	PORTK,#$04
			ldx	#$FFFF
delay7:		;delay the time by pushing onto and off the stack.
			psha
			pula
			psha
			pula
			dbne x, delay7
			bra	endRobotIO
West2:
			bclr	PORTK,#$FF
			bset	PORTK,#$02
			ldx	#$FFFF
delay8:		;delay the time by pushing onto and off the stack.
			psha
			pula
			psha
			pula
			dbne x, delay8
			bra	endRobotIO
South2:
			bclr	PORTK,#$FF
			bset	PORTK,#$08
			ldx	#$FFFF
delay9:		;delay the time by pushing onto and off the stack.
			psha
			pula
			psha
			pula
			dbne x, delay9
			bra	endRobotIO
endRobotIO:


			rts



#include "DP256reg.asm"
#include "sci0api.asm"

	END