
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   07AD =   1965. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _main
       402A  __text_start
       41B5  _collision_detection
       4259  _printInBinaryWord
       42B5  _printInBinaryByte
       432E  _putchar
       4356  _strcpy
       4365  __va_start
       4383  __HC12Setup
       4388  _itoa
       4410  _islower
       4428  __ctype
       4529  _toupper
       4549  __print
       477E  _printf
       47AD  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1000   001B =     27. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __bss_start
       1019  __textmode
       101B  __bss_end

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
Assign34.o	[ Assign34.c ]
<library>	[ putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s, printf.s ]
[ textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

