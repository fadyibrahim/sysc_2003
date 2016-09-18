
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0D24 =   3364. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _main
       402A  __text_start
       4090  _CollisionDetect
       4135  _keyboardISR
       41CF  _delay
       41F0  _keypad
       4248  _LCD_instruction
       4254  _LCD_display
       4260  _Lcd2PP_Init
       438D  _putchar
       43B5  _strcpy
       43B6  OVFERR
       43B6  UNFERR
       43BA  DIV0ERR
       43BB  TOLGSMER
       43BC  NSQRTERR
       43BD  TAN90ERR
       43BE  LNNEGERR
       43BF  ACOSERR
       43C0  ASINERR
       43C1  FLTFMTER
       43C4  __fp_is_acc1_zero
       43CF  __fp_xfer_acc1_to_acc2
       43E2  __push_fpacc2
       43EE  __pull_fpacc2
       4403  __to_fpacc1
       4420  __to_fpacc2
       443C  __from_fpacc1
       444D  __from_fpacc2
       445E  ONE
       4462  CONSTP5
       4466  CONSTP1
       446A  CONST10
       446E  __fpneg
       447A  LNTBL
       4497  MONE
       449B  NLN2
       449F  N1DLN10
       44A3  __pulfp1
       44C2  __pulfp2
       44CA  __pshfp1
       44E9  __pshfp2
       44F1  __fromfp1
       44F9  __tofp1
       4501  __tofp2
       4509  __fpmov
       4522  __fpadd
       463D  __fpcmp
       467A  __fpdiv
       4784  __fpmod
       4789  __fpmul
       479A  fpmul
       47C4  __fp_return_max
       47C6  __fp_return_div0
       47CD  __fp_return_zero
       4856  __fp_remcomp
       489E  __fpsub
       48B1  __fp_intfrac
       48DC  __va_start
       48FA  __HC12Setup
       48FF  _itoa
       4987  _islower
       499F  __ctype
       4AA0  _toupper
       4AC0  __print
       4CF5  _printf
       4D24  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   4D24   0004 =      4. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4D24  __idata_start
       4D28  __idata_end

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
                             bss   1004   002A =     42. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1004  _key
       1004  __bss_start
       1005  __fpacc1_exp
       1006  __fpacc1_mantissa
       1009  __fpacc1_mantissa_sign
       100A  __fpacc2_exp
       100B  __fpacc2_mantissa
       100E  __fpacc2_mantissa_sign
       102C  __textmode
       102E  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0000   4000 =  16384. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       3F8C  _interrupt_vectors

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
Assign44.o	[ Assign44.C ]
<library>	[ putchar.c, strcpy.s, fp.s, fpadd.s, fpcmp.s, fpdiv.s, fpmodmul.s, fpsub.s, stdarg.s, setup.s, itoa.s ]
[ islower.s, ctype.s, toupper.s, _printf.s, printf.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

