/*
Authors Fady Ibrahim 100876906, Gavez Smith 100857991 
*/
#include<stdio.h>
#include "hcs12dp256.h"
#include "vectors_dp256_NoICE.c"
void delay();
void printKeysPressed();
int x=1;
int motorOn=1;


void main(void)
{
SPI1CR1=0;

printKeysPressed();
}
#pragma interrupt_handler CollisionDetect()

/*
This function is the Real-Time ISR and interruts the program when the user presses 5 on the keyboard. It executes the
interrupt turns off the dc motor waits 3-4 second and turns the steppor motor then afterwards it turns on the dc motor again.
*/
 void CollisionDetect(void)
{

	if(motorOn==1)
	{
	motorOn=0;
	PTP=PTP & 0x7F;
	}	
if (x==24)
{
double clockwise =0;   //counter clockwise incrementer

	DDRP = 0xF0;//enable port P for the stepper motor
	PTP = 0x20;
	DDRT = 0xF0;//enable the bottom and left coils for the stepper motor
	
	while(clockwise<=1){//spin the stepper motor clockwise
	   PTT = 0x80;
	   delay();
	   PTT = 0x20;
	   delay();
	   PTT = 0x40;
	   delay();
	   PTT = 0x00;
	   delay();
	   clockwise++;
	}
}
if (x==40)
{
	motorOn=1;
	x=0;
	CRGINT= CRGINT & 0x7F;
}
 CRGFLG|= 0x80;
x++;
} 

void delay(){//delay for a considerable 10 ms
   int i = 0;   //counter
   for(i=0; i<10000; i++){
   }
}

/*
checks to see if key 5 is pressed if it is enable the realtime interrupt, else keep the dc motor running.
*/
void printKeysPressed(){
	int i=0;
	int loop=0;
	char keypressed=0;
	int counter=1;

	printf("No Obstacle detected!!! (press 5 to detect obstacle)\n");	
	SPI1CR1=0x00;


	while (loop==0)
	{
	// turns on the motor and the the output pins for the rows on the keypad.
	DDRP=0x8F;
	//turns on the collums.
  	DDRH=0x00;	
	PTM = 0x08;
	if(motorOn==1)
	{
	PTP=PTP | 0x80;
	}			   				
	keypressed=PTH;
	PTP= PTP | 0x02;
	PTM =PTM & 0x00;
	keypressed &= 0xF0;
	
	if (keypressed==0x20 && PTP==0x82)
	{
	printf ("Obstacle detected. Robot turing right in three seconds (Look at stepper motor)!\n");	
	CRGINT=0x80; //enable realtime interrupt
	RTICTL=0x7F;// set the period frequency.
	asm("cli");
	}

	
	for ( i=0;i<30000;i++);
	

	}
		
}
