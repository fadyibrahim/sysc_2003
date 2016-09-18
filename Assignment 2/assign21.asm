; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

;Works on the HC12 board.

		ORG	$1000			;data area
message:	FCC	"The result is:"		;string: display message
Result:         DW  	0				;your result variable is this one; store the result here
TerminateString DB      0

Y:		db	45
X:		db	4
Z:		db 	0
		ORG	$4000			;program area	 			
start:
		; YOUR PROGRAM GOES HERE
	
		ldaa 	Y			;Stores y into a and adds 7 so that is can be (y+7)-->a
		adda	#7			
		suba    X			;subtracts x from a then stores that into z. (x-a)-->a-->z
		staa	Z
		std	Result			;stores the final answer into result.


		LDD	#BAUD19K		;program SCI0's baud rate
		JSR	setbaud

		LDY	#message		;output the message
		JSR	putStr_sc0


		BRA *

# include "DP256reg.asm"
#include "sci0api.asm"

		END