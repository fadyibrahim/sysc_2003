; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

;Works on HC12 board.
		ORG	$800			;data area

TestData	dc.w	#1234
counter:	db	$12
Compare: 	db	00

message:	FCC	"The result is:"		;string: display message
computedResult	ds.b	12				;your result variable is this one; store the result here
TerminateString DB      0


		ORG	$4000			;program area	 			
start:
		ldd 	Testdata
		ldy	#computedResult
Display:
		LSRD
		XGDX	
		BCS	One
		BCC	Zero

One:
		ldab 	#$31
		ldab	Counter
		stab	A,Y
		DEC	Counter
		ldab	Counter
		CMPB	Compare
		XGDX
		BNE	Display
		BRA 	programEnd
		
		
Zero:
		ldab	#$30
		ldab	Counter
		stab	A,Y
		DEC	Counter
		ldab	Counter
		CMPB	Compare
		XGDX
		BNE	Display
		BRA 	programEnd


programEnd:



		BRA *



#include "DP256reg.asm"
#include "sci0api.asm"

		END