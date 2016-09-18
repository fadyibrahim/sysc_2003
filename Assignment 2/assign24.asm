; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

;Runs on simulator		
		ORG 	$800 			;this is used when running on the simulator

A2:		dw	%1010101001111101 	
Counter:	dw	$16			;conditional statement used to exit the loop 
Sum:		db	0


		ORG	$4000			;program area	 			
start:
		ldx	#0
		ldy	Counter			;x y and a are initialized. 
		lda	A2			;the var a2 into a
		ldb	A2+1			;then it stores the next section in memory into b because a2 is a 16-bit variable
		COMA				;turns 1's into 0's and 0's into 1's for the a register
		COMB				;turns 1's into 0's and 0's into 1's for the b register
		STD	A2	
ProgramLoop:
		LDS	#$3DFF			;initialize stack pointer (details later)
		ASLD				;arithmetic shift that puts a one or zero into the carry
		BCS	AddOne			;checks to see if the carry is one if it is then branch to addOne so that it can count the number of ones in the inverted variable A2
		std	A2			;if carry is not set store d into A2
		DBNE	y,ProgramLoop		;decrement y until the it equals zero because y holds the counter and the counter is the maximum amount of bits that can be shifted.
		BRA	ProgramEnd		;branch to program end if the shift has reached the last binary digit of a2.

AddOne:
		
		INC	Sum			;increment sum to count the number of ones in A2(inverted)
		DBNE	y,ProgramLoop		;decrements y and checks to see if y is zero if it is then exist because tehre are no more digits to shift if it isn't then loop back to program loop.

ProgramEnd:
		
		
		


		BRA *

#include "DP256reg.asm"
#include "sci0api.asm"

		END