$SET DEF KU6E:[KURUCZ.4101]
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN poolq:H4101O.HAM FOR007
$ASSIGN H4101O.DAT FOR099
$ASSIGN H4101O20 FOR020
$ASSIGN H4101O31 FOR031
$ASSIGN H4101O32 FOR032
$ASSIGN H4101O41 FOR041
$ASSIGN H4101O41 FOR070
$ASSIGN H4101O41 FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGHAM
 861 0 H4101O
d 3  s 0  p 1  p 0  f 0  h 0  k 0  s 0      nb ii d3 5p         e=   -837853.03170
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 6p         e=   -837813.27440
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 7p         e=   -837798.54458
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 8p         e=   -837791.29746
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 9p         e=   -837787.16485
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 10p        e=   -837784.58246
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 11p        e=   -837782.85810
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 12p        e=   -837781.65254
d 2  s 1  p 1  p 0  f 0  h 0  k 0  s 0      nb ii d2 5s5p       e=   -837840.04445
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s6p       e=   -837792.72705
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s7p       e=   -837776.77168
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s8p       e=   -837769.15146
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s9p       e=   -837764.85689
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s10p      e=   -837762.19257
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s11p      e=   -837760.42157
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s12p      e=   -837759.18711
d 1  s 2  p 1  p 0  f 0  h 0  k 0  s 0      nb ii ds2 5p        e=   -837810.04144
d 1  s 2  p 0  p 1  f 0  h 0  k 0  s 0      nb ii ds2 6p        e=   -837754.39944
d 1  s 2  p 0  p 1  f 0  h 0  k 0  s 0      nb ii ds2 7p        e=   -837737.41593
d 1  s 2  p 0  p 1  f 0  h 0  k 0  s 0      nb ii ds2 8p        e=   -837729.47450
d 1  s 2  p 0  p 1  f 0  h 0  k 0  s 0      nb ii ds2 9p        e=   -837725.04020
d 1  s 2  p 0  p 1  f 0  h 0  k 0  s 0      nb ii ds2 10p       e=   -837722.30408
d 1  s 2  p 0  p 1  f 0  h 0  k 0  s 0      nb ii ds2 11p       e=   -837720.49362
d 1  s 2  p 0  p 1  f 0  h 0  k 0  s 0      nb ii ds2 12p       e=   -837719.23471
d 3  s 0  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d3 4f         e=   -837805.49204
d 3  s 0  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d3 5f         e=   -837795.01968
d 3  s 0  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d3 6f         e=   -837789.37858
d 3  s 0  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d3 7f         e=   -837786.00001
d 3  s 0  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d3 8f         e=   -837783.82062
d 3  s 0  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d3 9f         e=   -837782.33205
d 3  s 0  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d3 10f        e=   -837781.27253
d 3  s 0  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d3 11f        e=   -837780.49188
d 2  s 1  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d2 5s4f       e=   -837783.84347
d 2  s 1  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d2 5s5f       e=   -837772.86358
d 2  s 1  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d2 5s6f       e=   -837767.03961
d 2  s 1  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d2 5s7f       e=   -837763.58470
d 2  s 1  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d2 5s8f       e=   -837761.36642
d 2  s 1  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d2 5s9f       e=   -837759.85541
d 2  s 1  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d2 5s10f      e=   -837758.78221
d 2  s 1  p 0  p 0  f 1  h 0  k 0  s 0      nb ii d2 5s11f      e=   -837757.99159
d 1  s 2  p 0  p 0  f 1  h 0  k 0  s 0      nb ii ds2 4f        e=   -837744.39582
d 1  s 2  p 0  p 0  f 1  h 0  k 0  s 0      nb ii ds2 5f        e=   -837733.08797
d 1  s 2  p 0  p 0  f 1  h 0  k 0  s 0      nb ii ds2 6f        e=   -837727.17217
d 1  s 2  p 0  p 0  f 1  h 0  k 0  s 0      nb ii ds2 7f        e=   -837723.67716
d 1  s 2  p 0  p 0  f 1  h 0  k 0  s 0      nb ii ds2 8f        e=   -837721.43268
d 1  s 2  p 0  p 0  f 1  h 0  k 0  s 0      nb ii ds2 9f        e=   -837719.90214
d 1  s 2  p 0  p 0  f 1  h 0  k 0  s 0      nb ii ds2 10f       e=   -837718.81465
d 1  s 2  p 0  p 0  f 1  h 0  k 0  s 0      nb ii ds2 11f       e=   -837718.01292
d 3  s 0  p 0  p 0  f 0  h 1  k 0  s 0      nb ii d3 6h         e=   -837789.01300
d 3  s 0  p 0  p 0  f 0  h 1  k 0  s 0      nb ii d3 7h         e=   -837785.77708
d 3  s 0  p 0  p 0  f 0  h 1  k 0  s 0      nb ii d3 8h         e=   -837783.67519
d 3  s 0  p 0  p 0  f 0  h 1  k 0  s 0      nb ii d3 9h         e=   -837782.23241
d 3  s 0  p 0  p 0  f 0  h 1  k 0  s 0      nb ii d3 10h        e=   -837781.20165
d 2  s 1  p 0  p 0  f 0  h 1  k 0  s 0      nb ii d2 5s6h       e=   -837766.49101
d 2  s 1  p 0  p 0  f 0  h 1  k 0  s 0      nb ii d2 5s7h       e=   -837763.25403
d 2  s 1  p 0  p 0  f 0  h 1  k 0  s 0      nb ii d2 5s8h       e=   -837761.14984
d 2  s 1  p 0  p 0  f 0  h 1  k 0  s 0      nb ii d2 5s9h       e=   -837759.70484
d 3  s 0  p 0  p 0  f 0  h 0  k 1  s 0      nb ii d3 8k         e=   -837783.66424
d 3  s 0  p 0  p 0  f 0  h 0  k 1  s 0      nb ii d3 9k         e=   -837782.22473
d 2  s 1  p 0  p 0  f 0  h 0  k 1  s 0      nb ii d2 5s8k       e=   -837761.12930
d 2  s 1  p 0  p 0  f 0  h 0  k 1  s 0      nb ii d2 5s9k       e=   -837759.68984
