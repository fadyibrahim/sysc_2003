#line 1 "M:\SYSC20~1\ASSIGN~4\vectors_dps256_NoICE.c"

#line 5 "M:\SYSC20~1\ASSIGN~4\vectors_dps256_NoICE.c"


#line 20 "M:\SYSC20~1\ASSIGN~4\vectors_dps256_NoICE.c"
#pragma nonpaged_function _start
extern void _start(void);
extern void printKeysPressed();
extern void CollisionDetect();
extern void pacA_isr();









#pragma abs_address:0x3F8C


#line 38 "M:\SYSC20~1\ASSIGN~4\vectors_dps256_NoICE.c"
void (*interrupt_vectors[])(void) =
	{

#line 43 "M:\SYSC20~1\ASSIGN~4\vectors_dps256_NoICE.c"






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
	AccelINT,
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
	printKeysPressed,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8CF,
	pacA_isr,
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
	CollisionDetect,
(void (*)(void))0xF8CF,
(void (*)(void))0xF8C7,
(void (*)(void))0xF8C3,
(void (*)(void))0xF8CB,
(void (*)(void))0xF805,
(void (*)(void))0xF809,
	_start,
	};
#pragma end_abs_address
