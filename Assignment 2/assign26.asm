; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

		;ORG	$1000			;data area
		
		ORG 	$800 			;this is used when running on the simulator

FirstString:	FCC	"Go weasel!"		
endOfString1	db	0			;Null String terminator for the first String.
SecondString:	FCC	"Go weasal!"
endOfString2	db	0			;null String terminatior for the second String.
counter1:	db	0			;counter is responsible for indexing into the strings because a string is stored as an array of chars.
Check:		db	0
Check2:		db	0
		ORG	$4000			;program area	 			
start:
		ldy	#FirstString
		ldx	#SecondString
loop:
		ldb 	counter1
		lda	b,y			;indexing and loading into a
		ldb	b,x			;indexing and loading into b
		inc	Counter1		;increment counter to index further into the array of chars.
		stab	Check			;store b into check so that the value of a can be compared to the value of b in memory.
		CMPA	Check2			;compare the value of a to $00 if is is equal this means that the end of the string has been hit successfully therefore both strings are equal.	
		BEQ	secondEnd
		CMPA	Check			;compare the value of b in memory if is is equal jump and return 1 if not continue to loop
		BEQ	Loop
		
firstEnd:
		ldd	#$00
		bra	thirdEnd		;if strings are not equal this code will return zero.

secondEnd:
		ldd	#$0001			;if strings are equal this code will return one.


thirdEnd:
		
		
		LDD	#BAUD19K		;program SCI0's baud rate
		JSR	setbaud

		;LDY	#message		;output the message
		JSR	putStr_sc0

		BRA *

#include "DP256reg.asm"
#include "sci0api.asm"

		END