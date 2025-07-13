$SET def 3000
$SET VERIFY=NOIMAGE
$ASSIGN B3000EW.PUN FOR007
$ASSIGN H3000EW.HAM FOR001
$ASSIGN B3000EW.EIG FOR003
$ASSIGN EAV3000EW.DAT FOR066
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
    0    0    0    0     0.300     1.300
    2  1.        100  130  130  100   80   50   30   20   10   10   10    0
  30.00
4s2       4s5s      4s6s      4s7s      4s8s      4s9s      4s10s     4s11s 
4s12s     4s13s     4s14s     d9s2 5s   d9s2 6s   d9s2 7s   d9s2 8s   d9s2 9s   
d9s2 10s  d9s2 11s  d9s2 12s  d9s2 13s  d9s2 14s  4s4d      4s5d      4s6d  
4s7d      4s8d      4s9d      4s10d     4s11d     4s12d     4s13d     4s14d 
4s15d     d9s2 4d   d9s2 5d   d9s2 6d   d9s2 7d   d9s2 8d   d9s2 9d   d9s2 10d  
d9s2 11d  d9s2 12d  d9s2 13d  d9s2 14d  d9s2 15d  4p2       4p5p      4p6p  
4p7p      4p8p      4p9p      4p4f      4p5f      4p6f      4p7f      4p8f  
4p9f  
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
1  0.                            4p5p 3P                  4p5p 3P
1  0.                            4p5p 1S                  4p5p 1S
1  0.                            4p6p 3P                  4p6p 3P
1  0.                            4p6p 1S                  4p6p 1S
1  0.                            4p7p 3P                  4p7p 3P
1  0.                            4p7p 1S                  4p7p 1S
1  0.                            4p8p 3P                  4p8p 3P
1  0.                            4p8p 1S                  4p8p 1S
1  0.                            4p9p 3P                  4p9p 3P
1  0.                            4p9p 1S                  4p9p 1S
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
1  0.                            3d9.4s2.15d 1S           s2.14d 1S
1  0.                            3d9.4s2.8d 3P            s2.8d 3P
1  0.                            3d9.4s2.9d 3P            s2.9d 3P
1  0.                            3d9.4s2.10d 3P           s2.10d 3P
1  0.                            3d9.4s2.11d 3P           s2.11d 3P
1  0.                            3d9.4s2.12d 3P           s2.12d 3P
1  0.                            3d9.4s2.13d 3P           s2.13d 3P
1  0.                            3d9.4s2.14d 3P           s2.14d 3P
1  0.                            3d9.4s2.15d 3P           s2.14d 3P
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
1  1.                            4p5p 1P                  4p5p 1P 
1  1.                            4p5p 3D                  4p5p 3D 
1  1.                            4p5p 3S                  4p5p 3S
1  1.                            4p5p 3P                  4p5p 3P 
1  1.                            4p6p 3D                  4p6p 3D 
1  1.                            4p6p 1P                  4p6p 1P 
1  1.                            4p6p 3S                  4p6p 3S
1  1.                            3d9.4s2.5s 3D            s2.5s 3D
1  1.                            4p6p 3P                  4p6p 3P 
1  1.                            4p4f 3D                  4p4f 3D 
1  1.                            4p7p 3D                  4p7p 3D 
1  1.                            4p7p 3S                  4p7p 3S
1  1.                            4p7p 1P                  4p7p 1P 
1  1.                            4p7p 3P                  4p7p 3P 
1  1.                            4p5f 3D                  4p5f 3D 
1  1.                            4p8p 3D                  4p8p 3D 
1  1.                            4p8p 3S                  4p8p 3S
1  1.                            4p9p 3D                  4p9p 3D 
1  1.                            4p9p 3S                  4p9p 3S
1  1.                            4p8p 1P                  4p8p 1P 
1  1.                            4p8p 3P                  4p8p 3P 
1  1.                            4p6f 3D                  4p6f 3D 
1  1.                            4p9p 1P                  4p9p 1P 
1  1.                            4p9p 3P                  4p9p 3P 
1  1.                            4p7f 3D                  4p7f 3D 
1  1.                            4p8f 3D                  4p8f 3D 
1  1.                            4p9f 3D                  4p9f 3D 
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
1  1.                            3d9.4s2.7s 3D            s2.7s 3D
1  1.                            3d9.4s2.7d 3S            s2.7d 3S
1  1.                            3d9.4s2.7d 1P            s2.7d 1P
1  1.                            3d9.4s2.8d 3S            s2.8d 3S
1  1.                            3d9.4s2.8d 1P            s2.8d 1P
1  1.                            3d9.4s2.6d 3P            s2.6d 3P
1  1.                            3d9.4s2.6d 3D            s2.6d 3D
1  1.                            3d9.4s2.9d 3S            s2.9d 3S
1  1.                            3d9.4s2.9d 1P            s2.9d 1P
1  1.                            3d9.4s2.10d 3S           s2.10d 3S
1  1.                            3d9.4s2.10d 1P           s2.10d 1P
1  1.                            3d9.4s2.8s 3D            s2.8s 3D
1  1.                            3d9.4s2.11d 3S           s2.11d 3S
1  1.                            3d9.4s2.11d 1P           s2.11d 1P
1  1.                            3d9.4s2.12d 3S           s2.12d 3S
1  1.                            3d9.4s2.12d 1P           s2.12d 1P
1  1.                            3d9.4s2.13d 3S           s2.13d 3S
1  1.                            3d9.4s2.13d 1P           s2.13d 1P
1  1.                            3d9.4s2.14d 3S           s2.14d 3S
1  1.                            3d9.4s2.14d 1P           s2.14d 1P
1  1.                            3d9.4s2.15d 3S           s2.15d 3S
1  1.                            3d9.4s2.15d 1P           s2.15d 1P
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
1  1.                            3d9.4s2.15d 3P           s2.15d 3P
1  1.                            3d9.4s2.15d 3D           s2.15d 3D
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
1  2.                            4p5p 3D                  4p5p 3D
1  2.                            4p5p 3P                  4p5p 3P
1  2.                            4p5p 1D                  4p5p 1D
1  2.                            3d9.4s2.5s 1D            s2.5s 1D
1  2.                            4p6p 3D                  4p6p 3D
1  2.                            4p4f 3F                  4p4f 3F
1  2.                            4p6p 3P                  4p6p 3P
1  2.                            3d9.4s2.5s 3D            s2.5s 3D
1  2.                            4p6p 1D                  4p6p 1D
1  2.                            4p4f 1D                  4p4f 1D
1  2.                            4p4f 3D                  4p4f 3D
1  2.                            4p7p 3D                  4p7p 3D
1  2.                            4p5f 3F                  4p5f 3F
1  2.                            4p7p 3P                  4p7p 3P
1  2.                            4p7p 1D                  4p7p 1D
1  2.                            4p5f 1D                  4p5f 1D
1  2.                            4p5f 3D                  4p5f 3D
1  2.                            4p8p 3D                  4p8p 3D
1  2.                            4p6f 3F                  4p6f 3F
1  2.                            4p9p 3D                  4p9p 3D
1  2.                            4p7f 3F                  4p7f 3F
1  2.                            4p8p 3P                  4p8p 3P
1  2.                            4p6f 1D                  4p6f 1D
1  2.                            4p6f 3D                  4p6f 3D
1  2.                            4p8p 1D                  4p8p 1D
1  2.                            4p8f 3F                  4p8f 3F
1  2.                            4p9f 3F                  4p9f 3F
1  2.                            4p9p 3P                  4p9p 3P
1  2.                            4p7f 1D                  4p7f 1D
1  2.                            4p7f 3D                  4p7f 3D
1  2.                            4p9p 1D                  4p9p 1D
1  2.                            4p8f 1D                  4p8f 1D
1  2.                            4p8f 3D                  4p8f 3D
1  2.                            4p9f 1D                  4p9f 1D
1  2.                            4p9f 3D                  4p9f 3D
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
1  2.                            3d9.4s2.8s 1D            s2.8s 1D
1  2.                            3d9.4s2.7s 3D            s2.7s 3D
1  2.                            3d9.4s2.7d 3P            s2.7d 3P
1  2.                            3d9.4s2.7d 1D            s2.7d 1D
1  2.                            3d9.4s2.9s 1D            s2.9s 1D
1  2.                            3d9.4s2.8d 3P            s2.8d 3P
1  2.                            3d9.4s2.8d 1D            s2.8d 1D
1  2.                            3d9.4s2.6d 3D            s2.6d 3D
1  2.                            3d9.4s2.10s 1D           s2.10s 1D
1  2.                            3d9.4s2.6d 3F            s2.6d 3F
1  2.                            3d9.4s2.9d 3P            s2.9d 3P
1  2.                            3d9.4s2.9d 1D            s2.9d 1D
1  2.                            3d9.4s2.11s 1D           s2.11s 1D
1  2.                            3d9.4s2.10d 3P           s2.10d 3P
1  2.                            3d9.4s2.10d 1D           s2.10d 1D
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
1  2.                            3d9.4s2.15d 3P           s2.15d 3P
1  2.                            3d9.4s2.15d 1D           s2.15d 1D
1  2.                            3d9.4s2.7d 3D            s2.7d 3D
1  2.                            3d9.4s2.7d 3F            s2.7d 3F
1  2.                            3d9.4s2.9s 3D            s2.9s 3D
1  2.                            3d9.4s2.8d 3D            s2.8d 3D
1  2.                            3d9.4s2.8d 3F            s2.8d 3F
1  2.                            3d9.4s2.10s 3D           s2.10s 3D
1  2.                            3d9.4s2.9d 3D            s2.9d 3D
1  2.                            3d9.4s2.9d 3F            s2.9d 3F
1  2.                            3d9.4s2.11s 3D           s2.11s 3D
1  2.                            3d9.4s2.10d 3D           s2.10d 3D
1  2.                            3d9.4s2.10d 3F           s2.10d 3F
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
1  2.                            3d9.4s2.15d 3D           s2.15d 3D
1  2.                            3d9.4s2.15d 3F           s2.15d 3F
   3.      62776.981             4s4d 3D                  4s4d 3D
   3.      68583.083             4s5d 3D                  4s5d 3D
   3.      71214.243             4s6d 3D                  4s6d 3D
   3.      72627.9               4s7d 3D                  4s7d 3D
   3.      73471.1               4s8d 3D                  4d8d 3D
   3.      74016.7               4s9d 3D                  4s9d 3D
   3.      74386.4               4s10d 3D                 4s10d 3D
   3.      74651.3               4s11d 3D                 4s11d 3D
   3.      74855.1               4s12d 3D                 4s12d 3D
   3.      74994.0               4s13d 3D                 4s13d 3D
   3.      75112.2               4s14d 3D                 4s14d 3D
   3.      75202.1               4s15d 3D                 4s15d 3D
