CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign33.o 

Assign34:	$(FILES)
	$(CC) -o Assign34 $(LFLAGS) @Assign34.lk  
assign33.o: C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h
assign33.o:	M:\SYSC20~1\assign33.c
	$(CC) -c $(CFLAGS) M:\SYSC20~1\assign33.c
