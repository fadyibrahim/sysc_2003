CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = Assign34.o 

35:	$(FILES)
	$(CC) -o 35 $(LFLAGS) @35.lk  
Assign34.o: C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h
Assign34.o:	M:\SYSC20~1\ASSIGN~2\3\Assign34.c
	$(CC) -c $(CFLAGS) M:\SYSC20~1\ASSIGN~2\3\Assign34.c
