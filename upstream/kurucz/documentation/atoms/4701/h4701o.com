$SETPOOLG
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN 4701:H4701O.HAM FOR007
$ASSIGN 4701:H4701O.DAT FOR099
$ASSIGN H4701O20 FOR020
$ASSIGN H4701O31 FOR031
$ASSIGN H4701O32 FOR032
$ASSIGN H4701O41 FOR041
$ASSIGN H4701O41 FOR070
$ASSIGN H4701O41 FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGHAM
 836 0 H4701O
d 9  s 0  p 1  p 0  f 0  h 0  k 0  s 0      ag ii d9 5p         e=  -1165883.309
d 9  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ag ii d9 6p         e=  -1165836.228
d 9  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ag ii d9 7p         e=  -1165819.608
d 9  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ag ii d9 8p         e=  -1165811.606
d 9  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ag ii d9 9p         e=  -1165807.115
d 8  s 1  p 1  p 0  f 0  h 0  k 0  s 0      ag ii d8 5s5p       e=  -1165821.843
d 8  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ag ii d8 5s6p       e=  -1165765.286
d 8  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ag ii d8 5s7p       e=  -1165747.196
d 8  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ag ii d8 5s8p       e=  -1165738.762
d 8  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ag ii d8 5s9p       e=  -1165734.090
d 7  s 2  p 1  p 0  f 0  h 0  k 0  s 0      ag ii d7s2 5p       e=  -1165733.654
d 9  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d9 4f         e=  -1165824.295
d 9  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d9 5f         e=  -1165814.160
d 9  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d9 6f         e=  -1165808.644
d 9  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d9 7f         e=  -1165805.324
d 9  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d9 8f         e=  -1165803.175
d 9  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d9 9f         e=  -1165801.703
d 8  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d8 5s4f       e=  -1165751.660
d 8  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d8 5s5f       e=  -1165741.193
d 8  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d8 5s6f       e=  -1165735.540
d 8  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d8 5s7f       e=  -1165732.153
d 8  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d8 5s8f       e=  -1165729.967
d 8  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d8 5s9f       e=  -1165728.475
d 7  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ag ii d7s2 4f       e=  -1165651.669
d 9  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ag ii d9 6h         e=  -1165808.411
d 9  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ag ii d9 7h         e=  -1165805.174
d 9  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ag ii d9 8h         e=  -1165803.074
d 9  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ag ii d9 9h         e=  -1165801.632
d 8  s 1  p 0  p 0  f 0  h 1  k 0  s 0      ag ii d8 5s6h       e=  -1165735.146
d 8  s 1  p 0  p 0  f 0  h 1  k 0  s 0      ag ii d8 5s7h       e=  -1165731.909
d 8  s 1  p 0  p 0  f 0  h 1  k 0  s 0      ag ii d8 5s8h       e=  -1165729.808
d 8  s 1  p 0  p 0  f 0  h 1  k 0  s 0      ag ii d8 5s9h       e=  -1165728.365
d 9  s 0  p 0  p 0  f 0  h 0  k 1  s 0      ag ii d9 8k         e=  -1165803.071
d 9  s 0  p 0  p 0  f 0  h 0  k 1  s 0      ag ii d9 9k         e=  -1165801.631
d 8  s 1  p 0  p 0  f 0  h 0  k 1  s 0      ag ii d8 5s8k       e=  -1165729.798
d 8  s 1  p 0  p 0  f 0  h 0  k 1  s 0      ag ii d8 5s9k       e=  -1165728.358
