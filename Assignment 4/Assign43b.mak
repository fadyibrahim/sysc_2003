CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = vectors_dp256_NoICE.o Assign43b.o 

Assign43b:	$(FILES)
	$(CC) -o Assign43b $(LFLAGS) @Assign43b.lk  
vectors_dp256_NoICE.o:	vectors_dp256_NoICE.c
	$(CC) -c $(CFLAGS) vectors_dp256_NoICE.c
Assign43b.o: C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\Sysc 2003\Assignment 4/hcs12dp256.h C:/icc/include/hc12def.h M:\Sysc 2003\Assignment 4/vectors_dp256_NoICE.c
Assign43b.o:	Assign43b.C
	$(CC) -c $(CFLAGS) Assign43b.C
