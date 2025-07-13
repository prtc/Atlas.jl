$SETPOOL
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN LS280107.DAT FOR007
$ASSIGN LS280120.DAT FOR020
$ASSIGN LS280131.DAT FOR031
$ASSIGN LS280132.DAT FOR032
$ASSIGN 2801:LSM2801e.SIZ FOR099
$ASSIGN POOLQ:LSM2801e.DAT FOR041
$ASSIGN POOLQ:LSM2801e.DAT FOR070
$ASSIGN POOLQ:LSM2801e.DAT FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGTRANSM
 861 0 0 0 0 8 0
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
