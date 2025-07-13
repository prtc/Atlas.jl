$SET DEF KU6E:[KURUCZ.4101]
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN LS410107.DAT FOR007
$ASSIGN LS410120.DAT FOR020
$ASSIGN LS410131.DAT FOR031
$ASSIGN LS410132.DAT FOR032
$ASSIGN LS4101.SIZ FOR099
$ASSIGN POOLQ:LS4101.DAT FOR041
$ASSIGN POOLQ:LS4101.DAT FOR070
$ASSIGN POOLQ:LS4101.DAT FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGTRANS
 861 0 861 0 0 0
d 4  s 0  p 0  s 0  d 0  g 0  i 0  s 0      nb ii d4            e=   -837883.67604
d 3  s 1  p 0  s 0  d 0  g 0  i 0  s 0      nb ii d3 5s         e=   -837883.02423
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 6s         e=   -837822.83983
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 7s         e=   -837802.73590
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 8s         e=   -837793.52589
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 9s         e=   -837788.49181
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 10s        e=   -837785.43651
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 11s        e=   -837783.44118
d 2  s 2  p 0  s 0  d 0  g 0  i 0  s 0      nb ii d2 5s2        e=   -837866.94564
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s6s       e=   -837803.47795
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s7s       e=   -837781.28895
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s8s       e=   -837771.51386
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s9s       e=   -837766.25103
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s10s      e=   -837763.08443
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s11s      e=   -837761.02797
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 6s        e=   -837766.11918
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 7s        e=   -837742.21209
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 8s        e=   -837731.95214
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 9s        e=   -837726.49283
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 10s       e=   -837723.22979
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 11s       e=   -837721.12016
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 5d         e=   -837818.12700
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 6d         e=   -837800.32369
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 7d         e=   -837792.20724
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 8d         e=   -837787.70441
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 9d         e=   -837784.92818
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 10d        e=   -837783.09353
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 11d        e=   -837781.82088
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s5d       e=   -837797.88956
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s6d       e=   -837778.60333
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s7d       e=   -837770.10880
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s8d       e=   -837765.42562
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s9d       e=   -837762.55905
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s10d      e=   -837760.67328
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s11d      e=   -837759.36612
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 5d        e=   -837760.38641
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 6d        e=   -837739.59659
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 7d        e=   -837730.58944
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 8d        e=   -837725.69540
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 9d        e=   -837722.72374
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 10d       e=   -837720.77879
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 11d       e=   -837719.43624
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 5g         e=   -837794.50345
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 6g         e=   -837789.10141
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 7g         e=   -837785.83381
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 8g         e=   -837783.71332
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 9g         e=   -837782.25905
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 10g        e=   -837781.22058
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s5g       e=   -837772.07823
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s6g       e=   -837766.63955
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s7g       e=   -837763.34717
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s8g       e=   -837761.21157
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s9g       e=   -837759.74763
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s10g      e=   -837758.70360
d 3  s 0  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d3 7i         e=   -837785.76543
d 3  s 0  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d3 8i         e=   -837783.66556
d 3  s 0  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d3 9i         e=   -837782.22514
d 2  s 1  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d2 5s7i       e=   -837763.23174
d 2  s 1  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d2 5s8i       e=   -837761.13165
d 2  s 1  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d2 5s9i       e=   -837759.69140
d 2  s 0  p 2  s 0  d 0  g 0  i 0  s 0      nb ii d2 5p2        e=   -837801.32551
d 3  s 0  p 1  p 0  f 0  h 0  k 0  s 0      nb ii d3 5p         e=   -837853.03156
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 6p         e=   -837813.27440
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 7p         e=   -837798.54458
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 8p         e=   -837791.29746
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 9p         e=   -837787.16485
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 10p        e=   -837784.58246
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 11p        e=   -837782.85810
d 3  s 0  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d3 12p        e=   -837781.65254
d 2  s 1  p 1  p 0  f 0  h 0  k 0  s 0      nb ii d2 5s5p       e=   -837840.04504
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s6p       e=   -837792.72705
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s7p       e=   -837776.77168
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s8p       e=   -837769.15146
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s9p       e=   -837764.85689
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s10p      e=   -837762.19257
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s11p      e=   -837760.42157
d 2  s 1  p 0  p 1  f 0  h 0  k 0  s 0      nb ii d2 5s12p      e=   -837759.18711
d 1  s 2  p 1  p 0  f 0  h 0  k 0  s 0      nb ii ds2 5p        e=   -837810.04155
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
