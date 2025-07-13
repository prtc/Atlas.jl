$SETPOOLG
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN 2801:H2801E.HAM FOR007
$ASSIGN 2801:H2801E.DAT FOR099
$ASSIGN H2801E20 FOR020
$ASSIGN H2801E31 FOR031
$ASSIGN H2801E32 FOR032
$ASSIGN H2801E41 FOR041
$ASSIGN H2801E41 FOR070
$ASSIGN H2801E41 FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGHAM
 861 0 H2801E
d 9  s 0  p 0  d 0  s 0  g 0  i 0  l 0      ni ii d9            e=   -333563.182
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 4d         e=   -333470.159
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 5d         e=   -333448.937
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 6d         e=   -333439.379
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 7d         e=   -333434.199
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 8d         e=   -333431.071
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 9d         e=   -333429.035
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 10d        e=   -333427.634
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 11d        e=   -333426.632
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 12d        e=   -333425.889
d 8  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d8 13d        e=   -333425.322
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s4d       e=   -333413.824
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s5d       e=   -333390.533
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s6d       e=   -333380.491
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s7d       e=   -333375.109
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s8d       e=   -333371.877
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s9d       e=   -333369.785
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s10d      e=   -333368.349
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s11d      e=   -333367.324
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s12d      e=   -333366.565
d 7  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d7 4s13d      e=   -333365.987
d 6  s 2  p 0  d 1  s 0  g 0  i 0  l 0      ni ii d6s2 4d       e=   -333308.789
d 8  s 1  p 0  d 0  s 0  g 0  i 0  l 0      ni ii d8 4s         e=   -333556.670
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 5s         e=   -333476.323
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 6s         e=   -333451.674
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 7s         e=   -333440.805
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 8s         e=   -333435.033
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 9s         e=   -333431.598
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 10s        e=   -333429.389
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 11s        e=   -333427.884
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 12s        e=   -333426.815
d 8  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d8 13s        e=   -333426.026
d 7  s 2  p 0  d 0  s 0  g 0  i 0  l 0      ni ii d7 4s2        e=   -333508.616
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s5s       e=   -333421.512
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s6s       e=   -333393.781
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s7s       e=   -333382.123
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s8s       e=   -333376.041
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s9s       e=   -333372.459
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s10s      e=   -333370.170
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s11s      e=   -333368.619
d 7  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d7 4s12s      e=   -333367.520
d 6  s 2  p 0  d 0  s 1  g 0  i 0  l 0      ni ii d6s2 5s       e=   -333316.683
d 8  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d8 5g         e=   -333439.907
d 8  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d8 6g         e=   -333434.537
d 8  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d8 7g         e=   -333431.294
d 8  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d8 8g         e=   -333429.190
d 8  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d8 9g         e=   -333427.747
d 7  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d7 4s5g       e=   -333380.607
d 7  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d7 4s6g       e=   -333375.218
d 7  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d7 4s7g       e=   -333371.959
d 7  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d7 4s8g       e=   -333369.844
d 7  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ni ii d7 4s9g       e=   -333368.394
d 8  s 0  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d8 7i         e=   -333431.276
d 8  s 0  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d8 8i         e=   -333429.176
d 8  s 0  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d8 9i         e=   -333427.737
d 7  s 1  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d7 4s7i       e=   -333371.905
d 7  s 1  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d7 4s8i       e=   -333369.805
d 7  s 1  p 0  d 0  s 0  g 0  i 1  l 0      ni ii d7 4s9i       e=   -333368.366
d 8  s 0  p 0  d 0  s 0  g 0  i 0  l 1      ni ii d8 9l         e=   -333426.707
d 7  s 1  p 0  d 0  s 0  g 0  i 0  l 1      ni ii d7 4s9l       e=   -333367.335
d 7  s 0  p 2  d 0  s 0  g 0  i 0  l 0      ni ii d7 4p2        e=   -333413.736
