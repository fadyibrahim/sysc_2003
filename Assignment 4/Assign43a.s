	.module Assign43a.C
	.area data
_i::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile Assign43a.C
	.dbsym e i _i I
_counterClockwise::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile Assign43a.C
	.dbsym e counterClockwise _counterClockwise I
_clockwise::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile Assign43a.C
	.dbsym e clockwise _clockwise I
	.area text
	.dbfile Assign43a.C
	.dbfunc e delay _delay fV
_delay::
	.dbline -1
	.dbline 12
; #include <stdio.h>
; #include "hcs12dp256.h"
; int i = 0;//counter
; int counterClockwise =0;//clockwise incrementer
; int clockwise =0;//counter clockwise incrementer
; 
; 
; 
; 
; 
; 
; void delay(){//delay for a considerable 10 ms
	.dbline 13
	ldd #0
	std _i
L4:
	.dbline 13
	.dbline 14
L5:
	.dbline 13
;    for(i=0; i<10000; i++){
	ldd _i
	addd #1
	std _i
	.dbline 13
	ldd _i
	cpd #10000
	blt L4
	.dbline -2
	.dbline 15
;    }
; }
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e main _main fI
_main::
	.dbline -1
	.dbline 17
; 
; int main(){
	.dbline 20
; 	
; 	
; 	DDRP = 0xF0;//enable port P for the stepper motor
	ldab #240
	stab 0x25a
	.dbline 21
; 	PTP = 0x20;
	ldab #32
	stab 0x258
	.dbline 22
; 	DDRT = 0xF0;//enable the bottom and left coils for the stepper motor
	ldab #240
	stab 0x242
	bra L10
L9:
	.dbline 24
	.dbline 25
	ldab #96
	stab 0x240
	.dbline 26
	jsr _delay
	.dbline 27
	ldab #64
	stab 0x240
	.dbline 28
	jsr _delay
	.dbline 29
	clr 0x240
	.dbline 30
	jsr _delay
	.dbline 31
	ldab #32
	stab 0x240
	.dbline 32
	jsr _delay
	.dbline 33
	ldd _clockwise
	addd #1
	std _clockwise
	.dbline 34
L10:
	.dbline 24
; 	
; 	while(clockwise<=10){//spin the stepper motor clockwise
	ldd _clockwise
	cpd #10
	ble L9
	bra L13
L12:
	.dbline 35
	.dbline 36
	ldab #32
	stab 0x240
	.dbline 37
	jsr _delay
	.dbline 38
	clr 0x240
	.dbline 39
	jsr _delay
	.dbline 40
	ldab #64
	stab 0x240
	.dbline 41
	jsr _delay
	.dbline 42
	ldab #96
	stab 0x240
	.dbline 43
	jsr _delay
	.dbline 44
	ldd _counterClockwise
	addd #1
	std _counterClockwise
	.dbline 45
L13:
	.dbline 35
; 	   PTT = 0x60;
; 	   delay();
; 	   PTT = 0x40;
; 	   delay();
; 	   PTT = 0x00;
; 	   delay();
; 	   PTT = 0x20;
; 	   delay();
; 	   clockwise++;
; 	}
; 	while(counterClockwise<=10){//spin the stepper motor counter clockwise
	ldd _counterClockwise
	cpd #10
	ble L12
	.dbline 47
; 	   PTT = 0x20;
; 	   delay();
; 	   PTT = 0x00;
; 	   delay();
; 	   PTT = 0x40;
; 	   delay();
; 	   PTT = 0x60;
; 	   delay();
; 	   counterClockwise++;  
; 	}
; 
; 	return 0;
	ldd #0
	.dbline -2
L8:
	.dbline 0 ; func end
	rts
	.dbend
