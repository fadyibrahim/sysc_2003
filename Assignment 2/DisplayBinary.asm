; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

;Works on the HC12 board.
		ORG	$800			;data area

TestData	dc.w	$4050
compare:	dw	$00
counter:	db	$16


message:	FCC	"The result is:"		;string: display message
computedResult	ds.b	12		;your result variable is this one; store the result here
TerminateString DB      0
		ORG	$4000			;program area	 	
	
start:
		; YOUR PROGRAM GOES HERE
		ldd 	Testdata
		ldy	#computedResult	
		
Loop:
		LSRD
		BCS 	One	
		BCC 	Zero

One:		ldab	#$31
		stab	X,Y
		DBNE	X,Loop
		

	
Zero:
		ldab	#$30
		stab	X,Y
		DBNE	X,Loop
		BRA *

# include "DP256reg.asm"
#include "sci0api.asm"

		END