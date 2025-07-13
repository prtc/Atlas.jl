$SETPOOL
$SET VERIFY=NOIMAGE
$ASSIGN POOLQ:GF2101.LIN FOR007
$ASSIGN 2101:GF2101.GAM FOR008
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN 2101:C2101E.EIG FOR002
$ASSIGN 2101:C2101O.EIG FOR003
$ASSIGN 2101:RRHF2101.DAT FOR012
$ASSIGN GF210115.DAT FOR015
$ASSIGN 2101:LS2101.DAT FOR041
$ASSIGN POOLQ:GF2101.WNLIN FOR027
$RUN CRAY:BIGGF3007
21.01
0.        100000.   -7.5      103237.1  90000.    90000.    1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  1  1  (3d      )3d4s          (3d      )3d4p         3.53676         
  1  2  (3d      )3d4s          (3d      )3d5p        -0.09071         
  1 12  (4s      )3d4s          (4s      )4s4p         1.60634         
  2  1  (3d      )3d5s          (3d      )3d4p        -2.39773         
  2  2  (3d      )3d5s          (3d      )3d5p         7.35907         
  3  1  (3d      )3d6s          (3d      )3d4p        -0.68145         
  3  2  (3d      )3d6s          (3d      )3d5p        -5.33281         
  4  1  (3d      )3d7s          (3d      )3d4p        -0.35329         
  4  2  (3d      )3d7s          (3d      )3d5p        -1.17403         
 12 12  (4s      )4s2           (4s      )4s4p         3.16632         
 13 12  (4s      )4s5s          (4s      )4s4p        -2.15850         
 23  1  (3d      )3d2           (3d      )3d4p         2.30136         
 23  2  (3d      )3d2           (3d      )3d5p         0.24381         
 23 23  (3d      )3d2           (3d      )3d4f        -1.86073         
 23 24  (3d      )3d2           (3d      )3d5f        -1.35803         
 23 25  (3d      )3d2           (3d      )3d6f        -1.04952         
 24  1  (3d      )3d4d          (3d      )3d4p        -5.46263         
 24  2  (3d      )3d4d          (3d      )3d5p         8.28914         
 24 23  (3d      )3d4d          (3d      )3d4f        11.76575         
 24 24  (3d      )3d4d          (3d      )3d5f         0.05121         
 24 25  (3d      )3d4d          (3d      )3d6f        -1.05780         
 25  1  (3d      )3d5d          (3d      )3d4p        -1.32843         
 25  2  (3d      )3d5d          (3d      )3d5p        -9.90423         
 25 23  (3d      )3d5d          (3d      )3d4f        -9.89499         
 25 24  (3d      )3d5d          (3d      )3d5f        19.82238         
 25 25  (3d      )3d5d          (3d      )3d6f         1.10494         
 26  1  (3d      )3d6d          (3d      )3d4p        -0.53727         
 26  2  (3d      )3d6d          (3d      )3d5p        -2.27199         
 26 23  (3d      )3d6d          (3d      )3d4f        -0.33509         
 26 24  (3d      )3d6d          (3d      )3d5f       -18.94875         
 26 25  (3d      )3d6d          (3d      )3d6f        29.51318         
 35 12  (4s      )4s4d          (4s      )4s4p        -5.03786         
 50 23  (3d      )3d5g          (3d      )3d4f        16.90133         
 50 24  (3d      )3d5g          (3d      )3d5f       -18.13510         
 50 25  (3d      )3d5g          (3d      )3d6f         3.30176         
 61  1  (4p      )4p2           (4p      )3d4p        -1.48270         
 61 12  (4p      )4p2           (4p      )4s4p        -3.02690         
  0
$ASSIGN K1B: SORTWORK0
$ASSIGN K1B: SORTWORK1
$SORT/STAT POOLQ:GF2101.LIN POOLQ:GF2101.LIN
$SORT/STAT POOLQ:GF2101.WNLIN POOLQ:GF2101.WNLIN
