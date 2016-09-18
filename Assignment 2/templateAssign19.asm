; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

		;ORG	$1000			;data area
		
		ORG 	$800 			;this is used when running on the simulator

Array:		db	47,121,114,34,44,117,33,124,255
IndexConstant:	equ	$0800	
LoopBreakValue:	db	255
IndexVariable:	dw	$0000
Sum:		dw	0


		ORG	$4000			;program area	 			
start:
		LDS	#$3DFF
loop:
		ldx 	IndexVariable
		ldab	IndexConstant,x	
		CMPB	LoopBreakValue
		BHS	FirstEnd
		INC	IndexVariable + 1
		ABY
		STY	Sum
		CMPB	LoopBreakValue
		BLO	loop
		;BRA	SecondEnd
			
FirstEnd:

		
		;LDD	#BAUD19K		;program SCI0's baud rate
		;JSR	setbaud

		;LDY	#message		;output the message
		;JSR	putStr_sc0

		BRA *

#include "DP256reg.asm"
#include "sci0api.asm"

		END
	