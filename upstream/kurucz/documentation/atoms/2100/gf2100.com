$SETPOOL
$SET VERIFY=NOIMAGE
$ASSIGN POOLQ:GF2100.LIN FOR007
$ASSIGN 2100:GF2100.GAM FOR008
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN 2100:C2100E.EIG FOR002
$ASSIGN 2100:C2100O.EIG FOR003
$ASSIGN 2100:RRHF2100.DAT FOR012
$ASSIGN GF210015.DAT FOR015
$ASSIGN 2100:LS2100.DAT FOR041
$ASSIGN POOLQ:GF2100.WNLIN FOR027
$RUN CRAY:BIGGF3007
21.00
0.        100000.   -7.5      52922.    43000.    43000.    1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  1  9  (3d4s    )3d4s2         (3d4s    )3d4s4p       3.74980         
  1 10  (3d4s    )3d4s2         (3d4s    )3d4s5p       0.01092         
  1 11  (3d4s    )3d4s2         (3d4s    )3d4s6p      -0.04515         
  1 12  (3d4s    )3d4s2         (3d4s    )3d4s7p      -0.02443         
  1 13  (3d4s    )3d4s2         (3d4s    )3d4s8p      -0.08506         
  1 14  (3d4s    )3d4s2         (3d4s    )3d4s9p      -0.13180         
  1 15  (3d4s    )3d4s2         (3d4s    )3d4s10p     -0.16872         
  1 16  (3d4s    )3d4s2         (3d4s    )3d4s11p     -0.14574         
  1 17  (4s2     )3d4s2         (4s2     )s2 4p        1.77369         
  1 41  (4s2     )3d4s2         (4s2     )s2 4f       -2.61383         
  1 42  (4s2     )3d4s2         (4s2     )s2 5f        0.49519         
  1 43  (4s2     )3d4s2         (4s2     )s2 6f        0.40570         
  1 44  (4s2     )3d4s2         (4s2     )s2 7f       -0.09180         
  2  9  (3d4s    )3d4s5s        (3d4s    )3d4s4p      -2.90753         
  2 10  (3d4s    )3d4s5s        (3d4s    )3d4s5p       9.50894         
  2 11  (3d4s    )3d4s5s        (3d4s    )3d4s6p       0.92291         
  2 12  (3d4s    )3d4s5s        (3d4s    )3d4s7p       0.41894         
  2 13  (3d4s    )3d4s5s        (3d4s    )3d4s8p       0.08176         
  2 14  (3d4s    )3d4s5s        (3d4s    )3d4s9p      -0.12938         
  2 15  (3d4s    )3d4s5s        (3d4s    )3d4s10p     -0.29863         
  2 16  (3d4s    )3d4s5s        (3d4s    )3d4s11p     -0.26668         
  3  9  (3d4s    )3d4s6s        (3d4s    )3d4s4p      -0.78299         
  3 10  (3d4s    )3d4s6s        (3d4s    )3d4s5p      -8.33578         
  3 11  (3d4s    )3d4s6s        (3d4s    )3d4s6p      17.94976         
  3 12  (3d4s    )3d4s6s        (3d4s    )3d4s7p       1.61253         
  3 13  (3d4s    )3d4s6s        (3d4s    )3d4s8p       0.10495         
  3 14  (3d4s    )3d4s6s        (3d4s    )3d4s9p      -0.41453         
  3 15  (3d4s    )3d4s6s        (3d4s    )3d4s10p     -0.71011         
  3 16  (3d4s    )3d4s6s        (3d4s    )3d4s11p     -0.59066         
  4  9  (3d4s    )3d4s7s        (3d4s    )3d4s4p      -0.42367         
  4 10  (3d4s    )3d4s7s        (3d4s    )3d4s5p      -1.70329         
  4 11  (3d4s    )3d4s7s        (3d4s    )3d4s6p     -17.11912         
  4 12  (3d4s    )3d4s7s        (3d4s    )3d4s7p      26.72419         
  4 13  (3d4s    )3d4s7s        (3d4s    )3d4s8p       2.76905         
  4 14  (3d4s    )3d4s7s        (3d4s    )3d4s9p       0.44867         
  4 15  (3d4s    )3d4s7s        (3d4s    )3d4s10p     -0.60806         
  4 16  (3d4s    )3d4s7s        (3d4s    )3d4s11p     -0.57675         
  8  1  (3d2     )d2 4s         (3d2     )d2 4p        4.12269         
  8  2  (3d2     )d2 4s         (3d2     )d2 5p        0.15338         
  8  3  (3d2     )d2 4s         (3d2     )d2 6p       -0.12346         
  8  4  (3d2     )d2 4s         (3d2     )d2 7p       -0.27510         
  8  5  (3d2     )d2 4s         (3d2     )d2 8p       -0.33240         
  8  6  (3d2     )d2 4s         (3d2     )d2 9p       -0.25724         
  8  7  (3d2     )d2 4s         (3d2     )d2 10p      -0.03325         
  8  8  (3d2     )d2 4s         (3d2     )d2 11p       0.14093         
  8  9  (3d4s    )d2 4s         (3d4s    )3d4s4p       2.58821         
  8 10  (3d4s    )d2 4s         (3d4s    )3d4s5p       0.15735         
  8 11  (3d4s    )d2 4s         (3d4s    )3d4s6p       0.09426         
  8 12  (3d4s    )d2 4s         (3d4s    )3d4s7p       0.07351         
  8 13  (3d4s    )d2 4s         (3d4s    )3d4s8p       0.02467         
  8 14  (3d4s    )d2 4s         (3d4s    )3d4s9p      -0.01402         
  8 15  (3d4s    )d2 4s         (3d4s    )3d4s10p     -0.04780         
  8 16  (3d4s    )d2 4s         (3d4s    )3d4s11p     -0.04347         
  9  1  (3d2     )d2 5s         (3d2     )d2 4p       -3.65365         
  9  2  (3d2     )d2 5s         (3d2     )d2 5p       10.67205         
  9  3  (3d2     )d2 5s         (3d2     )d2 6p        0.06005         
  9  4  (3d2     )d2 5s         (3d2     )d2 7p       -0.69518         
  9  5  (3d2     )d2 5s         (3d2     )d2 8p       -0.89904         
  9  6  (3d2     )d2 5s         (3d2     )d2 9p       -0.83660         
  9  7  (3d2     )d2 5s         (3d2     )d2 10p      -0.29557         
  9  8  (3d2     )d2 5s         (3d2     )d2 11p       0.29032         
 21  1  (3d2     )d3            (3d2     )d2 4p        4.17309         
 21  2  (3d2     )d3            (3d2     )d2 5p       -0.86496         
 21  3  (3d2     )d3            (3d2     )d2 6p       -0.31456         
 21  4  (3d2     )d3            (3d2     )d2 7p       -0.23078         
 21  5  (3d2     )d3            (3d2     )d2 8p       -0.17972         
 21  6  (3d2     )d3            (3d2     )d2 9p       -0.04693         
 21  7  (3d2     )d3            (3d2     )d2 10p       0.08948         
 21  8  (3d2     )d3            (3d2     )d2 11p       0.12737         
 22  1  (3d2     )d2 4d         (3d2     )d2 4p       -5.38128         
 22  2  (3d2     )d2 4d         (3d2     )d2 5p       17.07286         
 22  3  (3d2     )d2 4d         (3d2     )d2 6p       -5.23693         
 22  4  (3d2     )d2 4d         (3d2     )d2 7p       -1.84258         
 22  5  (3d2     )d2 4d         (3d2     )d2 8p       -0.96848         
 22  6  (3d2     )d2 4d         (3d2     )d2 9p       -0.22756         
 22  7  (3d2     )d2 4d         (3d2     )d2 10p       0.25421         
 22  8  (3d2     )d2 4d         (3d2     )d2 11p       0.45793         
 29  9  (3d4s    )3d4s4d        (3d4s    )3d4s4p      -5.20821         
 29 10  (3d4s    )3d4s4d        (3d4s    )3d4s5p      14.65902         
 29 11  (3d4s    )3d4s4d        (3d4s    )3d4s6p      -2.43867         
 29 12  (3d4s    )3d4s4d        (3d4s    )3d4s7p      -0.72998         
 29 13  (3d4s    )3d4s4d        (3d4s    )3d4s8p      -0.50461         
 29 14  (3d4s    )3d4s4d        (3d4s    )3d4s9p      -0.42992         
 29 15  (3d4s    )3d4s4d        (3d4s    )3d4s10p     -0.39097         
 29 16  (3d4s    )3d4s4d        (3d4s    )3d4s11p     -0.31190         
 30  9  (3d4s    )3d4s5d        (3d4s    )3d4s4p      -2.28584         
 30 10  (3d4s    )3d4s5d        (3d4s    )3d4s5p     -10.19166         
 30 11  (3d4s    )3d4s5d        (3d4s    )3d4s6p      28.97955         
 30 12  (3d4s    )3d4s5d        (3d4s    )3d4s7p      -3.88508         
 30 13  (3d4s    )3d4s5d        (3d4s    )3d4s8p      -2.10089         
 30 14  (3d4s    )3d4s5d        (3d4s    )3d4s9p      -1.56834         
 30 15  (3d4s    )3d4s5d        (3d4s    )3d4s10p     -1.23649         
 30 16  (3d4s    )3d4s5d        (3d4s    )3d4s11p     -0.90191         
 60  1  (3d4p    )3d4p2         (3d4p    )d2 4p       -2.15340         
 60  9  (3d4p    )3d4p2         (3d4p    )3d4s4p      -3.36600         
 61  9  (4s4p    )4s4p2         (4s4p    )3d4s4p      -1.62032         
 61 17  (4s4p    )4s4p2         (4s4p    )s2 4p       -3.09019         
  0
$ASSIGN K1B: SORTWORK0
$ASSIGN K1B: SORTWORK1
$SORT/STAT POOLQ:GF2100.LIN POOLQ:GF2100.LIN
$SORT/STAT POOLQ:GF2100.WNLIN POOLQ:GF2100.WNLIN
