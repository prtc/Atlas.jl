$SETPOOLG
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN 2801:H2801O.HAM FOR007
$ASSIGN 2801:H2801O.DAT FOR099
$ASSIGN H2801O20 FOR020
$ASSIGN H2801O31 FOR031
$ASSIGN H2801O32 FOR032
$ASSIGN H2801O41 FOR041
$ASSIGN H2801O41 FOR070
$ASSIGN H2801O41 FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGHAM
 861 0 H2801O
d 8  s 0  p 1  p 0  f 0  h 0  k 0  s 0      ni ii d8 4p         e=   -333514.381
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 5p         e=   -333464.176
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 6p         e=   -333446.577
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 7p         e=   -333438.180
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 8p         e=   -333433.505
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 9p         e=   -333430.632
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 10p        e=   -333428.740
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 11p        e=   -333427.426
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 12p        e=   -333426.479
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 13p        e=   -333425.774
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 14p        e=   -333425.233
d 8  s 0  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d8 15p        e=   -333424.810
d 7  s 1  p 1  p 0  f 0  h 0  k 0  s 0      ni ii d7 4s4p       e=   -333469.036
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s5p       e=   -333407.654
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s6p       e=   -333388.260
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s7p       e=   -333379.333
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s8p       e=   -333374.434
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s9p       e=   -333371.449
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s10p      e=   -333369.495
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s11p      e=   -333368.144
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s12p      e=   -333367.173
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s13p      e=   -333366.451
d 7  s 1  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d7 4s14p      e=   -333365.900
d 6  s 2  p 1  p 0  f 0  h 0  k 0  s 0      ni ii d6s2 4p       e=   -333375.460
d 6  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d6s2 5p       e=   -333301.528
d 6  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d6s2 6p       e=   -333280.709
d 6  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d6s2 7p       e=   -333271.351
d 6  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d6s2 8p       e=   -333266.268
d 6  s 2  p 0  p 1  f 0  h 0  k 0  s 0      ni ii d6s2 9p       e=   -333263.192
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 4f         e=   -333450.133
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 5f         e=   -333440.100
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 6f         e=   -333434.648
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 7f         e=   -333431.363
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 8f         e=   -333429.236
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 9f         e=   -333427.779
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 10f        e=   -333426.739
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 11f        e=   -333425.969
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 12f        e=   -333425.383
d 8  s 0  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d8 13f        e=   -333424.928
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s4f       e=   -333391.314
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s5f       e=   -333380.992
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s6f       e=   -333375.422
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s7f       e=   -333372.080
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s8f       e=   -333369.921
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s9f       e=   -333368.446
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s10f      e=   -333367.395
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s11f      e=   -333366.617
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s12f      e=   -333366.027
d 7  s 1  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d7 4s13f      e=   -333365.568
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 4f       e=   -333283.033
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 5f       e=   -333272.659
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 6f       e=   -333267.054
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 7f       e=   -333263.694
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 8f       e=   -333261.525
d 6  s 2  p 0  p 0  f 1  h 0  k 0  s 0      ni ii d6s2 9f       e=   -333260.045
d 8  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ni ii d8 6h         e=   -333434.513
d 8  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ni ii d8 7h         e=   -333431.278
d 8  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ni ii d8 8h         e=   -333429.178
d 8  s 0  p 0  p 0  f 0  h 1  k 0  s 0      ni ii d8 9h         e=   -333427.738
d 8  s 0  p 0  p 0  f 0  h 0  k 1  s 0      ni ii d8 8k         e=   -333429.176
d 8  s 0  p 0  p 0  f 0  h 0  k 1  s 0      ni ii d8 9k         e=   -333427.737
