; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template


;Works on HC12 board.
		ORG	$1000			;data area

message:		FCC	"Temperature:"		;string: display message
localspeed		equ	0
localTemperature	equ	1
localProximity		equ	2	
localKeys		equ	4

Speed			rmb	1
Temperature		rmb	1
Proximity		rmw	1
KeyPressed		rmw	1

		ORG	$4000			;program area	 			
start:
			LDS	#$3DFF			;initialize stack pointer (details later)


displaySystemStatus:




#include "DP256reg.asm"
#include "sci0api.asm"

		END