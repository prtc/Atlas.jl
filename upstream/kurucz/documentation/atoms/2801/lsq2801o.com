$SETPOOL
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN LS280107.DAT FOR007
$ASSIGN LS280120.DAT FOR020
$ASSIGN LS280131.DAT FOR031
$ASSIGN LS280132.DAT FOR032
$ASSIGN 2801:LSQ2801o.SIZ FOR099
$ASSIGN POOLG:LSQ2801o.DAT FOR041
$ASSIGN POOLG:LSQ2801o.DAT FOR070
$ASSIGN POOLG:LSQ2801o.DAT FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGTRANSQ
 861 0 0 0 0 0 8
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
