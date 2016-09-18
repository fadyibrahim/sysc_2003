
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0BA3 =   2979. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _main
       402A  __text_start
       4031  _CollisionDetect
       40D6  _delay
       40F7  _printKeysPressed
       420C  _putchar
       4234  _strcpy
       4235  UNFERR
       4235  OVFERR
       4239  DIV0ERR
       423A  TOLGSMER
       423B  NSQRTERR
       423C  TAN90ERR
       423D  LNNEGERR
       423E  ACOSERR
       423F  ASINERR
       4240  FLTFMTER
       4243  __fp_is_acc1_zero
       424E  __fp_xfer_acc1_to_acc2
       4261  __push_fpacc2
       426D  __pull_fpacc2
       4282  __to_fpacc1
       429F  __to_fpacc2
       42BB  __from_fpacc1
       42CC  __from_fpacc2
       42DD  ONE
       42E1  CONSTP5
       42E5  CONSTP1
       42E9  CONST10
       42ED  __fpneg
       42F9  LNTBL
       4316  MONE
       431A  NLN2
       431E  N1DLN10
       4322  __pulfp1
       4341  __pulfp2
       4349  __pshfp1
       4368  __pshfp2
       4370  __fromfp1
       4378  __tofp1
       4380  __tofp2
       4388  __fpmov
       43A1  __fpadd
       44BC  __fpcmp
       44F9  __fpdiv
       4603  __fpmod
       4608  __fpmul
       4619  fpmul
       4643  __fp_return_max
       4645  __fp_return_div0
       464C  __fp_return_zero
       46D5  __fp_remcomp
       471D  __fpsub
       4730  __fp_intfrac
       475B  __va_start
       4779  __HC12Setup
       477E  _itoa
       4806  _islower
       481E  __ctype
       491F  _toupper
       493F  __print
       4B74  _printf
       4BA3  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   4BA3   0004 =      4. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4BA3  __idata_start
       4BA7  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0004 =      4. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  _x
       1000  __data_start
       1002  _motorOn
       1004  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1004   0029 =     41. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1004  __bss_start
       1004  __fpacc1_exp
       1005  __fpacc1_mantissa
       1008  __fpacc1_mantissa_sign
       1009  __fpacc2_exp
       100A  __fpacc2_mantissa
       100D  __fpacc2_mantissa_sign
       102B  __textmode
       102D  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0000   4000 =  16384. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       3F8C  _interrupt_vectors

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
Assign43b.o	[ Assign43b.C ]
<library>	[ putchar.c, strcpy.s, fp.s, fpadd.s, fpcmp.s, fpdiv.s, fpmodmul.s, fpsub.s, stdarg.s, setup.s, itoa.s ]
[ islower.s, ctype.s, toupper.s, _printf.s, printf.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

