; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

;Works on HC12 Board
		ORG	$1000			;data area
		
message:	FCC	"The result is:"		;string: display message
Result:         DB  	0				;your result variable is this one; store the result here
TerminateString DB      0

 Y: 		db	2
 X:		db	20
		ORG	$4000			;program area	 			
start:
	
		LDS	#$3DFF			;initialize stack pointer (details later)


		ldaa 	Y			;load into a, y and then load into b 2 then multiply them and store in D. (A x b -->D)
		ldab 	#2
		mul
		stab	Y			;Then store the value in y.
		ldaa 	X			;Then load into a, x and subtract y then store it into a. (A - Y--->A)
		suba	Y			
		ldab	#3			;Then load into b, 3 and then multiply a and b and store the value in d. (A x b -->D)
		mul
		stab	Result			;Store the value in Result.



		LDD	#BAUD19K		;program SCI0's baud rate
		JSR	setbaud

		LDY	#message		;output the message
		JSR	putStr_sc0


		BRA *

#include "DP256reg.asm"
#include "sci0api.asm"

		END