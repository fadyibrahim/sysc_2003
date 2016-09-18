; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template


;Works on HC12 board.
		ORG	$1000			;data area

message:	FCC	"The result is:"		;string: display message
Result:         DW  	0				;your result variable is this one; store the result here
TerminateString DB      0
A1:		db	1
A2:		db	1
		ORG	$4000			;program area	 			
start:
		LDS	#$3DFF			;initialize stack pointer (details later)
		ldab	#8
loop:
		ldaa A1				;load from memory into A because register a is used for arithmetic operations
		adda A2
		staa A1				;stores a into memory so that the variable a1 can be changed to a new variable
		DBEQ b, ProgramEndODD		;dec b until it is zero if it is equal zero then b is odd and the number of the fibonacci series
		ldaa A1				
		adda A2				
		staa A2				;store a into A2 so that the variable a2 can be changed into a new variabl
		DBNE b,loop			;decrement b while it is not equal to zero and branch to loop if it is equal to zero continue

		ldab  #0
		stb  A1
		ldd  A1	
		Stab  Result			; change the arrangement of a and b registers using memory because the register a will contain the even number in the fibonacci series and we want to load it into b. 
		BRA ProgramEndEVEN		;after branch to the endEven which ends without doing anything because the value is already stored into b which b stores it into Result

ProgramEndODD:	ldab #0
		stab  A1
		staa A2				;Stores 0 into b so that be can store it into a1 then after switch the registers a and b and then store the answer into Result
		ldd  A1
		Stab  Result

ProgramEndEVEN:

		
		LDD	#BAUD19K		;program SCI0's baud rate
		JSR	setbaud

		LDY	#message		;output the message
		JSR	putStr_sc0

		BRA *

#include "DP256reg.asm"
#include "sci0api.asm"

		END