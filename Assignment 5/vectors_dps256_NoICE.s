	.module vectors_dps256_NoICE.c
	.area memory(abs)
	.org 0x3f8c
_interrupt_vectors::
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 0
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word _printKeysPressed
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word _pacA_isr
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word 63695
	.word _CollisionDetect
	.word 63695
	.word 63687
	.word 63683
	.word 63691
	.word 63493
	.word 63497
	.word __start
	.dbfile M:\SYSC20~1\ASSIGN~4\vectors_dps256_NoICE.c
	.dbsym e interrupt_vectors _interrupt_vectors A[116:58]pfV
	.area data
	.dbfile M:\SYSC20~1\ASSIGN~4\vectors_dps256_NoICE.c
	.area bss
	.dbfile M:\SYSC20~1\ASSIGN~4\vectors_dps256_NoICE.c
_AccelINT::
	.blkb 2
	.dbsym e AccelINT _AccelINT I
