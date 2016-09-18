CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = Assign51.o vectors_dps256_NoICE.o basicLCD.o DP256Reg.o 

assign54:	$(FILES)
	$(CC) -o assign54 $(LFLAGS) @assign54.lk  
Assign51.o: M:\SYSC20~1\ASSIGN~4/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h
Assign51.o:	M:\SYSC20~1\ASSIGN~4\Assign51.c
	$(CC) -c $(CFLAGS) M:\SYSC20~1\ASSIGN~4\Assign51.c
vectors_dps256_NoICE.o:	M:\SYSC20~1\ASSIGN~4\vectors_dps256_NoICE.c
	$(CC) -c $(CFLAGS) M:\SYSC20~1\ASSIGN~4\vectors_dps256_NoICE.c
basicLCD.o: M:\SYSC20~1\ASSIGN~4\DP256reg.s 
basicLCD.o:	M:\SYSC20~1\ASSIGN~4\basicLCD.s
	$(CC) -c $(ASFLAGS) M:\SYSC20~1\ASSIGN~4\basicLCD.s
DP256Reg.o:	M:\SYSC20~1\ASSIGN~4\DP256Reg.s
	$(CC) -c $(ASFLAGS) M:\SYSC20~1\ASSIGN~4\DP256Reg.s
