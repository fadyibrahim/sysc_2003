
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   09FF =   2559. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _main
       402A  __text_start
       40B0  _printKeysPressed
       4286  _displaySpeed_Temp
       441C  _CollisionDetect
       4456  _pacA_isr
       4498  _LCD_instruction
       44A4  _LCD_display
       44B0  _Lcd2PP_Init
       4580  _putchar
       45A8  _strcpy
       45B7  __va_start
       45D5  __HC12Setup
       45DA  _itoa
       4662  _islower
       467A  __ctype
       477B  _toupper
       479B  __print
       49D0  _printf
       49FF  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   49FF   0008 =      8. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       49FF  __idata_start
       4A07  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0008 =      8. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1000  _changingSpeed
       1002  _changingTemp
       1004  _counterInterrupt
       1006  _optCount
       1008  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1008   001F =     31. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1008  _i
       1008  __bss_start
       100A  _duty
       1025  __textmode
       1027  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0000   4000 =  16384. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       3F8C  _interrupt_vectors

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
Assign52.o	[ Assign52.c ]
basicLCD.o	[ basicLCD.s ]
DP256Reg.o	[ DP256Reg.s ]
<library>	[ putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s, printf.s ]
[ textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

