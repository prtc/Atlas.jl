$SET def 3000
$SET VERIFY=NOIMAGE
$ASSIGN B3000EZ.PUN FOR007
$ASSIGN H3000EZ.HAM FOR001
$ASSIGN POOLQ:C3000EZ.EIG FOR003
$ASSIGN EAV3000EZ.DAT FOR066
$ASSIGN POOLG:B3000E15 FOR015
$ASSIGN POOLG:B3000E16 FOR016
$RUN CRAY:LEAST3007
1 Nawaz, M., Nadeem, A., Bhatti, S.A., and Baig, M.A. 2006. J.Phys.B 39, 871-881.
2 Gullberg, D. and Litzen, U. 2000.  Physica Scripta 61, 652-656, 
3 Sugar, J. and Musgrove, A. 1995.  J. Phys. Chem. Ref. Data 24, 1803-1872.
4 Moore, C.E. 1952.  Atomic Energy Levels Vol II.  NBS Circular 467.
5
6
7
8
9
    1    0    0    0     0.300     1.300
    1  1.         40   90  110   95   80   60   40   20   10   10   10    0
  30.00
4s2       4s5s      4s6s      4s7s      4s8s      4s9s      4s10s     4s11s
4s12s     4s13s     4s14s     d9s2 5s   d9s2 6s   d9s2 7s   d9s2 8s   d9s2 9s
d9s2 10s  d9s2 11s  d9s2 12s  d9s2 13s  d9s2 14s  4s4d      4s5d      4s6d
4s7d      4s8d      4s9d      4s10d     4s11d     4s12d     4s13d     4s14d
4s15d     d9s2 4d   d9s2 5d   d9s2 6d   d9s2 7d   d9s2 8d   d9s2 9d   d9s2 10d
d9s2 11d  d9s2 12d  d9s2 13d  d9s2 14d  4s5g      4s6g      4s7g      4s8g
4s9g      d9s2 5g   d9s2 6g   d9s2 7g   d9s2 8g   d9s2 9g   4s7i      4s8i
4s9i      d9s2 7i   d9s2 8i   d9s2 9i   d10 4p2
  -1.
   0.          0.000             4s2 1S                   4s2 1S
   0.      55789.213             4s5s 1S                  4s5s 1S
   0.      66037.667             4s6s 1S                  4s6s 1S
   0.      70003.738             4s7s 1S                  4s7s 1S
   0.      71956.21              4s8s 1S                  4s8s 1S
   0.      73060.65              4s9s 1S                  4s9s 1S
1  0.                            4s10s 1S                 4s10s 1S
1  0.                            4s11s 1S                 4s11s 1S
1  0.                            4s12s 1S                 4s12s 1S
1  0.                            4s13s 1S                 4s13s 1S
1  0.                            4s14s 1S                 4s14s 1S
   0.      80175.04              4p2 3P                   4p2 3P
1  0.                            4p2 1S                   4p2 1S
1  0.                            3d9.4s2.4d 3P            s2.4d 3P
1  0.                            3d9.4s2.4d 1S            s2.4d 1S
1  0.                            3d9.4s2.5d 3P            s2.5d 3P
1  0.                            3d9.4s2.6d 1S            s2.6d 1S
1  0.                            3d9.4s2.7d 1S            s2.7d 1S
1  0.                            3d9.4s2.6d 3P            s2.6d 3P
1  0.                            3d9.4s2.8d 1S            s2.8d 1S
1  0.                            3d9.4s2.9d 1S            s2.9d 1S
1  0.                            3d9.4s2.10d 1S           s2.10d 1S
1  0.                            3d9.4s2.11d 1S           s2.11d 1S
1  0.                            3d9.4s2.12d 1S           s2.12d 1S
1  0.                            3d9.4s2.13d 1S           s2.13d 1S
1  0.                            3d9.4s2.7d 3P            s2.7d 3P
1  0.                            3d9.4s2.14d 1S           s2.14d 1S
1  0.                            3d9.4s2.8d 3P            s2.8d 3P
1  0.                            3d9.4s2.9d 3P            s2.9d 3P
1  0.                            3d9.4s2.10d 3P           s2.10d 3P
1  0.                            3d9.4s2.11d 3P           s2.11d 3P
1  0.                            3d9.4s2.12d 3P           s2.12d 3P
1  0.                            3d9.4s2.13d 3P           s2.13d 3P
1  0.                            3d9.4s2.14d 3P           s2.14d 3P
1  0.                            3d9.4s2.5d 1S            s2.5d 1S
   1.      53672.240     2.001   4s5s 3S                  4s5s 3S
   1.      62768.747             4s4d 3D                  4s4d 3D
   1.      65432.291             4s6s 3S                  4s6s 3S
   1.      68579.141             4s5d 3D                  4s5d 3D
   1.      69745.969             4s7s 3S                  4s7s 3S
   1.      71212.140             4s6d 3D                  4s6d 3D
   1.      71822.5               4s8s 3S                  4s8s 3S
   1.      72627.9               4s7d 3D                  4s7d 3D
   1.      72985.4               4s9s 3S                  4s9s 3S
   1.      73471.1               4s8d 3D                  4s8d 3D
   1.      73698.6               4s10s 3S                 4s10s 3S
   1.      74016.7               4s9d 3D                  4s9d 3D
   1.      74169.0               4s11s 3S                 4s11s 3S
   1.      74386.4               4s10d 3D                 4s10d 3D
   1.      74495.8               4s12s 3S                 4s12s 3S
   1.      74651.6               4s11d 3D                 4s11d 3D
1  1.                            4s13s 3S                 4s13s 3S
   1.      74847.3               4s12d 3D                 4s12d 3D
   1.      74907.3               4s14s 3S                 4s14s 3S
   1.      74995.5               4s13d 3D                 4s13d 3D
   1.      75110.8               4s14d 3D                 4s14d 3D
   1.      75202.1               4s15d 3D                 4s15d 3D
   1.      80394.20              4p2 3P                   4p2 3P
1  1.                            3d9.4s2.5s 3D            s2.5s 3D
1  1.                            3d9.4s2.4d 3S            s2.4d 3S
1  1.                            3d9.4s2.4d 1P            s2.4d 1P
1  1.                            3d9.4s2.4d 3P            s2.4d 3P
1  1.                            3d9.4s2.4d 3D            s2.4d 3D
1  1.                            3d9.4s2.6s 3D            s2.6s 3D
1  1.                            3d9.4s2.5d 3S            s2.5d 3S
1  1.                            3d9.4s2.5d 1P            s2.5d 1P
1  1.                            3d9.4s2.5d 3P            s2.5d 3P
1  1.                            3d9.4s2.5d 3D            s2.5d 3D
1  1.                            3d9.4s2.6d 3S            s2.6d 3S
1  1.                            3d9.4s2.6d 1P            s2.6d 1P
1  1.                            3d9.4s2.5g 3D            s2.5g 3D
1  1.                            3d9.4s2.7s 3D            s2.7s 3D
1  1.                            3d9.4s2.7d 3S            s2.7d 3S
1  1.                            3d9.4s2.7d 1P            s2.7d 1P
1  1.                            3d9.4s2.6g 3D            s2.6g 3D
1  1.                            3d9.4s2.8d 3S            s2.8d 3S
1  1.                            3d9.4s2.8d 1P            s2.8d 1P
1  1.                            3d9.4s2.7g 3D            s2.7g 3D
1  1.                            3d9.4s2.6d 3P            s2.6d 3P
1  1.                            3d9.4s2.6d 3D            s2.6d 3D
1  1.                            3d9.4s2.9d 3S            s2.9d 3S
1  1.                            3d9.4s2.9d 1P            s2.9d 1P
1  1.                            3d9.4s2.8g 3D            s2.8g 3D
1  1.                            3d9.4s2.10d 3S           s2.10d 3S
1  1.                            3d9.4s2.10d 1P           s2.10d 1P
1  1.                            3d9.4s2.9g 3D            s2.9g 3D
1  1.                            3d9.4s2.8s 3D            s2.8s 3D
1  1.                            3d9.4s2.11d 3S           s2.11d 3S
1  1.                            3d9.4s2.11d 1P           s2.11d 1P
1  1.                            3d9.4s2.12d 3S           s2.12d 3S
1  1.                            3d9.4s2.12d 1P           s2.12d 1P
1  1.                            3d9.4s2.13d 3S           s2.13d 3S
1  1.                            3d9.4s2.13d 1P           s2.13d 1P
1  1.                            3d9.4s2.14d 3S           s2.14d 3S
1  1.                            3d9.4s2.14d 1P           s2.14d 1P
1  1.                            3d9.4s2.7d 3P            s2.7d 3P
1  1.                            3d9.4s2.7d 3D            s2.7d 3D
1  1.                            3d9.4s2.9s 3D            s2.9s 3D
1  1.                            3d9.4s2.8d 3S            s2.8d 3S
1  1.                            3d9.4s2.8d 3D            s2.8d 3D
1  1.                            3d9.4s2.10s 3D           s2.10s 3D
1  1.                            3d9.4s2.9d 3S            s2.9d 3S
1  1.                            3d9.4s2.9d 3D            s2.9d 3D
1  1.                            3d9.4s2.11s 3D           s2.11s 3D
1  1.                            3d9.4s2.10d 3P           s2.10d 3P
1  1.                            3d9.4s2.10d 3D           s2.10d 3D
1  1.                            3d9.4s2.12s 3D           s2.12s 3D
1  1.                            3d9.4s2.11d 3P           s2.11d 3P
1  1.                            3d9.4s2.11d 3D           s2.11d 3D
1  1.                            3d9.4s2.13s 3D           s2.13s 3D
1  1.                            3d9.4s2.12d 3P           s2.12d 3P
1  1.                            3d9.4s2.12d 3D           s2.12d 3D
1  1.                            3d9.4s2.14s 3D           s2.14s 3D
1  1.                            3d9.4s2.13d 3P           s2.13d 3P
1  1.                            3d9.4s2.13d 3D           s2.13d 3D
1  1.                            3d9.4s2.14d 3P           s2.14d 3P
1  1.                            3d9.4s2.14d 3D           s2.14d 3D
   2.      62478.533             4s4d 1D                  4s4d 1D
   2.      62772.014             4s4d 3D                  4s4d 3D
   2.      68338.524             4s5d 1D                  4s5d 1D
   2.      68580.765             4s5d 3D                  4s5d 3D
   2.      71050.47              4s6d 1D                  4s6d 1D
   2.      71212.973             4s6d 3D                  4s6d 3D
   2.      72516.98              4s7d 1D                  4s7d 1D
   2.      72627.9               4s7d 3D                  4s7d 3D
   2.      73395.42              4s8d 1D                  4s8d 1D
   2.      73471.1               4s8d 3D                  4s8d 3D
   2.      73961.89              4s9d 1D                  4s9d 1D
   2.      74016.7               4s9d 3D                  4s9d 3D
   2.      74348.18              4s10d 1D                 4s10d 1D
   2.      74387.7               4s10d 3D                 4s10d 3D
   2.      74622.77              4s11d 1D                 4s11d 1D
   2.      74651.3               4s11d 3D                 4s11d 3D
   2.      74825.05              4s12d 1D                 4s12d 1D
   2.      74855.1               4s12d 3D                 4s12d 3D
   2.      74978.20              4s13d 1D                 4s13d 1D
   2.      74994.0               4s13d 3D                 4s13d 3D
   2.      75097.09              4s14d 1D                 4s14d 1D
   2.      75112.2               4s14d 3D                 4s14d 3D
   2.      75191.06              4s15d 1D                 4s15d 1D
   2.      75202.1               4s15d 3D                 4s15d 3D
   2.      80792.1               4p2 3P                   4p2 3P
1  2.                            4p2 1D                   4p2 1D
1  2.                            3d9.4s2.5s 1D            s2.5s 1D
1  2.                            3d9.4s2.5s 3D            s2.5s 3D
1  2.                            3d9.4s2.4d 3P            s2.4d 3P
1  2.                            3d9.4s2.4d 1D            s2.4d 1D
1  2.                            3d9.4s2.4d 3D            s2.4d 3D
1  2.                            3d9.4s2.4d 3F            s2.4d 3F
1  2.                            3d9.4s2.6s 1D            s2.6s 1D
1  2.                            3d9.4s2.6s 3D            s2.6s 3D
1  2.                            3d9.4s2.5d 3P            s2.5d 3P
1  2.                            3d9.4s2.5d 1D            s2.5d 1D
1  2.                            3d9.4s2.7s 1D            s2.7s 1D
1  2.                            3d9.4s2.5d 3D            s2.5d 3D
1  2.                            3d9.4s2.5d 3F            s2.5d 3F
1  2.                            3d9.4s2.6d 3P            s2.6d 3P
1  2.                            3d9.4s2.6d 1D            s2.6d 1D
1  2.                            3d9.4s2.5g 3D            s2.5g 3D
1  2.                            3d9.4s2.5g 3F            s2.5g 3F
1  2.                            3d9.4s2.8s 1D            s2.8s 1D
1  2.                            3d9.4s2.7s 3D            s2.7s 3D
1  2.                            3d9.4s2.7d 3P            s2.7d 3P
1  2.                            3d9.4s2.7d 1D            s2.7d 1D
1  2.                            3d9.4s2.6g 3D            s2.6g 3D
1  2.                            3d9.4s2.6g 3F            s2.6g 3F
1  2.                            3d9.4s2.9s 1D            s2.9s 1D
1  2.                            3d9.4s2.8d 3P            s2.8d 3P
1  2.                            3d9.4s2.8d 1D            s2.8d 1D
1  2.                            3d9.4s2.7g 3D            s2.7g 3D
1  2.                            3d9.4s2.7g 3F            s2.7g 3F
1  2.                            3d9.4s2.6d 3D            s2.6d 3D
1  2.                            3d9.4s2.10s 1D           s2.10s 1D
1  2.                            3d9.4s2.6d 3F            s2.6d 3F
1  2.                            3d9.4s2.9d 3P            s2.9d 3P
1  2.                            3d9.4s2.9d 1D            s2.9d 1D
1  2.                            3d9.4s2.8g 3D            s2.8g 3D
1  2.                            3d9.4s2.8g 3F            s2.8g 3F
1  2.                            3d9.4s2.5g 1D            s2.5g 1D
1  2.                            3d9.4s2.11s 1D           s2.11s 1D
1  2.                            3d9.4s2.10d 3P           s2.10d 3P
1  2.                            3d9.4s2.10d 1D           s2.10d 1D
1  2.                            3d9.4s2.9g 3D            s2.9g 3D
1  2.                            3d9.4s2.9g 3F            s2.9g 3F
1  2.                            3d9.4s2.8s 3D            s2.8s 3D
1  2.                            3d9.4s2.12s 1D           s2.12s 1D
1  2.                            3d9.4s2.11d 3P           s2.11d 3P
1  2.                            3d9.4s2.11d 1D           s2.11d 1D
1  2.                            3d9.4s2.13s 1D           s2.13s 1D
1  2.                            3d9.4s2.12d 3P           s2.12d 3P
1  2.                            3d9.4s2.12d 1D           s2.12d 1D
1  2.                            3d9.4s2.14s 1D           s2.14s 1D
1  2.                            3d9.4s2.13d 3P           s2.13d 3P
1  2.                            3d9.4s2.13d 1D           s2.13d 1D
1  2.                            3d9.4s2.14d 3P           s2.14d 3P
1  2.                            3d9.4s2.14d 1D           s2.14d 1D
1  2.                            3d9.4s2.7d 3D            s2.7d 3D
1  2.                            3d9.4s2.7d 3F            s2.7d 3F
1  2.                            3d9.4s2.6g 1D            s2.6g 1D
1  2.                            3d9.4s2.9s 3D            s2.9s 3D
1  2.                            3d9.4s2.8d 3D            s2.8d 3D
1  2.                            3d9.4s2.8d 3F            s2.8d 3F
1  2.                            3d9.4s2.7g 1D            s2.7g 1D
1  2.                            3d9.4s2.10s 3D           s2.10s 3D
1  2.                            3d9.4s2.9d 3D            s2.9d 3D
1  2.                            3d9.4s2.9d 3F            s2.9d 3F
1  2.                            3d9.4s2.8g 1D            s2.8g 1D
1  2.                            3d9.4s2.11s 3D           s2.11s 3D
1  2.                            3d9.4s2.10d 3D           s2.10d 3D
1  2.                            3d9.4s2.10d 3F           s2.10d 3F
1  2.                            3d9.4s2.9g 1D            s2.9g 1D
1  2.                            3d9.4s2.12s 3D           s2.12s 3D
1  2.                            3d9.4s2.11d 3D           s2.11d 3D
1  2.                            3d9.4s2.11d 3F           s2.11d 3F
1  2.                            3d9.4s2.13s 3D           s2.13s 3D
1  2.                            3d9.4s2.12d 3D           s2.12d 3D
1  2.                            3d9.4s2.12d 3F           s2.12d 3F
1  2.                            3d9.4s2.14s 3D           s2.14s 3D
1  2.                            3d9.4s2.13d 3D           s2.13d 3D
1  2.                            3d9.4s2.13d 3F           s2.13d 3F
1  2.                            3d9.4s2.14d 3D           s2.14d 3D
1  2.                            3d9.4s2.14d 3F           s2.14d 3F
   3.      62776.981             4s4d 3D                  4s4d 3D
   3.      68583.083             4s5d 3D                  4s5d 3D
   3.      71214.243             4s6d 3D                  4s6d 3D
   3.      71373.8               4s5g 3G                  4s5g 3G
   3.      72627.9               4s7d 3D                  4s7d 3D
   3.      72710.2               4s6g 3G                  4s6g 3G
   3.      73471.1               4s8d 3D                  4d8d 3D
   3.      73517.0               4s7g 3G                  4s7g 3G
   3.      74016.7               4s9d 3D                  4s9d 3D
   3.      74041.                4s8g 3G                  4s8g 3G
   3.      74386.4               4s10d 3D                 4s10d 3D
1  3.                            4s9g 3G                  4s9g 3G
   3.      74651.3               4s11d 3D                 4s11d 3D
   3.      74855.1               4s12d 3D                 4s12d 3D
   3.      74994.0               4s13d 3D                 4s13d 3D
   3.      75112.2               4s14d 3D                 4s14d 3D
   3.      75202.1               4s15d 3D                 4s15d 3D
1  3.                            3d9.4s2.5s 3D            s2.5s 3D
1  3.                            3d9.4s2.4d 3D            s2.4d 3D
1  3.                            3d9.4s2.4d 1F            s2.4d 1F
1  3.                            3d9.4s2.4d 3G            s2.4d 3G
1  3.                            3d9.4s2.4d 3F            s2.4d 3F
1  3.                            3d9.4s2.6s 3D            s2.6s 3D
1  3.                            3d9.4s2.5d 3D            s2.5d 3D
1  3.                            3d9.4s2.5d 1F            s2.5d 1F
1  3.                            3d9.4s2.7s 3D            s2.7s 3D
1  3.                            3d9.4s2.5d 3G            s2.5d 3G
1  3.                            3d9.4s2.5d 3F            s2.5d 3F
1  3.                            3d9.4s2.6d 3D            s2.6d 3D
1  3.                            3d9.4s2.6d 1F            s2.6d 1F
1  3.                            3d9.4s2.5g 3G            s2.5g 3G
1  3.                            3d9.4s2.5g 3F            s2.5g 3F
1  3.                            3d9.4s2.8s 3D            s2.8s 3D
1  3.                            3d9.4s2.7d 3D            s2.7d 3D
1  3.                            3d9.4s2.7d 1F            s2.7d 1F
1  3.                            3d9.4s2.6g 3F            s2.6g 3F
1  3.                            3d9.4s2.6g 3G            s2.6g 3G
1  3.                            3d9.4s2.9s 3D            s2.9s 3D
1  3.                            3d9.4s2.8d 3D            s2.8d 3D
1  3.                            3d9.4s2.8d 1F            s2.8d 1F
1  3.                            3d9.4s2.7g 3F            s2.7g 3F
1  3.                            3d9.4s2.7g 3G            s2.7g 3G
1  3.                            3d9.4s2.7i 3G            s2.7i 3G
1  3.                            3d9.4s2.6d 3G            s2.6d 3G
1  3.                            3d9.4s2.10s 3D           s2.10s 3D
1  3.                            3d9.4s2.6d 3F            s2.6d 3F
1  3.                            3d9.4s2.9d 3D            s2.9d 3D
1  3.                            3d9.4s2.9d 1F            s2.9d 1F
1  3.                            3d9.4s2.8g 3F            s2.8g 3F
1  3.                            3d9.4s2.8g 3G            s2.8g 3G
1  3.                            3d9.4s2.8i 3G            s2.8i 3G
1  3.                            3d9.4s2.5g 3D            s2.5g 3D
1  3.                            3d9.4s2.5g 3G            s2.5g 3G
1  3.                            3d9.4s2.11s 3D           s2.11s 3D
1  3.                            3d9.4s2.10d 3D           s2.10d 3D
1  3.                            3d9.4s2.10d 1F           s2.10d 1F
1  3.                            3d9.4s2.9g 3F            s2.9g 3F
1  3.                            3d9.4s2.9g 3G            s2.9g 3G
1  3.                            3d9.4s2.9i 3G            s2.9i 3G
1  3.                            3d9.4s2.12s 3D           s2.12s 3D
1  3.                            3d9.4s2.11d 3D           s2.11d 3D
1  3.                            3d9.4s2.11d 1F           s2.11d 1F
1  3.                            3d9.4s2.13s 3D           s2.13s 3D
1  3.                            3d9.4s2.12d 3D           s2.12d 3D
1  3.                            3d9.4s2.12d 1F           s2.12d 1F
1  3.                            3d9.4s2.14s 3D           s2.14s 3D
1  3.                            3d9.4s2.13d 3D           s2.13d 3D
1  3.                            3d9.4s2.13d 1F           s2.13d 1F
1  3.                            3d9.4s2.14d 3D           s2.14d 3D
1  3.                            3d9.4s2.14d 1F           s2.14d 1F
1  3.                            3d9.4s2.7d 3G            s2.7d 3G
1  3.                            3d9.4s2.7d 3F            s2.7d 3F
1  3.                            3d9.4s2.6g 3D            s2.6g 3D
1  3.                            3d9.4s2.6g 3G            s2.6g 3G
1  3.                            3d9.4s2.8d 3G            s2.8d 3G
1  3.                            3d9.4s2.8d 3F            s2.8d 3F
1  3.                            3d9.4s2.7g 3D            s2.7g 3D
1  3.                            3d9.4s2.7g 3G            s2.7g 3G
1  3.                            3d9.4s2.9d 3G            s2.9d 3G
1  3.                            3d9.4s2.9d 3F            s2.9d 3F
1  3.                            3d9.4s2.8g 3D            s2.8g 3D
1  3.                            3d9.4s2.8g 3G            s2.8g 3G
1  3.                            3d9.4s2.10d 3G           s2.10d 3G
1  3.                            3d9.4s2.10d 3F           s2.10d 3F
1  3.                            3d9.4s2.9g 3D            s2.9g 3D
1  3.                            3d9.4s2.9g 3G            s2.9g 3G
1  3.                            3d9.4s2.11d 3G           s2.11d 3G
1  3.                            3d9.4s2.11d 3F           s2.11d 3F
1  3.                            3d9.4s2.12d 3G           s2.12d 3G
1  3.                            3d9.4s2.12d 3F           s2.12d 3F
1  3.                            3d9.4s2.13d 3G           s2.13d 3G
1  3.                            3d9.4s2.13d 3F           s2.13d 3F
1  3.                            3d9.4s2.14d 3G           s2.14d 3G
1  3.                            3d9.4s2.14d 3F           s2.14d 3F
   4.      71373.8               4s5g 3G                  4s5g 3G
   4.      71373.8               4s5g 1G                  4s5g 1G
   4.      72710.2               4s6g 3G                  4s6g 3G
   4.      72710.2               4s6g 1G                  4s6g 1G
   4.      73517.0               4s7g 3G                  4s7g 3G
   4.      73517.0               4s7g 1G                  4s7g 1G
   4.      74041.                4s8g 3G                  4s8g 3G
   4.      74041.                4s8g 1G                  4s8g 1G
1  4.                            4s9g 3G                  4s9g 3G
1  4.                            4s9g 1G                  4s9g 1G
1  4.                            3d9.4s2.4d 1G            s2.4d 1G
1  4.                            3d9.4s2.4d 3F            s2.4d 3F
1  4.                            3d9.4s2.4d 3G            s2.4d 3G
1  4.                            3d9.4s2.5d 1G            s2.5d 1G
1  4.                            3d9.4s2.5d 3F            s2.5d 3F
1  4.                            3d9.4s2.5d 3G            s2.5d 3G
1  4.                            3d9.4s2.6d 1G            s2.6d 1G
1  4.                            3d9.4s2.6d 3F            s2.6d 3F
1  4.                            3d9.4s2.5g 3F            s2.5g 3F
1  4.                            3d9.4s2.5g 1G            s2.5g 1G
1  4.                            3d9.4s2.7d 1G            s2.7d 1G
1  4.                            3d9.4s2.7d 3F            s2.7d 3F
1  4.                            3d9.4s2.6g 3F            s2.6g 3F
1  4.                            3d9.4s2.6g 1G            s2.6g 1G
1  4.                            3d9.4s2.8d 1G            s2.8d 1G
1  4.                            3d9.4s2.8d 3F            s2.8d 3F
1  4.                            3d9.4s2.7g 3F            s2.7g 3F
1  4.                            3d9.4s2.7g 1G            s2.7g 1G
1  4.                            3d9.4s2.7i 3G            s2.7i 3G
1  4.                            3d9.4s2.7i 3H            s2.7i 3H
1  4.                            3d9.4s2.6d 3G            s2.6d 3G
1  4.                            3d9.4s2.9d 1G            s2.9d 1G
1  4.                            3d9.4s2.9d 3F            s2.9d 3F
1  4.                            3d9.4s2.8g 3F            s2.8g 3F
1  4.                            3d9.4s2.8g 1G            s2.8g 1G
1  4.                            3d9.4s2.8i 3G            s2.8i 3G
1  4.                            3d9.4s2.8i 3H            s2.8i 3H
1  4.                            3d9.4s2.5g 3G            s2.5g 3G
1  4.                            3d9.4s2.5g 3H            s2.5g 3H
1  4.                            3d9.4s2.10d 1G           s2.10d 1G
1  4.                            3d9.4s2.10d 3F           s2.10d 3F
1  4.                            3d9.4s2.9g 3F            s2.9g 3F
1  4.                            3d9.4s2.9g 1G            s2.9g 1G
1  4.                            3d9.4s2.9i 3G            s2.9i 3G
1  4.                            3d9.4s2.9i 3H            s2.9i 3H
1  4.                            3d9.4s2.11d 1G           s2.11d 1G
1  4.                            3d9.4s2.11d 3F           s2.11d 3F
1  4.                            3d9.4s2.12d 1G           s2.12d 1G
1  4.                            3d9.4s2.12d 3F           s2.12d 3F
1  4.                            3d9.4s2.13d 1G           s2.13d 1G
1  4.                            3d9.4s2.13d 3F           s2.13d 3F
1  4.                            3d9.4s2.14d 1G           s2.14d 1G
1  4.                            3d9.4s2.14d 3F           s2.14d 3F
1  4.                            3d9.4s2.7d 3G            s2.7d 3G
1  4.                            3d9.4s2.6g 3G            s2.6g 3G
1  4.                            3d9.4s2.6g 3H            s2.6g 3H
1  4.                            3d9.4s2.8d 3G            s2.8d 3G
1  4.                            3d9.4s2.7g 3G            s2.7g 3G
1  4.                            3d9.4s2.7g 3H            s2.7g 3H
1  4.                            3d9.4s2.7i 1G            s2.7i 1G
1  4.                            3d9.4s2.9d 3G            s2.9d 3G
1  4.                            3d9.4s2.8g 3G            s2.8g 3G
1  4.                            3d9.4s2.8g 3H            s2.8g 3H
1  4.                            3d9.4s2.8i 1G            s2.8i 1G
1  4.                            3d9.4s2.10d 3G           s2.10d 3G
1  4.                            3d9.4s2.9g 3G            s2.9g 3G
1  4.                            3d9.4s2.9g 3H            s2.9g 3H
1  4.                            3d9.4s2.9i 1G            s2.9i 1G
1  4.                            3d9.4s2.11d 3G           s2.11d 3G
1  4.                            3d9.4s2.12d 3G           s2.12d 3G
1  4.                            3d9.4s2.13d 3G           s2.13d 3G
1  4.                            3d9.4s2.14d 3G           s2.14d 3G
   5.      71373.8               4s5g 3G                  4s5g 3G
   5.      72710.2               4s6g 3G                  4s6g 3G
   5.      73517.0               4s7g 3G                  4s7g 3G
   5.      73554.8               4s7i 3I                  4s7i 3I
   5.      74041.                4s8g 3G                  4s8g 3G
   5.      74066.3               4s8i 3I                  4s8i 3I
