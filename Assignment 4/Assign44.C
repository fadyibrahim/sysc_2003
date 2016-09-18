/*
Authors Fady Ibrahim 100876906, Gavez Smith 100857991 
*/
#include<stdio.h>
#include "hcs12dp256.h"
#include "vectors_dp256_NoICE1.c"

void delay();
char keypad();
#pragma interrupt_handler CollisionDetect()
 void CollisionDetect(void);
 #pragma interrupt_handler keyboardISR()
 void keyboardISR(void);
int x=1;
int motorOn=1;
char key;

void main(void)
{
char next;
Lcd2PP_Init();
    LCD_instruction();
	 LCD_display('P');
	 LCD_display('R');
	 LCD_display('E');
	 LCD_display('S');
	 LCD_display('S');
	 LCD_display(' ');
	 LCD_display('5');
SPI1CR1=0;
key = 0xFF;
DDRP |= 0x8F; // bitset PP0-3 as outputs (rows) 
DDRH &= 0x0F; // bitclear PH4..7 as inputs (columns)
PTM=0x08;
PTP = 0x8F; // Set scan row(s)
PIFH = 0xFF; // Clear previous interrupt flags
PPSH = 0xF0; // Rising Edge
PERH = 0x00; // Disable pulldowns
PIEH |= 0xF0; // Local enable on columns inputs
asm( "cli" );

	
}

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
	
	while(clockwise<=5){//spin the stepper motor clockwise
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


void keyboardISR(void)
{
char temp;
PIEH = 0x00; // Local disable
PIFH = PIFH; // Acknowledge (all) interrupts
PIEH |= 0xF0; // Local enable on columns inputs
asm("SEI");
temp = keypad();
if (temp ==0x35) 
{
	printf ("Obstacle detected. Robot turing right in three seconds (Look at stepper motor)!\n");	
	  LCD_instruction(0x00);
	 LCD_display('T');
	 LCD_display('U');
	 LCD_display('R');
	 LCD_display('N');
	 LCD_display('I');
	 LCD_display('N');
	 LCD_display('G');
	 LCD_display(' ');
	 LCD_display('R');
	 LCD_display('I');
	 LCD_display('G');
	 LCD_display('H');
	 LCD_display('T');
	CRGINT=0x80; //enable realtime interrupt
	RTICTL=0x7F;// set the period frequency.
	asm("cli");
 }
 PTP=0x80;
 PIFH = PIFH; // Acknowledge (all) interrupts
PIEH |= 0xF0; // Local enable on columns inputs
	asm("cli");
}

void delay(){//delay for a considerable 10 ms
   int i = 0;   //counter
   for(i=0; i<10000; i++){
   }
}

char keypad()
{
 	int loop=0;
 	char keypressed=0;
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
	PTP= PTP & 0x82;
	PTM =PTM & 0x00;
	keypressed &= 0xF0;
	if (keypressed==0x20 && PTP==0x82)
	{
	 return '5';
	}

	return 0;
	

}
}
asm(".include'basicLCD.s'");