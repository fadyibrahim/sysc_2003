/*
Authors Fady Ibrahim 100876906, Gavez Smith 100857991 
*/
#include <stdio.h>
#include "hcs12dp256.h"
int i = 0;//counter
int counterClockwise =0;//clockwise incrementer
int clockwise =0;//counter clockwise incrementer






void delay(){//delay for a considerable 10 ms
   for(i=0; i<10000; i++){
   }
}

int main(){
	
	
	DDRP = 0xF0;//enable port P for the stepper motor
	PTP = 0x20;
	DDRT = 0xF0;//enable the bottom and left coils for the stepper motor
	
	while(clockwise<=10){//spin the stepper motor clockwise
	   PTT = 0x60;
	   delay();
	   PTT = 0x40;
	   delay();
	   PTT = 0x00;
	   delay();
	   PTT = 0x20;
	   delay();
	   clockwise++;
	}
	while(counterClockwise<=10){//spin the stepper motor counter clockwise
	   PTT = 0x20;
	   delay();
	   PTT = 0x00;
	   delay();
	   PTT = 0x40;
	   delay();
	   PTT = 0x60;
	   delay();
	   counterClockwise++;  
	}

	return 0;
}

