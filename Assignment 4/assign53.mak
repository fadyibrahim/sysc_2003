CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign53.o 

assign53:	$(FILES)
	$(CC) -o assign53 $(LFLAGS) @assign53.lk  
assign53.o: M:\Sysc 2003\Assignment 4/hcs12dp256.h C:/icc/include/hc12def.h
assign53.o:	assign53.C
	$(CC) -c $(CFLAGS) assign53.C
