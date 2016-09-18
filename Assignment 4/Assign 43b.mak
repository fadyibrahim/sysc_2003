CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -v -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = Assign33b.o vectors_dp256_NoICE.o 

ASSIGN~3:	$(FILES)
	$(CC) -o ASSIGN~3 $(LFLAGS) @Assign 43b.lk  
Assign33b.o: C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\SYSC20~1\ASSIGN~3/hcs12dp256.h C:/icc/include/hc12def.h M:\SYSC20~1\ASSIGN~3/vectors_dp256_NoICE.c
Assign33b.o:	M:\SYSC20~1\ASSIGN~3\Assign33b.C
	$(CC) -c $(CFLAGS) M:\SYSC20~1\ASSIGN~3\Assign33b.C
vectors_dp256_NoICE.o:	M:\SYSC20~1\ASSIGN~3\vectors_dp256_NoICE.c
	$(CC) -c $(CFLAGS) M:\SYSC20~1\ASSIGN~3\vectors_dp256_NoICE.c
