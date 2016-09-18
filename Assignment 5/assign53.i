#line 1 "assign53.C"
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














































































































































































































































































































































































































































































































































































































































































































































#line 2 "assign53.C"
#line 1 "M:\Sysc 2003\Assignment 5/vectors_dp256_NoICE2.c"

#line 5 "M:\Sysc 2003\Assignment 5/vectors_dp256_NoICE2.c"


#line 20 "M:\Sysc 2003\Assignment 5/vectors_dp256_NoICE2.c"
#pragma nonpaged_function _start
extern void _start(void);
#pragma interrupt_handler tempINT()
extern void tempINT(void);








#pragma abs_address:0x3F8C


#line 36 "M:\Sysc 2003\Assignment 5/vectors_dp256_NoICE2.c"
void (*interrupt_vectors[])(void) =
	{

#line 41 "M:\Sysc 2003\Assignment 5/vectors_dp256_NoICE2.c"






(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
	tempINT,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8C7,
(void (*)(void))0xF8C3,
(void (*)(void))0xF8CB,
(void (*)(void))0xF805,
(void (*)(void))0xF809,
	_start,
	};
#pragma end_abs_address
#line 4 "assign53.C"


#pragma interrupt_handler AccelINT()
void AccelINT(void);

int accelation;

void main(void)
{
 *(unsigned char volatile *)(0 + 0xF0)=0;
DRA=80;

asm("cli");


}

void AccelINT(void)
{
accerlation =PTA01;
 *(unsigned char volatile *)(0 + 0x85)=0x86;
}
