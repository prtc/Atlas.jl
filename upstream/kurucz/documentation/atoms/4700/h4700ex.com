$SET4700
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN H4700Ex.HAM xFOR007
$ASSIGN 4700:H4700Ex.DAT FOR099
$ASSIGN H4700E20 FOR020
$ASSIGN H4700E31 FOR031
$ASSIGN H4700E32 FOR032
$ASSIGN H4700E41 FOR041
$ASSIGN H4700E41 FOR070
$ASSIGN H4700E41 FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGHAM
 860 0 H4700E
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
d 9  s 1  p 0  s 0  d 0  g 1  i 0  l 0      ag i  d9 5s5g       e=  -1165928.712   guess
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
