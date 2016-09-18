#line 1 "assign54.C"

#line 4 "assign54.C"
#line 1 "M:\Sysc 2003\Assignment 5/hcs12dp256.h"




#line 6 "M:\Sysc 2003\Assignment 5/hcs12dp256.h"
#line 1 "C:/icc/include/hc12def.h"




#line 6 "C:/icc/include/hc12def.h"
typedef enum {
	BAUD38K = 13, BAUD19K = 26, BAUD14K = 35,
	BAUD9600 = 52, BAUD4800 = 104, BAUD2400 = 208,
	BAUD1200 = 417, BAUD600 = 833, BAUD300 = 2273
	} BaudRate;
void setbaud(BaudRate);




































typedef struct
	{
	char fp1[5];
	char fp2[5];
	} _FP_CONTEXT;

void _FP_SaveContext(_FP_CONTEXT *buf);
void _FP_RestoreContext(_FP_CONTEXT *buf);

void write_eeprom (unsigned char *addr, unsigned char b);

#pragma nonpaged_function _icall
int _icall(int (*)(void));

#line 7 "M:\Sysc 2003\Assignment 5/hcs12dp256.h"


#line 11 "M:\Sysc 2003\Assignment 5/hcs12dp256.h"














































































































































































































































































































































































































































































































































































































































































































































#line 5 "assign54.C"
#line 1 "C:/icc/include/stdio.h"


#line 1 "C:/icc/include/stdarg.h"


typedef char *va_list;


char *_va_start(char *, void *, int);

#line 9 "C:/icc/include/stdarg.h"



#line 13 "C:/icc/include/stdarg.h"




#line 4 "C:/icc/include/stdio.h"
#line 1 "C:/icc/include/_const.h"




#line 10 "C:/icc/include/_const.h"







#line 5 "C:/icc/include/stdio.h"

int getchar(void);
int putchar(char);
int puts(const char *);
int printf(const char *, ...);
int vprintf(const char *, va_list va);
int sprintf(char *,const char *, ...);

int scanf(const char *, ...);
int sscanf(char *,const char *, ...);
int vscanf(const char *, va_list va);











#line 6 "assign54.C"
asm(".include'basicLCD.s'");
#pragma interrupt_handler printKeysPressed()
void printKeysPressed();
void Inc_Dec_Speed(int speed, int temp );
void displaySpeed_Temp(int speed, int temp);
int changingSpeed=123;
int changingTemp=23;

void main(){

	 Lcd2PP_Init();
	 displaySpeed_Temp(++changingSpeed, changingTemp);
 *(unsigned char volatile *)(0 + 0x025A) |= 0x0F;
 *(unsigned char volatile *)(0 + 0x0262) &= 0x0F;
 *(unsigned char volatile *)(0 + 0x0258) = 0x0F;
 *(unsigned char volatile *)(0 + 0x0267) = 0xFF;
 *(unsigned char volatile *)(0 + 0x0265) = 0xF0;
 *(unsigned char volatile *)(0 + 0x0264) = 0x00;
 *(unsigned char volatile *)(0 + 0x0266) |= 0xF0;

 *(unsigned char volatile *)(0 + 0x0250) |= 0x08;


	 asm("cli");

	 while(1){};

}




#line 41 "assign54.C"
void printKeysPressed(){
	int i, count;
	asm("sei");

	for (count=1; count<=0x08; count<<=1)
	{
 *(unsigned char volatile *)(0 + 0x0260)&=0x0F;
 *(unsigned char volatile *)(0 + 0x0258) = (*(unsigned char volatile *)(0 + 0x0258)&0xF0) | count;

		for (i=0;i<1000;i++);
		switch(*(unsigned char volatile *)(0 + 0x0260) & 0xF0){
		     case 0x10:
			 	  if(*(unsigned char volatile *)(0 + 0x0258) & 0x01) printf("1");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x02) printf("4");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x04) printf("7");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x08){
				      printf("E");
					  displaySpeed_Temp(++changingSpeed, changingTemp);
			      }
			 break;

		     case 0x20:
			      if(*(unsigned char volatile *)(0 + 0x0258) & 0x01) printf("2");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x02) printf("5");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x04) printf("8");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x08){
				      printf("0");
					  asm("swi");
				  }
			 break;

		     case 0x40:
			      if(*(unsigned char volatile *)(0 + 0x0258) & 0x01) printf("3");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x02) printf("6");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x04) printf("9");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x08) printf("F");
		     break;

		     case 0x80:
			      if(*(unsigned char volatile *)(0 + 0x0258) & 0x01) printf("A");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x02) printf("B");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x04) printf("C");
				  else if(*(unsigned char volatile *)(0 + 0x0258) & 0x08){
				       printf("D");
					   displaySpeed_Temp(--changingSpeed, changingTemp);
				  }
		     break;
		}
	 }


 *(unsigned char volatile *)(0 + 0x0258) = 0x0F;
 *(unsigned char volatile *)(0 + 0x0267) = *(unsigned char volatile *)(0 + 0x0267);
    asm("cli");
}

#line 99 "assign54.C"

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
