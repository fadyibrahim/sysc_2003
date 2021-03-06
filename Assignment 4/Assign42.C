/*
Authors Fady Ibrahim 100876906, Gavez Smith 100857991 
*/

#include"stdio.h"
#include <hcs12dp256.h>
asm(".include'basicLCD.s'");

void Inc_Dec_Speed(int speed, int temp );
void displaySpeed_Temp(int speed, int temp);

void main(){
	 Lcd2PP_Init();
     Inc_Dec_Speed(123,32);
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
     LCD_instruction();
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

Inc_Dec_speed checks to see if e or d was pressed if it was it will decrease the speed by 1 or increase the speed by 1
then it will pass the values into displaySpeed_temp and display it on the LCD board.
*/


void Inc_Dec_Speed(int speed, int temp ){
	int speedholder=speed;
	int i=0;
	int loop=0;
	char keypressed=0;
	int counter=1;
	SPI1CR1=0x00;
	DDRP=0x0F;
	DDRH=0x00;
	displaySpeed_Temp(speedholder, temp);
	while (loop==0)
	{
	PTM = 0x08;	  			   				
	PTP=counter;
	keypressed=PTH;
	PTM &= 0x00;
	keypressed &= 0xF0;

	printf("PTH= %x\n", PTH);
printf("Keypressed= %x\n", keypressed);
printf("Counter= %x\n", counter);				   	
	 if (keypressed==0x10 && counter==1)
	{
	 	speedholder+=1;
	    displaySpeed_Temp(speedholder, temp);
	   
	 }
	else if (keypressed==0x80 && counter==1)
	{
	    speedholder-=1;
	    displaySpeed_Temp(speedholder,  temp);
	}
	for ( i=0;i<10000;i++);
	
	if(counter>=2)
	{
	counter=counter +2;
	}
	else
	{
	counter++;
	}
	if (counter==6)
	{
	counter=counter+2;
	}
	if (counter>8)
	{
	counter=1;
	}
	}
}