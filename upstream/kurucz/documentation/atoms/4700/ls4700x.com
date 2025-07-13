$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN LS470007.DAT FOR007
$ASSIGN LS470020.DAT FOR020
$ASSIGN LS470031.DAT FOR031
$ASSIGN LS470032.DAT FOR032
$ASSIGN 4700:LS4700X.SIZ FOR099
$ASSIGN 4700:LS4700X.DAT FOR041
$ASSIGN 4700:LS4700X.DAT FOR070
$ASSIGN 4700:LS4700X.DAT FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGTRANS
 860 0 855 0 0 0
d10  s 1  p 0  s 0  d 0  g 0  i 0  l 0      ag i  d10 5s        e=  -1166019.096
d10  s 0  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d10 6s        e=  -1165980.976
d10  s 0  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d10 7s        e=  -1165972.009
d10  s 0  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d10 8s        e=  -1165968.426
d10  s 0  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d10 9s        e=  -1165966.627
d10  s 0  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d10 10s       e=  -1165965.595
d 9  s 2  p 0  s 0  d 0  g 0  i 0  l 0      ag i  d9 5s2        e=  -1165987.901
d 9  s 1  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d9 5s6s       e=  -1165944.616
d 9  s 1  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d9 5s7s       e=  -1165934.001
d 9  s 1  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d9 5s8s       e=  -1165930.039
d 9  s 1  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d9 5s9s       e=  -1165928.101
d 9  s 1  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d9 5s10s      e=  -1165927.005
d 8  s 2  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d8 5s2 6s     e=  -1165881.916
d 8  s 2  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d8 5s2 7s     e=  -1165870.108
d 8  s 2  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d8 5s2 8s     e=  -1165865.861
d 8  s 2  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d8 5s2 9s     e=  -1165863.817
d 8  s 2  p 0  s 1  d 0  g 0  i 0  l 0      ag i  d8 5s2 10s    e=  -1165862.671
d10  s 0  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d10 5d        e=  -1165975.465
d10  s 0  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d10 6d        e=  -1165969.934
d10  s 0  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d10 7d        e=  -1165967.426
d10  s 0  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d10 8d        e=  -1165966.060
d10  s 0  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d10 9d        e=  -1165965.245
d10  s 0  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d10 10d       e=  -1165964.717
d 9  s 1  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d9 5s5d       e=  -1165937.471
d 9  s 1  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d9 5s6d       e=  -1165931.492
d 9  s 1  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d9 5s7d       e=  -1165928.847
d 9  s 1  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d9 5s8d       e=  -1165927.439
d 9  s 1  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d9 5s9d       e=  -1165926.599
d 9  s 1  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d9 5s10d      e=  -1165926.059
d 8  s 2  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d8 5s2 5d     e=  -1165873.622
d 8  s 2  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d8 5s2 6d     e=  -1165867.367
d 8  s 2  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d8 5s2 7d     e=  -1165864.594
d 8  s 2  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d8 5s2 8d     e=  -1165863.126
d 8  s 2  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d8 5s2 9d     e=  -1165862.254
d 8  s 2  p 0  s 0  d 1  g 0  i 0  l 0      ag i  d8 5s2 10d    e=  -1165861.694
d10  s 0  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d10 5g        e=  -1165967.393
d10  s 0  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d10 6g        e=  -1165966.050
d10  s 0  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d10 7g        e=  -1165965.240
d10  s 0  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d10 8g        e=  -1165964.714
d10  s 0  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d10 9g        e=  -1165964.353
d10  s 0  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d10 10g       e=  -1165964.095
d 9  s 1  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d9 5s5g       e=  -1165928.712
d 9  s 1  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d9 5s6g       e=  -1165927.370
d 9  s 1  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d9 5s7g       e=  -1165926.559
d 9  s 1  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d9 5s8g       e=  -1165926.033
d 9  s 1  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d9 5s9g       e=  -1165925.672
d 9  s 1  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d9 5s10g      e=  -1165925.413
d10  s 0  p 0  s 0  d 0  g 0  i 1  l 0      ag i  d10 7i        e=  -1165965.239
d10  s 0  p 0  s 0  d 0  g 0  i 1  l 0      ag i  d10 8i        e=  -1165964.713
d10  s 0  p 0  s 0  d 0  g 0  i 1  l 0      ag i  d10 9i        e=  -1165964.353
d10  s 0  p 0  s 0  d 0  g 0  i 1  l 0      ag i  d10 10i       e=  -1165964.096
d 9  s 1  p 0  s 0  d 0  g 0  i 1  l 0      ag i  d9 5s7i       e=  -1165926.556
d 9  s 1  p 0  s 0  d 0  g 0  i 1  l 0      ag i  d9 5s8i       e=  -1165926.030
d 9  s 1  p 0  s 0  d 0  g 0  i 1  l 0      ag i  d9 5s9i       e=  -1165925.670
d 9  s 1  p 0  s 0  d 0  g 0  i 1  l 0      ag i  d9 5s10i      e=  -1165925.413
d10  s 0  p 0  s 0  d 0  g 0  i 0  l 1      ag i  d10 9l        e=  -1165964.095
d10  s 0  p 0  s 0  d 0  g 0  i 0  l 1      ag i  d10 10l       e=  -1165963.905
d 9  s 1  p 0  s 0  d 0  g 0  i 0  l 1      ag i  d9 5s9l       e=  -1165925.412
d 9  s 1  p 0  s 0  d 0  g 0  i 0  l 1      ag i  d9 5s10l      e=  -1165925.222
d 9  s 0  p 2  s 0  d 0  g 0  i 0  l 0      ag i  d9 5p2        e=  -1165922.692
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
