#include <stdio.h>
int collision_detection (char *speed, unsigned int *proximity);
void printInBinaryByte(char ByteValue);
void printInBinaryWord(unsigned int hexValue);
int main(void)
{
	char speed=0x30;
	unsigned int proximity=0x8330;
	int boolDetect;
	printf("speed:  ");
	printInBinaryByte(speed);
	printf("\n");
	printf("proximity:  ");
	printInBinaryWord(proximity);
	printf("\n");
	boolDetect=collision_detection(&speed,&proximity);
	printf("speed:  ");
	printInBinaryByte(speed);
	printf("\n");
	printf("proximity:  ");
	printInBinaryWord(proximity);
	printf("\n");
	printf("\n");

	speed=0x30;
	proximity=0x1320;
	printf("speed:  ");
	printInBinaryByte(speed);
	printf("\n");
	printf("proximity:  ");
	printInBinaryWord(proximity);
	printf("\n");
	boolDetect=collision_detection(&speed,&proximity);
	printf("speed:  ");
	printInBinaryByte(speed);
	printf("\n");
	printf("proximity:  ");
	printInBinaryWord(proximity);
	printf("\n");
	printf("\n");

	speed=0x30;
	proximity=0x8327;
	printf("speed:  ");
	printInBinaryByte(speed);
	printf("\n");
	printf("proximity:  ");
	printInBinaryWord(proximity);
	printf("\n");
	boolDetect=collision_detection(&speed,&proximity);
	printf("speed:  ");
	printInBinaryByte(speed);
	printf("\n");
	printf("proximity:  ");
	printInBinaryWord(proximity);
	printf("\n");
	printf("\n");

	speed=0x30;
	proximity=0x8323;
	printf("speed:  ");
	printInBinaryByte(speed);
	printf("\n");
	printf("proximity:  ");
	printInBinaryWord(proximity);
	printf("\n");
	boolDetect=collision_detection(&speed,&proximity);
	printf("speed:  ");
	printInBinaryByte(speed);
	printf("\n");
	printf("proximity:  ");
	printInBinaryWord(proximity);
	printf("\n");
}

int collision_detection (char *speed, unsigned int *proximity)
{
	unsigned int prox=*proximity;
	unsigned int objectDetect=*proximity;
	objectDetect=objectDetect>>15;
	if(objectDetect==1)
	{
		prox = prox & 0x0007;
		if(prox==0 || prox==4)
		{
			*proximity=*proximity | 0x0200;
			*proximity=*proximity & 0xFEFF;
			return 1;
		}
		else if(prox==2 || prox==7)
		{
			*proximity=*proximity | 0x0100;
			*proximity=*proximity & 0xFDFF;
			return 1;
		}
		else{
		*speed=*speed/8;

		return 1;
		}

	}
	else{
	*speed=*speed*2;
	return 0;
	}
}
void printInBinaryWord(unsigned int hexValue)
{	

	int andCounter=32768;
	int constant=hexValue;
	int temp=0;
	int loop=0;
	while (loop!=16)
	{
		temp=constant;
		temp=temp & andCounter;
		if(temp==andCounter)
		{
			printf("1");
		}
		else
		{
			printf("0");
			}
		loop++;
		andCounter=andCounter/2;
	}

}
void printInBinaryByte(char ByteValue)
{	

	int andCounter=128;
	int constant=ByteValue;
	int temp=0;
	int loop=0;
	while (loop!=8)
	{
		temp=constant;
		temp=temp & andCounter;
		if(temp==andCounter)
		{
			printf("1");
		}
		else
		{
			printf("0");
			}
		loop++;
		andCounter=andCounter/2;
	}

}
