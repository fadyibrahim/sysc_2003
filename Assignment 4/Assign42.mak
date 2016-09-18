CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = Assign42.o basicLCD.o 

Assign42:	$(FILES)
	$(CC) -o Assign42 $(LFLAGS) @Assign42.lk  
Assign42.o: C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/hcs12dp256.h C:/icc/include/hc12def.h
Assign42.o:	M:\SYSC20~1\ASSIGN~3\Assign42.C
	$(CC) -c $(CFLAGS) M:\SYSC20~1\ASSIGN~3\Assign42.C
basicLCD.o: M:\SYSC20~1\ASSIGN~3\DP256reg.s 
basicLCD.o:	M:\SYSC20~1\ASSIGN~3\basicLCD.s
	$(CC) -c $(ASFLAGS) M:\SYSC20~1\ASSIGN~3\basicLCD.s
