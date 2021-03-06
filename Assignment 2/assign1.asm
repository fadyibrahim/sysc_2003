; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

;Works on HC12 board.
		ORG	$1000			;data area

TestData	dc.w	$1ECF
counter:	db	16
Compare: 	db	00

message	FCC	"The result is:"		;string: display message
computedResult	ds.b	16				;your result variable is this one; store the result here
TerminateString DB      0


		ORG	$4000			;program area	 			
start:
		ldb	#15
		ldy	#computedResult
		ABY	
		ldd 	Testdata
Display:
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
		BNE	Display
		BRA 	programEnd
		
		
Zero:

		ldab	#$30
		stab	1,Y-
		DEC	Counter
		ldab	Counter
		CMPB	Compare
		XGDX
		BNE	Display
		BRA 	programEnd


programEnd:




		LDD	#BAUD19K		;program SCI0's baud rate
		JSR	setbaud

		LDY	#message		;output the message
		JSR	putStr_sc0


		BRA *

# include "DP256reg.asm"
#include "sci0api.asm"
		END