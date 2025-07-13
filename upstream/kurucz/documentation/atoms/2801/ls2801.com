$SETPOOL
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN LS280107.DAT FOR007
$ASSIGN LS280120.DAT FOR020
$ASSIGN LS280131.DAT FOR031
$ASSIGN LS280132.DAT FOR032
$ASSIGN 2801:LS2801.SIZ FOR099
$ASSIGN POOLQ:LS2801.DAT FOR041
$ASSIGN POOLQ:LS2801.DAT FOR070
$ASSIGN POOLQ:LS2801.DAT FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGTRANS
 861 0 861 0 0 0
d 9  s 0  p 0  d 0  s 0  g 0  i 0  l 0      ni ii d9            e=   -333563.18184
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 4d         e=   -333470.15911
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 5d         e=   -333448.93656
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 6d         e=   -333439.37857
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 7d         e=   -333434.19873
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 8d         e=   -333431.07077
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 9d         e=   -333429.03461
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 10d        e=   -333427.63447
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 11d        e=   -333426.63236
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 12d        e=   -333425.88916
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 13d        e=   -333425.32190
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s4d       e=   -333413.82442
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s5d       e=   -333390.53251
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s6d       e=   -333380.49089
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s7d       e=   -333375.10932
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s8d       e=   -333371.87735
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s9d       e=   -333369.78463
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s10d      e=   -333368.34938
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s11d      e=   -333367.32435
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s12d      e=   -333366.56504
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s13d      e=   -333365.98683
d 6  s 2  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d6s2 4d       e=   -333308.78916
d 8  s 1  p 0  d 0  s 0  g 0  i 0  l 0      ni ii d8 4s         e=   -333556.67046
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 5s         e=   -333476.32287
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 6s         e=   -333451.67368
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 7s         e=   -333440.80495
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 8s         e=   -333435.03252
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 9s         e=   -333431.59780
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 10s        e=   -333429.38905
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 11s        e=   -333427.88426
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 12s        e=   -333426.81507
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 13s        e=   -333426.02619
d 7  s 2  p 0  d 0  s 0  g 0  i 0  l 0      ni ii d7 4s2        e=   -333508.61630
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s5s       e=   -333421.51236
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s6s       e=   -333393.78086
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s7s       e=   -333382.12261
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s8s       e=   -333376.04088
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s9s       e=   -333372.45856
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s10s      e=   -333370.17028
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s11s      e=   -333368.61872
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s12s      e=   -333367.52010
d 6  s 2  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d6s2 5s       e=   -333316.68307
d 8  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d8 5g         e=   -333439.90675
d 8  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d8 6g         e=   -333434.53655
d 8  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d8 7g         e=   -333431.29434
d 8  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d8 8g         e=   -333429.18999
d 8  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d8 9g         e=   -333427.74693
d 7  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d7 4s5g       e=   -333380.60746
d 7  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d7 4s6g       e=   -333375.21792
d 7  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d7 4s7g       e=   -333371.95921
d 7  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d7 4s8g       e=   -333369.84397
d 7  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d7 4s9g       e=   -333368.39376
d 8  s 0  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d8 7i         e=   -333431.27627
d 8  s 0  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d8 8i         e=   -333429.17613
d 8  s 0  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d8 9i         e=   -333427.73686
d 7  s 1  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d7 4s7i       e=   -333371.90498
d 7  s 1  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d7 4s8i       e=   -333369.80498
d 7  s 1  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d7 4s9i       e=   -333368.36570
d 8  s 0  p 0  d 0  s 0  g 0  i 0  l 1      ni ii d8 9l         e=   -333426.70709
d 7  s 1  p 0  d 0  s 0  g 0  i 0  l 1      ni ii d7 4s9l       e=   -333367.33550
d 7  s 0  p 2  d 0  s 0  g 0  i 0  l 0      ni ii d7 4p2        e=   -333413.73586
d 8  s 0  p 1  p 0  f 0  h 0  k 0  s 0      ni ii d8 4p         e=   -333514.38144
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 5p         e=   -333464.17551
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 6p         e=   -333446.57698
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 7p         e=   -333438.18027
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 8p         e=   -333433.50466
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 9p         e=   -333430.63177
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 10p        e=   -333428.73979
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 11p        e=   -333427.42636
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 12p        e=   -333426.47881
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 13p        e=   -333425.77364
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 14p        e=   -333425.23335
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 15p        e=   -333424.81042
d 7  s 1  p 1  p 0  f 0  h 0  k 0  s 0      ni ii d7 4s4p       e=   -333469.03584
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s5p       e=   -333407.65399
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s6p       e=   -333388.25987
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s7p       e=   -333379.33338
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s8p       e=   -333374.43408
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s9p       e=   -333371.44942
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s10p      e=   -333369.49483
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s11p      e=   -333368.14364
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s12p      e=   -333367.17262
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s13p      e=   -333366.45126
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s14p      e=   -333365.89969
d 6  s 2  p 1  p 0  f 0  h 0  k 0  s 0      ni ii d6s2 4p       e=   -333375.45981
d 6  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d6s2 5p       e=   -333301.52833
d 6  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d6s2 6p       e=   -333280.70947
d 6  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d6s2 7p       e=   -333271.35054
d 6  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d6s2 8p       e=   -333266.26834
d 6  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d6s2 9p       e=   -333263.19151
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 4f         e=   -333450.13340
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 5f         e=   -333440.09992
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 6f         e=   -333434.64757
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 7f         e=   -333431.36340
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 8f         e=   -333429.23574
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 9f         e=   -333427.77870
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 10f        e=   -333426.73875
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 11f        e=   -333425.96883
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 12f        e=   -333425.38312
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 13f        e=   -333424.92823
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s4f       e=   -333391.31426
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s5f       e=   -333380.99214
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s6f       e=   -333375.42165
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s7f       e=   -333372.07999
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s8f       e=   -333369.92117
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s9f       e=   -333368.44616
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s10f      e=   -333367.39484
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s11f      e=   -333366.61731
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s12f      e=   -333366.02682
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s13f      e=   -333365.56834
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 4f       e=   -333283.03341
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 5f       e=   -333272.65862
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 6f       e=   -333267.05366
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 7f       e=   -333263.69384
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 8f       e=   -333261.52544
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 9f       e=   -333260.04487
d 8  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ni ii d8 6h         e=   -333434.51306
d 8  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ni ii d8 7h         e=   -333431.27801
d 8  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ni ii d8 8h         e=   -333429.17810
d 8  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ni ii d8 9h         e=   -333427.73821
d 8  s 0  p 0  p 0  f 0  h 0  k 1  s 0      ni ii d8 8k         e=   -333429.17625
d 8  s 0  p 0  p 0  f 0  h 0  k 1  s 0      ni ii d8 9k         e=   -333427.73686
