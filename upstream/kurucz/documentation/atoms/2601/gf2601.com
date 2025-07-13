$SETPOOL
$SET VERIFY=NOIMAGE
$ASSIGN POOLQ:GF2601.LIN FOR007
$ASSIGN 2601:GF2601.GAM FOR008
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN POOLQ:C2601E.EIG FOR002
$ASSIGN POOLQ:C2601O.EIG FOR003
$ASSIGN 2601:RRHF2601.DAT FOR012
$ASSIGN GF260115.DAT FOR015
$ASSIGN POOLQ:LS2601.DAT FOR041
$ASSIGN POOLQ:GF2601.WNLIN FOR027
$RUN CRAY:BIGGF3007
26.01
0.        100000.   -7.5      130655.4  61000.    100000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  1  1  (d6      )d7            (d6      )d6 4p        1.0444    1.41137*.74
  1  2  (d6      )d7            (d6      )d6 5p        0.26376
  1  3  (d6      )d7            (d6      )d6 6p        0.08998
  1 15  (d6      )d7            (d6      )d6 4f       -1.17082
  1 16  (d6      )d7            (d6      )d6 5f       -0.98460
  2  1  (d6      )d6 4s         (d6      )d6 4p        2.86459
  2  2  (d6      )d6 4s         (d6      )d6 5p       -0.17661
  2  3  (d6      )d6 4s         (d6      )d6 6p       -0.27872
  2  7  (d5 4s   )d6 4s         (d5 4s   )d5 4s4p      1.0438    1.11042*.94
  3  1  (d6      )d6 5s         (d6      )d6 4p       -2.11719
  3  2  (d6      )d6 5s         (d6      )d6 5p        6.37509
  3  3  (d6      )d6 5s         (d6      )d6 6p       -0.47513
  4  1  (d6      )d6 6s         (d6      )d6 4p       -0.57953
  4  2  (d6      )d6 6s         (d6      )d6 5p       -5.04290
  4  3  (d6      )d6 6s         (d6      )d6 6p       11.06667
  5  1  (d6      )d6 7s         (d6      )d6 4p       -0.25595
  5  2  (d6      )d6 7s         (d6      )d6 5p       -0.89278
  5  3  (d6      )d6 7s         (d6      )d6 6p       -9.07182
  8  7  (d5 4s   )d5s2          (d5 4s   )d5 4s4p      2.63955
  9  7  (d5 4s   )d5 4s5s       (d5 4s   )d5 4s4p     -1.80316
 15  1  (d6      )d6 4d         (d6      )d6 4p       -4.80843
 15  2  (d6      )d6 4d         (d6      )d6 5p        6.94110
 15  3  (d6      )d6 4d         (d6      )d6 6p       -0.31682
 15 15  (d6      )d6 4d         (d6      )d6 4f        9.75984
 15 16  (d6      )d6 4d         (d6      )d6 5f        1.06847
 16  1  (d6      )d6 5d         (d6      )d6 4p       -1.01955
 16  2  (d6      )d6 5d         (d6      )d6 5p       -8.79214
 16  3  (d6      )d6 5d         (d6      )d6 6p       14.14063
 16 15  (d6      )d6 5d         (d6      )d6 4f      -10.01548
 16 16  (d6      )d6 5d         (d6      )d6 5f       16.13347
 17  1  (d6      )d6 6d         (d6      )d6 4p       -0.23611
 17  2  (d6      )d6 6d         (d6      )d6 5p       -1.76295
 17  3  (d6      )d6 6d         (d6      )d6 6p      -13.60055
 17 15  (d6      )d6 6d         (d6      )d6 4f        0.95418
 17 16  (d6      )d6 6d         (d6      )d6 5f      -19.96284
 21  7  (d5 4s   )d5 4s4d       (d5 4s   )d5 4s4p     -4.23158
 28  1  (d5 4p   )d5p2          (d5 4p   )d6 4p       -1.02962
  0
$ASSIGN K1C: SORTWORK0
$ASSIGN K1C: SORTWORK1
$SORT/STAT POOLQ:GF2601.LIN POOLQ:GF2601.LIN
$SORT/STAT POOLQ:GF2601.WNLIN POOLQ:GF2601.WNLIN