1  5.                            4s9g 3G                  4s9g 3G
1  5.                            4s9i 3I                  4s9i 3I
1  5.                            3d9.4s2.4d 3G            s2.4d 3G
1  5.                            3d9.4s2.5d 3G            s2.5d 3G
1  5.                            3d9.4s2.6d 3G            s2.6d 3G
1  5.                            3d9.4s2.5g 1H            s2.5g 1H
1  5.                            3d9.4s2.5g 3G            s2.5g 3G
1  5.                            3d9.4s2.7d 3G            s2.7d 3G
1  5.                            3d9.4s2.6g 1H            s2.6g 1H
1  5.                            3d9.4s2.6g 3G            s2.6g 3G
1  5.                            3d9.4s2.8d 3G            s2.8d 3G
1  5.                            3d9.4s2.7g 1H            s2.7g 1H
1  5.                            3d9.4s2.7g 3G            s2.7g 3G
1  5.                            3d9.4s2.7i 3H            s2.7i 3H
1  5.                            3d9.4s2.7i 3I            s2.7i 3I
1  5.                            3d9.4s2.9d 3G            s2.9d 3G
1  5.                            3d9.4s2.8g 1H            s2.8g 1H
1  5.                            3d9.4s2.8g 3G            s2.8g 3G
1  5.                            3d9.4s2.8i 3H            s2.8i 3H
1  5.                            3d9.4s2.8i 3I            s2.8i 3I
1  5.                            3d9.4s2.5g 3I            s2.5g 3I
1  5.                            3d9.4s2.5g 3H            s2.5g 3H
1  5.                            3d9.4s2.10d 3G           s2.10d 3G
1  5.                            3d9.4s2.9g 1H            s2.9g 1H
1  5.                            3d9.4s2.9g 3G            s2.9g 3G
1  5.                            3d9.4s2.9i 3H            s2.9i 3H
1  5.                            3d9.4s2.9i 3I            s2.9i 3I
1  5.                            3d9.4s2.11d 3G           s2.11d 3G
1  5.                            3d9.4s2.12d 3G           s2.12d 3G
1  5.                            3d9.4s2.13d 3G           s2.13d 3G
1  5.                            3d9.4s2.14d 3G           s2.14d 3G
1  5.                            3d9.4s2.6g 3I            s2.6g 3I
1  5.                            3d9.4s2.6g 3H            s2.6g 3H
1  5.                            3d9.4s2.7g 3I            s2.7g 3I
1  5.                            3d9.4s2.7g 3H            s2.7g 3H
1  5.                            3d9.4s2.7i 3G            s2.7i 3G
1  5.                            3d9.4s2.7i 3I            s2.7i 3I
1  5.                            3d9.4s2.8g 3I            s2.8g 3I
1  5.                            3d9.4s2.8g 3H            s2.8g 3H
1  5.                            3d9.4s2.8i 3G            s2.8i 3G
1  5.                            3d9.4s2.8i 3I            s2.8i 3I
1  5.                            3d9.4s2.9g 3I            s2.9g 3I
1  5.                            3d9.4s2.9g 3H            s2.9g 3H
1  5.                            3d9.4s2.9i 3G            s2.9i 3G
1  5.                            3d9.4s2.9i 3I            s2.9i 3I
   6.      73554.8               4s7i 1I                  4s7i 1I
   6.      73554.8               4s7i 3I                  4s7i 3I
   6.      74066.3               4s8i 1I                  4s8i 1I
   6.      74066.3               4s8i 3I                  4s8i 3I
1  6.                            4s9i 1I                  4s9i 1I
1  6.                            4s9i 3I                  4s9i 3I
1  6.                            3d9.4s2.5g 1I            s2.5g 1I
1  6.                            3d9.4s2.5g 3H            s2.5g 3H
1  6.                            3d9.4s2.6g 1I            s2.6g 1I
1  6.                            3d9.4s2.6g 3H            s2.6g 3H
1  6.                            3d9.4s2.7g 1I            s2.7g 1I
1  6.                            3d9.4s2.7g 3H            s2.7g 3H
1  6.                            3d9.4s2.7i 3H            s2.7i 3H
1  6.                            3d9.4s2.7i 1I            s2.7i 1I
1  6.                            3d9.4s2.8g 1I            s2.8g 1I
1  6.                            3d9.4s2.8g 3H            s2.8g 3H
1  6.                            3d9.4s2.8i 3H            s2.8i 3H
1  6.                            3d9.4s2.8i 1I            s2.8i 1I
1  6.                            3d9.4s2.5g 3I            s2.5g 3I
1  6.                            3d9.4s2.9g 1I            s2.9g 1I
1  6.                            3d9.4s2.9g 3H            s2.9g 3H
1  6.                            3d9.4s2.9i 3H            s2.9i 3H
1  6.                            3d9.4s2.9i 1I            s2.9i 1I
1  6.                            3d9.4s2.6g 3I            s2.6g 3I
1  6.                            3d9.4s2.7g 3I            s2.7g 3I
1  6.                            3d9.4s2.7i 3I            s2.7i 3I
1  6.                            3d9.4s2.7i 3K            s2.7i 3K
1  6.                            3d9.4s2.8g 3I            s2.8g 3I
1  6.                            3d9.4s2.8i 3I            s2.8i 3I
1  6.                            3d9.4s2.8i 3K            s2.8i 3K
1  6.                            3d9.4s2.9g 3I            s2.9g 3I
1  6.                            3d9.4s2.9i 3I            s2.9i 3I
1  6.                            3d9.4s2.9i 3K            s2.9i 3K
   7.      73554.8               4s7i 3I                  4s7i 3I
   7.      74066.3               4s8i 3I                  4s8i 3I
