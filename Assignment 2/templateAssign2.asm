; SYSC 2003 - Intro to Real-Time Systems - Winter 2010
; Print on terminal template

		;ORG	$1000			;data area
		
		ORG 	$800 			;this is used when running on the simulator

;Y:		db	45
;X:		db	4
;Z:		db 	0
;Y: 		db	2
;X:		db	20
;Z:	 	db	0
A1:		db	1
A2:		db	1
		ORG	$4000			;program area	 			
start:
		LDS	#$3DFF			;initialize stack pointer (details later)
		ldab	#8
loop:

		; YOUR PROGRAM GOES HERE
	
		;ldaa 	Y
		;adda	#7
		;suba    X
		;staa	Z
		
		;ldaa 	Y
		;ldab 	#2
		;mul
		;ldaa	#0
		;stab	Y
		;ldaa 	X
		;suba	Y
		;ldab	#3
		;mul
		;stab	Z
		;ldd	Z


		ldaa A1
		adda A2
		staa A1
		DBEQ b, ProgramEndODD
		ldaa A1
		adda A2
		staa A2
		DBNE b,loop

		ldab  #0
		stb  A1
		ldd  A1
		BRA ProgramEndEVEN

ProgramEndODD:	ldab #0
		stab  A1
		staa A2
		ldd  A1

ProgramEndEVEN:


		;LDD	#BAUD19K		;program SCI0's baud rate
		;JSR	setbaud

		;LDY	#message		;output the message
		;JSR	putStr_sc0

		BRA *

#include "DP256reg.asm"
#include "sci0api.asm"

		END
	