1  3.                            4p5p 3D                  4p5p 3D
1  3.                            3d9.4s2.5s 3D            s2.5s 3D
1  3.                            4p6p 3D                  4p6p 3D
1  3.                            4p4f 3G                  4p4f 3G
1  3.                            4p4f 3F                  4p4f 3F
1  3.                            4p4f 1F                  4p4f 1F
1  3.                            4p4f 3D                  4p4f 3D
1  3.                            4p5f 3G                  4p5f 3G
1  3.                            4p5f 3F                  4p5f 3F
1  3.                            4p7p 3D                  4p7p 3D
1  3.                            4p5f 1F                  4p5f 1F
1  3.                            4p5f 3D                  4p5f 3D
1  3.                            4p6f 3G                  4p6f 3G
1  3.                            4p6f 3F                  4p6f 3F
1  3.                            4p8p 3D                  4p8p 3D
1  3.                            4p7f 3G                  4p7f 3G
1  3.                            4p7f 3F                  4p7f 3F
1  3.                            4p6f 1F                  4p6f 1F
1  3.                            4p6f 3D                  4p6f 3D
1  3.                            4p8f 3G                  4p8f 3G
1  3.                            4p8f 3F                  4p8f 3F
1  3.                            4p9p 3D                  4p9p 3D
1  3.                            4p9f 3G                  4p9f 3G
1  3.                            4p9f 3F                  4p9f 3F
1  3.                            4p7f 1F                  4p7f 1F
1  3.                            4p7f 3D                  4p7f 3D
1  3.                            4p8f 1F                  4p8f 1F
1  3.                            4p8f 3D                  4p8f 3D
1  3.                            4p9f 1F                  4p9f 1F
1  3.                            4p9f 3D                  4p9f 3D
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
1  3.                            3d9.4s2.8s 3D            s2.8s 3D
1  3.                            3d9.4s2.7d 3D            s2.7d 3D
1  3.                            3d9.4s2.7d 1F            s2.7d 1F
1  3.                            3d9.4s2.9s 3D            s2.9s 3D
1  3.                            3d9.4s2.8d 3D            s2.8d 3D
1  3.                            3d9.4s2.8d 1F            s2.8d 1F
1  3.                            3d9.4s2.6d 3G            s2.6d 3G
1  3.                            3d9.4s2.10s 3D           s2.10s 3D
1  3.                            3d9.4s2.6d 3F            s2.6d 3F
1  3.                            3d9.4s2.9d 3D            s2.9d 3D
1  3.                            3d9.4s2.9d 1F            s2.9d 1F
1  3.                            3d9.4s2.11s 3D           s2.11s 3D
1  3.                            3d9.4s2.10d 3D           s2.10d 3D
1  3.                            3d9.4s2.10d 1F           s2.10d 1F
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
1  3.                            3d9.4s2.15d 3D           s2.15d 3D
1  3.                            3d9.4s2.15d 1F           s2.15d 1F
1  3.                            3d9.4s2.7d 3G            s2.7d 3G
1  3.                            3d9.4s2.7d 3F            s2.7d 3F
1  3.                            3d9.4s2.8d 3G            s2.8d 3G
1  3.                            3d9.4s2.8d 3F            s2.8d 3F
1  3.                            3d9.4s2.9d 3G            s2.9d 3G
1  3.                            3d9.4s2.9d 3F            s2.9d 3F
1  3.                            3d9.4s2.10d 3G           s2.10d 3G
1  3.                            3d9.4s2.10d 3F           s2.10d 3F
1  3.                            3d9.4s2.11d 3G           s2.11d 3G
1  3.                            3d9.4s2.11d 3F           s2.11d 3F
1  3.                            3d9.4s2.12d 3G           s2.12d 3G
1  3.                            3d9.4s2.12d 3F           s2.12d 3F
1  3.                            3d9.4s2.13d 3G           s2.13d 3G
1  3.                            3d9.4s2.13d 3F           s2.13d 3F
1  3.                            3d9.4s2.14d 3G           s2.14d 3G
1  3.                            3d9.4s2.14d 3F           s2.14d 3F
1  3.                            3d9.4s2.15d 3G           s2.15d 3G
1  3.                            3d9.4s2.15d 3F           s2.15d 3F
1  4.                            4p4f 3G                  4p4f 3G
1  4.                            4p4f 3F                  4p4f 3F
1  4.                            4p4f 1G                  4p4f 1G
1  4.                            4p5f 3G                  4p5f 3G
1  4.                            4p5f 3F                  4p5f 3F
1  4.                            4p5f 1G                  4p5f 1G
1  4.                            4p6f 3G                  4p6f 3G
1  4.                            4p7f 3G                  4p7f 3G
1  4.                            4p6f 3F                  4p6f 3F
1  4.                            4p6f 1G                  4p6f 1G
1  4.                            4p8f 3G                  4p8f 3G
1  4.                            4p9f 3G                  4p9f 3G
1  4.                            4p7f 3F                  4p7f 3F
1  4.                            4p7f 1G                  4p7f 1G
1  4.                            4p8f 3F                  4p8f 3F
1  4.                            4p8f 1G                  4p8f 1G
1  4.                            4p9f 3F                  4p9f 3F
1  4.                            4p9f 1G                  4p9f 1G
1  4.                            3d9.4s2.4d 1G            s2.4d 1G
1  4.                            3d9.4s2.4d 3F            s2.4d 3F
1  4.                            3d9.4s2.4d 3G            s2.4d 3G
1  4.                            3d9.4s2.5d 1G            s2.5d 1G
1  4.                            3d9.4s2.5d 3F            s2.5d 3F
1  4.                            3d9.4s2.5d 3G            s2.5d 3G
1  4.                            3d9.4s2.6d 1G            s2.6d 1G
1  4.                            3d9.4s2.6d 3F            s2.6d 3F
1  4.                            3d9.4s2.7d 1G            s2.7d 1G
1  4.                            3d9.4s2.7d 3F            s2.7d 3F
1  4.                            3d9.4s2.8d 1G            s2.8d 1G
1  4.                            3d9.4s2.8d 3F            s2.8d 3F
1  4.                            3d9.4s2.6d 3G            s2.6d 3G
1  4.                            3d9.4s2.9d 1G            s2.9d 1G
1  4.                            3d9.4s2.9d 3F            s2.9d 3F
1  4.                            3d9.4s2.10d 1G           s2.10d 1G
1  4.                            3d9.4s2.10d 3F           s2.10d 3F
1  4.                            3d9.4s2.11d 1G           s2.11d 1G
1  4.                            3d9.4s2.11d 3F           s2.11d 3F
1  4.                            3d9.4s2.12d 1G           s2.12d 1G
1  4.                            3d9.4s2.12d 3F           s2.12d 3F
1  4.                            3d9.4s2.13d 1G           s2.13d 1G
1  4.                            3d9.4s2.13d 3F           s2.13d 3F
1  4.                            3d9.4s2.14d 1G           s2.14d 1G
1  4.                            3d9.4s2.14d 3F           s2.14d 3F
1  4.                            3d9.4s2.15d 1G           s2.15d 1G
1  4.                            3d9.4s2.15d 3F           s2.15d 3F
1  4.                            3d9.4s2.7d 3G            s2.7d 3G
1  4.                            3d9.4s2.8d 3G            s2.8d 3G
1  4.                            3d9.4s2.9d 3G            s2.9d 3G
1  4.                            3d9.4s2.10d 3G           s2.10d 3G
1  4.                            3d9.4s2.11d 3G           s2.11d 3G
1  4.                            3d9.4s2.12d 3G           s2.12d 3G
1  4.                            3d9.4s2.13d 3G           s2.13d 3G
1  4.                            3d9.4s2.14d 3G           s2.14d 3G
1  4.                            3d9.4s2.15d 3G           s2.15d 3G
1  5.                            4p4f 3G                  4p4f 3G
1  5.                            4p5f 3G                  4p5f 3G
1  5.                            4p6f 3G                  4p6f 3G
1  5.                            4p7f 3G                  4p7f 3G
1  5.                            4p8f 3G                  4p8f 3G
1  5.                            4p9f 3G                  4p9f 3G
1  5.                            3d9.4s2.4d 3G            s2.4d 3G
1  5.                            3d9.4s2.5d 3G            s2.5d 3G
1  5.                            3d9.4s2.6d 3G            s2.6d 3G
1  5.                            3d9.4s2.7d 3G            s2.7d 3G
1  5.                            3d9.4s2.8d 3G            s2.8d 3G
1  5.                            3d9.4s2.9d 3G            s2.9d 3G
1  5.                            3d9.4s2.10d 3G           s2.10d 3G
1  5.                            3d9.4s2.11d 3G           s2.11d 3G
1  5.                            3d9.4s2.12d 3G           s2.12d 3G
1  5.                            3d9.4s2.13d 3G           s2.13d 3G
1  5.                            3d9.4s2.14d 3G           s2.14d 3G
1  5.                            3d9.4s2.15d 3G           s2.15d 3G
 2819       1.9   41      LEAST SQUARES
   1    1  EAV         8047.4     2.    8000.0             1.000  0    6900.0  0             4s2       
   2    2  EAV        54704.3     1.   47203.4             1.000  0    6900.0  0             4s5s      
   3    2  G0(24)      1411.7     1.    2339.5             0.800  0       0.0  0                       
   4    3  EAV        65656.1     1.   58726.5             1.000  0    6900.0  0             4s6s      
   5    3  G0(25)       383.4     1.     701.0             0.800  0       0.0  0                       
   6    4  EAV        69824.1     1.   62944.2             1.000  0    6900.0  0             4s7s      
   7    4  G0(25)       153.6     1.     305.1             0.800  0       0.0  0                       
   8    5  EAV        71856.8     1.   64983.9             1.000  0    6900.0  0             4s8s      
   9    5  G0(25)        74.5     1.     160.4             0.800  0       0.0  0                       
  10    6  EAV        73001.7     1.   66127.5             1.000  0    6900.0  0             4s9s      
  11    6  G0(25)        39.0     1.      94.8             0.800  0       0.0  0                       
  12    7  EAV        73705.0     2.   66832.2             1.000  0    6900.0  0             4s10s     
  13    7  G0(25)        18.2     0.      60.7 FIXEDHF     0.300  0       0.0  0                       
  14    8  EAV        74173.1     2.   67297.9             1.000  0    6900.0  0             4s11s     
  15    8  G0(25)        12.4     0.      41.2 FIXEDHF     0.300  0       0.0  0                       
  16    9  EAV        74498.5     2.   67621.6             1.000  0    6900.0  0             4s12s     
  17    9  G0(25)         8.8     0.      29.3 FIXEDHF     0.300  0       0.0  0                       
  18    A  EAV        74733.7     0.   67855.7 FIXEDHF     1.000  0    6878.0  0             4s13s     
  19    A  G0(25)         6.5     0.      21.5 FIXEDHF     0.300  0       0.0  0                       
  20    B  EAV        74908.4     2.   68030.2             1.000  0    6900.0  0             4s14s     
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
  52    M  EAV        63022.7     1.   55661.4             1.000  0    6900.0  0             4s4d      
  53    M  ZETA 6         2.8     1.       3.3             1.000  0       0.0  0                       
  54    M  G2(26)       938.7     6.    1019.3             0.800  0       0.0  0                       
  55    N  EAV        68660.5     1.   61621.8             1.000  0    6900.0  0             4s5d      
  56    N  ZETA 6         1.4     1.       1.9             1.000  0       0.0  0                       
  57    N  G2(26)       468.9     6.     559.8             0.800  0       0.0  0                       
  58    O  EAV        71247.8     1.   64293.6             1.000  0    6900.0  0             4s6d      
  59    O  ZETA 6         0.8     1.       1.1             1.000  0       0.0  0                       
  60    O  G2(26)       243.4     6.     318.4             0.800  0       0.0  0                       
  61    P  EAV        72644.8     1.   65723.1             1.000  0    6900.0  0             4s7d      
  62    P  ZETA 6         0.7     0.       0.7 FIXEDHF     1.000  0       0.0  0                       
  63    P  G2(26)       126.6     6.     194.9             0.800  0       0.0  0                       
  64    Q  EAV        73480.3     1.   66576.7             1.000  0    6900.0  0             4s8d      
  65    Q  ZETA 6         0.5     0.       0.5 FIXEDHF     1.000  0       0.0  0                       
  66    Q  G2(26)        72.4     6.     127.0             0.800  0       0.0  0                       
  67    R  EAV        74021.6     1.   67126.1             1.000  0    6900.0  0             4s9d      
  68    R  ZETA 6         0.3     0.       0.3 FIXEDHF     1.000  0       0.0  0                       
  69    R  G2(26)        39.6     6.      87.0             0.800  0       0.0  0                       
  70    S  EAV        74390.0     1.   67500.6             1.000  0    6900.0  0             4s10d     
  71    S  ZETA 6         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0                       
  72    S  G2(26)        26.7     6.      61.9             0.400  0       0.0  0                       
  73    T  EAV        74653.4     1.   67767.0             1.000  0    6900.0  0             4s11d     
  74    T  ZETA 6         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0                       
  75    T  G2(26)        17.0     6.      45.7             0.400  0       0.0  0                       
  76    U  EAV        74852.5     1.   67963.5             1.000  0    6900.0  0             4s12d     
  77    U  ZETA 6         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
  78    U  G2(26)        12.1     0.      34.6 FIXEDHF     0.350  0       0.0  0                       
  79    V  EAV        74995.4     1.   68112.3             1.000  0    6900.0  0             4s13d     
  80    V  ZETA 6         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
  81    V  G2(26)         8.2     6.      26.8             0.400  0       0.0  0                       
  82    W  EAV        75111.9     1.   68228.2             1.000  0    6900.0  0             4s14d     
  83    W  ZETA 6         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
  84    W  G2(26)         6.4     0.      21.2 FIXED       0.400  0       0.0  0                       
  85    X  EAV        75202.2     1.   68319.8             1.000  0    6900.0  0             4s15d     
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
 176    j  EAV       138948.9     0.  123948.9 FIXEDHF     1.000  0   15000.0  0             d9s2 15d  
 177    j  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 178    j  ZETA 6         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
 179    j  F2(16)        11.4     0.      14.2 FIXEDHF     0.800  0       0.0  0                       
 180    j  F4(16)         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0                       
 181    j  G0(16)        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0                       
 182    j  G2(16)         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0                       
 183    j  G4(16)         4.5     0.       5.6 FIXEDHF     0.800  0       0.0  0                       
 184    k  EAV        83119.8     1.   74035.9             1.000  0    9000.0  0             4p2       
 185    k  F2(33)     20955.4     0.   26194.2 FIXEDHF     0.800  0       0.0  0                       
 186    k  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 187    k  ZETA 3       404.7     2.     451.6             1.000  0       0.0  0                       
 188    l  EAV       109597.4     0.  100497.4 FIXEDHF     1.000  0    9100.0  0             4p5p      
 189    l  ZETA 3       665.9     0.     665.9 FIXEDHF     1.000  0       0.0  0                       
 190    l  ZETA 7        68.4     0.      68.4 FIXEDHF     1.000  0       0.0  0                       
 191    l  F2(37)      3965.2     0.    4956.5 FIXEDHF     0.800  0       0.0  0                       
 192    l  G0(37)      1941.8     0.    2427.3 FIXEDHF     0.800  0       0.0  0                       
 193    l  G2(37)      1631.0     0.    2038.8 FIXEDHF     0.800  0       0.0  0                       
 194    m  EAV       116896.8     0.  107796.8 FIXEDHF     1.000  0    9100.0  0             4p6p      
 195    m  ZETA 3       678.6     0.     678.6 FIXEDHF     1.000  0       0.0  0                       
 196    m  ZETA 7        26.8     0.      26.8 FIXEDHF     1.000  0       0.0  0                       
 197    m  F2(37)      1400.8     0.    1751.0 FIXEDHF     0.800  0       0.0  0                       
 198    m  G0(37)       631.1     0.     788.9 FIXEDHF     0.800  0       0.0  0                       
 199    m  G2(37)       567.8     0.     709.7 FIXEDHF     0.800  0       0.0  0                       
 200    n  EAV       119889.4     0.  110789.4 FIXEDHF     1.000  0    9100.0  0             4p7p      
 201    n  ZETA 3       682.4     0.     682.4 FIXEDHF     1.000  0       0.0  0                       
 202    n  ZETA 7        13.3     0.      13.3 FIXEDHF     1.000  0       0.0  0                       
 203    n  F2(37)       660.3     0.     825.4 FIXEDHF     0.800  0       0.0  0                       
 204    n  G0(37)       289.0     0.     361.2 FIXEDHF     0.800  0       0.0  0                       
 205    n  G2(37)       268.6     0.     335.7 FIXEDHF     0.800  0       0.0  0                       
 206    o  EAV       121438.4     0.  112338.4 FIXEDHF     1.000  0    9100.0  0             4p8p      
 207    o  ZETA 3       683.8     0.     683.8 FIXEDHF     1.000  0       0.0  0                       
 208    o  ZETA 7         7.6     0.       7.6 FIXEDHF     1.000  0       0.0  0                       
 209    o  F2(37)       364.6     0.     455.8 FIXEDHF     0.800  0       0.0  0                       
 210    o  G0(37)       157.2     0.     196.5 FIXEDHF     0.800  0       0.0  0                       
 211    o  G2(37)       148.9     0.     186.1 FIXEDHF     0.800  0       0.0  0                       
 212    p  EAV       122347.2     0.  113247.2 FIXEDHF     1.000  0    9100.0  0             4p9p      
 213    p  ZETA 3       684.5     0.     684.5 FIXEDHF     1.000  0       0.0  0                       
 214    p  ZETA 7         4.7     0.       4.7 FIXEDHF     1.000  0       0.0  0                       
 215    p  F2(37)       222.9     0.     278.6 FIXEDHF     0.800  0       0.0  0                       
 216    p  G0(37)        95.3     0.     119.1 FIXEDHF     0.800  0       0.0  0                       
 217    p  G2(37)        91.3     0.     114.1 FIXEDHF     0.800  0       0.0  0                       
 218    q  EAV       117684.0     0.  108584.0 FIXEDHF     1.000  0    9100.0  0             4p4f      
 219    q  ZETA 3       685.3     0.     685.3 FIXEDHF     1.000  0       0.0  0                       
 220    q  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 221    q  F2(38)       756.1     0.     945.1 FIXEDHF     0.800  0       0.0  0                       
 222    q  G2(38)        63.6     0.      79.5 FIXEDHF     0.800  0       0.0  0                       
 223    q  G4(38)        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0                       
 224    r  EAV       120232.8     0.  111132.8 FIXEDHF     1.000  0    9100.0  0             4p5f      
 225    r  ZETA 3       685.4     0.     685.4 FIXEDHF     1.000  0       0.0  0                       
 226    r  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 227    r  F2(38)       393.8     0.     492.3 FIXEDHF     0.800  0       0.0  0                       
 228    r  G2(38)        52.4     0.      65.5 FIXEDHF     0.800  0       0.0  0                       
 229    r  G4(38)        34.2     0.      42.7 FIXEDHF     0.800  0       0.0  0                       
 230    s  EAV       121620.5     0.  112520.5 FIXEDHF     1.000  0    9100.0  0             4p6f      
 231    s  ZETA 3       685.5     0.     685.5 FIXEDHF     1.000  0       0.0  0                       
 232    s  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 233    s  F2(38)       232.0     0.     290.0 FIXEDHF     0.800  0       0.0  0                       
 234    s  G2(38)        37.9     0.      47.4 FIXEDHF     0.800  0       0.0  0                       
 235    s  G4(38)        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0                       
 236    t  EAV       122455.9     0.  113355.9 FIXEDHF     1.000  0    9100.0  0             4p7f      
 237    t  ZETA 3       685.5     0.     685.5 FIXEDHF     1.000  0       0.0  0                       
 238    t  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 239    t  F2(38)       148.4     0.     185.5 FIXEDHF     0.800  0       0.0  0                       
 240    t  G2(38)        27.3     0.      34.1 FIXEDHF     0.800  0       0.0  0                       
 241    t  G4(38)        17.8     0.      22.3 FIXEDHF     0.800  0       0.0  0                       
 242    u  EAV       122996.4     0.  113896.4 FIXEDHF     1.000  0    9100.0  0             4p8f      
 243    u  ZETA 3       685.6     0.     685.6 FIXEDHF     1.000  0       0.0  0                       
 244    u  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 245    u  F2(38)       100.8     0.     126.0 FIXEDHF     0.800  0       0.0  0                       
 246    u  G2(38)        20.0     0.      25.0 FIXEDHF     0.800  0       0.0  0                       
 247    u  G4(38)        13.0     0.      16.3 FIXEDHF     0.800  0       0.0  0                       
 248    v  EAV       123366.0     0.  114266.0 FIXEDHF     1.000  0    9100.0  0             4p9f      
 249    v  ZETA 3       685.6     0.     685.6 FIXEDHF     1.000  0       0.0  0                       
 250    v  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 251    v  F2(38)        71.7     0.      89.6 FIXEDHF     0.800  0       0.0  0                       
 252    v  G2(38)        15.0     0.      18.7 FIXEDHF     0.800  0       0.0  0                       
 253    v  G4(38)         9.8     0.      12.2 FIXEDHF     0.800  0       0.0  0                       
 254    12 0D2224      2316.2     0.    2895.3 FIXEDHF     0.800  0       0.0  0  4s2       -4s5s      
 255    13 0D2225      1238.6     0.    1548.2 FIXEDHF     0.800  0       0.0  0  4s2       -4s6s      
 256    14 0D2225       808.1     0.    1010.1 FIXEDHF     0.800  0       0.0  0  4s2       -4s7s      
 257    15 0D2225       582.3     0.     727.9 FIXEDHF     0.800  0       0.0  0  4s2       -4s8s      
 258    16 0D2225       445.9     0.     557.4 FIXEDHF     0.800  0       0.0  0  4s2       -4s9s      
 259    17 0D2225       356.0     0.     445.0 FIXEDHF     0.800  0       0.0  0  4s2       -4s10s     
 260    18 0D2225       292.9     0.     366.1 FIXEDHF     0.800  0       0.0  0  4s2       -4s11s     
 261    19 0D2225       246.5     0.     308.1 FIXEDHF     0.800  0       0.0  0  4s2       -4s12s     
 262    1A 0D2225       211.3     0.     264.1 FIXEDHF     0.800  0       0.0  0  4s2       -4s13s     
 263    1B 0D2225       183.8     0.     229.7 FIXEDHF     0.800  0       0.0  0  4s2       -4s14s     
 264    1C 2D1114       315.1     0.     393.9 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 5s   
 265    1D 2D1115       191.4     0.     239.3 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 6s   
 266    1E 2D1115       130.9     0.     163.6 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 7s   
 267    1F 2D1115        96.4     0.     120.5 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 8s   
 268    1G 2D1115        74.7     0.      93.4 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 9s   
 269    1H 2D1115        60.2     0.      75.2 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 10s  
 270    1I 2D1115        49.7     0.      62.1 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 11s  
 271    1J 2D1115        42.0     0.      52.5 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 12s  
 272    1K 2D1115        36.1     0.      45.1 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 13s  
 273    1L 2D1115        31.4     0.      39.3 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 14s  
 274    1Y 0D1116       855.7     0.    1069.6 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 4d   
 275    1Y 2D1116      5569.0     0.    6961.3 FIXEDHF     0.800  0       0.0  0                       
 276    1Y 4D1116      3534.7     0.    4418.4 FIXEDHF     0.800  0       0.0  0                       
 277    1Z 0D1116       637.4     0.     796.8 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 5d   
 278    1Z 2D1116      4158.9     0.    5198.6 FIXEDHF     0.800  0       0.0  0                       
 279    1Z 4D1116      2644.3     0.    3305.4 FIXEDHF     0.800  0       0.0  0                       
 280    1a 0D1116       481.6     0.     602.0 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 6d   
 281    1a 2D1116      3145.6     0.    3932.0 FIXEDHF     0.800  0       0.0  0                       
 282    1a 4D1116      2001.6     0.    2502.0 FIXEDHF     0.800  0       0.0  0                       
 283    1b 0D1116       376.7     0.     470.9 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 7d   
 284    1b 2D1116      2461.9     0.    3077.4 FIXEDHF     0.800  0       0.0  0                       
 285    1b 4D1116      1567.2     0.    1959.0 FIXEDHF     0.800  0       0.0  0                       
 286    1c 0D1116       303.8     0.     379.8 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 8d   
 287    1c 2D1116      1986.4     0.    2483.0 FIXEDHF     0.800  0       0.0  0                       
 288    1c 4D1116      1264.9     0.    1581.1 FIXEDHF     0.800  0       0.0  0                       
 289    1d 0D1116       251.3     0.     314.1 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 9d   
 290    1d 2D1116      1643.2     0.    2054.0 FIXEDHF     0.800  0       0.0  0                       
 291    1d 4D1116      1046.5     0.    1308.1 FIXEDHF     0.800  0       0.0  0                       
 292    1e 0D1116       212.1     0.     265.1 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 10d  
 293    1e 2D1116      1387.0     0.    1733.8 FIXEDHF     0.800  0       0.0  0                       
 294    1e 4D1116       883.4     0.    1104.3 FIXEDHF     0.800  0       0.0  0                       
 295    1f 0D1116       182.0     0.     227.5 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 11d  
 296    1f 2D1116      1190.3     0.    1487.9 FIXEDHF     0.800  0       0.0  0                       
 297    1f 4D1116       758.2     0.     947.8 FIXEDHF     0.800  0       0.0  0                       
 298    1g 0D1116       158.3     0.     197.9 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 12d  
 299    1g 2D1116      1035.6     0.    1294.5 FIXEDHF     0.800  0       0.0  0                       
 300    1g 4D1116       659.7     0.     824.6 FIXEDHF     0.800  0       0.0  0                       
 301    1h 0D1116       139.3     0.     174.1 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 13d  
 302    1h 2D1116       911.4     0.    1139.3 FIXEDHF     0.800  0       0.0  0                       
 303    1h 4D1116       580.6     0.     725.8 FIXEDHF     0.800  0       0.0  0                       
 304    1i 0D1116       123.8     0.     154.8 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 14d  
 305    1i 2D1116       810.0     0.    1012.5 FIXEDHF     0.800  0       0.0  0                       
 306    1i 4D1116       516.1     0.     645.1 FIXEDHF     0.800  0       0.0  0                       
 307    1j 0D1116       111.0     0.     138.7 FIXEDHF     0.800  0       0.0  0  4s2       -d9s2 15d  
 308    1j 2D1116       726.0     0.     907.5 FIXEDHF     0.800  0       0.0  0                       
 309    1j 4D1116       462.6     0.     578.2 FIXEDHF     0.800  0       0.0  0                       
 310    1k 1D2233     29315.8     0.   36644.7 FIXEDHF     0.800  0       0.0  0  4s2       -4p2       
 311    1l 1D2237      8280.9     0.   10351.1 FIXEDHF     0.800  0       0.0  0  4s2       -4p5p      
 312    1m 1D2237      4737.4     0.    5921.8 FIXEDHF     0.800  0       0.0  0  4s2       -4p6p      
 313    1n 1D2237      3207.4     0.    4009.2 FIXEDHF     0.800  0       0.0  0  4s2       -4p7p      
 314    1o 1D2237      2366.2     0.    2957.8 FIXEDHF     0.800  0       0.0  0  4s2       -4p8p      
 315    1p 1D2237      1841.8     0.    2302.3 FIXEDHF     0.800  0       0.0  0  4s2       -4p9p      
 316    23 0D2425       511.3     0.     639.1 FIXEDHF     0.800  0       0.0  0  4s5s      -4s6s      
 317    23 0E2425      1021.8     0.    1277.3 FIXEDHF     0.800  0       0.0  0                       
 318    24 0D2425       336.7     0.     420.9 FIXEDHF     0.800  0       0.0  0  4s5s      -4s7s      
 319    24 0E2425       672.6     0.     840.8 FIXEDHF     0.800  0       0.0  0                       
 320    25 0D2425       243.8     0.     304.8 FIXEDHF     0.800  0       0.0  0  4s5s      -4s8s      
 321    25 0E2425       487.0     0.     608.8 FIXEDHF     0.800  0       0.0  0                       
 322    26 0D2425       187.3     0.     234.1 FIXEDHF     0.800  0       0.0  0  4s5s      -4s9s      
 323    26 0E2425       374.1     0.     467.6 FIXEDHF     0.800  0       0.0  0                       
 324    27 0D2425       149.8     0.     187.3 FIXEDHF     0.800  0       0.0  0  4s5s      -4s10s     
 325    27 0E2425       299.2     0.     374.0 FIXEDHF     0.800  0       0.0  0                       
 326    28 0D2425       123.4     0.     154.3 FIXEDHF     0.800  0       0.0  0  4s5s      -4s11s     
 327    28 0E2425       246.4     0.     308.0 FIXEDHF     0.800  0       0.0  0                       
 328    29 0D2425       104.0     0.     130.0 FIXEDHF     0.800  0       0.0  0  4s5s      -4s12s     
 329    29 0E2425       207.6     0.     259.5 FIXEDHF     0.800  0       0.0  0                       
 330    2A 0D2425        89.2     0.     111.5 FIXEDHF     0.800  0       0.0  0  4s5s      -4s13s     
 331    2A 0E2425       178.1     0.     222.6 FIXEDHF     0.800  0       0.0  0                       
 332    2B 0D2425        77.6     0.      97.0 FIXEDHF     0.800  0       0.0  0  4s5s      -4s14s     
 333    2B 0E2425       155.0     0.     193.7 FIXEDHF     0.800  0       0.0  0                       
 334    2C 2D1112       679.4     0.     849.2 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 5s   
 335    2Y 2D1426       554.4     0.     693.0 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 4d   
 336    2Y 0E1426       834.4     0.    1043.0 FIXEDHF     0.800  0       0.0  0                       
 337    2Z 2D1426       276.7     0.     345.9 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 5d   
 338    2Z 0E1426       613.2     0.     766.5 FIXEDHF     0.800  0       0.0  0                       
 339    2a 2D1426       168.8     0.     211.0 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 6d   
 340    2a 0E1426       460.4     0.     575.5 FIXEDHF     0.800  0       0.0  0                       
 341    2b 2D1426       115.5     0.     144.4 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 7d   
 342    2b 0E1426       358.8     0.     448.5 FIXEDHF     0.800  0       0.0  0                       
 343    2c 2D1426        85.0     0.     106.3 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 8d   
 344    2c 0E1426       288.7     0.     360.9 FIXEDHF     0.800  0       0.0  0                       
 345    2d 2D1426        65.8     0.      82.3 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 9d   
 346    2d 0E1426       238.4     0.     298.0 FIXEDHF     0.800  0       0.0  0                       
 347    2e 2D1426        52.9     0.      66.1 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 10d  
 348    2e 0E1426       201.0     0.     251.2 FIXEDHF     0.800  0       0.0  0                       
 349    2f 2D1426        43.6     0.      54.5 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 11d  
 350    2f 0E1426       172.3     0.     215.4 FIXEDHF     0.800  0       0.0  0                       
 351    2g 2D1426        36.8     0.      46.0 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 12d  
 352    2g 0E1426       149.8     0.     187.3 FIXEDHF     0.800  0       0.0  0                       
 353    2h 2D1426        31.5     0.      39.4 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 13d  
 354    2h 0E1426       131.8     0.     164.7 FIXEDHF     0.800  0       0.0  0                       
 355    2i 2D1426        27.4     0.      34.3 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 14d  
 356    2i 0E1426       117.0     0.     146.3 FIXEDHF     0.800  0       0.0  0                       
 357    2j 2D1426        24.2     0.      30.2 FIXEDHF     0.800  0       0.0  0  4s5s      -d9s2 15d  
 358    2j 0E1426       104.9     0.     131.1 FIXEDHF     0.800  0       0.0  0                       
 359    2k 1D2433      -752.0     0.    -940.0 FIXEDHF     0.800  0       0.0  0  4s5s      -4p2       
 360    2l 1D2437      6787.7     0.    8484.6 FIXEDHF     0.800  0       0.0  0  4s5s      -4p5p      
 361    2l 1E2437      1008.6     0.    1260.7 FIXEDHF     0.800  0       0.0  0                       
 362    2m 1D2437      3500.6     0.    4375.8 FIXEDHF     0.800  0       0.0  0  4s5s      -4p6p      
 363    2m 1E2437       671.8     0.     839.8 FIXEDHF     0.800  0       0.0  0                       
 364    2n 1D2437      2309.8     0.    2887.2 FIXEDHF     0.800  0       0.0  0  4s5s      -4p7p      
 365    2n 1E2437       482.1     0.     602.6 FIXEDHF     0.800  0       0.0  0                       
 366    2o 1D2437      1684.9     0.    2106.1 FIXEDHF     0.800  0       0.0  0  4s5s      -4p8p      
 367    2o 1E2437       366.5     0.     458.1 FIXEDHF     0.800  0       0.0  0                       
 368    2p 1D2437      1303.3     0.    1629.1 FIXEDHF     0.800  0       0.0  0  4s5s      -4p9p      
 369    2p 1E2437       290.4     0.     363.0 FIXEDHF     0.800  0       0.0  0                       
 370    34 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s7s      
 371    34 0E2525       369.8     0.     462.3 FIXEDHF     0.800  0       0.0  0                       
 372    35 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s8s      
 373    35 0E2525       268.1     0.     335.1 FIXEDHF     0.800  0       0.0  0                       
 374    36 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s9s      
 375    36 0E2525       206.0     0.     257.5 FIXEDHF     0.800  0       0.0  0                       
 376    37 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s10s     
 377    37 0E2525       164.8     0.     206.0 FIXEDHF     0.800  0       0.0  0                       
 378    38 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s11s     
 379    38 0E2525       135.8     0.     169.7 FIXEDHF     0.800  0       0.0  0                       
 380    39 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s12s     
 381    39 0E2525       114.4     0.     143.0 FIXEDHF     0.800  0       0.0  0                       
 382    3A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s13s     
 383    3A 0E2525        98.2     0.     122.7 FIXEDHF     0.800  0       0.0  0                       
 384    3B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4s14s     
 385    3B 0E2525        85.4     0.     106.7 FIXEDHF     0.800  0       0.0  0                       
 386    3D 2D1112       697.0     0.     871.2 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 6s   
 387    3E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 7s   
 388    3F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 8s   
 389    3G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 9s   
 390    3H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 10s  
 391    3I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 11s  
 392    3J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 12s  
 393    3K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 13s  
 394    3L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 14s  
 395    3Y 2D1526       206.1     0.     257.6 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 4d   
 396    3Y 0E1526       461.4     0.     576.7 FIXEDHF     0.800  0       0.0  0                       
 397    3Z 2D1526       182.9     0.     228.6 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 5d   
 398    3Z 0E1526       339.3     0.     424.1 FIXEDHF     0.800  0       0.0  0                       
 399    3a 2D1526       122.4     0.     153.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 6d   
 400    3a 0E1526       254.8     0.     318.5 FIXEDHF     0.800  0       0.0  0                       
 401    3b 2D1526        88.1     0.     110.1 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 7d   
 402    3b 0E1526       198.6     0.     248.2 FIXEDHF     0.800  0       0.0  0                       
 403    3c 2D1526        67.1     0.      83.9 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 8d   
 404    3c 0E1526       159.8     0.     199.8 FIXEDHF     0.800  0       0.0  0                       
 405    3d 2D1526        53.3     0.      66.6 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 9d   
 406    3d 0E1526       132.0     0.     165.0 FIXEDHF     0.800  0       0.0  0                       
 407    3e 2D1526        43.6     0.      54.5 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 10d  
 408    3e 0E1526       111.3     0.     139.1 FIXEDHF     0.800  0       0.0  0                       
 409    3f 2D1526        36.5     0.      45.6 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 11d  
 410    3f 0E1526        95.4     0.     119.3 FIXEDHF     0.800  0       0.0  0                       
 411    3g 2D1526        31.2     0.      39.0 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 12d  
 412    3g 0E1526        83.0     0.     103.7 FIXEDHF     0.800  0       0.0  0                       
 413    3h 2D1526        27.0     0.      33.8 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 13d  
 414    3h 0E1526        73.0     0.      91.2 FIXEDHF     0.800  0       0.0  0                       
 415    3i 2D1526        23.7     0.      29.6 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 14d  
 416    3i 0E1526        64.8     0.      81.0 FIXEDHF     0.800  0       0.0  0                       
 417    3j 2D1526        21.0     0.      26.3 FIXEDHF     0.800  0       0.0  0  4s6s      -d9s2 15d  
 418    3j 0E1526        58.1     0.      72.6 FIXEDHF     0.800  0       0.0  0                       
 419    3k 1D2533      -401.6     0.    -502.0 FIXEDHF     0.800  0       0.0  0  4s6s      -4p2       
 420    3l 1D2537      1118.8     0.    1398.5 FIXEDHF     0.800  0       0.0  0  4s6s      -4p5p      
 421    3l 1E2537       481.0     0.     601.2 FIXEDHF     0.800  0       0.0  0                       
 422    3m 1D2537      2359.4     0.    2949.2 FIXEDHF     0.800  0       0.0  0  4s6s      -4p6p      
 423    3m 1E2537       327.1     0.     408.9 FIXEDHF     0.800  0       0.0  0                       
 424    3n 1D2537      1507.1     0.    1883.9 FIXEDHF     0.800  0       0.0  0  4s6s      -4p7p      
 425    3n 1E2537       236.7     0.     295.9 FIXEDHF     0.800  0       0.0  0                       
 426    3o 1D2537      1094.2     0.    1367.7 FIXEDHF     0.800  0       0.0  0  4s6s      -4p8p      
 427    3o 1E2537       180.7     0.     225.9 FIXEDHF     0.800  0       0.0  0                       
 428    3p 1D2537       845.5     0.    1056.9 FIXEDHF     0.800  0       0.0  0  4s6s      -4p9p      
 429    3p 1E2537       143.5     0.     179.4 FIXEDHF     0.800  0       0.0  0                       
 430    45 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s8s      
 431    45 0E2525       177.0     0.     221.2 FIXEDHF     0.800  0       0.0  0                       
 432    46 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s9s      
 433    46 0E2525       136.0     0.     170.0 FIXEDHF     0.800  0       0.0  0                       
 434    47 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s10s     
 435    47 0E2525       108.8     0.     136.0 FIXEDHF     0.800  0       0.0  0                       
 436    48 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s11s     
 437    48 0E2525        89.7     0.     112.1 FIXEDHF     0.800  0       0.0  0                       
 438    49 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s12s     
 439    49 0E2525        75.5     0.      94.4 FIXEDHF     0.800  0       0.0  0                       
 440    4A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s13s     
 441    4A 0E2525        64.8     0.      81.0 FIXEDHF     0.800  0       0.0  0                       
 442    4B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -4s14s     
 443    4B 0E2525        56.4     0.      70.5 FIXEDHF     0.800  0       0.0  0                       
 444    4D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 6s   
 445    4E 2D1112       701.8     0.     877.3 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 7s   
 446    4F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 8s   
 447    4G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 9s   
 448    4H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 10s  
 449    4I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 11s  
 450    4J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 12s  
 451    4K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 13s  
 452    4L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 14s  
 453    4Y 2D1526       129.9     0.     162.4 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 4d   
 454    4Y 0E1526       305.8     0.     382.3 FIXEDHF     0.800  0       0.0  0                       
 455    4Z 2D1526        99.6     0.     124.5 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 5d   
 456    4Z 0E1526       225.0     0.     281.2 FIXEDHF     0.800  0       0.0  0                       
 457    4a 2D1526        82.6     0.     103.2 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 6d   
 458    4a 0E1526       169.0     0.     211.2 FIXEDHF     0.800  0       0.0  0                       
 459    4b 2D1526        61.5     0.      76.9 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 7d   
 460    4b 0E1526       131.7     0.     164.6 FIXEDHF     0.800  0       0.0  0                       
 461    4c 2D1526        47.8     0.      59.7 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 8d   
 462    4c 0E1526       106.0     0.     132.5 FIXEDHF     0.800  0       0.0  0                       
 463    4d 2D1526        38.3     0.      47.9 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 9d   
 464    4d 0E1526        87.5     0.     109.4 FIXEDHF     0.800  0       0.0  0                       
 465    4e 2D1526        31.6     0.      39.5 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 10d  
 466    4e 0E1526        73.8     0.      92.3 FIXEDHF     0.800  0       0.0  0                       
 467    4f 2D1526        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 11d  
 468    4f 0E1526        63.3     0.      79.1 FIXEDHF     0.800  0       0.0  0                       
 469    4g 2D1526        22.8     0.      28.5 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 12d  
 470    4g 0E1526        55.0     0.      68.8 FIXEDHF     0.800  0       0.0  0                       
 471    4h 2D1526        19.8     0.      24.8 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 13d  
 472    4h 0E1526        48.4     0.      60.5 FIXEDHF     0.800  0       0.0  0                       
 473    4i 2D1526        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 14d  
 474    4i 0E1526        43.0     0.      53.8 FIXEDHF     0.800  0       0.0  0                       
 475    4j 2D1526        15.5     0.      19.4 FIXEDHF     0.800  0       0.0  0  4s7s      -d9s2 15d  
 476    4j 0E1526        38.6     0.      48.2 FIXEDHF     0.800  0       0.0  0                       
 477    4k 1D2533      -271.7     0.    -339.6 FIXEDHF     0.800  0       0.0  0  4s7s      -4p2       
 478    4l 1D2537       627.5     0.     784.4 FIXEDHF     0.800  0       0.0  0  4s7s      -4p5p      
 479    4l 1E2537       300.4     0.     375.5 FIXEDHF     0.800  0       0.0  0                       
 480    4m 1D2537       668.2     0.     835.3 FIXEDHF     0.800  0       0.0  0  4s7s      -4p6p      
 481    4m 1E2537       206.1     0.     257.6 FIXEDHF     0.800  0       0.0  0                       
 482    4n 1D2537      1077.9     0.    1347.4 FIXEDHF     0.800  0       0.0  0  4s7s      -4p7p      
 483    4n 1E2537       149.6     0.     187.0 FIXEDHF     0.800  0       0.0  0                       
 484    4o 1D2537       767.8     0.     959.7 FIXEDHF     0.800  0       0.0  0  4s7s      -4p8p      
 485    4o 1E2537       114.4     0.     143.0 FIXEDHF     0.800  0       0.0  0                       
 486    4p 1D2537       592.2     0.     740.2 FIXEDHF     0.800  0       0.0  0  4s7s      -4p9p      
 487    4p 1E2537        91.0     0.     113.7 FIXEDHF     0.800  0       0.0  0                       
 488    56 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s9s      
 489    56 0E2525        98.6     0.     123.3 FIXEDHF     0.800  0       0.0  0                       
 490    57 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s10s     
 491    57 0E2525        79.0     0.      98.7 FIXEDHF     0.800  0       0.0  0                       
 492    58 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s11s     
 493    58 0E2525        65.0     0.      81.3 FIXEDHF     0.800  0       0.0  0                       
 494    59 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s12s     
 495    59 0E2525        54.8     0.      68.5 FIXEDHF     0.800  0       0.0  0                       
 496    5A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s13s     
 497    5A 0E2525        47.0     0.      58.8 FIXEDHF     0.800  0       0.0  0                       
 498    5B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4s14s     
 499    5B 0E2525        40.9     0.      51.1 FIXEDHF     0.800  0       0.0  0                       
 500    5D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 6s   
 501    5E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 7s   
 502    5F 2D1112       703.7     0.     879.6 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 8s   
 503    5G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 9s   
 504    5H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 10s  
 505    5I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 11s  
 506    5J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 12s  
 507    5K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 13s  
 508    5L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 14s  
 509    5Y 2D1526        92.4     0.     115.5 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 4d   
 510    5Y 0E1526       222.4     0.     278.0 FIXEDHF     0.800  0       0.0  0                       
 511    5Z 2D1526        70.0     0.      87.5 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 5d   
 512    5Z 0E1526       163.6     0.     204.5 FIXEDHF     0.800  0       0.0  0                       
 513    5a 2D1526        53.7     0.      67.1 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 6d   
 514    5a 0E1526       122.9     0.     153.6 FIXEDHF     0.800  0       0.0  0                       
 515    5b 2D1526        44.3     0.      55.4 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 7d   
 516    5b 0E1526        95.8     0.     119.7 FIXEDHF     0.800  0       0.0  0                       
 517    5c 2D1526        35.0     0.      43.8 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 8d   
 518    5c 0E1526        77.1     0.      96.4 FIXEDHF     0.800  0       0.0  0                       
 519    5d 2D1526        28.3     0.      35.4 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 9d   
 520    5d 0E1526        63.7     0.      79.6 FIXEDHF     0.800  0       0.0  0                       
 521    5e 2D1526        23.5     0.      29.4 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 10d  
 522    5e 0E1526        53.7     0.      67.1 FIXEDHF     0.800  0       0.0  0                       
 523    5f 2D1526        19.9     0.      24.9 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 11d  
 524    5f 0E1526        46.0     0.      57.5 FIXEDHF     0.800  0       0.0  0                       
 525    5g 2D1526        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 12d  
 526    5g 0E1526        40.0     0.      50.0 FIXEDHF     0.800  0       0.0  0                       
 527    5h 2D1526        14.9     0.      18.6 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 13d  
 528    5h 0E1526        35.2     0.      44.0 FIXEDHF     0.800  0       0.0  0                       
 529    5i 2D1526        13.1     0.      16.4 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 14d  
 530    5i 0E1526        31.3     0.      39.1 FIXEDHF     0.800  0       0.0  0                       
 531    5j 2D1526        11.7     0.      14.6 FIXEDHF     0.800  0       0.0  0  4s8s      -d9s2 15d  
 532    5j 0E1526        28.0     0.      35.0 FIXEDHF     0.800  0       0.0  0                       
 533    5k 1D2533      -200.1     0.    -250.1 FIXEDHF     0.800  0       0.0  0  4s8s      -4p2       
 534    5l 1D2537       418.6     0.     523.2 FIXEDHF     0.800  0       0.0  0  4s8s      -4p5p      
 535    5l 1E2537       211.8     0.     264.8 FIXEDHF     0.800  0       0.0  0                       
 536    5m 1D2537       430.1     0.     537.6 FIXEDHF     0.800  0       0.0  0  4s8s      -4p6p      
 537    5m 1E2537       145.9     0.     182.4 FIXEDHF     0.800  0       0.0  0                       
 538    5n 1D2537       405.0     0.     506.2 FIXEDHF     0.800  0       0.0  0  4s8s      -4p7p      
 539    5n 1E2537       106.2     0.     132.7 FIXEDHF     0.800  0       0.0  0                       
 540    5o 1D2537       578.4     0.     723.0 FIXEDHF     0.800  0       0.0  0  4s8s      -4p8p      
 541    5o 1E2537        81.2     0.     101.5 FIXEDHF     0.800  0       0.0  0                       
 542    5p 1D2537       440.2     0.     550.3 FIXEDHF     0.800  0       0.0  0  4s8s      -4p9p      
 543    5p 1E2537        64.6     0.      80.8 FIXEDHF     0.800  0       0.0  0                       
 544    67 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -4s10s     
 545    67 0E2525        60.6     0.      75.8 FIXEDHF     0.800  0       0.0  0                       
 546    68 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -4s11s     
 547    68 0E2525        50.0     0.      62.5 FIXEDHF     0.800  0       0.0  0                       
 548    69 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -4s12s     
 549    69 0E2525        42.2     0.      52.7 FIXEDHF     0.800  0       0.0  0                       
 550    6A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -4s13s     
 551    6A 0E2525        36.2     0.      45.2 FIXEDHF     0.800  0       0.0  0                       
 552    6B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -4s14s     
 553    6B 0E2525        31.4     0.      39.3 FIXEDHF     0.800  0       0.0  0                       
 554    6D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 6s   
 555    6E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 7s   
 556    6F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 8s   
 557    6G 2D1112       704.6     0.     880.8 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 9s   
 558    6H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 10s  
 559    6I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 11s  
 560    6J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 12s  
 561    6K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 13s  
 562    6L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 14s  
 563    6Y 2D1526        70.3     0.      87.9 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 4d   
 564    6Y 0E1526       171.2     0.     214.0 FIXEDHF     0.800  0       0.0  0                       
 565    6Z 2D1526        53.0     0.      66.3 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 5d   
 566    6Z 0E1526       126.0     0.     157.5 FIXEDHF     0.800  0       0.0  0                       
 567    6a 2D1526        40.3     0.      50.4 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 6d   
 568    6a 0E1526        94.6     0.     118.3 FIXEDHF     0.800  0       0.0  0                       
 569    6b 2D1526        31.8     0.      39.8 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 7d   
 570    6b 0E1526        73.8     0.      92.2 FIXEDHF     0.800  0       0.0  0                       
 571    6c 2D1526        26.6     0.      33.2 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 8d   
 572    6c 0E1526        59.4     0.      74.2 FIXEDHF     0.800  0       0.0  0                       
 573    6d 2D1526        21.8     0.      27.2 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 9d   
 574    6d 0E1526        49.0     0.      61.3 FIXEDHF     0.800  0       0.0  0                       
 575    6e 2D1526        18.2     0.      22.7 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 10d  
 576    6e 0E1526        41.4     0.      51.7 FIXEDHF     0.800  0       0.0  0                       
 577    6f 2D1526        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 11d  
 578    6f 0E1526        35.4     0.      44.3 FIXEDHF     0.800  0       0.0  0                       
 579    6g 2D1526        13.3     0.      16.6 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 12d  
 580    6g 0E1526        30.8     0.      38.5 FIXEDHF     0.800  0       0.0  0                       
 581    6h 2D1526        11.6     0.      14.5 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 13d  
 582    6h 0E1526        27.1     0.      33.9 FIXEDHF     0.800  0       0.0  0                       
 583    6i 2D1526        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 14d  
 584    6i 0E1526        24.1     0.      30.1 FIXEDHF     0.800  0       0.0  0                       
 585    6j 2D1526         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0  4s9s      -d9s2 15d  
 586    6j 0E1526        21.6     0.      27.0 FIXEDHF     0.800  0       0.0  0                       
 587    6k 1D2533      -155.3     0.    -194.1 FIXEDHF     0.800  0       0.0  0  4s9s      -4p2       
 588    6l 1D2537       306.2     0.     382.7 FIXEDHF     0.800  0       0.0  0  4s9s      -4p5p      
 589    6l 1E2537       160.2     0.     200.3 FIXEDHF     0.800  0       0.0  0                       
 590    6m 1D2537       309.7     0.     387.1 FIXEDHF     0.800  0       0.0  0  4s9s      -4p6p      
 591    6m 1E2537       110.7     0.     138.4 FIXEDHF     0.800  0       0.0  0                       
 592    6n 1D2537       283.0     0.     353.8 FIXEDHF     0.800  0       0.0  0  4s9s      -4p7p      
 593    6n 1E2537        80.6     0.     100.7 FIXEDHF     0.800  0       0.0  0                       
 594    6o 1D2537       259.5     0.     324.4 FIXEDHF     0.800  0       0.0  0  4s9s      -4p8p      
 595    6o 1E2537        61.7     0.      77.1 FIXEDHF     0.800  0       0.0  0                       
 596    6p 1D2537       345.2     0.     431.5 FIXEDHF     0.800  0       0.0  0  4s9s      -4p9p      
 597    6p 1E2537        49.1     0.      61.4 FIXEDHF     0.800  0       0.0  0                       
 598    78 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -4s11s     
 599    78 0E2525        40.0     0.      50.0 FIXEDHF     0.800  0       0.0  0                       
 600    79 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -4s12s     
 601    79 0E2525        33.7     0.      42.1 FIXEDHF     0.800  0       0.0  0                       
 602    7A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -4s13s     
 603    7A 0E2525        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0                       
 604    7B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -4s14s     
 605    7B 0E2525        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0                       
 606    7D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 6s   
 607    7E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 7s   
 608    7F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 8s   
 609    7G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 9s   
 610    7H 2D1112       705.0     0.     881.3 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 10s  
 611    7I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 11s  
 612    7J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 12s  
 613    7K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 13s  
 614    7L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 14s  
 615    7Y 2D1526        55.9     0.      69.9 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 4d   
 616    7Y 0E1526       137.1     0.     171.4 FIXEDHF     0.800  0       0.0  0                       
 617    7Z 2D1526        42.1     0.      52.6 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 5d   
 618    7Z 0E1526       101.0     0.     126.2 FIXEDHF     0.800  0       0.0  0                       
 619    7a 2D1526        31.9     0.      39.9 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 6d   
 620    7a 0E1526        75.8     0.      94.8 FIXEDHF     0.800  0       0.0  0                       
 621    7b 2D1526        25.0     0.      31.3 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 7d   
 622    7b 0E1526        59.1     0.      73.9 FIXEDHF     0.800  0       0.0  0                       
 623    7c 2D1526        20.3     0.      25.4 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 8d   
 624    7c 0E1526        47.6     0.      59.5 FIXEDHF     0.800  0       0.0  0                       
 625    7d 2D1526        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 9d   
 626    7d 0E1526        39.3     0.      49.1 FIXEDHF     0.800  0       0.0  0                       
 627    7e 2D1526        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 10d  
 628    7e 0E1526        33.1     0.      41.4 FIXEDHF     0.800  0       0.0  0                       
 629    7f 2D1526        12.3     0.      15.4 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 11d  
 630    7f 0E1526        28.4     0.      35.5 FIXEDHF     0.800  0       0.0  0                       
 631    7g 2D1526        10.6     0.      13.3 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 12d  
 632    7g 0E1526        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0                       
 633    7h 2D1526         9.3     0.      11.6 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 13d  
 634    7h 0E1526        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
 635    7i 2D1526         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 14d  
 636    7i 0E1526        19.3     0.      24.1 FIXEDHF     0.800  0       0.0  0                       
 637    7j 2D1526         7.4     0.       9.2 FIXEDHF     0.800  0       0.0  0  4s10s     -d9s2 15d  
 638    7j 0E1526        17.3     0.      21.6 FIXEDHF     0.800  0       0.0  0                       
 639    7k 1D2533      -124.8     0.    -156.0 FIXEDHF     0.800  0       0.0  0  4s10s     -4p2       
 640    7l 1D2537       237.0     0.     296.2 FIXEDHF     0.800  0       0.0  0  4s10s     -4p5p      
 641    7l 1E2537       126.9     0.     158.6 FIXEDHF     0.800  0       0.0  0                       
 642    7m 1D2537       237.9     0.     297.4 FIXEDHF     0.800  0       0.0  0  4s10s     -4p6p      
 643    7m 1E2537        87.8     0.     109.8 FIXEDHF     0.800  0       0.0  0                       
 644    7n 1D2537       214.4     0.     268.0 FIXEDHF     0.800  0       0.0  0  4s10s     -4p7p      
 645    7n 1E2537        63.9     0.      79.9 FIXEDHF     0.800  0       0.0  0                       
 646    7o 1D2537       191.8     0.     239.8 FIXEDHF     0.800  0       0.0  0  4s10s     -4p8p      
 647    7o 1E2537        49.0     0.      61.2 FIXEDHF     0.800  0       0.0  0                       
 648    7p 1D2537       175.1     0.     218.9 FIXEDHF     0.800  0       0.0  0  4s10s     -4p9p      
 649    7p 1E2537        39.0     0.      48.8 FIXEDHF     0.800  0       0.0  0                       
 650    89 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -4s12s     
 651    89 0E2525        27.8     0.      34.7 FIXEDHF     0.800  0       0.0  0                       
 652    8A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -4s13s     
 653    8A 0E2525        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0                       
 654    8B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -4s14s     
 655    8B 0E2525        20.7     0.      25.9 FIXEDHF     0.800  0       0.0  0                       
 656    8D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 6s   
 657    8E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 7s   
 658    8F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 8s   
 659    8G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 9s   
 660    8H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 10s  
 661    8I 2D1112       705.4     0.     881.7 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 11s  
 662    8J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 12s  
 663    8K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 13s  
 664    8L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 14s  
 665    8Y 2D1526        45.8     0.      57.3 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 4d   
 666    8Y 0E1526       113.1     0.     141.4 FIXEDHF     0.800  0       0.0  0                       
 667    8Z 2D1526        34.5     0.      43.1 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 5d   
 668    8Z 0E1526        83.2     0.     104.0 FIXEDHF     0.800  0       0.0  0                       
 669    8a 2D1526        26.1     0.      32.6 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 6d   
 670    8a 0E1526        62.6     0.      78.2 FIXEDHF     0.800  0       0.0  0                       
 671    8b 2D1526        20.5     0.      25.6 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 7d   
 672    8b 0E1526        48.7     0.      60.9 FIXEDHF     0.800  0       0.0  0                       
 673    8c 2D1526        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 8d   
 674    8c 0E1526        39.2     0.      49.0 FIXEDHF     0.800  0       0.0  0                       
 675    8d 2D1526        13.8     0.      17.2 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 9d   
 676    8d 0E1526        32.4     0.      40.5 FIXEDHF     0.800  0       0.0  0                       
 677    8e 2D1526        11.8     0.      14.7 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 10d  
 678    8e 0E1526        27.3     0.      34.1 FIXEDHF     0.800  0       0.0  0                       
 679    8f 2D1526        10.1     0.      12.6 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 11d  
 680    8f 0E1526        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0                       
 681    8g 2D1526         8.7     0.      10.9 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 12d  
 682    8g 0E1526        20.4     0.      25.5 FIXEDHF     0.800  0       0.0  0                       
 683    8h 2D1526         7.7     0.       9.6 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 13d  
 684    8h 0E1526        17.9     0.      22.4 FIXEDHF     0.800  0       0.0  0                       
 685    8i 2D1526         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 14d  
 686    8i 0E1526        15.9     0.      19.9 FIXEDHF     0.800  0       0.0  0                       
 687    8j 2D1526         6.1     0.       7.6 FIXEDHF     0.800  0       0.0  0  4s11s     -d9s2 15d  
 688    8j 0E1526        14.2     0.      17.8 FIXEDHF     0.800  0       0.0  0                       
 689    8k 1D2533      -103.1     0.    -128.9 FIXEDHF     0.800  0       0.0  0  4s11s     -4p2       
 690    8l 1D2537       190.7     0.     238.4 FIXEDHF     0.800  0       0.0  0  4s11s     -4p5p      
 691    8l 1E2537       103.8     0.     129.8 FIXEDHF     0.800  0       0.0  0                       
 692    8m 1D2537       190.6     0.     238.3 FIXEDHF     0.800  0       0.0  0  4s11s     -4p6p      
 693    8m 1E2537        71.9     0.      89.9 FIXEDHF     0.800  0       0.0  0                       
 694    8n 1D2537       170.5     0.     213.1 FIXEDHF     0.800  0       0.0  0  4s11s     -4p7p      
 695    8n 1E2537        52.4     0.      65.5 FIXEDHF     0.800  0       0.0  0                       
 696    8o 1D2537       150.7     0.     188.4 FIXEDHF     0.800  0       0.0  0  4s11s     -4p8p      
 697    8o 1E2537        40.2     0.      50.2 FIXEDHF     0.800  0       0.0  0                       
 698    8p 1D2537       134.8     0.     168.5 FIXEDHF     0.800  0       0.0  0  4s11s     -4p9p      
 699    8p 1E2537        32.0     0.      40.0 FIXEDHF     0.800  0       0.0  0                       
 700    9A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -4s13s     
 701    9A 0E2525        20.1     0.      25.1 FIXEDHF     0.800  0       0.0  0                       
 702    9B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -4s14s     
 703    9B 0E2525        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0                       
 704    9D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 6s   
 705    9E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 7s   
 706    9F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 8s   
 707    9G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 9s   
 708    9H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 10s  
 709    9I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 11s  
 710    9J 2D1112       705.5     0.     881.9 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 12s  
 711    9K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 13s  
 712    9L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 14s  
 713    9Y 2D1526        38.5     0.      48.1 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 4d   
 714    9Y 0E1526        95.4     0.     119.2 FIXEDHF     0.800  0       0.0  0                       
 715    9Z 2D1526        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 5d   
 716    9Z 0E1526        70.2     0.      87.7 FIXEDHF     0.800  0       0.0  0                       
 717    9a 2D1526        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 6d   
 718    9a 0E1526        52.7     0.      65.9 FIXEDHF     0.800  0       0.0  0                       
 719    9b 2D1526        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 7d   
 720    9b 0E1526        41.1     0.      51.4 FIXEDHF     0.800  0       0.0  0                       
 721    9c 2D1526        13.8     0.      17.3 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 8d   
 722    9c 0E1526        33.0     0.      41.3 FIXEDHF     0.800  0       0.0  0                       
 723    9d 2D1526        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 9d   
 724    9d 0E1526        27.4     0.      34.2 FIXEDHF     0.800  0       0.0  0                       
 725    9e 2D1526         9.7     0.      12.1 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 10d  
 726    9e 0E1526        23.0     0.      28.8 FIXEDHF     0.800  0       0.0  0                       
 727    9f 2D1526         8.4     0.      10.5 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 11d  
 728    9f 0E1526        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0                       
 729    9g 2D1526         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 12d  
 730    9g 0E1526        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0                       
 731    9h 2D1526         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 13d  
 732    9h 0E1526        15.1     0.      18.9 FIXEDHF     0.800  0       0.0  0                       
 733    9i 2D1526         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 14d  
 734    9i 0E1526        13.4     0.      16.8 FIXEDHF     0.800  0       0.0  0                       
 735    9j 2D1526         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0  4s12s     -d9s2 15d  
 736    9j 0E1526        12.0     0.      15.0 FIXEDHF     0.800  0       0.0  0                       
 737    9k 1D2533       -87.0     0.    -108.7 FIXEDHF     0.800  0       0.0  0  4s12s     -4p2       
 738    9l 1D2537       157.8     0.     197.3 FIXEDHF     0.800  0       0.0  0  4s12s     -4p5p      
 739    9l 1E2537        87.0     0.     108.8 FIXEDHF     0.800  0       0.0  0                       
 740    9m 1D2537       157.4     0.     196.8 FIXEDHF     0.800  0       0.0  0  4s12s     -4p6p      
 741    9m 1E2537        60.4     0.      75.5 FIXEDHF     0.800  0       0.0  0                       
 742    9n 1D2537       140.2     0.     175.2 FIXEDHF     0.800  0       0.0  0  4s12s     -4p7p      
 743    9n 1E2537        44.0     0.      55.0 FIXEDHF     0.800  0       0.0  0                       
 744    9o 1D2537       123.1     0.     153.9 FIXEDHF     0.800  0       0.0  0  4s12s     -4p8p      
 745    9o 1E2537        33.8     0.      42.2 FIXEDHF     0.800  0       0.0  0                       
 746    9p 1D2537       109.0     0.     136.2 FIXEDHF     0.800  0       0.0  0  4s12s     -4p9p      
 747    9p 1E2537        26.9     0.      33.6 FIXEDHF     0.800  0       0.0  0                       
 748    AB 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -4s14s     
 749    AB 0E2525        15.0     0.      18.7 FIXEDHF     0.800  0       0.0  0                       
 750    AD 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 6s   
 751    AE 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 7s   
 752    AF 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 8s   
 753    AG 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 9s   
 754    AH 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 10s  
 755    AI 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 11s  
 756    AJ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 12s  
 757    AK 2D1112       705.6     0.     882.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 13s  
 758    AL 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 14s  
 759    AY 2D1526        33.0     0.      41.2 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 4d   
 760    AY 0E1526        81.8     0.     102.3 FIXEDHF     0.800  0       0.0  0                       
 761    AZ 2D1526        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 5d   
 762    AZ 0E1526        60.2     0.      75.3 FIXEDHF     0.800  0       0.0  0                       
 763    Aa 2D1526        18.7     0.      23.4 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 6d   
 764    Aa 0E1526        45.3     0.      56.6 FIXEDHF     0.800  0       0.0  0                       
 765    Ab 2D1526        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 7d   
 766    Ab 0E1526        35.3     0.      44.1 FIXEDHF     0.800  0       0.0  0                       
 767    Ac 2D1526        11.8     0.      14.8 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 8d   
 768    Ac 0E1526        28.4     0.      35.5 FIXEDHF     0.800  0       0.0  0                       
 769    Ad 2D1526         9.8     0.      12.2 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 9d   
 770    Ad 0E1526        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0                       
 771    Ae 2D1526         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 10d  
 772    Ae 0E1526        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0                       
 773    Af 2D1526         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 11d  
 774    Af 0E1526        17.0     0.      21.2 FIXEDHF     0.800  0       0.0  0                       
 775    Ag 2D1526         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 12d  
 776    Ag 0E1526        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0                       
 777    Ah 2D1526         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 13d  
 778    Ah 0E1526        13.0     0.      16.2 FIXEDHF     0.800  0       0.0  0                       
 779    Ai 2D1526         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 14d  
 780    Ai 0E1526        11.5     0.      14.4 FIXEDHF     0.800  0       0.0  0                       
 781    Aj 2D1526         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0  4s13s     -d9s2 15d  
 782    Aj 0E1526        10.3     0.      12.9 FIXEDHF     0.800  0       0.0  0                       
 783    Ak 1D2533       -74.6     0.     -93.2 FIXEDHF     0.800  0       0.0  0  4s13s     -4p2       
 784    Al 1D2537       133.5     0.     166.9 FIXEDHF     0.800  0       0.0  0  4s13s     -4p5p      
 785    Al 1E2537        74.4     0.      93.0 FIXEDHF     0.800  0       0.0  0                       
 786    Am 1D2537       132.9     0.     166.1 FIXEDHF     0.800  0       0.0  0  4s13s     -4p6p      
 787    Am 1E2537        51.6     0.      64.5 FIXEDHF     0.800  0       0.0  0                       
 788    An 1D2537       118.0     0.     147.5 FIXEDHF     0.800  0       0.0  0  4s13s     -4p7p      
 789    An 1E2537        37.6     0.      47.0 FIXEDHF     0.800  0       0.0  0                       
 790    Ao 1D2537       103.2     0.     129.0 FIXEDHF     0.800  0       0.0  0  4s13s     -4p8p      
 791    Ao 1E2537        28.8     0.      36.0 FIXEDHF     0.800  0       0.0  0                       
 792    Ap 1D2537        90.8     0.     113.5 FIXEDHF     0.800  0       0.0  0  4s13s     -4p9p      
 793    Ap 1E2537        23.0     0.      28.7 FIXEDHF     0.800  0       0.0  0                       
 794    BD 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 6s   
 795    BE 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 7s   
 796    BF 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 8s   
 797    BG 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 9s   
 798    BH 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 10s  
 799    BI 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 11s  
 800    BJ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 12s  
 801    BK 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 13s  
 802    BL 2D1112       705.7     0.     882.1 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 14s  
 803    BY 2D1526        28.6     0.      35.7 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 4d   
 804    BY 0E1526        71.3     0.      89.1 FIXEDHF     0.800  0       0.0  0                       
 805    BZ 2D1526        21.4     0.      26.8 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 5d   
 806    BZ 0E1526        52.5     0.      65.6 FIXEDHF     0.800  0       0.0  0                       
 807    Ba 2D1526        16.2     0.      20.3 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 6d   
 808    Ba 0E1526        39.4     0.      49.2 FIXEDHF     0.800  0       0.0  0                       
 809    Bb 2D1526        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 7d   
 810    Bb 0E1526        30.7     0.      38.4 FIXEDHF     0.800  0       0.0  0                       
 811    Bc 2D1526        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 8d   
 812    Bc 0E1526        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0                       
 813    Bd 2D1526         8.5     0.      10.6 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 9d   
 814    Bd 0E1526        20.4     0.      25.5 FIXEDHF     0.800  0       0.0  0                       
 815    Be 2D1526         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 10d  
 816    Be 0E1526        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0                       
 817    Bf 2D1526         6.2     0.       7.7 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 11d  
 818    Bf 0E1526        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0                       
 819    Bg 2D1526         5.4     0.       6.7 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 12d  
 820    Bg 0E1526        12.8     0.      16.0 FIXEDHF     0.800  0       0.0  0                       
 821    Bh 2D1526         4.7     0.       5.9 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 13d  
 822    Bh 0E1526        11.3     0.      14.1 FIXEDHF     0.800  0       0.0  0                       
 823    Bi 2D1526         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 14d  
 824    Bi 0E1526        10.0     0.      12.5 FIXEDHF     0.800  0       0.0  0                       
 825    Bj 2D1526         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0  4s14s     -d9s2 15d  
 826    Bj 0E1526         9.0     0.      11.2 FIXEDHF     0.800  0       0.0  0                       
 827    Bk 1D2533       -64.9     0.     -81.1 FIXEDHF     0.800  0       0.0  0  4s14s     -4p2       
 828    Bl 1D2537       114.8     0.     143.5 FIXEDHF     0.800  0       0.0  0  4s14s     -4p5p      
 829    Bl 1E2537        64.6     0.      80.7 FIXEDHF     0.800  0       0.0  0                       
 830    Bm 1D2537       114.2     0.     142.8 FIXEDHF     0.800  0       0.0  0  4s14s     -4p6p      
 831    Bm 1E2537        44.8     0.      56.0 FIXEDHF     0.800  0       0.0  0                       
 832    Bn 1D2537       101.2     0.     126.5 FIXEDHF     0.800  0       0.0  0  4s14s     -4p7p      
 833    Bn 1E2537        32.6     0.      40.8 FIXEDHF     0.800  0       0.0  0                       
 834    Bo 1D2537        88.2     0.     110.3 FIXEDHF     0.800  0       0.0  0  4s14s     -4p8p      
 835    Bo 1E2537        25.0     0.      31.3 FIXEDHF     0.800  0       0.0  0                       
 836    Bp 1D2537        77.4     0.      96.8 FIXEDHF     0.800  0       0.0  0  4s14s     -4p9p      
 837    Bp 1E2537        19.9     0.      24.9 FIXEDHF     0.800  0       0.0  0                       
 838    CD 0D1415        36.5     0.      45.6 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 6s   
 839    CD 2E1415       364.6     0.     455.8 FIXEDHF     0.800  0       0.0  0                       
 840    CE 0D1415        24.4     0.      30.5 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 7s   
 841    CE 2E1415       244.3     0.     305.4 FIXEDHF     0.800  0       0.0  0                       
 842    CF 0D1415        17.8     0.      22.3 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 8s   
 843    CF 2E1415       178.3     0.     222.9 FIXEDHF     0.800  0       0.0  0                       
 844    CG 0D1415        13.8     0.      17.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 9s   
 845    CG 2E1415       137.5     0.     171.9 FIXEDHF     0.800  0       0.0  0                       
 846    CH 0D1415        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 10s  
 847    CH 2E1415       110.2     0.     137.7 FIXEDHF     0.800  0       0.0  0                       
 848    CI 0D1415         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 11s  
 849    CI 2E1415        90.9     0.     113.6 FIXEDHF     0.800  0       0.0  0                       
 850    CJ 0D1415         7.7     0.       9.6 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 12s  
 851    CJ 2E1415        76.6     0.      95.8 FIXEDHF     0.800  0       0.0  0                       
 852    CK 0D1415         6.6     0.       8.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 13s  
 853    CK 2E1415        65.7     0.      82.1 FIXEDHF     0.800  0       0.0  0                       
 854    CL 0D1415         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 14s  
 855    CL 2E1415        57.2     0.      71.5 FIXEDHF     0.800  0       0.0  0                       
 856    CM 2D2416       594.6     0.     743.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s4d      
 857    CM 2E2416      -170.2     0.    -212.7 FIXEDHF     0.800  0       0.0  0                       
 858    CN 2D2416       316.2     0.     395.3 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s5d      
 859    CN 2E2416      -137.5     0.    -171.9 FIXEDHF     0.800  0       0.0  0                       
 860    CO 2D2416       201.0     0.     251.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s6d      
 861    CO 2E2416      -107.8     0.    -134.8 FIXEDHF     0.800  0       0.0  0                       
 862    CP 2D2416       141.4     0.     176.7 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s7d      
 863    CP 2E2416       -86.4     0.    -108.0 FIXEDHF     0.800  0       0.0  0                       
 864    CQ 2D2416       106.2     0.     132.8 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s8d      
 865    CQ 2E2416       -70.7     0.     -88.4 FIXEDHF     0.800  0       0.0  0                       
 866    CR 2D2416        83.5     0.     104.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s9d      
 867    CR 2E2416       -59.1     0.     -73.9 FIXEDHF     0.800  0       0.0  0                       
 868    CS 2D2416        68.2     0.      85.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s10d     
 869    CS 2E2416       -50.0     0.     -62.5 FIXEDHF     0.800  0       0.0  0                       
 870    CT 2D2416        56.8     0.      71.0 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s11d     
 871    CT 2E2416       -43.2     0.     -54.0 FIXEDHF     0.800  0       0.0  0                       
 872    CU 2D2416        48.2     0.      60.3 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s12d     
 873    CU 2E2416       -37.8     0.     -47.2 FIXEDHF     0.800  0       0.0  0                       
 874    CV 2D2416        41.8     0.      52.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s13d     
 875    CV 2E2416       -33.2     0.     -41.5 FIXEDHF     0.800  0       0.0  0                       
 876    CW 2D2416        36.6     0.      45.7 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s14d     
 877    CW 2E2416       -29.6     0.     -37.0 FIXEDHF     0.800  0       0.0  0                       
 878    CX 2D2416        32.3     0.      40.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -4s15d     
 879    CX 2E2416       -26.6     0.     -33.2 FIXEDHF     0.800  0       0.0  0                       
 880    CY 2D1416      -156.3     0.    -195.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 4d   
 881    CY 2E1416       127.1     0.     158.9 FIXEDHF     0.800  0       0.0  0                       
 882    CZ 2D1416       -32.2     0.     -40.2 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 5d   
 883    CZ 2E1416       101.4     0.     126.7 FIXEDHF     0.800  0       0.0  0                       
 884    Ca 2D1416         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 6d   
 885    Ca 2E1416        78.9     0.      98.6 FIXEDHF     0.800  0       0.0  0                       
 886    Cb 2D1416        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 7d   
 887    Cb 2E1416        62.7     0.      78.4 FIXEDHF     0.800  0       0.0  0                       
 888    Cc 2D1416        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 8d   
 889    Cc 2E1416        51.1     0.      63.9 FIXEDHF     0.800  0       0.0  0                       
 890    Cd 2D1416        15.8     0.      19.8 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 9d   
 891    Cd 2E1416        42.6     0.      53.2 FIXEDHF     0.800  0       0.0  0                       
 892    Ce 2D1416        15.2     0.      19.0 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 10d  
 893    Ce 2E1416        36.1     0.      45.1 FIXEDHF     0.800  0       0.0  0                       
 894    Cf 2D1416        14.2     0.      17.7 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 11d  
 895    Cf 2E1416        31.0     0.      38.8 FIXEDHF     0.800  0       0.0  0                       
 896    Cg 2D1416        13.1     0.      16.4 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 12d  
 897    Cg 2E1416        27.1     0.      33.9 FIXEDHF     0.800  0       0.0  0                       
 898    Ch 2D1416        12.1     0.      15.1 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 13d  
 899    Ch 2E1416        23.9     0.      29.9 FIXEDHF     0.800  0       0.0  0                       
 900    Ci 2D1416        11.1     0.      13.9 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 14d  
 901    Ci 2E1416        21.3     0.      26.6 FIXEDHF     0.800  0       0.0  0                       
 902    Cj 2D1416        10.3     0.      12.9 FIXEDHF     0.800  0       0.0  0  d9s2 5s   -d9s2 15d  
 903    Cj 2E1416        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0                       
 904    DE 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 7s   
 905    DE 2E1515       140.2     0.     175.2 FIXEDHF     0.800  0       0.0  0                       
 906    DF 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 8s   
 907    DF 2E1515       102.3     0.     127.9 FIXEDHF     0.800  0       0.0  0                       
 908    DG 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 9s   
 909    DG 2E1515        78.9     0.      98.6 FIXEDHF     0.800  0       0.0  0                       
 910    DH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 10s  
 911    DH 2E1515        63.2     0.      79.0 FIXEDHF     0.800  0       0.0  0                       
 912    DI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 11s  
 913    DI 2E1515        52.2     0.      65.2 FIXEDHF     0.800  0       0.0  0                       
 914    DJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 12s  
 915    DJ 2E1515        44.0     0.      55.0 FIXEDHF     0.800  0       0.0  0                       
 916    DK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 13s  
 917    DK 2E1515        37.7     0.      47.1 FIXEDHF     0.800  0       0.0  0                       
 918    DL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 14s  
 919    DL 2E1515        32.8     0.      41.0 FIXEDHF     0.800  0       0.0  0                       
 920    DM 2D2516       197.1     0.     246.4 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s4d      
 921    DM 2E2516       -88.8     0.    -111.0 FIXEDHF     0.800  0       0.0  0                       
 922    DN 2D2516       187.3     0.     234.1 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s5d      
 923    DN 2E2516       -72.2     0.     -90.2 FIXEDHF     0.800  0       0.0  0                       
 924    DO 2D2516       130.2     0.     162.8 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s6d      
 925    DO 2E2516       -56.7     0.     -70.9 FIXEDHF     0.800  0       0.0  0                       
 926    DP 2D2516        95.8     0.     119.8 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s7d      
 927    DP 2E2516       -45.5     0.     -56.9 FIXEDHF     0.800  0       0.0  0                       
 928    DQ 2D2516        74.1     0.      92.6 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s8d      
 929    DQ 2E2516       -37.3     0.     -46.6 FIXEDHF     0.800  0       0.0  0                       
 930    DR 2D2516        59.4     0.      74.3 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s9d      
 931    DR 2E2516       -31.2     0.     -39.0 FIXEDHF     0.800  0       0.0  0                       
 932    DS 2D2516        49.1     0.      61.4 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s10d     
 933    DS 2E2516       -26.4     0.     -33.0 FIXEDHF     0.800  0       0.0  0                       
 934    DT 2D2516        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s11d     
 935    DT 2E2516       -22.8     0.     -28.5 FIXEDHF     0.800  0       0.0  0                       
 936    DU 2D2516        35.5     0.      44.4 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s12d     
 937    DU 2E2516       -19.9     0.     -24.9 FIXEDHF     0.800  0       0.0  0                       
 938    DV 2D2516        31.0     0.      38.7 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s13d     
 939    DV 2E2516       -17.5     0.     -21.9 FIXEDHF     0.800  0       0.0  0                       
 940    DW 2D2516        27.3     0.      34.1 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s14d     
 941    DW 2E2516       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
 942    DX 2D2516        24.2     0.      30.3 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -4s15d     
 943    DX 2E2516       -14.1     0.     -17.6 FIXEDHF     0.800  0       0.0  0                       
 944    DY 2D1516        -7.4     0.      -9.3 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 4d   
 945    DY 2E1516        72.6     0.      90.7 FIXEDHF     0.800  0       0.0  0                       
 946    DZ 2D1516       -23.4     0.     -29.2 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 5d   
 947    DZ 2E1516        57.8     0.      72.3 FIXEDHF     0.800  0       0.0  0                       
 948    Da 2D1516        -8.8     0.     -11.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 6d   
 949    Da 2E1516        45.0     0.      56.3 FIXEDHF     0.800  0       0.0  0                       
 950    Db 2D1516        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 7d   
 951    Db 2E1516        35.8     0.      44.8 FIXEDHF     0.800  0       0.0  0                       
 952    Dc 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 8d   
 953    Dc 2E1516        29.2     0.      36.5 FIXEDHF     0.800  0       0.0  0                       
 954    Dd 2D1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 9d   
 955    Dd 2E1516        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0                       
 956    De 2D1516         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 10d  
 957    De 2E1516        20.6     0.      25.7 FIXEDHF     0.800  0       0.0  0                       
 958    Df 2D1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 11d  
 959    Df 2E1516        17.7     0.      22.1 FIXEDHF     0.800  0       0.0  0                       
 960    Dg 2D1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 12d  
 961    Dg 2E1516        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0                       
 962    Dh 2D1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 13d  
 963    Dh 2E1516        13.6     0.      17.0 FIXEDHF     0.800  0       0.0  0                       
 964    Di 2D1516         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 14d  
 965    Di 2E1516        12.2     0.      15.2 FIXEDHF     0.800  0       0.0  0                       
 966    Dj 2D1516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  d9s2 6s   -d9s2 15d  
 967    Dj 2E1516        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0                       
 968    EF 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 8s   
 969    EF 2E1515        68.6     0.      85.7 FIXEDHF     0.800  0       0.0  0                       
 970    EG 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 9s   
 971    EG 2E1515        52.9     0.      66.1 FIXEDHF     0.800  0       0.0  0                       
 972    EH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 10s  
 973    EH 2E1515        42.4     0.      53.0 FIXEDHF     0.800  0       0.0  0                       
 974    EI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 11s  
 975    EI 2E1515        35.0     0.      43.7 FIXEDHF     0.800  0       0.0  0                       
 976    EJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 12s  
 977    EJ 2E1515        29.4     0.      36.8 FIXEDHF     0.800  0       0.0  0                       
 978    EK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 13s  
 979    EK 2E1515        25.3     0.      31.6 FIXEDHF     0.800  0       0.0  0                       
 980    EL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 14s  
 981    EL 2E1515        22.0     0.      27.5 FIXEDHF     0.800  0       0.0  0                       
 982    EM 2D2516       121.2     0.     151.5 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s4d      
 983    EM 2E2516       -57.4     0.     -71.7 FIXEDHF     0.800  0       0.0  0                       
 984    EN 2D2516        96.6     0.     120.8 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s5d      
 985    EN 2E2516       -46.7     0.     -58.4 FIXEDHF     0.800  0       0.0  0                       
 986    EO 2D2516        83.1     0.     103.9 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s6d      
 987    EO 2E2516       -36.8     0.     -46.0 FIXEDHF     0.800  0       0.0  0                       
 988    EP 2D2516        63.5     0.      79.4 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s7d      
 989    EP 2E2516       -29.5     0.     -36.9 FIXEDHF     0.800  0       0.0  0                       
 990    EQ 2D2516        50.1     0.      62.6 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s8d      
 991    EQ 2E2516       -24.2     0.     -30.3 FIXEDHF     0.800  0       0.0  0                       
 992    ER 2D2516        40.6     0.      50.8 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s9d      
 993    ER 2E2516       -20.2     0.     -25.3 FIXEDHF     0.800  0       0.0  0                       
 994    ES 2D2516        33.8     0.      42.3 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s10d     
 995    ES 2E2516       -17.1     0.     -21.4 FIXEDHF     0.800  0       0.0  0                       
 996    ET 2D2516        28.6     0.      35.8 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s11d     
 997    ET 2E2516       -14.8     0.     -18.5 FIXEDHF     0.800  0       0.0  0                       
 998    EU 2D2516        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s12d     
 999    EU 2E2516       -13.0     0.     -16.2 FIXEDHF     0.800  0       0.0  0                       
