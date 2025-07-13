$SETPOOL
$SET VERIFY=NOIMAGE
$ASSIGN POOLQ:GAq2101O.LIN FOR007
$ASSIGN POOLQ:GAq2101O.WNLIN FOR027
$ASSIGN 2101:GAq2101O.GAM FOR008
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN K4B:C2101O.EIG FOR002
$ASSIGN K4E:C2101O.EIG FOR003
$ASSIGN 2101:RRHF2101O.DAT FOR012
$ASSIGN POOL:GAq210115.DAT FOR015
$ASSIGN 2101:LSQ2101O.DAT FOR041
$RUN CRAY:BIGGFQ3007
21.01 ODD
0.        100000.   -7.5      103237.   90000.    90000.    1.        99.
WAVELO    WAVEHI    GALO      EION      EGALO     EBOLT     STARTJJ   STOPJJ
  1  1  (3d+4p   )3d4p          (3d+4p   )3d4p       -22.81026        
  1  2  (3d      )3d4p          (3d      )3d5p        14.18978         
  1 12  (4p      )3d4p          (4p      )4s4p        -3.28951         
  1 23  (3d      )3d4p          (3d      )3d4f       +28.17236         
  1 24  (3d      )3d4p          (3d      )3d5f        +9.68081         
  1 25  (3d      )3d4p          (3d      )3d6f        +3.30034         
  2  1  (3d      )3d5p          (3d      )3d4p        14.18978         
  2  2  (3d+5p   )3d5p          (3d+5p   )3d5p       -89.84253        
  2 23  (3d      )3d5p          (3d      )3d4f       -97.78890         
  2 24  (3d      )3d5p          (3d      )3d5f       +72.70891         
  2 25  (3d      )3d5p          (3d      )3d6f       +29.12680         
 12  1  (4p      )4s4p          (4p      )3d4p        -3.28951         
 12 12  (4s      )4s4p          (4s      )4s4p       -14.46874         
 23  1  (3d      )3d4f          (3d      )3d4p       +28.17236         
 23  2  (3d      )3d4f          (3d      )3d5p       -97.78890         
 23 23  (3d+4f   )3d4f          (3d+4f   )3d4f      -101.97169         
 23 24  (3d      )3d4f          (3d      )3d5f        74.70482         
 23 25  (3d      )3d4f          (3d      )3d6f        12.44727         
 24  1  (3d      )3d5f          (3d      )3d4p        +9.68081         
 24  2  (3d      )3d5f          (3d      )3d5p       +72.70891         
 24 23  (3d      )3d5f          (3d      )3d4f        74.70482         
 24 24  (3d+5f   )3d5f          (3d+5f   )3d5f      -313.00509         
 24 25  (3d      )3d5f          (3d      )3d6f       213.94036         
 25  1  (3d      )3d6f          (3d      )3d4p        +3.30034         
 25  2  (3d      )3d6f          (3d      )3d5p       +29.12680         
 25 23  (3d      )3d6f          (3d      )3d4f        12.44727         
 25 24  (3d      )3d6f          (3d      )3d5f       213.94036         
 25 25  (3d+6f   )3d6f          (3d+6f   )3d6f      -705.90538         
0
$ASSIGN K1B: SORTWORK0
$ASSIGN K1B: SORTWORK1
$SORT/STAT POOLQ:GAq2101O.LIN POOLQ:GAq2101O.LIN
$SORT/STAT POOLQ:GAq2101O.WNLIN POOLQ:GAq2101O.WNLIN
