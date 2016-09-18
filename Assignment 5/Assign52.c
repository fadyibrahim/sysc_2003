/*
Authors Gavez Smith 100857991, Fady Ibrahim 100876906
*/
#include "hcs12dp256.h"
#include"stdio.h"
#include "vectors_dps256_NoICE.c"

void CollisionDetect(void);
void Inc_Dec_Speed(int speed, int temp );
void displaySpeed_Temp(int speed, int temp);
int changingSpeed=9;
int changingTemp=25;
int counterInterrupt=1;
int optCount = 0;
int duty, i;
#pragma interrupt_handler printKeysPressed()
#pragma interrupt_handler CollisionDetect()
#pragma interrupt_handler pacA_isr()
void main(){
	 
	 
	 Lcd2PP_Init();
	 displaySpeed_Temp(++changingSpeed, changingTemp);
	 DDRP |= 0x0F; // bitset PP0-3 as outputs (rows) 
	 DDRH &= 0x0F; // bitclear PH4..7 as inputs (columns)
	 PTP = 0x0F; // Set scan row(s)
	 PIFH = 0xFF; // Clear previous interrupt flags
	 PPSH = 0xF0; // Rising Edge
	 PERH = 0x00; // Disable pulldowns
	 PIEH |= 0xF0; // Local enable on columns inputs
	 // enable the latch.
	 //PTM |= 0x08;
	 //
	 duty = 20; 
	 PWMDTY7 = duty;
	
     PWMPOL = 0xFF; // Initial Polarity is high
     PWMCLK &= 0x7F; //Select Clock B for channel 7
     PWMPRCLK = 0x70; //Prescale ClockB : busclock/128
     PWMCAE &= 0x7F; //Channel 7 : left aligned
     PWMCTL &= 0xF3; //PWM in Wait and Freeze Modes
     PWMPER7 = 100; //Set period for PWM7
     PWME = 0x80; //Enable PWM Channel 7
     DDRP |= 0x40; //For Motor Direction Control 
     PAFLG |= 1; //Clear out the interrupt flag
     PACTL = 0x51; //Enable PACA for Optical Sensor
	 
	 CRGINT |= 0x80; //Enables timer interrupts
	 RTICTL |= 0x72; //Sets the prescale factor
	 asm("cli");
	 
	 while(1){};
	 
}

/*
printKeysPressed gets the character pressed on the keyboard by through the keyboard ISR and then it prints out the value on the terminal.

*/
void printKeysPressed(){   
	int i, count;
	asm("sei");

	for (count=1; count<=0x08; count<<=1)
	{
		PTH&=0x0F;
		PTP = (PTP&0xF0) | count;
		
		for (i=0;i<1000;i++);
		switch(PTH & 0xF0){
		     case 0x10:
			 	  if(PTP & 0x01) printf("1");
				  else if(PTP & 0x02) printf("4");
				  else if(PTP & 0x04) printf("7");
				  else if(PTP & 0x08){ 
				       
					  duty++; 
	 				  PWMDTY7 = duty;
					 
					  printf("E");
					 
					  displaySpeed_Temp(++changingSpeed, changingTemp);
			      
				}  
			 break;

		     case 0x20:
			      if(PTP & 0x01) printf("2");
				  else if(PTP & 0x02) printf("5");
				  else if(PTP & 0x04) printf("8");
				  else if(PTP & 0x08){
				      printf("0");
					  
					  PWMDTY7=0;
					  asm("swi");
				  }
			 break;
		     
		     case 0x40:
			      if(PTP & 0x01) printf("3");
				  else if(PTP & 0x02) printf("6");
				  else if(PTP & 0x04) printf("9");
				  else if(PTP & 0x08) printf("F");
		     break;
			 
		     case 0x80:
			      if(PTP & 0x01) printf("A");
				  else if(PTP & 0x02) printf("B");
				  else if(PTP & 0x04) printf("C");
				  else if(PTP & 0x08){
				       printf("D");
					   if (optCount>0) {
					  duty--; 
	 				  PWMDTY7 = duty;
					  }
					   displaySpeed_Temp(--changingSpeed, changingTemp);
				  }
		     break; 
		}
	 }
		
			 			
	PTP = 0x0F;
	PIFH = PIFH; // Acknowledge (all) interrupts
    asm("cli");
}
/*
DisplaySpeed_Temp displays the speed and temp passed in to the lcd display.
*/

void displaySpeed_Temp(int speed, int temp){	
	 int number;
	 int index=3;
	 int arraychars[4];
	 int arraycharstemp[2];
	 int remainder=0;
	 int holderSpeed=speed;
	 int holderTemp=temp;
     
	 
	 LCD_instruction(1);
	 LCD_display('S');
	 LCD_display('P');
	 LCD_display('E');
	 LCD_display('E');
	 LCD_display('D');
	 while (index>=0)
	 {
	  	   if(holderSpeed!=0)
	 {
     //takes the decimal value passed in and turns it into the decimal value representation in ASCII
	 remainder=holderSpeed%10;
	 holderSpeed=holderSpeed/10;
	 remainder=remainder+0x30;
	 arraychars[index]=remainder;
	 index=index-1;
	 }	 
	 else
	 {
	  	 	arraychars[index]=0x30;
	  		index=index-1;
	 }
	 }
	 LCD_display(' ');
	 for(index=0;index<4;index++)
	 {
	 	number=arraychars[index];
		LCD_display(number);
	 }
	 
	 index=1;
	 //goes to the next line.
	 LCD_instruction(0xC0);	
	 LCD_display('T');
	 LCD_display('E');
	 LCD_display('M');
	 LCD_display('P');
	 LCD_display('E');
	 LCD_display('R');
	 LCD_display('A');
	 LCD_display('T');
	 LCD_display('U');
	 LCD_display('R');
	 LCD_display('E');

	 while (index>=0)
	 {
	  	   remainder=holderTemp%10;
     	   holderTemp=holderTemp/10;
	 	   remainder=remainder+0x30;
	 	   arraycharstemp[index]=remainder;
	 	   index=index-1;
	 } 
	 LCD_display(' ');
	 for(index=0;index<2;index++)
	 {
	 	number=arraycharstemp[index];

	 	LCD_display(number);
	 }
	 
	 LCD_display('C');
}

/*
This function is the Real-Time ISR and interruts the program when the user presses 5 on the keyboard. It executes the
interrupt turns off the dc motor waits 3-4 second and turns the steppor motor then afterwards it turns on the dc motor again.
*/
 void CollisionDetect(void)
{
 	 asm("sei");

     counterInterrupt++;
	 //printf("counterInterrupt = %d\n", counterInterrupt);
	 if (counterInterrupt==4) {
	      printf(" the RPS is \t%d",optCount);
		  counterInterrupt=0;
		  optCount =0;
	 }
	 
	 CRGFLG = 0x80; //clear the RTI flag
	 asm("cli");
}

void pacA_isr(void) {
	//printf("MOTOR WORKS");
	INTR_OFF();
    optCount++;
    PAFLG |= 1;
    INTR_ON();
}