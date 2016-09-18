/*
Authors Fady Ibrahim 100876906, Gavez Smith 100857991 
*/
#include "hcs12dp256.h"


void printKeysPressed();

void main(){

	 
	 printKeysPressed();

	
}

/*
printKeysPressed gets the character pressed on the keyboard by pulling and then it prints out the value on the terminal.

*/
void printKeysPressed(){
	int i=0;
	int loop=0;
	char keypressed=0;
	int counter=1;
	SPI1CR1=0x00;
//enable the rows with 1. Also expect an output for PTP
	DDRP=0x0F;
//enable the colums with 0. Also expect an input for PTH
	DDRH=0x00;
	while (loop==0)
	{
// enable the latch.
	PTM = 0x08;	  			   				
	PTP=counter;
//get the input value from PTH
	keypressed=PTH;
	PTM &= 0x00;
	keypressed &= 0xF0;
	if (keypressed==0x10 && counter==1)
	{
	   printf("1" );
	}
	else if (keypressed==0x20 && counter==1)
	{
	   printf("2" );
	}
	else if (keypressed==0x40 && counter==1)
	{
	   printf("3" );
	}
	else if (keypressed==0x80 && counter==1)
	{
	   printf("A");
	}
	else if (keypressed==0x10 && counter==2)
	{
	   printf("4");
	}
		else if (keypressed==0x20 && counter==2)
	{
	   printf("5");
	}
		else if (keypressed==0x40 && counter==2)
	{
	   printf("6");
	}
		else if (keypressed==0x80 && counter==2)
	{
	   printf("B");
	}
	
		else if (keypressed==0x10 && counter==4)
	{
	   printf("7");
	}
		else if (keypressed==0x20 && counter==4)
	{
	   printf("8");
	}
		else if (keypressed==0x40 && counter==4)
	{
	   printf("9");
	}
		else if (keypressed==0x80 && counter==4)
	{
	   printf("C");
	}
	
		else if (keypressed==0x10 && counter==8)
	{
	   printf("E");
	}
		else if (keypressed==0x20 && counter==8)
	{
	   printf("0");
	   loop=1;
	}
		else if (keypressed==0x40 && counter==8)
	{
	   printf("F");
	}
		else if (keypressed==0x80 && counter==8)
	{
	   printf("D");
	}
	//delay so that 1 character can get displayed at a time
	for ( i=0;i<10000;i++);

	//increament the counter and make sure it stays on 1,2,4,8 to set rows 1,2,3,4
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