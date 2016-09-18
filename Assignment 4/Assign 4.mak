CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign41.o vectors_dp256.o 

ASSIGN~1:	$(FILES)
	$(CC) -o ASSIGN~1 $(LFLAGS) @Assign 4.lk  
assign41.o: M:\SYSC20~1\ASSIGN~3/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/TIME.H
assign41.o:	M:\SYSC20~1\ASSIGN~3\assign41.C
	$(CC) -c $(CFLAGS) M:\SYSC20~1\ASSIGN~3\assign41.C
vectors_dp256.o:	M:\SYSC20~1\ASSIGN~3\vectors_dp256.c
	$(CC) -c $(CFLAGS) M:\SYSC20~1\ASSIGN~3\vectors_dp256.c
