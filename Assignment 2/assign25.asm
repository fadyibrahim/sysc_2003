; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

;Works on simulator
		
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
		ldx 	IndexVariable		;load program into x to decrement
		ldab	IndexConstant,x		;indexs into the array by adding indexconstant to x and then storing the accessed element into b([indexConstant+x]-->b) 
		CMPB	LoopBreakValue		;compare b to 255 if equal then end loop without adding 255 into the sum and then end program.
		BHS	FirstEnd		
		INC	IndexVariable + 1	;if b is not equal to 255 continue and then increment the indexvariable to access the next element in the array
		ABY
		STY	Sum			;store the sum into Sum
		CMPB	LoopBreakValue	
		BLO	loop			;Check to see if be is 255 if not go back to loop.
			
FirstEnd:

		


		BRA *

#include "DP256reg.asm"
#include "sci0api.asm"

		END