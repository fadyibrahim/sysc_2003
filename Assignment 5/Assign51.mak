CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = Assign51.o vectors_dps256_NoICE.o DP256Reg.o basicLCD.o 

Assign51:	$(FILES)
	$(CC) -o Assign51 $(LFLAGS) @Assign51.lk  
Assign51.o: M:\Assign51/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h
Assign51.o:	M:\Assign51\Assign51.c
	$(CC) -c $(CFLAGS) M:\Assign51\Assign51.c
vectors_dps256_NoICE.o:	M:\Assign51\vectors_dps256_NoICE.c
	$(CC) -c $(CFLAGS) M:\Assign51\vectors_dps256_NoICE.c
DP256Reg.o:	M:\Assign51\DP256Reg.s
	$(CC) -c $(ASFLAGS) M:\Assign51\DP256Reg.s
basicLCD.o: M:\Assign51\DP256reg.s 
basicLCD.o:	M:\Assign51\basicLCD.s
	$(CC) -c $(ASFLAGS) M:\Assign51\basicLCD.s
