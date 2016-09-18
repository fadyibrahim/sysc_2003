CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = vectors_dp256_NoICE1.o Assign44.o basicLCD.o 

Assign44:	$(FILES)
	$(CC) -o Assign44 $(LFLAGS) @Assign44.lk  
vectors_dp256_NoICE1.o:	vectors_dp256_NoICE1.C
	$(CC) -c $(CFLAGS) vectors_dp256_NoICE1.C
Assign44.o: C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\Sysc 2003\Assignment 4/hcs12dp256.h C:/icc/include/hc12def.h M:\Sysc 2003\Assignment 4/vectors_dp256_NoICE1.c
Assign44.o:	Assign44.C
	$(CC) -c $(CFLAGS) Assign44.C
basicLCD.o: DP256reg.s 
basicLCD.o:	basicLCD.s
	$(CC) -c $(ASFLAGS) basicLCD.s
