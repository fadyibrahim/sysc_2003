
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   00BC =    188. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _delay
       402A  __text_start
       4042  _main
       40B7  __HC12Setup
       40BC  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   40BC   0006 =      6. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       40BC  __idata_start
       40C2  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0006 =      6. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  _i
       1000  __data_start
       1002  _counterClockwise
       1004  _clockwise
       1006  __data_end

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
Assign43a.o	[ Assign43a.C ]
<library>	[ setup.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

