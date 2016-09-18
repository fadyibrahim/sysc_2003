#include "hcs12dp256.h"
#include"stdio.h"
#include "database.h"
#pragma interrupt_handler AccelINT()
void AccelINT(void);
int accelation;
void main(void)
{
SPI1CR1=0;
DRA=80;
asm("cli");
while (1==1)
{
if (acceleration>dragF && altitude==safeRangeAltitude)
{
 accelerate--;
}
else if (acceleration<dragF && altitude==safeRangeAltitude)
{
accelerate++;
}
if{
 If (engineStatus==false)
{
	dataCentBase.getInstructions(“Emergency”, statusOfCPU);.}
Else{
       dataCentBase.getInstruction(“next instruction”, statusOfCPU);
}
}
}
void AccelINT(void)
{
accerlation =PTA01;
ATD0CTL5=0x86;
}
