CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = Assign41.o 

ASSIGN~1:	$(FILES)
	$(CC) -o ASSIGN~1 $(LFLAGS) @Assign 41.lk  
Assign41.o: M:\Sysc 2003\Assignment 4/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/TIME.H
Assign41.o:	Assign41.C
	$(CC) -c $(CFLAGS) Assign41.C