1000    EV 2D2516        21.6     0.      27.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s13d     
1001    EV 2E2516       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0                       
1002    EW 2D2516        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s14d     
1003    EW 2E2516       -10.2     0.     -12.7 FIXEDHF     0.800  0       0.0  0                       
1004    EX 2D2516        17.0     0.      21.3 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -4s15d     
1005    EX 2E2516        -9.1     0.     -11.4 FIXEDHF     0.800  0       0.0  0                       
1006    EY 2D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 4d   
1007    EY 2E1516        48.6     0.      60.7 FIXEDHF     0.800  0       0.0  0                       
1008    EZ 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 5d   
1009    EZ 2E1516        38.6     0.      48.3 FIXEDHF     0.800  0       0.0  0                       
1010    Ea 2D1516        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 6d   
1011    Ea 2E1516        30.1     0.      37.6 FIXEDHF     0.800  0       0.0  0                       
1012    Eb 2D1516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 7d   
1013    Eb 2E1516        23.9     0.      29.9 FIXEDHF     0.800  0       0.0  0                       
1014    Ec 2D1516        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 8d   
1015    Ec 2E1516        19.5     0.      24.4 FIXEDHF     0.800  0       0.0  0                       
1016    Ed 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 9d   
1017    Ed 2E1516        16.2     0.      20.3 FIXEDHF     0.800  0       0.0  0                       
1018    Ee 2D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 10d  
1019    Ee 2E1516        13.8     0.      17.2 FIXEDHF     0.800  0       0.0  0                       
1020    Ef 2D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 11d  
1021    Ef 2E1516        11.8     0.      14.8 FIXEDHF     0.800  0       0.0  0                       
1022    Eg 2D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 12d  
1023    Eg 2E1516        10.3     0.      12.9 FIXEDHF     0.800  0       0.0  0                       
1024    Eh 2D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 13d  
1025    Eh 2E1516         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
1026    Ei 2D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 14d  
1027    Ei 2E1516         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
1028    Ej 2D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 7s   -d9s2 15d  
1029    Ej 2E1516         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0                       
1030    FG 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 9s   
1031    FG 2E1515        38.6     0.      48.2 FIXEDHF     0.800  0       0.0  0                       
1032    FH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 10s  
1033    FH 2E1515        31.0     0.      38.7 FIXEDHF     0.800  0       0.0  0                       
1034    FI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 11s  
1035    FI 2E1515        25.5     0.      31.9 FIXEDHF     0.800  0       0.0  0                       
1036    FJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 12s  
1037    FJ 2E1515        21.5     0.      26.9 FIXEDHF     0.800  0       0.0  0                       
1038    FK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 13s  
1039    FK 2E1515        18.5     0.      23.1 FIXEDHF     0.800  0       0.0  0                       
1040    FL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 14s  
1041    FL 2E1515        16.1     0.      20.1 FIXEDHF     0.800  0       0.0  0                       
1042    FM 2D2516        85.0     0.     106.2 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s4d      
1043    FM 2E2516       -41.1     0.     -51.4 FIXEDHF     0.800  0       0.0  0                       
1044    FN 2D2516        66.9     0.      83.6 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s5d      
1045    FN 2E2516       -33.5     0.     -41.9 FIXEDHF     0.800  0       0.0  0                       
1046    FO 2D2516        52.4     0.      65.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s6d      
1047    FO 2E2516       -26.4     0.     -33.0 FIXEDHF     0.800  0       0.0  0                       
1048    FP 2D2516        44.3     0.      55.4 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s7d      
1049    FP 2E2516       -21.2     0.     -26.5 FIXEDHF     0.800  0       0.0  0                       
1050    FQ 2D2516        35.6     0.      44.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s8d      
1051    FQ 2E2516       -17.4     0.     -21.7 FIXEDHF     0.800  0       0.0  0                       
1052    FR 2D2516        29.2     0.      36.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s9d      
1053    FR 2E2516       -14.6     0.     -18.2 FIXEDHF     0.800  0       0.0  0                       
1054    FS 2D2516        24.4     0.      30.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s10d     
1055    FS 2E2516       -12.3     0.     -15.4 FIXEDHF     0.800  0       0.0  0                       
1056    FT 2D2516        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s11d     
1057    FT 2E2516       -10.6     0.     -13.3 FIXEDHF     0.800  0       0.0  0                       
1058    FU 2D2516        18.0     0.      22.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s12d     
1059    FU 2E2516        -9.3     0.     -11.6 FIXEDHF     0.800  0       0.0  0                       
1060    FV 2D2516        15.8     0.      19.7 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s13d     
1061    FV 2E2516        -8.2     0.     -10.2 FIXEDHF     0.800  0       0.0  0                       
1062    FW 2D2516        13.9     0.      17.4 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s14d     
1063    FW 2E2516        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0                       
1064    FX 2D2516        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -4s15d     
1065    FX 2E2516        -6.6     0.      -8.2 FIXEDHF     0.800  0       0.0  0                       
1066    FY 2D1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 4d   
1067    FY 2E1516        35.4     0.      44.2 FIXEDHF     0.800  0       0.0  0                       
1068    FZ 2D1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 5d   
1069    FZ 2E1516        28.2     0.      35.2 FIXEDHF     0.800  0       0.0  0                       
1070    Fa 2D1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 6d   
1071    Fa 2E1516        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0                       
1072    Fb 2D1516         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 7d   
1073    Fb 2E1516        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0                       
1074    Fc 2D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 8d   
1075    Fc 2E1516        14.2     0.      17.8 FIXEDHF     0.800  0       0.0  0                       
1076    Fd 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 9d   
1077    Fd 2E1516        11.8     0.      14.8 FIXEDHF     0.800  0       0.0  0                       
1078    Fe 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 10d  
1079    Fe 2E1516        10.0     0.      12.5 FIXEDHF     0.800  0       0.0  0                       
1080    Ff 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 11d  
1081    Ff 2E1516         8.6     0.      10.8 FIXEDHF     0.800  0       0.0  0                       
1082    Fg 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 12d  
1083    Fg 2E1516         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0                       
1084    Fh 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 13d  
1085    Fh 2E1516         6.6     0.       8.3 FIXEDHF     0.800  0       0.0  0                       
1086    Fi 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 14d  
1087    Fi 2E1516         5.9     0.       7.4 FIXEDHF     0.800  0       0.0  0                       
1088    Fj 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 8s   -d9s2 15d  
1089    Fj 2E1516         5.3     0.       6.6 FIXEDHF     0.800  0       0.0  0                       
1090    GH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 10s  
1091    GH 2E1515        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0                       
1092    GI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 11s  
1093    GI 2E1515        19.7     0.      24.6 FIXEDHF     0.800  0       0.0  0                       
1094    GJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 12s  
1095    GJ 2E1515        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0                       
1096    GK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 13s  
1097    GK 2E1515        14.2     0.      17.8 FIXEDHF     0.800  0       0.0  0                       
1098    GL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 14s  
1099    GL 2E1515        12.4     0.      15.5 FIXEDHF     0.800  0       0.0  0                       
1100    GM 2D2516        64.1     0.      80.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s4d      
1101    GM 2E2516       -31.4     0.     -39.2 FIXEDHF     0.800  0       0.0  0                       
1102    GN 2D2516        50.2     0.      62.7 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s5d      
1103    GN 2E2516       -25.6     0.     -32.0 FIXEDHF     0.800  0       0.0  0                       
1104    GO 2D2516        39.0     0.      48.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s6d      
1105    GO 2E2516       -20.2     0.     -25.2 FIXEDHF     0.800  0       0.0  0                       
1106    GP 2D2516        31.2     0.      39.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s7d      
1107    GP 2E2516       -16.2     0.     -20.2 FIXEDHF     0.800  0       0.0  0                       
1108    GQ 2D2516        26.5     0.      33.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s8d      
1109    GQ 2E2516       -13.3     0.     -16.6 FIXEDHF     0.800  0       0.0  0                       
1110    GR 2D2516        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s9d      
1111    GR 2E2516       -11.1     0.     -13.9 FIXEDHF     0.800  0       0.0  0                       
1112    GS 2D2516        18.5     0.      23.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s10d     
1113    GS 2E2516        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
1114    GT 2D2516        15.8     0.      19.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s11d     
1115    GT 2E2516        -8.1     0.     -10.1 FIXEDHF     0.800  0       0.0  0                       
1116    GU 2D2516        13.7     0.      17.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s12d     
1117    GU 2E2516        -7.1     0.      -8.9 FIXEDHF     0.800  0       0.0  0                       
1118    GV 2D2516        12.1     0.      15.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s13d     
1119    GV 2E2516        -6.2     0.      -7.8 FIXEDHF     0.800  0       0.0  0                       
1120    GW 2D2516        10.6     0.      13.3 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s14d     
1121    GW 2E2516        -5.6     0.      -7.0 FIXEDHF     0.800  0       0.0  0                       
1122    GX 2D2516         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -4s15d     
1123    GX 2E2516        -5.0     0.      -6.3 FIXEDHF     0.800  0       0.0  0                       
1124    GY 2D1516         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 4d   
1125    GY 2E1516        27.3     0.      34.1 FIXEDHF     0.800  0       0.0  0                       
1126    GZ 2D1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 5d   
1127    GZ 2E1516        21.8     0.      27.2 FIXEDHF     0.800  0       0.0  0                       
1128    Ga 2D1516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 6d   
1129    Ga 2E1516        16.9     0.      21.1 FIXEDHF     0.800  0       0.0  0                       
1130    Gb 2D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 7d   
1131    Gb 2E1516        13.4     0.      16.8 FIXEDHF     0.800  0       0.0  0                       
1132    Gc 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 8d   
1133    Gc 2E1516        11.0     0.      13.7 FIXEDHF     0.800  0       0.0  0                       
1134    Gd 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 9d   
1135    Gd 2E1516         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
1136    Ge 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 10d  
1137    Ge 2E1516         7.8     0.       9.7 FIXEDHF     0.800  0       0.0  0                       
1138    Gf 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 11d  
1139    Gf 2E1516         6.6     0.       8.3 FIXEDHF     0.800  0       0.0  0                       
1140    Gg 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 12d  
1141    Gg 2E1516         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0                       
1142    Gh 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 13d  
1143    Gh 2E1516         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0                       
1144    Gi 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 14d  
1145    Gi 2E1516         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0                       
1146    Gj 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 9s   -d9s2 15d  
1147    Gj 2E1516         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0                       
1148    HI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 11s  
1149    HI 2E1515        15.8     0.      19.7 FIXEDHF     0.800  0       0.0  0                       
1150    HJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 12s  
1151    HJ 2E1515        13.3     0.      16.6 FIXEDHF     0.800  0       0.0  0                       
1152    HK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 13s  
1153    HK 2E1515        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0                       
1154    HL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 14s  
1155    HL 2E1515         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0                       
1156    HM 2D2516        50.6     0.      63.2 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s4d      
1157    HM 2E2516       -25.0     0.     -31.2 FIXEDHF     0.800  0       0.0  0                       
1158    HN 2D2516        39.5     0.      49.4 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s5d      
1159    HN 2E2516       -20.4     0.     -25.5 FIXEDHF     0.800  0       0.0  0                       
1160    HO 2D2516        30.6     0.      38.3 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s6d      
1161    HO 2E2516       -16.1     0.     -20.1 FIXEDHF     0.800  0       0.0  0                       
1162    HP 2D2516        24.4     0.      30.5 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s7d      
1163    HP 2E2516       -12.9     0.     -16.1 FIXEDHF     0.800  0       0.0  0                       
1164    HQ 2D2516        20.0     0.      25.0 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s8d      
1165    HQ 2E2516       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
1166    HR 2D2516        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s9d      
1167    HR 2E2516        -8.9     0.     -11.1 FIXEDHF     0.800  0       0.0  0                       
1168    HS 2D2516        14.6     0.      18.2 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s10d     
1169    HS 2E2516        -7.5     0.      -9.4 FIXEDHF     0.800  0       0.0  0                       
1170    HT 2D2516        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s11d     
1171    HT 2E2516        -6.5     0.      -8.1 FIXEDHF     0.800  0       0.0  0                       
1172    HU 2D2516        10.8     0.      13.5 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s12d     
1173    HU 2E2516        -5.7     0.      -7.1 FIXEDHF     0.800  0       0.0  0                       
1174    HV 2D2516         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s13d     
1175    HV 2E2516        -5.0     0.      -6.2 FIXEDHF     0.800  0       0.0  0                       
1176    HW 2D2516         8.5     0.      10.6 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s14d     
1177    HW 2E2516        -4.4     0.      -5.5 FIXEDHF     0.800  0       0.0  0                       
1178    HX 2D2516         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -4s15d     
1179    HX 2E2516        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
1180    HY 2D1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 4d   
1181    HY 2E1516        21.8     0.      27.3 FIXEDHF     0.800  0       0.0  0                       
1182    HZ 2D1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 5d   
1183    HZ 2E1516        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0                       
1184    Ha 2D1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 6d   
1185    Ha 2E1516        13.5     0.      16.9 FIXEDHF     0.800  0       0.0  0                       
1186    Hb 2D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 7d   
1187    Hb 2E1516        10.8     0.      13.5 FIXEDHF     0.800  0       0.0  0                       
1188    Hc 2D1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 8d   
1189    Hc 2E1516         8.8     0.      11.0 FIXEDHF     0.800  0       0.0  0                       
1190    Hd 2D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 9d   
1191    Hd 2E1516         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0                       
1192    He 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 10d  
1193    He 2E1516         6.2     0.       7.7 FIXEDHF     0.800  0       0.0  0                       
1194    Hf 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 11d  
1195    Hf 2E1516         5.4     0.       6.7 FIXEDHF     0.800  0       0.0  0                       
1196    Hg 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 12d  
1197    Hg 2E1516         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0                       
1198    Hh 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 13d  
1199    Hh 2E1516         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0                       
1200    Hi 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 14d  
1201    Hi 2E1516         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0                       
1202    Hj 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 10s  -d9s2 15d  
1203    Hj 2E1516         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0                       
1204    IJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 12s  
1205    IJ 2E1515        11.0     0.      13.7 FIXEDHF     0.800  0       0.0  0                       
1206    IK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 13s  
1207    IK 2E1515         9.4     0.      11.8 FIXEDHF     0.800  0       0.0  0                       
1208    IL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 14s  
1209    IL 2E1515         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0                       
1210    IM 2D2516        41.3     0.      51.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s4d      
1211    IM 2E2516       -20.5     0.     -25.6 FIXEDHF     0.800  0       0.0  0                       
1212    IN 2D2516        32.2     0.      40.3 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s5d      
1213    IN 2E2516       -16.7     0.     -20.9 FIXEDHF     0.800  0       0.0  0                       
1214    IO 2D2516        25.0     0.      31.2 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s6d      
1215    IO 2E2516       -13.2     0.     -16.5 FIXEDHF     0.800  0       0.0  0                       
1216    IP 2D2516        19.8     0.      24.8 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s7d      
1217    IP 2E2516       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
1218    IQ 2D2516        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s8d      
1219    IQ 2E2516        -8.7     0.     -10.9 FIXEDHF     0.800  0       0.0  0                       
1220    IR 2D2516        13.5     0.      16.9 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s9d      
1221    IR 2E2516        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0                       
1222    IS 2D2516        11.8     0.      14.7 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s10d     
1223    IS 2E2516        -6.2     0.      -7.7 FIXEDHF     0.800  0       0.0  0                       
1224    IT 2D2516        10.1     0.      12.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s11d     
1225    IT 2E2516        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
1226    IU 2D2516         8.8     0.      11.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s12d     
1227    IU 2E2516        -4.6     0.      -5.8 FIXEDHF     0.800  0       0.0  0                       
1228    IV 2D2516         7.8     0.       9.7 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s13d     
1229    IV 2E2516        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
1230    IW 2D2516         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s14d     
1231    IW 2E2516        -3.7     0.      -4.6 FIXEDHF     0.800  0       0.0  0                       
1232    IX 2D2516         6.2     0.       7.7 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -4s15d     
1233    IX 2E2516        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0                       
1234    IY 2D1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 4d   
1235    IY 2E1516        18.0     0.      22.5 FIXEDHF     0.800  0       0.0  0                       
1236    IZ 2D1516         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 5d   
1237    IZ 2E1516        14.3     0.      17.9 FIXEDHF     0.800  0       0.0  0                       
1238    Ia 2D1516         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 6d   
1239    Ia 2E1516        11.2     0.      14.0 FIXEDHF     0.800  0       0.0  0                       
1240    Ib 2D1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 7d   
1241    Ib 2E1516         8.9     0.      11.1 FIXEDHF     0.800  0       0.0  0                       
1242    Ic 2D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 8d   
1243    Ic 2E1516         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0                       
1244    Id 2D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 9d   
1245    Id 2E1516         6.0     0.       7.5 FIXEDHF     0.800  0       0.0  0                       
1246    Ie 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 10d  
1247    Ie 2E1516         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0                       
1248    If 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 11d  
1249    If 2E1516         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0                       
1250    Ig 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 12d  
1251    Ig 2E1516         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0                       
1252    Ih 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 13d  
1253    Ih 2E1516         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
1254    Ii 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 14d  
1255    Ii 2E1516         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
1256    Ij 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 11s  -d9s2 15d  
1257    Ij 2E1516         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0                       
1258    JK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 13s  
1259    JK 2E1515         7.9     0.       9.9 FIXEDHF     0.800  0       0.0  0                       
1260    JL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 14s  
1261    JL 2E1515         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0                       
1262    JM 2D2516        34.6     0.      43.2 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s4d      
1263    JM 2E2516       -17.2     0.     -21.5 FIXEDHF     0.800  0       0.0  0                       
1264    JN 2D2516        27.0     0.      33.7 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s5d      
1265    JN 2E2516       -14.1     0.     -17.6 FIXEDHF     0.800  0       0.0  0                       
1266    JO 2D2516        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s6d      
1267    JO 2E2516       -11.1     0.     -13.9 FIXEDHF     0.800  0       0.0  0                       
1268    JP 2D2516        16.5     0.      20.6 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s7d      
1269    JP 2E2516        -8.9     0.     -11.1 FIXEDHF     0.800  0       0.0  0                       
1270    JQ 2D2516        13.4     0.      16.8 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s8d      
1271    JQ 2E2516        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0                       
1272    JR 2D2516        11.3     0.      14.1 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s9d      
1273    JR 2E2516        -6.1     0.      -7.6 FIXEDHF     0.800  0       0.0  0                       
1274    JS 2D2516         9.6     0.      12.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s10d     
1275    JS 2E2516        -5.2     0.      -6.5 FIXEDHF     0.800  0       0.0  0                       
1276    JT 2D2516         8.4     0.      10.5 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s11d     
1277    JT 2E2516        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0                       
1278    JU 2D2516         7.4     0.       9.2 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s12d     
1279    JU 2E2516        -3.9     0.      -4.9 FIXEDHF     0.800  0       0.0  0                       
1280    JV 2D2516         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s13d     
1281    JV 2E2516        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0                       
1282    JW 2D2516         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s14d     
1283    JW 2E2516        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
1284    JX 2D2516         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -4s15d     
1285    JX 2E2516        -2.7     0.      -3.4 FIXEDHF     0.800  0       0.0  0                       
1286    JY 2D1516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 4d   
1287    JY 2E1516        15.2     0.      19.0 FIXEDHF     0.800  0       0.0  0                       
1288    JZ 2D1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 5d   
1289    JZ 2E1516        12.1     0.      15.1 FIXEDHF     0.800  0       0.0  0                       
1290    Ja 2D1516         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 6d   
1291    Ja 2E1516         9.4     0.      11.8 FIXEDHF     0.800  0       0.0  0                       
1292    Jb 2D1516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 7d   
1293    Jb 2E1516         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0                       
1294    Jc 2D1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 8d   
1295    Jc 2E1516         6.1     0.       7.6 FIXEDHF     0.800  0       0.0  0                       
1296    Jd 2D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 9d   
1297    Jd 2E1516         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0                       
1298    Je 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 10d  
1299    Je 2E1516         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
1300    Jf 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 11d  
1301    Jf 2E1516         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0                       
1302    Jg 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 12d  
1303    Jg 2E1516         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0                       
1304    Jh 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 13d  
1305    Jh 2E1516         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0                       
1306    Ji 2D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 14d  
1307    Ji 2E1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0                       
1308    Jj 2D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 12s  -d9s2 15d  
1309    Jj 2E1516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0                       
1310    KL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 14s  
1311    KL 2E1515         5.9     0.       7.4 FIXEDHF     0.800  0       0.0  0                       
1312    KM 2D2516        29.4     0.      36.8 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s4d      
1313    KM 2E2516       -14.7     0.     -18.4 FIXEDHF     0.800  0       0.0  0                       
1314    KN 2D2516        23.0     0.      28.7 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s5d      
1315    KN 2E2516       -12.0     0.     -15.0 FIXEDHF     0.800  0       0.0  0                       
1316    KO 2D2516        17.8     0.      22.2 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s6d      
1317    KO 2E2516        -9.5     0.     -11.9 FIXEDHF     0.800  0       0.0  0                       
1318    KP 2D2516        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s7d      
1319    KP 2E2516        -7.6     0.      -9.5 FIXEDHF     0.800  0       0.0  0                       
1320    KQ 2D2516        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s8d      
1321    KQ 2E2516        -6.2     0.      -7.8 FIXEDHF     0.800  0       0.0  0                       
1322    KR 2D2516         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s9d      
1323    KR 2E2516        -5.2     0.      -6.5 FIXEDHF     0.800  0       0.0  0                       
1324    KS 2D2516         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s10d     
1325    KS 2E2516        -4.4     0.      -5.5 FIXEDHF     0.800  0       0.0  0                       
1326    KT 2D2516         7.0     0.       8.8 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s11d     
1327    KT 2E2516        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
1328    KU 2D2516         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s12d     
1329    KU 2E2516        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1330    KV 2D2516         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s13d     
1331    KV 2E2516        -3.0     0.      -3.7 FIXEDHF     0.800  0       0.0  0                       
1332    KW 2D2516         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s14d     
1333    KW 2E2516        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
1334    KX 2D2516         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -4s15d     
1335    KX 2E2516        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
1336    KY 2D1516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 4d   
1337    KY 2E1516        13.0     0.      16.3 FIXEDHF     0.800  0       0.0  0                       
1338    KZ 2D1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 5d   
1339    KZ 2E1516        10.4     0.      13.0 FIXEDHF     0.800  0       0.0  0                       
1340    Ka 2D1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 6d   
1341    Ka 2E1516         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
1342    Kb 2D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 7d   
1343    Kb 2E1516         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
1344    Kc 2D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 8d   
1345    Kc 2E1516         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0                       
1346    Kd 2D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 9d   
1347    Kd 2E1516         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
1348    Ke 2D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 10d  
1349    Ke 2E1516         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0                       
1350    Kf 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 11d  
1351    Kf 2E1516         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0                       
1352    Kg 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 12d  
1353    Kg 2E1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0                       
1354    Kh 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 13d  
1355    Kh 2E1516         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0                       
1356    Ki 2D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 14d  
1357    Ki 2E1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0                       
1358    Kj 2D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0  d9s2 13s  -d9s2 15d  
1359    Kj 2E1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0                       
1360    LM 2D2516        25.4     0.      31.8 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s4d      
1361    LM 2E2516       -12.8     0.     -16.0 FIXEDHF     0.800  0       0.0  0                       
1362    LN 2D2516        19.8     0.      24.8 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s5d      
1363    LN 2E2516       -10.5     0.     -13.1 FIXEDHF     0.800  0       0.0  0                       
1364    LO 2D2516        15.4     0.      19.2 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s6d      
1365    LO 2E2516        -8.2     0.     -10.3 FIXEDHF     0.800  0       0.0  0                       
1366    LP 2D2516        12.2     0.      15.2 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s7d      
1367    LP 2E2516        -6.6     0.      -8.3 FIXEDHF     0.800  0       0.0  0                       
1368    LQ 2D2516         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s8d      
1369    LQ 2E2516        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0                       
1370    LR 2D2516         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s9d      
1371    LR 2E2516        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
1372    LS 2D2516         7.0     0.       8.8 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s10d     
1373    LS 2E2516        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
1374    LT 2D2516         6.1     0.       7.6 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s11d     
1375    LT 2E2516        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1376    LU 2D2516         5.3     0.       6.6 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s12d     
1377    LU 2E2516        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
1378    LV 2D2516         4.7     0.       5.9 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s13d     
1379    LV 2E2516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1380    LW 2D2516         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s14d     
1381    LW 2E2516        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
1382    LX 2D2516         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -4s15d     
1383    LX 2E2516        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
1384    LY 2D1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 4d   
1385    LY 2E1516        11.4     0.      14.2 FIXEDHF     0.800  0       0.0  0                       
1386    LZ 2D1516         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 5d   
1387    LZ 2E1516         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0                       
1388    La 2D1516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 6d   
1389    La 2E1516         7.0     0.       8.8 FIXEDHF     0.800  0       0.0  0                       
1390    Lb 2D1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 7d   
1391    Lb 2E1516         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
1392    Lc 2D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 8d   
1393    Lc 2E1516         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0                       
1394    Ld 2D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 9d   
1395    Ld 2E1516         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
1396    Le 2D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 10d  
1397    Le 2E1516         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0                       
1398    Lf 2D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 11d  
1399    Lf 2E1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0                       
1400    Lg 2D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 12d  
1401    Lg 2E1516         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
1402    Lh 2D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 13d  
1403    Lh 2E1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0                       
1404    Li 2D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 14d  
1405    Li 2E1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0                       
1406    Lj 2D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0  d9s2 14s  -d9s2 15d  
1407    Lj 2E1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
1408    MN 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s5d      
1409    MN 2E2626       603.0     0.     753.7 FIXEDHF     0.800  0       0.0  0                       
1410    MO 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s6d      
1411    MO 2E2626       453.5     0.     566.9 FIXEDHF     0.800  0       0.0  0                       
1412    MP 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s7d      
1413    MP 2E2626       354.2     0.     442.8 FIXEDHF     0.800  0       0.0  0                       
1414    MQ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s8d      
1415    MQ 2E2626       285.5     0.     356.9 FIXEDHF     0.800  0       0.0  0                       
1416    MR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s9d      
1417    MR 2E2626       236.1     0.     295.1 FIXEDHF     0.800  0       0.0  0                       
1418    MS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s10d     
1419    MS 2E2626       199.0     0.     248.8 FIXEDHF     0.800  0       0.0  0                       
1420    MT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s11d     
1421    MT 2E2626       170.8     0.     213.5 FIXEDHF     0.800  0       0.0  0                       
1422    MU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s12d     
1423    MU 2E2626       148.6     0.     185.8 FIXEDHF     0.800  0       0.0  0                       
1424    MV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s13d     
1425    MV 2E2626       130.7     0.     163.4 FIXEDHF     0.800  0       0.0  0                       
1426    MW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s14d     
1427    MW 2E2626       116.2     0.     145.2 FIXEDHF     0.800  0       0.0  0                       
1428    MX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4s15d     
1429    MX 2E2626       104.2     0.     130.2 FIXEDHF     0.800  0       0.0  0                       
1430    MY 2D1112       699.7     0.     874.6 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 4d   
1431    MY 2D1626      -658.2     0.    -822.7 FIXEDHF     0.800  0       0.0  0                       
1432    MY 2E1626       -18.7     0.     -23.4 FIXEDHF     0.800  0       0.0  0                       
1433    MZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 5d   
1434    MZ 2D1626      -369.0     0.    -461.3 FIXEDHF     0.800  0       0.0  0                       
1435    MZ 2E1626       -17.9     0.     -22.4 FIXEDHF     0.800  0       0.0  0                       
1436    Ma 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 6d   
1437    Ma 2D1626      -250.1     0.    -312.6 FIXEDHF     0.800  0       0.0  0                       
1438    Ma 2E1626       -14.8     0.     -18.5 FIXEDHF     0.800  0       0.0  0                       
1439    Mb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 7d   
1440    Mb 2D1626      -184.4     0.    -230.5 FIXEDHF     0.800  0       0.0  0                       
1441    Mb 2E1626       -12.2     0.     -15.2 FIXEDHF     0.800  0       0.0  0                       
1442    Mc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 8d   
1443    Mc 2D1626      -143.4     0.    -179.2 FIXEDHF     0.800  0       0.0  0                       
1444    Mc 2E1626       -10.0     0.     -12.5 FIXEDHF     0.800  0       0.0  0                       
1445    Md 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 9d   
1446    Md 2D1626      -115.6     0.    -144.5 FIXEDHF     0.800  0       0.0  0                       
1447    Md 2E1626        -8.5     0.     -10.6 FIXEDHF     0.800  0       0.0  0                       
1448    Me 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 10d  
1449    Me 2D1626       -95.8     0.    -119.7 FIXEDHF     0.800  0       0.0  0                       
1450    Me 2E1626        -7.2     0.      -9.0 FIXEDHF     0.800  0       0.0  0                       
1451    Mf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 11d  
1452    Mf 2D1626       -81.0     0.    -101.3 FIXEDHF     0.800  0       0.0  0                       
1453    Mf 2E1626        -6.2     0.      -7.8 FIXEDHF     0.800  0       0.0  0                       
1454    Mg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 12d  
1455    Mg 2D1626       -69.7     0.     -87.1 FIXEDHF     0.800  0       0.0  0                       
1456    Mg 2E1626        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0                       
1457    Mh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 13d  
1458    Mh 2D1626       -60.8     0.     -76.0 FIXEDHF     0.800  0       0.0  0                       
1459    Mh 2E1626        -4.8     0.      -6.0 FIXEDHF     0.800  0       0.0  0                       
1460    Mi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 14d  
1461    Mi 2D1626       -53.6     0.     -67.0 FIXEDHF     0.800  0       0.0  0                       
1462    Mi 2E1626        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0                       
1463    Mj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4d      -d9s2 15d  
1464    Mj 2D1626       -47.8     0.     -59.7 FIXEDHF     0.800  0       0.0  0                       
1465    Mj 2E1626        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
1466    Mk 1D2633      7905.5     0.    9881.9 FIXEDHF     0.800  0       0.0  0  4s4d      -4p2       
1467    Ml 1D2637     -3486.6     0.   -4358.3 FIXEDHF     0.800  0       0.0  0  4s4d      -4p5p      
1468    Ml 1E2637      1651.1     0.    2063.9 FIXEDHF     0.800  0       0.0  0                       
1469    Mm 1D2637     -1077.1     0.   -1346.4 FIXEDHF     0.800  0       0.0  0  4s4d      -4p6p      
1470    Mm 1E2637       907.9     0.    1134.9 FIXEDHF     0.800  0       0.0  0                       
1471    Mn 1D2637      -645.4     0.    -806.8 FIXEDHF     0.800  0       0.0  0  4s4d      -4p7p      
1472    Mn 1E2637       604.3     0.     755.4 FIXEDHF     0.800  0       0.0  0                       
1473    Mo 1D2637      -450.8     0.    -563.5 FIXEDHF     0.800  0       0.0  0  4s4d      -4p8p      
1474    Mo 1E2637       441.8     0.     552.2 FIXEDHF     0.800  0       0.0  0                       
1475    Mp 1D2637      -340.2     0.    -425.2 FIXEDHF     0.800  0       0.0  0  4s4d      -4p9p      
1476    Mp 1E2637       341.9     0.     427.4 FIXEDHF     0.800  0       0.0  0                       
1477    Mq 1D2638      2798.3     0.    3497.9 FIXEDHF     0.800  0       0.0  0  4s4d      -4p4f      
1478    Mq 3E2638       141.4     0.     176.7 FIXEDHF     0.800  0       0.0  0                       
1479    Mr 1D2638      1988.6     0.    2485.7 FIXEDHF     0.800  0       0.0  0  4s4d      -4p5f      
1480    Mr 3E2638       132.9     0.     166.1 FIXEDHF     0.800  0       0.0  0                       
1481    Ms 1D2638      1502.6     0.    1878.2 FIXEDHF     0.800  0       0.0  0  4s4d      -4p6f      
1482    Ms 3E2638       115.2     0.     144.0 FIXEDHF     0.800  0       0.0  0                       
1483    Mt 1D2638      1188.9     0.    1486.1 FIXEDHF     0.800  0       0.0  0  4s4d      -4p7f      
1484    Mt 3E2638        98.9     0.     123.6 FIXEDHF     0.800  0       0.0  0                       
1485    Mu 1D2638       972.3     0.    1215.4 FIXEDHF     0.800  0       0.0  0  4s4d      -4p8f      
1486    Mu 3E2638        85.3     0.     106.6 FIXEDHF     0.800  0       0.0  0                       
1487    Mv 1D2638       815.2     0.    1019.0 FIXEDHF     0.800  0       0.0  0  4s4d      -4p9f      
1488    Mv 3E2638        74.2     0.      92.8 FIXEDHF     0.800  0       0.0  0                       
1489    NO 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s6d      
1490    NO 2E2626       337.6     0.     422.0 FIXEDHF     0.800  0       0.0  0                       
1491    NP 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s7d      
1492    NP 2E2626       263.9     0.     329.9 FIXEDHF     0.800  0       0.0  0                       
1493    NQ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s8d      
1494    NQ 2E2626       213.0     0.     266.2 FIXEDHF     0.800  0       0.0  0                       
1495    NR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s9d      
1496    NR 2E2626       176.2     0.     220.2 FIXEDHF     0.800  0       0.0  0                       
1497    NS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s10d     
1498    NS 2E2626       148.6     0.     185.7 FIXEDHF     0.800  0       0.0  0                       
1499    NT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s11d     
1500    NT 2E2626       127.5     0.     159.4 FIXEDHF     0.800  0       0.0  0                       
1501    NU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s12d     
1502    NU 2E2626       111.0     0.     138.7 FIXEDHF     0.800  0       0.0  0                       
1503    NV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s13d     
1504    NV 2E2626        97.6     0.     122.0 FIXEDHF     0.800  0       0.0  0                       
1505    NW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s14d     
1506    NW 2E2626        86.8     0.     108.5 FIXEDHF     0.800  0       0.0  0                       
1507    NX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4s15d     
1508    NX 2E2626        77.8     0.      97.3 FIXEDHF     0.800  0       0.0  0                       
1509    NY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 4d   
1510    NY 2D1626      -368.1     0.    -460.1 FIXEDHF     0.800  0       0.0  0                       
1511    NY 2E1626       -12.3     0.     -15.4 FIXEDHF     0.800  0       0.0  0                       
1512    NZ 2D1112       702.1     0.     877.6 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 5d   
1513    NZ 2D1626      -281.0     0.    -351.3 FIXEDHF     0.800  0       0.0  0                       
1514    NZ 2E1626       -12.3     0.     -15.4 FIXEDHF     0.800  0       0.0  0                       
1515    Na 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 6d   
1516    Na 2D1626      -190.6     0.    -238.3 FIXEDHF     0.800  0       0.0  0                       
1517    Na 2E1626       -10.3     0.     -12.9 FIXEDHF     0.800  0       0.0  0                       
1518    Nb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 7d   
1519    Nb 2D1626      -141.4     0.    -176.8 FIXEDHF     0.800  0       0.0  0                       
1520    Nb 2E1626        -8.5     0.     -10.6 FIXEDHF     0.800  0       0.0  0                       
1521    Nc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 8d   
1522    Nc 2D1626      -110.4     0.    -138.0 FIXEDHF     0.800  0       0.0  0                       
1523    Nc 2E1626        -7.1     0.      -8.9 FIXEDHF     0.800  0       0.0  0                       
1524    Nd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 9d   
1525    Nd 2D1626       -89.3     0.    -111.6 FIXEDHF     0.800  0       0.0  0                       
1526    Nd 2E1626        -6.0     0.      -7.5 FIXEDHF     0.800  0       0.0  0                       
1527    Ne 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 10d  
1528    Ne 2D1626       -74.2     0.     -92.7 FIXEDHF     0.800  0       0.0  0                       
1529    Ne 2E1626        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0                       
1530    Nf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 11d  
1531    Nf 2D1626       -62.9     0.     -78.6 FIXEDHF     0.800  0       0.0  0                       
1532    Nf 2E1626        -4.4     0.      -5.5 FIXEDHF     0.800  0       0.0  0                       
1533    Ng 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 12d  
1534    Ng 2D1626       -54.2     0.     -67.7 FIXEDHF     0.800  0       0.0  0                       
1535    Ng 2E1626        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
1536    Nh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 13d  
1537    Nh 2D1626       -47.3     0.     -59.1 FIXEDHF     0.800  0       0.0  0                       
1538    Nh 2E1626        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0                       
1539    Ni 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 14d  
1540    Ni 2D1626       -41.8     0.     -52.2 FIXEDHF     0.800  0       0.0  0                       
1541    Ni 2E1626        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
1542    Nj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5d      -d9s2 15d  
1543    Nj 2D1626       -37.2     0.     -46.5 FIXEDHF     0.800  0       0.0  0                       
1544    Nj 2E1626        -2.7     0.      -3.4 FIXEDHF     0.800  0       0.0  0                       
1545    Nk 1D2633      5459.9     0.    6824.9 FIXEDHF     0.800  0       0.0  0  4s5d      -4p2       
1546    Nl 1D2637      -303.0     0.    -378.8 FIXEDHF     0.800  0       0.0  0  4s5d      -4p5p      
1547    Nl 1E2637      1229.4     0.    1536.7 FIXEDHF     0.800  0       0.0  0                       
1548    Nm 1D2637     -1412.8     0.   -1766.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4p6p      
1549    Nm 1E2637       681.5     0.     851.9 FIXEDHF     0.800  0       0.0  0                       
1550    Nn 1D2637      -589.2     0.    -736.5 FIXEDHF     0.800  0       0.0  0  4s5d      -4p7p      
1551    Nn 1E2637       455.0     0.     568.8 FIXEDHF     0.800  0       0.0  0                       
1552    No 1D2637      -390.2     0.    -487.8 FIXEDHF     0.800  0       0.0  0  4s5d      -4p8p      
1553    No 1E2637       333.2     0.     416.5 FIXEDHF     0.800  0       0.0  0                       
1554    Np 1D2637      -288.6     0.    -360.8 FIXEDHF     0.800  0       0.0  0  4s5d      -4p9p      
1555    Np 1E2637       258.2     0.     322.7 FIXEDHF     0.800  0       0.0  0                       
1556    Nq 1D2638       -61.9     0.     -77.4 FIXEDHF     0.800  0       0.0  0  4s5d      -4p4f      
1557    Nq 3E2638        98.6     0.     123.2 FIXEDHF     0.800  0       0.0  0                       
1558    Nr 1D2638       795.2     0.     994.0 FIXEDHF     0.800  0       0.0  0  4s5d      -4p5f      
1559    Nr 3E2638        93.0     0.     116.3 FIXEDHF     0.800  0       0.0  0                       
1560    Ns 1D2638       725.8     0.     907.3 FIXEDHF     0.800  0       0.0  0  4s5d      -4p6f      
1561    Ns 3E2638        80.8     0.     101.0 FIXEDHF     0.800  0       0.0  0                       
1562    Nt 1D2638       617.4     0.     771.8 FIXEDHF     0.800  0       0.0  0  4s5d      -4p7f      
1563    Nt 3E2638        69.4     0.      86.8 FIXEDHF     0.800  0       0.0  0                       
1564    Nu 1D2638       524.7     0.     655.9 FIXEDHF     0.800  0       0.0  0  4s5d      -4p8f      
1565    Nu 3E2638        60.0     0.      75.0 FIXEDHF     0.800  0       0.0  0                       
1566    Nv 1D2638       450.5     0.     563.1 FIXEDHF     0.800  0       0.0  0  4s5d      -4p9f      
1567    Nv 3E2638        52.2     0.      65.3 FIXEDHF     0.800  0       0.0  0                       
1568    OP 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s7d      
1569    OP 2E2626       199.3     0.     249.1 FIXEDHF     0.800  0       0.0  0                       
1570    OQ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s8d      
1571    OQ 2E2626       160.8     0.     201.0 FIXEDHF     0.800  0       0.0  0                       
1572    OR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s9d      
1573    OR 2E2626       133.0     0.     166.3 FIXEDHF     0.800  0       0.0  0                       
1574    OS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s10d     
1575    OS 2E2626       112.2     0.     140.3 FIXEDHF     0.800  0       0.0  0                       
1576    OT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s11d     
1577    OT 2E2626        96.3     0.     120.4 FIXEDHF     0.800  0       0.0  0                       
1578    OU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s12d     
1579    OU 2E2626        83.8     0.     104.8 FIXEDHF     0.800  0       0.0  0                       
1580    OV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s13d     
1581    OV 2E2626        73.8     0.      92.2 FIXEDHF     0.800  0       0.0  0                       
1582    OW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s14d     
1583    OW 2E2626        65.6     0.      82.0 FIXEDHF     0.800  0       0.0  0                       
1584    OX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -4s15d     
1585    OX 2E2626        58.8     0.      73.5 FIXEDHF     0.800  0       0.0  0                       
1586    OY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 4d   
1587    OY 2D1626      -249.5     0.    -311.9 FIXEDHF     0.800  0       0.0  0                       
1588    OY 2E1626        -8.6     0.     -10.7 FIXEDHF     0.800  0       0.0  0                       
1589    OZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 5d   
1590    OZ 2D1626      -191.1     0.    -238.9 FIXEDHF     0.800  0       0.0  0                       
1591    OZ 2E1626        -8.9     0.     -11.1 FIXEDHF     0.800  0       0.0  0                       
1592    Oa 2D1112       703.6     0.     879.5 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 6d   
1593    Oa 2D1626      -144.9     0.    -181.1 FIXEDHF     0.800  0       0.0  0                       
1594    Oa 2E1626        -7.5     0.      -9.4 FIXEDHF     0.800  0       0.0  0                       
1595    Ob 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 7d   
1596    Ob 2D1626      -107.4     0.    -134.2 FIXEDHF     0.800  0       0.0  0                       
1597    Ob 2E1626        -6.2     0.      -7.8 FIXEDHF     0.800  0       0.0  0                       
1598    Oc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 8d   
1599    Oc 2D1626       -84.0     0.    -105.0 FIXEDHF     0.800  0       0.0  0                       
1600    Oc 2E1626        -5.2     0.      -6.5 FIXEDHF     0.800  0       0.0  0                       
1601    Od 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 9d   
1602    Od 2D1626       -68.1     0.     -85.1 FIXEDHF     0.800  0       0.0  0                       
1603    Od 2E1626        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0                       
1604    Oe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 10d  
1605    Oe 2D1626       -56.6     0.     -70.7 FIXEDHF     0.800  0       0.0  0                       
1606    Oe 2E1626        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
1607    Of 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 11d  
1608    Of 2D1626       -48.0     0.     -60.0 FIXEDHF     0.800  0       0.0  0                       
1609    Of 2E1626        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0                       
1610    Og 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 12d  
1611    Og 2D1626       -41.4     0.     -51.8 FIXEDHF     0.800  0       0.0  0                       
1612    Og 2E1626        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
1613    Oh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 13d  
1614    Oh 2D1626       -36.2     0.     -45.2 FIXEDHF     0.800  0       0.0  0                       
1615    Oh 2E1626        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1616    Oi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 14d  
1617    Oi 2D1626       -32.0     0.     -40.0 FIXEDHF     0.800  0       0.0  0                       
1618    Oi 2E1626        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
1619    Oj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6d      -d9s2 15d  
1620    Oj 2D1626       -28.6     0.     -35.7 FIXEDHF     0.800  0       0.0  0                       
1621    Oj 2E1626        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0                       
1622    Ok 1D2633      3983.5     0.    4979.4 FIXEDHF     0.800  0       0.0  0  4s6d      -4p2       
1623    Ol 1D2637       159.7     0.     199.6 FIXEDHF     0.800  0       0.0  0  4s6d      -4p5p      
1624    Ol 1E2637       927.3     0.    1159.1 FIXEDHF     0.800  0       0.0  0                       
1625    Om 1D2637      -434.5     0.    -543.1 FIXEDHF     0.800  0       0.0  0  4s6d      -4p6p      
1626    Om 1E2637       515.9     0.     644.9 FIXEDHF     0.800  0       0.0  0                       
1627    On 1D2637      -701.1     0.    -876.4 FIXEDHF     0.800  0       0.0  0  4s6d      -4p7p      
1628    On 1E2637       345.0     0.     431.3 FIXEDHF     0.800  0       0.0  0                       
1629    Oo 1D2637      -345.0     0.    -431.3 FIXEDHF     0.800  0       0.0  0  4s6d      -4p8p      
1630    Oo 1E2637       252.8     0.     316.0 FIXEDHF     0.800  0       0.0  0                       
1631    Op 1D2637      -243.8     0.    -304.7 FIXEDHF     0.800  0       0.0  0  4s6d      -4p9p      
1632    Op 1E2637       196.0     0.     245.0 FIXEDHF     0.800  0       0.0  0                       
1633    Oq 1D2638        62.6     0.      78.3 FIXEDHF     0.800  0       0.0  0  4s6d      -4p4f      
1634    Oq 3E2638        72.1     0.      90.1 FIXEDHF     0.800  0       0.0  0                       
1635    Or 1D2638       -40.6     0.     -50.7 FIXEDHF     0.800  0       0.0  0  4s6d      -4p5f      
1636    Or 3E2638        68.2     0.      85.2 FIXEDHF     0.800  0       0.0  0                       
1637    Os 1D2638       294.6     0.     368.2 FIXEDHF     0.800  0       0.0  0  4s6d      -4p6f      
1638    Os 3E2638        59.3     0.      74.1 FIXEDHF     0.800  0       0.0  0                       
1639    Ot 1D2638       305.8     0.     382.2 FIXEDHF     0.800  0       0.0  0  4s6d      -4p7f      
1640    Ot 3E2638        51.0     0.      63.7 FIXEDHF     0.800  0       0.0  0                       
1641    Ou 1D2638       280.2     0.     350.2 FIXEDHF     0.800  0       0.0  0  4s6d      -4p8f      
1642    Ou 3E2638        44.0     0.      55.0 FIXEDHF     0.800  0       0.0  0                       
1643    Ov 1D2638       250.3     0.     312.9 FIXEDHF     0.800  0       0.0  0  4s6d      -4p9f      
1644    Ov 3E2638        38.4     0.      48.0 FIXEDHF     0.800  0       0.0  0                       
1645    PQ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s8d      
1646    PQ 2E2626       125.8     0.     157.3 FIXEDHF     0.800  0       0.0  0                       
1647    PR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s9d      
1648    PR 2E2626       104.2     0.     130.2 FIXEDHF     0.800  0       0.0  0                       
1649    PS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s10d     
1650    PS 2E2626        87.8     0.     109.8 FIXEDHF     0.800  0       0.0  0                       
1651    PT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s11d     
1652    PT 2E2626        75.4     0.      94.3 FIXEDHF     0.800  0       0.0  0                       
1653    PU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s12d     
1654    PU 2E2626        65.7     0.      82.1 FIXEDHF     0.800  0       0.0  0                       
1655    PV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s13d     
1656    PV 2E2626        57.8     0.      72.2 FIXEDHF     0.800  0       0.0  0                       
1657    PW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s14d     
1658    PW 2E2626        51.4     0.      64.2 FIXEDHF     0.800  0       0.0  0                       
1659    PX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -4s15d     
1660    PX 2E2626        46.1     0.      57.6 FIXEDHF     0.800  0       0.0  0                       
1661    PY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 4d   
1662    PY 2D1626      -184.3     0.    -230.4 FIXEDHF     0.800  0       0.0  0                       
1663    PY 2E1626        -6.4     0.      -8.0 FIXEDHF     0.800  0       0.0  0                       
1664    PZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 5d   
1665    PZ 2D1626      -142.1     0.    -177.6 FIXEDHF     0.800  0       0.0  0                       
1666    PZ 2E1626        -6.7     0.      -8.4 FIXEDHF     0.800  0       0.0  0                       
1667    Pa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 6d   
1668    Pa 2D1626      -107.7     0.    -134.6 FIXEDHF     0.800  0       0.0  0                       
1669    Pa 2E1626        -5.8     0.      -7.2 FIXEDHF     0.800  0       0.0  0                       
1670    Pb 2D1112       704.5     0.     880.6 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 7d   
1671    Pb 2D1626       -84.2     0.    -105.2 FIXEDHF     0.800  0       0.0  0                       
1672    Pb 2E1626        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0                       
1673    Pc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 8d   
1674    Pc 2D1626       -65.8     0.     -82.2 FIXEDHF     0.800  0       0.0  0                       
1675    Pc 2E1626        -3.9     0.      -4.9 FIXEDHF     0.800  0       0.0  0                       
1676    Pd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 9d   
1677    Pd 2D1626       -53.3     0.     -66.6 FIXEDHF     0.800  0       0.0  0                       
1678    Pd 2E1626        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1679    Pe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 10d  
1680    Pe 2D1626       -44.4     0.     -55.5 FIXEDHF     0.800  0       0.0  0                       
1681    Pe 2E1626        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
1682    Pf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 11d  
1683    Pf 2D1626       -37.7     0.     -47.1 FIXEDHF     0.800  0       0.0  0                       
1684    Pf 2E1626        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1685    Pg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 12d  
1686    Pg 2D1626       -32.6     0.     -40.7 FIXEDHF     0.800  0       0.0  0                       
1687    Pg 2E1626        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1688    Ph 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 13d  
1689    Ph 2D1626       -28.4     0.     -35.5 FIXEDHF     0.800  0       0.0  0                       
1690    Ph 2E1626        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
1691    Pi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 14d  
1692    Pi 2D1626       -25.1     0.     -31.4 FIXEDHF     0.800  0       0.0  0                       
1693    Pi 2E1626        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
1694    Pj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7d      -d9s2 15d  
1695    Pj 2D1626       -22.4     0.     -28.0 FIXEDHF     0.800  0       0.0  0                       
1696    Pj 2E1626        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
1697    Pk 1D2633      3058.1     0.    3822.6 FIXEDHF     0.800  0       0.0  0  4s7d      -4p2       
1698    Pl 1D2637       257.1     0.     321.4 FIXEDHF     0.800  0       0.0  0  4s7d      -4p5p      
1699    Pl 1E2637       725.0     0.     906.2 FIXEDHF     0.800  0       0.0  0                       
1700    Pm 1D2637      -180.5     0.    -225.6 FIXEDHF     0.800  0       0.0  0  4s7d      -4p6p      
1701    Pm 1E2637       404.2     0.     505.3 FIXEDHF     0.800  0       0.0  0                       
1702    Pn 1D2637      -307.4     0.    -384.3 FIXEDHF     0.800  0       0.0  0  4s7d      -4p7p      
1703    Pn 1E2637       270.6     0.     338.2 FIXEDHF     0.800  0       0.0  0                       
1704    Po 1D2637      -396.2     0.    -495.3 FIXEDHF     0.800  0       0.0  0  4s7d      -4p8p      
1705    Po 1E2637       198.3     0.     247.9 FIXEDHF     0.800  0       0.0  0                       
1706    Pp 1D2637      -217.5     0.    -271.9 FIXEDHF     0.800  0       0.0  0  4s7d      -4p9p      
1707    Pp 1E2637       153.8     0.     192.3 FIXEDHF     0.800  0       0.0  0                       
1708    Pq 1D2638        50.0     0.      62.5 FIXEDHF     0.800  0       0.0  0  4s7d      -4p4f      
1709    Pq 3E2638        55.4     0.      69.2 FIXEDHF     0.800  0       0.0  0                       
1710    Pr 1D2638        39.8     0.      49.7 FIXEDHF     0.800  0       0.0  0  4s7d      -4p5f      
1711    Pr 3E2638        52.4     0.      65.5 FIXEDHF     0.800  0       0.0  0                       
1712    Ps 1D2638       -26.0     0.     -32.5 FIXEDHF     0.800  0       0.0  0  4s7d      -4p6f      
1713    Ps 3E2638        45.6     0.      57.0 FIXEDHF     0.800  0       0.0  0                       
1714    Pt 1D2638       129.2     0.     161.5 FIXEDHF     0.800  0       0.0  0  4s7d      -4p7f      
1715    Pt 3E2638        39.2     0.      49.0 FIXEDHF     0.800  0       0.0  0                       
1716    Pu 1D2638       145.9     0.     182.4 FIXEDHF     0.800  0       0.0  0  4s7d      -4p8f      
1717    Pu 3E2638        33.9     0.      42.4 FIXEDHF     0.800  0       0.0  0                       
1718    Pv 1D2638       141.0     0.     176.3 FIXEDHF     0.800  0       0.0  0  4s7d      -4p9f      
1719    Pv 3E2638        29.5     0.      36.9 FIXEDHF     0.800  0       0.0  0                       
1720    QR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s9d      
1721    QR 2E2626        84.1     0.     105.1 FIXEDHF     0.800  0       0.0  0                       
1722    QS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s10d     
1723    QS 2E2626        71.0     0.      88.7 FIXEDHF     0.800  0       0.0  0                       
1724    QT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s11d     
1725    QT 2E2626        60.9     0.      76.1 FIXEDHF     0.800  0       0.0  0                       
1726    QU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s12d     
1727    QU 2E2626        53.0     0.      66.3 FIXEDHF     0.800  0       0.0  0                       
1728    QV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s13d     
1729    QV 2E2626        46.6     0.      58.3 FIXEDHF     0.800  0       0.0  0                       
1730    QW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s14d     
1731    QW 2E2626        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0                       
1732    QX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -4s15d     
1733    QX 2E2626        37.2     0.      46.5 FIXEDHF     0.800  0       0.0  0                       
1734    QY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 4d   
1735    QY 2D1626      -143.5     0.    -179.4 FIXEDHF     0.800  0       0.0  0                       
1736    QY 2E1626        -5.0     0.      -6.2 FIXEDHF     0.800  0       0.0  0                       
1737    QZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 5d   
1738    QZ 2D1626      -111.1     0.    -138.9 FIXEDHF     0.800  0       0.0  0                       
1739    QZ 2E1626        -5.4     0.      -6.7 FIXEDHF     0.800  0       0.0  0                       
1740    Qa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 6d   
1741    Qa 2D1626       -84.5     0.    -105.6 FIXEDHF     0.800  0       0.0  0                       
1742    Qa 2E1626        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
1743    Qb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 7d   
1744    Qb 2D1626       -65.9     0.     -82.4 FIXEDHF     0.800  0       0.0  0                       
1745    Qb 2E1626        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
1746    Qc 2D1112       705.0     0.     881.2 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 8d   
1747    Qc 2D1626       -53.0     0.     -66.3 FIXEDHF     0.800  0       0.0  0                       
1748    Qc 2E1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
1749    Qd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 9d   
1750    Qd 2D1626       -43.0     0.     -53.7 FIXEDHF     0.800  0       0.0  0                       
1751    Qd 2E1626        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
1752    Qe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 10d  
1753    Qe 2D1626       -35.8     0.     -44.8 FIXEDHF     0.800  0       0.0  0                       
1754    Qe 2E1626        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
1755    Qf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 11d  
1756    Qf 2D1626       -30.4     0.     -38.0 FIXEDHF     0.800  0       0.0  0                       
1757    Qf 2E1626        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0                       
1758    Qg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 12d  
1759    Qg 2D1626       -26.2     0.     -32.8 FIXEDHF     0.800  0       0.0  0                       
1760    Qg 2E1626        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
1761    Qh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 13d  
1762    Qh 2D1626       -23.0     0.     -28.7 FIXEDHF     0.800  0       0.0  0                       
1763    Qh 2E1626        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
1764    Qi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 14d  
1765    Qi 2D1626       -20.3     0.     -25.4 FIXEDHF     0.800  0       0.0  0                       
1766    Qi 2E1626        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1767    Qj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8d      -d9s2 15d  
1768    Qj 2D1626       -18.2     0.     -22.7 FIXEDHF     0.800  0       0.0  0                       
1769    Qj 2E1626        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1770    Qk 1D2633      2438.2     0.    3047.8 FIXEDHF     0.800  0       0.0  0  4s8d      -4p2       
1771    Ql 1D2637       266.6     0.     333.3 FIXEDHF     0.800  0       0.0  0  4s8d      -4p5p      
1772    Ql 1E2637       584.7     0.     730.9 FIXEDHF     0.800  0       0.0  0                       
1773    Qm 1D2637       -79.8     0.     -99.7 FIXEDHF     0.800  0       0.0  0  4s8d      -4p6p      
1774    Qm 1E2637       326.5     0.     408.1 FIXEDHF     0.800  0       0.0  0                       
1775    Qn 1D2637      -176.3     0.    -220.4 FIXEDHF     0.800  0       0.0  0  4s8d      -4p7p      
1776    Qn 1E2637       218.6     0.     273.3 FIXEDHF     0.800  0       0.0  0                       
1777    Qo 1D2637      -209.0     0.    -261.2 FIXEDHF     0.800  0       0.0  0  4s8d      -4p8p      
1778    Qo 1E2637       160.3     0.     200.4 FIXEDHF     0.800  0       0.0  0                       
1779    Qp 1D2637      -245.0     0.    -306.2 FIXEDHF     0.800  0       0.0  0  4s8d      -4p9p      
1780    Qp 1E2637       124.3     0.     155.4 FIXEDHF     0.800  0       0.0  0                       
1781    Qq 1D2638        37.8     0.      47.3 FIXEDHF     0.800  0       0.0  0  4s8d      -4p4f      
1782    Qq 3E2638        44.2     0.      55.2 FIXEDHF     0.800  0       0.0  0                       
1783    Qr 1D2638        36.1     0.      45.1 FIXEDHF     0.800  0       0.0  0  4s8d      -4p5f      
1784    Qr 3E2638        41.8     0.      52.3 FIXEDHF     0.800  0       0.0  0                       
1785    Qs 1D2638        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0  4s8d      -4p6f      
1786    Qs 3E2638        36.4     0.      45.5 FIXEDHF     0.800  0       0.0  0                       
1787    Qt 1D2638       -17.2     0.     -21.5 FIXEDHF     0.800  0       0.0  0  4s8d      -4p7f      
1788    Qt 3E2638        31.3     0.      39.1 FIXEDHF     0.800  0       0.0  0                       
1789    Qu 1D2638        63.7     0.      79.6 FIXEDHF     0.800  0       0.0  0  4s8d      -4p8f      
1790    Qu 3E2638        27.0     0.      33.8 FIXEDHF     0.800  0       0.0  0                       
1791    Qv 1D2638        76.7     0.      95.9 FIXEDHF     0.800  0       0.0  0  4s8d      -4p9f      
1792    Qv 3E2638        23.6     0.      29.5 FIXEDHF     0.800  0       0.0  0                       
1793    RS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s10d     
1794    RS 2E2626        58.7     0.      73.4 FIXEDHF     0.800  0       0.0  0                       
1795    RT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s11d     
1796    RT 2E2626        50.4     0.      63.0 FIXEDHF     0.800  0       0.0  0                       
1797    RU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s12d     
1798    RU 2E2626        43.8     0.      54.8 FIXEDHF     0.800  0       0.0  0                       
1799    RV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s13d     
1800    RV 2E2626        38.6     0.      48.3 FIXEDHF     0.800  0       0.0  0                       
1801    RW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s14d     
1802    RW 2E2626        34.3     0.      42.9 FIXEDHF     0.800  0       0.0  0                       
1803    RX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4s15d     
1804    RX 2E2626        30.8     0.      38.5 FIXEDHF     0.800  0       0.0  0                       
1805    RY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 4d   
1806    RY 2D1626      -115.9     0.    -144.9 FIXEDHF     0.800  0       0.0  0                       
1807    RY 2E1626        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
1808    RZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 5d   
1809    RZ 2D1626       -90.1     0.    -112.6 FIXEDHF     0.800  0       0.0  0                       
1810    RZ 2E1626        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0                       
1811    Ra 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 6d   
1812    Ra 2D1626       -68.6     0.     -85.7 FIXEDHF     0.800  0       0.0  0                       
1813    Ra 2E1626        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
1814    Rb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 7d   
1815    Rb 2D1626       -53.6     0.     -67.0 FIXEDHF     0.800  0       0.0  0                       
1816    Rb 2E1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
1817    Rc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 8d   
1818    Rc 2D1626       -43.1     0.     -53.9 FIXEDHF     0.800  0       0.0  0                       
1819    Rc 2E1626        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1820    Rd 2D1112       705.3     0.     881.6 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 9d   
1821    Rd 2D1626       -35.6     0.     -44.5 FIXEDHF     0.800  0       0.0  0                       
1822    Rd 2E1626        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1823    Re 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 10d  
1824    Re 2D1626       -29.6     0.     -37.0 FIXEDHF     0.800  0       0.0  0                       
1825    Re 2E1626        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1826    Rf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 11d  
1827    Rf 2D1626       -25.1     0.     -31.4 FIXEDHF     0.800  0       0.0  0                       
1828    Rf 2E1626        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1829    Rg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 12d  
1830    Rg 2D1626       -21.7     0.     -27.1 FIXEDHF     0.800  0       0.0  0                       
1831    Rg 2E1626        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1832    Rh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 13d  
1833    Rh 2D1626       -19.0     0.     -23.7 FIXEDHF     0.800  0       0.0  0                       
1834    Rh 2E1626        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
1835    Ri 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 14d  
1836    Ri 2D1626       -16.8     0.     -21.0 FIXEDHF     0.800  0       0.0  0                       
1837    Ri 2E1626        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1838    Rj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9d      -d9s2 15d  
1839    Rj 2D1626       -15.0     0.     -18.8 FIXEDHF     0.800  0       0.0  0                       
1840    Rj 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1841    Rk 1D2633      2001.0     0.    2501.2 FIXEDHF     0.800  0       0.0  0  4s9d      -4p2       
1842    Rl 1D2637       251.8     0.     314.7 FIXEDHF     0.800  0       0.0  0  4s9d      -4p5p      
1843    Rl 1E2637       483.6     0.     604.5 FIXEDHF     0.800  0       0.0  0                       
1844    Rm 1D2637       -32.7     0.     -40.9 FIXEDHF     0.800  0       0.0  0  4s9d      -4p6p      
1845    Rm 1E2637       270.2     0.     337.8 FIXEDHF     0.800  0       0.0  0                       
1846    Rn 1D2637      -112.6     0.    -140.8 FIXEDHF     0.800  0       0.0  0  4s9d      -4p7p      
1847    Rn 1E2637       181.0     0.     226.3 FIXEDHF     0.800  0       0.0  0                       
1848    Ro 1D2637      -136.8     0.    -171.0 FIXEDHF     0.800  0       0.0  0  4s9d      -4p8p      
1849    Ro 1E2637       132.8     0.     166.0 FIXEDHF     0.800  0       0.0  0                       
1850    Rp 1D2637      -145.0     0.    -181.3 FIXEDHF     0.800  0       0.0  0  4s9d      -4p9p      
1851    Rp 1E2637       103.0     0.     128.7 FIXEDHF     0.800  0       0.0  0                       
1852    Rq 1D2638        29.2     0.      36.5 FIXEDHF     0.800  0       0.0  0  4s9d      -4p4f      
1853    Rq 3E2638        36.2     0.      45.3 FIXEDHF     0.800  0       0.0  0                       
1854    Rr 1D2638        29.5     0.      36.9 FIXEDHF     0.800  0       0.0  0  4s9d      -4p5f      
1855    Rr 3E2638        34.3     0.      42.9 FIXEDHF     0.800  0       0.0  0                       
1856    Rs 1D2638        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0  4s9d      -4p6f      
1857    Rs 3E2638        29.9     0.      37.4 FIXEDHF     0.800  0       0.0  0                       
1858    Rt 1D2638        14.6     0.      18.2 FIXEDHF     0.800  0       0.0  0  4s9d      -4p7f      
1859    Rt 3E2638        25.8     0.      32.2 FIXEDHF     0.800  0       0.0  0                       
1860    Ru 1D2638       -11.8     0.     -14.8 FIXEDHF     0.800  0       0.0  0  4s9d      -4p8f      
1861    Ru 3E2638        22.2     0.      27.8 FIXEDHF     0.800  0       0.0  0                       
1862    Rv 1D2638        34.2     0.      42.8 FIXEDHF     0.800  0       0.0  0  4s9d      -4p9f      
1863    Rv 3E2638        19.4     0.      24.2 FIXEDHF     0.800  0       0.0  0                       
1864    ST 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4s11d     
1865    ST 2E2626        42.6     0.      53.2 FIXEDHF     0.800  0       0.0  0                       
1866    SU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4s12d     
1867    SU 2E2626        37.0     0.      46.3 FIXEDHF     0.800  0       0.0  0                       
1868    SV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4s13d     
1869    SV 2E2626        32.6     0.      40.7 FIXEDHF     0.800  0       0.0  0                       
1870    SW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4s14d     
1871    SW 2E2626        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0                       
1872    SX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4s15d     
1873    SX 2E2626        26.0     0.      32.5 FIXEDHF     0.800  0       0.0  0                       
1874    SY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 4d   
1875    SY 2D1626       -96.2     0.    -120.2 FIXEDHF     0.800  0       0.0  0                       
1876    SY 2E1626        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1877    SZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 5d   
1878    SZ 2D1626       -74.9     0.     -93.6 FIXEDHF     0.800  0       0.0  0                       
1879    SZ 2E1626        -3.6     0.      -4.5 FIXEDHF     0.800  0       0.0  0                       
1880    Sa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 6d   
1881    Sa 2D1626       -57.1     0.     -71.4 FIXEDHF     0.800  0       0.0  0                       
1882    Sa 2E1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
1883    Sb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 7d   
1884    Sb 2D1626       -44.6     0.     -55.8 FIXEDHF     0.800  0       0.0  0                       
1885    Sb 2E1626        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1886    Sc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 8d   
1887    Sc 2D1626       -35.9     0.     -44.9 FIXEDHF     0.800  0       0.0  0                       
1888    Sc 2E1626        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1889    Sd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 9d   
1890    Sd 2D1626       -29.6     0.     -37.0 FIXEDHF     0.800  0       0.0  0                       
1891    Sd 2E1626        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1892    Se 2D1112       705.4     0.     881.8 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 10d  
1893    Se 2D1626       -25.0     0.     -31.2 FIXEDHF     0.800  0       0.0  0                       
1894    Se 2E1626        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1895    Sf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 11d  
1896    Sf 2D1626       -21.2     0.     -26.5 FIXEDHF     0.800  0       0.0  0                       
1897    Sf 2E1626        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1898    Sg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 12d  
1899    Sg 2D1626       -18.3     0.     -22.9 FIXEDHF     0.800  0       0.0  0                       
1900    Sg 2E1626        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1901    Sh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 13d  
1902    Sh 2D1626       -16.0     0.     -20.0 FIXEDHF     0.800  0       0.0  0                       
1903    Sh 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1904    Si 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 14d  
1905    Si 2D1626       -14.2     0.     -17.7 FIXEDHF     0.800  0       0.0  0                       
1906    Si 2E1626        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
1907    Sj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10d     -d9s2 15d  
1908    Sj 2D1626       -12.6     0.     -15.8 FIXEDHF     0.800  0       0.0  0                       
1909    Sj 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
1910    Sk 1D2633      1678.2     0.    2097.7 FIXEDHF     0.800  0       0.0  0  4s10d     -4p2       
1911    Sl 1D2637       230.0     0.     287.5 FIXEDHF     0.800  0       0.0  0  4s10d     -4p5p      
1912    Sl 1E2637       407.7     0.     509.6 FIXEDHF     0.800  0       0.0  0                       
1913    Sm 1D2637        -9.2     0.     -11.5 FIXEDHF     0.800  0       0.0  0  4s10d     -4p6p      
1914    Sm 1E2637       228.0     0.     285.0 FIXEDHF     0.800  0       0.0  0                       
1915    Sn 1D2637       -77.3     0.     -96.6 FIXEDHF     0.800  0       0.0  0  4s10d     -4p7p      
1916    Sn 1E2637       152.7     0.     190.9 FIXEDHF     0.800  0       0.0  0                       
1917    So 1D2637       -97.7     0.    -122.1 FIXEDHF     0.800  0       0.0  0  4s10d     -4p8p      
1918    So 1E2637       112.1     0.     140.1 FIXEDHF     0.800  0       0.0  0                       
1919    Sp 1D2637      -102.7     0.    -128.4 FIXEDHF     0.800  0       0.0  0  4s10d     -4p9p      
1920    Sp 1E2637        87.0     0.     108.7 FIXEDHF     0.800  0       0.0  0                       
1921    Sq 1D2638        23.2     0.      29.0 FIXEDHF     0.800  0       0.0  0  4s10d     -4p4f      
1922    Sq 3E2638        30.4     0.      38.0 FIXEDHF     0.800  0       0.0  0                       
1923    Sr 1D2638        24.1     0.      30.1 FIXEDHF     0.800  0       0.0  0  4s10d     -4p5f      
1924    Sr 3E2638        28.8     0.      36.0 FIXEDHF     0.800  0       0.0  0                       
1925    Ss 1D2638        20.7     0.      25.9 FIXEDHF     0.800  0       0.0  0  4s10d     -4p6f      
1926    Ss 3E2638        25.1     0.      31.4 FIXEDHF     0.800  0       0.0  0                       
1927    St 1D2638        15.8     0.      19.7 FIXEDHF     0.800  0       0.0  0  4s10d     -4p7f      
1928    St 3E2638        21.6     0.      27.0 FIXEDHF     0.800  0       0.0  0                       
1929    Su 1D2638         9.2     0.      11.5 FIXEDHF     0.800  0       0.0  0  4s10d     -4p8f      
1930    Su 3E2638        18.6     0.      23.3 FIXEDHF     0.800  0       0.0  0                       
1931    Sv 1D2638        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0  4s10d     -4p9f      
1932    Sv 3E2638        16.3     0.      20.4 FIXEDHF     0.800  0       0.0  0                       
1933    TU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -4s12d     
1934    TU 2E2626        31.8     0.      39.7 FIXEDHF     0.800  0       0.0  0                       
1935    TV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -4s13d     
1936    TV 2E2626        28.0     0.      35.0 FIXEDHF     0.800  0       0.0  0                       
1937    TW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -4s14d     
1938    TW 2E2626        24.9     0.      31.1 FIXEDHF     0.800  0       0.0  0                       
1939    TX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -4s15d     
1940    TX 2E2626        22.3     0.      27.9 FIXEDHF     0.800  0       0.0  0                       
1941    TY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 4d   
1942    TY 2D1626       -81.4     0.    -101.8 FIXEDHF     0.800  0       0.0  0                       
1943    TY 2E1626        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
1944    TZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 5d   
1945    TZ 2D1626       -63.5     0.     -79.4 FIXEDHF     0.800  0       0.0  0                       
1946    TZ 2E1626        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
1947    Ta 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 6d   
1948    Ta 2D1626       -48.6     0.     -60.7 FIXEDHF     0.800  0       0.0  0                       
1949    Ta 2E1626        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
1950    Tb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 7d   
1951    Tb 2D1626       -38.0     0.     -47.5 FIXEDHF     0.800  0       0.0  0                       
1952    Tb 2E1626        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
1953    Tc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 8d   
1954    Tc 2D1626       -30.6     0.     -38.2 FIXEDHF     0.800  0       0.0  0                       
1955    Tc 2E1626        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1956    Td 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 9d   
1957    Td 2D1626       -25.2     0.     -31.5 FIXEDHF     0.800  0       0.0  0                       
1958    Td 2E1626        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
1959    Te 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 10d  
1960    Te 2D1626       -21.2     0.     -26.5 FIXEDHF     0.800  0       0.0  0                       
1961    Te 2E1626        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1962    Tf 2D1112       705.6     0.     882.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 11d  
1963    Tf 2D1626       -18.2     0.     -22.7 FIXEDHF     0.800  0       0.0  0                       
1964    Tf 2E1626        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1965    Tg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 12d  
1966    Tg 2D1626       -15.7     0.     -19.6 FIXEDHF     0.800  0       0.0  0                       
1967    Tg 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1968    Th 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 13d  
1969    Th 2D1626       -13.8     0.     -17.2 FIXEDHF     0.800  0       0.0  0                       
1970    Th 2E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
1971    Ti 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 14d  
1972    Ti 2D1626       -12.2     0.     -15.2 FIXEDHF     0.800  0       0.0  0                       
1973    Ti 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
1974    Tj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11d     -d9s2 15d  
1975    Tj 2D1626       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0                       
1976    Tj 2E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
1977    Tk 1D2633      1434.1     0.    1792.6 FIXEDHF     0.800  0       0.0  0  4s11d     -4p2       
1978    Tl 1D2637       209.0     0.     261.2 FIXEDHF     0.800  0       0.0  0  4s11d     -4p5p      
1979    Tl 1E2637       349.9     0.     437.4 FIXEDHF     0.800  0       0.0  0                       
1980    Tm 1D2637         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0  4s11d     -4p6p      
1981    Tm 1E2637       195.8     0.     244.7 FIXEDHF     0.800  0       0.0  0                       
1982    Tn 1D2637       -55.4     0.     -69.3 FIXEDHF     0.800  0       0.0  0  4s11d     -4p7p      
1983    Tn 1E2637       131.2     0.     164.0 FIXEDHF     0.800  0       0.0  0                       
1984    To 1D2637       -73.4     0.     -91.8 FIXEDHF     0.800  0       0.0  0  4s11d     -4p8p      
1985    To 1E2637        96.2     0.     120.3 FIXEDHF     0.800  0       0.0  0                       
1986    Tp 1D2637       -77.7     0.     -97.1 FIXEDHF     0.800  0       0.0  0  4s11d     -4p9p      
1987    Tp 1E2637        74.6     0.      93.3 FIXEDHF     0.800  0       0.0  0                       
1988    Tq 1D2638        18.8     0.      23.5 FIXEDHF     0.800  0       0.0  0  4s11d     -4p4f      
1989    Tq 3E2638        26.0     0.      32.5 FIXEDHF     0.800  0       0.0  0                       
1990    Tr 1D2638        19.8     0.      24.8 FIXEDHF     0.800  0       0.0  0  4s11d     -4p5f      
1991    Tr 3E2638        24.6     0.      30.8 FIXEDHF     0.800  0       0.0  0                       
1992    Ts 1D2638        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0  4s11d     -4p6f      
1993    Ts 3E2638        21.4     0.      26.8 FIXEDHF     0.800  0       0.0  0                       
1994    Tt 1D2638        14.2     0.      17.8 FIXEDHF     0.800  0       0.0  0  4s11d     -4p7f      
1995    Tt 3E2638        18.5     0.      23.1 FIXEDHF     0.800  0       0.0  0                       
1996    Tu 1D2638        10.6     0.      13.2 FIXEDHF     0.800  0       0.0  0  4s11d     -4p8f      
1997    Tu 3E2638        16.0     0.      20.0 FIXEDHF     0.800  0       0.0  0                       
1998    Tv 1D2638         5.9     0.       7.4 FIXEDHF     0.800  0       0.0  0  4s11d     -4p9f      
1999    Tv 3E2638        13.9     0.      17.4 FIXEDHF     0.800  0       0.0  0                       
2000    UV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -4s13d     
2001    UV 2E2626        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0                       
2002    UW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -4s14d     
2003    UW 2E2626        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
2004    UX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -4s15d     
2005    UX 2E2626        19.4     0.      24.3 FIXEDHF     0.800  0       0.0  0                       
2006    UY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 4d   
2007    UY 2D1626       -70.2     0.     -87.7 FIXEDHF     0.800  0       0.0  0                       
2008    UY 2E1626        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
2009    UZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 5d   
2010    UZ 2D1626       -54.8     0.     -68.5 FIXEDHF     0.800  0       0.0  0                       
2011    UZ 2E1626        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
2012    Ua 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 6d   
2013    Ua 2D1626       -41.9     0.     -52.4 FIXEDHF     0.800  0       0.0  0                       
2014    Ua 2E1626        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
2015    Ub 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 7d   
2016    Ub 2D1626       -32.8     0.     -41.0 FIXEDHF     0.800  0       0.0  0                       
2017    Ub 2E1626        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
2018    Uc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 8d   
2019    Uc 2D1626       -26.4     0.     -33.0 FIXEDHF     0.800  0       0.0  0                       
2020    Uc 2E1626        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2021    Ud 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 9d   
2022    Ud 2D1626       -21.8     0.     -27.3 FIXEDHF     0.800  0       0.0  0                       
2023    Ud 2E1626        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2024    Ue 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 10d  
2025    Ue 2D1626       -18.4     0.     -23.0 FIXEDHF     0.800  0       0.0  0                       
2026    Ue 2E1626        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
2027    Uf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 11d  
2028    Uf 2D1626       -15.7     0.     -19.6 FIXEDHF     0.800  0       0.0  0                       
2029    Uf 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2030    Ug 2D1112       705.7     0.     882.1 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 12d  
2031    Ug 2D1626       -13.7     0.     -17.1 FIXEDHF     0.800  0       0.0  0                       
2032    Ug 2E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2033    Uh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 13d  
2034    Uh 2D1626       -11.9     0.     -14.9 FIXEDHF     0.800  0       0.0  0                       
2035    Uh 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2036    Ui 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 14d  
2037    Ui 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
2038    Ui 2E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2039    Uj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12d     -d9s2 15d  
2040    Uj 2D1626        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
2041    Uj 2E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2042    Uk 1D2633      1243.7     0.    1554.6 FIXEDHF     0.800  0       0.0  0  4s12d     -4p2       
2043    Ul 1D2637       189.6     0.     237.0 FIXEDHF     0.800  0       0.0  0  4s12d     -4p5p      
2044    Ul 1E2637       304.5     0.     380.6 FIXEDHF     0.800  0       0.0  0                       
2045    Um 1D2637        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0  4s12d     -4p6p      
2046    Um 1E2637       170.4     0.     213.0 FIXEDHF     0.800  0       0.0  0                       
2047    Un 1D2637       -41.1     0.     -51.4 FIXEDHF     0.800  0       0.0  0  4s12d     -4p7p      
2048    Un 1E2637       114.2     0.     142.8 FIXEDHF     0.800  0       0.0  0                       
2049    Uo 1D2637       -57.4     0.     -71.7 FIXEDHF     0.800  0       0.0  0  4s12d     -4p8p      
2050    Uo 1E2637        83.8     0.     104.8 FIXEDHF     0.800  0       0.0  0                       
2051    Up 1D2637       -61.3     0.     -76.6 FIXEDHF     0.800  0       0.0  0  4s12d     -4p9p      
2052    Up 1E2637        65.0     0.      81.3 FIXEDHF     0.800  0       0.0  0                       
2053    Uq 1D2638        15.5     0.      19.4 FIXEDHF     0.800  0       0.0  0  4s12d     -4p4f      
2054    Uq 3E2638        22.6     0.      28.2 FIXEDHF     0.800  0       0.0  0                       
2055    Ur 1D2638        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0  4s12d     -4p5f      
2056    Ur 3E2638        21.4     0.      26.7 FIXEDHF     0.800  0       0.0  0                       
2057    Us 1D2638        14.9     0.      18.6 FIXEDHF     0.800  0       0.0  0  4s12d     -4p6f      
2058    Us 3E2638        18.6     0.      23.3 FIXEDHF     0.800  0       0.0  0                       
2059    Ut 1D2638        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0  4s12d     -4p7f      
2060    Ut 3E2638        16.0     0.      20.0 FIXEDHF     0.800  0       0.0  0                       
2061    Uu 1D2638         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0  4s12d     -4p8f      
2062    Uu 3E2638        13.8     0.      17.3 FIXEDHF     0.800  0       0.0  0                       
2063    Uv 1D2638         7.2     0.       9.0 FIXEDHF     0.800  0       0.0  0  4s12d     -4p9f      
2064    Uv 3E2638        12.1     0.      15.1 FIXEDHF     0.800  0       0.0  0                       
2065    VW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -4s14d     
2066    VW 2E2626        19.0     0.      23.8 FIXEDHF     0.800  0       0.0  0                       
2067    VX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -4s15d     
2068    VX 2E2626        17.0     0.      21.3 FIXEDHF     0.800  0       0.0  0                       
2069    VY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 4d   
2070    VY 2D1626       -61.2     0.     -76.5 FIXEDHF     0.800  0       0.0  0                       
2071    VY 2E1626        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
2072    VZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 5d   
2073    VZ 2D1626       -47.9     0.     -59.9 FIXEDHF     0.800  0       0.0  0                       
2074    VZ 2E1626        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
2075    Va 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 6d   
2076    Va 2D1626       -36.6     0.     -45.8 FIXEDHF     0.800  0       0.0  0                       
2077    Va 2E1626        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0                       
2078    Vb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 7d   
2079    Vb 2D1626       -28.7     0.     -35.9 FIXEDHF     0.800  0       0.0  0                       
2080    Vb 2E1626        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
2081    Vc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 8d   
2082    Vc 2D1626       -23.1     0.     -28.9 FIXEDHF     0.800  0       0.0  0                       
2083    Vc 2E1626        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2084    Vd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 9d   
2085    Vd 2D1626       -19.1     0.     -23.9 FIXEDHF     0.800  0       0.0  0                       
2086    Vd 2E1626        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2087    Ve 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 10d  
2088    Ve 2D1626       -16.1     0.     -20.1 FIXEDHF     0.800  0       0.0  0                       
2089    Ve 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2090    Vf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 11d  
2091    Vf 2D1626       -13.8     0.     -17.2 FIXEDHF     0.800  0       0.0  0                       
2092    Vf 2E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2093    Vg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 12d  
2094    Vg 2D1626       -11.9     0.     -14.9 FIXEDHF     0.800  0       0.0  0                       
2095    Vg 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2096    Vh 2D1112       705.7     0.     882.1 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 13d  
2097    Vh 2D1626       -10.5     0.     -13.1 FIXEDHF     0.800  0       0.0  0                       
2098    Vh 2E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2099    Vi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 14d  
2100    Vi 2D1626        -9.3     0.     -11.6 FIXEDHF     0.800  0       0.0  0                       
2101    Vi 2E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2102    Vj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13d     -d9s2 15d  
2103    Vj 2D1626        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0                       
2104    Vj 2E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2105    Vk 1D2633      1091.0     0.    1363.8 FIXEDHF     0.800  0       0.0  0  4s13d     -4p2       
2106    Vl 1D2637       171.9     0.     214.9 FIXEDHF     0.800  0       0.0  0  4s13d     -4p5p      
2107    Vl 1E2637       267.8     0.     334.7 FIXEDHF     0.800  0       0.0  0                       
2108    Vm 1D2637        14.8     0.      18.5 FIXEDHF     0.800  0       0.0  0  4s13d     -4p6p      
2109    Vm 1E2637       149.8     0.     187.3 FIXEDHF     0.800  0       0.0  0                       
2110    Vn 1D2637       -31.6     0.     -39.5 FIXEDHF     0.800  0       0.0  0  4s13d     -4p7p      
2111    Vn 1E2637       100.5     0.     125.6 FIXEDHF     0.800  0       0.0  0                       
2112    Vo 1D2637       -46.2     0.     -57.8 FIXEDHF     0.800  0       0.0  0  4s13d     -4p8p      
2113    Vo 1E2637        73.8     0.      92.2 FIXEDHF     0.800  0       0.0  0                       
2114    Vp 1D2637       -49.9     0.     -62.4 FIXEDHF     0.800  0       0.0  0  4s13d     -4p9p      
2115    Vp 1E2637        57.2     0.      71.5 FIXEDHF     0.800  0       0.0  0                       
2116    Vq 1D2638        13.0     0.      16.3 FIXEDHF     0.800  0       0.0  0  4s13d     -4p4f      
2117    Vq 3E2638        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0                       
2118    Vr 1D2638        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0  4s13d     -4p5f      
2119    Vr 3E2638        18.7     0.      23.4 FIXEDHF     0.800  0       0.0  0                       
2120    Vs 1D2638        12.8     0.      16.0 FIXEDHF     0.800  0       0.0  0  4s13d     -4p6f      
2121    Vs 3E2638        16.3     0.      20.4 FIXEDHF     0.800  0       0.0  0                       
2122    Vt 1D2638        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0  4s13d     -4p7f      
2123    Vt 3E2638        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0                       
2124    Vu 1D2638         9.0     0.      11.2 FIXEDHF     0.800  0       0.0  0  4s13d     -4p8f      
2125    Vu 3E2638        12.2     0.      15.2 FIXEDHF     0.800  0       0.0  0                       
2126    Vv 1D2638         7.0     0.       8.8 FIXEDHF     0.800  0       0.0  0  4s13d     -4p9f      
2127    Vv 3E2638        10.6     0.      13.3 FIXEDHF     0.800  0       0.0  0                       
2128    WX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -4s15d     
2129    WX 2E2626        15.2     0.      19.0 FIXEDHF     0.800  0       0.0  0                       
2130    WY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 4d   
2131    WY 2D1626       -54.0     0.     -67.5 FIXEDHF     0.800  0       0.0  0                       
2132    WY 2E1626        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2133    WZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 5d   
2134    WZ 2D1626       -42.3     0.     -52.9 FIXEDHF     0.800  0       0.0  0                       
2135    WZ 2E1626        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
2136    Wa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 6d   
2137    Wa 2D1626       -32.4     0.     -40.5 FIXEDHF     0.800  0       0.0  0                       
2138    Wa 2E1626        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
2139    Wb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 7d   
2140    Wb 2D1626       -25.4     0.     -31.8 FIXEDHF     0.800  0       0.0  0                       
2141    Wb 2E1626        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
2142    Wc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 8d   
2143    Wc 2D1626       -20.5     0.     -25.6 FIXEDHF     0.800  0       0.0  0                       
2144    Wc 2E1626        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2145    Wd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 9d   
2146    Wd 2D1626       -16.9     0.     -21.1 FIXEDHF     0.800  0       0.0  0                       
2147    Wd 2E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2148    We 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 10d  
2149    We 2D1626       -14.2     0.     -17.8 FIXEDHF     0.800  0       0.0  0                       
2150    We 2E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2151    Wf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 11d  
2152    Wf 2D1626       -12.2     0.     -15.2 FIXEDHF     0.800  0       0.0  0                       
2153    Wf 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2154    Wg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 12d  
2155    Wg 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
2156    Wg 2E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2157    Wh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 13d  
2158    Wh 2D1626        -9.3     0.     -11.6 FIXEDHF     0.800  0       0.0  0                       
2159    Wh 2E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2160    Wi 2D1112       705.8     0.     882.2 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 14d  
2161    Wi 2D1626        -8.2     0.     -10.3 FIXEDHF     0.800  0       0.0  0                       
2162    Wi 2E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2163    Wj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14d     -d9s2 15d  
2164    Wj 2D1626        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
2165    Wj 2E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2166    Wk 1D2633       967.7     0.    1209.6 FIXEDHF     0.800  0       0.0  0  4s14d     -4p2       
2167    Wl 1D2637       156.9     0.     196.1 FIXEDHF     0.800  0       0.0  0  4s14d     -4p5p      
2168    Wl 1E2637       238.0     0.     297.5 FIXEDHF     0.800  0       0.0  0                       
2169    Wm 1D2637        17.0     0.      21.2 FIXEDHF     0.800  0       0.0  0  4s14d     -4p6p      
2170    Wm 1E2637       133.3     0.     166.6 FIXEDHF     0.800  0       0.0  0                       
2171    Wn 1D2637       -24.7     0.     -30.9 FIXEDHF     0.800  0       0.0  0  4s14d     -4p7p      
2172    Wn 1E2637        89.4     0.     111.7 FIXEDHF     0.800  0       0.0  0                       
2173    Wo 1D2637       -38.0     0.     -47.5 FIXEDHF     0.800  0       0.0  0  4s14d     -4p8p      
2174    Wo 1E2637        65.5     0.      81.9 FIXEDHF     0.800  0       0.0  0                       
2175    Wp 1D2637       -41.6     0.     -52.0 FIXEDHF     0.800  0       0.0  0  4s14d     -4p9p      
2176    Wp 1E2637        50.9     0.      63.6 FIXEDHF     0.800  0       0.0  0                       
2177    Wq 1D2638        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0  4s14d     -4p4f      
2178    Wq 3E2638        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0                       
2179    Wr 1D2638        12.1     0.      15.1 FIXEDHF     0.800  0       0.0  0  4s14d     -4p5f      
2180    Wr 3E2638        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0                       
2181    Ws 1D2638        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0  4s14d     -4p6f      
2182    Ws 3E2638        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0                       
2183    Wt 1D2638         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0  4s14d     -4p7f      
2184    Wt 3E2638        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0                       
2185    Wu 1D2638         8.0     0.      10.0 FIXEDHF     0.800  0       0.0  0  4s14d     -4p8f      
2186    Wu 3E2638        10.8     0.      13.5 FIXEDHF     0.800  0       0.0  0                       
2187    Wv 1D2638         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0  4s14d     -4p9f      
2188    Wv 3E2638         9.4     0.      11.8 FIXEDHF     0.800  0       0.0  0                       
2189    XY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 4d   
2190    XY 2D1626       -48.2     0.     -60.2 FIXEDHF     0.800  0       0.0  0                       
2191    XY 2E1626        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
2192    XZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 5d   
2193    XZ 2D1626       -37.8     0.     -47.2 FIXEDHF     0.800  0       0.0  0                       
2194    XZ 2E1626        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2195    Xa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 6d   
2196    Xa 2D1626       -29.0     0.     -36.2 FIXEDHF     0.800  0       0.0  0                       
2197    Xa 2E1626        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2198    Xb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 7d   
2199    Xb 2D1626       -22.7     0.     -28.4 FIXEDHF     0.800  0       0.0  0                       
2200    Xb 2E1626        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
2201    Xc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 8d   
2202    Xc 2D1626       -18.3     0.     -22.9 FIXEDHF     0.800  0       0.0  0                       
2203    Xc 2E1626        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
2204    Xd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 9d   
2205    Xd 2D1626       -15.1     0.     -18.9 FIXEDHF     0.800  0       0.0  0                       
2206    Xd 2E1626        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2207    Xe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 10d  
2208    Xe 2D1626       -12.7     0.     -15.9 FIXEDHF     0.800  0       0.0  0                       
2209    Xe 2E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2210    Xf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 11d  
2211    Xf 2D1626       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0                       
2212    Xf 2E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2213    Xg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 12d  
2214    Xg 2D1626        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
2215    Xg 2E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2216    Xh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 13d  
2217    Xh 2D1626        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0                       
2218    Xh 2E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2219    Xi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 14d  
2220    Xi 2D1626        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
2221    Xi 2E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2222    Xj 2D1112       705.8     0.     882.2 FIXEDHF     0.800  0       0.0  0  4s15d     -d9s2 15d  
2223    Xj 2D1626        -6.6     0.      -8.3 FIXEDHF     0.800  0       0.0  0                       
2224    Xj 2E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2225    Xk 1D2633       865.8     0.    1082.3 FIXEDHF     0.800  0       0.0  0  4s15d     -4p2       
2226    Xl 1D2637       143.6     0.     179.5 FIXEDHF     0.800  0       0.0  0  4s15d     -4p5p      
2227    Xl 1E2637       213.4     0.     266.7 FIXEDHF     0.800  0       0.0  0                       
2228    Xm 1D2637        18.1     0.      22.6 FIXEDHF     0.800  0       0.0  0  4s15d     -4p6p      
2229    Xm 1E2637       119.5     0.     149.4 FIXEDHF     0.800  0       0.0  0                       
2230    Xn 1D2637       -19.6     0.     -24.5 FIXEDHF     0.800  0       0.0  0  4s15d     -4p7p      
2231    Xn 1E2637        80.1     0.     100.1 FIXEDHF     0.800  0       0.0  0                       
2232    Xo 1D2637       -31.8     0.     -39.8 FIXEDHF     0.800  0       0.0  0  4s15d     -4p8p      
2233    Xo 1E2637        58.8     0.      73.5 FIXEDHF     0.800  0       0.0  0                       
2234    Xp 1D2637       -35.2     0.     -44.0 FIXEDHF     0.800  0       0.0  0  4s15d     -4p9p      
2235    Xp 1E2637        45.6     0.      57.0 FIXEDHF     0.800  0       0.0  0                       
2236    Xq 1D2638         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0  4s15d     -4p4f      
2237    Xq 3E2638        15.7     0.      19.6 FIXEDHF     0.800  0       0.0  0                       
2238    Xr 1D2638        10.4     0.      13.0 FIXEDHF     0.800  0       0.0  0  4s15d     -4p5f      
2239    Xr 3E2638        14.9     0.      18.6 FIXEDHF     0.800  0       0.0  0                       
2240    Xs 1D2638         9.6     0.      12.0 FIXEDHF     0.800  0       0.0  0  4s15d     -4p6f      
2241    Xs 3E2638        13.0     0.      16.2 FIXEDHF     0.800  0       0.0  0                       
2242    Xt 1D2638         8.4     0.      10.5 FIXEDHF     0.800  0       0.0  0  4s15d     -4p7f      
2243    Xt 3E2638        11.1     0.      13.9 FIXEDHF     0.800  0       0.0  0                       
2244    Xu 1D2638         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0  4s15d     -4p8f      
2245    Xu 3E2638         9.7     0.      12.1 FIXEDHF     0.800  0       0.0  0                       
2246    Xv 1D2638         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0  4s15d     -4p9f      
2247    Xv 3E2638         8.4     0.      10.5 FIXEDHF     0.800  0       0.0  0                       
2248    YZ 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 5d   
2249    YZ 2D1616       535.4     0.     669.3 FIXEDHF     0.800  0       0.0  0                       
2250    YZ 4D1616       221.0     0.     276.3 FIXEDHF     0.800  0       0.0  0                       
2251    YZ 0E1616       540.8     0.     676.0 FIXEDHF     0.800  0       0.0  0                       
2252    YZ 2E1616       298.8     0.     373.5 FIXEDHF     0.800  0       0.0  0                       
2253    YZ 4E1616       193.0     0.     241.3 FIXEDHF     0.800  0       0.0  0                       
2254    Ya 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 6d   
2255    Ya 2D1616       389.0     0.     486.2 FIXEDHF     0.800  0       0.0  0                       
2256    Ya 4D1616       167.2     0.     209.0 FIXEDHF     0.800  0       0.0  0                       
2257    Ya 0E1616       408.6     0.     510.8 FIXEDHF     0.800  0       0.0  0                       
2258    Ya 2E1616       226.5     0.     283.1 FIXEDHF     0.800  0       0.0  0                       
2259    Ya 4E1616       146.4     0.     183.0 FIXEDHF     0.800  0       0.0  0                       
2260    Yb 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 7d   
2261    Yb 2D1616       298.2     0.     372.7 FIXEDHF     0.800  0       0.0  0                       
2262    Yb 4D1616       130.9     0.     163.6 FIXEDHF     0.800  0       0.0  0                       
2263    Yb 0E1616       319.7     0.     399.6 FIXEDHF     0.800  0       0.0  0                       
2264    Yb 2E1616       177.5     0.     221.9 FIXEDHF     0.800  0       0.0  0                       
2265    Yb 4E1616       114.8     0.     143.5 FIXEDHF     0.800  0       0.0  0                       
2266    Yc 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 8d   
2267    Yc 2D1616       237.6     0.     297.0 FIXEDHF     0.800  0       0.0  0                       
2268    Yc 4D1616       105.6     0.     132.0 FIXEDHF     0.800  0       0.0  0                       
2269    Yc 0E1616       257.8     0.     322.3 FIXEDHF     0.800  0       0.0  0                       
2270    Yc 2E1616       143.3     0.     179.1 FIXEDHF     0.800  0       0.0  0                       
2271    Yc 4E1616        92.7     0.     115.9 FIXEDHF     0.800  0       0.0  0                       
2272    Yd 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 9d   
2273    Yd 2D1616       194.9     0.     243.6 FIXEDHF     0.800  0       0.0  0                       
2274    Yd 4D1616        87.4     0.     109.2 FIXEDHF     0.800  0       0.0  0                       
2275    Yd 0E1616       213.3     0.     266.6 FIXEDHF     0.800  0       0.0  0                       
2276    Yd 2E1616       118.6     0.     148.3 FIXEDHF     0.800  0       0.0  0                       
2277    Yd 4E1616        76.7     0.      95.9 FIXEDHF     0.800  0       0.0  0                       
2278    Ye 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 10d  
2279    Ye 2D1616       163.5     0.     204.4 FIXEDHF     0.800  0       0.0  0                       
2280    Ye 4D1616        73.7     0.      92.1 FIXEDHF     0.800  0       0.0  0                       
2281    Ye 0E1616       180.0     0.     225.0 FIXEDHF     0.800  0       0.0  0                       
2282    Ye 2E1616       100.2     0.     125.2 FIXEDHF     0.800  0       0.0  0                       
2283    Ye 4E1616        64.8     0.      81.0 FIXEDHF     0.800  0       0.0  0                       
2284    Yf 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 11d  
2285    Yf 2D1616       139.7     0.     174.6 FIXEDHF     0.800  0       0.0  0                       
2286    Yf 4D1616        63.3     0.      79.1 FIXEDHF     0.800  0       0.0  0                       
2287    Yf 0E1616       154.5     0.     193.1 FIXEDHF     0.800  0       0.0  0                       
2288    Yf 2E1616        85.9     0.     107.4 FIXEDHF     0.800  0       0.0  0                       
2289    Yf 4E1616        55.6     0.      69.5 FIXEDHF     0.800  0       0.0  0                       
2290    Yg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 12d  
2291    Yg 2D1616       121.1     0.     151.4 FIXEDHF     0.800  0       0.0  0                       
2292    Yg 4D1616        55.0     0.      68.8 FIXEDHF     0.800  0       0.0  0                       
2293    Yg 0E1616       134.4     0.     168.0 FIXEDHF     0.800  0       0.0  0                       
2294    Yg 2E1616        74.8     0.      93.5 FIXEDHF     0.800  0       0.0  0                       
2295    Yg 4E1616        48.4     0.      60.5 FIXEDHF     0.800  0       0.0  0                       
2296    Yh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 13d  
2297    Yh 2D1616       106.2     0.     132.8 FIXEDHF     0.800  0       0.0  0                       
2298    Yh 4D1616        48.4     0.      60.5 FIXEDHF     0.800  0       0.0  0                       
2299    Yh 0E1616       118.2     0.     147.8 FIXEDHF     0.800  0       0.0  0                       
2300    Yh 2E1616        65.8     0.      82.3 FIXEDHF     0.800  0       0.0  0                       
2301    Yh 4E1616        42.6     0.      53.3 FIXEDHF     0.800  0       0.0  0                       
2302    Yi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 14d  
2303    Yi 2D1616        94.2     0.     117.8 FIXEDHF     0.800  0       0.0  0                       
2304    Yi 4D1616        43.0     0.      53.8 FIXEDHF     0.800  0       0.0  0                       
2305    Yi 0E1616       105.1     0.     131.4 FIXEDHF     0.800  0       0.0  0                       
2306    Yi 2E1616        58.6     0.      73.2 FIXEDHF     0.800  0       0.0  0                       
2307    Yi 4E1616        37.8     0.      47.3 FIXEDHF     0.800  0       0.0  0                       
2308    Yj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4d   -d9s2 15d  
2309    Yj 2D1616        84.2     0.     105.3 FIXEDHF     0.800  0       0.0  0                       
2310    Yj 4D1616        38.6     0.      48.2 FIXEDHF     0.800  0       0.0  0                       
2311    Yj 0E1616        94.2     0.     117.7 FIXEDHF     0.800  0       0.0  0                       
2312    Yj 2E1616        52.5     0.      65.6 FIXEDHF     0.800  0       0.0  0                       
2313    Yj 4E1616        33.9     0.      42.4 FIXEDHF     0.800  0       0.0  0                       
2314    Za 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 6d   
2315    Za 2D1616       295.0     0.     368.7 FIXEDHF     0.800  0       0.0  0                       
2316    Za 4D1616       125.8     0.     157.2 FIXEDHF     0.800  0       0.0  0                       
2317    Za 0E1616       304.6     0.     380.8 FIXEDHF     0.800  0       0.0  0                       
2318    Za 2E1616       170.1     0.     212.6 FIXEDHF     0.800  0       0.0  0                       
2319    Za 4E1616       110.1     0.     137.6 FIXEDHF     0.800  0       0.0  0                       
2320    Zb 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 7d   
2321    Zb 2D1616       226.6     0.     283.3 FIXEDHF     0.800  0       0.0  0                       
2322    Zb 4D1616        98.5     0.     123.1 FIXEDHF     0.800  0       0.0  0                       
2323    Zb 0E1616       238.3     0.     297.9 FIXEDHF     0.800  0       0.0  0                       
2324    Zb 2E1616       133.3     0.     166.6 FIXEDHF     0.800  0       0.0  0                       
2325    Zb 4E1616        86.3     0.     107.9 FIXEDHF     0.800  0       0.0  0                       
2326    Zc 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 8d   
2327    Zc 2D1616       180.9     0.     226.1 FIXEDHF     0.800  0       0.0  0                       
2328    Zc 4D1616        79.5     0.      99.4 FIXEDHF     0.800  0       0.0  0                       
2329    Zc 0E1616       192.2     0.     240.3 FIXEDHF     0.800  0       0.0  0                       
2330    Zc 2E1616       107.6     0.     134.5 FIXEDHF     0.800  0       0.0  0                       
2331    Zc 4E1616        69.7     0.      87.1 FIXEDHF     0.800  0       0.0  0                       
2332    Zd 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 9d   
2333    Zd 2D1616       148.5     0.     185.6 FIXEDHF     0.800  0       0.0  0                       
2334    Zd 4D1616        65.8     0.      82.2 FIXEDHF     0.800  0       0.0  0                       
2335    Zd 0E1616       159.0     0.     198.7 FIXEDHF     0.800  0       0.0  0                       
2336    Zd 2E1616        89.0     0.     111.3 FIXEDHF     0.800  0       0.0  0                       
2337    Zd 4E1616        57.7     0.      72.1 FIXEDHF     0.800  0       0.0  0                       
2338    Ze 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 10d  
2339    Ze 2D1616       124.7     0.     155.9 FIXEDHF     0.800  0       0.0  0                       
2340    Ze 4D1616        55.5     0.      69.4 FIXEDHF     0.800  0       0.0  0                       
2341    Ze 0E1616       134.2     0.     167.7 FIXEDHF     0.800  0       0.0  0                       
2342    Ze 2E1616        75.2     0.      94.0 FIXEDHF     0.800  0       0.0  0                       
2343    Ze 4E1616        48.7     0.      60.9 FIXEDHF     0.800  0       0.0  0                       
2344    Zf 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 11d  
2345    Zf 2D1616       106.6     0.     133.2 FIXEDHF     0.800  0       0.0  0                       
2346    Zf 4D1616        47.7     0.      59.6 FIXEDHF     0.800  0       0.0  0                       
2347    Zf 0E1616       115.1     0.     143.9 FIXEDHF     0.800  0       0.0  0                       
2348    Zf 2E1616        64.6     0.      80.7 FIXEDHF     0.800  0       0.0  0                       
2349    Zf 4E1616        41.8     0.      52.3 FIXEDHF     0.800  0       0.0  0                       
2350    Zg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 12d  
2351    Zg 2D1616        92.4     0.     115.5 FIXEDHF     0.800  0       0.0  0                       
2352    Zg 4D1616        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0                       
2353    Zg 0E1616       100.2     0.     125.2 FIXEDHF     0.800  0       0.0  0                       
2354    Zg 2E1616        56.2     0.      70.2 FIXEDHF     0.800  0       0.0  0                       
2355    Zg 4E1616        36.4     0.      45.5 FIXEDHF     0.800  0       0.0  0                       
2356    Zh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 13d  
2357    Zh 2D1616        81.1     0.     101.4 FIXEDHF     0.800  0       0.0  0                       
2358    Zh 4D1616        36.5     0.      45.6 FIXEDHF     0.800  0       0.0  0                       
2359    Zh 0E1616        88.2     0.     110.2 FIXEDHF     0.800  0       0.0  0                       
2360    Zh 2E1616        49.4     0.      61.8 FIXEDHF     0.800  0       0.0  0                       
2361    Zh 4E1616        32.1     0.      40.1 FIXEDHF     0.800  0       0.0  0                       
2362    Zi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 14d  
2363    Zi 2D1616        72.0     0.      90.0 FIXEDHF     0.800  0       0.0  0                       
2364    Zi 4D1616        32.4     0.      40.5 FIXEDHF     0.800  0       0.0  0                       
2365    Zi 0E1616        78.3     0.      97.9 FIXEDHF     0.800  0       0.0  0                       
2366    Zi 2E1616        43.9     0.      54.9 FIXEDHF     0.800  0       0.0  0                       
2367    Zi 4E1616        28.5     0.      35.6 FIXEDHF     0.800  0       0.0  0                       
2368    Zj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5d   -d9s2 15d  
2369    Zj 2D1616        64.4     0.      80.5 FIXEDHF     0.800  0       0.0  0                       
2370    Zj 4D1616        29.0     0.      36.3 FIXEDHF     0.800  0       0.0  0                       
2371    Zj 0E1616        70.2     0.      87.8 FIXEDHF     0.800  0       0.0  0                       
2372    Zj 2E1616        39.4     0.      49.2 FIXEDHF     0.800  0       0.0  0                       
2373    Zj 4E1616        25.5     0.      31.9 FIXEDHF     0.800  0       0.0  0                       
2374    ab 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 7d   
2375    ab 2D1616       172.1     0.     215.1 FIXEDHF     0.800  0       0.0  0                       
2376    ab 4D1616        74.7     0.      93.4 FIXEDHF     0.800  0       0.0  0                       
2377    ab 0E1616       180.1     0.     225.1 FIXEDHF     0.800  0       0.0  0                       
2378    ab 2E1616       101.0     0.     126.3 FIXEDHF     0.800  0       0.0  0                       
2379    ab 4E1616        65.5     0.      81.9 FIXEDHF     0.800  0       0.0  0                       
2380    ac 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 8d   
2381    ac 2D1616       137.4     0.     171.8 FIXEDHF     0.800  0       0.0  0                       
2382    ac 4D1616        60.3     0.      75.4 FIXEDHF     0.800  0       0.0  0                       
2383    ac 0E1616       145.3     0.     181.6 FIXEDHF     0.800  0       0.0  0                       
2384    ac 2E1616        81.6     0.     102.0 FIXEDHF     0.800  0       0.0  0                       
2385    ac 4E1616        52.9     0.      66.1 FIXEDHF     0.800  0       0.0  0                       
2386    ad 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 9d   
2387    ad 2D1616       112.9     0.     141.1 FIXEDHF     0.800  0       0.0  0                       
2388    ad 4D1616        49.9     0.      62.4 FIXEDHF     0.800  0       0.0  0                       
2389    ad 0E1616       120.2     0.     150.2 FIXEDHF     0.800  0       0.0  0                       
2390    ad 2E1616        67.5     0.      84.4 FIXEDHF     0.800  0       0.0  0                       
2391    ad 4E1616        43.8     0.      54.7 FIXEDHF     0.800  0       0.0  0                       
2392    ae 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 10d  
2393    ae 2D1616        94.9     0.     118.6 FIXEDHF     0.800  0       0.0  0                       
2394    ae 4D1616        42.2     0.      52.7 FIXEDHF     0.800  0       0.0  0                       
2395    ae 0E1616       101.4     0.     126.8 FIXEDHF     0.800  0       0.0  0                       
2396    ae 2E1616        57.0     0.      71.3 FIXEDHF     0.800  0       0.0  0                       
2397    ae 4E1616        37.0     0.      46.2 FIXEDHF     0.800  0       0.0  0                       
2398    af 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 11d  
2399    af 2D1616        81.1     0.     101.4 FIXEDHF     0.800  0       0.0  0                       
2400    af 4D1616        36.2     0.      45.2 FIXEDHF     0.800  0       0.0  0                       
2401    af 0E1616        87.0     0.     108.8 FIXEDHF     0.800  0       0.0  0                       
2402    af 2E1616        49.0     0.      61.2 FIXEDHF     0.800  0       0.0  0                       
2403    af 4E1616        31.8     0.      39.7 FIXEDHF     0.800  0       0.0  0                       
2404    ag 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 12d  
2405    ag 2D1616        70.4     0.      88.0 FIXEDHF     0.800  0       0.0  0                       
2406    ag 4D1616        31.4     0.      39.3 FIXEDHF     0.800  0       0.0  0                       
2407    ag 0E1616        75.7     0.      94.6 FIXEDHF     0.800  0       0.0  0                       
2408    ag 2E1616        42.6     0.      53.2 FIXEDHF     0.800  0       0.0  0                       
2409    ag 4E1616        27.6     0.      34.5 FIXEDHF     0.800  0       0.0  0                       
2410    ah 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 13d  
2411    ah 2D1616        61.8     0.      77.3 FIXEDHF     0.800  0       0.0  0                       
2412    ah 4D1616        27.7     0.      34.6 FIXEDHF     0.800  0       0.0  0                       
2413    ah 0E1616        66.6     0.      83.3 FIXEDHF     0.800  0       0.0  0                       
2414    ah 2E1616        37.5     0.      46.9 FIXEDHF     0.800  0       0.0  0                       
2415    ah 4E1616        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0                       
2416    ai 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 14d  
2417    ai 2D1616        54.8     0.      68.5 FIXEDHF     0.800  0       0.0  0                       
2418    ai 4D1616        24.6     0.      30.8 FIXEDHF     0.800  0       0.0  0                       
2419    ai 0E1616        59.2     0.      74.0 FIXEDHF     0.800  0       0.0  0                       
2420    ai 2E1616        33.4     0.      41.7 FIXEDHF     0.800  0       0.0  0                       
2421    ai 4E1616        21.6     0.      27.0 FIXEDHF     0.800  0       0.0  0                       
2422    aj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6d   -d9s2 15d  
2423    aj 2D1616        49.0     0.      61.3 FIXEDHF     0.800  0       0.0  0                       
2424    aj 4D1616        22.1     0.      27.6 FIXEDHF     0.800  0       0.0  0                       
2425    aj 0E1616        53.0     0.      66.3 FIXEDHF     0.800  0       0.0  0                       
2426    aj 2E1616        29.8     0.      37.3 FIXEDHF     0.800  0       0.0  0                       
2427    aj 4E1616        19.4     0.      24.2 FIXEDHF     0.800  0       0.0  0                       
2428    bc 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 8d   
2429    bc 2D1616       107.6     0.     134.5 FIXEDHF     0.800  0       0.0  0                       
2430    bc 4D1616        47.3     0.      59.1 FIXEDHF     0.800  0       0.0  0                       
2431    bc 0E1616       113.7     0.     142.1 FIXEDHF     0.800  0       0.0  0                       
2432    bc 2E1616        63.9     0.      79.9 FIXEDHF     0.800  0       0.0  0                       
2433    bc 4E1616        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0                       
2434    bd 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 9d   
2435    bd 2D1616        88.5     0.     110.6 FIXEDHF     0.800  0       0.0  0                       
2436    bd 4D1616        39.1     0.      48.9 FIXEDHF     0.800  0       0.0  0                       
2437    bd 0E1616        94.0     0.     117.5 FIXEDHF     0.800  0       0.0  0                       
2438    bd 2E1616        53.0     0.      66.2 FIXEDHF     0.800  0       0.0  0                       
2439    bd 4E1616        34.3     0.      42.9 FIXEDHF     0.800  0       0.0  0                       
2440    be 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 10d  
2441    be 2D1616        74.3     0.      92.9 FIXEDHF     0.800  0       0.0  0                       
2442    be 4D1616        33.0     0.      41.3 FIXEDHF     0.800  0       0.0  0                       
2443    be 0E1616        79.4     0.      99.2 FIXEDHF     0.800  0       0.0  0                       
2444    be 2E1616        44.7     0.      55.9 FIXEDHF     0.800  0       0.0  0                       
2445    be 4E1616        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0                       
2446    bf 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 11d  
2447    bf 2D1616        63.6     0.      79.5 FIXEDHF     0.800  0       0.0  0                       
2448    bf 4D1616        28.3     0.      35.4 FIXEDHF     0.800  0       0.0  0                       
2449    bf 0E1616        68.1     0.      85.1 FIXEDHF     0.800  0       0.0  0                       
2450    bf 2E1616        38.4     0.      48.0 FIXEDHF     0.800  0       0.0  0                       
2451    bf 4E1616        24.9     0.      31.1 FIXEDHF     0.800  0       0.0  0                       
2452    bg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 12d  
2453    bg 2D1616        55.2     0.      69.0 FIXEDHF     0.800  0       0.0  0                       
2454    bg 4D1616        24.6     0.      30.8 FIXEDHF     0.800  0       0.0  0                       
2455    bg 0E1616        59.2     0.      74.0 FIXEDHF     0.800  0       0.0  0                       
2456    bg 2E1616        33.4     0.      41.7 FIXEDHF     0.800  0       0.0  0                       
2457    bg 4E1616        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
2458    bh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 13d  
2459    bh 2D1616        48.5     0.      60.6 FIXEDHF     0.800  0       0.0  0                       
2460    bh 4D1616        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
2461    bh 0E1616        52.2     0.      65.2 FIXEDHF     0.800  0       0.0  0                       
2462    bh 2E1616        29.4     0.      36.7 FIXEDHF     0.800  0       0.0  0                       
2463    bh 4E1616        19.0     0.      23.8 FIXEDHF     0.800  0       0.0  0                       
2464    bi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 14d  
2465    bi 2D1616        43.0     0.      53.8 FIXEDHF     0.800  0       0.0  0                       
2466    bi 4D1616        19.3     0.      24.1 FIXEDHF     0.800  0       0.0  0                       
2467    bi 0E1616        46.3     0.      57.9 FIXEDHF     0.800  0       0.0  0                       
2468    bi 2E1616        26.2     0.      32.7 FIXEDHF     0.800  0       0.0  0                       
2469    bi 4E1616        17.0     0.      21.2 FIXEDHF     0.800  0       0.0  0                       
2470    bj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7d   -d9s2 15d  
2471    bj 2D1616        38.5     0.      48.1 FIXEDHF     0.800  0       0.0  0                       
2472    bj 4D1616        17.3     0.      21.6 FIXEDHF     0.800  0       0.0  0                       
2473    bj 0E1616        41.5     0.      51.9 FIXEDHF     0.800  0       0.0  0                       
2474    bj 2E1616        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0                       
2475    bj 4E1616        15.2     0.      19.0 FIXEDHF     0.800  0       0.0  0                       
2476    cd 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 9d   
2477    cd 2D1616        71.4     0.      89.2 FIXEDHF     0.800  0       0.0  0                       
2478    cd 4D1616        31.6     0.      39.5 FIXEDHF     0.800  0       0.0  0                       
2479    cd 0E1616        75.8     0.      94.8 FIXEDHF     0.800  0       0.0  0                       
2480    cd 2E1616        42.7     0.      53.4 FIXEDHF     0.800  0       0.0  0                       
2481    cd 4E1616        27.8     0.      34.7 FIXEDHF     0.800  0       0.0  0                       
2482    ce 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 10d  
2483    ce 2D1616        60.0     0.      75.0 FIXEDHF     0.800  0       0.0  0                       
2484    ce 4D1616        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0                       
2485    ce 0E1616        64.0     0.      80.0 FIXEDHF     0.800  0       0.0  0                       
2486    ce 2E1616        36.1     0.      45.1 FIXEDHF     0.800  0       0.0  0                       
2487    ce 4E1616        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0                       
2488    cf 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 11d  
2489    cf 2D1616        51.4     0.      64.2 FIXEDHF     0.800  0       0.0  0                       
2490    cf 4D1616        22.9     0.      28.6 FIXEDHF     0.800  0       0.0  0                       
2491    cf 0E1616        55.0     0.      68.7 FIXEDHF     0.800  0       0.0  0                       
2492    cf 2E1616        31.0     0.      38.7 FIXEDHF     0.800  0       0.0  0                       
2493    cf 4E1616        20.1     0.      25.1 FIXEDHF     0.800  0       0.0  0                       
2494    cg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 12d  
2495    cg 2D1616        44.6     0.      55.7 FIXEDHF     0.800  0       0.0  0                       
2496    cg 4D1616        19.9     0.      24.9 FIXEDHF     0.800  0       0.0  0                       
2497    cg 0E1616        47.8     0.      59.7 FIXEDHF     0.800  0       0.0  0                       
2498    cg 2E1616        27.0     0.      33.7 FIXEDHF     0.800  0       0.0  0                       
2499    cg 4E1616        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0                       
2500    ch 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 13d  
2501    ch 2D1616        39.1     0.      48.9 FIXEDHF     0.800  0       0.0  0                       
2502    ch 4D1616        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0                       
2503    ch 0E1616        42.1     0.      52.6 FIXEDHF     0.800  0       0.0  0                       
2504    ch 2E1616        23.8     0.      29.7 FIXEDHF     0.800  0       0.0  0                       
2505    ch 4E1616        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0                       
2506    ci 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 14d  
2507    ci 2D1616        34.7     0.      43.4 FIXEDHF     0.800  0       0.0  0                       
2508    ci 4D1616        15.6     0.      19.5 FIXEDHF     0.800  0       0.0  0                       
2509    ci 0E1616        37.4     0.      46.7 FIXEDHF     0.800  0       0.0  0                       
2510    ci 2E1616        21.1     0.      26.4 FIXEDHF     0.800  0       0.0  0                       
2511    ci 4E1616        13.7     0.      17.1 FIXEDHF     0.800  0       0.0  0                       
2512    cj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8d   -d9s2 15d  
2513    cj 2D1616        31.1     0.      38.9 FIXEDHF     0.800  0       0.0  0                       
2514    cj 4D1616        14.0     0.      17.5 FIXEDHF     0.800  0       0.0  0                       
2515    cj 0E1616        33.5     0.      41.9 FIXEDHF     0.800  0       0.0  0                       
2516    cj 2E1616        18.9     0.      23.6 FIXEDHF     0.800  0       0.0  0                       
2517    cj 4E1616        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0                       
2518    de 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 10d  
2519    de 2D1616        49.6     0.      62.0 FIXEDHF     0.800  0       0.0  0                       
2520    de 4D1616        22.1     0.      27.6 FIXEDHF     0.800  0       0.0  0                       
2521    de 0E1616        53.0     0.      66.2 FIXEDHF     0.800  0       0.0  0                       
2522    de 2E1616        29.8     0.      37.3 FIXEDHF     0.800  0       0.0  0                       
2523    de 4E1616        19.4     0.      24.2 FIXEDHF     0.800  0       0.0  0                       
2524    df 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 11d  
2525    df 2D1616        42.5     0.      53.1 FIXEDHF     0.800  0       0.0  0                       
2526    df 4D1616        19.0     0.      23.7 FIXEDHF     0.800  0       0.0  0                       
2527    df 0E1616        45.4     0.      56.8 FIXEDHF     0.800  0       0.0  0                       
2528    df 2E1616        25.6     0.      32.0 FIXEDHF     0.800  0       0.0  0                       
2529    df 4E1616        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0                       
2530    dg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 12d  
2531    dg 2D1616        36.9     0.      46.1 FIXEDHF     0.800  0       0.0  0                       
2532    dg 4D1616        16.5     0.      20.6 FIXEDHF     0.800  0       0.0  0                       
2533    dg 0E1616        39.5     0.      49.4 FIXEDHF     0.800  0       0.0  0                       
2534    dg 2E1616        22.3     0.      27.9 FIXEDHF     0.800  0       0.0  0                       
2535    dg 4E1616        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0                       
2536    dh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 13d  
2537    dh 2D1616        32.4     0.      40.5 FIXEDHF     0.800  0       0.0  0                       
2538    dh 4D1616        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0                       
2539    dh 0E1616        34.8     0.      43.5 FIXEDHF     0.800  0       0.0  0                       
2540    dh 2E1616        19.6     0.      24.5 FIXEDHF     0.800  0       0.0  0                       
2541    dh 4E1616        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0                       
2542    di 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 14d  
2543    di 2D1616        28.7     0.      35.9 FIXEDHF     0.800  0       0.0  0                       
2544    di 4D1616        12.9     0.      16.1 FIXEDHF     0.800  0       0.0  0                       
2545    di 0E1616        30.9     0.      38.6 FIXEDHF     0.800  0       0.0  0                       
2546    di 2E1616        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0                       
2547    di 4E1616        11.4     0.      14.2 FIXEDHF     0.800  0       0.0  0                       
2548    dj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9d   -d9s2 15d  
2549    dj 2D1616        25.8     0.      32.2 FIXEDHF     0.800  0       0.0  0                       
2550    dj 4D1616        11.5     0.      14.4 FIXEDHF     0.800  0       0.0  0                       
2551    dj 0E1616        27.7     0.      34.6 FIXEDHF     0.800  0       0.0  0                       
2552    dj 2E1616        15.7     0.      19.6 FIXEDHF     0.800  0       0.0  0                       
2553    dj 4E1616        10.2     0.      12.7 FIXEDHF     0.800  0       0.0  0                       
2554    ef 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 11d  
2555    ef 2D1616        35.8     0.      44.8 FIXEDHF     0.800  0       0.0  0                       
2556    ef 4D1616        16.0     0.      20.0 FIXEDHF     0.800  0       0.0  0                       
2557    ef 0E1616        38.3     0.      47.9 FIXEDHF     0.800  0       0.0  0                       
2558    ef 2E1616        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
2559    ef 4E1616        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0                       
2560    eg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 12d  
2561    eg 2D1616        31.1     0.      38.9 FIXEDHF     0.800  0       0.0  0                       
2562    eg 4D1616        13.9     0.      17.4 FIXEDHF     0.800  0       0.0  0                       
2563    eg 0E1616        33.4     0.      41.7 FIXEDHF     0.800  0       0.0  0                       
2564    eg 2E1616        18.8     0.      23.5 FIXEDHF     0.800  0       0.0  0                       
2565    eg 4E1616        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0                       
2566    eh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 13d  
2567    eh 2D1616        27.4     0.      34.2 FIXEDHF     0.800  0       0.0  0                       
2568    eh 4D1616        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0                       
2569    eh 0E1616        29.4     0.      36.7 FIXEDHF     0.800  0       0.0  0                       
2570    eh 2E1616        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0                       
2571    eh 4E1616        10.8     0.      13.5 FIXEDHF     0.800  0       0.0  0                       
2572    ei 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 14d  
2573    ei 2D1616        24.2     0.      30.3 FIXEDHF     0.800  0       0.0  0                       
2574    ei 4D1616        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0                       
2575    ei 0E1616        26.1     0.      32.6 FIXEDHF     0.800  0       0.0  0                       
2576    ei 2E1616        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0                       
2577    ei 4E1616         9.6     0.      12.0 FIXEDHF     0.800  0       0.0  0                       
2578    ej 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10d  -d9s2 15d  
2579    ej 2D1616        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
2580    ej 4D1616         9.8     0.      12.2 FIXEDHF     0.800  0       0.0  0                       
2581    ej 0E1616        23.4     0.      29.2 FIXEDHF     0.800  0       0.0  0                       
2582    ej 2E1616        13.2     0.      16.5 FIXEDHF     0.800  0       0.0  0                       
2583    ej 4E1616         8.6     0.      10.7 FIXEDHF     0.800  0       0.0  0                       
2584    fg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 12d  
2585    fg 2D1616        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0                       
2586    fg 4D1616        11.9     0.      14.9 FIXEDHF     0.800  0       0.0  0                       
2587    fg 0E1616        28.6     0.      35.8 FIXEDHF     0.800  0       0.0  0                       
2588    fg 2E1616        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0                       
2589    fg 4E1616        10.5     0.      13.1 FIXEDHF     0.800  0       0.0  0                       
2590    fh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 13d  
2591    fh 2D1616        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0                       
2592    fh 4D1616        10.5     0.      13.1 FIXEDHF     0.800  0       0.0  0                       
2593    fh 0E1616        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0                       
2594    fh 2E1616        14.2     0.      17.8 FIXEDHF     0.800  0       0.0  0                       
2595    fh 4E1616         9.3     0.      11.6 FIXEDHF     0.800  0       0.0  0                       
2596    fi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 14d  
2597    fi 2D1616        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0                       
2598    fi 4D1616         9.4     0.      11.7 FIXEDHF     0.800  0       0.0  0                       
2599    fi 0E1616        22.4     0.      28.0 FIXEDHF     0.800  0       0.0  0                       
2600    fi 2E1616        12.6     0.      15.8 FIXEDHF     0.800  0       0.0  0                       
2601    fi 4E1616         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0                       
2602    fj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11d  -d9s2 15d  
2603    fj 2D1616        18.6     0.      23.3 FIXEDHF     0.800  0       0.0  0                       
2604    fj 4D1616         8.4     0.      10.5 FIXEDHF     0.800  0       0.0  0                       
2605    fj 0E1616        20.1     0.      25.1 FIXEDHF     0.800  0       0.0  0                       
2606    fj 2E1616        11.4     0.      14.2 FIXEDHF     0.800  0       0.0  0                       
2607    fj 4E1616         7.4     0.       9.2 FIXEDHF     0.800  0       0.0  0                       
2608    gh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 13d  
2609    gh 2D1616        20.4     0.      25.5 FIXEDHF     0.800  0       0.0  0                       
2610    gh 4D1616         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
2611    gh 0E1616        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0                       
2612    gh 2E1616        12.4     0.      15.5 FIXEDHF     0.800  0       0.0  0                       
2613    gh 4E1616         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
2614    gi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 14d  
2615    gi 2D1616        18.1     0.      22.6 FIXEDHF     0.800  0       0.0  0                       
2616    gi 4D1616         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0                       
2617    gi 0E1616        19.4     0.      24.3 FIXEDHF     0.800  0       0.0  0                       
2618    gi 2E1616        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
2619    gi 4E1616         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0                       
2620    gj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12d  -d9s2 15d  
2621    gj 2D1616        16.2     0.      20.3 FIXEDHF     0.800  0       0.0  0                       
2622    gj 4D1616         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0                       
2623    gj 0E1616        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0                       
2624    gj 2E1616         9.8     0.      12.3 FIXEDHF     0.800  0       0.0  0                       
2625    gj 4E1616         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
2626    hi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 14d  
2627    hi 2D1616        15.9     0.      19.9 FIXEDHF     0.800  0       0.0  0                       
2628    hi 4D1616         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0                       
2629    hi 0E1616        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0                       
2630    hi 2E1616         9.7     0.      12.1 FIXEDHF     0.800  0       0.0  0                       
2631    hi 4E1616         6.3     0.       7.9 FIXEDHF     0.800  0       0.0  0                       
2632    hj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13d  -d9s2 15d  
2633    hj 2D1616        14.2     0.      17.8 FIXEDHF     0.800  0       0.0  0                       
2634    hj 4D1616         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
2635    hj 0E1616        15.4     0.      19.2 FIXEDHF     0.800  0       0.0  0                       
2636    hj 2E1616         8.7     0.      10.9 FIXEDHF     0.800  0       0.0  0                       
2637    hj 4E1616         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0                       
2638    ij 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14d  -d9s2 15d  
2639    ij 2D1616        12.6     0.      15.8 FIXEDHF     0.800  0       0.0  0                       
2640    ij 4D1616         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0                       
2641    ij 0E1616        13.7     0.      17.1 FIXEDHF     0.800  0       0.0  0                       
2642    ij 2E1616         7.7     0.       9.6 FIXEDHF     0.800  0       0.0  0                       
2643    ij 4E1616         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0                       
2644    kl 0D3337       983.8     0.    1229.8 FIXEDHF     0.800  0       0.0  0  4p2       -4p5p      
2645    kl 2D3337      3691.6     0.    4614.5 FIXEDHF     0.800  0       0.0  0                       
2646    km 0D3337       535.8     0.     669.8 FIXEDHF     0.800  0       0.0  0  4p2       -4p6p      
2647    km 2D3337      1922.2     0.    2402.7 FIXEDHF     0.800  0       0.0  0                       
2648    kn 0D3337       354.3     0.     442.9 FIXEDHF     0.800  0       0.0  0  4p2       -4p7p      
2649    kn 2D3337      1245.4     0.    1556.8 FIXEDHF     0.800  0       0.0  0                       
2650    ko 0D3337       257.8     0.     322.3 FIXEDHF     0.800  0       0.0  0  4p2       -4p8p      
2651    ko 2D3337       896.2     0.    1120.3 FIXEDHF     0.800  0       0.0  0                       
2652    kp 0D3337       199.0     0.     248.7 FIXEDHF     0.800  0       0.0  0  4p2       -4p9p      
2653    kp 2D3337       686.8     0.     858.5 FIXEDHF     0.800  0       0.0  0                       
2654    kq 2D3338      1136.8     0.    1421.0 FIXEDHF     0.800  0       0.0  0  4p2       -4p4f      
2655    kr 2D3338      1037.0     0.    1296.3 FIXEDHF     0.800  0       0.0  0  4p2       -4p5f      
2656    ks 2D3338       884.2     0.    1105.3 FIXEDHF     0.800  0       0.0  0  4p2       -4p6f      
2657    kt 2D3338       751.1     0.     938.9 FIXEDHF     0.800  0       0.0  0  4p2       -4p7f      
2658    ku 2D3338       643.6     0.     804.5 FIXEDHF     0.800  0       0.0  0  4p2       -4p8f      
2659    kv 2D3338       557.5     0.     696.9 FIXEDHF     0.800  0       0.0  0  4p2       -4p9f      
2660    lm 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5p      -4p6p      
2661    lm 2D3737      1940.4     0.    2425.5 FIXEDHF     0.800  0       0.0  0                       
2662    lm 0E3737      1101.7     0.    1377.1 FIXEDHF     0.800  0       0.0  0                       
2663    lm 2E3737       954.7     0.    1193.4 FIXEDHF     0.800  0       0.0  0                       
2664    ln 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5p      -4p7p      
2665    ln 2D3737      1256.7     0.    1570.9 FIXEDHF     0.800  0       0.0  0                       
2666    ln 0E3737       741.8     0.     927.2 FIXEDHF     0.800  0       0.0  0                       
2667    ln 2E3737       651.4     0.     814.3 FIXEDHF     0.800  0       0.0  0                       
2668    lo 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5p      -4p8p      
2669    lo 2D3737       907.4     0.    1134.3 FIXEDHF     0.800  0       0.0  0                       
2670    lo 0E3737       545.4     0.     681.8 FIXEDHF     0.800  0       0.0  0                       
2671    lo 2E3737       482.4     0.     603.0 FIXEDHF     0.800  0       0.0  0                       
2672    lp 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5p      -4p9p      
2673    lp 2D3737       697.4     0.     871.8 FIXEDHF     0.800  0       0.0  0                       
2674    lp 0E3737       423.6     0.     529.5 FIXEDHF     0.800  0       0.0  0                       
2675    lp 2E3737       376.3     0.     470.4 FIXEDHF     0.800  0       0.0  0                       
2676    lq 2D3738     -1023.8     0.   -1279.8 FIXEDHF     0.800  0       0.0  0  4p5p      -4p4f      
2677    lq 2E3738        67.9     0.      84.9 FIXEDHF     0.800  0       0.0  0                       
2678    lr 2D3738      -727.9     0.    -909.9 FIXEDHF     0.800  0       0.0  0  4p5p      -4p5f      
2679    lr 2E3738        70.3     0.      87.9 FIXEDHF     0.800  0       0.0  0                       
2680    ls 2D3738      -540.2     0.    -675.2 FIXEDHF     0.800  0       0.0  0  4p5p      -4p6f      
2681    ls 2E3738        64.2     0.      80.2 FIXEDHF     0.800  0       0.0  0                       
2682    lt 2D3738      -419.9     0.    -524.9 FIXEDHF     0.800  0       0.0  0  4p5p      -4p7f      
2683    lt 2E3738        56.8     0.      71.0 FIXEDHF     0.800  0       0.0  0                       
2684    lu 2D3738      -338.4     0.    -423.0 FIXEDHF     0.800  0       0.0  0  4p5p      -4p8f      
2685    lu 2E3738        50.1     0.      62.6 FIXEDHF     0.800  0       0.0  0                       
2686    lv 2D3738      -280.3     0.    -350.4 FIXEDHF     0.800  0       0.0  0  4p5p      -4p9f      
2687    lv 2E3738        44.2     0.      55.3 FIXEDHF     0.800  0       0.0  0                       
2688    mn 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6p      -4p7p      
2689    mn 2D3737       884.8     0.    1106.0 FIXEDHF     0.800  0       0.0  0                       
2690    mn 0E3737       426.6     0.     533.3 FIXEDHF     0.800  0       0.0  0                       
2691    mn 2E3737       389.9     0.     487.4 FIXEDHF     0.800  0       0.0  0                       
2692    mo 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6p      -4p8p      
2693    mo 2D3737       637.3     0.     796.6 FIXEDHF     0.800  0       0.0  0                       
2694    mo 0E3737       314.4     0.     393.0 FIXEDHF     0.800  0       0.0  0                       
2695    mo 2E3737       289.8     0.     362.2 FIXEDHF     0.800  0       0.0  0                       
2696    mp 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6p      -4p9p      
2697    mp 2D3737       489.8     0.     612.2 FIXEDHF     0.800  0       0.0  0                       
2698    mp 0E3737       244.5     0.     305.6 FIXEDHF     0.800  0       0.0  0                       
2699    mp 2E3737       226.6     0.     283.2 FIXEDHF     0.800  0       0.0  0                       
2700    mq 2D3738      -163.7     0.    -204.6 FIXEDHF     0.800  0       0.0  0  4p6p      -4p4f      
2701    mq 2E3738        22.5     0.      28.1 FIXEDHF     0.800  0       0.0  0                       
2702    mr 2D3738      -298.2     0.    -372.8 FIXEDHF     0.800  0       0.0  0  4p6p      -4p5f      
2703    mr 2E3738        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0                       
2704    ms 2D3738      -262.8     0.    -328.5 FIXEDHF     0.800  0       0.0  0  4p6p      -4p6f      
2705    ms 2E3738        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0                       
2706    mt 2D3738      -220.4     0.    -275.5 FIXEDHF     0.800  0       0.0  0  4p6p      -4p7f      
2707    mt 2E3738        21.5     0.      26.9 FIXEDHF     0.800  0       0.0  0                       
2708    mu 2D3738      -185.4     0.    -231.8 FIXEDHF     0.800  0       0.0  0  4p6p      -4p8f      
2709    mu 2E3738        19.2     0.      24.0 FIXEDHF     0.800  0       0.0  0                       
2710    mv 2D3738      -157.9     0.    -197.4 FIXEDHF     0.800  0       0.0  0  4p6p      -4p9f      
2711    mv 2E3738        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0                       
2712    no 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p7p      -4p8p      
2713    no 2D3737       469.7     0.     587.1 FIXEDHF     0.800  0       0.0  0                       
2714    no 0E3737       213.1     0.     266.4 FIXEDHF     0.800  0       0.0  0                       
2715    no 2E3737       199.8     0.     249.8 FIXEDHF     0.800  0       0.0  0                       
2716    np 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p7p      -4p9p      
2717    np 2D3737       360.5     0.     450.6 FIXEDHF     0.800  0       0.0  0                       
2718    np 0E3737       165.8     0.     207.3 FIXEDHF     0.800  0       0.0  0                       
2719    np 2E3737       156.4     0.     195.5 FIXEDHF     0.800  0       0.0  0                       
2720    nq 2D3738      -112.6     0.    -140.8 FIXEDHF     0.800  0       0.0  0  4p7p      -4p4f      
2721    nq 2E3738        10.6     0.      13.2 FIXEDHF     0.800  0       0.0  0                       
2722    nr 2D3738      -105.3     0.    -131.6 FIXEDHF     0.800  0       0.0  0  4p7p      -4p5f      
2723    nr 2E3738        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0                       
2724    ns 2D3738      -131.0     0.    -163.7 FIXEDHF     0.800  0       0.0  0  4p7p      -4p6f      
2725    ns 2E3738        12.4     0.      15.5 FIXEDHF     0.800  0       0.0  0                       
2726    nt 2D3738      -120.6     0.    -150.8 FIXEDHF     0.800  0       0.0  0  4p7p      -4p7f      
2727    nt 2E3738        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0                       
2728    nu 2D3738      -106.1     0.    -132.6 FIXEDHF     0.800  0       0.0  0  4p7p      -4p8f      
2729    nu 2E3738        10.3     0.      12.9 FIXEDHF     0.800  0       0.0  0                       
2730    nv 2D3738       -92.8     0.    -116.0 FIXEDHF     0.800  0       0.0  0  4p7p      -4p9f      
2731    nv 2E3738         9.3     0.      11.6 FIXEDHF     0.800  0       0.0  0                       
2732    op 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p8p      -4p9p      
2733    op 2D3737       277.8     0.     347.3 FIXEDHF     0.800  0       0.0  0                       
2734    op 0E3737       122.4     0.     153.0 FIXEDHF     0.800  0       0.0  0                       
2735    op 2E3737       116.6     0.     145.7 FIXEDHF     0.800  0       0.0  0                       
2736    oq 2D3738       -79.9     0.     -99.9 FIXEDHF     0.800  0       0.0  0  4p8p      -4p4f      
2737    oq 2E3738         5.9     0.       7.4 FIXEDHF     0.800  0       0.0  0                       
2738    or 2D3738       -78.5     0.     -98.1 FIXEDHF     0.800  0       0.0  0  4p8p      -4p5f      
2739    or 2E3738         7.7     0.       9.6 FIXEDHF     0.800  0       0.0  0                       
2740    os 2D3738       -67.5     0.     -84.4 FIXEDHF     0.800  0       0.0  0  4p8p      -4p6f      
2741    os 2E3738         7.7     0.       9.6 FIXEDHF     0.800  0       0.0  0                       
2742    ot 2D3738       -71.6     0.     -89.5 FIXEDHF     0.800  0       0.0  0  4p8p      -4p7f      
2743    ot 2E3738         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0                       
2744    ou 2D3738       -66.2     0.     -82.7 FIXEDHF     0.800  0       0.0  0  4p8p      -4p8f      
2745    ou 2E3738         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0                       
2746    ov 2D3738       -59.4     0.     -74.2 FIXEDHF     0.800  0       0.0  0  4p8p      -4p9f      
2747    ov 2E3738         5.9     0.       7.4 FIXEDHF     0.800  0       0.0  0                       
2748    pq 2D3738       -60.6     0.     -75.7 FIXEDHF     0.800  0       0.0  0  4p9p      -4p4f      
2749    pq 2E3738         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0                       
2750    pr 2D3738       -59.5     0.     -74.4 FIXEDHF     0.800  0       0.0  0  4p9p      -4p5f      
2751    pr 2E3738         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0                       
2752    ps 2D3738       -52.9     0.     -66.1 FIXEDHF     0.800  0       0.0  0  4p9p      -4p6f      
2753    ps 2E3738         5.3     0.       6.6 FIXEDHF     0.800  0       0.0  0                       
2754    pt 2D3738       -45.0     0.     -56.3 FIXEDHF     0.800  0       0.0  0  4p9p      -4p7f      
2755    pt 2E3738         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0                       
2756    pu 2D3738       -44.4     0.     -55.5 FIXEDHF     0.800  0       0.0  0  4p9p      -4p8f      
2757    pu 2E3738         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0                       
2758    pv 2D3738       -40.9     0.     -51.1 FIXEDHF     0.800  0       0.0  0  4p9p      -4p9f      
2759    pv 2E3738         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0                       
2760    qr 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p4f      -4p5f      
2761    qr 2D3838       442.2     0.     552.8 FIXEDHF     0.800  0       0.0  0                       
2762    qr 2E3838        57.7     0.      72.1 FIXEDHF     0.800  0       0.0  0                       
2763    qr 4E3838        37.6     0.      47.0 FIXEDHF     0.800  0       0.0  0                       
2764    qs 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p4f      -4p6f      
2765    qs 2D3838       312.6     0.     390.7 FIXEDHF     0.800  0       0.0  0                       
2766    qs 2E3838        49.0     0.      61.2 FIXEDHF     0.800  0       0.0  0                       
2767    qs 4E3838        31.9     0.      39.9 FIXEDHF     0.800  0       0.0  0                       
2768    qt 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p4f      -4p7f      
2769    qt 2D3838       238.9     0.     298.6 FIXEDHF     0.800  0       0.0  0                       
2770    qt 2E3838        41.5     0.      51.9 FIXEDHF     0.800  0       0.0  0                       
2771    qt 4E3838        27.0     0.      33.8 FIXEDHF     0.800  0       0.0  0                       
2772    qu 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p4f      -4p8f      
2773    qu 2D3838       191.2     0.     239.0 FIXEDHF     0.800  0       0.0  0                       
2774    qu 2E3838        35.4     0.      44.3 FIXEDHF     0.800  0       0.0  0                       
2775    qu 4E3838        23.1     0.      28.9 FIXEDHF     0.800  0       0.0  0                       
2776    qv 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p4f      -4p9f      
2777    qv 2D3838       158.0     0.     197.5 FIXEDHF     0.800  0       0.0  0                       
2778    qv 2E3838        30.6     0.      38.3 FIXEDHF     0.800  0       0.0  0                       
2779    qv 4E3838        20.0     0.      25.0 FIXEDHF     0.800  0       0.0  0                       
2780    rs 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5f      -4p6f      
2781    rs 2D3838       277.7     0.     347.1 FIXEDHF     0.800  0       0.0  0                       
2782    rs 2E3838        44.6     0.      55.7 FIXEDHF     0.800  0       0.0  0                       
2783    rs 4E3838        29.0     0.      36.3 FIXEDHF     0.800  0       0.0  0                       
2784    rt 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5f      -4p7f      
2785    rt 2D3838       213.3     0.     266.6 FIXEDHF     0.800  0       0.0  0                       
2786    rt 2E3838        37.8     0.      47.2 FIXEDHF     0.800  0       0.0  0                       
2787    rt 4E3838        24.6     0.      30.8 FIXEDHF     0.800  0       0.0  0                       
2788    ru 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5f      -4p8f      
2789    ru 2D3838       171.4     0.     214.2 FIXEDHF     0.800  0       0.0  0                       
2790    ru 2E3838        32.3     0.      40.4 FIXEDHF     0.800  0       0.0  0                       
2791    ru 4E3838        21.0     0.      26.3 FIXEDHF     0.800  0       0.0  0                       
2792    rv 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5f      -4p9f      
2793    rv 2D3838       142.0     0.     177.5 FIXEDHF     0.800  0       0.0  0                       
2794    rv 2E3838        27.9     0.      34.9 FIXEDHF     0.800  0       0.0  0                       
2795    rv 4E3838        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0                       
2796    st 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6f      -4p7f      
2797    st 2D3838       177.6     0.     222.0 FIXEDHF     0.800  0       0.0  0                       
2798    st 2E3838        32.2     0.      40.2 FIXEDHF     0.800  0       0.0  0                       
2799    st 4E3838        21.0     0.      26.2 FIXEDHF     0.800  0       0.0  0                       
2800    su 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6f      -4p8f      
2801    su 2D3838       143.0     0.     178.8 FIXEDHF     0.800  0       0.0  0                       
2802    su 2E3838        27.5     0.      34.4 FIXEDHF     0.800  0       0.0  0                       
2803    su 4E3838        17.9     0.      22.4 FIXEDHF     0.800  0       0.0  0                       
2804    sv 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6f      -4p9f      
2805    sv 2D3838       118.7     0.     148.4 FIXEDHF     0.800  0       0.0  0                       
2806    sv 2E3838        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0                       
2807    sv 4E3838        15.5     0.      19.4 FIXEDHF     0.800  0       0.0  0                       
2808    tu 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p7f      -4p8f      
2809    tu 2D3838       119.2     0.     149.0 FIXEDHF     0.800  0       0.0  0                       
2810    tu 2E3838        23.4     0.      29.2 FIXEDHF     0.800  0       0.0  0                       
2811    tu 4E3838        15.2     0.      19.0 FIXEDHF     0.800  0       0.0  0                       
2812    tv 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p7f      -4p9f      
2813    tv 2D3838        99.1     0.     123.9 FIXEDHF     0.800  0       0.0  0                       
2814    tv 2E3838        20.2     0.      25.2 FIXEDHF     0.800  0       0.0  0                       
2815    tv 4E3838        13.2     0.      16.5 FIXEDHF     0.800  0       0.0  0                       
2816    uv 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p8f      -4p9f      
2817    uv 2D3838        83.6     0.     104.5 FIXEDHF     0.800  0       0.0  0                       
2818    uv 2E3838        17.3     0.      21.6 FIXEDHF     0.800  0       0.0  0                       
2819    uv 4E3838        11.3     0.      14.1 FIXEDHF     0.800  0       0.0  0                       
