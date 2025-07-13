$SETPOOLG
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN H4700O.HAM FOR007
$ASSIGN 4700:H4700Ox.DAT FOR099
$ASSIGN H4700O20 FOR020
$ASSIGN H4700O31 FOR031
$ASSIGN H4700O32 FOR032
$ASSIGN H4700O41 FOR041
$ASSIGN H4700O41 FOR070
$ASSIGN H4700O41 FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGHAM
 855 0 H4700O
d10  s 0  p 1  p 0  f 0  h 0  k 0  s 0      ag i  d10 5p        e=  -1165992.673
d10  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d10 6p        e=  -1165975.215
d10  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d10 7p        e=  -1165969.823
d10  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d10 8p        e=  -1165967.362
d10  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d10 9p        e=  -1165966.029
d10  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d10 10p       e=  -1165965.226
d 9  s 1  p 1  p 0  f 0  h 0  k 0  s 0      ag i  d9 5s5p       e=  -1165961.858
d 9  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d9 5s6p       e=  -1165937.761
d 9  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d9 5s7p       e=  -1165931.587
d 9  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d9 5s8p       e=  -1165928.894
d 9  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d9 5s9p       e=  -1165927.466
d 9  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d9 5s10p      e=  -1165926.618
d 8  s 2  p 1  p 0  f 0  h 0  k 0  s 0      ag i  d8 5s2 5p     e=  -1165905.975
d 8  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d8 5s2 6p     e=  -1165874.308
d 8  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d8 5s2 7p     e=  -1165867.523
d 8  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d8 5s2 8p     e=  -1165864.653
d 8  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d8 5s2 9p     e=  -1165863.154
d 8  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ag i  d8 5s2 10p    e=  -1165862.270
d10  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d10 4f        e=  -1165969.903
d10  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d10 5f        e=  -1165967.419
d10  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d10 6f        e=  -1165966.067
d10  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d10 7f        e=  -1165965.252
d10  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d10 8f        e=  -1165964.722
d10  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d10 9f        e=  -1165964.360
d10  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d10 10f       e=  -1165964.100
d 9  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d9 5s4f       e=  -1165931.277
d 9  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d9 5s5f       e=  -1165928.772
d 9  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d9 5s6f       e=  -1165927.407
d 9  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d9 5s7f       e=  -1165926.583
d 9  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d9 5s8f       e=  -1165926.049
d 9  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d9 5s9f       e=  -1165925.684
d 9  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d9 5s10f      e=  -1165925.422
d 8  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d8 5s2 4f     e=  -1165866.883
d 8  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d8 5s2 5f     e=  -1165864.375
d 8  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d8 5s2 6f     e=  -1165863.008
d 8  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d8 5s2 7f     e=  -1165862.182
d 8  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d8 5s2 8f     e=  -1165861.648
d 8  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d8 5s2 9f     e=  -1165861.281
d 8  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ag i  d8 5s2 10f    e=  -1165861.019
d10  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ag i  d10 6h        e=  -1165966.049
d10  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ag i  d10 7h        e=  -1165965.239
d10  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ag i  d10 8h        e=  -1165964.714
d10  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ag i  d10 9h        e=  -1165964.353
d10  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ag i  d10 10h       e=  -1165964.096
d 9  s 1  p 0  p 0  f 0  h 1  k 0  s 0      ag i  d9 5s6h       e=  -1165927.365
d 9  s 1  p 0  p 0  f 0  h 1  k 0  s 0      ag i  d9 5s7h       e=  -1165926.556
d 9  s 1  p 0  p 0  f 0  h 1  k 0  s 0      ag i  d9 5s8h       e=  -1165926.031
d 9  s 1  p 0  p 0  f 0  h 1  k 0  s 0      ag i  d9 5s9h       e=  -1165925.670
d 9  s 1  p 0  p 0  f 0  h 1  k 0  s 0      ag i  d9 5s10h      e=  -1165925.413
d10  s 0  p 0  p 0  f 0  h 0  k 1  s 0      ag i  d10 8k        e=  -1165964.714
d10  s 0  p 0  p 0  f 0  h 0  k 1  s 0      ag i  d10 9k        e=  -1165964.353
d10  s 0  p 0  p 0  f 0  h 0  k 1  s 0      ag i  d1010k        e=  -1165964.096
d 9  s 1  p 0  p 0  f 0  h 0  k 1  s 0      ag i  d9 5s8k       e=  -1165926.030
d 9  s 1  p 0  p 0  f 0  h 0  k 1  s 0      ag i  d9 5s9k       e=  -1165925.670
d 9  s 1  p 0  p 0  f 0  h 0  k 1  s 0      ag i  d9 5s10k      e=  -1165925.413