1  7.                            4s9i 3I                  4s9i 3I
1  7.                            3d9.4s2.5g 3I            s2.5g 3I
1  7.                            3d9.4s2.6g 3I            s2.6g 3I
1  7.                            3d9.4s2.7g 3I            s2.7g 3I
1  7.                            3d9.4s2.7i 1K            s2.7i 1K
1  7.                            3d9.4s2.7i 3I            s2.7i 3I
1  7.                            3d9.4s2.8g 3I            s2.8g 3I
1  7.                            3d9.4s2.8i 1K            s2.8i 1K
1  7.                            3d9.4s2.8i 3I            s2.8i 3I
1  7.                            3d9.4s2.9g 3I            s2.9g 3I
1  7.                            3d9.4s2.9i 1K            s2.9i 1K
1  7.                            3d9.4s2.9i 3I            s2.9i 3I
1  7.                            3d9.4s2.7i 3L            s2.7i 3L
1  7.                            3d9.4s2.7i 3K            s2.7i 3K
1  7.                            3d9.4s2.8i 3L            s2.8i 3L
1  7.                            3d9.4s2.8i 3K            s2.8i 3K
1  7.                            3d9.4s2.9i 3L            s2.9i 3L
1  7.                            3d9.4s2.9i 3K            s2.9i 3K
1  8.                            3d9.4s2.7i 1L            s2.7i 1L
1  8.                            3d9.4s2.7i 3K            s2.7i 3K
1  8.                            3d9.4s2.8i 1L            s2.8i 1L
1  8.                            3d9.4s2.8i 3K            s2.8i 3K
1  8.                            3d9.4s2.9i 1L            s2.9i 1L
1  8.                            3d9.4s2.9i 3K            s2.9i 3K
1  8.                            3d9.4s2.7i 3L            s2.7i 3L
1  8.                            3d9.4s2.8i 3L            s2.8i 3L
1  8.                            3d9.4s2.9i 3L            s2.9i 3L
1  9.                            3d9.4s2.7i 3L            s2.7i 3L
1  9.                            3d9.4s2.8i 3L            s2.8i 3L
1  9.                            3d9.4s2.9i 3L            s2.9i 3L
 3098       1.4   47      LEAST SQUARES
   1    1  EAV         7552.6     1.    8000.0             1.000  0    6900.0  0             4s2       
   2    2  EAV        54371.8     1.   47203.4             1.000  0    6900.0  0             4s5s      
   3    2  G0(24)      1320.0     1.    2339.5             0.800  0       0.0  0                       
   4    3  EAV        65594.6     1.   58726.5             1.000  0    6900.0  0             4s6s      
   5    3  G0(25)       343.4     1.     701.0             0.800  0       0.0  0                       
   6    4  EAV        69804.9     1.   62944.2             1.000  0    6900.0  0             4s7s      
   7    4  G0(25)       134.4     1.     305.1             0.800  0       0.0  0                       
   8    5  EAV        71848.6     1.   64983.9             1.000  0    6900.0  0             4s8s      
   9    5  G0(25)        63.9     1.     160.4             0.800  0       0.0  0                       
  10    6  EAV        72997.4     1.   66127.5             1.000  0    6900.0  0             4s9s      
  11    6  G0(25)        32.3     1.      94.8             0.800  0       0.0  0                       
  12    7  EAV        73704.7     1.   66832.2             1.000  0    6900.0  0             4s10s     
  13    7  G0(25)        18.2     0.      60.7 FIXEDHF     0.300  0       0.0  0                       
  14    8  EAV        74172.9     1.   67297.9             1.000  0    6900.0  0             4s11s     
  15    8  G0(25)        12.4     0.      41.2 FIXEDHF     0.300  0       0.0  0                       
  16    9  EAV        74498.4     1.   67621.6             1.000  0    6900.0  0             4s12s     
  17    9  G0(25)         8.8     0.      29.3 FIXEDHF     0.300  0       0.0  0                       
  18    A  EAV        74733.7     0.   67855.7 FIXEDHF     1.000  0    6878.0  0             4s13s     
  19    A  G0(25)         6.5     0.      21.5 FIXEDHF     0.300  0       0.0  0                       
  20    B  EAV        74908.4     1.   68030.2             1.000  0    6900.0  0             4s14s     
  21    B  G0(25)         4.9     0.      16.3 FIXEDHF     0.300  0       0.0  0                       
  22    C  EAV       115819.2     0.  100819.2 FIXEDHF     1.000  0   15000.0  0             d9s2 5s   
  23    C  ZETA 1      1084.5     0.    1084.5 FIXEDHF     1.000  0       0.0  0                       
  24    C  G2(14)       635.9     0.     794.9 FIXEDHF     0.800  0       0.0  0                       
  25    D  EAV       128768.4     0.  113768.4 FIXEDHF     1.000  0   15000.0  0             d9s2 6s   
  26    D  ZETA 1      1084.9     0.    1084.9 FIXEDHF     1.000  0       0.0  0                       
  27    D  G2(15)       209.2     0.     261.5 FIXEDHF     0.800  0       0.0  0                       
  28    E  EAV       133324.4     0.  118324.4 FIXEDHF     1.000  0   15000.0  0             d9s2 7s   
  29    E  ZETA 1      1085.0     0.    1085.0 FIXEDHF     1.000  0       0.0  0                       
  30    E  G2(15)        93.9     0.     117.4 FIXEDHF     0.800  0       0.0  0                       
  31    F  EAV       135487.8     0.  120487.8 FIXEDHF     1.000  0   15000.0  0             d9s2 8s   
  32    F  ZETA 1      1085.0     0.    1085.0 FIXEDHF     1.000  0       0.0  0                       
  33    F  G2(15)        50.1     0.      62.6 FIXEDHF     0.800  0       0.0  0                       
  34    G  EAV       136687.3     0.  121687.3 FIXEDHF     1.000  0   15000.0  0             d9s2 9s   
  35    G  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  36    G  G2(15)        29.8     0.      37.2 FIXEDHF     0.800  0       0.0  0                       
  37    H  EAV       137420.9     0.  122420.9 FIXEDHF     1.000  0   15000.0  0             d9s2 10s  
  38    H  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  39    H  G2(15)        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0                       
  40    I  EAV       137903.0     0.  122903.0 FIXEDHF     1.000  0   15000.0  0             d9s2 11s  
  41    I  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  42    I  G2(15)        13.0     0.      16.3 FIXEDHF     0.800  0       0.0  0                       
  43    J  EAV       138237.3     0.  123237.3 FIXEDHF     1.000  0   15000.0  0             d9s2 12s  
  44    J  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  45    J  G2(15)         9.3     0.      11.6 FIXEDHF     0.800  0       0.0  0                       
  46    K  EAV       138477.8     0.  123477.8 FIXEDHF     1.000  0   15000.0  0             d9s2 13s  
  47    K  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  48    K  G2(15)         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0                       
  49    L  EAV       138656.8     0.  123656.8 FIXEDHF     1.000  0   15000.0  0             d9s2 14s  
  50    L  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  51    L  G2(15)         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0                       
  52    M  EAV        62890.0     1.   55661.4             1.000  0    6900.0  0             4s4d      
  53    M  ZETA 6         3.3     1.       3.3             1.000  0       0.0  0                       
  54    M  G2(26)      1141.0     4.    1019.3             0.800  0       0.0  0                       
  55    N  EAV        68634.8     1.   61621.8             1.000  0    6900.0  0             4s5d      
  56    N  ZETA 6         1.6     1.       1.9             1.000  0       0.0  0                       
  57    N  G2(26)       526.1     4.     559.8             0.800  0       0.0  0                       
  58    O  EAV        71239.5     1.   64293.6             1.000  0    6900.0  0             4s6d      
  59    O  ZETA 6         0.8     1.       1.1             1.000  0       0.0  0                       
  60    O  G2(26)       260.6     4.     318.4             0.800  0       0.0  0                       
  61    P  EAV        72641.3     1.   65723.1             1.000  0    6900.0  0             4s7d      
  62    P  ZETA 6         0.7     0.       0.7 FIXEDHF     1.000  0       0.0  0                       
  63    P  G2(26)       132.5     4.     194.9             0.800  0       0.0  0                       
  64    Q  EAV        73478.6     1.   66576.7             1.000  0    6900.0  0             4s8d      
  65    Q  ZETA 6         0.5     0.       0.5 FIXEDHF     1.000  0       0.0  0                       
  66    Q  G2(26)        74.7     4.     127.0             0.800  0       0.0  0                       
  67    R  EAV        74020.7     1.   67126.1             1.000  0    6900.0  0             4s9d      
  68    R  ZETA 6         0.3     0.       0.3 FIXEDHF     1.000  0       0.0  0                       
  69    R  G2(26)        40.5     4.      87.0             0.800  0       0.0  0                       
  70    S  EAV        74389.5     1.   67500.6             1.000  0    6900.0  0             4s10d     
  71    S  ZETA 6         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0                       
  72    S  G2(26)        27.1     4.      61.9             0.400  0       0.0  0                       
  73    T  EAV        74653.1     1.   67767.0             1.000  0    6900.0  0             4s11d     
  74    T  ZETA 6         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0                       
  75    T  G2(26)        17.2     4.      45.7             0.400  0       0.0  0                       
  76    U  EAV        74852.2     1.   67963.5             1.000  0    6900.0  0             4s12d     
  77    U  ZETA 6         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
  78    U  G2(26)        12.1     0.      34.6 FIXEDHF     0.350  0       0.0  0                       
  79    V  EAV        74995.3     1.   68112.3             1.000  0    6900.0  0             4s13d     
  80    V  ZETA 6         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
  81    V  G2(26)         8.3     4.      26.8             0.400  0       0.0  0                       
  82    W  EAV        75111.8     1.   68228.2             1.000  0    6900.0  0             4s14d     
  83    W  ZETA 6         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
  84    W  G2(26)         6.4     0.      21.2 FIXED       0.400  0       0.0  0                       
  85    X  EAV        75202.1     1.   68319.8             1.000  0    6900.0  0             4s15d     
  86    X  ZETA 6         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
  87    X  G2(26)         5.1     0.      17.0 FIXED       0.400  0       0.0  0                       
  88    Y  EAV       125624.4     0.  110624.4 FIXEDHF     1.000  0   15000.0  0             d9s2 4d   
  89    Y  ZETA 1      1084.7     0.    1084.7 FIXEDHF     1.000  0       0.0  0                       
  90    Y  ZETA 6         5.3     0.       5.3 FIXEDHF     1.000  0       0.0  0                       
  91    Y  F2(16)       808.8     0.    1011.0 FIXEDHF     0.800  0       0.0  0                       
  92    Y  F4(16)       296.0     0.     370.0 FIXEDHF     0.800  0       0.0  0                       
  93    Y  G0(16)       725.8     0.     907.2 FIXEDHF     0.800  0       0.0  0                       
  94    Y  G2(16)       398.2     0.     497.8 FIXEDHF     0.800  0       0.0  0                       
  95    Y  G4(16)       256.8     0.     321.0 FIXEDHF     0.800  0       0.0  0                       
  96    Z  EAV       131880.9     0.  116880.9 FIXEDHF     1.000  0   15000.0  0             d9s2 5d   
  97    Z  ZETA 1      1084.9     0.    1084.9 FIXEDHF     1.000  0       0.0  0                       
  98    Z  ZETA 6         3.0     0.       3.0 FIXEDHF     1.000  0       0.0  0                       
  99    Z  F2(16)       405.7     0.     507.1 FIXEDHF     0.800  0       0.0  0                       
 100    Z  F4(16)       166.0     0.     207.5 FIXEDHF     0.800  0       0.0  0                       
 101    Z  G0(16)       403.1     0.     503.9 FIXEDHF     0.800  0       0.0  0                       
 102    Z  G2(16)       224.3     0.     280.4 FIXEDHF     0.800  0       0.0  0                       
 103    Z  G4(16)       145.1     0.     181.4 FIXEDHF     0.800  0       0.0  0                       
 104    a  EAV       134720.7     0.  119720.7 FIXEDHF     1.000  0   15000.0  0             d9s2 6d   
 105    a  ZETA 1      1085.0     0.    1085.0 FIXEDHF     1.000  0       0.0  0                       
 106    a  ZETA 6         1.7     0.       1.7 FIXEDHF     1.000  0       0.0  0                       
 107    a  F2(16)       223.9     0.     279.9 FIXEDHF     0.800  0       0.0  0                       
 108    a  F4(16)        95.4     0.     119.2 FIXEDHF     0.800  0       0.0  0                       
 109    a  G0(16)       230.2     0.     287.8 FIXEDHF     0.800  0       0.0  0                       
 110    a  G2(16)       128.9     0.     161.1 FIXEDHF     0.800  0       0.0  0                       
 111    a  G4(16)        83.5     0.     104.4 FIXEDHF     0.800  0       0.0  0                       
 112    b  EAV       136233.9     0.  121233.9 FIXEDHF     1.000  0   15000.0  0             d9s2 7d   
 113    b  ZETA 1      1085.0     0.    1085.0 FIXEDHF     1.000  0       0.0  0                       
 114    b  ZETA 6         1.1     0.       1.1 FIXEDHF     1.000  0       0.0  0                       
 115    b  F2(16)       134.8     0.     168.5 FIXEDHF     0.800  0       0.0  0                       
 116    b  F4(16)        58.6     0.      73.2 FIXEDHF     0.800  0       0.0  0                       
 117    b  G0(16)       140.9     0.     176.1 FIXEDHF     0.800  0       0.0  0                       
 118    b  G2(16)        79.2     0.      99.0 FIXEDHF     0.800  0       0.0  0                       
 119    b  G4(16)        51.4     0.      64.2 FIXEDHF     0.800  0       0.0  0                       
 120    c  EAV       137132.9     0.  122132.9 FIXEDHF     1.000  0   15000.0  0             d9s2 8d   
 121    c  ZETA 1      1085.0     0.    1085.0 FIXEDHF     1.000  0       0.0  0                       
 122    c  ZETA 6         0.7     0.       0.7 FIXEDHF     1.000  0       0.0  0                       
 123    c  F2(16)        86.9     0.     108.6 FIXEDHF     0.800  0       0.0  0                       
 124    c  F4(16)        38.2     0.      47.7 FIXEDHF     0.800  0       0.0  0                       
 125    c  G0(16)        91.7     0.     114.6 FIXEDHF     0.800  0       0.0  0                       
 126    c  G2(16)        51.6     0.      64.5 FIXEDHF     0.800  0       0.0  0                       
 127    c  G4(16)        33.5     0.      41.9 FIXEDHF     0.800  0       0.0  0                       
 128    d  EAV       137709.1     0.  122709.1 FIXEDHF     1.000  0   15000.0  0             d9s2 9d   
 129    d  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 130    d  ZETA 6         0.5     0.       0.5 FIXEDHF     1.000  0       0.0  0                       
 131    d  F2(16)        59.0     0.      73.8 FIXEDHF     0.800  0       0.0  0                       
 132    d  F4(16)        26.2     0.      32.7 FIXEDHF     0.800  0       0.0  0                       
 133    d  G0(16)        62.7     0.      78.4 FIXEDHF     0.800  0       0.0  0                       
 134    d  G2(16)        35.4     0.      44.2 FIXEDHF     0.800  0       0.0  0                       
 135    d  G4(16)        23.0     0.      28.7 FIXEDHF     0.800  0       0.0  0                       
 136    e  EAV       138099.7     0.  123099.7 FIXEDHF     1.000  0   15000.0  0             d9s2 10d  
 137    e  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 138    e  ZETA 6         0.3     0.       0.3 FIXEDHF     1.000  0       0.0  0                       
 139    e  F2(16)        41.8     0.      52.3 FIXEDHF     0.800  0       0.0  0                       
 140    e  F4(16)        18.6     0.      23.3 FIXEDHF     0.800  0       0.0  0                       
 141    e  G0(16)        44.6     0.      55.8 FIXEDHF     0.800  0       0.0  0                       
 142    e  G2(16)        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0                       
 143    e  G4(16)        16.4     0.      20.5 FIXEDHF     0.800  0       0.0  0                       
 144    f  EAV       138377.1     0.  123377.1 FIXEDHF     1.000  0   15000.0  0             d9s2 11d  
 145    f  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 146    f  ZETA 6         0.3     0.       0.3 FIXEDHF     1.000  0       0.0  0                       
 147    f  F2(16)        30.7     0.      38.4 FIXEDHF     0.800  0       0.0  0                       
 148    f  F4(16)        13.8     0.      17.2 FIXEDHF     0.800  0       0.0  0                       
 149    f  G0(16)        32.9     0.      41.1 FIXEDHF     0.800  0       0.0  0                       
 150    f  G2(16)        18.6     0.      23.2 FIXEDHF     0.800  0       0.0  0                       
 151    f  G4(16)        12.1     0.      15.1 FIXEDHF     0.800  0       0.0  0                       
 152    g  EAV       138580.8     0.  123580.8 FIXEDHF     1.000  0   15000.0  0             d9s2 12d  
 153    g  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 154    g  ZETA 6         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0                       
 155    g  F2(16)        23.2     0.      29.0 FIXEDHF     0.800  0       0.0  0                       
 156    g  F4(16)        10.4     0.      13.0 FIXEDHF     0.800  0       0.0  0                       
 157    g  G0(16)        24.9     0.      31.1 FIXEDHF     0.800  0       0.0  0                       
 158    g  G2(16)        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0                       
 159    g  G4(16)         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
 160    h  EAV       138735.0     0.  123735.0 FIXEDHF     1.000  0   15000.0  0             d9s2 13d  
 161    h  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 162    h  ZETA 6         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0                       
 163    h  F2(16)        17.9     0.      22.4 FIXEDHF     0.800  0       0.0  0                       
 164    h  F4(16)         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
 165    h  G0(16)        19.3     0.      24.1 FIXEDHF     0.800  0       0.0  0                       
 166    h  G2(16)        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0                       
 167    h  G4(16)         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0                       
 168    i  EAV       138854.6     0.  123854.6 FIXEDHF     1.000  0   15000.0  0             d9s2 14d  
 169    i  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 170    i  ZETA 6         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
 171    i  F2(16)        14.2     0.      17.7 FIXEDHF     0.800  0       0.0  0                       
 172    i  F4(16)         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
 173    i  G0(16)        15.2     0.      19.0 FIXEDHF     0.800  0       0.0  0                       
 174    i  G2(16)         8.6     0.      10.8 FIXEDHF     0.800  0       0.0  0                       
 175    i  G4(16)         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
 176    j  EAV        71373.8     1.   64494.4             1.000  0    6900.0  0             4s5g      
 177    j  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 178    j  G4(27)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 179    k  EAV        72710.2     1.   65836.4             1.000  0    6900.0  0             4s6g      
 180    k  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 181    k  G4(27)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 182    l  EAV        73517.0     1.   66646.1             1.000  0    6900.0  0             4s7g      
 183    l  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 184    l  G4(27)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 185    m  EAV        74041.0     1.   67171.5             1.000  0    6900.0  0             4s8g      
 186    m  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 187    m  G4(27)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 188    n  EAV        74431.8     0.   67531.8 FIXEDHF     1.000  0    6900.0  0             4s9g      
 189    n  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 190    n  G4(27)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 191    o  EAV       135135.0     0.  120135.0 FIXEDHF     1.000  0   15000.0  0             d9s2 5g   
 192    o  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 193    o  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 194    o  F2(17)        13.8     0.      17.2 FIXEDHF     0.800  0       0.0  0                       
 195    o  F4(17)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 196    o  G2(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 197    o  G4(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 198    o  G6(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 199    p  EAV       136476.4     0.  121476.4 FIXEDHF     1.000  0   15000.0  0             d9s2 6g   
 200    p  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 201    p  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 202    p  F2(17)         8.0     0.      10.0 FIXEDHF     0.800  0       0.0  0                       
 203    p  F4(17)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 204    p  G2(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 205    p  G4(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 206    p  G6(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 207    q  EAV       137286.1     0.  122286.1 FIXEDHF     1.000  0   15000.0  0             d9s2 7g   
 208    q  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 209    q  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 210    q  F2(17)         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0                       
 211    q  F4(17)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 212    q  G2(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 213    q  G4(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 214    q  G6(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 215    r  EAV       137811.4     0.  122811.4 FIXEDHF     1.000  0   15000.0  0             d9s2 8g   
 216    r  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 217    r  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 218    r  F2(17)         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
 219    r  F4(17)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 220    r  G2(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 221    r  G4(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 222    r  G6(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 223    s  EAV       138171.7     0.  123171.7 FIXEDHF     1.000  0   15000.0  0             d9s2 9g   
 224    s  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 225    s  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 226    s  F2(17)         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
 227    s  F4(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 228    s  G2(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 229    s  G4(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 230    s  G6(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 231    t  EAV        73554.8     1.   66648.3             1.000  0    6900.0  0             4s7i      
 232    t  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 233    t  G6(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 234    u  EAV        74066.3     1.   67173.4             1.000  0    6900.0  0             4s8i      
 235    u  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 236    u  G6(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 237    v  EAV        74433.4     0.   67533.4 FIXEDHF     1.000  0    6900.0  0             4s9i      
 238    v  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 239    v  G6(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 240    w  EAV       137288.7     0.  122288.7 FIXEDHF     1.000  0   15000.0  0             d9s2 7i   
 241    w  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 242    w  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 243    w  F2(18)         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
 244    w  F4(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 245    w  G4(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 246    w  G6(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 247    w  G8(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 248    x  EAV       137813.4     0.  122813.4 FIXEDHF     1.000  0   15000.0  0             d9s2 8i   
 249    x  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 250    x  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 251    x  F2(18)         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
 252    x  F4(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 253    x  G4(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 254    x  G6(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 255    x  G8(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 256    y  EAV       138173.3     0.  123173.3 FIXEDHF     1.000  0   15000.0  0             d9s2 9i   
 257    y  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 258    y  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 259    y  F2(18)         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
 260    y  F4(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 261    y  G4(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 262    y  G6(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 263    y  G8(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 264    z  EAV        83113.5     1.   74035.9             1.000  0    9000.0  0             d10 4p2   
 265    z  F2(33)     20955.4     0.   26194.2 FIXEDHF     0.800  0       0.0  0                       
 266    z  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 267    z  ZETA 3       405.1     1.     451.6             1.000  0       0.0  0                       
 268    12 0D2224      2316.2     0.    2895.3 FIXEDHF     0.800  0       0.0  0  4s2       -4s5s      
 269    13 0D2225      1238.6     0.    1548.2 FIXEDHF     0.800  0       0.0  0  4s2       -4s6s      
 270    14 0D2225       808.1     0.    1010.1 FIXEDHF     0.800  0       0.0  0  4s2       -4s7s      
 271    15 0D2225       582.3     0.     727.9 FIXEDHF     0.800  0       0.0  0  4s2       -4s8s      
 272    16 0D2225       445.9     0.     557.4 FIXEDHF     0.800  0       0.0  0  4s2       -4s9s      
 273    17 0D2225       356.0     0.     445.0 FIXEDHF     0.800  0       0.0  0  4s2       -4s10s     
 274    18 0D2225       292.9     0.     366.1 FIXEDHF     0.800  0       0.0  0  4s2       -4s11s     
 275    19 0D2225       246.5     0.     308.1 FIXEDHF     0.800  0       0.0  0  4s2       -4s12s     
 276    1A 0D2225       211.3     0.     264.1 FIXEDHF     0.800  0       0.0  0  4s2       -4s13s     
 277    1B 0D2225       183.8     0.     229.7 FIXEDHF     0.800  0       0.0  0  4s2       -4s14s     
 278    1C 2D1114       315.1     0.     393.9 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 5s   
 279    1D 2D1115       191.4     0.     239.3 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 6s   
 280    1E 2D1115       130.9     0.     163.6 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 7s   
 281    1F 2D1115        96.4     0.     120.5 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 8s   
 282    1G 2D1115        74.7     0.      93.4 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 9s   
 283    1H 2D1115        60.2     0.      75.2 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 10s  
 284    1I 2D1115        49.7     0.      62.1 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 11s  
 285    1J 2D1115        42.0     0.      52.5 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 12s  
 286    1K 2D1115        36.1     0.      45.1 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 13s  
 287    1L 2D1115        31.4     0.      39.3 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 14s  
 288    1Y 0D1116       855.7     0.    1069.6 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 4d   
 289    1Y 2D1116      5569.0     0.    6961.3 FIXEDHF     0.800  0       0.0  0                       
 290    1Y 4D1116      3534.7     0.    4418.4 FIXEDHF     0.800  0       0.0  0                       
 291    1Z 0D1116       637.4     0.     796.8 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 5d   
 292    1Z 2D1116      4158.9     0.    5198.6 FIXEDHF     0.800  0       0.0  0                       
 293    1Z 4D1116      2644.3     0.    3305.4 FIXEDHF     0.800  0       0.0  0                       
 294    1a 0D1116       481.6     0.     602.0 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 6d   
 295    1a 2D1116      3145.6     0.    3932.0 FIXEDHF     0.800  0       0.0  0                       
 296    1a 4D1116      2001.6     0.    2502.0 FIXEDHF     0.800  0       0.0  0                       
 297    1b 0D1116       376.7     0.     470.9 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 7d   
 298    1b 2D1116      2461.9     0.    3077.4 FIXEDHF     0.800  0       0.0  0                       
 299    1b 4D1116      1567.2     0.    1959.0 FIXEDHF     0.800  0       0.0  0                       
 300    1c 0D1116       303.8     0.     379.8 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 8d   
 301    1c 2D1116      1986.4     0.    2483.0 FIXEDHF     0.800  0       0.0  0                       
 302    1c 4D1116      1264.9     0.    1581.1 FIXEDHF     0.800  0       0.0  0                       
 303    1d 0D1116       251.3     0.     314.1 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 9d   
 304    1d 2D1116      1643.2     0.    2054.0 FIXEDHF     0.800  0       0.0  0                       
 305    1d 4D1116      1046.5     0.    1308.1 FIXEDHF     0.800  0       0.0  0                       
 306    1e 0D1116       212.1     0.     265.1 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 10d  
 307    1e 2D1116      1387.0     0.    1733.8 FIXEDHF     0.800  0       0.0  0                       
 308    1e 4D1116       883.4     0.    1104.3 FIXEDHF     0.800  0       0.0  0                       
 309    1f 0D1116       182.0     0.     227.5 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 11d  
 310    1f 2D1116      1190.3     0.    1487.9 FIXEDHF     0.800  0       0.0  0                       
 311    1f 4D1116       758.2     0.     947.8 FIXEDHF     0.800  0       0.0  0                       
 312    1g 0D1116       158.3     0.     197.9 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 12d  
 313    1g 2D1116      1035.6     0.    1294.5 FIXEDHF     0.800  0       0.0  0                       
 314    1g 4D1116       659.7     0.     824.6 FIXEDHF     0.800  0       0.0  0                       
 315    1h 0D1116       139.3     0.     174.1 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 13d  
 316    1h 2D1116       911.4     0.    1139.3 FIXEDHF     0.800  0       0.0  0                       
 317    1h 4D1116       580.6     0.     725.8 FIXEDHF     0.800  0       0.0  0                       
 318    1i 0D1116       123.8     0.     154.8 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 14d  
 319    1i 2D1116       810.0     0.    1012.5 FIXEDHF     0.800  0       0.0  0                       
 320    1i 4D1116       516.1     0.     645.1 FIXEDHF     0.800  0       0.0  0                       
 321    1o 2D1117         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 5g   
 322    1o 4D1117         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
 323    1p 2D1117         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 6g   
 324    1p 4D1117         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
 325    1q 2D1117         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 7g   
 326    1q 4D1117         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
 327    1r 2D1117         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 8g   
 328    1r 4D1117         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
 329    1s 2D1117         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 9g   
 330    1s 4D1117         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
 331    1w 4D1118         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 7i   
 332    1x 4D1118         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 8i   
 333    1y 4D1118         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 9i   
 334    1z 1D2233     29315.8     0.   36644.7 FIXEDHF     0.800  0       0.0  0  4s2       -d10 4p2   
 335    23 0D2425       511.3     0.     639.1 FIXEDHF     0.800  0       0.0  0  4s5s      -4s6s      
 336    23 0E2425      1021.8     0.    1277.3 FIXEDHF     0.800  0       0.0  0                       
 337    24 0D2425       336.7     0.     420.9 FIXEDHF     0.800  0       0.0  0  4s5s      -4s7s      
 338    24 0E2425       672.6     0.     840.8 FIXEDHF     0.800  0       0.0  0                       
 339    25 0D2425       243.8     0.     304.8 FIXEDHF     0.800  0       0.0  0  4s5s      -4s8s      
 340    25 0E2425       487.0     0.     608.8 FIXEDHF     0.800  0       0.0  0                       
 341    26 0D2425       187.3     0.     234.1 FIXEDHF     0.800  0       0.0  0  4s5s      -4s9s      
 342    26 0E2425       374.1     0.     467.6 FIXEDHF     0.800  0       0.0  0                       
 343    27 0D2425       149.8     0.     187.3 FIXEDHF     0.800  0       0.0  0  4s5s      -4s10s     
 344    27 0E2425       299.2     0.     374.0 FIXEDHF     0.800  0       0.0  0                       
 345    28 0D2425       123.4     0.     154.3 FIXEDHF     0.800  0       0.0  0  4s5s      -4s11s     
 346    28 0E2425       246.4     0.     308.0 FIXEDHF     0.800  0       0.0  0                       
 347    29 0D2425       104.0     0.     130.0 FIXEDHF     0.800  0       0.0  0  4s5s      -4s12s     
 348    29 0E2425       207.6     0.     259.5 FIXEDHF     0.800  0       0.0  0                       
 349    2A 0D2425        89.2     0.     111.5 FIXEDHF     0.800  0       0.0  0  4s5s      -4s13s     
 350    2A 0E2425       178.1     0.     222.6 FIXEDHF     0.800  0       0.0  0                       
 351    2B 0D2425        77.6     0.      97.0 FIXEDHF     0.800  0       0.0  0  4s5s      -4s14s     
 352    2B 0E2425       155.0     0.     193.7 FIXEDHF     0.800  0       0.0  0                       
 353    2C 2D1112       679.4     0.     849.2 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 5s   
 354    2Y 2D1426       554.4     0.     693.0 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 4d   
 355    2Y 0E1426       834.4     0.    1043.0 FIXEDHF     0.800  0       0.0  0                       
 356    2Z 2D1426       276.7     0.     345.9 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 5d   
 357    2Z 0E1426       613.2     0.     766.5 FIXEDHF     0.800  0       0.0  0                       
 358    2a 2D1426       168.8     0.     211.0 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 6d   
 359    2a 0E1426       460.4     0.     575.5 FIXEDHF     0.800  0       0.0  0                       
 360    2b 2D1426       115.5     0.     144.4 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 7d   
 361    2b 0E1426       358.8     0.     448.5 FIXEDHF     0.800  0       0.0  0                       
 362    2c 2D1426        85.0     0.     106.3 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 8d   
 363    2c 0E1426       288.7     0.     360.9 FIXEDHF     0.800  0       0.0  0                       
 364    2d 2D1426        65.8     0.      82.3 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 9d   
 365    2d 0E1426       238.4     0.     298.0 FIXEDHF     0.800  0       0.0  0                       
 366    2e 2D1426        52.9     0.      66.1 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 10d  
 367    2e 0E1426       201.0     0.     251.2 FIXEDHF     0.800  0       0.0  0                       
 368    2f 2D1426        43.6     0.      54.5 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 11d  
 369    2f 0E1426       172.3     0.     215.4 FIXEDHF     0.800  0       0.0  0                       
 370    2g 2D1426        36.8     0.      46.0 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 12d  
 371    2g 0E1426       149.8     0.     187.3 FIXEDHF     0.800  0       0.0  0                       
 372    2h 2D1426        31.5     0.      39.4 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 13d  
 373    2h 0E1426       131.8     0.     164.7 FIXEDHF     0.800  0       0.0  0                       
 374    2i 2D1426        27.4     0.      34.3 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 14d  
 375    2i 0E1426       117.0     0.     146.3 FIXEDHF     0.800  0       0.0  0                       
 376    2z 1D2433      -752.0     0.    -940.0 FIXEDHF     0.800  0       0.0  0  4s5s      -d10 4p2   
 377    34 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s7s      
 378    34 0E2525       369.8     0.     462.3 FIXEDHF     0.800  0       0.0  0                       
 379    35 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s8s      
 380    35 0E2525       268.1     0.     335.1 FIXEDHF     0.800  0       0.0  0                       
 381    36 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s9s      
 382    36 0E2525       206.0     0.     257.5 FIXEDHF     0.800  0       0.0  0                       
 383    37 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s10s     
 384    37 0E2525       164.8     0.     206.0 FIXEDHF     0.800  0       0.0  0                       
 385    38 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s11s     
 386    38 0E2525       135.8     0.     169.7 FIXEDHF     0.800  0       0.0  0                       
 387    39 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s12s     
 388    39 0E2525       114.4     0.     143.0 FIXEDHF     0.800  0       0.0  0                       
 389    3A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s13s     
 390    3A 0E2525        98.2     0.     122.7 FIXEDHF     0.800  0       0.0  0                       
 391    3B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s14s     
 392    3B 0E2525        85.4     0.     106.7 FIXEDHF     0.800  0       0.0  0                       
 393    3D 2D1112       697.0     0.     871.2 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 6s   
 394    3E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 7s   
 395    3F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 8s   
 396    3G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 9s   
 397    3H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 10s  
 398    3I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 11s  
 399    3J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 12s  
 400    3K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 13s  
 401    3L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 14s  
 402    3Y 2D1526       206.1     0.     257.6 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 4d   
 403    3Y 0E1526       461.4     0.     576.7 FIXEDHF     0.800  0       0.0  0                       
 404    3Z 2D1526       182.9     0.     228.6 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 5d   
 405    3Z 0E1526       339.3     0.     424.1 FIXEDHF     0.800  0       0.0  0                       
 406    3a 2D1526       122.4     0.     153.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 6d   
 407    3a 0E1526       254.8     0.     318.5 FIXEDHF     0.800  0       0.0  0                       
 408    3b 2D1526        88.1     0.     110.1 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 7d   
 409    3b 0E1526       198.6     0.     248.2 FIXEDHF     0.800  0       0.0  0                       
 410    3c 2D1526        67.1     0.      83.9 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 8d   
 411    3c 0E1526       159.8     0.     199.8 FIXEDHF     0.800  0       0.0  0                       
 412    3d 2D1526        53.3     0.      66.6 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 9d   
 413    3d 0E1526       132.0     0.     165.0 FIXEDHF     0.800  0       0.0  0                       
 414    3e 2D1526        43.6     0.      54.5 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 10d  
 415    3e 0E1526       111.3     0.     139.1 FIXEDHF     0.800  0       0.0  0                       
 416    3f 2D1526        36.5     0.      45.6 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 11d  
 417    3f 0E1526        95.4     0.     119.3 FIXEDHF     0.800  0       0.0  0                       
 418    3g 2D1526        31.2     0.      39.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 12d  
 419    3g 0E1526        83.0     0.     103.7 FIXEDHF     0.800  0       0.0  0                       
 420    3h 2D1526        27.0     0.      33.8 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 13d  
 421    3h 0E1526        73.0     0.      91.2 FIXEDHF     0.800  0       0.0  0                       
 422    3i 2D1526        23.7     0.      29.6 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 14d  
 423    3i 0E1526        64.8     0.      81.0 FIXEDHF     0.800  0       0.0  0                       
 424    3z 1D2533      -401.6     0.    -502.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d10 4p2   
 425    45 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s8s      
 426    45 0E2525       177.0     0.     221.2 FIXEDHF     0.800  0       0.0  0                       
 427    46 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s9s      
 428    46 0E2525       136.0     0.     170.0 FIXEDHF     0.800  0       0.0  0                       
 429    47 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s10s     
 430    47 0E2525       108.8     0.     136.0 FIXEDHF     0.800  0       0.0  0                       
 431    48 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s11s     
 432    48 0E2525        89.7     0.     112.1 FIXEDHF     0.800  0       0.0  0                       
 433    49 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s12s     
 434    49 0E2525        75.5     0.      94.4 FIXEDHF     0.800  0       0.0  0                       
 435    4A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s13s     
 436    4A 0E2525        64.8     0.      81.0 FIXEDHF     0.800  0       0.0  0                       
 437    4B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s14s     
 438    4B 0E2525        56.4     0.      70.5 FIXEDHF     0.800  0       0.0  0                       
 439    4D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 6s   
 440    4E 2D1112       701.8     0.     877.3 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 7s   
 441    4F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 8s   
 442    4G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 9s   
 443    4H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 10s  
 444    4I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 11s  
 445    4J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 12s  
 446    4K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 13s  
 447    4L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 14s  
 448    4Y 2D1526       129.9     0.     162.4 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 4d   
 449    4Y 0E1526       305.8     0.     382.3 FIXEDHF     0.800  0       0.0  0                       
 450    4Z 2D1526        99.6     0.     124.5 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 5d   
 451    4Z 0E1526       225.0     0.     281.2 FIXEDHF     0.800  0       0.0  0                       
 452    4a 2D1526        82.6     0.     103.2 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 6d   
 453    4a 0E1526       169.0     0.     211.2 FIXEDHF     0.800  0       0.0  0                       
 454    4b 2D1526        61.5     0.      76.9 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 7d   
 455    4b 0E1526       131.7     0.     164.6 FIXEDHF     0.800  0       0.0  0                       
 456    4c 2D1526        47.8     0.      59.7 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 8d   
 457    4c 0E1526       106.0     0.     132.5 FIXEDHF     0.800  0       0.0  0                       
 458    4d 2D1526        38.3     0.      47.9 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 9d   
 459    4d 0E1526        87.5     0.     109.4 FIXEDHF     0.800  0       0.0  0                       
 460    4e 2D1526        31.6     0.      39.5 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 10d  
 461    4e 0E1526        73.8     0.      92.3 FIXEDHF     0.800  0       0.0  0                       
 462    4f 2D1526        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 11d  
 463    4f 0E1526        63.3     0.      79.1 FIXEDHF     0.800  0       0.0  0                       
 464    4g 2D1526        22.8     0.      28.5 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 12d  
 465    4g 0E1526        55.0     0.      68.8 FIXEDHF     0.800  0       0.0  0                       
 466    4h 2D1526        19.8     0.      24.8 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 13d  
 467    4h 0E1526        48.4     0.      60.5 FIXEDHF     0.800  0       0.0  0                       
 468    4i 2D1526        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 14d  
 469    4i 0E1526        43.0     0.      53.8 FIXEDHF     0.800  0       0.0  0                       
 470    4z 1D2533      -271.7     0.    -339.6 FIXEDHF     0.800  0       0.0  0  4s7s      -d10 4p2   
 471    56 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s9s      
 472    56 0E2525        98.6     0.     123.3 FIXEDHF     0.800  0       0.0  0                       
 473    57 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s10s     
 474    57 0E2525        79.0     0.      98.7 FIXEDHF     0.800  0       0.0  0                       
 475    58 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s11s     
 476    58 0E2525        65.0     0.      81.3 FIXEDHF     0.800  0       0.0  0                       
 477    59 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s12s     
 478    59 0E2525        54.8     0.      68.5 FIXEDHF     0.800  0       0.0  0                       
 479    5A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s13s     
 480    5A 0E2525        47.0     0.      58.8 FIXEDHF     0.800  0       0.0  0                       
 481    5B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s14s     
 482    5B 0E2525        40.9     0.      51.1 FIXEDHF     0.800  0       0.0  0                       
 483    5D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 6s   
 484    5E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 7s   
 485    5F 2D1112       703.7     0.     879.6 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 8s   
 486    5G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 9s   
 487    5H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 10s  
 488    5I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 11s  
 489    5J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 12s  
 490    5K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 13s  
 491    5L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 14s  
 492    5Y 2D1526        92.4     0.     115.5 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 4d   
 493    5Y 0E1526       222.4     0.     278.0 FIXEDHF     0.800  0       0.0  0                       
 494    5Z 2D1526        70.0     0.      87.5 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 5d   
 495    5Z 0E1526       163.6     0.     204.5 FIXEDHF     0.800  0       0.0  0                       
 496    5a 2D1526        53.7     0.      67.1 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 6d   
 497    5a 0E1526       122.9     0.     153.6 FIXEDHF     0.800  0       0.0  0                       
 498    5b 2D1526        44.3     0.      55.4 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 7d   
 499    5b 0E1526        95.8     0.     119.7 FIXEDHF     0.800  0       0.0  0                       
 500    5c 2D1526        35.0     0.      43.8 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 8d   
 501    5c 0E1526        77.1     0.      96.4 FIXEDHF     0.800  0       0.0  0                       
 502    5d 2D1526        28.3     0.      35.4 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 9d   
 503    5d 0E1526        63.7     0.      79.6 FIXEDHF     0.800  0       0.0  0                       
 504    5e 2D1526        23.5     0.      29.4 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 10d  
 505    5e 0E1526        53.7     0.      67.1 FIXEDHF     0.800  0       0.0  0                       
 506    5f 2D1526        19.9     0.      24.9 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 11d  
 507    5f 0E1526        46.0     0.      57.5 FIXEDHF     0.800  0       0.0  0                       
 508    5g 2D1526        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 12d  
 509    5g 0E1526        40.0     0.      50.0 FIXEDHF     0.800  0       0.0  0                       
 510    5h 2D1526        14.9     0.      18.6 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 13d  
 511    5h 0E1526        35.2     0.      44.0 FIXEDHF     0.800  0       0.0  0                       
 512    5i 2D1526        13.1     0.      16.4 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 14d  
 513    5i 0E1526        31.3     0.      39.1 FIXEDHF     0.800  0       0.0  0                       
 514    5z 1D2533      -200.1     0.    -250.1 FIXEDHF     0.800  0       0.0  0  4s8s      -d10 4p2   
 515    67 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -4s10s     
 516    67 0E2525        60.6     0.      75.8 FIXEDHF     0.800  0       0.0  0                       
 517    68 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -4s11s     
 518    68 0E2525        50.0     0.      62.5 FIXEDHF     0.800  0       0.0  0                       
 519    69 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -4s12s     
 520    69 0E2525        42.2     0.      52.7 FIXEDHF     0.800  0       0.0  0                       
 521    6A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -4s13s     
 522    6A 0E2525        36.2     0.      45.2 FIXEDHF     0.800  0       0.0  0                       
 523    6B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -4s14s     
 524    6B 0E2525        31.4     0.      39.3 FIXEDHF     0.800  0       0.0  0                       
 525    6D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 6s   
 526    6E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 7s   
 527    6F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 8s   
 528    6G 2D1112       704.6     0.     880.8 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 9s   
 529    6H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 10s  
 530    6I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 11s  
 531    6J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 12s  
 532    6K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 13s  
 533    6L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 14s  
 534    6Y 2D1526        70.3     0.      87.9 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 4d   
 535    6Y 0E1526       171.2     0.     214.0 FIXEDHF     0.800  0       0.0  0                       
 536    6Z 2D1526        53.0     0.      66.3 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 5d   
 537    6Z 0E1526       126.0     0.     157.5 FIXEDHF     0.800  0       0.0  0                       
 538    6a 2D1526        40.3     0.      50.4 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 6d   
 539    6a 0E1526        94.6     0.     118.3 FIXEDHF     0.800  0       0.0  0                       
 540    6b 2D1526        31.8     0.      39.8 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 7d   
 541    6b 0E1526        73.8     0.      92.2 FIXEDHF     0.800  0       0.0  0                       
 542    6c 2D1526        26.6     0.      33.2 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 8d   
 543    6c 0E1526        59.4     0.      74.2 FIXEDHF     0.800  0       0.0  0                       
 544    6d 2D1526        21.8     0.      27.2 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 9d   
 545    6d 0E1526        49.0     0.      61.3 FIXEDHF     0.800  0       0.0  0                       
 546    6e 2D1526        18.2     0.      22.7 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 10d  
 547    6e 0E1526        41.4     0.      51.7 FIXEDHF     0.800  0       0.0  0                       
 548    6f 2D1526        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 11d  
 549    6f 0E1526        35.4     0.      44.3 FIXEDHF     0.800  0       0.0  0                       
 550    6g 2D1526        13.3     0.      16.6 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 12d  
 551    6g 0E1526        30.8     0.      38.5 FIXEDHF     0.800  0       0.0  0                       
 552    6h 2D1526        11.6     0.      14.5 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 13d  
 553    6h 0E1526        27.1     0.      33.9 FIXEDHF     0.800  0       0.0  0                       
 554    6i 2D1526        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 14d  
 555    6i 0E1526        24.1     0.      30.1 FIXEDHF     0.800  0       0.0  0                       
 556    6z 1D2533      -155.3     0.    -194.1 FIXEDHF     0.800  0       0.0  0  4s9s      -d10 4p2   
 557    78 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -4s11s     
 558    78 0E2525        40.0     0.      50.0 FIXEDHF     0.800  0       0.0  0                       
 559    79 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -4s12s     
 560    79 0E2525        33.7     0.      42.1 FIXEDHF     0.800  0       0.0  0                       
 561    7A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -4s13s     
 562    7A 0E2525        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0                       
 563    7B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -4s14s     
 564    7B 0E2525        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0                       
 565    7D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 6s   
 566    7E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 7s   
 567    7F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 8s   
 568    7G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 9s   
 569    7H 2D1112       705.0     0.     881.3 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 10s  
 570    7I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 11s  
 571    7J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 12s  
 572    7K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 13s  
 573    7L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 14s  
 574    7Y 2D1526        55.9     0.      69.9 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 4d   
 575    7Y 0E1526       137.1     0.     171.4 FIXEDHF     0.800  0       0.0  0                       
 576    7Z 2D1526        42.1     0.      52.6 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 5d   
 577    7Z 0E1526       101.0     0.     126.2 FIXEDHF     0.800  0       0.0  0                       
 578    7a 2D1526        31.9     0.      39.9 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 6d   
 579    7a 0E1526        75.8     0.      94.8 FIXEDHF     0.800  0       0.0  0                       
 580    7b 2D1526        25.0     0.      31.3 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 7d   
 581    7b 0E1526        59.1     0.      73.9 FIXEDHF     0.800  0       0.0  0                       
 582    7c 2D1526        20.3     0.      25.4 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 8d   
 583    7c 0E1526        47.6     0.      59.5 FIXEDHF     0.800  0       0.0  0                       
 584    7d 2D1526        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 9d   
 585    7d 0E1526        39.3     0.      49.1 FIXEDHF     0.800  0       0.0  0                       
 586    7e 2D1526        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 10d  
 587    7e 0E1526        33.1     0.      41.4 FIXEDHF     0.800  0       0.0  0                       
 588    7f 2D1526        12.3     0.      15.4 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 11d  
 589    7f 0E1526        28.4     0.      35.5 FIXEDHF     0.800  0       0.0  0                       
 590    7g 2D1526        10.6     0.      13.3 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 12d  
 591    7g 0E1526        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0                       
 592    7h 2D1526         9.3     0.      11.6 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 13d  
 593    7h 0E1526        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
 594    7i 2D1526         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 14d  
 595    7i 0E1526        19.3     0.      24.1 FIXEDHF     0.800  0       0.0  0                       
 596    7z 1D2533      -124.8     0.    -156.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d10 4p2   
 597    89 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -4s12s     
 598    89 0E2525        27.8     0.      34.7 FIXEDHF     0.800  0       0.0  0                       
 599    8A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -4s13s     
 600    8A 0E2525        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0                       
 601    8B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -4s14s     
 602    8B 0E2525        20.7     0.      25.9 FIXEDHF     0.800  0       0.0  0                       
 603    8D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 6s   
 604    8E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 7s   
 605    8F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 8s   
 606    8G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 9s   
 607    8H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 10s  
 608    8I 2D1112       705.4     0.     881.7 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 11s  
 609    8J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 12s  
 610    8K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 13s  
 611    8L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 14s  
 612    8Y 2D1526        45.8     0.      57.3 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 4d   
 613    8Y 0E1526       113.1     0.     141.4 FIXEDHF     0.800  0       0.0  0                       
 614    8Z 2D1526        34.5     0.      43.1 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 5d   
 615    8Z 0E1526        83.2     0.     104.0 FIXEDHF     0.800  0       0.0  0                       
 616    8a 2D1526        26.1     0.      32.6 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 6d   
 617    8a 0E1526        62.6     0.      78.2 FIXEDHF     0.800  0       0.0  0                       
 618    8b 2D1526        20.5     0.      25.6 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 7d   
 619    8b 0E1526        48.7     0.      60.9 FIXEDHF     0.800  0       0.0  0                       
 620    8c 2D1526        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 8d   
 621    8c 0E1526        39.2     0.      49.0 FIXEDHF     0.800  0       0.0  0                       
 622    8d 2D1526        13.8     0.      17.2 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 9d   
 623    8d 0E1526        32.4     0.      40.5 FIXEDHF     0.800  0       0.0  0                       
 624    8e 2D1526        11.8     0.      14.7 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 10d  
 625    8e 0E1526        27.3     0.      34.1 FIXEDHF     0.800  0       0.0  0                       
 626    8f 2D1526        10.1     0.      12.6 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 11d  
 627    8f 0E1526        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0                       
 628    8g 2D1526         8.7     0.      10.9 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 12d  
 629    8g 0E1526        20.4     0.      25.5 FIXEDHF     0.800  0       0.0  0                       
 630    8h 2D1526         7.7     0.       9.6 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 13d  
 631    8h 0E1526        17.9     0.      22.4 FIXEDHF     0.800  0       0.0  0                       
 632    8i 2D1526         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 14d  
 633    8i 0E1526        15.9     0.      19.9 FIXEDHF     0.800  0       0.0  0                       
 634    8z 1D2533      -103.1     0.    -128.9 FIXEDHF     0.800  0       0.0  0  4s11s     -d10 4p2   
 635    9A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -4s13s     
 636    9A 0E2525        20.1     0.      25.1 FIXEDHF     0.800  0       0.0  0                       
 637    9B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -4s14s     
 638    9B 0E2525        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0                       
 639    9D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 6s   
 640    9E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 7s   
 641    9F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 8s   
 642    9G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 9s   
 643    9H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 10s  
 644    9I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 11s  
 645    9J 2D1112       705.5     0.     881.9 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 12s  
 646    9K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 13s  
 647    9L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 14s  
 648    9Y 2D1526        38.5     0.      48.1 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 4d   
 649    9Y 0E1526        95.4     0.     119.2 FIXEDHF     0.800  0       0.0  0                       
 650    9Z 2D1526        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 5d   
 651    9Z 0E1526        70.2     0.      87.7 FIXEDHF     0.800  0       0.0  0                       
 652    9a 2D1526        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 6d   
 653    9a 0E1526        52.7     0.      65.9 FIXEDHF     0.800  0       0.0  0                       
 654    9b 2D1526        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 7d   
 655    9b 0E1526        41.1     0.      51.4 FIXEDHF     0.800  0       0.0  0                       
 656    9c 2D1526        13.8     0.      17.3 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 8d   
 657    9c 0E1526        33.0     0.      41.3 FIXEDHF     0.800  0       0.0  0                       
 658    9d 2D1526        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 9d   
 659    9d 0E1526        27.4     0.      34.2 FIXEDHF     0.800  0       0.0  0                       
 660    9e 2D1526         9.7     0.      12.1 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 10d  
 661    9e 0E1526        23.0     0.      28.8 FIXEDHF     0.800  0       0.0  0                       
 662    9f 2D1526         8.4     0.      10.5 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 11d  
 663    9f 0E1526        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0                       
 664    9g 2D1526         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 12d  
 665    9g 0E1526        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0                       
 666    9h 2D1526         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 13d  
 667    9h 0E1526        15.1     0.      18.9 FIXEDHF     0.800  0       0.0  0                       
 668    9i 2D1526         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 14d  
 669    9i 0E1526        13.4     0.      16.8 FIXEDHF     0.800  0       0.0  0                       
 670    9z 1D2533       -87.0     0.    -108.7 FIXEDHF     0.800  0       0.0  0  4s12s     -d10 4p2   
 671    AB 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -4s14s     
 672    AB 0E2525        15.0     0.      18.7 FIXEDHF     0.800  0       0.0  0                       
 673    AD 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 6s   
 674    AE 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 7s   
 675    AF 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 8s   
 676    AG 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 9s   
 677    AH 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 10s  
 678    AI 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 11s  
 679    AJ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 12s  
 680    AK 2D1112       705.6     0.     882.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 13s  
 681    AL 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 14s  
 682    AY 2D1526        33.0     0.      41.2 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 4d   
 683    AY 0E1526        81.8     0.     102.3 FIXEDHF     0.800  0       0.0  0                       
 684    AZ 2D1526        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 5d   
 685    AZ 0E1526        60.2     0.      75.3 FIXEDHF     0.800  0       0.0  0                       
 686    Aa 2D1526        18.7     0.      23.4 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 6d   
 687    Aa 0E1526        45.3     0.      56.6 FIXEDHF     0.800  0       0.0  0                       
 688    Ab 2D1526        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 7d   
 689    Ab 0E1526        35.3     0.      44.1 FIXEDHF     0.800  0       0.0  0                       
 690    Ac 2D1526        11.8     0.      14.8 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 8d   
 691    Ac 0E1526        28.4     0.      35.5 FIXEDHF     0.800  0       0.0  0                       
 692    Ad 2D1526         9.8     0.      12.2 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 9d   
 693    Ad 0E1526        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0                       
 694    Ae 2D1526         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 10d  
 695    Ae 0E1526        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0                       
 696    Af 2D1526         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 11d  
 697    Af 0E1526        17.0     0.      21.2 FIXEDHF     0.800  0       0.0  0                       
 698    Ag 2D1526         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 12d  
 699    Ag 0E1526        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0                       
 700    Ah 2D1526         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 13d  
 701    Ah 0E1526        13.0     0.      16.2 FIXEDHF     0.800  0       0.0  0                       
 702    Ai 2D1526         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 14d  
 703    Ai 0E1526        11.5     0.      14.4 FIXEDHF     0.800  0       0.0  0                       
 704    Az 1D2533       -74.6     0.     -93.2 FIXEDHF     0.800  0       0.0  0  4s13s     -d10 4p2   
 705    BD 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 6s   
 706    BE 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 7s   
 707    BF 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 8s   
 708    BG 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 9s   
 709    BH 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 10s  
 710    BI 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 11s  
 711    BJ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 12s  
 712    BK 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 13s  
 713    BL 2D1112       705.7     0.     882.1 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 14s  
 714    BY 2D1526        28.6     0.      35.7 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 4d   
 715    BY 0E1526        71.3     0.      89.1 FIXEDHF     0.800  0       0.0  0                       
 716    BZ 2D1526        21.4     0.      26.8 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 5d   
 717    BZ 0E1526        52.5     0.      65.6 FIXEDHF     0.800  0       0.0  0                       
 718    Ba 2D1526        16.2     0.      20.3 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 6d   
 719    Ba 0E1526        39.4     0.      49.2 FIXEDHF     0.800  0       0.0  0                       
 720    Bb 2D1526        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 7d   
 721    Bb 0E1526        30.7     0.      38.4 FIXEDHF     0.800  0       0.0  0                       
 722    Bc 2D1526        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 8d   
 723    Bc 0E1526        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0                       
 724    Bd 2D1526         8.5     0.      10.6 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 9d   
 725    Bd 0E1526        20.4     0.      25.5 FIXEDHF     0.800  0       0.0  0                       
 726    Be 2D1526         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 10d  
 727    Be 0E1526        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0                       
 728    Bf 2D1526         6.2     0.       7.7 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 11d  
 729    Bf 0E1526        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0                       
 730    Bg 2D1526         5.4     0.       6.7 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 12d  
 731    Bg 0E1526        12.8     0.      16.0 FIXEDHF     0.800  0       0.0  0                       
 732    Bh 2D1526         4.7     0.       5.9 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 13d  
 733    Bh 0E1526        11.3     0.      14.1 FIXEDHF     0.800  0       0.0  0                       
 734    Bi 2D1526         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 14d  
 735    Bi 0E1526        10.0     0.      12.5 FIXEDHF     0.800  0       0.0  0                       
 736    Bz 1D2533       -64.9     0.     -81.1 FIXEDHF     0.800  0       0.0  0  4s14s     -d10 4p2   
 737    CD 0D1415        36.5     0.      45.6 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 6s   
 738    CD 2E1415       364.6     0.     455.8 FIXEDHF     0.800  0       0.0  0                       
 739    CE 0D1415        24.4     0.      30.5 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 7s   
 740    CE 2E1415       244.3     0.     305.4 FIXEDHF     0.800  0       0.0  0                       
 741    CF 0D1415        17.8     0.      22.3 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 8s   
 742    CF 2E1415       178.3     0.     222.9 FIXEDHF     0.800  0       0.0  0                       
 743    CG 0D1415        13.8     0.      17.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 9s   
 744    CG 2E1415       137.5     0.     171.9 FIXEDHF     0.800  0       0.0  0                       
 745    CH 0D1415        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 10s  
 746    CH 2E1415       110.2     0.     137.7 FIXEDHF     0.800  0       0.0  0                       
 747    CI 0D1415         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 11s  
 748    CI 2E1415        90.9     0.     113.6 FIXEDHF     0.800  0       0.0  0                       
 749    CJ 0D1415         7.7     0.       9.6 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 12s  
 750    CJ 2E1415        76.6     0.      95.8 FIXEDHF     0.800  0       0.0  0                       
 751    CK 0D1415         6.6     0.       8.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 13s  
 752    CK 2E1415        65.7     0.      82.1 FIXEDHF     0.800  0       0.0  0                       
 753    CL 0D1415         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 14s  
 754    CL 2E1415        57.2     0.      71.5 FIXEDHF     0.800  0       0.0  0                       
 755    CM 2D2416       594.6     0.     743.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s4d      
 756    CM 2E2416      -170.2     0.    -212.7 FIXEDHF     0.800  0       0.0  0                       
 757    CN 2D2416       316.2     0.     395.3 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s5d      
 758    CN 2E2416      -137.5     0.    -171.9 FIXEDHF     0.800  0       0.0  0                       
 759    CO 2D2416       201.0     0.     251.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s6d      
 760    CO 2E2416      -107.8     0.    -134.8 FIXEDHF     0.800  0       0.0  0                       
 761    CP 2D2416       141.4     0.     176.7 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s7d      
 762    CP 2E2416       -86.4     0.    -108.0 FIXEDHF     0.800  0       0.0  0                       
 763    CQ 2D2416       106.2     0.     132.8 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s8d      
 764    CQ 2E2416       -70.7     0.     -88.4 FIXEDHF     0.800  0       0.0  0                       
 765    CR 2D2416        83.5     0.     104.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s9d      
 766    CR 2E2416       -59.1     0.     -73.9 FIXEDHF     0.800  0       0.0  0                       
 767    CS 2D2416        68.2     0.      85.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s10d     
 768    CS 2E2416       -50.0     0.     -62.5 FIXEDHF     0.800  0       0.0  0                       
 769    CT 2D2416        56.8     0.      71.0 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s11d     
 770    CT 2E2416       -43.2     0.     -54.0 FIXEDHF     0.800  0       0.0  0                       
 771    CU 2D2416        48.2     0.      60.3 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s12d     
 772    CU 2E2416       -37.8     0.     -47.2 FIXEDHF     0.800  0       0.0  0                       
 773    CV 2D2416        41.8     0.      52.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s13d     
 774    CV 2E2416       -33.2     0.     -41.5 FIXEDHF     0.800  0       0.0  0                       
 775    CW 2D2416        36.6     0.      45.7 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s14d     
 776    CW 2E2416       -29.6     0.     -37.0 FIXEDHF     0.800  0       0.0  0                       
 777    CX 2D2416        32.3     0.      40.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s15d     
 778    CX 2E2416       -26.6     0.     -33.2 FIXEDHF     0.800  0       0.0  0                       
 779    CY 2D1416      -156.3     0.    -195.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 4d   
 780    CY 2E1416       127.1     0.     158.9 FIXEDHF     0.800  0       0.0  0                       
 781    CZ 2D1416       -32.2     0.     -40.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 5d   
 782    CZ 2E1416       101.4     0.     126.7 FIXEDHF     0.800  0       0.0  0                       
 783    Ca 2D1416         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 6d   
 784    Ca 2E1416        78.9     0.      98.6 FIXEDHF     0.800  0       0.0  0                       
 785    Cb 2D1416        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 7d   
 786    Cb 2E1416        62.7     0.      78.4 FIXEDHF     0.800  0       0.0  0                       
 787    Cc 2D1416        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 8d   
 788    Cc 2E1416        51.1     0.      63.9 FIXEDHF     0.800  0       0.0  0                       
 789    Cd 2D1416        15.8     0.      19.8 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 9d   
 790    Cd 2E1416        42.6     0.      53.2 FIXEDHF     0.800  0       0.0  0                       
 791    Ce 2D1416        15.2     0.      19.0 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 10d  
 792    Ce 2E1416        36.1     0.      45.1 FIXEDHF     0.800  0       0.0  0                       
 793    Cf 2D1416        14.2     0.      17.7 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 11d  
 794    Cf 2E1416        31.0     0.      38.8 FIXEDHF     0.800  0       0.0  0                       
 795    Cg 2D1416        13.1     0.      16.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 12d  
 796    Cg 2E1416        27.1     0.      33.9 FIXEDHF     0.800  0       0.0  0                       
 797    Ch 2D1416        12.1     0.      15.1 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 13d  
 798    Ch 2E1416        23.9     0.      29.9 FIXEDHF     0.800  0       0.0  0                       
 799    Ci 2D1416        11.1     0.      13.9 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 14d  
 800    Ci 2E1416        21.3     0.      26.6 FIXEDHF     0.800  0       0.0  0                       
 801    Co 4D1417         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 5g   
 802    Co 2E1417        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
 803    Cp 4D1417         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 6g   
 804    Cp 2E1417        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
 805    Cq 4D1417         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 7g   
 806    Cq 2E1417        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
 807    Cr 4D1417         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 8g   
 808    Cr 2E1417        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
 809    Cs 4D1417         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 9g   
 810    Cs 2E1417        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
 811    DE 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 7s   
 812    DE 2E1515       140.2     0.     175.2 FIXEDHF     0.800  0       0.0  0                       
 813    DF 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 8s   
 814    DF 2E1515       102.3     0.     127.9 FIXEDHF     0.800  0       0.0  0                       
 815    DG 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 9s   
 816    DG 2E1515        78.9     0.      98.6 FIXEDHF     0.800  0       0.0  0                       
 817    DH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 10s  
 818    DH 2E1515        63.2     0.      79.0 FIXEDHF     0.800  0       0.0  0                       
 819    DI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 11s  
 820    DI 2E1515        52.2     0.      65.2 FIXEDHF     0.800  0       0.0  0                       
 821    DJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 12s  
 822    DJ 2E1515        44.0     0.      55.0 FIXEDHF     0.800  0       0.0  0                       
 823    DK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 13s  
 824    DK 2E1515        37.7     0.      47.1 FIXEDHF     0.800  0       0.0  0                       
 825    DL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 14s  
 826    DL 2E1515        32.8     0.      41.0 FIXEDHF     0.800  0       0.0  0                       
 827    DM 2D2516       197.1     0.     246.4 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s4d      
 828    DM 2E2516       -88.8     0.    -111.0 FIXEDHF     0.800  0       0.0  0                       
 829    DN 2D2516       187.3     0.     234.1 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s5d      
 830    DN 2E2516       -72.2     0.     -90.2 FIXEDHF     0.800  0       0.0  0                       
 831    DO 2D2516       130.2     0.     162.8 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s6d      
 832    DO 2E2516       -56.7     0.     -70.9 FIXEDHF     0.800  0       0.0  0                       
 833    DP 2D2516        95.8     0.     119.8 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s7d      
 834    DP 2E2516       -45.5     0.     -56.9 FIXEDHF     0.800  0       0.0  0                       
 835    DQ 2D2516        74.1     0.      92.6 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s8d      
 836    DQ 2E2516       -37.3     0.     -46.6 FIXEDHF     0.800  0       0.0  0                       
 837    DR 2D2516        59.4     0.      74.3 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s9d      
 838    DR 2E2516       -31.2     0.     -39.0 FIXEDHF     0.800  0       0.0  0                       
 839    DS 2D2516        49.1     0.      61.4 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s10d     
 840    DS 2E2516       -26.4     0.     -33.0 FIXEDHF     0.800  0       0.0  0                       
 841    DT 2D2516        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s11d     
 842    DT 2E2516       -22.8     0.     -28.5 FIXEDHF     0.800  0       0.0  0                       
 843    DU 2D2516        35.5     0.      44.4 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s12d     
 844    DU 2E2516       -19.9     0.     -24.9 FIXEDHF     0.800  0       0.0  0                       
 845    DV 2D2516        31.0     0.      38.7 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s13d     
 846    DV 2E2516       -17.5     0.     -21.9 FIXEDHF     0.800  0       0.0  0                       
 847    DW 2D2516        27.3     0.      34.1 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s14d     
 848    DW 2E2516       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
 849    DX 2D2516        24.2     0.      30.3 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s15d     
 850    DX 2E2516       -14.1     0.     -17.6 FIXEDHF     0.800  0       0.0  0                       
 851    DY 2D1516        -7.4     0.      -9.3 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 4d   
 852    DY 2E1516        72.6     0.      90.7 FIXEDHF     0.800  0       0.0  0                       
 853    DZ 2D1516       -23.4     0.     -29.2 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 5d   
 854    DZ 2E1516        57.8     0.      72.3 FIXEDHF     0.800  0       0.0  0                       
 855    Da 2D1516        -8.8     0.     -11.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 6d   
 856    Da 2E1516        45.0     0.      56.3 FIXEDHF     0.800  0       0.0  0                       
 857    Db 2D1516        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 7d   
 858    Db 2E1516        35.8     0.      44.8 FIXEDHF     0.800  0       0.0  0                       
 859    Dc 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 8d   
 860    Dc 2E1516        29.2     0.      36.5 FIXEDHF     0.800  0       0.0  0                       
 861    Dd 2D1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 9d   
 862    Dd 2E1516        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0                       
 863    De 2D1516         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 10d  
 864    De 2E1516        20.6     0.      25.7 FIXEDHF     0.800  0       0.0  0                       
 865    Df 2D1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 11d  
 866    Df 2E1516        17.7     0.      22.1 FIXEDHF     0.800  0       0.0  0                       
 867    Dg 2D1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 12d  
 868    Dg 2E1516        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0                       
 869    Dh 2D1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 13d  
 870    Dh 2E1516        13.6     0.      17.0 FIXEDHF     0.800  0       0.0  0                       
 871    Di 2D1516         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 14d  
 872    Di 2E1516        12.2     0.      15.2 FIXEDHF     0.800  0       0.0  0                       
 873    Do 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 5g   
 874    Do 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
 875    Dp 4D1517         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 6g   
 876    Dp 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
 877    Dq 4D1517         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 7g   
 878    Dq 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
 879    Dr 4D1517         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 8g   
 880    Dr 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
 881    Ds 4D1517         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 9g   
 882    Ds 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
 883    EF 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 8s   
 884    EF 2E1515        68.6     0.      85.7 FIXEDHF     0.800  0       0.0  0                       
 885    EG 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 9s   
 886    EG 2E1515        52.9     0.      66.1 FIXEDHF     0.800  0       0.0  0                       
 887    EH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 10s  
 888    EH 2E1515        42.4     0.      53.0 FIXEDHF     0.800  0       0.0  0                       
 889    EI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 11s  
 890    EI 2E1515        35.0     0.      43.7 FIXEDHF     0.800  0       0.0  0                       
 891    EJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 12s  
 892    EJ 2E1515        29.4     0.      36.8 FIXEDHF     0.800  0       0.0  0                       
 893    EK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 13s  
 894    EK 2E1515        25.3     0.      31.6 FIXEDHF     0.800  0       0.0  0                       
 895    EL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 14s  
 896    EL 2E1515        22.0     0.      27.5 FIXEDHF     0.800  0       0.0  0                       
 897    EM 2D2516       121.2     0.     151.5 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s4d      
 898    EM 2E2516       -57.4     0.     -71.7 FIXEDHF     0.800  0       0.0  0                       
 899    EN 2D2516        96.6     0.     120.8 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s5d      
 900    EN 2E2516       -46.7     0.     -58.4 FIXEDHF     0.800  0       0.0  0                       
 901    EO 2D2516        83.1     0.     103.9 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s6d      
 902    EO 2E2516       -36.8     0.     -46.0 FIXEDHF     0.800  0       0.0  0                       
 903    EP 2D2516        63.5     0.      79.4 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s7d      
 904    EP 2E2516       -29.5     0.     -36.9 FIXEDHF     0.800  0       0.0  0                       
 905    EQ 2D2516        50.1     0.      62.6 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s8d      
 906    EQ 2E2516       -24.2     0.     -30.3 FIXEDHF     0.800  0       0.0  0                       
 907    ER 2D2516        40.6     0.      50.8 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s9d      
 908    ER 2E2516       -20.2     0.     -25.3 FIXEDHF     0.800  0       0.0  0                       
 909    ES 2D2516        33.8     0.      42.3 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s10d     
 910    ES 2E2516       -17.1     0.     -21.4 FIXEDHF     0.800  0       0.0  0                       
 911    ET 2D2516        28.6     0.      35.8 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s11d     
 912    ET 2E2516       -14.8     0.     -18.5 FIXEDHF     0.800  0       0.0  0                       
 913    EU 2D2516        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s12d     
 914    EU 2E2516       -13.0     0.     -16.2 FIXEDHF     0.800  0       0.0  0                       
 915    EV 2D2516        21.6     0.      27.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s13d     
 916    EV 2E2516       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0                       
 917    EW 2D2516        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s14d     
 918    EW 2E2516       -10.2     0.     -12.7 FIXEDHF     0.800  0       0.0  0                       
 919    EX 2D2516        17.0     0.      21.3 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s15d     
 920    EX 2E2516        -9.1     0.     -11.4 FIXEDHF     0.800  0       0.0  0                       
 921    EY 2D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 4d   
 922    EY 2E1516        48.6     0.      60.7 FIXEDHF     0.800  0       0.0  0                       
 923    EZ 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 5d   
 924    EZ 2E1516        38.6     0.      48.3 FIXEDHF     0.800  0       0.0  0                       
 925    Ea 2D1516        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 6d   
 926    Ea 2E1516        30.1     0.      37.6 FIXEDHF     0.800  0       0.0  0                       
 927    Eb 2D1516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 7d   
 928    Eb 2E1516        23.9     0.      29.9 FIXEDHF     0.800  0       0.0  0                       
 929    Ec 2D1516        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 8d   
 930    Ec 2E1516        19.5     0.      24.4 FIXEDHF     0.800  0       0.0  0                       
 931    Ed 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 9d   
 932    Ed 2E1516        16.2     0.      20.3 FIXEDHF     0.800  0       0.0  0                       
 933    Ee 2D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 10d  
 934    Ee 2E1516        13.8     0.      17.2 FIXEDHF     0.800  0       0.0  0                       
 935    Ef 2D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 11d  
 936    Ef 2E1516        11.8     0.      14.8 FIXEDHF     0.800  0       0.0  0                       
 937    Eg 2D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 12d  
 938    Eg 2E1516        10.3     0.      12.9 FIXEDHF     0.800  0       0.0  0                       
 939    Eh 2D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 13d  
 940    Eh 2E1516         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
 941    Ei 2D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 14d  
 942    Ei 2E1516         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
 943    Eo 4D1517         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 5g   
 944    Eo 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
 945    Ep 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 6g   
 946    Ep 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
 947    Eq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 7g   
 948    Eq 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
 949    Er 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 8g   
 950    Er 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
 951    Es 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 9g   
 952    Es 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
 953    FG 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 9s   
 954    FG 2E1515        38.6     0.      48.2 FIXEDHF     0.800  0       0.0  0                       
 955    FH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 10s  
 956    FH 2E1515        31.0     0.      38.7 FIXEDHF     0.800  0       0.0  0                       
 957    FI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 11s  
 958    FI 2E1515        25.5     0.      31.9 FIXEDHF     0.800  0       0.0  0                       
 959    FJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 12s  
 960    FJ 2E1515        21.5     0.      26.9 FIXEDHF     0.800  0       0.0  0                       
 961    FK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 13s  
 962    FK 2E1515        18.5     0.      23.1 FIXEDHF     0.800  0       0.0  0                       
 963    FL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 14s  
 964    FL 2E1515        16.1     0.      20.1 FIXEDHF     0.800  0       0.0  0                       
 965    FM 2D2516        85.0     0.     106.2 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s4d      
 966    FM 2E2516       -41.1     0.     -51.4 FIXEDHF     0.800  0       0.0  0                       
 967    FN 2D2516        66.9     0.      83.6 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s5d      
 968    FN 2E2516       -33.5     0.     -41.9 FIXEDHF     0.800  0       0.0  0                       
 969    FO 2D2516        52.4     0.      65.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s6d      
 970    FO 2E2516       -26.4     0.     -33.0 FIXEDHF     0.800  0       0.0  0                       
 971    FP 2D2516        44.3     0.      55.4 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s7d      
 972    FP 2E2516       -21.2     0.     -26.5 FIXEDHF     0.800  0       0.0  0                       
 973    FQ 2D2516        35.6     0.      44.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s8d      
 974    FQ 2E2516       -17.4     0.     -21.7 FIXEDHF     0.800  0       0.0  0                       
 975    FR 2D2516        29.2     0.      36.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s9d      
 976    FR 2E2516       -14.6     0.     -18.2 FIXEDHF     0.800  0       0.0  0                       
 977    FS 2D2516        24.4     0.      30.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s10d     
 978    FS 2E2516       -12.3     0.     -15.4 FIXEDHF     0.800  0       0.0  0                       
 979    FT 2D2516        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s11d     
 980    FT 2E2516       -10.6     0.     -13.3 FIXEDHF     0.800  0       0.0  0                       
 981    FU 2D2516        18.0     0.      22.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s12d     
 982    FU 2E2516        -9.3     0.     -11.6 FIXEDHF     0.800  0       0.0  0                       
 983    FV 2D2516        15.8     0.      19.7 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s13d     
 984    FV 2E2516        -8.2     0.     -10.2 FIXEDHF     0.800  0       0.0  0                       
 985    FW 2D2516        13.9     0.      17.4 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s14d     
 986    FW 2E2516        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0                       
 987    FX 2D2516        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s15d     
 988    FX 2E2516        -6.6     0.      -8.2 FIXEDHF     0.800  0       0.0  0                       
 989    FY 2D1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 4d   
 990    FY 2E1516        35.4     0.      44.2 FIXEDHF     0.800  0       0.0  0                       
 991    FZ 2D1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 5d   
 992    FZ 2E1516        28.2     0.      35.2 FIXEDHF     0.800  0       0.0  0                       
 993    Fa 2D1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 6d   
 994    Fa 2E1516        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0                       
 995    Fb 2D1516         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 7d   
 996    Fb 2E1516        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0                       
 997    Fc 2D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 8d   
 998    Fc 2E1516        14.2     0.      17.8 FIXEDHF     0.800  0       0.0  0                       
 999    Fd 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 9d   
1000    Fd 2E1516        11.8     0.      14.8 FIXEDHF     0.800  0       0.0  0                       
1001    Fe 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 10d  
1002    Fe 2E1516        10.0     0.      12.5 FIXEDHF     0.800  0       0.0  0                       
1003    Ff 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 11d  
1004    Ff 2E1516         8.6     0.      10.8 FIXEDHF     0.800  0       0.0  0                       
1005    Fg 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 12d  
1006    Fg 2E1516         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0                       
1007    Fh 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 13d  
1008    Fh 2E1516         6.6     0.       8.3 FIXEDHF     0.800  0       0.0  0                       
1009    Fi 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 14d  
1010    Fi 2E1516         5.9     0.       7.4 FIXEDHF     0.800  0       0.0  0                       
1011    Fo 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 5g   
1012    Fo 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
1013    Fp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 6g   
1014    Fp 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
1015    Fq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 7g   
1016    Fq 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
1017    Fr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 8g   
1018    Fr 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
1019    Fs 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 9g   
1020    Fs 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
1021    GH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 10s  
1022    GH 2E1515        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0                       
1023    GI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 11s  
1024    GI 2E1515        19.7     0.      24.6 FIXEDHF     0.800  0       0.0  0                       
1025    GJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 12s  
1026    GJ 2E1515        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0                       
1027    GK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 13s  
1028    GK 2E1515        14.2     0.      17.8 FIXEDHF     0.800  0       0.0  0                       
1029    GL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 14s  
1030    GL 2E1515        12.4     0.      15.5 FIXEDHF     0.800  0       0.0  0                       
1031    GM 2D2516        64.1     0.      80.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s4d      
1032    GM 2E2516       -31.4     0.     -39.2 FIXEDHF     0.800  0       0.0  0                       
1033    GN 2D2516        50.2     0.      62.7 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s5d      
1034    GN 2E2516       -25.6     0.     -32.0 FIXEDHF     0.800  0       0.0  0                       
1035    GO 2D2516        39.0     0.      48.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s6d      
1036    GO 2E2516       -20.2     0.     -25.2 FIXEDHF     0.800  0       0.0  0                       
1037    GP 2D2516        31.2     0.      39.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s7d      
1038    GP 2E2516       -16.2     0.     -20.2 FIXEDHF     0.800  0       0.0  0                       
1039    GQ 2D2516        26.5     0.      33.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s8d      
1040    GQ 2E2516       -13.3     0.     -16.6 FIXEDHF     0.800  0       0.0  0                       
1041    GR 2D2516        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s9d      
1042    GR 2E2516       -11.1     0.     -13.9 FIXEDHF     0.800  0       0.0  0                       
1043    GS 2D2516        18.5     0.      23.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s10d     
1044    GS 2E2516        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
1045    GT 2D2516        15.8     0.      19.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s11d     
1046    GT 2E2516        -8.1     0.     -10.1 FIXEDHF     0.800  0       0.0  0                       
1047    GU 2D2516        13.7     0.      17.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s12d     
1048    GU 2E2516        -7.1     0.      -8.9 FIXEDHF     0.800  0       0.0  0                       
1049    GV 2D2516        12.1     0.      15.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s13d     
1050    GV 2E2516        -6.2     0.      -7.8 FIXEDHF     0.800  0       0.0  0                       
1051    GW 2D2516        10.6     0.      13.3 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s14d     
1052    GW 2E2516        -5.6     0.      -7.0 FIXEDHF     0.800  0       0.0  0                       
1053    GX 2D2516         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s15d     
1054    GX 2E2516        -5.0     0.      -6.3 FIXEDHF     0.800  0       0.0  0                       
1055    GY 2D1516         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 4d   
1056    GY 2E1516        27.3     0.      34.1 FIXEDHF     0.800  0       0.0  0                       
1057    GZ 2D1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 5d   
1058    GZ 2E1516        21.8     0.      27.2 FIXEDHF     0.800  0       0.0  0                       
1059    Ga 2D1516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 6d   
1060    Ga 2E1516        16.9     0.      21.1 FIXEDHF     0.800  0       0.0  0                       
1061    Gb 2D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 7d   
1062    Gb 2E1516        13.4     0.      16.8 FIXEDHF     0.800  0       0.0  0                       
1063    Gc 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 8d   
1064    Gc 2E1516        11.0     0.      13.7 FIXEDHF     0.800  0       0.0  0                       
1065    Gd 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 9d   
1066    Gd 2E1516         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
1067    Ge 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 10d  
1068    Ge 2E1516         7.8     0.       9.7 FIXEDHF     0.800  0       0.0  0                       
1069    Gf 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 11d  
1070    Gf 2E1516         6.6     0.       8.3 FIXEDHF     0.800  0       0.0  0                       
1071    Gg 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 12d  
1072    Gg 2E1516         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0                       
1073    Gh 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 13d  
1074    Gh 2E1516         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0                       
1075    Gi 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 14d  
1076    Gi 2E1516         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0                       
1077    Go 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 5g   
1078    Go 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1079    Gp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 6g   
1080    Gp 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
1081    Gq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 7g   
1082    Gq 2E1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
1083    Gr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 8g   
1084    Gr 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1085    Gs 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 9g   
1086    Gs 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1087    HI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 11s  
1088    HI 2E1515        15.8     0.      19.7 FIXEDHF     0.800  0       0.0  0                       
1089    HJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 12s  
1090    HJ 2E1515        13.3     0.      16.6 FIXEDHF     0.800  0       0.0  0                       
1091    HK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 13s  
1092    HK 2E1515        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0                       
1093    HL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 14s  
1094    HL 2E1515         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0                       
1095    HM 2D2516        50.6     0.      63.2 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s4d      
1096    HM 2E2516       -25.0     0.     -31.2 FIXEDHF     0.800  0       0.0  0                       
1097    HN 2D2516        39.5     0.      49.4 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s5d      
1098    HN 2E2516       -20.4     0.     -25.5 FIXEDHF     0.800  0       0.0  0                       
1099    HO 2D2516        30.6     0.      38.3 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s6d      
1100    HO 2E2516       -16.1     0.     -20.1 FIXEDHF     0.800  0       0.0  0                       
1101    HP 2D2516        24.4     0.      30.5 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s7d      
1102    HP 2E2516       -12.9     0.     -16.1 FIXEDHF     0.800  0       0.0  0                       
1103    HQ 2D2516        20.0     0.      25.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s8d      
1104    HQ 2E2516       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
1105    HR 2D2516        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s9d      
1106    HR 2E2516        -8.9     0.     -11.1 FIXEDHF     0.800  0       0.0  0                       
1107    HS 2D2516        14.6     0.      18.2 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s10d     
1108    HS 2E2516        -7.5     0.      -9.4 FIXEDHF     0.800  0       0.0  0                       
1109    HT 2D2516        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s11d     
1110    HT 2E2516        -6.5     0.      -8.1 FIXEDHF     0.800  0       0.0  0                       
1111    HU 2D2516        10.8     0.      13.5 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s12d     
1112    HU 2E2516        -5.7     0.      -7.1 FIXEDHF     0.800  0       0.0  0                       
1113    HV 2D2516         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s13d     
1114    HV 2E2516        -5.0     0.      -6.2 FIXEDHF     0.800  0       0.0  0                       
1115    HW 2D2516         8.5     0.      10.6 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s14d     
1116    HW 2E2516        -4.4     0.      -5.5 FIXEDHF     0.800  0       0.0  0                       
1117    HX 2D2516         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s15d     
1118    HX 2E2516        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
1119    HY 2D1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 4d   
1120    HY 2E1516        21.8     0.      27.3 FIXEDHF     0.800  0       0.0  0                       
1121    HZ 2D1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 5d   
1122    HZ 2E1516        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0                       
1123    Ha 2D1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 6d   
1124    Ha 2E1516        13.5     0.      16.9 FIXEDHF     0.800  0       0.0  0                       
1125    Hb 2D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 7d   
1126    Hb 2E1516        10.8     0.      13.5 FIXEDHF     0.800  0       0.0  0                       
1127    Hc 2D1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 8d   
1128    Hc 2E1516         8.8     0.      11.0 FIXEDHF     0.800  0       0.0  0                       
1129    Hd 2D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 9d   
1130    Hd 2E1516         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0                       
1131    He 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 10d  
1132    He 2E1516         6.2     0.       7.7 FIXEDHF     0.800  0       0.0  0                       
1133    Hf 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 11d  
1134    Hf 2E1516         5.4     0.       6.7 FIXEDHF     0.800  0       0.0  0                       
1135    Hg 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 12d  
1136    Hg 2E1516         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0                       
1137    Hh 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 13d  
1138    Hh 2E1516         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0                       
1139    Hi 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 14d  
1140    Hi 2E1516         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0                       
1141    Ho 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 5g   
1142    Ho 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1143    Hp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 6g   
1144    Hp 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1145    Hq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 7g   
1146    Hq 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1147    Hr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 8g   
1148    Hr 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1149    Hs 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 9g   
1150    Hs 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1151    IJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 12s  
1152    IJ 2E1515        11.0     0.      13.7 FIXEDHF     0.800  0       0.0  0                       
1153    IK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 13s  
1154    IK 2E1515         9.4     0.      11.8 FIXEDHF     0.800  0       0.0  0                       
1155    IL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 14s  
1156    IL 2E1515         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0                       
1157    IM 2D2516        41.3     0.      51.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s4d      
1158    IM 2E2516       -20.5     0.     -25.6 FIXEDHF     0.800  0       0.0  0                       
1159    IN 2D2516        32.2     0.      40.3 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s5d      
1160    IN 2E2516       -16.7     0.     -20.9 FIXEDHF     0.800  0       0.0  0                       
1161    IO 2D2516        25.0     0.      31.2 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s6d      
1162    IO 2E2516       -13.2     0.     -16.5 FIXEDHF     0.800  0       0.0  0                       
1163    IP 2D2516        19.8     0.      24.8 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s7d      
1164    IP 2E2516       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
1165    IQ 2D2516        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s8d      
1166    IQ 2E2516        -8.7     0.     -10.9 FIXEDHF     0.800  0       0.0  0                       
1167    IR 2D2516        13.5     0.      16.9 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s9d      
1168    IR 2E2516        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0                       
1169    IS 2D2516        11.8     0.      14.7 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s10d     
1170    IS 2E2516        -6.2     0.      -7.7 FIXEDHF     0.800  0       0.0  0                       
1171    IT 2D2516        10.1     0.      12.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s11d     
1172    IT 2E2516        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
1173    IU 2D2516         8.8     0.      11.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s12d     
1174    IU 2E2516        -4.6     0.      -5.8 FIXEDHF     0.800  0       0.0  0                       
1175    IV 2D2516         7.8     0.       9.7 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s13d     
1176    IV 2E2516        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
1177    IW 2D2516         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s14d     
1178    IW 2E2516        -3.7     0.      -4.6 FIXEDHF     0.800  0       0.0  0                       
1179    IX 2D2516         6.2     0.       7.7 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s15d     
1180    IX 2E2516        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0                       
1181    IY 2D1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 4d   
1182    IY 2E1516        18.0     0.      22.5 FIXEDHF     0.800  0       0.0  0                       
1183    IZ 2D1516         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 5d   
1184    IZ 2E1516        14.3     0.      17.9 FIXEDHF     0.800  0       0.0  0                       
1185    Ia 2D1516         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 6d   
1186    Ia 2E1516        11.2     0.      14.0 FIXEDHF     0.800  0       0.0  0                       
1187    Ib 2D1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 7d   
1188    Ib 2E1516         8.9     0.      11.1 FIXEDHF     0.800  0       0.0  0                       
1189    Ic 2D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 8d   
1190    Ic 2E1516         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0                       
1191    Id 2D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 9d   
1192    Id 2E1516         6.0     0.       7.5 FIXEDHF     0.800  0       0.0  0                       
1193    Ie 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 10d  
1194    Ie 2E1516         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0                       
1195    If 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 11d  
1196    If 2E1516         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0                       
1197    Ig 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 12d  
1198    Ig 2E1516         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0                       
1199    Ih 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 13d  
1200    Ih 2E1516         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
1201    Ii 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 14d  
1202    Ii 2E1516         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
1203    Io 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 5g   
1204    Io 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1205    Ip 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 6g   
1206    Ip 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1207    Iq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 7g   
1208    Iq 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1209    Ir 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 8g   
1210    Ir 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1211    Is 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 9g   
1212    Is 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1213    JK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 13s  
1214    JK 2E1515         7.9     0.       9.9 FIXEDHF     0.800  0       0.0  0                       
1215    JL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 14s  
1216    JL 2E1515         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0                       
1217    JM 2D2516        34.6     0.      43.2 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s4d      
1218    JM 2E2516       -17.2     0.     -21.5 FIXEDHF     0.800  0       0.0  0                       
1219    JN 2D2516        27.0     0.      33.7 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s5d      
1220    JN 2E2516       -14.1     0.     -17.6 FIXEDHF     0.800  0       0.0  0                       
1221    JO 2D2516        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s6d      
1222    JO 2E2516       -11.1     0.     -13.9 FIXEDHF     0.800  0       0.0  0                       
1223    JP 2D2516        16.5     0.      20.6 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s7d      
1224    JP 2E2516        -8.9     0.     -11.1 FIXEDHF     0.800  0       0.0  0                       
1225    JQ 2D2516        13.4     0.      16.8 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s8d      
1226    JQ 2E2516        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0                       
1227    JR 2D2516        11.3     0.      14.1 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s9d      
1228    JR 2E2516        -6.1     0.      -7.6 FIXEDHF     0.800  0       0.0  0                       
1229    JS 2D2516         9.6     0.      12.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s10d     
1230    JS 2E2516        -5.2     0.      -6.5 FIXEDHF     0.800  0       0.0  0                       
1231    JT 2D2516         8.4     0.      10.5 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s11d     
1232    JT 2E2516        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0                       
1233    JU 2D2516         7.4     0.       9.2 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s12d     
1234    JU 2E2516        -3.9     0.      -4.9 FIXEDHF     0.800  0       0.0  0                       
1235    JV 2D2516         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s13d     
1236    JV 2E2516        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0                       
1237    JW 2D2516         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s14d     
1238    JW 2E2516        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
1239    JX 2D2516         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s15d     
1240    JX 2E2516        -2.7     0.      -3.4 FIXEDHF     0.800  0       0.0  0                       
1241    JY 2D1516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 4d   
1242    JY 2E1516        15.2     0.      19.0 FIXEDHF     0.800  0       0.0  0                       
1243    JZ 2D1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 5d   
1244    JZ 2E1516        12.1     0.      15.1 FIXEDHF     0.800  0       0.0  0                       
1245    Ja 2D1516         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 6d   
1246    Ja 2E1516         9.4     0.      11.8 FIXEDHF     0.800  0       0.0  0                       
1247    Jb 2D1516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 7d   
1248    Jb 2E1516         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0                       
1249    Jc 2D1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 8d   
1250    Jc 2E1516         6.1     0.       7.6 FIXEDHF     0.800  0       0.0  0                       
1251    Jd 2D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 9d   
1252    Jd 2E1516         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0                       
1253    Je 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 10d  
1254    Je 2E1516         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
1255    Jf 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 11d  
1256    Jf 2E1516         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0                       
1257    Jg 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 12d  
1258    Jg 2E1516         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0                       
1259    Jh 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 13d  
1260    Jh 2E1516         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0                       
1261    Ji 2D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 14d  
1262    Ji 2E1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0                       
1263    Jo 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 5g   
1264    Jo 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1265    Jp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 6g   
1266    Jp 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1267    Jq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 7g   
1268    Jq 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1269    Jr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 8g   
1270    Jr 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1271    Js 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 9g   
1272    Js 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1273    KL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 14s  
1274    KL 2E1515         5.9     0.       7.4 FIXEDHF     0.800  0       0.0  0                       
1275    KM 2D2516        29.4     0.      36.8 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s4d      
1276    KM 2E2516       -14.7     0.     -18.4 FIXEDHF     0.800  0       0.0  0                       
1277    KN 2D2516        23.0     0.      28.7 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s5d      
1278    KN 2E2516       -12.0     0.     -15.0 FIXEDHF     0.800  0       0.0  0                       
1279    KO 2D2516        17.8     0.      22.2 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s6d      
1280    KO 2E2516        -9.5     0.     -11.9 FIXEDHF     0.800  0       0.0  0                       
1281    KP 2D2516        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s7d      
1282    KP 2E2516        -7.6     0.      -9.5 FIXEDHF     0.800  0       0.0  0                       
1283    KQ 2D2516        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s8d      
1284    KQ 2E2516        -6.2     0.      -7.8 FIXEDHF     0.800  0       0.0  0                       
1285    KR 2D2516         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s9d      
1286    KR 2E2516        -5.2     0.      -6.5 FIXEDHF     0.800  0       0.0  0                       
1287    KS 2D2516         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s10d     
1288    KS 2E2516        -4.4     0.      -5.5 FIXEDHF     0.800  0       0.0  0                       
1289    KT 2D2516         7.0     0.       8.8 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s11d     
1290    KT 2E2516        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
1291    KU 2D2516         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s12d     
1292    KU 2E2516        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1293    KV 2D2516         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s13d     
1294    KV 2E2516        -3.0     0.      -3.7 FIXEDHF     0.800  0       0.0  0                       
1295    KW 2D2516         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s14d     
1296    KW 2E2516        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
1297    KX 2D2516         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s15d     
1298    KX 2E2516        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
1299    KY 2D1516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 4d   
1300    KY 2E1516        13.0     0.      16.3 FIXEDHF     0.800  0       0.0  0                       
1301    KZ 2D1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 5d   
1302    KZ 2E1516        10.4     0.      13.0 FIXEDHF     0.800  0       0.0  0                       
1303    Ka 2D1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 6d   
1304    Ka 2E1516         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
1305    Kb 2D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 7d   
1306    Kb 2E1516         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
1307    Kc 2D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 8d   
1308    Kc 2E1516         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0                       
1309    Kd 2D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 9d   
1310    Kd 2E1516         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
1311    Ke 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 10d  
1312    Ke 2E1516         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0                       
1313    Kf 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 11d  
1314    Kf 2E1516         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0                       
1315    Kg 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 12d  
1316    Kg 2E1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0                       
1317    Kh 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 13d  
1318    Kh 2E1516         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0                       
1319    Ki 2D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 14d  
1320    Ki 2E1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0                       
1321    Ko 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 5g   
1322    Ko 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1323    Kp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 6g   
1324    Kp 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1325    Kq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 7g   
1326    Kq 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1327    Kr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 8g   
1328    Kr 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1329    Ks 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 9g   
1330    Ks 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1331    LM 2D2516        25.4     0.      31.8 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s4d      
1332    LM 2E2516       -12.8     0.     -16.0 FIXEDHF     0.800  0       0.0  0                       
1333    LN 2D2516        19.8     0.      24.8 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s5d      
1334    LN 2E2516       -10.5     0.     -13.1 FIXEDHF     0.800  0       0.0  0                       
1335    LO 2D2516        15.4     0.      19.2 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s6d      
1336    LO 2E2516        -8.2     0.     -10.3 FIXEDHF     0.800  0       0.0  0                       
1337    LP 2D2516        12.2     0.      15.2 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s7d      
1338    LP 2E2516        -6.6     0.      -8.3 FIXEDHF     0.800  0       0.0  0                       
1339    LQ 2D2516         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s8d      
1340    LQ 2E2516        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0                       
1341    LR 2D2516         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s9d      
1342    LR 2E2516        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
1343    LS 2D2516         7.0     0.       8.8 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s10d     
1344    LS 2E2516        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
1345    LT 2D2516         6.1     0.       7.6 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s11d     
1346    LT 2E2516        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1347    LU 2D2516         5.3     0.       6.6 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s12d     
1348    LU 2E2516        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
1349    LV 2D2516         4.7     0.       5.9 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s13d     
1350    LV 2E2516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1351    LW 2D2516         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s14d     
1352    LW 2E2516        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
1353    LX 2D2516         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s15d     
1354    LX 2E2516        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
1355    LY 2D1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 4d   
1356    LY 2E1516        11.4     0.      14.2 FIXEDHF     0.800  0       0.0  0                       
1357    LZ 2D1516         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 5d   
1358    LZ 2E1516         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0                       
1359    La 2D1516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 6d   
1360    La 2E1516         7.0     0.       8.8 FIXEDHF     0.800  0       0.0  0                       
1361    Lb 2D1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 7d   
1362    Lb 2E1516         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
1363    Lc 2D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 8d   
1364    Lc 2E1516         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0                       
1365    Ld 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 9d   
1366    Ld 2E1516         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
1367    Le 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 10d  
1368    Le 2E1516         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0                       
1369    Lf 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 11d  
1370    Lf 2E1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0                       
1371    Lg 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 12d  
1372    Lg 2E1516         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
1373    Lh 2D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 13d  
1374    Lh 2E1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0                       
1375    Li 2D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 14d  
1376    Li 2E1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0                       
1377    Lo 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 5g   
1378    Lo 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1379    Lp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 6g   
1380    Lp 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1381    Lq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 7g   
1382    Lq 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1383    Lr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 8g   
1384    Lr 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1385    Ls 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 9g   
1386    Ls 2E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1387    MN 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s5d      
1388    MN 2E2626       603.0     0.     753.7 FIXEDHF     0.800  0       0.0  0                       
1389    MO 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s6d      
1390    MO 2E2626       453.5     0.     566.9 FIXEDHF     0.800  0       0.0  0                       
1391    MP 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s7d      
1392    MP 2E2626       354.2     0.     442.8 FIXEDHF     0.800  0       0.0  0                       
1393    MQ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s8d      
1394    MQ 2E2626       285.5     0.     356.9 FIXEDHF     0.800  0       0.0  0                       
1395    MR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s9d      
1396    MR 2E2626       236.1     0.     295.1 FIXEDHF     0.800  0       0.0  0                       
1397    MS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s10d     
1398    MS 2E2626       199.0     0.     248.8 FIXEDHF     0.800  0       0.0  0                       
1399    MT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s11d     
1400    MT 2E2626       170.8     0.     213.5 FIXEDHF     0.800  0       0.0  0                       
1401    MU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s12d     
1402    MU 2E2626       148.6     0.     185.8 FIXEDHF     0.800  0       0.0  0                       
1403    MV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s13d     
1404    MV 2E2626       130.7     0.     163.4 FIXEDHF     0.800  0       0.0  0                       
1405    MW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s14d     
1406    MW 2E2626       116.2     0.     145.2 FIXEDHF     0.800  0       0.0  0                       
1407    MX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s15d     
1408    MX 2E2626       104.2     0.     130.2 FIXEDHF     0.800  0       0.0  0                       
1409    MY 2D1112       699.7     0.     874.6 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 4d   
1410    MY 2D1626      -658.2     0.    -822.7 FIXEDHF     0.800  0       0.0  0                       
1411    MY 2E1626       -18.7     0.     -23.4 FIXEDHF     0.800  0       0.0  0                       
1412    MZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 5d   
1413    MZ 2D1626      -369.0     0.    -461.3 FIXEDHF     0.800  0       0.0  0                       
1414    MZ 2E1626       -17.9     0.     -22.4 FIXEDHF     0.800  0       0.0  0                       
1415    Ma 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 6d   
1416    Ma 2D1626      -250.1     0.    -312.6 FIXEDHF     0.800  0       0.0  0                       
1417    Ma 2E1626       -14.8     0.     -18.5 FIXEDHF     0.800  0       0.0  0                       
1418    Mb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 7d   
1419    Mb 2D1626      -184.4     0.    -230.5 FIXEDHF     0.800  0       0.0  0                       
1420    Mb 2E1626       -12.2     0.     -15.2 FIXEDHF     0.800  0       0.0  0                       
1421    Mc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 8d   
1422    Mc 2D1626      -143.4     0.    -179.2 FIXEDHF     0.800  0       0.0  0                       
1423    Mc 2E1626       -10.0     0.     -12.5 FIXEDHF     0.800  0       0.0  0                       
1424    Md 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 9d   
1425    Md 2D1626      -115.6     0.    -144.5 FIXEDHF     0.800  0       0.0  0                       
1426    Md 2E1626        -8.5     0.     -10.6 FIXEDHF     0.800  0       0.0  0                       
1427    Me 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 10d  
1428    Me 2D1626       -95.8     0.    -119.7 FIXEDHF     0.800  0       0.0  0                       
1429    Me 2E1626        -7.2     0.      -9.0 FIXEDHF     0.800  0       0.0  0                       
1430    Mf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 11d  
1431    Mf 2D1626       -81.0     0.    -101.3 FIXEDHF     0.800  0       0.0  0                       
1432    Mf 2E1626        -6.2     0.      -7.8 FIXEDHF     0.800  0       0.0  0                       
1433    Mg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 12d  
1434    Mg 2D1626       -69.7     0.     -87.1 FIXEDHF     0.800  0       0.0  0                       
1435    Mg 2E1626        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0                       
1436    Mh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 13d  
1437    Mh 2D1626       -60.8     0.     -76.0 FIXEDHF     0.800  0       0.0  0                       
1438    Mh 2E1626        -4.8     0.      -6.0 FIXEDHF     0.800  0       0.0  0                       
1439    Mi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 14d  
1440    Mi 2D1626       -53.6     0.     -67.0 FIXEDHF     0.800  0       0.0  0                       
1441    Mi 2E1626        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0                       
1442    Mo 2D1627        42.6     0.      53.3 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 5g   
1443    Mo 2E1627         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1444    Mp 2D1627        40.2     0.      50.2 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 6g   
1445    Mp 2E1627         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1446    Mq 2D1627        34.9     0.      43.6 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 7g   
1447    Mq 2E1627         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1448    Mr 2D1627        30.1     0.      37.6 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 8g   
1449    Mr 2E1627         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1450    Ms 2D1627        26.0     0.      32.5 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 9g   
1451    Ms 2E1627         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1452    Mz 1D2633      7905.5     0.    9881.9 FIXEDHF     0.800  0       0.0  0  4s4d      -d10 4p2   
1453    NO 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s6d      
1454    NO 2E2626       337.6     0.     422.0 FIXEDHF     0.800  0       0.0  0                       
1455    NP 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s7d      
1456    NP 2E2626       263.9     0.     329.9 FIXEDHF     0.800  0       0.0  0                       
1457    NQ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s8d      
1458    NQ 2E2626       213.0     0.     266.2 FIXEDHF     0.800  0       0.0  0                       
1459    NR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s9d      
1460    NR 2E2626       176.2     0.     220.2 FIXEDHF     0.800  0       0.0  0                       
1461    NS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s10d     
1462    NS 2E2626       148.6     0.     185.7 FIXEDHF     0.800  0       0.0  0                       
1463    NT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s11d     
1464    NT 2E2626       127.5     0.     159.4 FIXEDHF     0.800  0       0.0  0                       
1465    NU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s12d     
1466    NU 2E2626       111.0     0.     138.7 FIXEDHF     0.800  0       0.0  0                       
1467    NV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s13d     
1468    NV 2E2626        97.6     0.     122.0 FIXEDHF     0.800  0       0.0  0                       
1469    NW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s14d     
1470    NW 2E2626        86.8     0.     108.5 FIXEDHF     0.800  0       0.0  0                       
1471    NX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s15d     
1472    NX 2E2626        77.8     0.      97.3 FIXEDHF     0.800  0       0.0  0                       
1473    NY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 4d   
1474    NY 2D1626      -368.1     0.    -460.1 FIXEDHF     0.800  0       0.0  0                       
1475    NY 2E1626       -12.3     0.     -15.4 FIXEDHF     0.800  0       0.0  0                       
1476    NZ 2D1112       702.1     0.     877.6 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 5d   
1477    NZ 2D1626      -281.0     0.    -351.3 FIXEDHF     0.800  0       0.0  0                       
1478    NZ 2E1626       -12.3     0.     -15.4 FIXEDHF     0.800  0       0.0  0                       
1479    Na 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 6d   
1480    Na 2D1626      -190.6     0.    -238.3 FIXEDHF     0.800  0       0.0  0                       
1481    Na 2E1626       -10.3     0.     -12.9 FIXEDHF     0.800  0       0.0  0                       
1482    Nb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 7d   
1483    Nb 2D1626      -141.4     0.    -176.8 FIXEDHF     0.800  0       0.0  0                       
1484    Nb 2E1626        -8.5     0.     -10.6 FIXEDHF     0.800  0       0.0  0                       
1485    Nc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 8d   
1486    Nc 2D1626      -110.4     0.    -138.0 FIXEDHF     0.800  0       0.0  0                       
1487    Nc 2E1626        -7.1     0.      -8.9 FIXEDHF     0.800  0       0.0  0                       
1488    Nd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 9d   
1489    Nd 2D1626       -89.3     0.    -111.6 FIXEDHF     0.800  0       0.0  0                       
1490    Nd 2E1626        -6.0     0.      -7.5 FIXEDHF     0.800  0       0.0  0                       
1491    Ne 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 10d  
1492    Ne 2D1626       -74.2     0.     -92.7 FIXEDHF     0.800  0       0.0  0                       
1493    Ne 2E1626        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0                       
1494    Nf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 11d  
1495    Nf 2D1626       -62.9     0.     -78.6 FIXEDHF     0.800  0       0.0  0                       
1496    Nf 2E1626        -4.4     0.      -5.5 FIXEDHF     0.800  0       0.0  0                       
1497    Ng 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 12d  
1498    Ng 2D1626       -54.2     0.     -67.7 FIXEDHF     0.800  0       0.0  0                       
1499    Ng 2E1626        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
1500    Nh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 13d  
1501    Nh 2D1626       -47.3     0.     -59.1 FIXEDHF     0.800  0       0.0  0                       
1502    Nh 2E1626        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0                       
1503    Ni 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 14d  
1504    Ni 2D1626       -41.8     0.     -52.2 FIXEDHF     0.800  0       0.0  0                       
1505    Ni 2E1626        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
1506    No 2D1627       -11.6     0.     -14.5 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 5g   
1507    No 2E1627         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1508    Np 2D1627        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 6g   
1509    Np 2E1627         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1510    Nq 2D1627         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 7g   
1511    Nq 2E1627         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1512    Nr 2D1627         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 8g   
1513    Nr 2E1627         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1514    Ns 2D1627         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 9g   
1515    Ns 2E1627         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1516    Nz 1D2633      5459.9     0.    6824.9 FIXEDHF     0.800  0       0.0  0  4s5d      -d10 4p2   
1517    OP 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s7d      
1518    OP 2E2626       199.3     0.     249.1 FIXEDHF     0.800  0       0.0  0                       
1519    OQ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s8d      
1520    OQ 2E2626       160.8     0.     201.0 FIXEDHF     0.800  0       0.0  0                       
1521    OR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s9d      
1522    OR 2E2626       133.0     0.     166.3 FIXEDHF     0.800  0       0.0  0                       
1523    OS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s10d     
1524    OS 2E2626       112.2     0.     140.3 FIXEDHF     0.800  0       0.0  0                       
1525    OT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s11d     
1526    OT 2E2626        96.3     0.     120.4 FIXEDHF     0.800  0       0.0  0                       
1527    OU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s12d     
1528    OU 2E2626        83.8     0.     104.8 FIXEDHF     0.800  0       0.0  0                       
1529    OV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s13d     
1530    OV 2E2626        73.8     0.      92.2 FIXEDHF     0.800  0       0.0  0                       
1531    OW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s14d     
1532    OW 2E2626        65.6     0.      82.0 FIXEDHF     0.800  0       0.0  0                       
1533    OX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s15d     
1534    OX 2E2626        58.8     0.      73.5 FIXEDHF     0.800  0       0.0  0                       
1535    OY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 4d   
1536    OY 2D1626      -249.5     0.    -311.9 FIXEDHF     0.800  0       0.0  0                       
1537    OY 2E1626        -8.6     0.     -10.7 FIXEDHF     0.800  0       0.0  0                       
1538    OZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 5d   
1539    OZ 2D1626      -191.1     0.    -238.9 FIXEDHF     0.800  0       0.0  0                       
1540    OZ 2E1626        -8.9     0.     -11.1 FIXEDHF     0.800  0       0.0  0                       
1541    Oa 2D1112       703.6     0.     879.5 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 6d   
1542    Oa 2D1626      -144.9     0.    -181.1 FIXEDHF     0.800  0       0.0  0                       
1543    Oa 2E1626        -7.5     0.      -9.4 FIXEDHF     0.800  0       0.0  0                       
1544    Ob 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 7d   
1545    Ob 2D1626      -107.4     0.    -134.2 FIXEDHF     0.800  0       0.0  0                       
1546    Ob 2E1626        -6.2     0.      -7.8 FIXEDHF     0.800  0       0.0  0                       
1547    Oc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 8d   
1548    Oc 2D1626       -84.0     0.    -105.0 FIXEDHF     0.800  0       0.0  0                       
1549    Oc 2E1626        -5.2     0.      -6.5 FIXEDHF     0.800  0       0.0  0                       
1550    Od 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 9d   
1551    Od 2D1626       -68.1     0.     -85.1 FIXEDHF     0.800  0       0.0  0                       
1552    Od 2E1626        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0                       
1553    Oe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 10d  
1554    Oe 2D1626       -56.6     0.     -70.7 FIXEDHF     0.800  0       0.0  0                       
1555    Oe 2E1626        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
1556    Of 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 11d  
1557    Of 2D1626       -48.0     0.     -60.0 FIXEDHF     0.800  0       0.0  0                       
1558    Of 2E1626        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0                       
1559    Og 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 12d  
1560    Og 2D1626       -41.4     0.     -51.8 FIXEDHF     0.800  0       0.0  0                       
1561    Og 2E1626        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
1562    Oh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 13d  
1563    Oh 2D1626       -36.2     0.     -45.2 FIXEDHF     0.800  0       0.0  0                       
1564    Oh 2E1626        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1565    Oi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 14d  
1566    Oi 2D1626       -32.0     0.     -40.0 FIXEDHF     0.800  0       0.0  0                       
1567    Oi 2E1626        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
1568    Oo 2D1627        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 5g   
1569    Oo 2E1627         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1570    Op 2D1627        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 6g   
1571    Op 2E1627         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1572    Oq 2D1627        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 7g   
1573    Oq 2E1627         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1574    Or 2D1627        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 8g   
1575    Or 2E1627         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1576    Os 2D1627        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 9g   
1577    Os 2E1627         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1578    Oz 1D2633      3983.5     0.    4979.4 FIXEDHF     0.800  0       0.0  0  4s6d      -d10 4p2   
1579    PQ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s8d      
1580    PQ 2E2626       125.8     0.     157.3 FIXEDHF     0.800  0       0.0  0                       
1581    PR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s9d      
1582    PR 2E2626       104.2     0.     130.2 FIXEDHF     0.800  0       0.0  0                       
1583    PS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s10d     
1584    PS 2E2626        87.8     0.     109.8 FIXEDHF     0.800  0       0.0  0                       
1585    PT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s11d     
1586    PT 2E2626        75.4     0.      94.3 FIXEDHF     0.800  0       0.0  0                       
1587    PU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s12d     
1588    PU 2E2626        65.7     0.      82.1 FIXEDHF     0.800  0       0.0  0                       
1589    PV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s13d     
1590    PV 2E2626        57.8     0.      72.2 FIXEDHF     0.800  0       0.0  0                       
1591    PW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s14d     
1592    PW 2E2626        51.4     0.      64.2 FIXEDHF     0.800  0       0.0  0                       
1593    PX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s15d     
1594    PX 2E2626        46.1     0.      57.6 FIXEDHF     0.800  0       0.0  0                       
1595    PY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 4d   
1596    PY 2D1626      -184.3     0.    -230.4 FIXEDHF     0.800  0       0.0  0                       
1597    PY 2E1626        -6.4     0.      -8.0 FIXEDHF     0.800  0       0.0  0                       
1598    PZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 5d   
1599    PZ 2D1626      -142.1     0.    -177.6 FIXEDHF     0.800  0       0.0  0                       
1600    PZ 2E1626        -6.7     0.      -8.4 FIXEDHF     0.800  0       0.0  0                       
1601    Pa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 6d   
1602    Pa 2D1626      -107.7     0.    -134.6 FIXEDHF     0.800  0       0.0  0                       
1603    Pa 2E1626        -5.8     0.      -7.2 FIXEDHF     0.800  0       0.0  0                       
1604    Pb 2D1112       704.5     0.     880.6 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 7d   
1605    Pb 2D1626       -84.2     0.    -105.2 FIXEDHF     0.800  0       0.0  0                       
1606    Pb 2E1626        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0                       
1607    Pc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 8d   
1608    Pc 2D1626       -65.8     0.     -82.2 FIXEDHF     0.800  0       0.0  0                       
1609    Pc 2E1626        -3.9     0.      -4.9 FIXEDHF     0.800  0       0.0  0                       
1610    Pd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 9d   
1611    Pd 2D1626       -53.3     0.     -66.6 FIXEDHF     0.800  0       0.0  0                       
1612    Pd 2E1626        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1613    Pe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 10d  
1614    Pe 2D1626       -44.4     0.     -55.5 FIXEDHF     0.800  0       0.0  0                       
1615    Pe 2E1626        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
1616    Pf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 11d  
1617    Pf 2D1626       -37.7     0.     -47.1 FIXEDHF     0.800  0       0.0  0                       
1618    Pf 2E1626        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1619    Pg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 12d  
1620    Pg 2D1626       -32.6     0.     -40.7 FIXEDHF     0.800  0       0.0  0                       
1621    Pg 2E1626        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1622    Ph 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 13d  
1623    Ph 2D1626       -28.4     0.     -35.5 FIXEDHF     0.800  0       0.0  0                       
1624    Ph 2E1626        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
1625    Pi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 14d  
1626    Pi 2D1626       -25.1     0.     -31.4 FIXEDHF     0.800  0       0.0  0                       
1627    Pi 2E1626        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
1628    Po 2D1627        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 5g   
1629    Po 2E1627         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1630    Pp 2D1627        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 6g   
1631    Pp 2E1627         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1632    Pq 2D1627        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 7g   
1633    Pq 2E1627         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1634    Pr 2D1627        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 8g   
1635    Pr 2E1627         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1636    Ps 2D1627        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 9g   
1637    Ps 2E1627         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1638    Pz 1D2633      3058.1     0.    3822.6 FIXEDHF     0.800  0       0.0  0  4s7d      -d10 4p2   
1639    QR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s9d      
1640    QR 2E2626        84.1     0.     105.1 FIXEDHF     0.800  0       0.0  0                       
1641    QS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s10d     
1642    QS 2E2626        71.0     0.      88.7 FIXEDHF     0.800  0       0.0  0                       
1643    QT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s11d     
1644    QT 2E2626        60.9     0.      76.1 FIXEDHF     0.800  0       0.0  0                       
1645    QU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s12d     
1646    QU 2E2626        53.0     0.      66.3 FIXEDHF     0.800  0       0.0  0                       
1647    QV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s13d     
1648    QV 2E2626        46.6     0.      58.3 FIXEDHF     0.800  0       0.0  0                       
1649    QW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s14d     
1650    QW 2E2626        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0                       
1651    QX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s15d     
1652    QX 2E2626        37.2     0.      46.5 FIXEDHF     0.800  0       0.0  0                       
1653    QY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 4d   
1654    QY 2D1626      -143.5     0.    -179.4 FIXEDHF     0.800  0       0.0  0                       
1655    QY 2E1626        -5.0     0.      -6.2 FIXEDHF     0.800  0       0.0  0                       
1656    QZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 5d   
1657    QZ 2D1626      -111.1     0.    -138.9 FIXEDHF     0.800  0       0.0  0                       
1658    QZ 2E1626        -5.4     0.      -6.7 FIXEDHF     0.800  0       0.0  0                       
1659    Qa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 6d   
1660    Qa 2D1626       -84.5     0.    -105.6 FIXEDHF     0.800  0       0.0  0                       
1661    Qa 2E1626        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
1662    Qb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 7d   
1663    Qb 2D1626       -65.9     0.     -82.4 FIXEDHF     0.800  0       0.0  0                       
1664    Qb 2E1626        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
1665    Qc 2D1112       705.0     0.     881.2 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 8d   
1666    Qc 2D1626       -53.0     0.     -66.3 FIXEDHF     0.800  0       0.0  0                       
1667    Qc 2E1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
1668    Qd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 9d   
1669    Qd 2D1626       -43.0     0.     -53.7 FIXEDHF     0.800  0       0.0  0                       
1670    Qd 2E1626        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
1671    Qe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 10d  
1672    Qe 2D1626       -35.8     0.     -44.8 FIXEDHF     0.800  0       0.0  0                       
1673    Qe 2E1626        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
1674    Qf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 11d  
1675    Qf 2D1626       -30.4     0.     -38.0 FIXEDHF     0.800  0       0.0  0                       
1676    Qf 2E1626        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0                       
1677    Qg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 12d  
1678    Qg 2D1626       -26.2     0.     -32.8 FIXEDHF     0.800  0       0.0  0                       
1679    Qg 2E1626        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
1680    Qh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 13d  
1681    Qh 2D1626       -23.0     0.     -28.7 FIXEDHF     0.800  0       0.0  0                       
1682    Qh 2E1626        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
1683    Qi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 14d  
1684    Qi 2D1626       -20.3     0.     -25.4 FIXEDHF     0.800  0       0.0  0                       
1685    Qi 2E1626        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1686    Qo 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 5g   
1687    Qo 2E1627         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1688    Qp 2D1627        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 6g   
1689    Qp 2E1627         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1690    Qq 2D1627        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 7g   
1691    Qq 2E1627         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1692    Qr 2D1627        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 8g   
1693    Qr 2E1627         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1694    Qs 2D1627        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 9g   
1695    Qs 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1696    Qz 1D2633      2438.2     0.    3047.8 FIXEDHF     0.800  0       0.0  0  4s8d      -d10 4p2   
1697    RS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s10d     
1698    RS 2E2626        58.7     0.      73.4 FIXEDHF     0.800  0       0.0  0                       
1699    RT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s11d     
1700    RT 2E2626        50.4     0.      63.0 FIXEDHF     0.800  0       0.0  0                       
1701    RU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s12d     
1702    RU 2E2626        43.8     0.      54.8 FIXEDHF     0.800  0       0.0  0                       
1703    RV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s13d     
1704    RV 2E2626        38.6     0.      48.3 FIXEDHF     0.800  0       0.0  0                       
1705    RW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s14d     
1706    RW 2E2626        34.3     0.      42.9 FIXEDHF     0.800  0       0.0  0                       
1707    RX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s15d     
1708    RX 2E2626        30.8     0.      38.5 FIXEDHF     0.800  0       0.0  0                       
1709    RY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 4d   
1710    RY 2D1626      -115.9     0.    -144.9 FIXEDHF     0.800  0       0.0  0                       
1711    RY 2E1626        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
1712    RZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 5d   
1713    RZ 2D1626       -90.1     0.    -112.6 FIXEDHF     0.800  0       0.0  0                       
1714    RZ 2E1626        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0                       
1715    Ra 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 6d   
1716    Ra 2D1626       -68.6     0.     -85.7 FIXEDHF     0.800  0       0.0  0                       
1717    Ra 2E1626        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
1718    Rb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 7d   
1719    Rb 2D1626       -53.6     0.     -67.0 FIXEDHF     0.800  0       0.0  0                       
1720    Rb 2E1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
1721    Rc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 8d   
1722    Rc 2D1626       -43.1     0.     -53.9 FIXEDHF     0.800  0       0.0  0                       
1723    Rc 2E1626        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1724    Rd 2D1112       705.3     0.     881.6 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 9d   
1725    Rd 2D1626       -35.6     0.     -44.5 FIXEDHF     0.800  0       0.0  0                       
1726    Rd 2E1626        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1727    Re 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 10d  
1728    Re 2D1626       -29.6     0.     -37.0 FIXEDHF     0.800  0       0.0  0                       
1729    Re 2E1626        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1730    Rf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 11d  
1731    Rf 2D1626       -25.1     0.     -31.4 FIXEDHF     0.800  0       0.0  0                       
1732    Rf 2E1626        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1733    Rg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 12d  
1734    Rg 2D1626       -21.7     0.     -27.1 FIXEDHF     0.800  0       0.0  0                       
1735    Rg 2E1626        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1736    Rh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 13d  
1737    Rh 2D1626       -19.0     0.     -23.7 FIXEDHF     0.800  0       0.0  0                       
1738    Rh 2E1626        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
1739    Ri 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 14d  
1740    Ri 2D1626       -16.8     0.     -21.0 FIXEDHF     0.800  0       0.0  0                       
1741    Ri 2E1626        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1742    Ro 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 5g   
1743    Ro 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1744    Rp 2D1627        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 6g   
1745    Rp 2E1627         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1746    Rq 2D1627        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 7g   
1747    Rq 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1748    Rr 2D1627        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 8g   
1749    Rr 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1750    Rs 2D1627        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 9g   
1751    Rs 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1752    Rz 1D2633      2001.0     0.    2501.2 FIXEDHF     0.800  0       0.0  0  4s9d      -d10 4p2   
1753    ST 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4s11d     
1754    ST 2E2626        42.6     0.      53.2 FIXEDHF     0.800  0       0.0  0                       
1755    SU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4s12d     
1756    SU 2E2626        37.0     0.      46.3 FIXEDHF     0.800  0       0.0  0                       
1757    SV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4s13d     
1758    SV 2E2626        32.6     0.      40.7 FIXEDHF     0.800  0       0.0  0                       
1759    SW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4s14d     
1760    SW 2E2626        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0                       
1761    SX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4s15d     
1762    SX 2E2626        26.0     0.      32.5 FIXEDHF     0.800  0       0.0  0                       
1763    SY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 4d   
1764    SY 2D1626       -96.2     0.    -120.2 FIXEDHF     0.800  0       0.0  0                       
1765    SY 2E1626        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1766    SZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 5d   
1767    SZ 2D1626       -74.9     0.     -93.6 FIXEDHF     0.800  0       0.0  0                       
1768    SZ 2E1626        -3.6     0.      -4.5 FIXEDHF     0.800  0       0.0  0                       
1769    Sa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 6d   
1770    Sa 2D1626       -57.1     0.     -71.4 FIXEDHF     0.800  0       0.0  0                       
1771    Sa 2E1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
1772    Sb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 7d   
1773    Sb 2D1626       -44.6     0.     -55.8 FIXEDHF     0.800  0       0.0  0                       
1774    Sb 2E1626        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1775    Sc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 8d   
1776    Sc 2D1626       -35.9     0.     -44.9 FIXEDHF     0.800  0       0.0  0                       
1777    Sc 2E1626        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1778    Sd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 9d   
1779    Sd 2D1626       -29.6     0.     -37.0 FIXEDHF     0.800  0       0.0  0                       
1780    Sd 2E1626        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1781    Se 2D1112       705.4     0.     881.8 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 10d  
1782    Se 2D1626       -25.0     0.     -31.2 FIXEDHF     0.800  0       0.0  0                       
1783    Se 2E1626        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1784    Sf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 11d  
1785    Sf 2D1626       -21.2     0.     -26.5 FIXEDHF     0.800  0       0.0  0                       
1786    Sf 2E1626        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1787    Sg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 12d  
1788    Sg 2D1626       -18.3     0.     -22.9 FIXEDHF     0.800  0       0.0  0                       
1789    Sg 2E1626        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1790    Sh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 13d  
1791    Sh 2D1626       -16.0     0.     -20.0 FIXEDHF     0.800  0       0.0  0                       
1792    Sh 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1793    Si 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 14d  
1794    Si 2D1626       -14.2     0.     -17.7 FIXEDHF     0.800  0       0.0  0                       
1795    Si 2E1626        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
1796    So 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 5g   
1797    So 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1798    Sp 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 6g   
1799    Sp 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1800    Sq 2D1627        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 7g   
1801    Sq 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1802    Sr 2D1627        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 8g   
1803    Sr 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1804    Ss 2D1627        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 9g   
1805    Ss 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1806    Sz 1D2633      1678.2     0.    2097.7 FIXEDHF     0.800  0       0.0  0  4s10d     -d10 4p2   
1807    TU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -4s12d     
1808    TU 2E2626        31.8     0.      39.7 FIXEDHF     0.800  0       0.0  0                       
1809    TV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -4s13d     
1810    TV 2E2626        28.0     0.      35.0 FIXEDHF     0.800  0       0.0  0                       
1811    TW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -4s14d     
1812    TW 2E2626        24.9     0.      31.1 FIXEDHF     0.800  0       0.0  0                       
1813    TX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -4s15d     
1814    TX 2E2626        22.3     0.      27.9 FIXEDHF     0.800  0       0.0  0                       
1815    TY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 4d   
1816    TY 2D1626       -81.4     0.    -101.8 FIXEDHF     0.800  0       0.0  0                       
1817    TY 2E1626        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
1818    TZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 5d   
1819    TZ 2D1626       -63.5     0.     -79.4 FIXEDHF     0.800  0       0.0  0                       
1820    TZ 2E1626        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
1821    Ta 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 6d   
1822    Ta 2D1626       -48.6     0.     -60.7 FIXEDHF     0.800  0       0.0  0                       
1823    Ta 2E1626        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
1824    Tb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 7d   
1825    Tb 2D1626       -38.0     0.     -47.5 FIXEDHF     0.800  0       0.0  0                       
1826    Tb 2E1626        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
1827    Tc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 8d   
1828    Tc 2D1626       -30.6     0.     -38.2 FIXEDHF     0.800  0       0.0  0                       
1829    Tc 2E1626        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1830    Td 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 9d   
1831    Td 2D1626       -25.2     0.     -31.5 FIXEDHF     0.800  0       0.0  0                       
1832    Td 2E1626        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
1833    Te 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 10d  
1834    Te 2D1626       -21.2     0.     -26.5 FIXEDHF     0.800  0       0.0  0                       
1835    Te 2E1626        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1836    Tf 2D1112       705.6     0.     882.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 11d  
1837    Tf 2D1626       -18.2     0.     -22.7 FIXEDHF     0.800  0       0.0  0                       
1838    Tf 2E1626        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1839    Tg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 12d  
1840    Tg 2D1626       -15.7     0.     -19.6 FIXEDHF     0.800  0       0.0  0                       
1841    Tg 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1842    Th 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 13d  
1843    Th 2D1626       -13.8     0.     -17.2 FIXEDHF     0.800  0       0.0  0                       
1844    Th 2E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
1845    Ti 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 14d  
1846    Ti 2D1626       -12.2     0.     -15.2 FIXEDHF     0.800  0       0.0  0                       
1847    Ti 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
1848    To 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 5g   
1849    To 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1850    Tp 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 6g   
1851    Tp 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1852    Tq 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 7g   
1853    Tq 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1854    Tr 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 8g   
1855    Tr 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1856    Ts 2D1627        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 9g   
1857    Ts 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1858    Tz 1D2633      1434.1     0.    1792.6 FIXEDHF     0.800  0       0.0  0  4s11d     -d10 4p2   
1859    UV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -4s13d     
1860    UV 2E2626        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0                       
1861    UW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -4s14d     
1862    UW 2E2626        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
1863    UX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -4s15d     
1864    UX 2E2626        19.4     0.      24.3 FIXEDHF     0.800  0       0.0  0                       
1865    UY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 4d   
1866    UY 2D1626       -70.2     0.     -87.7 FIXEDHF     0.800  0       0.0  0                       
1867    UY 2E1626        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
1868    UZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 5d   
1869    UZ 2D1626       -54.8     0.     -68.5 FIXEDHF     0.800  0       0.0  0                       
1870    UZ 2E1626        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
1871    Ua 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 6d   
1872    Ua 2D1626       -41.9     0.     -52.4 FIXEDHF     0.800  0       0.0  0                       
1873    Ua 2E1626        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
1874    Ub 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 7d   
1875    Ub 2D1626       -32.8     0.     -41.0 FIXEDHF     0.800  0       0.0  0                       
1876    Ub 2E1626        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
1877    Uc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 8d   
1878    Uc 2D1626       -26.4     0.     -33.0 FIXEDHF     0.800  0       0.0  0                       
1879    Uc 2E1626        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1880    Ud 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 9d   
1881    Ud 2D1626       -21.8     0.     -27.3 FIXEDHF     0.800  0       0.0  0                       
1882    Ud 2E1626        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1883    Ue 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 10d  
1884    Ue 2D1626       -18.4     0.     -23.0 FIXEDHF     0.800  0       0.0  0                       
1885    Ue 2E1626        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1886    Uf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 11d  
1887    Uf 2D1626       -15.7     0.     -19.6 FIXEDHF     0.800  0       0.0  0                       
1888    Uf 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1889    Ug 2D1112       705.7     0.     882.1 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 12d  
1890    Ug 2D1626       -13.7     0.     -17.1 FIXEDHF     0.800  0       0.0  0                       
1891    Ug 2E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
1892    Uh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 13d  
1893    Uh 2D1626       -11.9     0.     -14.9 FIXEDHF     0.800  0       0.0  0                       
1894    Uh 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
1895    Ui 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 14d  
1896    Ui 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
1897    Ui 2E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
1898    Uo 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 5g   
1899    Uo 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1900    Up 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 6g   
1901    Up 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1902    Uq 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 7g   
1903    Uq 2E1627         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1904    Ur 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 8g   
1905    Ur 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1906    Us 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 9g   
1907    Us 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1908    Uz 1D2633      1243.7     0.    1554.6 FIXEDHF     0.800  0       0.0  0  4s12d     -d10 4p2   
1909    VW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -4s14d     
1910    VW 2E2626        19.0     0.      23.8 FIXEDHF     0.800  0       0.0  0                       
1911    VX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -4s15d     
1912    VX 2E2626        17.0     0.      21.3 FIXEDHF     0.800  0       0.0  0                       
1913    VY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 4d   
1914    VY 2D1626       -61.2     0.     -76.5 FIXEDHF     0.800  0       0.0  0                       
1915    VY 2E1626        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
1916    VZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 5d   
1917    VZ 2D1626       -47.9     0.     -59.9 FIXEDHF     0.800  0       0.0  0                       
1918    VZ 2E1626        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
1919    Va 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 6d   
1920    Va 2D1626       -36.6     0.     -45.8 FIXEDHF     0.800  0       0.0  0                       
1921    Va 2E1626        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0                       
1922    Vb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 7d   
1923    Vb 2D1626       -28.7     0.     -35.9 FIXEDHF     0.800  0       0.0  0                       
1924    Vb 2E1626        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
1925    Vc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 8d   
1926    Vc 2D1626       -23.1     0.     -28.9 FIXEDHF     0.800  0       0.0  0                       
1927    Vc 2E1626        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1928    Vd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 9d   
1929    Vd 2D1626       -19.1     0.     -23.9 FIXEDHF     0.800  0       0.0  0                       
1930    Vd 2E1626        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1931    Ve 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 10d  
1932    Ve 2D1626       -16.1     0.     -20.1 FIXEDHF     0.800  0       0.0  0                       
1933    Ve 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1934    Vf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 11d  
1935    Vf 2D1626       -13.8     0.     -17.2 FIXEDHF     0.800  0       0.0  0                       
1936    Vf 2E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
1937    Vg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 12d  
1938    Vg 2D1626       -11.9     0.     -14.9 FIXEDHF     0.800  0       0.0  0                       
1939    Vg 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
1940    Vh 2D1112       705.7     0.     882.1 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 13d  
1941    Vh 2D1626       -10.5     0.     -13.1 FIXEDHF     0.800  0       0.0  0                       
1942    Vh 2E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
1943    Vi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 14d  
1944    Vi 2D1626        -9.3     0.     -11.6 FIXEDHF     0.800  0       0.0  0                       
1945    Vi 2E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
1946    Vo 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 5g   
1947    Vo 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1948    Vp 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 6g   
1949    Vp 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1950    Vq 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 7g   
1951    Vq 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1952    Vr 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 8g   
1953    Vr 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1954    Vs 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 9g   
1955    Vs 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1956    Vz 1D2633      1091.0     0.    1363.8 FIXEDHF     0.800  0       0.0  0  4s13d     -d10 4p2   
1957    WX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -4s15d     
1958    WX 2E2626        15.2     0.      19.0 FIXEDHF     0.800  0       0.0  0                       
1959    WY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 4d   
1960    WY 2D1626       -54.0     0.     -67.5 FIXEDHF     0.800  0       0.0  0                       
1961    WY 2E1626        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1962    WZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 5d   
1963    WZ 2D1626       -42.3     0.     -52.9 FIXEDHF     0.800  0       0.0  0                       
1964    WZ 2E1626        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
1965    Wa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 6d   
1966    Wa 2D1626       -32.4     0.     -40.5 FIXEDHF     0.800  0       0.0  0                       
1967    Wa 2E1626        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
1968    Wb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 7d   
1969    Wb 2D1626       -25.4     0.     -31.8 FIXEDHF     0.800  0       0.0  0                       
1970    Wb 2E1626        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1971    Wc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 8d   
1972    Wc 2D1626       -20.5     0.     -25.6 FIXEDHF     0.800  0       0.0  0                       
1973    Wc 2E1626        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1974    Wd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 9d   
1975    Wd 2D1626       -16.9     0.     -21.1 FIXEDHF     0.800  0       0.0  0                       
1976    Wd 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1977    We 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 10d  
1978    We 2D1626       -14.2     0.     -17.8 FIXEDHF     0.800  0       0.0  0                       
1979    We 2E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
1980    Wf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 11d  
1981    Wf 2D1626       -12.2     0.     -15.2 FIXEDHF     0.800  0       0.0  0                       
1982    Wf 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
1983    Wg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 12d  
1984    Wg 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
1985    Wg 2E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
1986    Wh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 13d  
1987    Wh 2D1626        -9.3     0.     -11.6 FIXEDHF     0.800  0       0.0  0                       
1988    Wh 2E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
1989    Wi 2D1112       705.8     0.     882.2 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 14d  
1990    Wi 2D1626        -8.2     0.     -10.3 FIXEDHF     0.800  0       0.0  0                       
1991    Wi 2E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
1992    Wo 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 5g   
1993    Wo 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1994    Wp 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 6g   
1995    Wp 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1996    Wq 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 7g   
1997    Wq 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
1998    Wr 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 8g   
1999    Wr 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2000    Ws 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 9g   
2001    Ws 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2002    Wz 1D2633       967.7     0.    1209.6 FIXEDHF     0.800  0       0.0  0  4s14d     -d10 4p2   
2003    XY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 4d   
2004    XY 2D1626       -48.2     0.     -60.2 FIXEDHF     0.800  0       0.0  0                       
2005    XY 2E1626        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
2006    XZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 5d   
2007    XZ 2D1626       -37.8     0.     -47.2 FIXEDHF     0.800  0       0.0  0                       
2008    XZ 2E1626        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2009    Xa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 6d   
2010    Xa 2D1626       -29.0     0.     -36.2 FIXEDHF     0.800  0       0.0  0                       
2011    Xa 2E1626        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2012    Xb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 7d   
2013    Xb 2D1626       -22.7     0.     -28.4 FIXEDHF     0.800  0       0.0  0                       
2014    Xb 2E1626        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
2015    Xc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 8d   
2016    Xc 2D1626       -18.3     0.     -22.9 FIXEDHF     0.800  0       0.0  0                       
2017    Xc 2E1626        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
2018    Xd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 9d   
2019    Xd 2D1626       -15.1     0.     -18.9 FIXEDHF     0.800  0       0.0  0                       
2020    Xd 2E1626        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2021    Xe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 10d  
2022    Xe 2D1626       -12.7     0.     -15.9 FIXEDHF     0.800  0       0.0  0                       
2023    Xe 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2024    Xf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 11d  
2025    Xf 2D1626       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0                       
2026    Xf 2E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2027    Xg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 12d  
2028    Xg 2D1626        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
2029    Xg 2E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2030    Xh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 13d  
2031    Xh 2D1626        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0                       
2032    Xh 2E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2033    Xi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 14d  
2034    Xi 2D1626        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
2035    Xi 2E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2036    Xo 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 5g   
2037    Xo 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2038    Xp 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 6g   
2039    Xp 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2040    Xq 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 7g   
2041    Xq 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2042    Xr 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 8g   
2043    Xr 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2044    Xs 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 9g   
2045    Xs 2E1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2046    Xz 1D2633       865.8     0.    1082.3 FIXEDHF     0.800  0       0.0  0  4s15d     -d10 4p2   
2047    YZ 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 5d   
2048    YZ 2D1616       535.4     0.     669.3 FIXEDHF     0.800  0       0.0  0                       
2049    YZ 4D1616       221.0     0.     276.3 FIXEDHF     0.800  0       0.0  0                       
2050    YZ 0E1616       540.8     0.     676.0 FIXEDHF     0.800  0       0.0  0                       
2051    YZ 2E1616       298.8     0.     373.5 FIXEDHF     0.800  0       0.0  0                       
2052    YZ 4E1616       193.0     0.     241.3 FIXEDHF     0.800  0       0.0  0                       
2053    Ya 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 6d   
2054    Ya 2D1616       389.0     0.     486.2 FIXEDHF     0.800  0       0.0  0                       
2055    Ya 4D1616       167.2     0.     209.0 FIXEDHF     0.800  0       0.0  0                       
2056    Ya 0E1616       408.6     0.     510.8 FIXEDHF     0.800  0       0.0  0                       
2057    Ya 2E1616       226.5     0.     283.1 FIXEDHF     0.800  0       0.0  0                       
2058    Ya 4E1616       146.4     0.     183.0 FIXEDHF     0.800  0       0.0  0                       
2059    Yb 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 7d   
2060    Yb 2D1616       298.2     0.     372.7 FIXEDHF     0.800  0       0.0  0                       
2061    Yb 4D1616       130.9     0.     163.6 FIXEDHF     0.800  0       0.0  0                       
2062    Yb 0E1616       319.7     0.     399.6 FIXEDHF     0.800  0       0.0  0                       
2063    Yb 2E1616       177.5     0.     221.9 FIXEDHF     0.800  0       0.0  0                       
2064    Yb 4E1616       114.8     0.     143.5 FIXEDHF     0.800  0       0.0  0                       
2065    Yc 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 8d   
2066    Yc 2D1616       237.6     0.     297.0 FIXEDHF     0.800  0       0.0  0                       
2067    Yc 4D1616       105.6     0.     132.0 FIXEDHF     0.800  0       0.0  0                       
2068    Yc 0E1616       257.8     0.     322.3 FIXEDHF     0.800  0       0.0  0                       
2069    Yc 2E1616       143.3     0.     179.1 FIXEDHF     0.800  0       0.0  0                       
2070    Yc 4E1616        92.7     0.     115.9 FIXEDHF     0.800  0       0.0  0                       
2071    Yd 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 9d   
2072    Yd 2D1616       194.9     0.     243.6 FIXEDHF     0.800  0       0.0  0                       
2073    Yd 4D1616        87.4     0.     109.2 FIXEDHF     0.800  0       0.0  0                       
2074    Yd 0E1616       213.3     0.     266.6 FIXEDHF     0.800  0       0.0  0                       
2075    Yd 2E1616       118.6     0.     148.3 FIXEDHF     0.800  0       0.0  0                       
2076    Yd 4E1616        76.7     0.      95.9 FIXEDHF     0.800  0       0.0  0                       
2077    Ye 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 10d  
2078    Ye 2D1616       163.5     0.     204.4 FIXEDHF     0.800  0       0.0  0                       
2079    Ye 4D1616        73.7     0.      92.1 FIXEDHF     0.800  0       0.0  0                       
2080    Ye 0E1616       180.0     0.     225.0 FIXEDHF     0.800  0       0.0  0                       
2081    Ye 2E1616       100.2     0.     125.2 FIXEDHF     0.800  0       0.0  0                       
2082    Ye 4E1616        64.8     0.      81.0 FIXEDHF     0.800  0       0.0  0                       
2083    Yf 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 11d  
2084    Yf 2D1616       139.7     0.     174.6 FIXEDHF     0.800  0       0.0  0                       
2085    Yf 4D1616        63.3     0.      79.1 FIXEDHF     0.800  0       0.0  0                       
2086    Yf 0E1616       154.5     0.     193.1 FIXEDHF     0.800  0       0.0  0                       
2087    Yf 2E1616        85.9     0.     107.4 FIXEDHF     0.800  0       0.0  0                       
2088    Yf 4E1616        55.6     0.      69.5 FIXEDHF     0.800  0       0.0  0                       
2089    Yg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 12d  
2090    Yg 2D1616       121.1     0.     151.4 FIXEDHF     0.800  0       0.0  0                       
2091    Yg 4D1616        55.0     0.      68.8 FIXEDHF     0.800  0       0.0  0                       
2092    Yg 0E1616       134.4     0.     168.0 FIXEDHF     0.800  0       0.0  0                       
2093    Yg 2E1616        74.8     0.      93.5 FIXEDHF     0.800  0       0.0  0                       
2094    Yg 4E1616        48.4     0.      60.5 FIXEDHF     0.800  0       0.0  0                       
2095    Yh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 13d  
2096    Yh 2D1616       106.2     0.     132.8 FIXEDHF     0.800  0       0.0  0                       
2097    Yh 4D1616        48.4     0.      60.5 FIXEDHF     0.800  0       0.0  0                       
2098    Yh 0E1616       118.2     0.     147.8 FIXEDHF     0.800  0       0.0  0                       
2099    Yh 2E1616        65.8     0.      82.3 FIXEDHF     0.800  0       0.0  0                       
2100    Yh 4E1616        42.6     0.      53.3 FIXEDHF     0.800  0       0.0  0                       
2101    Yi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 14d  
2102    Yi 2D1616        94.2     0.     117.8 FIXEDHF     0.800  0       0.0  0                       
2103    Yi 4D1616        43.0     0.      53.8 FIXEDHF     0.800  0       0.0  0                       
2104    Yi 0E1616       105.1     0.     131.4 FIXEDHF     0.800  0       0.0  0                       
2105    Yi 2E1616        58.6     0.      73.2 FIXEDHF     0.800  0       0.0  0                       
2106    Yi 4E1616        37.8     0.      47.3 FIXEDHF     0.800  0       0.0  0                       
2107    Yj 2D2617        42.5     0.      53.1 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -4s5g      
2108    Yj 4E2617         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2109    Yk 2D2617        39.9     0.      49.9 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -4s6g      
2110    Yk 4E2617         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2111    Yl 2D2617        34.7     0.      43.4 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -4s7g      
2112    Yl 4E2617         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2113    Ym 2D2617        29.9     0.      37.4 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -4s8g      
2114    Ym 4E2617         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2115    Yn 2D2617        25.8     0.      32.3 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -4s9g      
2116    Yn 4E2617         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2117    Yo 2D1617       -24.6     0.     -30.8 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 5g   
2118    Yo 4D1617        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2119    Yo 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2120    Yo 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2121    Yp 2D1617       -23.2     0.     -29.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 6g   
2122    Yp 4D1617        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2123    Yp 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2124    Yp 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2125    Yq 2D1617       -20.2     0.     -25.2 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 7g   
2126    Yq 4D1617        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2127    Yq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2128    Yq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2129    Yr 2D1617       -17.4     0.     -21.7 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 8g   
2130    Yr 4D1617        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2131    Yr 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2132    Yr 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2133    Ys 2D1617       -15.0     0.     -18.8 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 9g   
2134    Ys 4D1617        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2135    Ys 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2136    Ys 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2137    Yw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 7i   
2138    Yw 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2139    Yx 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 8i   
2140    Yx 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2141    Yy 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 9i   
2142    Yy 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2143    Za 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 6d   
2144    Za 2D1616       295.0     0.     368.7 FIXEDHF     0.800  0       0.0  0                       
2145    Za 4D1616       125.8     0.     157.2 FIXEDHF     0.800  0       0.0  0                       
2146    Za 0E1616       304.6     0.     380.8 FIXEDHF     0.800  0       0.0  0                       
2147    Za 2E1616       170.1     0.     212.6 FIXEDHF     0.800  0       0.0  0                       
2148    Za 4E1616       110.1     0.     137.6 FIXEDHF     0.800  0       0.0  0                       
2149    Zb 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 7d   
2150    Zb 2D1616       226.6     0.     283.3 FIXEDHF     0.800  0       0.0  0                       
2151    Zb 4D1616        98.5     0.     123.1 FIXEDHF     0.800  0       0.0  0                       
2152    Zb 0E1616       238.3     0.     297.9 FIXEDHF     0.800  0       0.0  0                       
2153    Zb 2E1616       133.3     0.     166.6 FIXEDHF     0.800  0       0.0  0                       
2154    Zb 4E1616        86.3     0.     107.9 FIXEDHF     0.800  0       0.0  0                       
2155    Zc 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 8d   
2156    Zc 2D1616       180.9     0.     226.1 FIXEDHF     0.800  0       0.0  0                       
2157    Zc 4D1616        79.5     0.      99.4 FIXEDHF     0.800  0       0.0  0                       
2158    Zc 0E1616       192.2     0.     240.3 FIXEDHF     0.800  0       0.0  0                       
2159    Zc 2E1616       107.6     0.     134.5 FIXEDHF     0.800  0       0.0  0                       
2160    Zc 4E1616        69.7     0.      87.1 FIXEDHF     0.800  0       0.0  0                       
2161    Zd 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 9d   
2162    Zd 2D1616       148.5     0.     185.6 FIXEDHF     0.800  0       0.0  0                       
2163    Zd 4D1616        65.8     0.      82.2 FIXEDHF     0.800  0       0.0  0                       
2164    Zd 0E1616       159.0     0.     198.7 FIXEDHF     0.800  0       0.0  0                       
2165    Zd 2E1616        89.0     0.     111.3 FIXEDHF     0.800  0       0.0  0                       
2166    Zd 4E1616        57.7     0.      72.1 FIXEDHF     0.800  0       0.0  0                       
2167    Ze 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 10d  
2168    Ze 2D1616       124.7     0.     155.9 FIXEDHF     0.800  0       0.0  0                       
2169    Ze 4D1616        55.5     0.      69.4 FIXEDHF     0.800  0       0.0  0                       
2170    Ze 0E1616       134.2     0.     167.7 FIXEDHF     0.800  0       0.0  0                       
2171    Ze 2E1616        75.2     0.      94.0 FIXEDHF     0.800  0       0.0  0                       
2172    Ze 4E1616        48.7     0.      60.9 FIXEDHF     0.800  0       0.0  0                       
2173    Zf 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 11d  
2174    Zf 2D1616       106.6     0.     133.2 FIXEDHF     0.800  0       0.0  0                       
2175    Zf 4D1616        47.7     0.      59.6 FIXEDHF     0.800  0       0.0  0                       
2176    Zf 0E1616       115.1     0.     143.9 FIXEDHF     0.800  0       0.0  0                       
2177    Zf 2E1616        64.6     0.      80.7 FIXEDHF     0.800  0       0.0  0                       
2178    Zf 4E1616        41.8     0.      52.3 FIXEDHF     0.800  0       0.0  0                       
2179    Zg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 12d  
2180    Zg 2D1616        92.4     0.     115.5 FIXEDHF     0.800  0       0.0  0                       
2181    Zg 4D1616        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0                       
2182    Zg 0E1616       100.2     0.     125.2 FIXEDHF     0.800  0       0.0  0                       
2183    Zg 2E1616        56.2     0.      70.2 FIXEDHF     0.800  0       0.0  0                       
2184    Zg 4E1616        36.4     0.      45.5 FIXEDHF     0.800  0       0.0  0                       
2185    Zh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 13d  
2186    Zh 2D1616        81.1     0.     101.4 FIXEDHF     0.800  0       0.0  0                       
2187    Zh 4D1616        36.5     0.      45.6 FIXEDHF     0.800  0       0.0  0                       
2188    Zh 0E1616        88.2     0.     110.2 FIXEDHF     0.800  0       0.0  0                       
2189    Zh 2E1616        49.4     0.      61.8 FIXEDHF     0.800  0       0.0  0                       
2190    Zh 4E1616        32.1     0.      40.1 FIXEDHF     0.800  0       0.0  0                       
2191    Zi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 14d  
2192    Zi 2D1616        72.0     0.      90.0 FIXEDHF     0.800  0       0.0  0                       
2193    Zi 4D1616        32.4     0.      40.5 FIXEDHF     0.800  0       0.0  0                       
2194    Zi 0E1616        78.3     0.      97.9 FIXEDHF     0.800  0       0.0  0                       
2195    Zi 2E1616        43.9     0.      54.9 FIXEDHF     0.800  0       0.0  0                       
2196    Zi 4E1616        28.5     0.      35.6 FIXEDHF     0.800  0       0.0  0                       
2197    Zj 2D2617       -11.9     0.     -14.9 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -4s5g      
2198    Zj 4E2617         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2199    Zk 2D2617        -3.0     0.      -3.7 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -4s6g      
2200    Zk 4E2617         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2201    Zl 2D2617         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -4s7g      
2202    Zl 4E2617         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2203    Zm 2D2617         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -4s8g      
2204    Zm 4E2617         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2205    Zn 2D2617         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -4s9g      
2206    Zn 4E2617         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2207    Zo 2D1617         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 5g   
2208    Zo 4D1617        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2209    Zo 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2210    Zo 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2211    Zp 2D1617         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 6g   
2212    Zp 4D1617        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2213    Zp 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2214    Zp 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2215    Zq 2D1617        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 7g   
2216    Zq 4D1617        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2217    Zq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2218    Zq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2219    Zr 2D1617        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 8g   
2220    Zr 4D1617        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2221    Zr 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2222    Zr 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2223    Zs 2D1617        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 9g   
2224    Zs 4D1617        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2225    Zs 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2226    Zs 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2227    Zw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 7i   
2228    Zw 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2229    Zx 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 8i   
2230    Zx 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2231    Zy 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 9i   
2232    Zy 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2233    ab 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 7d   
2234    ab 2D1616       172.1     0.     215.1 FIXEDHF     0.800  0       0.0  0                       
2235    ab 4D1616        74.7     0.      93.4 FIXEDHF     0.800  0       0.0  0                       
2236    ab 0E1616       180.1     0.     225.1 FIXEDHF     0.800  0       0.0  0                       
2237    ab 2E1616       101.0     0.     126.3 FIXEDHF     0.800  0       0.0  0                       
2238    ab 4E1616        65.5     0.      81.9 FIXEDHF     0.800  0       0.0  0                       
2239    ac 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 8d   
2240    ac 2D1616       137.4     0.     171.8 FIXEDHF     0.800  0       0.0  0                       
2241    ac 4D1616        60.3     0.      75.4 FIXEDHF     0.800  0       0.0  0                       
2242    ac 0E1616       145.3     0.     181.6 FIXEDHF     0.800  0       0.0  0                       
2243    ac 2E1616        81.6     0.     102.0 FIXEDHF     0.800  0       0.0  0                       
2244    ac 4E1616        52.9     0.      66.1 FIXEDHF     0.800  0       0.0  0                       
2245    ad 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 9d   
2246    ad 2D1616       112.9     0.     141.1 FIXEDHF     0.800  0       0.0  0                       
2247    ad 4D1616        49.9     0.      62.4 FIXEDHF     0.800  0       0.0  0                       
2248    ad 0E1616       120.2     0.     150.2 FIXEDHF     0.800  0       0.0  0                       
2249    ad 2E1616        67.5     0.      84.4 FIXEDHF     0.800  0       0.0  0                       
2250    ad 4E1616        43.8     0.      54.7 FIXEDHF     0.800  0       0.0  0                       
2251    ae 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 10d  
2252    ae 2D1616        94.9     0.     118.6 FIXEDHF     0.800  0       0.0  0                       
2253    ae 4D1616        42.2     0.      52.7 FIXEDHF     0.800  0       0.0  0                       
2254    ae 0E1616       101.4     0.     126.8 FIXEDHF     0.800  0       0.0  0                       
2255    ae 2E1616        57.0     0.      71.3 FIXEDHF     0.800  0       0.0  0                       
2256    ae 4E1616        37.0     0.      46.2 FIXEDHF     0.800  0       0.0  0                       
2257    af 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 11d  
2258    af 2D1616        81.1     0.     101.4 FIXEDHF     0.800  0       0.0  0                       
2259    af 4D1616        36.2     0.      45.2 FIXEDHF     0.800  0       0.0  0                       
2260    af 0E1616        87.0     0.     108.8 FIXEDHF     0.800  0       0.0  0                       
2261    af 2E1616        49.0     0.      61.2 FIXEDHF     0.800  0       0.0  0                       
2262    af 4E1616        31.8     0.      39.7 FIXEDHF     0.800  0       0.0  0                       
2263    ag 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 12d  
2264    ag 2D1616        70.4     0.      88.0 FIXEDHF     0.800  0       0.0  0                       
2265    ag 4D1616        31.4     0.      39.3 FIXEDHF     0.800  0       0.0  0                       
2266    ag 0E1616        75.7     0.      94.6 FIXEDHF     0.800  0       0.0  0                       
2267    ag 2E1616        42.6     0.      53.2 FIXEDHF     0.800  0       0.0  0                       
2268    ag 4E1616        27.6     0.      34.5 FIXEDHF     0.800  0       0.0  0                       
2269    ah 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 13d  
2270    ah 2D1616        61.8     0.      77.3 FIXEDHF     0.800  0       0.0  0                       
2271    ah 4D1616        27.7     0.      34.6 FIXEDHF     0.800  0       0.0  0                       
2272    ah 0E1616        66.6     0.      83.3 FIXEDHF     0.800  0       0.0  0                       
2273    ah 2E1616        37.5     0.      46.9 FIXEDHF     0.800  0       0.0  0                       
2274    ah 4E1616        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0                       
2275    ai 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 14d  
2276    ai 2D1616        54.8     0.      68.5 FIXEDHF     0.800  0       0.0  0                       
2277    ai 4D1616        24.6     0.      30.8 FIXEDHF     0.800  0       0.0  0                       
2278    ai 0E1616        59.2     0.      74.0 FIXEDHF     0.800  0       0.0  0                       
2279    ai 2E1616        33.4     0.      41.7 FIXEDHF     0.800  0       0.0  0                       
2280    ai 4E1616        21.6     0.      27.0 FIXEDHF     0.800  0       0.0  0                       
2281    aj 2D2617        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -4s5g      
2282    aj 4E2617         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2283    ak 2D2617        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -4s6g      
2284    ak 4E2617         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2285    al 2D2617        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -4s7g      
2286    al 4E2617         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2287    am 2D2617        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -4s8g      
2288    am 4E2617         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2289    an 2D2617        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -4s9g      
2290    an 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2291    ao 2D1617         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 5g   
2292    ao 4D1617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2293    ao 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2294    ao 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2295    ap 2D1617         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 6g   
2296    ap 4D1617        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2297    ap 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2298    ap 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2299    aq 2D1617         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 7g   
2300    aq 4D1617        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2301    aq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2302    aq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2303    ar 2D1617         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 8g   
2304    ar 4D1617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2305    ar 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2306    ar 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2307    as 2D1617         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 9g   
2308    as 4D1617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2309    as 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2310    as 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2311    aw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 7i   
2312    aw 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2313    ax 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 8i   
2314    ax 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2315    ay 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 9i   
2316    ay 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2317    bc 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 8d   
2318    bc 2D1616       107.6     0.     134.5 FIXEDHF     0.800  0       0.0  0                       
2319    bc 4D1616        47.3     0.      59.1 FIXEDHF     0.800  0       0.0  0                       
2320    bc 0E1616       113.7     0.     142.1 FIXEDHF     0.800  0       0.0  0                       
2321    bc 2E1616        63.9     0.      79.9 FIXEDHF     0.800  0       0.0  0                       
2322    bc 4E1616        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0                       
2323    bd 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 9d   
2324    bd 2D1616        88.5     0.     110.6 FIXEDHF     0.800  0       0.0  0                       
2325    bd 4D1616        39.1     0.      48.9 FIXEDHF     0.800  0       0.0  0                       
2326    bd 0E1616        94.0     0.     117.5 FIXEDHF     0.800  0       0.0  0                       
2327    bd 2E1616        53.0     0.      66.2 FIXEDHF     0.800  0       0.0  0                       
2328    bd 4E1616        34.3     0.      42.9 FIXEDHF     0.800  0       0.0  0                       
2329    be 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 10d  
2330    be 2D1616        74.3     0.      92.9 FIXEDHF     0.800  0       0.0  0                       
2331    be 4D1616        33.0     0.      41.3 FIXEDHF     0.800  0       0.0  0                       
2332    be 0E1616        79.4     0.      99.2 FIXEDHF     0.800  0       0.0  0                       
2333    be 2E1616        44.7     0.      55.9 FIXEDHF     0.800  0       0.0  0                       
2334    be 4E1616        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0                       
2335    bf 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 11d  
2336    bf 2D1616        63.6     0.      79.5 FIXEDHF     0.800  0       0.0  0                       
2337    bf 4D1616        28.3     0.      35.4 FIXEDHF     0.800  0       0.0  0                       
2338    bf 0E1616        68.1     0.      85.1 FIXEDHF     0.800  0       0.0  0                       
2339    bf 2E1616        38.4     0.      48.0 FIXEDHF     0.800  0       0.0  0                       
2340    bf 4E1616        24.9     0.      31.1 FIXEDHF     0.800  0       0.0  0                       
2341    bg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 12d  
2342    bg 2D1616        55.2     0.      69.0 FIXEDHF     0.800  0       0.0  0                       
2343    bg 4D1616        24.6     0.      30.8 FIXEDHF     0.800  0       0.0  0                       
2344    bg 0E1616        59.2     0.      74.0 FIXEDHF     0.800  0       0.0  0                       
2345    bg 2E1616        33.4     0.      41.7 FIXEDHF     0.800  0       0.0  0                       
2346    bg 4E1616        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
2347    bh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 13d  
2348    bh 2D1616        48.5     0.      60.6 FIXEDHF     0.800  0       0.0  0                       
2349    bh 4D1616        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
2350    bh 0E1616        52.2     0.      65.2 FIXEDHF     0.800  0       0.0  0                       
2351    bh 2E1616        29.4     0.      36.7 FIXEDHF     0.800  0       0.0  0                       
2352    bh 4E1616        19.0     0.      23.8 FIXEDHF     0.800  0       0.0  0                       
2353    bi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 14d  
2354    bi 2D1616        43.0     0.      53.8 FIXEDHF     0.800  0       0.0  0                       
2355    bi 4D1616        19.3     0.      24.1 FIXEDHF     0.800  0       0.0  0                       
2356    bi 0E1616        46.3     0.      57.9 FIXEDHF     0.800  0       0.0  0                       
2357    bi 2E1616        26.2     0.      32.7 FIXEDHF     0.800  0       0.0  0                       
2358    bi 4E1616        17.0     0.      21.2 FIXEDHF     0.800  0       0.0  0                       
2359    bj 2D2617        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -4s5g      
2360    bj 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2361    bk 2D2617        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -4s6g      
2362    bk 4E2617         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2363    bl 2D2617        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -4s7g      
2364    bl 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2365    bm 2D2617        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -4s8g      
2366    bm 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2367    bn 2D2617        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -4s9g      
2368    bn 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2369    bo 2D1617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 5g   
2370    bo 4D1617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2371    bo 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2372    bo 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2373    bp 2D1617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 6g   
2374    bp 4D1617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2375    bp 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2376    bp 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2377    bq 2D1617         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 7g   
2378    bq 4D1617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2379    bq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2380    bq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2381    br 2D1617         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 8g   
2382    br 4D1617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2383    br 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2384    br 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2385    bs 2D1617         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 9g   
2386    bs 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2387    bs 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2388    bs 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2389    bw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 7i   
2390    bw 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2391    bx 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 8i   
2392    bx 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2393    by 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 9i   
2394    by 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2395    cd 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 9d   
2396    cd 2D1616        71.4     0.      89.2 FIXEDHF     0.800  0       0.0  0                       
2397    cd 4D1616        31.6     0.      39.5 FIXEDHF     0.800  0       0.0  0                       
2398    cd 0E1616        75.8     0.      94.8 FIXEDHF     0.800  0       0.0  0                       
2399    cd 2E1616        42.7     0.      53.4 FIXEDHF     0.800  0       0.0  0                       
2400    cd 4E1616        27.8     0.      34.7 FIXEDHF     0.800  0       0.0  0                       
2401    ce 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 10d  
2402    ce 2D1616        60.0     0.      75.0 FIXEDHF     0.800  0       0.0  0                       
2403    ce 4D1616        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0                       
2404    ce 0E1616        64.0     0.      80.0 FIXEDHF     0.800  0       0.0  0                       
2405    ce 2E1616        36.1     0.      45.1 FIXEDHF     0.800  0       0.0  0                       
2406    ce 4E1616        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0                       
2407    cf 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 11d  
2408    cf 2D1616        51.4     0.      64.2 FIXEDHF     0.800  0       0.0  0                       
2409    cf 4D1616        22.9     0.      28.6 FIXEDHF     0.800  0       0.0  0                       
2410    cf 0E1616        55.0     0.      68.7 FIXEDHF     0.800  0       0.0  0                       
2411    cf 2E1616        31.0     0.      38.7 FIXEDHF     0.800  0       0.0  0                       
2412    cf 4E1616        20.1     0.      25.1 FIXEDHF     0.800  0       0.0  0                       
2413    cg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 12d  
2414    cg 2D1616        44.6     0.      55.7 FIXEDHF     0.800  0       0.0  0                       
2415    cg 4D1616        19.9     0.      24.9 FIXEDHF     0.800  0       0.0  0                       
2416    cg 0E1616        47.8     0.      59.7 FIXEDHF     0.800  0       0.0  0                       
2417    cg 2E1616        27.0     0.      33.7 FIXEDHF     0.800  0       0.0  0                       
2418    cg 4E1616        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0                       
2419    ch 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 13d  
2420    ch 2D1616        39.1     0.      48.9 FIXEDHF     0.800  0       0.0  0                       
2421    ch 4D1616        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0                       
2422    ch 0E1616        42.1     0.      52.6 FIXEDHF     0.800  0       0.0  0                       
2423    ch 2E1616        23.8     0.      29.7 FIXEDHF     0.800  0       0.0  0                       
2424    ch 4E1616        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0                       
2425    ci 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 14d  
2426    ci 2D1616        34.7     0.      43.4 FIXEDHF     0.800  0       0.0  0                       
2427    ci 4D1616        15.6     0.      19.5 FIXEDHF     0.800  0       0.0  0                       
2428    ci 0E1616        37.4     0.      46.7 FIXEDHF     0.800  0       0.0  0                       
2429    ci 2E1616        21.1     0.      26.4 FIXEDHF     0.800  0       0.0  0                       
2430    ci 4E1616        13.7     0.      17.1 FIXEDHF     0.800  0       0.0  0                       
2431    cj 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -4s5g      
2432    cj 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2433    ck 2D2617        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -4s6g      
2434    ck 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2435    cl 2D2617        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -4s7g      
2436    cl 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2437    cm 2D2617        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -4s8g      
2438    cm 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2439    cn 2D2617        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -4s9g      
2440    cn 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2441    co 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 5g   
2442    co 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2443    co 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2444    co 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2445    cp 2D1617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 6g   
2446    cp 4D1617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2447    cp 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2448    cp 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2449    cq 2D1617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 7g   
2450    cq 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2451    cq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2452    cq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2453    cr 2D1617         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 8g   
2454    cr 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2455    cr 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2456    cr 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2457    cs 2D1617         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 9g   
2458    cs 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2459    cs 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2460    cs 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2461    cw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 7i   
2462    cw 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2463    cx 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 8i   
2464    cx 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2465    cy 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 9i   
2466    cy 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2467    de 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 10d  
2468    de 2D1616        49.6     0.      62.0 FIXEDHF     0.800  0       0.0  0                       
2469    de 4D1616        22.1     0.      27.6 FIXEDHF     0.800  0       0.0  0                       
2470    de 0E1616        53.0     0.      66.2 FIXEDHF     0.800  0       0.0  0                       
2471    de 2E1616        29.8     0.      37.3 FIXEDHF     0.800  0       0.0  0                       
2472    de 4E1616        19.4     0.      24.2 FIXEDHF     0.800  0       0.0  0                       
2473    df 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 11d  
2474    df 2D1616        42.5     0.      53.1 FIXEDHF     0.800  0       0.0  0                       
2475    df 4D1616        19.0     0.      23.7 FIXEDHF     0.800  0       0.0  0                       
2476    df 0E1616        45.4     0.      56.8 FIXEDHF     0.800  0       0.0  0                       
2477    df 2E1616        25.6     0.      32.0 FIXEDHF     0.800  0       0.0  0                       
2478    df 4E1616        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0                       
2479    dg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 12d  
2480    dg 2D1616        36.9     0.      46.1 FIXEDHF     0.800  0       0.0  0                       
2481    dg 4D1616        16.5     0.      20.6 FIXEDHF     0.800  0       0.0  0                       
2482    dg 0E1616        39.5     0.      49.4 FIXEDHF     0.800  0       0.0  0                       
2483    dg 2E1616        22.3     0.      27.9 FIXEDHF     0.800  0       0.0  0                       
2484    dg 4E1616        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0                       
2485    dh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 13d  
2486    dh 2D1616        32.4     0.      40.5 FIXEDHF     0.800  0       0.0  0                       
2487    dh 4D1616        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0                       
2488    dh 0E1616        34.8     0.      43.5 FIXEDHF     0.800  0       0.0  0                       
2489    dh 2E1616        19.6     0.      24.5 FIXEDHF     0.800  0       0.0  0                       
2490    dh 4E1616        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0                       
2491    di 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 14d  
2492    di 2D1616        28.7     0.      35.9 FIXEDHF     0.800  0       0.0  0                       
2493    di 4D1616        12.9     0.      16.1 FIXEDHF     0.800  0       0.0  0                       
2494    di 0E1616        30.9     0.      38.6 FIXEDHF     0.800  0       0.0  0                       
2495    di 2E1616        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0                       
2496    di 4E1616        11.4     0.      14.2 FIXEDHF     0.800  0       0.0  0                       
2497    dj 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -4s5g      
2498    dj 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2499    dk 2D2617        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -4s6g      
2500    dk 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2501    dl 2D2617        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -4s7g      
2502    dl 4E2617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2503    dm 2D2617        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -4s8g      
2504    dm 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2505    dn 2D2617        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -4s9g      
2506    dn 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2507    do 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 5g   
2508    do 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2509    do 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2510    do 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2511    dp 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 6g   
2512    dp 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2513    dp 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2514    dp 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2515    dq 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 7g   
2516    dq 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2517    dq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2518    dq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2519    dr 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 8g   
2520    dr 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2521    dr 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2522    dr 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2523    ds 2D1617         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 9g   
2524    ds 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2525    ds 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2526    ds 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2527    dw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 7i   
2528    dw 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2529    dx 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 8i   
2530    dx 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2531    dy 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 9i   
2532    dy 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2533    ef 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 11d  
2534    ef 2D1616        35.8     0.      44.8 FIXEDHF     0.800  0       0.0  0                       
2535    ef 4D1616        16.0     0.      20.0 FIXEDHF     0.800  0       0.0  0                       
2536    ef 0E1616        38.3     0.      47.9 FIXEDHF     0.800  0       0.0  0                       
2537    ef 2E1616        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
2538    ef 4E1616        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0                       
2539    eg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 12d  
2540    eg 2D1616        31.1     0.      38.9 FIXEDHF     0.800  0       0.0  0                       
2541    eg 4D1616        13.9     0.      17.4 FIXEDHF     0.800  0       0.0  0                       
2542    eg 0E1616        33.4     0.      41.7 FIXEDHF     0.800  0       0.0  0                       
2543    eg 2E1616        18.8     0.      23.5 FIXEDHF     0.800  0       0.0  0                       
2544    eg 4E1616        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0                       
2545    eh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 13d  
2546    eh 2D1616        27.4     0.      34.2 FIXEDHF     0.800  0       0.0  0                       
2547    eh 4D1616        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0                       
2548    eh 0E1616        29.4     0.      36.7 FIXEDHF     0.800  0       0.0  0                       
2549    eh 2E1616        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0                       
2550    eh 4E1616        10.8     0.      13.5 FIXEDHF     0.800  0       0.0  0                       
2551    ei 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 14d  
2552    ei 2D1616        24.2     0.      30.3 FIXEDHF     0.800  0       0.0  0                       
2553    ei 4D1616        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0                       
2554    ei 0E1616        26.1     0.      32.6 FIXEDHF     0.800  0       0.0  0                       
2555    ei 2E1616        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0                       
2556    ei 4E1616         9.6     0.      12.0 FIXEDHF     0.800  0       0.0  0                       
2557    ej 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -4s5g      
2558    ej 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2559    ek 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -4s6g      
2560    ek 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2561    el 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -4s7g      
2562    el 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2563    em 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -4s8g      
2564    em 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2565    en 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -4s9g      
2566    en 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2567    eo 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 5g   
2568    eo 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2569    eo 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2570    eo 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2571    ep 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 6g   
2572    ep 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2573    ep 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2574    ep 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2575    eq 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 7g   
2576    eq 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2577    eq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2578    eq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2579    er 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 8g   
2580    er 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2581    er 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2582    er 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2583    es 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 9g   
2584    es 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2585    es 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2586    es 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2587    ew 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 7i   
2588    ew 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2589    ex 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 8i   
2590    ex 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2591    ey 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 9i   
2592    ey 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2593    fg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 12d  
2594    fg 2D1616        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0                       
2595    fg 4D1616        11.9     0.      14.9 FIXEDHF     0.800  0       0.0  0                       
2596    fg 0E1616        28.6     0.      35.8 FIXEDHF     0.800  0       0.0  0                       
2597    fg 2E1616        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0                       
2598    fg 4E1616        10.5     0.      13.1 FIXEDHF     0.800  0       0.0  0                       
2599    fh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 13d  
2600    fh 2D1616        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0                       
2601    fh 4D1616        10.5     0.      13.1 FIXEDHF     0.800  0       0.0  0                       
2602    fh 0E1616        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0                       
2603    fh 2E1616        14.2     0.      17.8 FIXEDHF     0.800  0       0.0  0                       
2604    fh 4E1616         9.3     0.      11.6 FIXEDHF     0.800  0       0.0  0                       
2605    fi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 14d  
2606    fi 2D1616        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0                       
2607    fi 4D1616         9.4     0.      11.7 FIXEDHF     0.800  0       0.0  0                       
2608    fi 0E1616        22.4     0.      28.0 FIXEDHF     0.800  0       0.0  0                       
2609    fi 2E1616        12.6     0.      15.8 FIXEDHF     0.800  0       0.0  0                       
2610    fi 4E1616         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0                       
2611    fj 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -4s5g      
2612    fj 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2613    fk 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -4s6g      
2614    fk 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2615    fl 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -4s7g      
2616    fl 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2617    fm 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -4s8g      
2618    fm 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2619    fn 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -4s9g      
2620    fn 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2621    fo 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 5g   
2622    fo 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2623    fo 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2624    fo 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2625    fp 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 6g   
2626    fp 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2627    fp 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2628    fp 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2629    fq 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 7g   
2630    fq 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2631    fq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2632    fq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2633    fr 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 8g   
2634    fr 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2635    fr 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2636    fr 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2637    fs 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 9g   
2638    fs 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2639    fs 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2640    fs 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2641    fw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 7i   
2642    fw 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2643    fx 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 8i   
2644    fx 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2645    fy 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 9i   
2646    fy 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2647    gh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 13d  
2648    gh 2D1616        20.4     0.      25.5 FIXEDHF     0.800  0       0.0  0                       
2649    gh 4D1616         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
2650    gh 0E1616        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0                       
2651    gh 2E1616        12.4     0.      15.5 FIXEDHF     0.800  0       0.0  0                       
2652    gh 4E1616         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
2653    gi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 14d  
2654    gi 2D1616        18.1     0.      22.6 FIXEDHF     0.800  0       0.0  0                       
2655    gi 4D1616         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0                       
2656    gi 0E1616        19.4     0.      24.3 FIXEDHF     0.800  0       0.0  0                       
2657    gi 2E1616        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
2658    gi 4E1616         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0                       
2659    gj 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -4s5g      
2660    gj 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2661    gk 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -4s6g      
2662    gk 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2663    gl 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -4s7g      
2664    gl 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2665    gm 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -4s8g      
2666    gm 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2667    gn 2D2617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -4s9g      
2668    gn 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2669    go 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 5g   
2670    go 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2671    go 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2672    go 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2673    gp 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 6g   
2674    gp 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2675    gp 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2676    gp 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2677    gq 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 7g   
2678    gq 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2679    gq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2680    gq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2681    gr 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 8g   
2682    gr 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2683    gr 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2684    gr 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2685    gs 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 9g   
2686    gs 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2687    gs 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2688    gs 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2689    gw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 7i   
2690    gw 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2691    gx 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 8i   
2692    gx 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2693    gy 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 9i   
2694    gy 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2695    hi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 14d  
2696    hi 2D1616        15.9     0.      19.9 FIXEDHF     0.800  0       0.0  0                       
2697    hi 4D1616         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0                       
2698    hi 0E1616        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0                       
2699    hi 2E1616         9.7     0.      12.1 FIXEDHF     0.800  0       0.0  0                       
2700    hi 4E1616         6.3     0.       7.9 FIXEDHF     0.800  0       0.0  0                       
2701    hj 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -4s5g      
2702    hj 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2703    hk 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -4s6g      
2704    hk 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2705    hl 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -4s7g      
2706    hl 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2707    hm 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -4s8g      
2708    hm 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2709    hn 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -4s9g      
2710    hn 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2711    ho 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 5g   
2712    ho 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2713    ho 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2714    ho 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2715    hp 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 6g   
2716    hp 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2717    hp 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2718    hp 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2719    hq 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 7g   
2720    hq 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2721    hq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2722    hq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2723    hr 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 8g   
2724    hr 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2725    hr 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2726    hr 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2727    hs 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 9g   
2728    hs 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2729    hs 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2730    hs 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2731    hw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 7i   
2732    hw 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2733    hx 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 8i   
2734    hx 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2735    hy 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 9i   
2736    hy 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2737    ij 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -4s5g      
2738    ij 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2739    ik 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -4s6g      
2740    ik 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2741    il 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -4s7g      
2742    il 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2743    im 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -4s8g      
2744    im 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2745    in 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -4s9g      
2746    in 4E2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2747    io 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -d9s2 5g   
2748    io 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2749    io 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2750    io 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2751    ip 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -d9s2 6g   
2752    ip 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2753    ip 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2754    ip 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2755    iq 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -d9s2 7g   
2756    iq 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2757    iq 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2758    iq 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2759    ir 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -d9s2 8g   
2760    ir 4D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2761    ir 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2762    ir 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2763    is 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -d9s2 9g   
2764    is 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2765    is 2E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2766    is 4E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2767    iw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -d9s2 7i   
2768    iw 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2769    ix 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -d9s2 8i   
2770    ix 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2771    iy 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -d9s2 9i   
2772    iy 4E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2773    jk 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5g      -4s6g      
2774    jk 4E2727         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2775    jl 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5g      -4s7g      
2776    jl 4E2727         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2777    jm 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5g      -4s8g      
2778    jm 4E2727         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2779    jn 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5g      -4s9g      
2780    jn 4E2727         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2781    jo 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s5g      -d9s2 5g   
2782    jo 2D1727       -23.8     0.     -29.8 FIXEDHF     0.800  0       0.0  0                       
2783    jo 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2784    jp 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5g      -d9s2 6g   
2785    jp 2D1727       -13.8     0.     -17.3 FIXEDHF     0.800  0       0.0  0                       
2786    jp 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2787    jq 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5g      -d9s2 7g   
2788    jq 2D1727        -9.8     0.     -12.2 FIXEDHF     0.800  0       0.0  0                       
2789    jq 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2790    jr 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5g      -d9s2 8g   
2791    jr 2D1727        -7.5     0.      -9.4 FIXEDHF     0.800  0       0.0  0                       
2792    jr 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2793    js 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5g      -d9s2 9g   
2794    js 2D1727        -6.0     0.      -7.5 FIXEDHF     0.800  0       0.0  0                       
2795    js 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2796    jw 2D1728        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0  4s5g      -d9s2 7i   
2797    jw 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2798    jx 2D1728        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0  4s5g      -d9s2 8i   
2799    jx 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2800    jy 2D1728         0.0     0.       0.0 FIXEDHF     0.000  0       0.0  0  4s5g      -d9s2 9i   
2801    jy 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2802    kl 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6g      -4s7g      
2803    kl 4E2727         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2804    km 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6g      -4s8g      
2805    km 4E2727         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2806    kn 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6g      -4s9g      
2807    kn 4E2727         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2808    ko 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6g      -d9s2 5g   
2809    ko 2D1727       -13.8     0.     -17.3 FIXEDHF     0.800  0       0.0  0                       
2810    ko 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2811    kp 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s6g      -d9s2 6g   
2812    kp 2D1727       -13.8     0.     -17.3 FIXEDHF     0.800  0       0.0  0                       
2813    kp 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2814    kq 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6g      -d9s2 7g   
2815    kq 2D1727        -9.7     0.     -12.1 FIXEDHF     0.800  0       0.0  0                       
2816    kq 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2817    kr 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6g      -d9s2 8g   
2818    kr 2D1727        -7.4     0.      -9.3 FIXEDHF     0.800  0       0.0  0                       
2819    kr 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2820    ks 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6g      -d9s2 9g   
2821    ks 2D1727        -6.0     0.      -7.5 FIXEDHF     0.800  0       0.0  0                       
2822    ks 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2823    kw 2D1728         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  4s6g      -d9s2 7i   
2824    kw 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2825    kx 2D1728        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  4s6g      -d9s2 8i   
2826    kx 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2827    ky 2D1728        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  4s6g      -d9s2 9i   
2828    ky 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2829    lm 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7g      -4s8g      
2830    lm 4E2727         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2831    ln 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7g      -4s9g      
2832    ln 4E2727         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2833    lo 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7g      -d9s2 5g   
2834    lo 2D1727        -9.8     0.     -12.2 FIXEDHF     0.800  0       0.0  0                       
2835    lo 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2836    lp 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7g      -d9s2 6g   
2837    lp 2D1727        -9.7     0.     -12.1 FIXEDHF     0.800  0       0.0  0                       
2838    lp 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2839    lq 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s7g      -d9s2 7g   
2840    lq 2D1727        -8.7     0.     -10.9 FIXEDHF     0.800  0       0.0  0                       
2841    lq 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2842    lr 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7g      -d9s2 8g   
2843    lr 2D1727        -6.6     0.      -8.3 FIXEDHF     0.800  0       0.0  0                       
2844    lr 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2845    ls 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7g      -d9s2 9g   
2846    ls 2D1727        -5.4     0.      -6.7 FIXEDHF     0.800  0       0.0  0                       
2847    ls 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2848    lw 2D1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7g      -d9s2 7i   
2849    lw 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2850    lx 2D1728         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  4s7g      -d9s2 8i   
2851    lx 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2852    ly 2D1728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  4s7g      -d9s2 9i   
2853    ly 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2854    mn 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8g      -4s9g      
2855    mn 4E2727         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2856    mo 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8g      -d9s2 5g   
2857    mo 2D1727        -7.5     0.      -9.4 FIXEDHF     0.800  0       0.0  0                       
2858    mo 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2859    mp 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8g      -d9s2 6g   
2860    mp 2D1727        -7.4     0.      -9.3 FIXEDHF     0.800  0       0.0  0                       
2861    mp 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2862    mq 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8g      -d9s2 7g   
2863    mq 2D1727        -6.6     0.      -8.3 FIXEDHF     0.800  0       0.0  0                       
2864    mq 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2865    mr 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s8g      -d9s2 8g   
2866    mr 2D1727        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0                       
2867    mr 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2868    ms 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8g      -d9s2 9g   
2869    ms 2D1727        -4.6     0.      -5.8 FIXEDHF     0.800  0       0.0  0                       
2870    ms 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2871    mw 2D1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8g      -d9s2 7i   
2872    mw 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2873    mx 2D1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8g      -d9s2 8i   
2874    mx 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2875    my 2D1728         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  4s8g      -d9s2 9i   
2876    my 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2877    no 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9g      -d9s2 5g   
2878    no 2D1727        -6.0     0.      -7.5 FIXEDHF     0.800  0       0.0  0                       
2879    no 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2880    np 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9g      -d9s2 6g   
2881    np 2D1727        -6.0     0.      -7.5 FIXEDHF     0.800  0       0.0  0                       
2882    np 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2883    nq 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9g      -d9s2 7g   
2884    nq 2D1727        -5.4     0.      -6.7 FIXEDHF     0.800  0       0.0  0                       
2885    nq 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2886    nr 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9g      -d9s2 8g   
2887    nr 2D1727        -4.6     0.      -5.8 FIXEDHF     0.800  0       0.0  0                       
2888    nr 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2889    ns 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s9g      -d9s2 9g   
2890    ns 2D1727        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
2891    ns 4E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2892    nw 2D1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9g      -d9s2 7i   
2893    nw 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2894    nx 2D1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9g      -d9s2 8i   
2895    nx 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2896    ny 2D1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9g      -d9s2 9i   
2897    ny 4E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2898    op 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5g   -d9s2 6g   
2899    op 2D1717         8.0     0.      10.0 FIXEDHF     0.800  0       0.0  0                       
2900    op 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2901    op 2E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2902    op 4E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2903    op 6E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2904    oq 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5g   -d9s2 7g   
2905    oq 2D1717         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0                       
2906    oq 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2907    oq 2E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2908    oq 4E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2909    oq 6E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2910    or 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5g   -d9s2 8g   
2911    or 2D1717         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
2912    or 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2913    or 2E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2914    or 4E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2915    or 6E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2916    os 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5g   -d9s2 9g   
2917    os 2D1717         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
2918    os 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2919    os 2E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2920    os 4E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2921    os 6E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2922    ot 2D2718        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0  d9s2 5g   -4s7i      
2923    ot 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2924    ou 2D2718        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0  d9s2 5g   -4s8i      
2925    ou 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2926    ov 2D2718        -3.7     0.      -4.6 FIXEDHF     0.800  0       0.0  0  d9s2 5g   -4s9i      
2927    ov 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2928    ow 2D1718         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  d9s2 5g   -d9s2 7i   
2929    ow 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2930    ow 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2931    ow 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2932    ox 2D1718         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  d9s2 5g   -d9s2 8i   
2933    ox 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2934    ox 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2935    ox 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2936    oy 2D1718         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0  d9s2 5g   -d9s2 9i   
2937    oy 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2938    oy 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2939    oy 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2940    pq 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6g   -d9s2 7g   
2941    pq 2D1717         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
2942    pq 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2943    pq 2E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2944    pq 4E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2945    pq 6E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2946    pr 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6g   -d9s2 8g   
2947    pr 2D1717         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
2948    pr 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2949    pr 2E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2950    pr 4E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2951    pr 6E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2952    ps 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6g   -d9s2 9g   
2953    ps 2D1717         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
2954    ps 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2955    ps 2E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2956    ps 4E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2957    ps 6E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2958    pt 2D2718         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 6g   -4s7i      
2959    pt 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2960    pu 2D2718        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 6g   -4s8i      
2961    pu 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2962    pv 2D2718        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 6g   -4s9i      
2963    pv 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2964    pw 2D1718        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d9s2 6g   -d9s2 7i   
2965    pw 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2966    pw 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2967    pw 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2968    px 2D1718         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  d9s2 6g   -d9s2 8i   
2969    px 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2970    px 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2971    px 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2972    py 2D1718         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 6g   -d9s2 9i   
2973    py 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2974    py 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2975    py 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2976    qr 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7g   -d9s2 8g   
2977    qr 2D1717         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0                       
2978    qr 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2979    qr 2E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2980    qr 4E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2981    qr 6E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2982    qs 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7g   -d9s2 9g   
2983    qs 2D1717         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0                       
2984    qs 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2985    qs 2E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2986    qs 4E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2987    qs 6E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2988    qt 2D2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7g   -4s7i      
2989    qt 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2990    qu 2D2718         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 7g   -4s8i      
2991    qu 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2992    qv 2D2718         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 7g   -4s9i      
2993    qv 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2994    qw 2D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7g   -d9s2 7i   
2995    qw 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2996    qw 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2997    qw 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2998    qx 2D1718        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 7g   -d9s2 8i   
2999    qx 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3000    qx 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3001    qx 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3002    qy 2D1718        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 7g   -d9s2 9i   
3003    qy 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3004    qy 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3005    qy 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3006    rs 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8g   -d9s2 9g   
3007    rs 2D1717         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0                       
3008    rs 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3009    rs 2E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3010    rs 4E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3011    rs 6E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3012    rt 2D2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8g   -4s7i      
3013    rt 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3014    ru 2D2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8g   -4s8i      
3015    ru 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3016    rv 2D2718         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  d9s2 8g   -4s9i      
3017    rv 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3018    rw 2D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8g   -d9s2 7i   
3019    rw 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3020    rw 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3021    rw 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3022    rx 2D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8g   -d9s2 8i   
3023    rx 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3024    rx 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3025    rx 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3026    ry 2D1718        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 8g   -d9s2 9i   
3027    ry 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3028    ry 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3029    ry 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3030    st 2D2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9g   -4s7i      
3031    st 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3032    su 2D2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9g   -4s8i      
3033    su 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3034    sv 2D2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9g   -4s9i      
3035    sv 6E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3036    sw 2D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9g   -d9s2 7i   
3037    sw 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3038    sw 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3039    sw 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3040    sx 2D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9g   -d9s2 8i   
3041    sx 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3042    sx 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3043    sx 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3044    sy 2D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9g   -d9s2 9i   
3045    sy 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3046    sy 4E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3047    sy 6E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3048    tu 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7i      -4s8i      
3049    tu 6E2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3050    tv 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7i      -4s9i      
3051    tv 6E2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3052    tw 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s7i      -d9s2 7i   
3053    tw 2D1828        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
3054    tw 6E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3055    tx 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7i      -d9s2 8i   
3056    tx 2D1828        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
3057    tx 6E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3058    ty 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7i      -d9s2 9i   
3059    ty 2D1828        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
3060    ty 6E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3061    uv 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8i      -4s9i      
3062    uv 6E2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3063    uw 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8i      -d9s2 7i   
3064    uw 2D1828        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
3065    uw 6E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3066    ux 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s8i      -d9s2 8i   
3067    ux 2D1828        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
3068    ux 6E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3069    uy 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8i      -d9s2 9i   
3070    uy 2D1828        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
3071    uy 6E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3072    vw 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9i      -d9s2 7i   
3073    vw 2D1828        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
3074    vw 6E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3075    vx 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9i      -d9s2 8i   
3076    vx 2D1828        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
3077    vx 6E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3078    vy 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s9i      -d9s2 9i   
3079    vy 2D1828        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
3080    vy 6E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3081    wx 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7i   -d9s2 8i   
3082    wx 2D1818         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
3083    wx 4D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3084    wx 4E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3085    wx 6E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3086    wx 8E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3087    wy 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7i   -d9s2 9i   
3088    wy 2D1818         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
3089    wy 4D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3090    wy 4E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3091    wy 6E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3092    wy 8E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3093    xy 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8i   -d9s2 9i   
3094    xy 2D1818         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
3095    xy 4D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3096    xy 4E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3097    xy 6E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3098    xy 8E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
