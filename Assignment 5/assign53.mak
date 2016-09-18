CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign53.o vectors_dp256_NoICE2.o 

assign53:	$(FILES)
	$(CC) -o assign53 $(LFLAGS) @assign53.lk  
assign53.o: M:\SYSC20~1\ASSIGN~4/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\SYSC20~1\ASSIGN~4/vectors_dp256_NoICE2.c
assign53.o:	M:\SYSC20~1\ASSIGN~4\assign53.C
	$(CC) -c $(CFLAGS) M:\SYSC20~1\ASSIGN~4\assign53.C
vectors_dp256_NoICE2.o:	M:\SYSC20~1\ASSIGN~4\vectors_dp256_NoICE2.c
	$(CC) -c $(CFLAGS) M:\SYSC20~1\ASSIGN~4\vectors_dp256_NoICE2.c
