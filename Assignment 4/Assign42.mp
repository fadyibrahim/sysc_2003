
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0859 =   2137. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _LCD_instruction
       402A  __text_start
       4036  _LCD_display
       4042  _Lcd2PP_Init
       4112  _main
       4129  _displaySpeed_Temp
       42BC  _Inc_Dec_Speed
       43DA  _putchar
       4402  _strcpy
       4411  __va_start
       442F  __HC12Setup
       4434  _itoa
       44BC  _islower
       44D4  __ctype
       45D5  _toupper
       45F5  __print
       482A  _printf
       4859  __text_end

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
Assign42.o	[ Assign42.C ]
<library>	[ putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s, printf.s ]
[ textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

