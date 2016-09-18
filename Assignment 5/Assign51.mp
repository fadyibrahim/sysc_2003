
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0938 =   2360. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _main
       402A  __text_start
       406F  _printKeysPressed
       421B  _displaySpeed_Temp
       43D1  _LCD_instruction
       43DD  _LCD_display
       43E9  _Lcd2PP_Init
       44B9  _putchar
       44E1  _strcpy
       44F0  __va_start
       450E  __HC12Setup
       4513  _itoa
       459B  _islower
       45B3  __ctype
       46B4  _toupper
       46D4  __print
       4909  _printf
       4938  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   4938   0004 =      4. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4938  __idata_start
       493C  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0004 =      4. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1000  _changingSpeed
       1002  _changingTemp
       1004  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1004   001B =     27. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1004  __bss_start
       101D  __textmode
       101F  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0000   4000 =  16384. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       3F8C  _interrupt_vectors

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
Assign51.o	[ Assign51.c ]
vectors_dps256_NoICE.o	[ vectors_dps256_NoICE.c ]
DP256Reg.o	[ DP256Reg.s ]
basicLCD.o	[ basicLCD.s ]
<library>	[ putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s, printf.s ]
[ textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

