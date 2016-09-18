; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

		;ORG	$1000			;data area
		
		ORG 	$800 			;this is used when running on the simulator

A2:		dw	%1010101001111101 
Counter:	dw	$16
Sum:		db	0


		ORG	$4000			;program area	 			
start:
		ldx	#0
		ldy	Counter
		lda	A2
		ldb	A2+1
		COMA
		COMB
		STD	A2	
ProgramLoop:
		LDS	#$3DFF			;initialize stack pointer (details later)
		lsld
		BCS	AddOne
		std	A2
		DBNE	y,ProgramLoop
		BRA	ProgramEnd

AddOne:
		
		INC	Sum
		DBNE	y,ProgramLoop
		BRA	ProgramLoop

ProgramEnd:
		
		
		
		;LDD	#BAUD19K		;program SCI0's baud rate
		;JSR	setbaud

		;LDY	#message		;output the message
		;JSR	putStr_sc0

		BRA *

#include "DP256reg.asm"
#include "sci0api.asm"

		END
	