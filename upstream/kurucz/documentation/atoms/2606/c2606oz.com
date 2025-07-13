$SET def 2606
$SET VERIFY=NOIMAGE
$ASSIGN B2606OZ.PUN FOR007
$ASSIGN POOLQ:H2606OZ.HAM FOR001
$ASSIGN POOLQ:C2606OZ.EIG FOR003
$ASSIGN POOLG:B2606OZ15 FOR015
$ASSIGN POOLG:B2606OZ16 FOR016
$RUN CRAY:LEAST3007
1Ekberg, J.O. 1981. Physica Scripta 23, 7-20.
2Ekberg, J.O. and Feldman, U. 2003.  ApjSupp 148, 567-574. 3d4d
3Young, P.R. and Landi, E. 2009.  Ap.J. 707, 173-192.
4
5
6
7
8
9
    1    0    0    0        .3       1.5
    1  .7         50  120  160  150  120   90   50   30   20   10   10   10   10
  26.06
p5d3      p5d2 4d   p5d2 5d   p5d2 6d   p5d2 7d   p5d2 8d   p5d2 9d   p5d2 4s
3d4p      3d5p      3d6p      3d7p      3d8p      3d9p      3d10p     3d11p
3d12p     3d13p     3d14p     4s4p      4s5p      4s6p      4s7p      4s8p
4s9p      4s10p     4s11p     4s12p     4s13p     3d4f      3d5f      3d6f
3d7f      3d8f      3d9f      3d10f     3d11f     3d12f     3d13f     4s4f
4s5f      4s6f      4s7f      4s8f      4s9f      4s10f     4s11f     4s12f
4s13f     3d6h      3d7h      3d8h      3d9h      4s6h      4s7h      4s8h
4s9h      4s8k      4s9k      3d8k      3d9k
  -1.
1  0.0                           3p5 3d3(4F) 5D           d3(4F) 5D
1  0.0                           3p5 3d3(2P) 3P           d3(2P) 3P
0  0.0    437001.3               3p6 3d4p 3P              3d4p 3P
1  0.0                           3p5 3d3(2P) 1S           d3(2P) 1S
1  0.0                           3p5 3d3(4P) 5D           d3(4P) 5D
1  0.0                           3p5 3d3(4P) 3P           d3(4P) 3P
1  0.0                           3p5 3d3(2D) 3P           d3(2D) 3P
1  0.0                           3p5 3d3(4P) 3P           d3(4P) 3P
0  0.0    668489.                3p6 3d4f 3P              3d4f 3P
1  0.0                           3p6 3d5p 3P              3d5p 3P
1  0.0                           3p5 3d2(4F)4s 5D         d2(4F)s 5D
0  0.0    773488.                3p5 3d2(2P)4s 3P         d2(2P)s 3P
1  0.0                           3p5 3d2(2D)4s 3P         d2(2D)s 3P
0  0.0    789365.                3p6 3d5f 3P              3d5f 3P
1  0.0                           3p6 3d6p 3P              3d6p 3P
1  0.0                           3p5 3d2(4F)4s 5D         d2(4F)s 5D
1  0.0                           3p6 4s4p 3P              4s4p 3P
1  0.0                           3p5 3d2(2P)4s 1S         d2(2P)s 1S
0  0.0    857082.                3p6 3d6f 3P              3d6f 3P
1  0.0                           3p6 3d7p 3P              3d7p 3P
1  0.0                           3p5 3d2(2S)4s 3P         d2(2S)s 3P
1  0.0                           3p6 3d7f 3P              3d7f 3P
1  0.0                           3p5 3d2(4P)4s 3P         d2(4P)s 3P
1  0.0                           3p6 3d8p 3P              3d8p 3P
1  0.0                           3p6 3d8f 3P              3d8f 3P
1  0.0                           3p6 3d9p 3P              3d9p 3P
1  0.0                           3p6 3d9f 3P              3d9f 3P
1  0.0                           3p6 3d10p 3P             3d10p 3P
1  0.0                           3p5 3d2(4F)4d 5D         d2(4F)d 5D
1  0.0                           3p6 3d10f 3P             3d10f 3P
1  0.0                           3p6 3d11p 3P             3d11p 3P
1  0.0                           3p5 3d2(4F)4d 3P         d2(4F)d 3P
1  0.0                           3p6 3d12p 3P             3d12p 3P
1  0.0                           3p6 3d11f 3P             3d11f 3P
1  0.0                           3p5 3d2(4F)4d 5D2        d2(4F)d5D2
1  0.0                           3p6 3d13p 3P             3d13p 3P
1  0.0                           3p6 3d12f 3P             3d12f 3P
1  0.0                           3p6 3d14p 3P             3d14p 3P
1  0.0                           3p6 3d13f 3P             3d13f 3P
0 -1.0
1  1.0                           3p5 3d3(4F) 5D           d3(4F) 5D
1  1.0                           3p5 3d3(4F) 5F           d3(4F) 5F
0  1.0    425128.6               3p6 3d4p 3D              3d4p 3D
1  1.0                           3p5 3d3(2P) 3P           d3(2P) 3P
1  1.0                           3p5 3d3(2D) 3D           d3(2D) 3D
0  1.0    436952.2               3p6 3d4p 3P              3d4p 3P
0  1.0    443447.0               3p6 3d4p 1P              3d4p 1P
1  1.0                           3p5 3d3(2P) 3D           d3(2P) 3D
1  1.0                           3p5 3d3(4P) 5D           d3(4P) 5D
1  1.0                           3p5 3d3(4P) 5P           d3(4P) 5P
1  1.0                           3p5 3d3(4P) 3P           d3(4P) 3P
1  1.0                           3p5 3d3(2P) 3S           d3(2P) 3S
1  1.0                           3p5 3d3(4P) 3D           d3(4P) 3D
1  1.0                           3p5 3d3(2D) 1P           d3(2D) 1P
1  1.0                           3p5 3d3(2D) 3P           d3(2D) 3P
1  1.0                           3p5 3d3(2D) 3D2          d3(2D) 3D2
1  1.0                           3p5 3d3(2F) 3D           d3(2F) 3D
0  1.0    561303.                3p5 3d3(4P) 3P           d3(4P) 3P
1  1.0    598638.                3p5 3d3(2P) 1P           d3(2P) 1P
1  1.0    604270.                3p5 3d3(4F) 3D           d3(4F) 3D
   1.0    623699.                3p5 3d3(4P) 3S           d3(4P) 3S
   1.0    630283.                3p5 3d3(b2D) 1P          d3(b2D) 1P
0  1.0    665832.                3p6 3d4f 3D              3d4f 3D
0  1.0    668253.                3p6 3d4f 3P              3d4f 3P
0  1.0    672820.                3p6 3d4f 1P              3d4f 1P
1  1.0                           3p6 3d5p 3D              3d5p 3D
1  1.0                           3p6 3d5p 3P              3d5p 3P
1  1.0                           3p6 3d5p 1P              3d5p 1P
1  1.0                           3p5 3d2(4F)4s 5D         d2(4F)s 5D
0  1.0    745556.                3p5 3d2(2F)4s 3D         d2(2F)s 3D
1  1.0                           3p5 3d2(4P)4s 5P         d2(4P)s 5P
1  1.0                           3p5 3d2(4F)4s 5F         d2(4F)s 5F
0  1.0    771612.                3p5 3d2(2P)4s 3P         d2(2P)s 3P
1  1.0                           3p5 3d2(2D)4s 3D         d2(2D)s 3D
1  1.0                           3p5 3d2(2D)4s 3P         d2(2D)s 3P
0  1.0    787945.                3p6 3d5f 3D              3d5f 3D
0  1.0    789172.                3p6 3d5f 3P              3d5f 3P
0  1.0    790708.                3p6 3d5f 1P              3d5f 1P
1  1.0                           3p5 3d2(2D)4s 1P         d2(2D)s 1P
1  1.0                           3p6 3d6p 3D              3d6p 3D
1  1.0                           3p5 3d2(4P)4s 5D         d2(4P)s 5D
1  1.0                           3p6 3d6p 3P              3d6p 3P
1  1.0                           3p6 3d6p 1P              3d6p 1P
1  1.0                           3p6 4s4p 3P              4s4p 3P
0  1.0    817195.                3p5 3d2(2P)4s 3D         d2(2P)s 3D
0  1.0    822689.                3p5 3d2(4P)4s 3D         d2(4P)s 3D
0  1.0    826106.                3p5 3d2(4P)4s 3S         d2(4P)s 3S
0  1.0    837472.                3p5 3d2(2P)4s 3S         d2(2P)s 3S
1  1.0                           3d6 4s4p 1P              4s4p 1P
0  1.0    855346.                3p6 3d6f 3D              3d6f 3D
0  1.0    856975.                3p6 3d6f 3P              3d6f 3P
1  1.0                           3p6 3d6f 1P              3d6f 1P
1  1.0                           3p5 3d2(2S)4s 3P         d2(2S)s 3P
1  1.0                           3p6 3d7p 3D              3d7p 3D
1  1.0                           3p6 3d7p 3P              3d7p 3P
1  1.0                           3p6 3d7p 1P              3d7p 1P
1  1.0                           3p5 3d2(2S)4s 1P         d2(2S)s 1P
1  1.0                           3p6 3d7f 3D              3d7f 3D
1  1.0                           3p6 3d7f 3P              3d7f 3P
1  1.0                           3p6 3d7f 1P              3d7f 1P
1  1.0                           3p6 3d8p 3D              3d8p 3D
1  1.0                           3p6 3d8p 3P              3d8p 3P
1  1.0                           3p6 3d8p 1P              3d8p 1P
1  1.0                           3p6 3d8f 3D              3d8f 3D
1  1.0                           3p6 3d8f 3P              3d8f 3P
1  1.0                           3p6 3d8f 1P              3d8f 1P
1  1.0                           3p6 3d9p 3P              3d9p 3P
1  1.0                           3p6 3d9p 3D              3d9p 3D
1  1.0                           3p6 3d9p 1P              3d9p 1P
1  1.0                           3p5 3d2(4P)4s 3P         d2(4P)s 3P
1  1.0                           3p5 3d2(4P)4s 1P         d2(4P)s 1P
1  1.0                           3p5 3d2(4P)4s 3D         d2(4P)s 3D
1  1.0                           3p6 3d9f 3D              3d9f 3D
1  1.0                           3p6 3d9f 3P              3d9f 3P
1  1.0                           3p6 3d9f 1P              3d9f 1P
1  1.0                           3p6 3d10p 3P             3d10p 3P
1  1.0                           3p6 3d10p 3D             3d10p 3D
1  1.0                           3p6 3d10p 1P             3d10p 1P
1  1.0                           3p5 3d2(4F)4d 5P         d2(4F)d 5P
1  1.0                           3p5 3d2(4F)4d 5F         d2(4F)d 5F
1  1.0                           3p6 3d10f 3D             3d10f 3D
1  1.0
1  1.0                           3p6 3d10f 3P             3d10f 3P
1  1.0                           3p6 3d10f 1P             3d10f 1P
1  1.0
1  1.0                           3p6 3d11p 3D             3d11p 3D
1  1.0                           3p6 3d11p 3P             3d11p 3P
1  1.0
1  1.0                           3p6 3d11p 1P             3d11p 1P
1  1.0                           3p6 3d11f 3D             3d11f 3D
1  1.0
1  1.0                           3p6 3d12p 3D             3d12p 3D
1  1.0                           3p6 3d12p 3P             3d12p 3P
1  1.0                           3p6 3d11f 3P             3d11f 3P
1  1.0                           3p6 3d11f 1P             3d11f 1P
1  1.0                           3p6 3d12p 1P             3d12p 1P
1  1.0
1  1.0                           3p6 3d12f 3D             3d12f 3D
1  1.0                           3p6 3d13p 3D             3d13p 3D
1  1.0                           3p6 3d13p 3P             3d13p 3P
1  1.0                           3p6 3d12f 3P             3d12f 3P
1  1.0                           3p6 3d12f 1P             3d12f 1P
1  1.0                           3p6 3d13p 1P             3d13p 1P
1  1.0
1  1.0
1  1.0                           3p6 3d13f 3D             3d13f 3D
1  1.0                           3p6 3d14p 3D             3d14p 3D
1  1.0                           3p6 3d14p 3P             3d14p 3P
1  1.0
1  1.0                           3p6 3d13f 3P             3d13f 3P
1  1.0                           3p6 3d13f 1P             3d13f 1P
1  1.0                           3p6 3d14p 1P             3d14p 1P
1  1.0
1 -1.0
   2.0    389342.                3p5 3d3(4P) 5S           d3(4P) 5S
   2.0    395436.                3p5 3d3(4F) 5D           d3(4F) 5D
1  2.0                           3p5 3d3(4F) 5F           d3(4F) 5F
1  2.0                           3p5 3d3(2G) 3F           d3(2G) 3F
1  2.0                           3p5 3d3(4F) 5G           d3(4F) 5G
1  2.0                           3p5 3d3(2D) 3D           d3(2D) 3D
0  2.0    425386.1               3p6 3d4p 1D              3d4p 1D
0  2.0    427784.7               3p6 3d4p 3D              3d4p 3D
0  2.0    430213.4               3p6 3d4p 3F              3d4p 3F
1  2.0
0  2.0    437558.0               3p6 3d4p 3P              3d4p 3P
1  2.0                           3p5 3d3(2P) 3D           d3(2P) 3D
1  2.0                           3p5 3d3(2D) 3F           d3(2D) 3F
1  2.0                           3p5 3d3(4P) 5D           d3(4P) 5D
1  2.0                           3p5 3d3(4P) 5P           d3(4P) 5P
1  2.0                           3p5 3d3(2P) 1D           d3(2P) 1D
1  2.0                           3p5 3d3(4P) 3P           d3(4P) 3P
1  2.0                           3p5 3d3(4P) 3D           d3(4P) 3D
1  2.0                           3p5 3d3(2D) 3F           d3(2D) 3F
1  2.0                           3p5 3d3(2F) 1D           d3(2F) 1D
1  2.0                           3p5 3d3(2D) 3P           d3(2D) 3P
1  2.0                           3p5 3d3(2D) 3F2          d3(2D) 3F2
1  2.0                           3p5 3d3(2D) 3D2          d3(2D) 3D2
0  2.0    538290.                3p5 3d3(a2D) 1D          d3(a2D) 1D
0  2.0    548274.                3p5 3d3(2F) 3D           d3(2F) 3D
0  2.0    553220.                3p5 3d3(2F) 1D           d3(2F) 1D
0  2.0    564425.                3p5 3d3(4F) 3F           d3(4F) 3F
0  2.0    565275.                3p5 3d3(4P) 3P           d3(4P) 3P
1  2.0    603757.                3p5 3d3(4F) 3D           d3(4F) 3D
0  2.0    660015.                3p6 3d4f 3F              3d4f 3F
0  2.0    663871.                3p6 3d4f 1D              3d4f 1D
0  2.0    665923.                3p6 3d4f 3D              3d4f 3D
0  2.0    667899.                3p6 3d4f 3P              3d4f 3P
1  2.0                           3p6 3d5p 1D              3d5p 1D
1  2.0                           3p6 3d5p 3D              3d5p 3D
1  2.0                           3p6 3d5p 3F              3d5p 3F
1  2.0                           3p6 3d5p 3P              3d5p 3P
1  2.0                           3p5 3d2(4F)4s 5D         d2(4F)s 5D
0  2.0    746965.                3p5 3d2(2F)4s 3D         d2(2F)s 3D
1  2.0                           3p5 3d2(4P)4s 5P         d2(4P)s 5P
1  2.0                           3p5 3d2(4F)4s 5G         d2(4F)s 5G
1  2.0                           3p5 3d2(4F)4s 5F         d2(4F)s 5F
0  2.0    768425.                3p5 3d2(2P)4s 3P         d2(2P)s 3P
1  2.0                           3p5 3d2(1G)4s 3F         d2(1G)s 3F
1  2.0                           3p5 3d2(2D)4s 3G         d2(2D)s 3D
0  2.0    779009.                3p5 3d2(2D)4s 1D         d2(2D)s 1D
0  2.0    784733.                3p6 3d5f 3F              3d5f 3F
1  2.0                           3p5 3d2(2F)4s 3F         d2(2F)s 3F
0  2.0    786830.                3p6 3d5f 1D              3d5f 1D
0  2.0    788030.                3p6 3d5f 3D              3d5f 3D
0  2.0    788995.                3p6 3d5f 3P              3d5f 3P
1  2.0                           3p5 3d2(2D)4s 3P         d2(2D)s 3P
1  2.0                           3p6 3d6p 1D              3d6p 1D
1  2.0                           3p6 3d6p 3F              3d6p 3F
1  2.0                           3p5 3d2(4P)4s 5D         d2(4P)s 5D
1  2.0                           3p6 3d6p 3D              3d6p 3D
1  2.0                           3p6 3d6p 3P              3d6p 3P
1  2.0                           3p5 3d2(2D)4s 3F         d2(2D)s 3F
0  2.0    813877.                3p5 3d2(2P)4s 3D         d2(2P)s 3D
1  2.0                           3p6 4s4p 3P              3p6 4s4p
1  2.0                           3p5 3d2(4P)4s 5S         d2(4P)s 5S
0  2.0    824184.                3p5 3d2(4P)4s 3D         d2(4P)s 3D
0  2.0    829626.                3p5 3d2(2P)4s 1D         d2(2P)s 1D
   2.0    853433.                3p6 3d6f 3F              3d6f 3F
   2.0    854838.                3p6 3d6f 1D              3d6f 1D
0  2.0    855903.                3p6 3d6f 3D              3d6f 3D
0  2.0    856811.                3p6 3d6f 3P              3d6f 3P
1  2.0                           3p5 3d2(1S)4s 3P         d2(1S)s 3P
1  2.0                           3p6 3d6h 3F              3d6h 3F
1  2.0                           3p6 3d7p 3F              3d7p 3F
1  2.0                           3p6 3d7p 3D              3d7p 3D
1  2.0                           3p6 3d7p 1D              3d7p 1D
1  2.0                           3p6 3d7p 3P              3d7p 3P
1  2.0                           3p5 3d2(2F)4s 3F         d2(2F)s 3F
0  2.0    894718.                3p6 3d7f 3F              3d7f 3F
1  2.0                           3p6 3d7f 3P              3d7f 3P
1  2.0                           3p6 3d7f 1D              3d7f 1D
1  2.0                           3p6 3d7f 3D              3d7f 3D
1  2.0                           3p6 3d7h 3F              3d7h 3F
1  2.0                           3p6 3d8p 3D              3d8p 3D
1  2.0                           3p6 3d8p 3F              3d8p 3F
1  2.0                           3p6 3d8p 1D              3d8p 1D
1  2.0                           3p6 3d8p 3P              3d8p 3P
1  2.0                           3p6 3d8f 3F              3d8f 3F
1  2.0                           3p6 3d8f 3P              3d8f 3P
1  2.0                           3p6 3d8f 1D              3d8f 1D
1  2.0                           3p6 3d8f 3D              3d8f 3D
1  2.0                           3p6 3d8h 3F              3d8h 3F
1  2.0                           3p6 3d9p 3D              3d9p 3D
1  2.0                           3p6 3d9p 3F              3d9p 3F
1  2.0                           3p6 3d9p 3P              3d9p 3P
1  2.0                           3p6 3d9p 1D              3d9p 1D
   2.0    928684.                3p5 3d2(4P)4s 3P         d2(4P)s 3P
1  2.0                           3p5 3d2(2F)4s 3D         d2(2F)s 3D
1  2.0                           3p6 3d9f 3F              3d9f 3F
1  2.0                           3p6 3d9f 3P              3d9f 3P
1  2.0                           3p5 3d2(2F)4s 1D         d2(2F)s 1D
1  2.0                           3p6 3d9f 1D              3d9f 1D
1  2.0                           3p6 3d9f 3D              3d9f 3D
1  2.0                           3p6 3d10p 3F             3d10p 3F
1  2.0                           2p6 3d9h 3F              3d9h 3F
1  2.0                           3p6 3d10p 3D             3d10p 3D
1  2.0                           3p6 3d10p 3P             3d10p 3P
1  2.0                           3p6 3d10p 1D             3d10p 1D
1  2.0                           3p5 3d2(4F)4d 5G         d2(4F)d 5G
1  2.0                           3p5 3d2(4F)4d 5P         d2(4F)d 5P
1  2.0                           3p5 3d2(4F)4d 5F         d2(4F)d 5F
1  2.0                           3p6 3d10f 3F             3d10f 3F
1  2.0                           3p6 3d10f 3P             3d10f 3P
1  2.0
1  2.0                           3p6 3d10f 1D             3d10f 1D
1  2.0                           3p6 3d10f 3D             3d10f 3D
1  2.0                           3p6 3d11p 3F             3d11p 3F
1  2.0                           3p6 3d11p 3D             3d11p 3D
1  2.0
1  2.0                           3p6 3d11p 1D             3d11p 1D
1  2.0                           3p6 3d11p 3P             3d11p 3P
1  2.0
1  2.0                           3p6 3d11f 3F             3d11f 3F
1  2.0                           3p6 3d11f 3P             3d11f 3P
1  2.0
1  2.0                           3p6 3d12p 3F             3d12p 3F
1  2.0                           3p6 3d12p 3D             3d12p 3D
1  2.0                           3p6 3d11f 1D             3d11f 1D
1  2.0                           3p6 3d11f 3D             3d11f 3D
1  2.0                           3p6 3d12p 1D             3d12p 1D
1  2.0                           3p6 3d12p 3P             3d12p 3P
1  2.0
1  2.0                           3p6 3d12f 3F             3d12f 3F
1  2.0                           3p6 3d12f 3P             3d12f 3P
1  2.0
1  2.0                           3p6 3d13p 3F             3d13p 3F
1  2.0                           3p6 3d13p 3D             3d13p 3D
1  2.0                           3p6 3d12f 1D             3d12f 1D
1  2.0                           3p6 3d12f 3D             3d12f 3D
1  2.0                           3p6 3d13p 1D             3d13p 1D
1  2.0                           3p6 3d13p 3P             3d13p 3P
1  2.0
1  2.0
1  2.0                           3p6 3d13f 3F             3d13f 3F
1  2.0                           3p6 3d13f 3P             3d13f 3P
1  2.0
1  2.0                           3p6 3d14p 3F             3d14p 3F
1  2.0                           3p6 3d14p 3D             3d14p 3D
1  2.0
1  2.0
1  2.0                           3p6 3d13f 1D             3d13f 1D
1  2.0                           3p6 3d13f 3D             3d13f 3D
1  2.0
1  2.0                           3p6 3d14p 1D             3d14p 1D
1  2.0                           3p6 3d14p 3P             3d14p 3P
1 -1.0
   3.0    395496.                3p5 3d3(4F) 5D           d3(4F) 5D
   3.0    404893.                3p5 3d3(4F) 5F           d3(4F) 5F
1  3.0                           3p5 3d3(4F) 5G           d3(4F) 5G
1  3.0                           3p5 3d3(2G) 3F           d3(2G) 3F
1  3.0                           3p5 3d3(2D) 3D           d3(2D) 3D
1  3.0                           3p5 3d3(2H) 3G           d3(2H) 3G
   3.0    430948.6               3p6 3d4p 3D              3d4p 3D
0  3.0    431609.5               3p6 3d4p 3F              3d4p 3F
0  3.0    439811.6               3p6 3d4p 1F              3d4p 1F
1  3.0                           3p5 3d3(2P) 3D           d3(2P) 3D
1  3.0                           3p5 3d3(2D) 3F           d3(2D) 3F
1  3.0                           3p5 3d3(4P) 5P           d3(4P) 5P
1  3.0                           3p5 3d3(4F) 3G           d3(4F) 3G
1  3.0                           3p5 3d3(4P) 5D           d3(4P) 5D
1  3.0                           3p5 3d3(2D) 1F           d3(2D) 1F
1  3.0                           3p5 3d3(4P) 3D           d3(4P) 3D
1  3.0                           3p5 3d3(2D) 3F2          d3(2D) 3F2
0  3.0    481435.                3p5 3d3(2F) 3G           d3(2F) 3G
0  3.0    510086.                3p5 3d3(2H) 3G           d3(2H) 3G
1  3.0                           3p5 3d3(2D) 3F           d3(2D) 3F
1  3.0                           3p5 3d3(2D) 1F           d3(2D) 1F
1  3.0                           3p5 3d3(2D) 3D           d3(2D) 3D
0  3.0    551568.                3p5 3d3(2F) 3D           d3(2F) 3D
0  3.0    556422.                3p5 3d3(2G) 1F           d3(2G) 1F
0  3.0    566256.                3p5 3d3(4F) 3F           d3(4F) 3F
1  3.0    603419.                3p5 3d3(4F) 3D           d3(4F) 3D
1  3.0                           3p5 3d3(2F) 1F           d3(2F) 1F
0  3.0    660358.                3p6 3d4f 3F              3d4f 3F
0  3.0    663097.                3p6 3d4f 3G              3d4f 3G
0  3.0    665417.                3p6 3d4f 1F              3d4f 1F
0  3.0    666651.                3p6 3d4f 3D              3d4f 3D
1  3.0                           3p6 3d5p 3F              3d5p 3F
1  3.0                           3p6 3d5p 3D              3d5p 3D
1  3.0                           3p6 3d5p 1F              3d5p 1F
1  3.0                           3p5 3d2(4F)4s 5D         d2(4F)s 5D
0  3.0    749166.                3p5 3d2(2F)4s 3D         d2(2F)s 3D
1  3.0                           3p5 3d2(4P)4s 5P         d2(4P)s 5P
1  3.0                           3p5 3d2(4F)4s 5G         d2(4F)s 5G
1  3.0                           3p5 3d2(4F)4s 5F         d2(4F)s 5F
1  3.0    769991.                3p5 3d2(2F)4s 3G         d2(2F)s 3G
1  3.0                           3p5 3d2(2D)4s 3D         d2(2D)s 3D
   3.0    778420.                3p5 3d2(2G)4s 3F         d2(2G)s 3F
0  3.0    783119.                3p5 3d2(2F)4s 3F         d2(2F)s 3F
0  3.0    785012.                3p6 3d5f 3F              3d5f 3F
1  3.0                           3p5 3d2(2G)4s 1F         d2(2G)s 1F
0  3.0    786732.                3p6 3d5f 3G              3d5f 3G
0  3.0    788303.                3p6 3d5f 3D              3d5f 3D
0  3.0    789215.                3p6 3d5f 1F              3d5f 1F
0  3.0    794149.                3p5 3d2(4F)4s 3G         d2(4F)s 3G
0  3.0    797257.                3p5 3d2(4F)4s 3F         d2(4F)s 3F
1  3.0                           3p5 3d2(4P)4s 5G         d2(4P)s 5D
1  3.0                           3p6 3d6p 3F              3d6p 3F
1  3.0                           3p6 3d6p 3D              3d6p 3D
1  3.0                           3p6 3d6p 1F              3d6p 1F
1  3.0    807627.                3p5 3d2(2D)4s 1F         d2(2D)s 1F
0  3.0    812086.                3p5 3d2(2P)4s 3D         d2(2P)s 3D
0  3.0    827533.                3p5 3d2(4P)4s 3D         d2(4P)s 3D
0  3.0    833128.                3p5 3d2(2G)4s 3G         d2(2G)s 3G
0  3.0    853697.                3p6 3d6f 3F              3d6f 3F
0  3.0    854760.                3p6 3d6f 3G              3d6f 3G
0  3.0    856109.                3p6 3d6f 3D              3d6f 3D
0  3.0    856797.                3p6 3d6f 1F              3d6f 1F
1  3.0                           3p6 3d6h 1F              3d6h 1F
1  3.0                           3p6 3d6h 3G              3d6h 3G
1  3.0                           3p6 3d6h 3F              3d6h 3F
1  3.0                           3p6 3d7p 3F              3d7p 3F
1  3.0                           3p6 3d7p 3D              3d7p 3D
1  3.0                           3p6 3d7p 1F              3d7p 1F
1  3.0                           3p5 3d2(2F)4s 3F         d2(2F)s 3F
1  3.0                           3p5 3d2(2G)4s 1F         d2(2G)s 1F
0  3.0    894944.                3p6 3d7f 3F              3d7f 3F
0  3.0    895744.                3p6 3d7f 3G              3d7f 3G
1  3.0                           3p6 3d7f 3D              3d7f 3D
1  3.0                           3p6 3d7f 1F              3d7f 1F
1  3.0                           3p6 3d7h 1F              3d7h 1F
1  3.0                           3p6 3d7h 3G              3d7h 3G
1  3.0                           3p6 3d7h 3F              3d7h 3F
1  3.0                           3p6 3d8p 3F              3d8p 3F
1  3.0                           3p6 3d8p 3D              3d8p 3D
1  3.0                           3p6 3d8p 1F              3d8p 1F
0  3.0    921694.                3p6 3d8f 3F              3d8f 3F
1  3.0                           3p6 3d8f 3G              3d8f 3G
1  3.0                           3p6 3d8f 3D              3d8f 3D
1  3.0                           3p6 3d8h 1F              3d8h 1F
1  3.0                           3p6 3d8f 1F              3d8f 1F
1  3.0                           3p6 3d8h 3G              3d8h 3G
1  3.0                           3p6 3d8h 3F              3d8h 3F
1  3.0                           3p6 3d9p 3F              3d9p 3F
1  3.0                           3p6 3d9p 3D              3d9p 3D
1  3.0                           3p6 3d9p 1F              3d9p 1F
1  3.0                           3p5 3d2(2F)4s 3D         d2(2F)s 3D
1  3.0                           3p6 3d9f 3F              3d9f 3F
1  3.0                           3p6 3d9f 3G              3d9f 3G
1  3.0                           3p6 3d9h 1F              3d9h 1F
1  3.0                           3p6 3d9f 3D              3d9f 3D
1  3.0                           3p6 3d9f 1F              3d9f 1F
1  3.0                           3p6 3d9h 3G              3d9h 3G
1  3.0                           3p6 3d10p 3F             3d10p 3F
1  3.0                           3p6 3d9h 3F              3d9h 3F
1  3.0                           3p6 3d10p 1F             3d10p 1F
1  3.0                           3p6 3d10p 3D             3d10p 3D
1  3.0                           3p5 3d2(4F)4d 5G         d2(4F)d 5G
1  3.0                           3p5 3d2(4F)4d 5P         d2(4F)d 5P
1  3.0                           3p5 3d2(4F)4d 5F         d2(4F)d 5F
1  3.0                           3p6 3d10f 3F             3d10f 3F
1  3.0                           3p6 3d10f 3G             3d10f 3G
1  3.0                           3p6 3d10f 3D             3d10f 3D
1  3.0
1  3.0                           3p6 3d10f 1F             3d10f 1F
1  3.0                           3p6 3d11p 3F             3d11p 3F
1  3.0
1  3.0                           3p6 3d11p 1F             3d11p 1F
1  3.0                           3p6 3d11p 3D             3d11p 3D
1  3.0
1  3.0
1  3.0                           3p6 3d11f 3F             3d11f 3F
1  3.0                           3p6 3d11f 3G             3d11f 3G
1  3.0                           3p6 3d12p 3F             3d12p 3F
1  3.0                           3p6 3d11f 3D             3d11f 3D
1  3.0                           3p6 3d11f 1F             3d11f 1F
1  3.0                           3p6 3d12p 3D             3d12p 3D
1  3.0                           3p6 3d12p 1F             3d12p 1F
1  3.0
1  3.0                           3p6 3d12f 3F             3d12f 3F
1  3.0                           3p6 3d12f 3G             3d12f 3G
1  3.0
1  3.0                           3p6 3d13p 3F             3d13p 3F
1  3.0                           3p6 3d12f 3D             3d12f 3D
1  3.0                           3p6 3d12f 1F             3d12f 1F
1  3.0
1  3.0                           3p6 3d13p 3D             3d13p 3D
1  3.0                           3p6 3d13p 1F             3d13p 1F
1  3.0
1  3.0
1  3.0                           3p6 3d13f 3F             3d13f 3F
1  3.0                           3p6 3d13f 3G             3d13f 3G
1  3.0
1  3.0                           3p6 3d14p 3F             3d14p 3F
1  3.0
1  3.0                           3p6 3d13f 3D             3d13f 3D
1  3.0                           3p6 3d13f 1F             3d13f 1F
1  3.0
1  3.0                           3p6 3d14p 1F             3d14p 1F
1  3.0                           3p6 3d14p 3D             3d14p 3D
1 -1.0
   4.0    395954.                3p5 3d3(4F) 5D           d3(4F) 5D
   4.0    404893.                3p5 3d3(4F) 5F           d3(4F) 5F
1  4.0                           3p5 3d3(4F) 5G           d3(4F) 5G
1  4.0                           3p5 3d3(2G) 3F           d3(2G) 3F
1  4.0                           3p5 3d3(2H) 3G           d3(2H) 3G
0  4.0    433871.2               3p6 3d4p 3F              3d4p 3F
1  4.0                           3p5 3d3(2G) 1G           d3(2G) 1G
1  4.0                           3p5 3d3(2D) 3F           d3(2D) 3F
1  4.0                           3p5 3d3(2G) 3H           d3(2G) 3H
1  4.0                           3p5 3d3(4F) 5D           d3(4F) 5D
1  4.0                           3p5 3d3(4F) 3G           d3(4F) 3G
1  4.0                           3p5 3d3(2H) 3H           d3(2H) 3H
1  4.0                           3p5 3d3(2D) 3F           d3(2D) 3F
1  4.0    472903.                3p5 3d3(2F) 3G           d3(2F) 3G
1  4.0    496454.                3p5 3d3(2F) 1G           d3(2F) 1G
1  4.0                           3p5 3d3(2D) 3F           d3(2D) 3F
1  4.0    510158.                3p5 3d3(2H) 3G           d3(2H) 3G
0  4.0    568118.                3p5 3d3(4F) 3F           d3(4F) 3F
0  4.0    605489.                3p5 3d3(2H) 1G           d3(2H) 1G
1  4.0                           3p6 3d4f 3H              3d4f 3H
0  4.0    659917.                3p6 3d4f 1G              3d4f 1G
0  4.0    661169.                3p6 3d4f 3F              3d4f 3F
0  4.0    663950.                3p6 3d4f 3G              3d4f 3G
1  4.0                           3p6 3d5p 3F              3d5p 3F
1  4.0                           3p5 3d2(4F)4s 5D         d2(4F)s 5D
1  4.0                           3p5 3d2(4F)4s 5G         d2(4F)s 5G
0  4.0    768813.                3p5 3d2(2F)4s 3G         d2(2F)s 3G
1  4.0                           3p5 3d2(4F)4s 5F         d2(4F)s 5F
0  4.0    779575.                3p5 3d2(2G)4s 3F         d2(2G)s 3F
1  4.0    784477.                3p6 3d5f 3H              3d5f 3H
1  4.0    782690.                3p5 3d2(2F)4s 3F         d2(3F)s 3F
0  4.0    784174.                3p6 3d5f 1G              3d5f 1G
0  4.0    785809.                3p6 3d5f 3F              3d5f 3F
0  4.0    787737.                3p6 3d5f 3G              3d5f 3G
1  4.0                           3p5 3d2(2D)4s 3F         d2(2D)s 3F
0  4.0    797712.                3p5 3d2(4F)4s 3G         d2(4F)s 3G
1  4.0                           3p5 3d2(2G)4s 3H         d2(2G)s 3H
1  4.0                           3p5 3d2(2P)4s 5D         d2(2P)s 5D
1  4.0                           3o6 3d6p 3F              3d6p 3F
1  4.0    802462.                3p5 3d2(2F)4s 1G         d2(2F)s 1G
0  4.0    832893.                3p5 3d2(2G)4s 3G         d2(2G)s 3G
1  4.0                           3p5 3d2(2G)4s 1G         d2(2G)s 1G
0  4.0    852601.                3p6 3d6f 3H              3d6f 3H
0  4.0    853307.                3p6 3d6f 1G              3d6f 1G
0  4.0    854767.                3p6 3d6f 3F              3d6f 3F
0  4.0    855969.                3p6 3d6f 3G              3d6f 3G
1  4.0                           3p6 3d6h 3H              3d6h 3H
1  4.0                           3p6 3d6h 3F              3d6h 3F
1  4.0                           3p6 3d6h 1G              3d6h 1G
1  4.0                           3p6 3d6h 3F              3d6h 3F
1  4.0                           3p6 3d7p 3F              3d7p 3F
1  4.0                           3p5 3d2(2F)4s 3F         d2(2F)s 3F
1  4.0                           3p6 3d7f 3H              3d7f 3H
1  4.0                           3p6 3d7f 1G              3d7f 1G
0  4.0    896382.                3p6 3d7f 3F              3d7f 3F
0  4.0    897077.                3p6 3d7f 3G              3d7f 3G
1  4.0                           3p6 3d7h 3H              3d7h 3H
1  4.0                           3p6 3d7h 3F              3d7h 3F
1  4.0                           3p6 3d7h 1G              3d7h 1G
1  4.0                           3p6 3d7h 3F              3d7h 3F
1  4.0                           3p6 3d8p 3F              3d8p 3F
1  4.0                           3p6 3d8f 3H              3d8f 3H
1  4.0                           3p6 3d8f 1G              3d8f 1G
0  4.0    923282.                3p6 3d8f 3F              3d8f 3F
0  4.0    923716.                3p6 3d8f 3G              3d8f 3G
1  4.0                           3p6 3d8h 3H              3d8h 3H
1  4.0                           3p6 3d8h 3F              3d8h 3F
1  4.0                           3p6 3d8h 1G              3d8h 1G
1  4.0                           3p6 3d8h 3F              3d8h 3F
1  4.0                           3p6 3d8k 3H              3d8k 3H
1  4.0                           3p6 3d9p 3F              3d9p 3F
1  4.0                           3p6 3d9f 3H              3d9f 3H
1  4.0                           3p6 3d9f 1G              3d9f 1G
1  4.0                           3p6 3d9h 3H              3d9h 3H
1  4.0                           3p6 3d9h 3F              3d9h 3F
1  4.0                           3p6 3d9f 3F              3d9f 3F
0  4.0    941918.                3p6 3d9f 3G              3d9f 3G
1  4.0                           3p6 3d9h 1G              3d9h 1G
1  4.0                           3p6 3d9h 3H              3d9h 3H
1  4.0                           3p6 3d9k 3H              3d9k 3H
1  4.0                           3p6 3d10p 3F             3d10p 3F
1  4.0                           3p5 3d2(4F)4d 5G         d2(4F)d 5G
1  4.0                           3p6 3d10f 3H             3d10f 3H
1  4.0                           3p6 3d10f 1G             3d10f 1G
1  4.0                           3p5 3d2(4F)4d 5F         d2(4F)d 5F
1  4.0                           3p6 3d10f 3F             3d10f 3F
0  4.0    954904.                3p6 3d10f 3G             3d10f 3G
1  4.0                           3p5 3d2(4F)4d 5D         d2(4F)d 5D
1  4.0                           3p6 3d11p 3F             3d11p 3F
1  4.0
1  4.0
1  4.0                           3p6 3d11f 3H             3d11f 3H
1  4.0                           3p6 3d11f 1G             3d11f 1G
1  4.0                           3p6 3d11f 3F             3d11f 3F
1  4.0                           3p6 3d11f 3G             3d11f 3G
1  4.0                           3p6 3d12p 3F             3d12p 3F
1  4.0
1  4.0
1  4.0                           3p6 3d12f 3H             3d12f 3H
1  4.0                           3p6 3d12f 1G             3d12f 1G
1  4.0
1  4.0
1  4.0                           3p6 3d12f 3F             3d12f 3F
1  4.0                           3p6 3d12f 3G             3d12f 3G
1  4.0
1  4.0                           3p6 3d13p 3F             3d13p 3F
1  4.0                           3p6 3d13f 3H             3d13f 3H
1  4.0
1  4.0                           3p6 3d13f 1G             3d13f 1G
1  4.0
1  4.0                           3p6 3d13f 3F             3d13f 3F
1  4.0                           3p6 3d13f 3G             3d13f 3G
1  4.0
1  4.0
1  4.0                           3p6 3d14p 3F             3d14p 3F
1  4.0
1  4.0
1  4.0
1 -1.0
   5.0    404452.                3p5 3d3(4F) 5F           d3(4F) 5F
1  5.0                           3p5 3d3(4F) 5G           d3(4F) 5G
1  5.0                           3p5 3d3(2H) 3G           d3(2H) 3G
1  5.0                           3p5 3d3(2G) 3H           d3(2G) 3H
1  5.0                           3p5 3d3(2H) 3I           d3(2H) 3I
1  5.0                           3p5 3d3(4F) 3G           d3(4F) 3G
1  5.0    464034.                3p5 3d3(2G) 1H           d3(2G) 1H
1  5.0                           3p5 3d3(2H) 3H           d3(2H) 3H
1  5.0    472559.                3p5 3d3(2F) 3G           d3(2F) 3G
0  5.0    514133.                3p5 3d3(2H) 3G           d3(2H) 3G
   5.0    538566.                3p5 3d3(2H) 1H           d3(2H) 1H
1  5.0                           3p6 3d4f 3H              3d4f 3H
0  5.0    664482.                3p6 3d4f 3G              3d4f 3G
0  5.0    669978.                3p6 3d4f 1H              3d4f 1H
1  5.0                           3p5 3d2(4F)4s 5G         d2(4F)s 5G
0  5.0    766991.                3p5 3d2(2F)4s 3G         d2(2F)s 3G
1  5.0                           3p5 3d2(4F)4s 5F         d2(4F)s 5F
1  5.0                           3p6 3d5f 3H              3d5f 3H
0  5.0    788146.                3p6 3d5f 3G              3d5f 3G
0  5.0    791168.                3p6 3d5f 1H              3d5f 1H
1  5.0                           3p5 3d2(2G)4s 3H         d2(2G)s 3H
0  5.0    800633.                3p5 3d2(4F)4s 3G         d2(4F)s 3G
0  5.0    806033.                3p5 3d2(2G)4s 1H         d2(2G)s 1H
0  5.0    832889.                3p5 3d2(2G)4s 3G         d2(2G)s 3G
1  5.0                           3p6 3d6f 3H              3d6f 3H
0  5.0    856260.                3p6 3d6f 3G              3d6f 3G
0  5.0    857881.                3p6 3d6f 1H              3d6f 1H
1  5.0                           3p6 3d6h 3I              3d6h 3I
1  5.0                           3p6 3d6h 3H              3d6h 3H
1  5.0                           3p6 3d6h 1H              3d6h 1H
1  5.0                           3p6 3d6h 3G              3d6h 3G
1  5.0                           3p6 3d7f 3H              3d7f 3H
0  5.0    897254.                3p6 3d7f 3G              3d7f 3G
1  5.0                           3p6 3d7h 3I              3d7h 3I
1  5.0                           3p6 3d7h 3H              3d7h 3H
0  5.0    898243.                3p6 3d7f 1H              3d7f 1H
1  5.0                           3p6 3d7h 1H              3d7h 1H
1  5.0                           3p6 3d7h 3G              3d7h 3G
1  5.0                           3p6 3d8f 3H              3d8f 3H
0  5.0    923838.                3p6 3d8f 3G              3d8f 3G
1  5.0                           3p6 3d8h 3I              3d8h 3I
1  5.0                           3p6 3d8h 3H              3d8h 3H
1  5.0                           3p6 3d8k 1H              3d8k 1H
0  5.0    924479.                3p6 3d8f 1H              3d8f 1H
1  5.0                           3p6 3d8h 1H              3d8h 1H
1  5.0                           3p6 3d8h 3G              3d8h 3G
1  5.0                           3p6 3d8k 3I              3d8k 3I
1  5.0                           3p6 3d8k 3H              3d8k 3H
1  5.0                           3p6 3d9f 3H              3d9f 3H
1  5.0                           3p6 3d9h 3I              3d9h 3I
1  5.0                           3p6 3d9h 3H              3d9h 3H
1  5.0                           3p6 3d9k 1H              3d9k 1H
0  5.0    942022.                3p6 3d9f 3G              3d9f 3G
0  5.0    942477.                3p6 3d9f 1H              3d9f 1H
1  5.0                           3p6 3d9h 1H              3d9h 1H
1  5.0                           3p6 3d9h 3G              3d9h 3G
1  5.0                           3p6 3d9k 3I              3d9k 3I
1  5.0                           3p6 3d9k 3H              3d9k 3H
1  5.0                           3p5 3d2(4F)4d 5G         d2(4F)d 5G
1  5.0                           3p6 3d10f 3H             3d10f 3H
1  5.0                           3p5 3d2(4F)4d 5F         d2(4F)d 5F
0  5.0    954966.                3p6 3d10f 3G             3d10f 3G
0  5.0    955307.                3p6 3d10f 1H             3d10f 1H
1  5.0                           3p6 3d11f 3H             3d11f 3H
1  5.0
1  5.0                           3p6 3d11f 3G             3d11f 3G
1  5.0                           3p6 3d11f 1H             3d11f 1H
1  5.0                           3p5 3d2(4F)4d 5H         d2(4F)d 5H
1  5.0                           3p5 3d2(4F)4d 5I         d2(4F)d 5I
1  5.0                           3p5 3d2(4F)4d 5F         d2(4F)d 5F
1  5.0                           3p6 3d12f 3H             3d12f 3H
1  5.0
1  5.0                           3p6 3d12f 3G             3d12f 3G
1  5.0                           3p6 3d12f 1H             3d12f 1H
1  5.0
1  5.0                           3p6 3d13f 3H             3d13f 3H
1  5.0
1  5.0                           3p6 3d13f 3G             3d13f 3G
1  5.0                           3p6 3d13f 1H             3d13f 1H
1  5.0
1  5.0
1  5.0
1  5.0
1  5.0
0 -1.0
1  6.0                           3p5 3d3(4F) 5G           d3(4F) 5G
1  6.0                           3p5 3d3(2G) 3H           d3(2G) 3H
1  6.0                           3p5 3d3(2H) 3I           d3(2H) 3I
1  6.0                           3p5 3d3(2H) 1I           d3(2H) 1I
1  6.0                           3p5 3d3(3H) 3H           d3(2H) 3H
1  6.0                           3p6 3d4f 3H              3d4f 3H
1  6.0                           3p5 3d2(4F)4s 5G         d2(4F)s 5G
1  6.0                           3p6 3d5f 3H              3d5f 3H
1  6.0                           3p5 3d2(2G)4s 3H         d2(2G)s 3H
1  6.0                           3p6 3d6f 3H              3d6f 3H
1  6.0                           3p6 3d6h 3I              3d6h 3I
1  6.0                           3p6 3d6h 3K              3d6h 3K
1  6.0                           3p6 3d6h 3H              3d6h 3H
1  6.0                           3p6 3d6h 1I              3d6h 1I
1  6.0                           3p6 3d7f 3H              3d7f 3H
1  6.0                           3p6 3d7h 3I              3d7h 3I
1  6.0                           3p6 3d7h 3K              3d7h 3K
1  6.0                           3p6 3d7h 3H              3d7h 3H
1  6.0                           3p6 3d7h 1I              3d7h 1I
1  6.0                           3p6 3d8f 3H              3d8f 3H
1  6.0                           3p6 3d8h 1I              3d8h 1I
1  6.0                           3p6 3d8h 3I              3d8h 3I
1  6.0                           3p6 3d8k 1I              3d8k 1I
1  6.0                           3p6 3d8k 3H              3d8k 3H
1  6.0                           3p6 3d8h 3K              3d8h 3K
1  6.0                           3p6 3d8h 3H              3d8h 3H
1  6.0                           3p6 3d8k 3K              3d8k 3K
1  6.0                           3p6 3d8k 3I              3d8k 3I
1  6.0                           3p6 3d9h 3I              3d9h 3I
1  6.0                           3p6 3d9h 3K              3d9h 3K
1  6.0                           3p6 3d9f 3H              3d9f 3H
1  6.0                           3p6 3d9k 1I              3d9k 1I
1  6.0                           3p6 3d9k 3H              3d9k 3H
1  6.0                           3p6 3d9h 3H              3d9h 3H
1  6.0                           3p6 3d9h 1I              3d9h 1I
1  6.0                           3p6 3d9k 3K              3d9k 3K
1  6.0                           3p6 398k 3I              3d9k 3I
1  6.0                           3p5 3d2(4F)4d 5G         d2(4F)d 5G
1  6.0                           3p6 3d10f 3H             3d10f3H
1  6.0                           3p6 3d11f 3H             3d11f3H
1  6.0                           3p5 3d2(4F)4d 5H         d2(4F)d 5H
1  6.0                           3p5 3d2(4F)4d 5I         d2(4F)d 5I
1  6.0                           3p6 3d12f 3H             3d12f3H
1  6.0
1  6.0                           3p6 3d13f 3H             3d13f3H
0 -1.0
1  7.0                           3p5 3d3(2H) 3I           d3(2H) 3I
1  7.0                           3p6 3d6h 3K              3d6h 3K
1  7.0                           3p6 3d6h 3I              3d6h 3I
1  7.0                           3p6 3d6h 1K              3d6h 1K
1  7.0                           3p6 3d7h 3K              3d7h 3K
1  7.0                           3p6 3d7h 3I              3d7h 3I
1  7.0                           3p6 3d7h 1K              3d7h 1K
1  7.0                           3p6 3d8h 3K              3d8h 3K
1  7.0                           3p6 3d8k 3L              3d8k 3L
1  7.0                           3p6 3d8k 3I              3d8k 3I
1  7.0                           3p6 3d8h 3I              3d8h 3I
1  7.0                           3p6 3d8h 1K              3d8h 1K
1  7.0                           3p6 3d8k 1K              3d8k 1K
1  7.0                           3p6 3d8k 3K              3d8k 3K
1  7.0                           3p6 3d9h 3K              3d9h 3K
1  7.0                           3p6 3d9k 3L              3d9k 3L
1  7.0                           3p6 3d9k 3I              3d9k 3I
1  7.0                           3p6 3d9h 3I              3d9h 3I
1  7.0                           3p6 3d9h 1K              3d9h 1K
1  7.0                           3p6 3d9k 1K              3d9k 1K
1  7.0                           3p6 3d9k 3K              3d9k 3K
1  7.0                           3p5 3d2(4F)4d 5H         d2(4F)d 5H
1  7.0                           3p5 3d2(4F)4d 5I         d2(4F)d 5I
0 -1.0
1  8.0                           3p6 3d6h 3K              3d6h 3K
1  8.0                           3p6 3d7h 3K              3d7h 3K
1  8.0                           3p6 3d8k 3L              3d8k 3L
1  8.0                           3p6 3d8k 3M              3d8k 3M
1  8.0                           3p6 3d8h 3K              3d8h 3K
1  8.0                           3p6 3d8k 3K              3d8k 3K
1  8.0                           3p6 3d8k 1L              3d8k 1L
1  8.0                           3p6 3d9k 3L              3d9k 3L
1  8.0                           3p6 3d9k 3M              3d9k 3M
1  8.0                           3p6 3d9h 3K              3d9h 3K
1  8.0                           3p6 3d9k 3K              3d9k 3K
1  8.0                           3p6 3d9k 1L              3d9k 1L
1  8.0                           3p5 3d2(4F)4d 5I         d2(4F)d 5I
0 -1.0
1  9.0                           3p6 3d8k 3M              3d8k 3M
1  9.0                           3p6 3d8k 3L              3d8k 3L
1  9.0                           3p6 3d8k 1M              3d8k 1M
1  9.0                           3p6 3d9k 3M              3d9k 3M
1  9.0                           3p6 3d9k 3L              3d9k 3L
1  9.0                           3p6 3d9k 1M              3d9k 1M
1 10.0                           3p6 3d8k 3M              3d8k 3M
1 10.0                           3p6 3d9k 3M              3d9k 3M
 3879     391.1   41      LEAST SQUARES
   1    1  EAV       473709.4    81.  464972.0             1.000  0       0.0  0             p5d3
   2    1  F2(22)     98711.8   549.  120369.2             0.800  0       0.0  0
   3    1  F4(22)     61670.4   555.   76378.6             0.800  0       0.0  0
   4    1  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
   5    1  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0
   6    1  t(d 3)         0.0     0.       0.0 FIXED       1.000  0       0.0  0
   7    1  t1(d 3)        0.0     0.       0.0 FIXED       1.000  0       0.0  0
   8    1  t2(d 3)        0.0     0.       0.0 FIXED       1.000  0       0.0  0
   9    1  ZETA 1      8018.6   507.    9256.6             1.000  0       0.0  0
  10    1  ZETA 2       716.6   153.     673.7             1.000  0       0.0  0
  11    1  F2(12)    112555.3   520.  120005.9             0.800  0       0.0  0
  12    1  G1(12)    122116.8   206.  144831.6             0.800  0       0.0  0
  13    1  G3(12)     73423.0  1354.   90652.5             0.800  0       0.0  0
  14    2  EAV      1015455.0     0. 1008455.0 FIXEDHF     1.000  0    7000.0  0             p5d2 4d
  15    2  F2(22)    100563.4     0.  125704.3 FIXEDHF     0.800  0       0.0  0
  16    2  F4(22)     63990.6     0.   79988.2 FIXEDHF     0.800  0       0.0  0
  17    2  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  18    2  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0
  19    2  t(d 2)         0.0     0.       0.0 FIXED       1.000  0       0.0  0
  20    2  ZETA 1      9651.8     0.    9651.8 FIXEDHF     1.000  0       0.0  0
  21    2  ZETA 2       730.3     0.     730.3 FIXEDHF     1.000  0       0.0  0
  22    2  ZETA 4       164.5     0.     164.5 FIXEDHF     1.000  0       0.0  0
  23    2  F2(12)     98786.6     0.  123483.3 FIXEDHF     0.800  0       0.0  0
  24    2  F2(14)     23657.8     0.   29572.2 FIXEDHF     0.800  0       0.0  0
  25    2  F2(24)     24766.4     0.   30958.0 FIXEDHF     0.800  0       0.0  0
  26    2  F4(24)     11967.2     0.   14959.0 FIXEDHF     0.800  0       0.0  0
  27    2  G1(12)    118223.7     0.  147779.6 FIXEDHF     0.800  0       0.0  0
  28    2  G3(12)     74489.0     0.   93111.3 FIXEDHF     0.800  0       0.0  0
  29    2  G1(14)      6752.2     0.    8440.3 FIXEDHF     0.800  0       0.0  0
  30    2  G3(14)      6506.1     0.    8132.6 FIXEDHF     0.800  0       0.0  0
  31    2  G0(24)      8990.2     0.   11237.8 FIXEDHF     0.800  0       0.0  0
  32    2  G2(24)     10322.6     0.   12903.3 FIXEDHF     0.800  0       0.0  0
  33    2  G4(24)      7873.0     0.    9841.2 FIXEDHF     0.800  0       0.0  0
  34    3  EAV      1193559.5     0. 1186559.5 FIXEDHF     1.000  0    7000.0  0             p5d2 5d
  35    3  F2(22)    101213.0     0.  126516.3 FIXEDHF     0.800  0       0.0  0
  36    3  F4(22)     64434.3     0.   80542.9 FIXEDHF     0.800  0       0.0  0
  37    3  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  38    3  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0
  39    3  t(d 2)         0.0     0.       0.0 FIXED       1.000  0       0.0  0
  40    3  ZETA 1      9700.1     0.    9700.1 FIXEDHF     1.000  0       0.0  0
  41    3  ZETA 2       737.9     0.     737.9 FIXEDHF     1.000  0       0.0  0
  42    3  ZETA 4        73.5     0.      73.5 FIXEDHF     1.000  0       0.0  0
  43    3  F2(12)     99202.2     0.  124002.7 FIXEDHF     0.800  0       0.0  0
  44    3  F2(14)      9539.5     0.   11924.4 FIXEDHF     0.800  0       0.0  0
  45    3  F2(24)      9982.1     0.   12477.6 FIXEDHF     0.800  0       0.0  0
  46    3  F4(24)      4718.2     0.    5897.8 FIXEDHF     0.800  0       0.0  0
  47    3  G1(12)    118585.3     0.  148231.6 FIXEDHF     0.800  0       0.0  0
  48    3  G3(12)     74789.4     0.   93486.8 FIXEDHF     0.800  0       0.0  0
  49    3  G1(14)      2465.0     0.    3081.3 FIXEDHF     0.800  0       0.0  0
  50    3  G3(14)      2553.0     0.    3191.3 FIXEDHF     0.800  0       0.0  0
  51    3  G0(24)      3226.9     0.    4033.6 FIXEDHF     0.800  0       0.0  0
  52    3  G2(24)      4014.3     0.    5017.9 FIXEDHF     0.800  0       0.0  0
  53    3  G4(24)      3157.8     0.    3947.2 FIXEDHF     0.800  0       0.0  0
  54    4  EAV      1281385.0     0. 1274385.0 FIXEDHF     1.000  0    7000.0  0             p5d2 6d
  55    4  F2(22)    101426.8     0.  126783.5 FIXEDHF     0.800  0       0.0  0
  56    4  F4(22)     64580.2     0.   80725.3 FIXEDHF     0.800  0       0.0  0
  57    4  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  58    4  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0
  59    4  t(d 2)         0.0     0.       0.0 FIXED       1.000  0       0.0  0
  60    4  ZETA 1      9717.5     0.    9717.5 FIXEDHF     1.000  0       0.0  0
  61    4  ZETA 2       740.6     0.     740.6 FIXEDHF     1.000  0       0.0  0
  62    4  ZETA 4        39.1     0.      39.1 FIXEDHF     1.000  0       0.0  0
  63    4  F2(12)     99341.6     0.  124177.0 FIXEDHF     0.800  0       0.0  0
  64    4  F2(14)      4814.1     0.    6017.6 FIXEDHF     0.800  0       0.0  0
  65    4  F2(24)      5037.4     0.    6296.7 FIXEDHF     0.800  0       0.0  0
  66    4  F4(24)      2391.5     0.    2989.4 FIXEDHF     0.800  0       0.0  0
  67    4  G1(12)    118704.2     0.  148380.2 FIXEDHF     0.800  0       0.0  0
  68    4  G3(12)     74889.4     0.   93611.7 FIXEDHF     0.800  0       0.0  0
  69    4  G1(14)      1206.9     0.    1508.6 FIXEDHF     0.800  0       0.0  0
  70    4  G3(14)      1285.9     0.    1607.4 FIXEDHF     0.800  0       0.0  0
  71    4  G0(24)      1555.4     0.    1944.3 FIXEDHF     0.800  0       0.0  0
  72    4  G2(24)      2007.4     0.    2509.3 FIXEDHF     0.800  0       0.0  0
  73    4  G4(24)      1601.0     0.    2001.2 FIXEDHF     0.800  0       0.0  0
  74    5  EAV      1331625.5     0. 1324625.5 FIXEDHF     1.000  0    7000.0  0             p5d2 7d
  75    5  F2(22)    101518.2     0.  126897.7 FIXEDHF     0.800  0       0.0  0
  76    5  F4(22)     64642.5     0.   80803.1 FIXEDHF     0.800  0       0.0  0
  77    5  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  78    5  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0
  79    5  t(d 2)         0.0     0.       0.0 FIXED       1.000  0       0.0  0
  80    5  ZETA 1      9725.1     0.    9725.1 FIXEDHF     1.000  0       0.0  0
  81    5  ZETA 2       741.8     0.     741.8 FIXEDHF     1.000  0       0.0  0
  82    5  ZETA 4        23.4     0.      23.4 FIXEDHF     1.000  0       0.0  0
  83    5  F2(12)     99401.3     0.  124251.6 FIXEDHF     0.800  0       0.0  0
  84    5  F2(14)      2784.3     0.    3480.4 FIXEDHF     0.800  0       0.0  0
  85    5  F2(24)      2913.7     0.    3642.1 FIXEDHF     0.800  0       0.0  0
  86    5  F4(24)      1393.0     0.    1741.2 FIXEDHF     0.800  0       0.0  0
  87    5  G1(12)    118754.6     0.  148443.3 FIXEDHF     0.800  0       0.0  0
  88    5  G3(12)     74931.9     0.   93664.9 FIXEDHF     0.800  0       0.0  0
  89    5  G1(14)       690.0     0.     862.5 FIXEDHF     0.800  0       0.0  0
  90    5  G3(14)       745.6     0.     932.0 FIXEDHF     0.800  0       0.0  0
  91    5  G0(24)       879.5     0.    1099.4 FIXEDHF     0.800  0       0.0  0
  92    5  G2(24)      1158.3     0.    1447.9 FIXEDHF     0.800  0       0.0  0
  93    5  G4(24)       930.8     0.    1163.5 FIXEDHF     0.800  0       0.0  0
  94    6  EAV      1363100.5     0. 1356100.5 FIXEDHF     1.000  0    7000.0  0             p5d2 8d
  95    6  F2(22)    101564.2     0.  126955.3 FIXEDHF     0.800  0       0.0  0
  96    6  F4(22)     64673.9     0.   80842.4 FIXEDHF     0.800  0       0.0  0
  97    6  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  98    6  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0
  99    6  t(d 2)         0.0     0.       0.0 FIXED       1.000  0       0.0  0
 100    6  ZETA 1      9729.0     0.    9729.0 FIXEDHF     1.000  0       0.0  0
 101    6  ZETA 2       742.4     0.     742.4 FIXEDHF     1.000  0       0.0  0
 102    6  ZETA 4        15.1     0.      15.1 FIXEDHF     1.000  0       0.0  0
 103    6  F2(12)     99431.4     0.  124289.2 FIXEDHF     0.800  0       0.0  0
 104    6  F2(14)      1761.6     0.    2202.0 FIXEDHF     0.800  0       0.0  0
 105    6  F2(24)      1843.6     0.    2304.5 FIXEDHF     0.800  0       0.0  0
 106    6  F4(24)       886.6     0.    1108.3 FIXEDHF     0.800  0       0.0  0
 107    6  G1(12)    118780.0     0.  148475.0 FIXEDHF     0.800  0       0.0  0
 108    6  G3(12)     74953.3     0.   93691.6 FIXEDHF     0.800  0       0.0  0
 109    6  G1(14)       434.4     0.     543.0 FIXEDHF     0.800  0       0.0  0
 110    6  G3(14)       473.2     0.     591.5 FIXEDHF     0.800  0       0.0  0
 111    6  G0(24)       549.8     0.     687.3 FIXEDHF     0.800  0       0.0  0
 112    6  G2(24)       732.8     0.     916.0 FIXEDHF     0.800  0       0.0  0
 113    6  G4(24)       591.5     0.     739.4 FIXEDHF     0.800  0       0.0  0
 114    7  EAV      1384130.9     0. 1377130.9 FIXEDHF     1.000  0    7000.0  0             p5d2 9d
 115    7  F2(22)    101590.2     0.  126987.8 FIXEDHF     0.800  0       0.0  0
 116    7  F4(22)     64691.6     0.   80864.5 FIXEDHF     0.800  0       0.0  0
 117    7  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 118    7  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0
 119    7  t(d 2)         0.0     0.       0.0 FIXED       1.000  0       0.0  0
 120    7  ZETA 1      9731.3     0.    9731.3 FIXEDHF     1.000  0       0.0  0
 121    7  ZETA 2       742.7     0.     742.7 FIXEDHF     1.000  0       0.0  0
 122    7  ZETA 4        10.3     0.      10.3 FIXEDHF     1.000  0       0.0  0
 123    7  F2(12)     99448.3     0.  124310.4 FIXEDHF     0.800  0       0.0  0
 124    7  F2(14)      1187.4     0.    1484.3 FIXEDHF     0.800  0       0.0  0
 125    7  F2(24)      1242.8     0.    1553.5 FIXEDHF     0.800  0       0.0  0
 126    7  F4(24)       600.4     0.     750.5 FIXEDHF     0.800  0       0.0  0
 127    7  G1(12)    118794.2     0.  148492.8 FIXEDHF     0.800  0       0.0  0
 128    7  G3(12)     74965.3     0.   93706.6 FIXEDHF     0.800  0       0.0  0
 129    7  G1(14)       292.0     0.     365.0 FIXEDHF     0.800  0       0.0  0
 130    7  G3(14)       319.8     0.     399.7 FIXEDHF     0.800  0       0.0  0
 131    7  G0(24)       367.4     0.     459.3 FIXEDHF     0.800  0       0.0  0
 132    7  G2(24)       494.0     0.     617.5 FIXEDHF     0.800  0       0.0  0
 133    7  G4(24)       399.9     0.     499.9 FIXEDHF     0.800  0       0.0  0
 134    8  EAV       801996.9    73.  791014.8             1.000  0       0.0  0             p5d2 4s
 135    8  F2(22)    112237.5   636.  125372.6             0.800  0       0.0  0
 136    8  F4(22)     87535.4  1146.   79753.3             0.800  0       0.0  0
 137    8  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 138    8  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0
 139    8  t(d 2)         0.0     0.       0.0 FIXED       1.000  0       0.0  0
 140    8  ZETA 1      9257.7   509.    9639.5             1.000  0       0.0  0
 141    8  ZETA 2      1023.6   104.     728.5             1.000  0       0.0  0
 142    8  F2(12)    111713.8   471.  123247.5             0.800  0       0.0  0
 143    8  G1(12)    119805.9     0.  147544.2 FIXEDHF     0.812  0       0.0  0
 144    8  G3(12)     86475.6   912.   92920.9             0.800  0       0.0  0
 145    8  G1(13)     14116.0   572.   12813.2             0.800  0       0.0  0
 146    8  G2(23)     14890.1   600.   14106.2             0.800  0       0.0  0
 147    9  EAV       437672.1   269.  418772.6             1.000  0   16000.0  0             3d4p
 148    9  ZETA 2      1034.2   156.     735.0             1.000  0       0.0  0
 149    9  ZETA 5      2544.3     0.    2102.7 FIXED       1.000  0       0.0  0
 150    9  F2(25)     27133.3  1217.   35615.3             0.800  0       0.0  0
 151    9  G1(25)     10428.8   611.   12277.5             0.800  0       0.0  0
 152    9  G3(25)      7881.4  1102.   11944.4             0.800  0       0.0  0
 153    A  EAV       688254.7     0.  672254.7 FIXEDHF     1.000  0   16000.0  0             3d5p
 154    A  ZETA 2       743.8     0.     743.8 FIXEDHF     1.000  0       0.0  0
 155    A  ZETA 5       846.8     0.     846.8 FIXEDHF     1.000  0       0.0  0
 156    A  F2(25)     10571.0     0.   13213.8 FIXEDHF     0.800  0       0.0  0
 157    A  G1(25)      3176.0     0.    3970.0 FIXEDHF     0.800  0       0.0  0
 158    A  G3(25)      3273.4     0.    4091.7 FIXEDHF     0.800  0       0.0  0
 159    B  EAV       802991.3     0.  786991.3 FIXEDHF     1.000  0   16000.0  0             3d6p
 160    B  ZETA 2       746.4     0.     746.4 FIXEDHF     1.000  0       0.0  0
 161    B  ZETA 5       428.9     0.     428.9 FIXEDHF     1.000  0       0.0  0
 162    B  F2(25)      5087.7     0.    6359.6 FIXEDHF     0.800  0       0.0  0
 163    B  G1(25)      1480.2     0.    1850.2 FIXEDHF     0.800  0       0.0  0
 164    B  G3(25)      1558.6     0.    1948.2 FIXEDHF     0.800  0       0.0  0
 165    C  EAV       865322.9     0.  849322.9 FIXEDHF     1.000  0   16000.0  0             3d7p
 166    C  ZETA 2       747.5     0.     747.5 FIXEDHF     1.000  0       0.0  0
 167    C  ZETA 5       248.3     0.     248.3 FIXEDHF     1.000  0       0.0  0
 168    C  F2(25)      2852.0     0.    3565.0 FIXEDHF     0.800  0       0.0  0
 169    C  G1(25)       821.3     0.    1026.6 FIXEDHF     0.800  0       0.0  0
 170    C  G3(25)       874.2     0.    1092.8 FIXEDHF     0.800  0       0.0  0
 171    D  EAV       903060.8     0.  887060.8 FIXEDHF     1.000  0   16000.0  0             3d8p
 172    D  ZETA 2       748.0     0.     748.0 FIXEDHF     1.000  0       0.0  0
 173    D  ZETA 5       156.9     0.     156.9 FIXEDHF     1.000  0       0.0  0
 174    D  F2(25)      1764.0     0.    2205.0 FIXEDHF     0.800  0       0.0  0
 175    D  G1(25)       506.0     0.     632.5 FIXEDHF     0.800  0       0.0  0
 176    D  G3(25)       542.1     0.     677.6 FIXEDHF     0.800  0       0.0  0
 177    E  EAV       927663.8     0.  911663.8 FIXEDHF     1.000  0   16000.0  0             3d9p
 178    E  ZETA 2       748.3     0.     748.3 FIXEDHF     1.000  0       0.0  0
 179    E  ZETA 5       105.4     0.     105.4 FIXEDHF     1.000  0       0.0  0
 180    E  F2(25)      1169.0     0.    1461.3 FIXEDHF     0.800  0       0.0  0
 181    E  G1(25)       334.9     0.     418.6 FIXEDHF     0.800  0       0.0  0
 182    E  G3(25)       360.2     0.     450.2 FIXEDHF     0.800  0       0.0  0
 183    F  EAV       944600.5     0.  928600.5 FIXEDHF     1.000  0   16000.0  0             3d10p
 184    F  ZETA 2       748.5     0.     748.5 FIXEDHF     1.000  0       0.0  0
 185    F  ZETA 5        74.3     0.      74.3 FIXEDHF     1.000  0       0.0  0
 186    F  F2(25)       815.5     0.    1019.4 FIXEDHF     0.800  0       0.0  0
 187    F  G1(25)       233.4     0.     291.8 FIXEDHF     0.800  0       0.0  0
 188    F  G3(25)       251.8     0.     314.7 FIXEDHF     0.800  0       0.0  0
 189    G  EAV       956761.3     0.  940761.3 FIXEDHF     1.000  0   16000.0  0             3d11p
 190    G  ZETA 2       748.6     0.     748.6 FIXEDHF     1.000  0       0.0  0
 191    G  ZETA 5        54.3     0.      54.3 FIXEDHF     1.000  0       0.0  0
 192    G  F2(25)       591.8     0.     739.8 FIXEDHF     0.800  0       0.0  0
 193    G  G1(25)       169.4     0.     211.7 FIXEDHF     0.800  0       0.0  0
 194    G  G3(25)       183.0     0.     228.8 FIXEDHF     0.800  0       0.0  0
 195    H  EAV       965782.8     0.  949782.8 FIXEDHF     1.000  0   16000.0  0             3d12p
 196    H  ZETA 2       748.6     0.     748.6 FIXEDHF     1.000  0       0.0  0
 197    H  ZETA 5        40.9     0.      40.9 FIXEDHF     1.000  0       0.0  0
 198    H  F2(25)       443.4     0.     554.2 FIXEDHF     0.800  0       0.0  0
 199    H  G1(25)       126.9     0.     158.6 FIXEDHF     0.800  0       0.0  0
 200    H  G3(25)       137.3     0.     171.6 FIXEDHF     0.800  0       0.0  0
 201    I  EAV       972663.8     0.  956663.8 FIXEDHF     1.000  0   16000.0  0             3d13p
 202    I  ZETA 2       748.7     0.     748.7 FIXEDHF     1.000  0       0.0  0
 203    I  ZETA 5        31.6     0.      31.6 FIXEDHF     1.000  0       0.0  0
 204    I  F2(25)       340.9     0.     426.1 FIXEDHF     0.800  0       0.0  0
 205    I  G1(25)        97.5     0.     121.9 FIXEDHF     0.800  0       0.0  0
 206    I  G3(25)       105.7     0.     132.1 FIXEDHF     0.800  0       0.0  0
 207    J  EAV       978031.5     0.  962031.5 FIXEDHF     1.000  0   16000.0  0             3d14p
 208    J  ZETA 2       748.7     0.     748.7 FIXEDHF     1.000  0       0.0  0
 209    J  ZETA 5        24.9     0.      24.9 FIXEDHF     1.000  0       0.0  0
 210    J  F2(25)       267.8     0.     334.7 FIXEDHF     0.800  0       0.0  0
 211    J  G1(25)        76.6     0.      95.8 FIXEDHF     0.800  0       0.0  0
 212    J  G3(25)        83.1     0.     103.9 FIXEDHF     0.800  0       0.0  0
 213    K  EAV       824472.3     0.  808472.3 FIXEDHF     1.000  0   16000.0  0             4s4p
 214    K  ZETA 5      2269.0     0.    2269.0 FIXEDHF     1.000  0       0.0  0
 215    K  G1(35)     59508.3     0.   74385.4 FIXEDHF     0.800  0       0.0  0
 216    L  EAV      1100113.9     0. 1084113.9 FIXEDHF     1.000  0   16000.0  0             4s5p
 217    L  ZETA 5       877.4     0.     877.4 FIXEDHF     1.000  0       0.0  0
 218    L  G1(35)      6314.8     0.    7893.5 FIXEDHF     0.800  0       0.0  0
 219    M  EAV      1220275.3     0. 1204275.3 FIXEDHF     1.000  0   16000.0  0             4s6p
 220    M  ZETA 5       446.8     0.     446.8 FIXEDHF     1.000  0       0.0  0
 221    M  G1(35)      2372.6     0.    2965.8 FIXEDHF     0.800  0       0.0  0
 222    N  EAV      1284546.5     0. 1268546.5 FIXEDHF     1.000  0   16000.0  0             4s7p
 223    N  ZETA 5       257.6     0.     257.6 FIXEDHF     1.000  0       0.0  0
 224    N  G1(35)      1190.3     0.    1487.9 FIXEDHF     0.800  0       0.0  0
 225    O  EAV      1323188.3     0. 1307188.3 FIXEDHF     1.000  0   16000.0  0             4s8p
 226    O  ZETA 5       161.9     0.     161.9 FIXEDHF     1.000  0       0.0  0
 227    O  G1(35)       692.1     0.     865.1 FIXEDHF     0.800  0       0.0  0
 228    P  EAV      1348281.1     0. 1332281.1 FIXEDHF     1.000  0   16000.0  0             4s9p
 229    P  ZETA 5       108.4     0.     108.4 FIXEDHF     1.000  0       0.0  0
 230    P  G1(35)       441.4     0.     551.7 FIXEDHF     0.800  0       0.0  0
 231    Q  EAV      1365508.5     0. 1349508.5 FIXEDHF     1.000  0   16000.0  0             4s10p
 232    Q  ZETA 5        76.1     0.      76.1 FIXEDHF     1.000  0       0.0  0
 233    Q  G1(35)       300.1     0.     375.1 FIXEDHF     0.800  0       0.0  0
 234    R  EAV      1377852.1     0. 1361852.1 FIXEDHF     1.000  0   16000.0  0             4s11p
 235    R  ZETA 5        55.5     0.      55.5 FIXEDHF     1.000  0       0.0  0
 236    R  G1(35)       213.9     0.     267.4 FIXEDHF     0.800  0       0.0  0
 237    S  EAV      1386994.9     0. 1370994.9 FIXEDHF     1.000  0   16000.0  0             4s12p
 238    S  ZETA 5        41.7     0.      41.7 FIXEDHF     1.000  0       0.0  0
 239    S  G1(35)       158.2     0.     197.7 FIXEDHF     0.800  0       0.0  0
 240    T  EAV      1393960.6     0. 1377960.6 FIXEDHF     1.000  0   16000.0  0             4s13p
 241    T  ZETA 5        32.2     0.      32.2 FIXEDHF     1.000  0       0.0  0
 242    T  G1(35)       120.3     0.     150.4 FIXEDHF     0.800  0       0.0  0
 243    U  EAV       661172.4    99.  644863.1             1.000  0   16000.0  0             3d4f
 244    U  ZETA 2       728.1   147.     744.9             1.000  0       0.0  0
 245    U  ZETA 6         8.8     0.       8.8 FIXEDHF     1.000  0       0.0  0
 246    U  F2(26)     19514.2   794.   23299.8             0.800  0       0.0  0
 247    U  F4(26)      8317.5     0.   10396.9 FIXEDHF     0.800  0       0.0  0
 248    U  G1(26)     11129.9   545.   14976.4             0.800  0       0.0  0
 249    U  G3(26)      5274.6  1230.    8760.6             0.800  0       0.0  0
 250    U  G5(26)      4838.0     0.    6047.5 FIXEDHF     0.800  0       0.0  0
 251    V  EAV       786199.5   105.  770952.8             1.000  0   16000.0  0             3d5f
 252    V  ZETA 2       640.1   137.     746.6             1.000  0       0.0  0
 253    V  ZETA 6         5.0     0.       5.0 FIXEDHF     1.000  0       0.0  0
 254    V  F2(26)      8591.2   824.   11360.1             0.800  0       0.0  0
 255    V  F4(26)      4363.6     0.    5454.5 FIXEDHF     0.800  0       0.0  0
 256    V  G1(26)      7439.2   637.    8707.4             0.800  0       0.0  0
 257    V  G3(26)      4541.8  1538.    5211.1             0.800  0       0.0  0
 258    V  G5(26)      2904.7     0.    3630.9 FIXEDHF     0.800  0       0.0  0
 259    W  EAV       854912.8    96.  839313.6             1.000  0   16000.0  0             3d6f
 260    W  ZETA 2       761.4    92.     747.6             1.000  0       0.0  0
 261    W  ZETA 6         3.0     0.       3.0 FIXEDHF     1.000  0       0.0  0
 262    W  F2(26)      5211.5   852.    6190.3             0.800  0       0.0  0
 263    W  F4(26)      2450.0     0.    3062.5 FIXEDHF     0.800  0       0.0  0
 264    W  G1(26)      3938.6   548.    4996.6             0.800  0       0.0  0
 265    W  G3(26)      1550.0  1857.    3025.5             0.700  0       0.0  0
 266    W  G5(26)      1482.9     0.    2118.5 FIXEDHF     0.700  0       0.0  0
 267    X  EAV       896156.7   149.  880487.0             1.000  0   16000.0  0             3d7f
 268    X  ZETA 2       748.1     0.     748.1 FIXEDHF     1.000  0       0.0  0
 269    X  ZETA 6         1.9     0.       1.9 FIXEDHF     1.000  0       0.0  0
 270    X  F2(26)      2990.7     0.    3738.4 FIXEDHF     0.800  0       0.0  0
 271    X  F4(26)      1504.5     0.    1880.6 FIXEDHF     0.800  0       0.0  0
 272    X  G1(26)      2470.9     0.    3088.6 FIXEDHF     0.800  0       0.0  0
 273    X  G3(26)      1506.4     0.    1883.0 FIXEDHF     0.800  0       0.0  0
 274    X  G5(26)      1057.8     0.    1322.3 FIXEDHF     0.800  0       0.0  0
 275    Y  EAV       922883.7   176.  907145.0             1.000  0   16000.0  0             3d8f
 276    Y  ZETA 2       748.3     0.     748.3 FIXEDHF     1.000  0       0.0  0
 277    Y  ZETA 6         1.3     0.       1.3 FIXEDHF     1.000  0       0.0  0
 278    Y  F2(26)      1947.5     0.    2434.4 FIXEDHF     0.800  0       0.0  0
 279    Y  F4(26)       990.1     0.    1237.6 FIXEDHF     0.800  0       0.0  0
 280    Y  G1(26)      1630.0     0.    2037.5 FIXEDHF     0.800  0       0.0  0
 281    Y  G3(26)       998.0     0.    1247.5 FIXEDHF     0.800  0       0.0  0
 282    Y  G5(26)       702.2     0.     877.7 FIXEDHF     0.800  0       0.0  0
 283    Z  EAV       941235.4   228.  925374.6             1.000  0   16000.0  0             3d9f
 284    Z  ZETA 2       748.5     0.     748.5 FIXEDHF     1.000  0       0.0  0
 285    Z  ZETA 6         0.9     0.       0.9 FIXEDHF     1.000  0       0.0  0
 286    Z  F2(26)      1340.8     0.    1676.0 FIXEDHF     0.800  0       0.0  0
 287    Z  F4(26)       686.6     0.     858.2 FIXEDHF     0.800  0       0.0  0
 288    Z  G1(26)      1131.4     0.    1414.2 FIXEDHF     0.800  0       0.0  0
 289    Z  G3(26)       694.7     0.     868.4 FIXEDHF     0.800  0       0.0  0
 290    Z  G5(26)       489.4     0.     611.7 FIXEDHF     0.800  0       0.0  0
 291    a  EAV       954223.0   227.  938377.8             1.000  0   16000.0  0             3d10f
 292    a  ZETA 2       748.6     0.     748.6 FIXEDHF     1.000  0       0.0  0
 293    a  ZETA 6         0.7     0.       0.7 FIXEDHF     1.000  0       0.0  0
 294    a  F2(26)       963.3     0.    1204.1 FIXEDHF     0.800  0       0.0  0
 295    a  F4(26)       495.8     0.     619.7 FIXEDHF     0.800  0       0.0  0
 296    a  G1(26)       817.3     0.    1021.6 FIXEDHF     0.800  0       0.0  0
 297    a  G3(26)       502.9     0.     628.6 FIXEDHF     0.800  0       0.0  0
 298    a  G5(26)       354.6     0.     443.2 FIXEDHF     0.800  0       0.0  0
 299    b  EAV       963974.2     0.  947974.2 FIXEDHF     1.000  0   16000.0  0             3d11f
 300    b  ZETA 2       748.7     0.     748.7 FIXEDHF     1.000  0       0.0  0
 301    b  ZETA 6         0.5     0.       0.5 FIXEDHF     1.000  0       0.0  0
 302    b  F2(26)       715.8     0.     894.7 FIXEDHF     0.800  0       0.0  0
 303    b  F4(26)       369.8     0.     462.2 FIXEDHF     0.800  0       0.0  0
 304    b  G1(26)       609.7     0.     762.1 FIXEDHF     0.800  0       0.0  0
 305    b  G3(26)       375.7     0.     469.6 FIXEDHF     0.800  0       0.0  0
 306    b  G5(26)       265.0     0.     331.3 FIXEDHF     0.800  0       0.0  0
 307    c  EAV       971263.3     0.  955263.3 FIXEDHF     1.000  0   16000.0  0             3d12f
 308    c  ZETA 2       748.7     0.     748.7 FIXEDHF     1.000  0       0.0  0
 309    c  ZETA 6         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0
 310    c  F2(26)       546.6     0.     683.3 FIXEDHF     0.800  0       0.0  0
 311    c  F4(26)       283.2     0.     354.0 FIXEDHF     0.800  0       0.0  0
 312    c  G1(26)       467.0     0.     583.7 FIXEDHF     0.800  0       0.0  0
 313    c  G3(26)       288.1     0.     360.1 FIXEDHF     0.800  0       0.0  0
 314    c  G5(26)       203.3     0.     254.1 FIXEDHF     0.800  0       0.0  0
 315    d  EAV       976919.9     0.  960919.9 FIXEDHF     1.000  0   16000.0  0             3d13f
 316    d  ZETA 2       748.8     0.     748.8 FIXEDHF     1.000  0       0.0  0
 317    d  ZETA 6         0.3     0.       0.3 FIXEDHF     1.000  0       0.0  0
 318    d  F2(26)       427.0     0.     533.8 FIXEDHF     0.800  0       0.0  0
 319    d  F4(26)       221.7     0.     277.1 FIXEDHF     0.800  0       0.0  0
 320    d  G1(26)       365.6     0.     457.0 FIXEDHF     0.800  0       0.0  0
 321    d  G3(26)       225.7     0.     282.1 FIXEDHF     0.800  0       0.0  0
 322    d  G5(26)       159.4     0.     199.2 FIXEDHF     0.800  0       0.0  0
 323    e  EAV      1069734.3     0. 1053734.3 FIXEDHF     1.000  0   16000.0  0             4s4f
 324    e  ZETA 6        11.9     0.      11.9 FIXEDHF     1.000  0       0.0  0
 325    e  G3(36)     30268.3     0.   37835.4 FIXEDHF     0.800  0       0.0  0
 326    f  EAV      1201893.5     0. 1185893.5 FIXEDHF     1.000  0   16000.0  0             4s5f
 327    f  ZETA 6         6.2     0.       6.2 FIXEDHF     1.000  0       0.0  0
 328    f  G3(36)      5832.1     0.    7290.1 FIXEDHF     0.800  0       0.0  0
 329    g  EAV      1273448.1     0. 1257448.1 FIXEDHF     1.000  0   16000.0  0             4s6f
 330    g  ZETA 6         3.7     0.       3.7 FIXEDHF     1.000  0       0.0  0
 331    g  G3(36)      2277.8     0.    2847.2 FIXEDHF     0.800  0       0.0  0
 332    h  EAV      1316012.4     0. 1300012.4 FIXEDHF     1.000  0   16000.0  0             4s7f
 333    h  ZETA 6         2.4     0.       2.4 FIXEDHF     1.000  0       0.0  0
 334    h  G3(36)      1177.1     0.    1471.4 FIXEDHF     0.800  0       0.0  0
 335    i  EAV      1343392.1     0. 1327392.1 FIXEDHF     1.000  0   16000.0  0             4s8f
 336    i  ZETA 6         1.6     0.       1.6 FIXEDHF     1.000  0       0.0  0
 337    i  G3(36)       702.2     0.     877.7 FIXEDHF     0.800  0       0.0  0
 338    j  EAV      1362036.9     0. 1346036.9 FIXEDHF     1.000  0   16000.0  0             4s9f
 339    j  ZETA 6         1.1     0.       1.1 FIXEDHF     1.000  0       0.0  0
 340    j  G3(36)       457.4     0.     571.7 FIXEDHF     0.800  0       0.0  0
 341    k  EAV      1375296.6     0. 1359296.6 FIXEDHF     1.000  0   16000.0  0             4s10f
 342    k  ZETA 6         0.8     0.       0.8 FIXEDHF     1.000  0       0.0  0
 343    k  G3(36)       316.4     0.     395.5 FIXEDHF     0.800  0       0.0  0
 344    l  EAV      1385062.3     0. 1369062.3 FIXEDHF     1.000  0   16000.0  0             4s11f
 345    l  ZETA 6         0.6     0.       0.6 FIXEDHF     1.000  0       0.0  0
 346    l  G3(36)       228.9     0.     286.1 FIXEDHF     0.800  0       0.0  0
 347    m  EAV      1392467.0     0. 1376467.0 FIXEDHF     1.000  0   16000.0  0             4s12f
 348    m  ZETA 6         0.5     0.       0.5 FIXEDHF     1.000  0       0.0  0
 349    m  G3(36)       171.3     0.     214.1 FIXEDHF     0.800  0       0.0  0
 350    n  EAV      1398204.9     0. 1382204.9 FIXEDHF     1.000  0   16000.0  0             4s13f
 351    n  ZETA 6         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0
 352    n  G3(36)       131.8     0.     164.7 FIXEDHF     0.800  0       0.0  0
 353    o  EAV       859697.5     0.  843697.5 FIXEDHF     1.000  0   16000.0  0             3d6h
 354    o  ZETA 2       748.8     0.     748.8 FIXEDHF     1.000  0       0.0  0
 355    o  ZETA 7         0.5     0.       0.5 FIXEDHF     1.000  0       0.0  0
 356    o  F2(27)      1199.7     0.    1499.6 FIXEDHF     0.800  0       0.0  0
 357    o  F4(27)       115.8     0.     144.8 FIXEDHF     0.800  0       0.0  0
 358    o  G3(27)         8.6     0.      10.7 FIXEDHF     0.800  0       0.0  0
 359    o  G5(27)         6.1     0.       7.6 FIXEDHF     0.800  0       0.0  0
 360    o  G7(27)         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0
 361    p  EAV       899354.7     0.  883354.7 FIXEDHF     1.000  0   16000.0  0             3d7h
 362    p  ZETA 2       748.8     0.     748.8 FIXEDHF     1.000  0       0.0  0
 363    p  ZETA 7         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0
 364    p  F2(27)       757.3     0.     946.6 FIXEDHF     0.800  0       0.0  0
 365    p  F4(27)        91.2     0.     114.0 FIXEDHF     0.800  0       0.0  0
 366    p  G3(27)        10.4     0.      13.0 FIXEDHF     0.800  0       0.0  0
 367    p  G5(27)         7.4     0.       9.2 FIXEDHF     0.800  0       0.0  0
 368    p  G7(27)         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0
 369    q  EAV       925112.6     0.  909112.6 FIXEDHF     1.000  0   16000.0  0             3d8h
 370    q  ZETA 2       748.8     0.     748.8 FIXEDHF     1.000  0       0.0  0
 371    q  ZETA 7         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0
 372    q  F2(27)       508.6     0.     635.7 FIXEDHF     0.800  0       0.0  0
 373    q  F4(27)        69.0     0.      86.3 FIXEDHF     0.800  0       0.0  0
 374    q  G3(27)         9.7     0.      12.1 FIXEDHF     0.800  0       0.0  0
 375    q  G5(27)         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0
 376    q  G7(27)         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0
 377    r  EAV       942777.6     0.  926777.6 FIXEDHF     1.000  0   16000.0  0             3d9h
 378    r  ZETA 2       748.8     0.     748.8 FIXEDHF     1.000  0       0.0  0
 379    r  ZETA 7         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0
 380    r  F2(27)       357.9     0.     447.4 FIXEDHF     0.800  0       0.0  0
 381    r  F4(27)        52.3     0.      65.4 FIXEDHF     0.800  0       0.0  0
 382    r  G3(27)         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0
 383    r  G5(27)         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0
 384    r  G7(27)         4.5     0.       5.6 FIXEDHF     0.800  0       0.0  0
 385    s  EAV      1280408.1     0. 1264408.1 FIXEDHF     1.000  0   16000.0  0             4s6h
 386    s  ZETA 7         0.5     0.       0.5 FIXEDHF     1.000  0       0.0  0
 387    s  G5(37)       406.6     0.     508.3 FIXEDHF     0.800  0       0.0  0
 388    t  EAV      1320419.4     0. 1304419.4 FIXEDHF     1.000  0   16000.0  0             4s7h
 389    t  ZETA 7         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0
 390    t  G5(37)       433.1     0.     541.4 FIXEDHF     0.800  0       0.0  0
 391    u  EAV      1346363.0     0. 1330363.0 FIXEDHF     1.000  0   16000.0  0             4s8h
 392    u  ZETA 7         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0
 393    u  G5(37)       367.5     0.     459.4 FIXEDHF     0.800  0       0.0  0
 394    v  EAV      1364133.3     0. 1348133.3 FIXEDHF     1.000  0   16000.0  0             4s9h
 395    v  ZETA 7         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0
 396    v  G5(37)       294.6     0.     368.2 FIXEDHF     0.800  0       0.0  0
 397    w  EAV      1346777.6     0. 1330777.6 FIXEDHF     1.000  0   16000.0  0             4s8k
 398    w  ZETA 8         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0
 399    w  G7(38)         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0
 400    x  EAV      1364404.9     0. 1348404.9 FIXEDHF     1.000  0   16000.0  0             4s9k
 401    x  ZETA 8         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0
 402    x  G7(38)         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0
 403    y  EAV       925230.8     0.  909230.8 FIXEDHF     1.000  0   16000.0  0             3d8k
 404    y  ZETA 2       748.9     0.     748.9 FIXEDHF     1.000  0       0.0  0
 405    y  ZETA 8         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0
 406    y  F2(28)       198.6     0.     248.2 FIXEDHF     0.800  0       0.0  0
 407    y  F4(28)         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0
 408    y  G5(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 409    y  G7(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 410    y  G9(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 411    z  EAV       942863.3     0.  926863.3 FIXEDHF     1.000  0   16000.0  0             3d9k
 412    z  ZETA 2       748.9     0.     748.9 FIXEDHF     1.000  0       0.0  0
 413    z  ZETA 8         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0
 414    z  F2(28)       139.4     0.     174.3 FIXEDHF     0.800  0       0.0  0
 415    z  F4(28)         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0
 416    z  G5(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 417    z  G7(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 418    z  G9(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 419    12 0D1214      1596.2     0.    1995.2 FIXEDHF     0.800  0       0.0  0  p5d3      -p5d2 4d
 420    12 2D1214     15760.2     0.   19700.3 FIXEDHF     0.800  0       0.0  0
 421    12 1E1214     15483.6     0.   19354.5 FIXEDHF     0.800  0       0.0  0
 422    12 3E1214     12386.3     0.   15482.9 FIXEDHF     0.800  0       0.0  0
 423    12 0D2224      2383.9     0.    2979.9 FIXEDHF     0.800  0       0.0  0
 424    12 2D2224     17544.0     0.   21930.0 FIXEDHF     0.800  0       0.0  0
 425    12 4D2224     12270.7     0.   15338.4 FIXEDHF     0.800  0       0.0  0
 426    13 0D1214       683.6     0.     854.5 FIXEDHF     0.800  0       0.0  0  p5d3      -p5d2 5d
 427    13 2D1214      7506.2     0.    9382.8 FIXEDHF     0.800  0       0.0  0
 428    13 1E1214      6334.9     0.    7918.6 FIXEDHF     0.800  0       0.0  0
 429    13 3E1214      5555.4     0.    6944.3 FIXEDHF     0.800  0       0.0  0
 430    13 0D2224      1280.2     0.    1600.2 FIXEDHF     0.800  0       0.0  0
 431    13 2D2224      8955.3     0.   11194.1 FIXEDHF     0.800  0       0.0  0
 432    13 4D2224      6245.8     0.    7807.2 FIXEDHF     0.800  0       0.0  0
 433    14 0D1214       381.0     0.     476.3 FIXEDHF     0.800  0       0.0  0  p5d3      -p5d2 6d
 434    14 2D1214      4553.7     0.    5692.1 FIXEDHF     0.800  0       0.0  0
 435    14 1E1214      3412.1     0.    4265.1 FIXEDHF     0.800  0       0.0  0
 436    14 3E1214      3197.7     0.    3997.1 FIXEDHF     0.800  0       0.0  0
 437    14 0D2224       837.0     0.    1046.2 FIXEDHF     0.800  0       0.0  0
 438    14 2D2224      5688.2     0.    7110.2 FIXEDHF     0.800  0       0.0  0
 439    14 4D2224      3944.6     0.    4930.7 FIXEDHF     0.800  0       0.0  0
 440    15 0D1214       246.6     0.     308.3 FIXEDHF     0.800  0       0.0  0  p5d3      -p5d2 7d
 441    15 2D1214      3144.9     0.    3931.1 FIXEDHF     0.800  0       0.0  0
 442    15 1E1214      2149.5     0.    2686.9 FIXEDHF     0.800  0       0.0  0
 443    15 3E1214      2120.1     0.    2650.1 FIXEDHF     0.800  0       0.0  0
 444    15 0D2224       607.0     0.     758.8 FIXEDHF     0.800  0       0.0  0
 445    15 2D2224      4052.2     0.    5065.2 FIXEDHF     0.800  0       0.0  0
 446    15 4D2224      2797.0     0.    3496.3 FIXEDHF     0.800  0       0.0  0
 447    16 0D1214       175.8     0.     219.8 FIXEDHF     0.800  0       0.0  0  p5d3      -p5d2 8d
 448    16 2D1214      2352.9     0.    2941.1 FIXEDHF     0.800  0       0.0  0
 449    16 1E1214      1500.9     0.    1876.1 FIXEDHF     0.800  0       0.0  0
 450    16 3E1214      1538.5     0.    1923.1 FIXEDHF     0.800  0       0.0  0
 451    16 0D2224       469.4     0.     586.7 FIXEDHF     0.800  0       0.0  0
 452    16 2D2224      3096.2     0.    3870.3 FIXEDHF     0.800  0       0.0  0
 453    16 4D2224      2129.6     0.    2662.0 FIXEDHF     0.800  0       0.0  0
 454    17 0D1214       132.8     0.     166.0 FIXEDHF     0.800  0       0.0  0  p5d3      -p5d2 9d
 455    17 2D1214      1846.6     0.    2308.3 FIXEDHF     0.800  0       0.0  0
 456    17 1E1214      1113.2     0.    1391.5 FIXEDHF     0.800  0       0.0  0
 457    17 3E1214      1178.9     0.    1473.6 FIXEDHF     0.800  0       0.0  0
 458    17 0D2224       377.4     0.     471.8 FIXEDHF     0.800  0       0.0  0
 459    17 2D2224      2469.0     0.    3086.3 FIXEDHF     0.800  0       0.0  0
 460    17 4D2224      1693.9     0.    2117.4 FIXEDHF     0.800  0       0.0  0
 461    18 2D1213      9815.8     0.   12269.8 FIXEDHF     0.800  0       0.0  0  p5d3      -p5d2 4s
 462    18 1E1213     12767.1     0.   15958.9 FIXEDHF     0.800  0       0.0  0
 463    18 2D2223     10650.5     0.   13313.1 FIXEDHF     0.800  0       0.0  0
 464    19 1D2215     13264.2     0.   16580.3 FIXEDHF     0.800  0       0.0  0  p5d3      -3d4p
 465    19 3D2215     12092.1     0.   15115.1 FIXEDHF     0.800  0       0.0  0
 466    1A 1D2215      6654.3     0.    8317.9 FIXEDHF     0.800  0       0.0  0  p5d3      -3d5p
 467    1A 3D2215      5807.8     0.    7259.8 FIXEDHF     0.800  0       0.0  0
 468    1B 1D2215      4242.6     0.    5303.2 FIXEDHF     0.800  0       0.0  0  p5d3      -3d6p
 469    1B 3D2215      3619.8     0.    4524.7 FIXEDHF     0.800  0       0.0  0
 470    1C 1D2215      3038.1     0.    3797.6 FIXEDHF     0.800  0       0.0  0  p5d3      -3d7p
 471    1C 3D2215      2557.4     0.    3196.7 FIXEDHF     0.800  0       0.0  0
 472    1D 1D2215      2326.9     0.    2908.6 FIXEDHF     0.800  0       0.0  0  p5d3      -3d8p
 473    1D 3D2215      1941.8     0.    2427.3 FIXEDHF     0.800  0       0.0  0
 474    1E 1D2215      1862.2     0.    2327.8 FIXEDHF     0.800  0       0.0  0  p5d3      -3d9p
 475    1E 3D2215      1545.0     0.    1931.3 FIXEDHF     0.800  0       0.0  0
 476    1F 1D2215      1537.3     0.    1921.6 FIXEDHF     0.800  0       0.0  0  p5d3      -3d10p
 477    1F 3D2215      1270.2     0.    1587.7 FIXEDHF     0.800  0       0.0  0
 478    1G 1D2215      1298.8     0.    1623.5 FIXEDHF     0.800  0       0.0  0  p5d3      -3d11p
 479    1G 3D2215      1069.9     0.    1337.4 FIXEDHF     0.800  0       0.0  0
 480    1H 1D2215      1117.2     0.    1396.5 FIXEDHF     0.800  0       0.0  0  p5d3      -3d12p
 481    1H 3D2215       918.2     0.    1147.8 FIXEDHF     0.800  0       0.0  0
 482    1I 1D2215       975.0     0.    1218.7 FIXEDHF     0.800  0       0.0  0  p5d3      -3d13p
 483    1I 3D2215       799.9     0.     999.9 FIXEDHF     0.800  0       0.0  0
 484    1J 1D2215       861.0     0.    1076.2 FIXEDHF     0.800  0       0.0  0  p5d3      -3d14p
 485    1J 3D2215       705.4     0.     881.8 FIXEDHF     0.800  0       0.0  0
 486    1U 1D2216    -34375.7     0.  -42969.6 FIXEDHF     0.800  0       0.0  0  p5d3      -3d4f
 487    1U 3D2216    -18699.9     0.  -23374.9 FIXEDHF     0.800  0       0.0  0
 488    1V 1D2216    -26970.7     0.  -33713.4 FIXEDHF     0.800  0       0.0  0  p5d3      -3d5f
 489    1V 3D2216    -15274.6     0.  -19093.2 FIXEDHF     0.800  0       0.0  0
 490    1W 1D2216    -20652.7     0.  -25815.9 FIXEDHF     0.800  0       0.0  0  p5d3      -3d6f
 491    1W 3D2216    -11918.3     0.  -14897.9 FIXEDHF     0.800  0       0.0  0
 492    1X 1D2216    -16322.1     0.  -20402.6 FIXEDHF     0.800  0       0.0  0  p5d3      -3d7f
 493    1X 3D2216     -9516.6     0.  -11895.8 FIXEDHF     0.800  0       0.0  0
 494    1Y 1D2216    -13295.4     0.  -16619.2 FIXEDHF     0.800  0       0.0  0  p5d3      -3d8f
 495    1Y 3D2216     -7800.6     0.   -9750.8 FIXEDHF     0.800  0       0.0  0
 496    1Z 1D2216    -11096.3     0.  -13870.4 FIXEDHF     0.800  0       0.0  0  p5d3      -3d9f
 497    1Z 3D2216     -6537.3     0.   -8171.6 FIXEDHF     0.800  0       0.0  0
 498    1a 1D2216     -9442.2     0.  -11802.8 FIXEDHF     0.800  0       0.0  0  p5d3      -3d10f
 499    1a 3D2216     -5578.8     0.   -6973.5 FIXEDHF     0.800  0       0.0  0
 500    1b 1D2216     -8162.0     0.  -10202.5 FIXEDHF     0.800  0       0.0  0  p5d3      -3d11f
 501    1b 3D2216     -4832.3     0.   -6040.4 FIXEDHF     0.800  0       0.0  0
 502    1c 1D2216     -7147.2     0.   -8934.0 FIXEDHF     0.800  0       0.0  0  p5d3      -3d12f
 503    1c 3D2216     -4238.1     0.   -5297.6 FIXEDHF     0.800  0       0.0  0
 504    1d 1D2216     -6326.9     0.   -7908.6 FIXEDHF     0.800  0       0.0  0  p5d3      -3d13f
 505    1d 3D2216     -3756.2     0.   -4695.2 FIXEDHF     0.800  0       0.0  0
 506    1o 3D2217      -309.8     0.    -387.3 FIXEDHF     0.800  0       0.0  0  p5d3      -3d6h
 507    1p 3D2217      -353.9     0.    -442.4 FIXEDHF     0.800  0       0.0  0  p5d3      -3d7h
 508    1q 3D2217      -347.5     0.    -434.4 FIXEDHF     0.800  0       0.0  0  p5d3      -3d8h
 509    1r 3D2217      -324.9     0.    -406.1 FIXEDHF     0.800  0       0.0  0  p5d3      -3d9h
 510    23 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -p5d2 5d
 511    23 2D1414     11574.1     0.   14467.6 FIXEDHF     0.800  0       0.0  0
 512    23 1E1414      3967.6     0.    4959.5 FIXEDHF     0.800  0       0.0  0
 513    23 3E1414      3977.0     0.    4971.3 FIXEDHF     0.800  0       0.0  0
 514    23 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 515    23 2D2424     12189.3     0.   15236.6 FIXEDHF     0.800  0       0.0  0
 516    23 4D2424      6913.0     0.    8641.3 FIXEDHF     0.800  0       0.0  0
 517    23 0E2424      5332.6     0.    6665.8 FIXEDHF     0.800  0       0.0  0
 518    23 2E2424      6319.7     0.    7899.6 FIXEDHF     0.800  0       0.0  0
 519    23 4E2424      4885.7     0.    6107.1 FIXEDHF     0.800  0       0.0  0
 520    24 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -p5d2 6d
 521    24 2D1414      7445.3     0.    9306.6 FIXEDHF     0.800  0       0.0  0
 522    24 1E1414      2688.2     0.    3360.2 FIXEDHF     0.800  0       0.0  0
 523    24 3E1414      2744.6     0.    3430.8 FIXEDHF     0.800  0       0.0  0
 524    24 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 525    24 2D2424      7876.2     0.    9845.2 FIXEDHF     0.800  0       0.0  0
 526    24 4D2424      4674.0     0.    5842.5 FIXEDHF     0.800  0       0.0  0
 527    24 0E2424      3662.2     0.    4577.7 FIXEDHF     0.800  0       0.0  0
 528    24 2E2424      4380.8     0.    5476.0 FIXEDHF     0.800  0       0.0  0
 529    24 4E2424      3402.0     0.    4252.5 FIXEDHF     0.800  0       0.0  0
 530    25 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -p5d2 7d
 531    25 2D1414      5371.8     0.    6714.7 FIXEDHF     0.800  0       0.0  0
 532    25 1E1414      1985.8     0.    2482.2 FIXEDHF     0.800  0       0.0  0
 533    25 3E1414      2048.3     0.    2560.4 FIXEDHF     0.800  0       0.0  0
 534    25 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 535    25 2D2424      5699.9     0.    7124.9 FIXEDHF     0.800  0       0.0  0
 536    25 4D2424      3454.1     0.    4317.6 FIXEDHF     0.800  0       0.0  0
 537    25 0E2424      2733.0     0.    3416.2 FIXEDHF     0.800  0       0.0  0
 538    25 2E2424      3281.8     0.    4102.3 FIXEDHF     0.800  0       0.0  0
 539    25 4E2424      2553.6     0.    3192.0 FIXEDHF     0.800  0       0.0  0
 540    26 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -p5d2 8d
 541    26 2D1414      4140.3     0.    5175.4 FIXEDHF     0.800  0       0.0  0
 542    26 1E1414      1550.6     0.    1938.3 FIXEDHF     0.800  0       0.0  0
 543    26 3E1414      1609.5     0.    2011.9 FIXEDHF     0.800  0       0.0  0
 544    26 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 545    26 2D2424      4402.3     0.    5502.9 FIXEDHF     0.800  0       0.0  0
 546    26 4D2424      2698.8     0.    3373.5 FIXEDHF     0.800  0       0.0  0
 547    26 0E2424      2149.8     0.    2687.3 FIXEDHF     0.800  0       0.0  0
 548    26 2E2424      2585.9     0.    3232.4 FIXEDHF     0.800  0       0.0  0
 549    26 4E2424      2014.1     0.    2517.6 FIXEDHF     0.800  0       0.0  0
 550    27 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -p5d2 9d
 551    27 2D1414      3328.4     0.    4160.5 FIXEDHF     0.800  0       0.0  0
 552    27 1E1414      1256.3     0.    1570.4 FIXEDHF     0.800  0       0.0  0
 553    27 3E1414      1309.7     0.    1637.1 FIXEDHF     0.800  0       0.0  0
 554    27 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 555    27 2D2424      3544.2     0.    4430.3 FIXEDHF     0.800  0       0.0  0
 556    27 4D2424      2188.6     0.    2735.8 FIXEDHF     0.800  0       0.0  0
 557    27 0E2424      1750.9     0.    2188.6 FIXEDHF     0.800  0       0.0  0
 558    27 2E2424      2108.7     0.    2635.9 FIXEDHF     0.800  0       0.0  0
 559    27 4E2424      1643.4     0.    2054.2 FIXEDHF     0.800  0       0.0  0
 560    28 2D1413     25501.4     0.   31876.7 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -p5d2 4s
 561    28 1E1413      7747.0     0.    9683.8 FIXEDHF     0.800  0       0.0  0
 562    28 2D2423     25931.8     0.   32414.8 FIXEDHF     0.800  0       0.0  0
 563    28 2E2423      9859.4     0.   12324.3 FIXEDHF     0.800  0       0.0  0
 564    29 1D2415     41856.1     0.   52320.1 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d4p
 565    29 3D2415     16299.7     0.   20374.6 FIXEDHF     0.800  0       0.0  0
 566    29 1E2415      8038.7     0.   10048.4 FIXEDHF     0.800  0       0.0  0
 567    29 3E2415      7832.3     0.    9790.4 FIXEDHF     0.800  0       0.0  0
 568    2A 1D2415     11581.4     0.   14476.7 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d5p
 569    2A 3D2415      7673.3     0.    9591.6 FIXEDHF     0.800  0       0.0  0
 570    2A 1E2415      4469.8     0.    5587.2 FIXEDHF     0.800  0       0.0  0
 571    2A 3E2415      4477.5     0.    5596.9 FIXEDHF     0.800  0       0.0  0
 572    2B 1D2415      6983.5     0.    8729.4 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d6p
 573    2B 3D2415      4901.7     0.    6127.1 FIXEDHF     0.800  0       0.0  0
 574    2B 1E2415      2989.6     0.    3737.0 FIXEDHF     0.800  0       0.0  0
 575    2B 3E2415      3019.2     0.    3774.0 FIXEDHF     0.800  0       0.0  0
 576    2C 1D2415      4903.5     0.    6129.4 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d7p
 577    2C 3D2415      3526.2     0.    4407.8 FIXEDHF     0.800  0       0.0  0
 578    2C 1E2415      2198.3     0.    2747.9 FIXEDHF     0.800  0       0.0  0
 579    2C 3E2415      2227.7     0.    2784.6 FIXEDHF     0.800  0       0.0  0
 580    2D 1D2415      3722.2     0.    4652.8 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d8p
 581    2D 3D2415      2710.9     0.    3388.6 FIXEDHF     0.800  0       0.0  0
 582    2D 1E2415      1711.3     0.    2139.1 FIXEDHF     0.800  0       0.0  0
 583    2D 3E2415      1737.1     0.    2171.4 FIXEDHF     0.800  0       0.0  0
 584    2E 1D2415      2964.8     0.    3706.0 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d9p
 585    2E 3D2415      2175.5     0.    2719.4 FIXEDHF     0.800  0       0.0  0
 586    2E 1E2415      1384.2     0.    1730.2 FIXEDHF     0.800  0       0.0  0
 587    2E 3E2415      1406.6     0.    1758.2 FIXEDHF     0.800  0       0.0  0
 588    2F 1D2415      2440.7     0.    3050.9 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d10p
 589    2F 3D2415      1799.7     0.    2249.6 FIXEDHF     0.800  0       0.0  0
 590    2F 1E2415      1151.1     0.    1438.9 FIXEDHF     0.800  0       0.0  0
 591    2F 3E2415      1170.6     0.    1463.2 FIXEDHF     0.800  0       0.0  0
 592    2G 1D2415      2058.5     0.    2573.1 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d11p
 593    2G 3D2415      1522.9     0.    1903.6 FIXEDHF     0.800  0       0.0  0
 594    2G 1E2415       977.7     0.    1222.1 FIXEDHF     0.800  0       0.0  0
 595    2G 3E2415       994.6     0.    1243.3 FIXEDHF     0.800  0       0.0  0
 596    2H 1D2415      1768.6     0.    2210.8 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d12p
 597    2H 3D2415      1311.5     0.    1639.4 FIXEDHF     0.800  0       0.0  0
 598    2H 1E2415       844.3     0.    1055.4 FIXEDHF     0.800  0       0.0  0
 599    2H 3E2415       859.3     0.    1074.1 FIXEDHF     0.800  0       0.0  0
 600    2I 1D2415      1542.2     0.    1927.8 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d13p
 601    2I 3D2415      1145.7     0.    1432.1 FIXEDHF     0.800  0       0.0  0
 602    2I 1E2415       739.1     0.     923.9 FIXEDHF     0.800  0       0.0  0
 603    2I 3E2415       752.3     0.     940.4 FIXEDHF     0.800  0       0.0  0
 604    2J 1D2415      1361.1     0.    1701.4 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d14p
 605    2J 3D2415      1012.4     0.    1265.5 FIXEDHF     0.800  0       0.0  0
 606    2J 1E2415       654.2     0.     817.8 FIXEDHF     0.800  0       0.0  0
 607    2J 3E2415       666.0     0.     832.5 FIXEDHF     0.800  0       0.0  0
 608    2U 1D2416     25397.1     0.   31746.4 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d4f
 609    2U 3D2416      6144.1     0.    7680.1 FIXEDHF     0.800  0       0.0  0
 610    2U 1E2416     -1261.6     0.   -1577.0 FIXEDHF     0.800  0       0.0  0
 611    2U 3E2416        17.0     0.      21.2 FIXEDHF     0.800  0       0.0  0
 612    2V 1D2416      7830.3     0.    9787.9 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d5f
 613    2V 3D2416      2575.5     0.    3219.4 FIXEDHF     0.800  0       0.0  0
 614    2V 1E2416     -1520.3     0.   -1900.4 FIXEDHF     0.800  0       0.0  0
 615    2V 3E2416      -453.5     0.    -566.9 FIXEDHF     0.800  0       0.0  0
 616    2W 1D2416      3134.8     0.    3918.5 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d6f
 617    2W 3D2416      1220.6     0.    1525.7 FIXEDHF     0.800  0       0.0  0
 618    2W 1E2416     -1377.0     0.   -1721.2 FIXEDHF     0.800  0       0.0  0
 619    2W 3E2416      -543.5     0.    -679.4 FIXEDHF     0.800  0       0.0  0
 620    2X 1D2416      1426.8     0.    1783.5 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d7f
 621    2X 3D2416       645.0     0.     806.3 FIXEDHF     0.800  0       0.0  0
 622    2X 1E2416     -1185.8     0.   -1482.3 FIXEDHF     0.800  0       0.0  0
 623    2X 3E2416      -521.9     0.    -652.4 FIXEDHF     0.800  0       0.0  0
 624    2Y 1D2416       683.8     0.     854.7 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d8f
 625    2Y 3D2416       367.8     0.     459.8 FIXEDHF     0.800  0       0.0  0
 626    2Y 1E2416     -1016.1     0.   -1270.1 FIXEDHF     0.800  0       0.0  0
 627    2Y 3E2416      -473.3     0.    -591.6 FIXEDHF     0.800  0       0.0  0
 628    2Z 1D2416       321.6     0.     402.0 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d9f
 629    2Z 3D2416       220.8     0.     276.0 FIXEDHF     0.800  0       0.0  0
 630    2Z 1E2416      -876.2     0.   -1095.2 FIXEDHF     0.800  0       0.0  0
 631    2Z 3E2416      -422.3     0.    -527.9 FIXEDHF     0.800  0       0.0  0
 632    2a 1D2416       131.4     0.     164.3 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d10f
 633    2a 3D2416       137.0     0.     171.3 FIXEDHF     0.800  0       0.0  0
 634    2a 1E2416      -762.4     0.    -953.0 FIXEDHF     0.800  0       0.0  0
 635    2a 3E2416      -375.8     0.    -469.8 FIXEDHF     0.800  0       0.0  0
 636    2b 1D2416        26.7     0.      33.4 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d11f
 637    2b 3D2416        86.6     0.     108.3 FIXEDHF     0.800  0       0.0  0
 638    2b 1E2416      -669.7     0.    -837.1 FIXEDHF     0.800  0       0.0  0
 639    2b 3E2416      -335.3     0.    -419.1 FIXEDHF     0.800  0       0.0  0
 640    2c 1D2416       -32.6     0.     -40.7 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d12f
 641    2c 3D2416        55.1     0.      68.9 FIXEDHF     0.800  0       0.0  0
 642    2c 1E2416      -593.4     0.    -741.8 FIXEDHF     0.800  0       0.0  0
 643    2c 3E2416      -300.6     0.    -375.7 FIXEDHF     0.800  0       0.0  0
 644    2d 1D2416       -66.4     0.     -83.0 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d13f
 645    2d 3D2416        34.6     0.      43.3 FIXEDHF     0.800  0       0.0  0
 646    2d 1E2416      -530.2     0.    -662.7 FIXEDHF     0.800  0       0.0  0
 647    2d 3E2416      -270.8     0.    -338.5 FIXEDHF     0.800  0       0.0  0
 648    2o 3D2417       727.9     0.     909.9 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d6h
 649    2o 3E2417        89.2     0.     111.5 FIXEDHF     0.800  0       0.0  0
 650    2p 3D2417       762.4     0.     953.0 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d7h
 651    2p 3E2417        98.9     0.     123.6 FIXEDHF     0.800  0       0.0  0
 652    2q 3D2417       709.7     0.     887.1 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d8h
 653    2q 3E2417        95.2     0.     119.0 FIXEDHF     0.800  0       0.0  0
 654    2r 3D2417       640.4     0.     800.5 FIXEDHF     0.800  0       0.0  0  p5d2 4d   -3d9h
 655    2r 3E2417        87.8     0.     109.8 FIXEDHF     0.800  0       0.0  0
 656    34 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -p5d2 6d
 657    34 2D1414      6013.6     0.    7517.0 FIXEDHF     0.800  0       0.0  0
 658    34 1E1414      1714.6     0.    2143.3 FIXEDHF     0.800  0       0.0  0
 659    34 3E1414      1802.6     0.    2253.2 FIXEDHF     0.800  0       0.0  0
 660    34 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 661    34 2D2424      6310.6     0.    7888.2 FIXEDHF     0.800  0       0.0  0
 662    34 4D2424      3295.7     0.    4119.6 FIXEDHF     0.800  0       0.0  0
 663    34 0E2424      2235.8     0.    2794.8 FIXEDHF     0.800  0       0.0  0
 664    34 2E2424      2828.5     0.    3535.6 FIXEDHF     0.800  0       0.0  0
 665    34 4E2424      2239.3     0.    2799.1 FIXEDHF     0.800  0       0.0  0
 666    35 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -p5d2 7d
 667    35 2D1414      4343.7     0.    5429.6 FIXEDHF     0.800  0       0.0  0
 668    35 1E1414      1285.6     0.    1607.0 FIXEDHF     0.800  0       0.0  0
 669    35 3E1414      1362.7     0.    1703.4 FIXEDHF     0.800  0       0.0  0
 670    35 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 671    35 2D2424      4566.0     0.    5707.5 FIXEDHF     0.800  0       0.0  0
 672    35 4D2424      2473.3     0.    3091.6 FIXEDHF     0.800  0       0.0  0
 673    35 0E2424      1676.6     0.    2095.7 FIXEDHF     0.800  0       0.0  0
 674    35 2E2424      2137.8     0.    2672.3 FIXEDHF     0.800  0       0.0  0
 675    35 4E2424      1697.7     0.    2122.1 FIXEDHF     0.800  0       0.0  0
 676    36 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -p5d2 8d
 677    36 2D1414      3353.8     0.    4192.2 FIXEDHF     0.800  0       0.0  0
 678    36 1E1414      1013.2     0.    1266.5 FIXEDHF     0.800  0       0.0  0
 679    36 3E1414      1079.2     0.    1349.0 FIXEDHF     0.800  0       0.0  0
 680    36 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 681    36 2D2424      3529.6     0.    4412.0 FIXEDHF     0.800  0       0.0  0
 682    36 4D2424      1949.3     0.    2436.6 FIXEDHF     0.800  0       0.0  0
 683    36 0E2424      1322.6     0.    1653.3 FIXEDHF     0.800  0       0.0  0
 684    36 2E2424      1693.5     0.    2116.9 FIXEDHF     0.800  0       0.0  0
 685    36 4E2424      1347.1     0.    1683.9 FIXEDHF     0.800  0       0.0  0
 686    37 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -p5d2 9d
 687    37 2D1414      2700.7     0.    3375.9 FIXEDHF     0.800  0       0.0  0
 688    37 1E1414       826.2     0.    1032.7 FIXEDHF     0.800  0       0.0  0
 689    37 3E1414       883.0     0.    1103.7 FIXEDHF     0.800  0       0.0  0
 690    37 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 691    37 2D2424      2844.7     0.    3555.9 FIXEDHF     0.800  0       0.0  0
 692    37 4D2424      1589.8     0.    1987.2 FIXEDHF     0.800  0       0.0  0
 693    37 0E2424      1079.3     0.    1349.1 FIXEDHF     0.800  0       0.0  0
 694    37 2E2424      1386.0     0.    1732.5 FIXEDHF     0.800  0       0.0  0
 695    37 4E2424      1103.8     0.    1379.7 FIXEDHF     0.800  0       0.0  0
 696    38 2D1413     13906.3     0.   17382.9 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -p5d2 4s
 697    38 1E1413      4722.9     0.    5903.6 FIXEDHF     0.800  0       0.0  0
 698    38 2D2423     14066.5     0.   17583.1 FIXEDHF     0.800  0       0.0  0
 699    38 2E2423      6126.9     0.    7658.6 FIXEDHF     0.800  0       0.0  0
 700    39 1D2415     18270.9     0.   22838.6 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d4p
 701    39 3D2415      9159.0     0.   11448.7 FIXEDHF     0.800  0       0.0  0
 702    39 1E2415      4837.6     0.    6047.0 FIXEDHF     0.800  0       0.0  0
 703    39 3E2415      4842.3     0.    6052.9 FIXEDHF     0.800  0       0.0  0
 704    3A 1D2415     18152.2     0.   22690.2 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d5p
 705    3A 3D2415      5974.6     0.    7468.2 FIXEDHF     0.800  0       0.0  0
 706    3A 1E2415      2791.1     0.    3488.9 FIXEDHF     0.800  0       0.0  0
 707    3A 3E2415      2888.6     0.    3610.8 FIXEDHF     0.800  0       0.0  0
 708    3B 1D2415      6945.4     0.    8681.7 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d6p
 709    3B 3D2415      3775.7     0.    4719.6 FIXEDHF     0.800  0       0.0  0
 710    3B 1E2415      1894.0     0.    2367.5 FIXEDHF     0.800  0       0.0  0
 711    3B 3E2415      1981.4     0.    2476.7 FIXEDHF     0.800  0       0.0  0
 712    3C 1D2415      4656.1     0.    5820.1 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d7p
 713    3C 3D2415      2723.6     0.    3404.5 FIXEDHF     0.800  0       0.0  0
 714    3C 1E2415      1403.0     0.    1753.8 FIXEDHF     0.800  0       0.0  0
 715    3C 3E2415      1475.0     0.    1843.7 FIXEDHF     0.800  0       0.0  0
 716    3D 1D2415      3464.6     0.    4330.7 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d8p
 717    3D 3D2415      2098.6     0.    2623.2 FIXEDHF     0.800  0       0.0  0
 718    3D 1E2415      1096.9     0.    1371.1 FIXEDHF     0.800  0       0.0  0
 719    3D 3E2415      1156.2     0.    1445.2 FIXEDHF     0.800  0       0.0  0
 720    3E 1D2415      2729.8     0.    3412.3 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d9p
 721    3E 3D2415      1686.8     0.    2108.5 FIXEDHF     0.800  0       0.0  0
 722    3E 1E2415       889.7     0.    1112.1 FIXEDHF     0.800  0       0.0  0
 723    3E 3E2415       939.3     0.    1174.1 FIXEDHF     0.800  0       0.0  0
 724    3F 1D2415      2232.3     0.    2790.4 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d10p
 725    3F 3D2415      1397.0     0.    1746.2 FIXEDHF     0.800  0       0.0  0
 726    3F 1E2415       741.3     0.     926.6 FIXEDHF     0.800  0       0.0  0
 727    3F 3E2415       783.4     0.     979.3 FIXEDHF     0.800  0       0.0  0
 728    3G 1D2415      1874.3     0.    2342.9 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d11p
 729    3G 3D2415      1183.0     0.    1478.8 FIXEDHF     0.800  0       0.0  0
 730    3G 1E2415       630.5     0.     788.1 FIXEDHF     0.800  0       0.0  0
 731    3G 3E2415       666.8     0.     833.5 FIXEDHF     0.800  0       0.0  0
 732    3H 1D2415      1605.3     0.    2006.6 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d12p
 733    3H 3D2415      1019.4     0.    1274.3 FIXEDHF     0.800  0       0.0  0
 734    3H 1E2415       545.0     0.     681.3 FIXEDHF     0.800  0       0.0  0
 735    3H 3E2415       576.7     0.     720.9 FIXEDHF     0.800  0       0.0  0
 736    3I 1D2415      1396.6     0.    1745.7 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d13p
 737    3I 3D2415       891.0     0.    1113.7 FIXEDHF     0.800  0       0.0  0
 738    3I 1E2415       477.4     0.     596.8 FIXEDHF     0.800  0       0.0  0
 739    3I 3E2415       505.4     0.     631.8 FIXEDHF     0.800  0       0.0  0
 740    3J 1D2415      1230.2     0.    1537.8 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d14p
 741    3J 3D2415       787.6     0.     984.5 FIXEDHF     0.800  0       0.0  0
 742    3J 1E2415       422.8     0.     528.5 FIXEDHF     0.800  0       0.0  0
 743    3J 3E2415       447.8     0.     559.7 FIXEDHF     0.800  0       0.0  0
 744    3U 1D2416      6376.3     0.    7970.4 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d4f
 745    3U 3D2416      3259.8     0.    4074.8 FIXEDHF     0.800  0       0.0  0
 746    3U 1E2416       282.7     0.     353.4 FIXEDHF     0.800  0       0.0  0
 747    3U 3E2416       708.6     0.     885.8 FIXEDHF     0.800  0       0.0  0
 748    3V 1D2416     12152.2     0.   15190.2 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d5f
 749    3V 3D2416      2577.3     0.    3221.6 FIXEDHF     0.800  0       0.0  0
 750    3V 1E2416       -81.0     0.    -101.2 FIXEDHF     0.800  0       0.0  0
 751    3V 3E2416       305.0     0.     381.3 FIXEDHF     0.800  0       0.0  0
 752    3W 1D2416      6161.4     0.    7701.8 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d6f
 753    3W 3D2416      1635.5     0.    2044.4 FIXEDHF     0.800  0       0.0  0
 754    3W 1E2416      -187.6     0.    -234.5 FIXEDHF     0.800  0       0.0  0
 755    3W 3E2416       123.4     0.     154.3 FIXEDHF     0.800  0       0.0  0
 756    3X 1D2416      3803.1     0.    4753.9 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d7f
 757    3X 3D2416      1121.3     0.    1401.6 FIXEDHF     0.800  0       0.0  0
 758    3X 1E2416      -206.8     0.    -258.5 FIXEDHF     0.800  0       0.0  0
 759    3X 3E2416        44.6     0.      55.8 FIXEDHF     0.800  0       0.0  0
 760    3Y 1D2416      2619.4     0.    3274.3 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d8f
 761    3Y 3D2416       822.8     0.    1028.5 FIXEDHF     0.800  0       0.0  0
 762    3Y 1E2416      -198.8     0.    -248.5 FIXEDHF     0.800  0       0.0  0
 763    3Y 3E2416         8.4     0.      10.5 FIXEDHF     0.800  0       0.0  0
 764    3Z 1D2416      1938.5     0.    2423.1 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d9f
 765    3Z 3D2416       635.4     0.     794.3 FIXEDHF     0.800  0       0.0  0
 766    3Z 1E2416      -183.0     0.    -228.8 FIXEDHF     0.800  0       0.0  0
 767    3Z 3E2416        -8.9     0.     -11.1 FIXEDHF     0.800  0       0.0  0
 768    3a 1D2416      1508.5     0.    1885.6 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d10f
 769    3a 3D2416       509.8     0.     637.2 FIXEDHF     0.800  0       0.0  0
 770    3a 1E2416      -166.1     0.    -207.6 FIXEDHF     0.800  0       0.0  0
 771    3a 3E2416       -17.3     0.     -21.6 FIXEDHF     0.800  0       0.0  0
 772    3b 1D2416      1217.8     0.    1522.3 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d11f
 773    3b 3D2416       421.0     0.     526.3 FIXEDHF     0.800  0       0.0  0
 774    3b 1E2416      -150.1     0.    -187.6 FIXEDHF     0.800  0       0.0  0
 775    3b 3E2416       -21.0     0.     -26.3 FIXEDHF     0.800  0       0.0  0
 776    3c 1D2416      1011.0     0.    1263.8 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d12f
 777    3c 3D2416       355.7     0.     444.6 FIXEDHF     0.800  0       0.0  0
 778    3c 1E2416      -135.8     0.    -169.7 FIXEDHF     0.800  0       0.0  0
 779    3c 3E2416       -22.6     0.     -28.2 FIXEDHF     0.800  0       0.0  0
 780    3d 1D2416       857.8     0.    1072.2 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d13f
 781    3d 3D2416       306.0     0.     382.5 FIXEDHF     0.800  0       0.0  0
 782    3d 1E2416      -123.1     0.    -153.9 FIXEDHF     0.800  0       0.0  0
 783    3d 3E2416       -22.8     0.     -28.5 FIXEDHF     0.800  0       0.0  0
 784    3o 3D2417      -130.9     0.    -163.6 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d6h
 785    3o 3E2417        62.1     0.      77.6 FIXEDHF     0.800  0       0.0  0
 786    3p 3D2417       -23.0     0.     -28.8 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d7h
 787    3p 3E2417        69.7     0.      87.1 FIXEDHF     0.800  0       0.0  0
 788    3q 3D2417        33.0     0.      41.2 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d8h
 789    3q 3E2417        67.6     0.      84.5 FIXEDHF     0.800  0       0.0  0
 790    3r 3D2417        59.0     0.      73.8 FIXEDHF     0.800  0       0.0  0  p5d2 5d   -3d9h
 791    3r 3E2417        62.7     0.      78.4 FIXEDHF     0.800  0       0.0  0
 792    45 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -p5d2 7d
 793    45 2D1414      3428.2     0.    4285.3 FIXEDHF     0.800  0       0.0  0
 794    45 1E1414       910.9     0.    1138.6 FIXEDHF     0.800  0       0.0  0
 795    45 3E1414       977.7     0.    1222.1 FIXEDHF     0.800  0       0.0  0
 796    45 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 797    45 2D2424      3593.0     0.    4491.2 FIXEDHF     0.800  0       0.0  0
 798    45 4D2424      1814.5     0.    2268.1 FIXEDHF     0.800  0       0.0  0
 799    45 0E2424      1169.0     0.    1461.2 FIXEDHF     0.800  0       0.0  0
 800    45 2E2424      1523.3     0.    1904.1 FIXEDHF     0.800  0       0.0  0
 801    45 4E2424      1219.3     0.    1524.1 FIXEDHF     0.800  0       0.0  0
 802    46 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -p5d2 8d
 803    46 2D1414      2644.8     0.    3306.0 FIXEDHF     0.800  0       0.0  0
 804    46 1E1414       720.7     0.     900.9 FIXEDHF     0.800  0       0.0  0
 805    46 3E1414       777.0     0.     971.2 FIXEDHF     0.800  0       0.0  0
 806    46 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 807    46 2D2424      2774.4     0.    3468.0 FIXEDHF     0.800  0       0.0  0
 808    46 4D2424      1438.3     0.    1797.9 FIXEDHF     0.800  0       0.0  0
 809    46 0E2424       923.4     0.    1154.2 FIXEDHF     0.800  0       0.0  0
 810    46 2E2424      1209.5     0.    1511.9 FIXEDHF     0.800  0       0.0  0
 811    46 4E2424       970.1     0.    1212.6 FIXEDHF     0.800  0       0.0  0
 812    47 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -p5d2 9d
 813    47 2D1414      2130.6     0.    2663.2 FIXEDHF     0.800  0       0.0  0
 814    47 1E1414       589.3     0.     736.6 FIXEDHF     0.800  0       0.0  0
 815    47 3E1414       637.2     0.     796.5 FIXEDHF     0.800  0       0.0  0
 816    47 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 817    47 2D2424      2236.4     0.    2795.5 FIXEDHF     0.800  0       0.0  0
 818    47 4D2424      1177.3     0.    1471.6 FIXEDHF     0.800  0       0.0  0
 819    47 0E2424       754.2     0.     942.7 FIXEDHF     0.800  0       0.0  0
 820    47 2E2424       991.5     0.    1239.4 FIXEDHF     0.800  0       0.0  0
 821    47 4E2424       796.2     0.     995.3 FIXEDHF     0.800  0       0.0  0
 822    48 2D1413      9142.1     0.   11427.6 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -p5d2 4s
 823    48 1E1413      3251.9     0.    4064.9 FIXEDHF     0.800  0       0.0  0
 824    48 2D2423      9233.1     0.   11541.4 FIXEDHF     0.800  0       0.0  0
 825    48 2E2423      4260.9     0.    5326.1 FIXEDHF     0.800  0       0.0  0
 826    49 1D2415     11161.4     0.   13951.7 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d4p
 827    49 3D2415      6091.8     0.    7614.7 FIXEDHF     0.800  0       0.0  0
 828    49 1E2415      3311.0     0.    4138.8 FIXEDHF     0.800  0       0.0  0
 829    49 3E2415      3355.9     0.    4194.9 FIXEDHF     0.800  0       0.0  0
 830    4A 1D2415     10409.2     0.   13011.5 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d5p
 831    4A 3D2415      4176.5     0.    5220.6 FIXEDHF     0.800  0       0.0  0
 832    4A 1E2415      1944.8     0.    2431.0 FIXEDHF     0.800  0       0.0  0
 833    4A 3E2415      2042.9     0.    2553.6 FIXEDHF     0.800  0       0.0  0
 834    4B 1D2415      9443.0     0.   11803.7 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d6p
 835    4B 3D2415      2914.1     0.    3642.6 FIXEDHF     0.800  0       0.0  0
 836    4B 1E2415      1328.9     0.    1661.1 FIXEDHF     0.800  0       0.0  0
 837    4B 3E2415      1412.6     0.    1765.7 FIXEDHF     0.800  0       0.0  0
 838    4C 1D2415      4350.6     0.    5438.2 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d7p
 839    4C 3D2415      2092.6     0.    2615.7 FIXEDHF     0.800  0       0.0  0
 840    4C 1E2415       987.9     0.    1234.9 FIXEDHF     0.800  0       0.0  0
 841    4C 3E2415      1055.8     0.    1319.8 FIXEDHF     0.800  0       0.0  0
 842    4D 1D2415      3118.1     0.    3897.6 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d8p
 843    4D 3D2415      1614.0     0.    2017.5 FIXEDHF     0.800  0       0.0  0
 844    4D 1E2415       774.0     0.     967.5 FIXEDHF     0.800  0       0.0  0
 845    4D 3E2415       829.7     0.    1037.1 FIXEDHF     0.800  0       0.0  0
 846    4E 1D2415      2416.7     0.    3020.9 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d9p
 847    4E 3D2415      1298.6     0.    1623.2 FIXEDHF     0.800  0       0.0  0
 848    4E 1E2415       628.6     0.     785.8 FIXEDHF     0.800  0       0.0  0
 849    4E 3E2415       675.1     0.     843.9 FIXEDHF     0.800  0       0.0  0
 850    4F 1D2415      1958.4     0.    2448.0 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d10p
 851    4F 3D2415      1076.2     0.    1345.2 FIXEDHF     0.800  0       0.0  0
 852    4F 1E2415       524.2     0.     655.3 FIXEDHF     0.800  0       0.0  0
 853    4F 3E2415       563.7     0.     704.6 FIXEDHF     0.800  0       0.0  0
 854    4G 1D2415      1635.0     0.    2043.8 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d11p
 855    4G 3D2415       911.8     0.    1139.8 FIXEDHF     0.800  0       0.0  0
 856    4G 1E2415       446.2     0.     557.7 FIXEDHF     0.800  0       0.0  0
 857    4G 3E2415       480.2     0.     600.2 FIXEDHF     0.800  0       0.0  0
 858    4H 1D2415      1395.0     0.    1743.7 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d12p
 859    4H 3D2415       786.1     0.     982.6 FIXEDHF     0.800  0       0.0  0
 860    4H 1E2415       385.8     0.     482.3 FIXEDHF     0.800  0       0.0  0
 861    4H 3E2415       415.5     0.     519.4 FIXEDHF     0.800  0       0.0  0
 862    4I 1D2415      1210.2     0.    1512.8 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d13p
 863    4I 3D2415       687.2     0.     859.0 FIXEDHF     0.800  0       0.0  0
 864    4I 1E2415       338.2     0.     422.7 FIXEDHF     0.800  0       0.0  0
 865    4I 3E2415       364.3     0.     455.4 FIXEDHF     0.800  0       0.0  0
 866    4J 1D2415      1064.0     0.    1330.0 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d14p
 867    4J 3D2415       607.6     0.     759.5 FIXEDHF     0.800  0       0.0  0
 868    4J 1E2415       299.6     0.     374.5 FIXEDHF     0.800  0       0.0  0
 869    4J 3E2415       322.9     0.     403.6 FIXEDHF     0.800  0       0.0  0
 870    4U 1D2416      3877.9     0.    4847.4 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d4f
 871    4U 3D2416      2223.8     0.    2779.8 FIXEDHF     0.800  0       0.0  0
 872    4U 1E2416       515.1     0.     643.9 FIXEDHF     0.800  0       0.0  0
 873    4U 3E2416       706.2     0.     882.8 FIXEDHF     0.800  0       0.0  0
 874    4V 1D2416      4400.5     0.    5500.6 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d5f
 875    4V 3D2416      1769.8     0.    2212.2 FIXEDHF     0.800  0       0.0  0
 876    4V 1E2416       203.5     0.     254.4 FIXEDHF     0.800  0       0.0  0
 877    4V 3E2416       393.4     0.     491.8 FIXEDHF     0.800  0       0.0  0
 878    4W 1D2416      6647.9     0.    8309.9 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d6f
 879    4W 3D2416      1336.2     0.    1670.2 FIXEDHF     0.800  0       0.0  0
 880    4W 1E2416        71.3     0.      89.1 FIXEDHF     0.800  0       0.0  0
 881    4W 3E2416       229.1     0.     286.4 FIXEDHF     0.800  0       0.0  0
 882    4X 1D2416      4097.1     0.    5121.4 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d7f
 883    4X 3D2416       974.1     0.    1217.6 FIXEDHF     0.800  0       0.0  0
 884    4X 1E2416        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0
 885    4X 3E2416       146.1     0.     182.6 FIXEDHF     0.800  0       0.0  0
 886    4Y 1D2416      2884.6     0.    3605.7 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d8f
 887    4Y 3D2416       743.4     0.     929.3 FIXEDHF     0.800  0       0.0  0
 888    4Y 1E2416        -7.2     0.      -9.0 FIXEDHF     0.800  0       0.0  0
 889    4Y 3E2416       100.3     0.     125.4 FIXEDHF     0.800  0       0.0  0
 890    4Z 1D2416      2180.1     0.    2725.1 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d9f
 891    4Z 3D2416       590.5     0.     738.1 FIXEDHF     0.800  0       0.0  0
 892    4Z 1E2416       -17.7     0.     -22.1 FIXEDHF     0.800  0       0.0  0
 893    4Z 3E2416        73.1     0.      91.4 FIXEDHF     0.800  0       0.0  0
 894    4a 1D2416      1727.3     0.    2159.1 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d10f
 895    4a 3D2416       483.8     0.     604.7 FIXEDHF     0.800  0       0.0  0
 896    4a 1E2416       -22.1     0.     -27.6 FIXEDHF     0.800  0       0.0  0
 897    4a 3E2416        55.8     0.      69.7 FIXEDHF     0.800  0       0.0  0
 898    4b 1D2416      1415.6     0.    1769.5 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d11f
 899    4b 3D2416       406.1     0.     507.6 FIXEDHF     0.800  0       0.0  0
 900    4b 1E2416       -23.6     0.     -29.5 FIXEDHF     0.800  0       0.0  0
 901    4b 3E2416        44.0     0.      55.0 FIXEDHF     0.800  0       0.0  0
 902    4c 1D2416      1189.9     0.    1487.4 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d12f
 903    4c 3D2416       347.5     0.     434.4 FIXEDHF     0.800  0       0.0  0
 904    4c 1E2416       -23.6     0.     -29.5 FIXEDHF     0.800  0       0.0  0
 905    4c 3E2416        35.8     0.      44.8 FIXEDHF     0.800  0       0.0  0
 906    4d 1D2416      1020.2     0.    1275.2 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d13f
 907    4d 3D2416       302.0     0.     377.5 FIXEDHF     0.800  0       0.0  0
 908    4d 1E2416       -23.0     0.     -28.7 FIXEDHF     0.800  0       0.0  0
 909    4d 3E2416        29.8     0.      37.2 FIXEDHF     0.800  0       0.0  0
 910    4o 3D2417        10.8     0.      13.5 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d6h
 911    4o 3E2417        44.8     0.      56.0 FIXEDHF     0.800  0       0.0  0
 912    4p 3D2417       -28.0     0.     -35.0 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d7h
 913    4p 3E2417        50.6     0.      63.2 FIXEDHF     0.800  0       0.0  0
 914    4q 3D2417       -19.0     0.     -23.7 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d8h
 915    4q 3E2417        49.2     0.      61.5 FIXEDHF     0.800  0       0.0  0
 916    4r 3D2417        -7.9     0.      -9.9 FIXEDHF     0.800  0       0.0  0  p5d2 6d   -3d9h
 917    4r 3E2417        45.7     0.      57.1 FIXEDHF     0.800  0       0.0  0
 918    56 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -p5d2 8d
 919    56 2D1414      2127.4     0.    2659.3 FIXEDHF     0.800  0       0.0  0
 920    56 1E1414       547.1     0.     683.9 FIXEDHF     0.800  0       0.0  0
 921    56 3E1414       593.7     0.     742.1 FIXEDHF     0.800  0       0.0  0
 922    56 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 923    56 2D2424      2228.5     0.    2785.6 FIXEDHF     0.800  0       0.0  0
 924    56 4D2424      1108.9     0.    1386.1 FIXEDHF     0.800  0       0.0  0
 925    56 0E2424       695.3     0.     869.1 FIXEDHF     0.800  0       0.0  0
 926    56 2E2424       921.0     0.    1151.2 FIXEDHF     0.800  0       0.0  0
 927    56 4E2424       741.7     0.     927.1 FIXEDHF     0.800  0       0.0  0
 928    57 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -p5d2 9d
 929    57 2D1414      1712.3     0.    2140.4 FIXEDHF     0.800  0       0.0  0
 930    57 1E1414       448.0     0.     560.0 FIXEDHF     0.800  0       0.0  0
 931    57 3E1414       487.5     0.     609.4 FIXEDHF     0.800  0       0.0  0
 932    57 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 933    57 2D2424      1794.6     0.    2243.3 FIXEDHF     0.800  0       0.0  0
 934    57 4D2424       909.9     0.    1137.4 FIXEDHF     0.800  0       0.0  0
 935    57 0E2424       568.2     0.     710.2 FIXEDHF     0.800  0       0.0  0
 936    57 2E2424       755.6     0.     944.5 FIXEDHF     0.800  0       0.0  0
 937    57 4E2424       609.4     0.     761.7 FIXEDHF     0.800  0       0.0  0
 938    58 2D1413      6647.4     0.    8309.2 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -p5d2 4s
 939    58 1E1413      2423.4     0.    3029.3 FIXEDHF     0.800  0       0.0  0
 940    58 2D2423      6709.6     0.    8387.0 FIXEDHF     0.800  0       0.0  0
 941    58 2E2423      3194.8     0.    3993.5 FIXEDHF     0.800  0       0.0  0
 942    59 1D2415      7827.4     0.    9784.2 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d4p
 943    59 3D2415      4456.1     0.    5570.1 FIXEDHF     0.800  0       0.0  0
 944    59 1E2415      2459.4     0.    3074.3 FIXEDHF     0.800  0       0.0  0
 945    59 3E2415      2510.1     0.    3137.6 FIXEDHF     0.800  0       0.0  0
 946    5A 1D2415      7214.6     0.    9018.3 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d5p
 947    5A 3D2415      3125.0     0.    3906.3 FIXEDHF     0.800  0       0.0  0
 948    5A 1E2415      1459.4     0.    1824.2 FIXEDHF     0.800  0       0.0  0
 949    5A 3E2415      1545.5     0.    1931.9 FIXEDHF     0.800  0       0.0  0
 950    5B 1D2415      6204.0     0.    7755.0 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d6p
 951    5B 3D2415      2225.1     0.    2781.4 FIXEDHF     0.800  0       0.0  0
 952    5B 1E2415      1001.2     0.    1251.5 FIXEDHF     0.800  0       0.0  0
 953    5B 3E2415      1073.5     0.    1341.9 FIXEDHF     0.800  0       0.0  0
 954    5C 1D2415      5526.3     0.    6907.9 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d7p
 955    5C 3D2415      1659.6     0.    2074.5 FIXEDHF     0.800  0       0.0  0
 956    5C 1E2415       745.8     0.     932.3 FIXEDHF     0.800  0       0.0  0
 957    5C 3E2415       804.3     0.    1005.4 FIXEDHF     0.800  0       0.0  0
 958    5D 1D2415      2878.7     0.    3598.4 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d8p
 959    5D 3D2415      1277.3     0.    1596.6 FIXEDHF     0.800  0       0.0  0
 960    5D 1E2415       585.0     0.     731.2 FIXEDHF     0.800  0       0.0  0
 961    5D 3E2415       632.9     0.     791.1 FIXEDHF     0.800  0       0.0  0
 962    5E 1D2415      2162.5     0.    2703.1 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d9p
 963    5E 3D2415      1028.1     0.    1285.1 FIXEDHF     0.800  0       0.0  0
 964    5E 1E2415       475.4     0.     594.3 FIXEDHF     0.800  0       0.0  0
 965    5E 3E2415       515.4     0.     644.3 FIXEDHF     0.800  0       0.0  0
 966    5F 1D2415      1728.2     0.    2160.2 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d10p
 967    5F 3D2415       852.4     0.    1065.5 FIXEDHF     0.800  0       0.0  0
 968    5F 1E2415       396.7     0.     495.9 FIXEDHF     0.800  0       0.0  0
 969    5F 3E2415       430.6     0.     538.3 FIXEDHF     0.800  0       0.0  0
 970    5G 1D2415      1431.6     0.    1789.5 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d11p
 971    5G 3D2415       722.6     0.     903.2 FIXEDHF     0.800  0       0.0  0
 972    5G 1E2415       337.8     0.     422.2 FIXEDHF     0.800  0       0.0  0
 973    5G 3E2415       367.0     0.     458.7 FIXEDHF     0.800  0       0.0  0
 974    5H 1D2415      1215.4     0.    1519.3 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d12p
 975    5H 3D2415       623.0     0.     778.8 FIXEDHF     0.800  0       0.0  0
 976    5H 1E2415       292.2     0.     365.2 FIXEDHF     0.800  0       0.0  0
 977    5H 3E2415       317.7     0.     397.1 FIXEDHF     0.800  0       0.0  0
 978    5I 1D2415      1051.0     0.    1313.7 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d13p
 979    5I 3D2415       544.8     0.     681.0 FIXEDHF     0.800  0       0.0  0
 980    5I 1E2415       256.1     0.     320.1 FIXEDHF     0.800  0       0.0  0
 981    5I 3E2415       278.6     0.     348.2 FIXEDHF     0.800  0       0.0  0
 982    5J 1D2415       921.8     0.    1152.2 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d14p
 983    5J 3D2415       481.8     0.     602.3 FIXEDHF     0.800  0       0.0  0
 984    5J 1E2415       227.0     0.     283.7 FIXEDHF     0.800  0       0.0  0
 985    5J 3E2415       246.9     0.     308.6 FIXEDHF     0.800  0       0.0  0
 986    5U 1D2416      2739.2     0.    3424.0 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d4f
 987    5U 3D2416      1661.6     0.    2077.0 FIXEDHF     0.800  0       0.0  0
 988    5U 1E2416       516.6     0.     645.7 FIXEDHF     0.800  0       0.0  0
 989    5U 3E2416       617.5     0.     771.9 FIXEDHF     0.800  0       0.0  0
 990    5V 1D2416      2970.3     0.    3712.9 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d5f
 991    5V 3D2416      1339.0     0.    1673.8 FIXEDHF     0.800  0       0.0  0
 992    5V 1E2416       259.1     0.     323.9 FIXEDHF     0.800  0       0.0  0
 993    5V 3E2416       370.1     0.     462.6 FIXEDHF     0.800  0       0.0  0
 994    5W 1D2416      2920.9     0.    3651.1 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d6f
 995    5W 3D2416      1013.3     0.    1266.6 FIXEDHF     0.800  0       0.0  0
 996    5W 1E2416       136.2     0.     170.3 FIXEDHF     0.800  0       0.0  0
 997    5W 3E2416       231.3     0.     289.1 FIXEDHF     0.800  0       0.0  0
 998    5X 1D2416      4013.8     0.    5017.3 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d7f
 999    5X 3D2416       788.3     0.     985.4 FIXEDHF     0.800  0       0.0  0
1000    5X 1E2416        78.4     0.      98.0 FIXEDHF     0.800  0       0.0  0
1001    5X 3E2416       157.4     0.     196.7 FIXEDHF     0.800  0       0.0  0
1002    5Y 1D2416      2754.3     0.    3442.9 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d8f
1003    5Y 3D2416       615.7     0.     769.6 FIXEDHF     0.800  0       0.0  0
1004    5Y 1E2416        48.6     0.      60.7 FIXEDHF     0.800  0       0.0  0
1005    5Y 3E2416       114.6     0.     143.2 FIXEDHF     0.800  0       0.0  0
1006    5Z 1D2416      2081.6     0.    2602.0 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d9f
1007    5Z 3D2416       496.0     0.     620.0 FIXEDHF     0.800  0       0.0  0
1008    5Z 1E2416        31.8     0.      39.8 FIXEDHF     0.800  0       0.0  0
1009    5Z 3E2416        87.8     0.     109.8 FIXEDHF     0.800  0       0.0  0
1010    5a 1D2416      1654.1     0.    2067.6 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d10f
1011    5a 3D2416       410.4     0.     513.0 FIXEDHF     0.800  0       0.0  0
1012    5a 1E2416        21.8     0.      27.3 FIXEDHF     0.800  0       0.0  0
1013    5a 3E2416        70.0     0.      87.5 FIXEDHF     0.800  0       0.0  0
1014    5b 1D2416      1359.9     0.    1699.9 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d11f
1015    5b 3D2416       347.0     0.     433.7 FIXEDHF     0.800  0       0.0  0
1016    5b 1E2416        15.6     0.      19.5 FIXEDHF     0.800  0       0.0  0
1017    5b 3E2416        57.4     0.      71.8 FIXEDHF     0.800  0       0.0  0
1018    5c 1D2416      1146.6     0.    1433.2 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d12f
1019    5c 3D2416       298.6     0.     373.2 FIXEDHF     0.800  0       0.0  0
1020    5c 1E2416        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0
1021    5c 3E2416        48.3     0.      60.4 FIXEDHF     0.800  0       0.0  0
1022    5d 1D2416       985.4     0.    1231.8 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d13f
1023    5d 3D2416       260.6     0.     325.8 FIXEDHF     0.800  0       0.0  0
1024    5d 1E2416         8.6     0.      10.8 FIXEDHF     0.800  0       0.0  0
1025    5d 3E2416        41.4     0.      51.7 FIXEDHF     0.800  0       0.0  0
1026    5o 3D2417         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d6h
1027    5o 3E2417        34.2     0.      42.8 FIXEDHF     0.800  0       0.0  0
1028    5p 3D2417         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d7h
1029    5p 3E2417        38.7     0.      48.4 FIXEDHF     0.800  0       0.0  0
1030    5q 3D2417        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d8h
1031    5q 3E2417        37.8     0.      47.2 FIXEDHF     0.800  0       0.0  0
1032    5r 3D2417        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0  p5d2 7d   -3d9h
1033    5r 3E2417        35.1     0.      43.9 FIXEDHF     0.800  0       0.0  0
1034    67 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -p5d2 9d
1035    67 2D1414      1408.6     0.    1760.7 FIXEDHF     0.800  0       0.0  0
1036    67 1E1414       356.0     0.     445.0 FIXEDHF     0.800  0       0.0  0
1037    67 3E1414       388.9     0.     486.1 FIXEDHF     0.800  0       0.0  0
1038    67 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
1039    67 2D2424      1475.0     0.    1843.8 FIXEDHF     0.800  0       0.0  0
1040    67 4D2424       729.0     0.     911.2 FIXEDHF     0.800  0       0.0  0
1041    67 0E2424       449.4     0.     561.8 FIXEDHF     0.800  0       0.0  0
1042    67 2E2424       601.5     0.     751.9 FIXEDHF     0.800  0       0.0  0
1043    67 4E2424       486.3     0.     607.9 FIXEDHF     0.800  0       0.0  0
1044    68 2D1413      5140.8     0.    6426.0 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -p5d2 4s
1045    68 1E1413      1902.5     0.    2378.1 FIXEDHF     0.800  0       0.0  0
1046    68 2D2423      5187.7     0.    6484.6 FIXEDHF     0.800  0       0.0  0
1047    68 2E2423      2517.7     0.    3147.1 FIXEDHF     0.800  0       0.0  0
1048    69 1D2415      5928.6     0.    7410.7 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d4p
1049    69 3D2415      3458.6     0.    4323.2 FIXEDHF     0.800  0       0.0  0
1050    69 1E2415      1927.0     0.    2408.8 FIXEDHF     0.800  0       0.0  0
1051    69 3E2415      1974.8     0.    2468.5 FIXEDHF     0.800  0       0.0  0
1052    6A 1D2415      5442.2     0.    6802.7 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d5p
1053    6A 3D2415      2456.3     0.    3070.4 FIXEDHF     0.800  0       0.0  0
1054    6A 1E2415      1150.6     0.    1438.3 FIXEDHF     0.800  0       0.0  0
1055    6A 3E2415      1224.5     0.    1530.6 FIXEDHF     0.800  0       0.0  0
1056    6B 1D2415      4622.2     0.    5777.8 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d6p
1057    6B 3D2415      1766.3     0.    2207.9 FIXEDHF     0.800  0       0.0  0
1058    6B 1E2415       791.3     0.     989.1 FIXEDHF     0.800  0       0.0  0
1059    6B 3E2415       852.9     0.    1066.1 FIXEDHF     0.800  0       0.0  0
1060    6C 1D2415      3942.0     0.    4927.5 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d7p
1061    6C 3D2415      1329.7     0.    1662.1 FIXEDHF     0.800  0       0.0  0
1062    6C 1E2415       590.2     0.     737.7 FIXEDHF     0.800  0       0.0  0
1063    6C 3E2415       639.9     0.     799.9 FIXEDHF     0.800  0       0.0  0
1064    6D 1D2415      3507.8     0.    4384.7 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d8p
1065    6D 3D2415      1040.8     0.    1301.0 FIXEDHF     0.800  0       0.0  0
1066    6D 1E2415       463.3     0.     579.1 FIXEDHF     0.800  0       0.0  0
1067    6D 3E2415       503.9     0.     629.9 FIXEDHF     0.800  0       0.0  0
1068    6E 1D2415      1995.5     0.    2494.4 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d9p
1069    6E 3D2415       836.8     0.    1046.0 FIXEDHF     0.800  0       0.0  0
1070    6E 1E2415       376.7     0.     470.9 FIXEDHF     0.800  0       0.0  0
1071    6E 3E2415       410.6     0.     513.3 FIXEDHF     0.800  0       0.0  0
1072    6F 1D2415      1552.6     0.    1940.8 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d10p
1073    6F 3D2415       693.9     0.     867.4 FIXEDHF     0.800  0       0.0  0
1074    6F 1E2415       314.4     0.     393.0 FIXEDHF     0.800  0       0.0  0
1075    6F 3E2415       343.2     0.     429.0 FIXEDHF     0.800  0       0.0  0
1076    6G 1D2415      1270.7     0.    1588.4 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d11p
1077    6G 3D2415       588.3     0.     735.4 FIXEDHF     0.800  0       0.0  0
1078    6G 1E2415       267.8     0.     334.7 FIXEDHF     0.800  0       0.0  0
1079    6G 3E2415       292.5     0.     365.6 FIXEDHF     0.800  0       0.0  0
1080    6H 1D2415      1071.6     0.    1339.5 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d12p
1081    6H 3D2415       507.4     0.     634.3 FIXEDHF     0.800  0       0.0  0
1082    6H 1E2415       231.7     0.     289.6 FIXEDHF     0.800  0       0.0  0
1083    6H 3E2415       253.3     0.     316.6 FIXEDHF     0.800  0       0.0  0
1084    6I 1D2415       922.6     0.    1153.2 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d13p
1085    6I 3D2415       443.8     0.     554.7 FIXEDHF     0.800  0       0.0  0
1086    6I 1E2415       203.1     0.     253.9 FIXEDHF     0.800  0       0.0  0
1087    6I 3E2415       222.2     0.     277.7 FIXEDHF     0.800  0       0.0  0
1088    6J 1D2415       806.7     0.    1008.4 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d14p
1089    6J 3D2415       392.5     0.     490.6 FIXEDHF     0.800  0       0.0  0
1090    6J 1E2415       179.9     0.     224.9 FIXEDHF     0.800  0       0.0  0
1091    6J 3E2415       197.0     0.     246.2 FIXEDHF     0.800  0       0.0  0
1092    6U 1D2416      2090.4     0.    2613.0 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d4f
1093    6U 3D2416      1308.4     0.    1635.5 FIXEDHF     0.800  0       0.0  0
1094    6U 1E2416       468.4     0.     585.5 FIXEDHF     0.800  0       0.0  0
1095    6U 3E2416       528.3     0.     660.4 FIXEDHF     0.800  0       0.0  0
1096    6V 1D2416      2221.9     0.    2777.4 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d5f
1097    6V 3D2416      1062.5     0.    1328.1 FIXEDHF     0.800  0       0.0  0
1098    6V 1E2416       254.4     0.     318.0 FIXEDHF     0.800  0       0.0  0
1099    6V 3E2416       327.4     0.     409.2 FIXEDHF     0.800  0       0.0  0
1100    6W 1D2416      2100.5     0.    2625.6 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d6f
1101    6W 3D2416       808.5     0.    1010.6 FIXEDHF     0.800  0       0.0  0
1102    6W 1E2416       146.5     0.     183.1 FIXEDHF     0.800  0       0.0  0
1103    6W 3E2416       210.6     0.     263.3 FIXEDHF     0.800  0       0.0  0
1104    6X 1D2416      2000.1     0.    2500.1 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d7f
1105    6X 3D2416       629.4     0.     786.8 FIXEDHF     0.800  0       0.0  0
1106    6X 1E2416        92.9     0.     116.1 FIXEDHF     0.800  0       0.0  0
1107    6X 3E2416       146.7     0.     183.4 FIXEDHF     0.800  0       0.0  0
1108    6Y 1D2416      2603.4     0.    3254.3 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d8f
1109    6Y 3D2416       505.9     0.     632.4 FIXEDHF     0.800  0       0.0  0
1110    6Y 1E2416        63.8     0.      79.7 FIXEDHF     0.800  0       0.0  0
1111    6Y 3E2416       109.0     0.     136.3 FIXEDHF     0.800  0       0.0  0
1112    6Z 1D2416      1912.7     0.    2390.9 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d9f
1113    6Z 3D2416       411.8     0.     514.8 FIXEDHF     0.800  0       0.0  0
1114    6Z 1E2416        46.4     0.      58.0 FIXEDHF     0.800  0       0.0  0
1115    6Z 3E2416        85.0     0.     106.2 FIXEDHF     0.800  0       0.0  0
1116    6a 1D2416      1513.2     0.    1891.5 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d10f
1117    6a 3D2416       343.0     0.     428.8 FIXEDHF     0.800  0       0.0  0
1118    6a 1E2416        35.4     0.      44.2 FIXEDHF     0.800  0       0.0  0
1119    6a 3E2416        68.6     0.      85.8 FIXEDHF     0.800  0       0.0  0
1120    6b 1D2416      1243.0     0.    1553.8 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d11f
1121    6b 3D2416       291.4     0.     364.2 FIXEDHF     0.800  0       0.0  0
1122    6b 1E2416        28.0     0.      35.0 FIXEDHF     0.800  0       0.0  0
1123    6b 3E2416        57.0     0.      71.2 FIXEDHF     0.800  0       0.0  0
1124    6c 1D2416      1048.1     0.    1310.1 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d12f
1125    6c 3D2416       251.6     0.     314.5 FIXEDHF     0.800  0       0.0  0
1126    6c 1E2416        22.8     0.      28.5 FIXEDHF     0.800  0       0.0  0
1127    6c 3E2416        48.3     0.      60.4 FIXEDHF     0.800  0       0.0  0
1128    6d 1D2416       901.1     0.    1126.4 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d13f
1129    6d 3D2416       220.2     0.     275.2 FIXEDHF     0.800  0       0.0  0
1130    6d 1E2416        19.0     0.      23.7 FIXEDHF     0.800  0       0.0  0
1131    6d 3E2416        41.7     0.      52.1 FIXEDHF     0.800  0       0.0  0
1132    6o 3D2417         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d6h
1133    6o 3E2417        27.3     0.      34.1 FIXEDHF     0.800  0       0.0  0
1134    6p 3D2417         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d7h
1135    6p 3E2417        30.9     0.      38.6 FIXEDHF     0.800  0       0.0  0
1136    6q 3D2417         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d8h
1137    6q 3E2417        30.1     0.      37.6 FIXEDHF     0.800  0       0.0  0
1138    6r 3D2417         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  p5d2 8d   -3d9h
1139    6r 3E2417        28.0     0.      35.0 FIXEDHF     0.800  0       0.0  0
1140    78 2D1413      4140.4     0.    5175.5 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -p5d2 4s
1141    78 1E1413      1547.1     0.    1933.9 FIXEDHF     0.800  0       0.0  0
1142    78 2D2423      4177.6     0.    5222.0 FIXEDHF     0.800  0       0.0  0
1143    78 2E2423      2053.2     0.    2566.5 FIXEDHF     0.800  0       0.0  0
1144    79 1D2415      4710.6     0.    5888.3 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d4p
1145    79 3D2415      2791.8     0.    3489.8 FIXEDHF     0.800  0       0.0  0
1146    79 1E2415      1565.0     0.    1956.2 FIXEDHF     0.800  0       0.0  0
1147    79 3E2415      1608.2     0.    2010.3 FIXEDHF     0.800  0       0.0  0
1148    7A 1D2415      4318.2     0.    5397.7 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d5p
1149    7A 3D2415      1999.1     0.    2498.9 FIXEDHF     0.800  0       0.0  0
1150    7A 1E2415       938.5     0.    1173.1 FIXEDHF     0.800  0       0.0  0
1151    7A 3E2415      1002.1     0.    1252.6 FIXEDHF     0.800  0       0.0  0
1152    7B 1D2415      3649.0     0.    4561.2 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d6p
1153    7B 3D2415      1446.0     0.    1807.5 FIXEDHF     0.800  0       0.0  0
1154    7B 1E2415       646.5     0.     808.1 FIXEDHF     0.800  0       0.0  0
1155    7B 3E2415       699.3     0.     874.1 FIXEDHF     0.800  0       0.0  0
1156    7C 1D2415      3080.3     0.    3850.4 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d7p
1157    7C 3D2415      1093.9     0.    1367.4 FIXEDHF     0.800  0       0.0  0
1158    7C 1E2415       482.6     0.     603.3 FIXEDHF     0.800  0       0.0  0
1159    7C 3E2415       525.2     0.     656.5 FIXEDHF     0.800  0       0.0  0
1160    7D 1D2415      2644.4     0.    3305.5 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d8p
1161    7D 3D2415       860.3     0.    1075.4 FIXEDHF     0.800  0       0.0  0
1162    7D 1E2415       379.0     0.     473.8 FIXEDHF     0.800  0       0.0  0
1163    7D 3E2415       413.8     0.     517.3 FIXEDHF     0.800  0       0.0  0
1164    7E 1D2415      2363.8     0.    2954.8 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d9p
1165    7E 3D2415       697.5     0.     871.9 FIXEDHF     0.800  0       0.0  0
1166    7E 1E2415       308.3     0.     385.4 FIXEDHF     0.800  0       0.0  0
1167    7E 3E2415       337.3     0.     421.6 FIXEDHF     0.800  0       0.0  0
1168    7F 1D2415      1437.7     0.    1797.1 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d10p
1169    7F 3D2415       578.1     0.     722.6 FIXEDHF     0.800  0       0.0  0
1170    7F 1E2415       257.4     0.     321.7 FIXEDHF     0.800  0       0.0  0
1171    7F 3E2415       282.0     0.     352.5 FIXEDHF     0.800  0       0.0  0
1172    7G 1D2415      1149.5     0.    1436.9 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d11p
1173    7G 3D2415       490.2     0.     612.7 FIXEDHF     0.800  0       0.0  0
1174    7G 1E2415       219.2     0.     274.0 FIXEDHF     0.800  0       0.0  0
1175    7G 3E2415       240.4     0.     300.5 FIXEDHF     0.800  0       0.0  0
1176    7H 1D2415       959.1     0.    1198.9 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d12p
1177    7H 3D2415       422.8     0.     528.5 FIXEDHF     0.800  0       0.0  0
1178    7H 1E2415       189.7     0.     237.1 FIXEDHF     0.800  0       0.0  0
1179    7H 3E2415       208.2     0.     260.2 FIXEDHF     0.800  0       0.0  0
1180    7I 1D2415       820.8     0.    1026.0 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d13p
1181    7I 3D2415       369.8     0.     462.3 FIXEDHF     0.800  0       0.0  0
1182    7I 1E2415       166.3     0.     207.9 FIXEDHF     0.800  0       0.0  0
1183    7I 3E2415       182.6     0.     228.3 FIXEDHF     0.800  0       0.0  0
1184    7J 1D2415       715.0     0.     893.7 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d14p
1185    7J 3D2415       327.1     0.     408.9 FIXEDHF     0.800  0       0.0  0
1186    7J 1E2415       147.4     0.     184.2 FIXEDHF     0.800  0       0.0  0
1187    7J 3E2415       161.9     0.     202.4 FIXEDHF     0.800  0       0.0  0
1188    7U 1D2416      1673.1     0.    2091.4 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d4f
1189    7U 3D2416      1068.4     0.    1335.5 FIXEDHF     0.800  0       0.0  0
1190    7U 1E2416       417.1     0.     521.4 FIXEDHF     0.800  0       0.0  0
1191    7U 3E2416       454.6     0.     568.3 FIXEDHF     0.800  0       0.0  0
1192    7V 1D2416      1759.3     0.    2199.1 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d5f
1193    7V 3D2416       871.9     0.    1089.9 FIXEDHF     0.800  0       0.0  0
1194    7V 1E2416       236.2     0.     295.3 FIXEDHF     0.800  0       0.0  0
1195    7V 3E2416       287.3     0.     359.1 FIXEDHF     0.800  0       0.0  0
1196    7W 1D2416      1634.0     0.    2042.5 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d6f
1197    7W 3D2416       666.2     0.     832.7 FIXEDHF     0.800  0       0.0  0
1198    7W 1E2416       141.8     0.     177.3 FIXEDHF     0.800  0       0.0  0
1199    7W 3E2416       187.8     0.     234.8 FIXEDHF     0.800  0       0.0  0
1200    7X 1D2416      1504.4     0.    1880.5 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d7f
1201    7X 3D2416       520.1     0.     650.1 FIXEDHF     0.800  0       0.0  0
1202    7X 1E2416        93.6     0.     117.0 FIXEDHF     0.800  0       0.0  0
1203    7X 3E2416       132.6     0.     165.8 FIXEDHF     0.800  0       0.0  0
1204    7Y 1D2416      1420.7     0.    1775.9 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d8f
1205    7Y 3D2416       418.1     0.     522.6 FIXEDHF     0.800  0       0.0  0
1206    7Y 1E2416        66.6     0.      83.2 FIXEDHF     0.800  0       0.0  0
1207    7Y 3E2416        99.6     0.     124.5 FIXEDHF     0.800  0       0.0  0
1208    7Z 1D2416      1783.0     0.    2228.7 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d9f
1209    7Z 3D2416       345.3     0.     431.6 FIXEDHF     0.800  0       0.0  0
1210    7Z 1E2416        50.0     0.      62.5 FIXEDHF     0.800  0       0.0  0
1211    7Z 3E2416        78.2     0.      97.8 FIXEDHF     0.800  0       0.0  0
1212    7a 1D2416      1373.8     0.    1717.2 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d10f
1213    7a 3D2416       289.2     0.     361.5 FIXEDHF     0.800  0       0.0  0
1214    7a 1E2416        39.3     0.      49.1 FIXEDHF     0.800  0       0.0  0
1215    7a 3E2416        63.6     0.      79.5 FIXEDHF     0.800  0       0.0  0
1216    7b 1D2416      1122.7     0.    1403.4 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d11f
1217    7b 3D2416       246.5     0.     308.1 FIXEDHF     0.800  0       0.0  0
1218    7b 1E2416        31.8     0.      39.8 FIXEDHF     0.800  0       0.0  0
1219    7b 3E2416        53.1     0.      66.4 FIXEDHF     0.800  0       0.0  0
1220    7c 1D2416       945.0     0.    1181.2 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d12f
1221    7c 3D2416       213.4     0.     266.7 FIXEDHF     0.800  0       0.0  0
1222    7c 1E2416        26.5     0.      33.1 FIXEDHF     0.800  0       0.0  0
1223    7c 3E2416        45.2     0.      56.5 FIXEDHF     0.800  0       0.0  0
1224    7d 1D2416       811.8     0.    1014.8 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d13f
1225    7d 3D2416       187.0     0.     233.8 FIXEDHF     0.800  0       0.0  0
1226    7d 1E2416        22.5     0.      28.1 FIXEDHF     0.800  0       0.0  0
1227    7d 3E2416        39.2     0.      49.0 FIXEDHF     0.800  0       0.0  0
1228    7o 3D2417         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d6h
1229    7o 3E2417        22.4     0.      28.0 FIXEDHF     0.800  0       0.0  0
1230    7p 3D2417         5.4     0.       6.7 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d7h
1231    7p 3E2417        25.4     0.      31.7 FIXEDHF     0.800  0       0.0  0
1232    7q 3D2417         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d8h
1233    7q 3E2417        24.8     0.      31.0 FIXEDHF     0.800  0       0.0  0
1234    7r 3D2417         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  p5d2 9d   -3d9h
1235    7r 3E2417        23.0     0.      28.8 FIXEDHF     0.800  0       0.0  0
1236    89 1D2315     48310.9     0.   60388.6 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d4p
1237    89 1E2315      9622.8     0.   12028.5 FIXEDHF     0.800  0       0.0  0
1238    8A 1D2315     18931.0     0.   23663.8 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d5p
1239    8A 1E2315      5430.6     0.    6788.3 FIXEDHF     0.800  0       0.0  0
1240    8B 1D2315     11427.3     0.   14284.1 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d6p
1241    8B 1E2315      3652.6     0.    4565.8 FIXEDHF     0.800  0       0.0  0
1242    8C 1D2315      8004.2     0.   10005.2 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d7p
1243    8C 1E2315      2693.4     0.    3366.7 FIXEDHF     0.800  0       0.0  0
1244    8D 1D2315      6061.3     0.    7576.6 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d8p
1245    8D 1E2315      2099.9     0.    2624.9 FIXEDHF     0.800  0       0.0  0
1246    8E 1D2315      2409.3     0.    6023.2 FIXEDHF     0.400  0       0.0  0  p5d2 4s   -3d9p
1247    8E 1E2315       850.1     0.    2125.3 FIXEDHF     0.400  0       0.0  0
1248    8F 1D2315      3960.9     0.    4951.1 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d10p
1249    8F 1E2315      1415.0     0.    1768.7 FIXEDHF     0.800  0       0.0  0
1250    8G 1D2315      3336.7     0.    4170.9 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d11p
1251    8G 1E2315      1202.4     0.    1503.0 FIXEDHF     0.800  0       0.0  0
1252    8H 1D2315      2864.2     0.    3580.3 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d12p
1253    8H 1E2315      1038.8     0.    1298.5 FIXEDHF     0.800  0       0.0  0
1254    8I 1D2315      2495.8     0.    3119.8 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d13p
1255    8I 1E2315       909.5     0.    1136.9 FIXEDHF     0.800  0       0.0  0
1256    8J 1D2315      2201.4     0.    2751.7 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d14p
1257    8J 1E2315       805.2     0.    1006.5 FIXEDHF     0.800  0       0.0  0
1258    8K 1D2215     14420.2     0.   18025.3 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s4p
1259    8K 3D2215     12912.2     0.   16140.3 FIXEDHF     0.800  0       0.0  0
1260    8L 1D2215      7049.4     0.    8811.8 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s5p
1261    8L 3D2215      6076.2     0.    7595.2 FIXEDHF     0.800  0       0.0  0
1262    8M 1D2215      4516.7     0.    5645.9 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s6p
1263    8M 3D2215      3817.7     0.    4772.1 FIXEDHF     0.800  0       0.0  0
1264    8N 1D2215      3234.2     0.    4042.8 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s7p
1265    8N 3D2215      2701.9     0.    3377.4 FIXEDHF     0.800  0       0.0  0
1266    8O 1D2215      2474.3     0.    3092.9 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s8p
1267    8O 3D2215      2051.5     0.    2564.4 FIXEDHF     0.800  0       0.0  0
1268    8P 1D2215      1977.8     0.    2472.3 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s9p
1269    8P 3D2215      1631.6     0.    2039.5 FIXEDHF     0.800  0       0.0  0
1270    8Q 1D2215      1631.2     0.    2039.0 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s10p
1271    8Q 3D2215      1340.8     0.    1676.0 FIXEDHF     0.800  0       0.0  0
1272    8R 1D2215      1377.0     0.    1721.3 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s11p
1273    8R 3D2215      1128.9     0.    1411.1 FIXEDHF     0.800  0       0.0  0
1274    8S 1D2215      1183.7     0.    1479.6 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s12p
1275    8S 3D2215       968.5     0.    1210.6 FIXEDHF     0.800  0       0.0  0
1276    8T 1D2215      1032.4     0.    1290.5 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s13p
1277    8T 3D2215       843.4     0.    1054.3 FIXEDHF     0.800  0       0.0  0
1278    8U 3D2316      8580.5     0.   10725.6 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d4f
1279    8U 1E2316       466.5     0.     583.1 FIXEDHF     0.800  0       0.0  0
1280    8V 3D2316      4625.0     0.    5781.3 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d5f
1281    8V 1E2316      -313.7     0.    -392.1 FIXEDHF     0.800  0       0.0  0
1282    8W 3D2316      2745.4     0.    3431.8 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d6f
1283    8W 1E2316      -516.2     0.    -645.2 FIXEDHF     0.800  0       0.0  0
1284    8X 3D2316      1813.3     0.    2266.6 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d7f
1285    8X 1E2316      -535.2     0.    -669.0 FIXEDHF     0.800  0       0.0  0
1286    8Y 3D2316      1296.2     0.    1620.3 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d8f
1287    8Y 1E2316      -501.6     0.    -627.0 FIXEDHF     0.800  0       0.0  0
1288    8Z 3D2316       981.3     0.    1226.6 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d9f
1289    8Z 1E2316      -455.5     0.    -569.4 FIXEDHF     0.800  0       0.0  0
1290    8a 3D2316       775.0     0.     968.8 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d10f
1291    8a 1E2316      -409.8     0.    -512.3 FIXEDHF     0.800  0       0.0  0
1292    8b 3D2316       632.2     0.     790.2 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d11f
1293    8b 1E2316      -368.2     0.    -460.3 FIXEDHF     0.800  0       0.0  0
1294    8c 3D2316       528.7     0.     660.9 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d12f
1295    8c 1E2316      -331.8     0.    -414.7 FIXEDHF     0.800  0       0.0  0
1296    8d 3D2316       451.0     0.     563.8 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -3d13f
1297    8d 1E2316      -300.0     0.    -375.0 FIXEDHF     0.800  0       0.0  0
1298    8e 1D2216    -38535.9     0.  -48169.9 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s4f
1299    8e 3D2216    -21313.6     0.  -26642.0 FIXEDHF     0.800  0       0.0  0
1300    8f 1D2216    -28029.9     0.  -35037.4 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s5f
1301    8f 3D2216    -16110.9     0.  -20138.6 FIXEDHF     0.800  0       0.0  0
1302    8g 1D2216    -21387.7     0.  -26734.6 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s6f
1303    8g 3D2216    -12509.0     0.  -15636.3 FIXEDHF     0.800  0       0.0  0
1304    8h 1D2216    -16942.6     0.  -21178.2 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s7f
1305    8h 3D2216    -10003.0     0.  -12503.8 FIXEDHF     0.800  0       0.0  0
1306    8i 1D2216    -13815.5     0.  -17269.4 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s8f
1307    8i 3D2216     -8203.4     0.  -10254.3 FIXEDHF     0.800  0       0.0  0
1308    8j 1D2216    -11529.6     0.  -14412.0 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s9f
1309    8j 3D2216     -6871.8     0.   -8589.7 FIXEDHF     0.800  0       0.0  0
1310    8k 1D2216     -9804.7     0.  -12255.9 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s10f
1311    8k 3D2216     -5859.0     0.   -7323.7 FIXEDHF     0.800  0       0.0  0
1312    8l 1D2216     -8468.2     0.  -10585.2 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s11f
1313    8l 3D2216     -5069.8     0.   -6337.2 FIXEDHF     0.800  0       0.0  0
1314    8m 1D2216     -7408.7     0.   -9260.9 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s12f
1315    8m 3D2216     -4441.8     0.   -5552.2 FIXEDHF     0.800  0       0.0  0
1316    8n 1D2216     -6552.7     0.   -8190.9 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s13f
1317    8n 3D2216     -3932.7     0.   -4915.9 FIXEDHF     0.800  0       0.0  0
1318    8s 3D2217      -301.5     0.    -376.9 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s6h
1319    8t 3D2217      -353.4     0.    -441.7 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s7h
1320    8u 3D2217      -351.8     0.    -439.7 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s8h
1321    8v 3D2217      -331.5     0.    -414.4 FIXEDHF     0.800  0       0.0  0  p5d2 4s   -4s9h
1322    9A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d5p
1323    9A 2D2525     12572.6     0.   15715.7 FIXEDHF     0.800  0       0.0  0
1324    9A 1E2525      5457.8     0.    6822.2 FIXEDHF     0.800  0       0.0  0
1325    9A 3E2525      5450.6     0.    6813.2 FIXEDHF     0.800  0       0.0  0
1326    9B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d6p
1327    9B 2D2525      7857.0     0.    9821.3 FIXEDHF     0.800  0       0.0  0
1328    9B 1E2525      3649.8     0.    4562.2 FIXEDHF     0.800  0       0.0  0
1329    9B 3E2525      3671.0     0.    4588.8 FIXEDHF     0.800  0       0.0  0
1330    9C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d7p
1331    9C 2D2525      5593.3     0.    6991.6 FIXEDHF     0.800  0       0.0  0
1332    9C 1E2525      2683.5     0.    3354.4 FIXEDHF     0.800  0       0.0  0
1333    9C 3E2525      2706.9     0.    3383.6 FIXEDHF     0.800  0       0.0  0
1334    9D 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d8p
1335    9D 2D2525      4274.3     0.    5342.9 FIXEDHF     0.800  0       0.0  0
1336    9D 1E2525      2088.8     0.    2611.0 FIXEDHF     0.800  0       0.0  0
1337    9D 3E2525      2110.0     0.    2637.5 FIXEDHF     0.800  0       0.0  0
1338    9E 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d9p
1339    9E 2D2525      3417.4     0.    4271.8 FIXEDHF     0.800  0       0.0  0
1340    9E 1E2525      1689.5     0.    2111.9 FIXEDHF     0.800  0       0.0  0
1341    9E 3E2525      1708.0     0.    2135.0 FIXEDHF     0.800  0       0.0  0
1342    9F 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d10p
1343    9F 2D2525      2819.8     0.    3524.8 FIXEDHF     0.800  0       0.0  0
1344    9F 1E2525      1405.0     0.    1756.3 FIXEDHF     0.800  0       0.0  0
1345    9F 3E2525      1421.1     0.    1776.4 FIXEDHF     0.800  0       0.0  0
1346    9G 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d11p
1347    9G 2D2525      2381.8     0.    2977.3 FIXEDHF     0.800  0       0.0  0
1348    9G 1E2525      1193.4     0.    1491.7 FIXEDHF     0.800  0       0.0  0
1349    9G 3E2525      1207.4     0.    1509.3 FIXEDHF     0.800  0       0.0  0
1350    9H 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d12p
1351    9H 2D2525      2048.6     0.    2560.8 FIXEDHF     0.800  0       0.0  0
1352    9H 1E2525      1030.6     0.    1288.2 FIXEDHF     0.800  0       0.0  0
1353    9H 3E2525      1043.0     0.    1303.7 FIXEDHF     0.800  0       0.0  0
1354    9I 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d13p
1355    9I 2D2525      1787.8     0.    2234.7 FIXEDHF     0.800  0       0.0  0
1356    9I 1E2525       902.1     0.    1127.6 FIXEDHF     0.800  0       0.0  0
1357    9I 3E2525       913.0     0.    1141.3 FIXEDHF     0.800  0       0.0  0
1358    9J 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d14p
1359    9J 2D2525      1578.6     0.    1973.3 FIXEDHF     0.800  0       0.0  0
1360    9J 1E2525       798.5     0.     998.1 FIXEDHF     0.800  0       0.0  0
1361    9J 3E2525       808.3     0.    1010.4 FIXEDHF     0.800  0       0.0  0
1362    9K 2D2535    -10228.1     0.  -12785.1 FIXEDHF     0.800  0       0.0  0  3d4p      -4s4p
1363    9K 1E2535     -8249.4     0.  -10311.8 FIXEDHF     0.800  0       0.0  0
1364    9L 2D2535     -1267.5     0.   -1584.4 FIXEDHF     0.800  0       0.0  0  3d4p      -4s5p
1365    9L 1E2535     -3554.6     0.   -4443.3 FIXEDHF     0.800  0       0.0  0
1366    9M 2D2535      -157.5     0.    -196.9 FIXEDHF     0.800  0       0.0  0  3d4p      -4s6p
1367    9M 1E2535     -2162.1     0.   -2702.6 FIXEDHF     0.800  0       0.0  0
1368    9N 2D2535       115.1     0.     143.9 FIXEDHF     0.800  0       0.0  0  3d4p      -4s7p
1369    9N 1E2535     -1504.4     0.   -1880.5 FIXEDHF     0.800  0       0.0  0
1370    9O 2D2535       188.8     0.     236.0 FIXEDHF     0.800  0       0.0  0  3d4p      -4s8p
1371    9O 1E2535     -1131.0     0.   -1413.7 FIXEDHF     0.800  0       0.0  0
1372    9P 2D2535       202.2     0.     252.7 FIXEDHF     0.800  0       0.0  0  3d4p      -4s9p
1373    9P 1E2535      -893.8     0.   -1117.2 FIXEDHF     0.800  0       0.0  0
1374    9Q 2D2535       195.4     0.     244.2 FIXEDHF     0.800  0       0.0  0  3d4p      -4s10p
1375    9Q 1E2535      -731.3     0.    -914.1 FIXEDHF     0.800  0       0.0  0
1376    9R 2D2535       182.1     0.     227.6 FIXEDHF     0.800  0       0.0  0  3d4p      -4s11p
1377    9R 1E2535      -613.8     0.    -767.3 FIXEDHF     0.800  0       0.0  0
1378    9S 2D2535       167.4     0.     209.3 FIXEDHF     0.800  0       0.0  0  3d4p      -4s12p
1379    9S 1E2535      -525.4     0.    -656.8 FIXEDHF     0.800  0       0.0  0
1380    9T 2D2535       153.2     0.     191.5 FIXEDHF     0.800  0       0.0  0  3d4p      -4s13p
1381    9T 1E2535      -456.8     0.    -571.0 FIXEDHF     0.800  0       0.0  0
1382    9U 2D2526     13022.6     0.   16278.2 FIXEDHF     0.800  0       0.0  0  3d4p      -3d4f
1383    9U 4D2526      4441.8     0.    5552.2 FIXEDHF     0.800  0       0.0  0
1384    9U 1E2526        11.2     0.      14.0 FIXEDHF     0.800  0       0.0  0
1385    9U 3E2526       873.0     0.    1091.3 FIXEDHF     0.800  0       0.0  0
1386    9V 2D2526      5694.6     0.    7118.3 FIXEDHF     0.800  0       0.0  0  3d4p      -3d5f
1387    9V 4D2526      2114.7     0.    2643.4 FIXEDHF     0.800  0       0.0  0
1388    9V 1E2526      -713.3     0.    -891.6 FIXEDHF     0.800  0       0.0  0
1389    9V 3E2526        74.1     0.      92.6 FIXEDHF     0.800  0       0.0  0
1390    9W 2D2526      2887.4     0.    3609.2 FIXEDHF     0.800  0       0.0  0  3d4p      -3d6f
1391    9W 4D2526      1093.7     0.    1367.1 FIXEDHF     0.800  0       0.0  0
1392    9W 1E2526      -832.9     0.   -1041.1 FIXEDHF     0.800  0       0.0  0
1393    9W 3E2526      -198.5     0.    -248.1 FIXEDHF     0.800  0       0.0  0
1394    9X 2D2526      1666.3     0.    2082.9 FIXEDHF     0.800  0       0.0  0  3d4p      -3d7f
1395    9X 4D2526       627.3     0.     784.1 FIXEDHF     0.800  0       0.0  0
1396    9X 1E2526      -789.0     0.    -986.3 FIXEDHF     0.800  0       0.0  0
1397    9X 3E2526      -276.5     0.    -345.6 FIXEDHF     0.800  0       0.0  0
1398    9Y 2D2526      1057.0     0.    1321.3 FIXEDHF     0.800  0       0.0  0  3d4p      -3d8f
1399    9Y 4D2526       390.3     0.     487.9 FIXEDHF     0.800  0       0.0  0
1400    9Y 1E2526      -709.8     0.    -887.2 FIXEDHF     0.800  0       0.0  0
1401    9Y 3E2526      -287.6     0.    -359.5 FIXEDHF     0.800  0       0.0  0
1402    9Z 2D2526       719.2     0.     899.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d9f
1403    9Z 4D2526       258.4     0.     323.0 FIXEDHF     0.800  0       0.0  0
1404    9Z 1E2526      -629.9     0.    -787.4 FIXEDHF     0.800  0       0.0  0
1405    9Z 3E2526      -275.2     0.    -344.0 FIXEDHF     0.800  0       0.0  0
1406    9a 2D2526       516.4     0.     645.5 FIXEDHF     0.800  0       0.0  0  3d4p      -3d10f
1407    9a 4D2526       179.7     0.     224.6 FIXEDHF     0.800  0       0.0  0
1408    9a 1E2526      -558.5     0.    -698.1 FIXEDHF     0.800  0       0.0  0
1409    9a 3E2526      -255.4     0.    -319.3 FIXEDHF     0.800  0       0.0  0
1410    9b 2D2526       386.7     0.     483.4 FIXEDHF     0.800  0       0.0  0  3d4p      -3d11f
1411    9b 4D2526       130.0     0.     162.5 FIXEDHF     0.800  0       0.0  0
1412    9b 1E2526      -497.0     0.    -621.2 FIXEDHF     0.800  0       0.0  0
1413    9b 3E2526      -234.3     0.    -292.9 FIXEDHF     0.800  0       0.0  0
1414    9c 2D2526       299.8     0.     374.7 FIXEDHF     0.800  0       0.0  0  3d4p      -3d12f
1415    9c 4D2526        97.1     0.     121.4 FIXEDHF     0.800  0       0.0  0
1416    9c 1E2526      -444.6     0.    -555.7 FIXEDHF     0.800  0       0.0  0
1417    9c 3E2526      -214.1     0.    -267.6 FIXEDHF     0.800  0       0.0  0
1418    9d 2D2526       239.0     0.     298.7 FIXEDHF     0.800  0       0.0  0  3d4p      -3d13f
1419    9d 4D2526        74.6     0.      93.2 FIXEDHF     0.800  0       0.0  0
1420    9d 1E2526      -399.9     0.    -499.9 FIXEDHF     0.800  0       0.0  0
1421    9d 3E2526      -195.7     0.    -244.6 FIXEDHF     0.800  0       0.0  0
1422    9e 2D2536    -12553.4     0.  -15691.8 FIXEDHF     0.800  0       0.0  0  3d4p      -4s4f
1423    9e 1E2536    -25751.5     0.  -32189.4 FIXEDHF     0.800  0       0.0  0
1424    9f 2D2536     -5195.4     0.   -6494.3 FIXEDHF     0.800  0       0.0  0  3d4p      -4s5f
1425    9f 1E2536    -16691.0     0.  -20863.7 FIXEDHF     0.800  0       0.0  0
1426    9g 2D2536     -2871.3     0.   -3589.1 FIXEDHF     0.800  0       0.0  0  3d4p      -4s6f
1427    9g 1E2536    -11993.0     0.  -14991.3 FIXEDHF     0.800  0       0.0  0
1428    9h 2D2536     -1857.8     0.   -2322.3 FIXEDHF     0.800  0       0.0  0  3d4p      -4s7f
1429    9h 1E2536     -9178.0     0.  -11472.5 FIXEDHF     0.800  0       0.0  0
1430    9i 2D2536     -1322.2     0.   -1652.8 FIXEDHF     0.800  0       0.0  0  3d4p      -4s8f
1431    9i 1E2536     -7323.0     0.   -9153.8 FIXEDHF     0.800  0       0.0  0
1432    9j 2D2536     -1002.6     0.   -1253.2 FIXEDHF     0.800  0       0.0  0  3d4p      -4s9f
1433    9j 1E2536     -6022.6     0.   -7528.3 FIXEDHF     0.800  0       0.0  0
1434    9k 2D2536      -794.9     0.    -993.6 FIXEDHF     0.800  0       0.0  0  3d4p      -4s10f
1435    9k 1E2536     -5069.1     0.   -6336.4 FIXEDHF     0.800  0       0.0  0
1436    9l 2D2536      -651.2     0.    -814.0 FIXEDHF     0.800  0       0.0  0  3d4p      -4s11f
1437    9l 1E2536     -4345.2     0.   -5431.5 FIXEDHF     0.800  0       0.0  0
1438    9m 2D2536      -547.0     0.    -683.8 FIXEDHF     0.800  0       0.0  0  3d4p      -4s12f
1439    9m 1E2536     -3779.9     0.   -4724.9 FIXEDHF     0.800  0       0.0  0
1440    9n 2D2536      -468.6     0.    -585.8 FIXEDHF     0.800  0       0.0  0  3d4p      -4s13f
1441    9n 1E2536     -3328.5     0.   -4160.6 FIXEDHF     0.800  0       0.0  0
1442    9o 4D2527       412.2     0.     515.3 FIXEDHF     0.800  0       0.0  0  3d4p      -3d6h
1443    9o 3E2527       135.0     0.     168.8 FIXEDHF     0.800  0       0.0  0
1444    9p 4D2527       447.6     0.     559.5 FIXEDHF     0.800  0       0.0  0  3d4p      -3d7h
1445    9p 3E2527       149.9     0.     187.4 FIXEDHF     0.800  0       0.0  0
1446    9q 4D2527       425.8     0.     532.2 FIXEDHF     0.800  0       0.0  0  3d4p      -3d8h
1447    9q 3E2527       144.6     0.     180.7 FIXEDHF     0.800  0       0.0  0
1448    9r 4D2527       389.6     0.     487.0 FIXEDHF     0.800  0       0.0  0  3d4p      -3d9h
1449    9r 3E2527       133.4     0.     166.8 FIXEDHF     0.800  0       0.0  0
1450    AB 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5p      -3d6p
1451    AB 2D2525      6316.0     0.    7895.0 FIXEDHF     0.800  0       0.0  0
1452    AB 1E2525      2160.9     0.    2701.1 FIXEDHF     0.800  0       0.0  0
1453    AB 3E2525      2249.5     0.    2811.9 FIXEDHF     0.800  0       0.0  0
1454    AC 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5p      -3d7p
1455    AC 2D2525      4467.8     0.    5584.8 FIXEDHF     0.800  0       0.0  0
1456    AC 1E2525      1602.6     0.    2003.3 FIXEDHF     0.800  0       0.0  0
1457    AC 3E2525      1675.9     0.    2094.9 FIXEDHF     0.800  0       0.0  0
1458    AD 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5p      -3d8p
1459    AD 2D2525      3407.6     0.    4259.5 FIXEDHF     0.800  0       0.0  0
1460    AD 1E2525      1253.8     0.    1567.2 FIXEDHF     0.800  0       0.0  0
1461    AD 3E2525      1314.3     0.    1642.9 FIXEDHF     0.800  0       0.0  0
1462    AE 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5p      -3d9p
1463    AE 2D2525      2722.2     0.    3402.8 FIXEDHF     0.800  0       0.0  0
1464    AE 1E2525      1017.4     0.    1271.7 FIXEDHF     0.800  0       0.0  0
1465    AE 3E2525      1068.0     0.    1335.0 FIXEDHF     0.800  0       0.0  0
1466    AF 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5p      -3d10p
1467    AF 2D2525      2245.4     0.    2806.7 FIXEDHF     0.800  0       0.0  0
1468    AF 1E2525       847.8     0.    1059.8 FIXEDHF     0.800  0       0.0  0
1469    AF 3E2525       891.0     0.    1113.7 FIXEDHF     0.800  0       0.0  0
1470    AG 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5p      -3d11p
1471    AG 2D2525      1896.2     0.    2370.2 FIXEDHF     0.800  0       0.0  0
1472    AG 1E2525       721.3     0.     901.6 FIXEDHF     0.800  0       0.0  0
1473    AG 3E2525       758.4     0.     948.0 FIXEDHF     0.800  0       0.0  0
1474    AH 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5p      -3d12p
1475    AH 2D2525      1630.6     0.    2038.3 FIXEDHF     0.800  0       0.0  0
1476    AH 1E2525       623.6     0.     779.5 FIXEDHF     0.800  0       0.0  0
1477    AH 3E2525       656.0     0.     820.0 FIXEDHF     0.800  0       0.0  0
1478    AI 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5p      -3d13p
1479    AI 2D2525      1422.8     0.    1778.5 FIXEDHF     0.800  0       0.0  0
1480    AI 1E2525       546.3     0.     682.9 FIXEDHF     0.800  0       0.0  0
1481    AI 3E2525       575.0     0.     718.7 FIXEDHF     0.800  0       0.0  0
1482    AJ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5p      -3d14p
1483    AJ 2D2525      1256.3     0.    1570.4 FIXEDHF     0.800  0       0.0  0
1484    AJ 1E2525       483.9     0.     604.9 FIXEDHF     0.800  0       0.0  0
1485    AJ 3E2525       509.4     0.     636.7 FIXEDHF     0.800  0       0.0  0
1486    AK 2D2535     -1957.1     0.   -2446.4 FIXEDHF     0.800  0       0.0  0  3d5p      -4s4p
1487    AK 1E2535      -842.6     0.   -1053.3 FIXEDHF     0.800  0       0.0  0
1488    AL 2D2535     -3736.5     0.   -4670.6 FIXEDHF     0.800  0       0.0  0  3d5p      -4s5p
1489    AL 1E2535      -703.1     0.    -878.9 FIXEDHF     0.800  0       0.0  0
1490    AM 2D2535     -1424.4     0.   -1780.5 FIXEDHF     0.800  0       0.0  0  3d5p      -4s6p
1491    AM 1E2535      -499.3     0.    -624.1 FIXEDHF     0.800  0       0.0  0
1492    AN 2D2535      -782.1     0.    -977.6 FIXEDHF     0.800  0       0.0  0  3d5p      -4s7p
1493    AN 1E2535      -370.8     0.    -463.5 FIXEDHF     0.800  0       0.0  0
1494    AO 2D2535      -500.8     0.    -626.0 FIXEDHF     0.800  0       0.0  0  3d5p      -4s8p
1495    AO 1E2535      -288.3     0.    -360.4 FIXEDHF     0.800  0       0.0  0
1496    AP 2D2535      -352.4     0.    -440.5 FIXEDHF     0.800  0       0.0  0  3d5p      -4s9p
1497    AP 1E2535      -232.5     0.    -290.6 FIXEDHF     0.800  0       0.0  0
1498    AQ 2D2535      -264.3     0.    -330.4 FIXEDHF     0.800  0       0.0  0  3d5p      -4s10p
1499    AQ 1E2535      -192.7     0.    -240.9 FIXEDHF     0.800  0       0.0  0
1500    AR 2D2535      -207.5     0.    -259.4 FIXEDHF     0.800  0       0.0  0  3d5p      -4s11p
1501    AR 1E2535      -163.2     0.    -204.0 FIXEDHF     0.800  0       0.0  0
1502    AS 2D2535      -168.6     0.    -210.7 FIXEDHF     0.800  0       0.0  0  3d5p      -4s12p
1503    AS 1E2535      -140.6     0.    -175.7 FIXEDHF     0.800  0       0.0  0
1504    AT 2D2535      -140.6     0.    -175.7 FIXEDHF     0.800  0       0.0  0  3d5p      -4s13p
1505    AT 1E2535      -122.8     0.    -153.5 FIXEDHF     0.800  0       0.0  0
1506    AU 2D2526      3432.1     0.    4290.1 FIXEDHF     0.800  0       0.0  0  3d5p      -3d4f
1507    AU 4D2526      2052.0     0.    2565.0 FIXEDHF     0.800  0       0.0  0
1508    AU 1E2526       261.0     0.     326.2 FIXEDHF     0.800  0       0.0  0
1509    AU 3E2526       809.0     0.    1011.3 FIXEDHF     0.800  0       0.0  0
1510    AV 2D2526      4781.0     0.    5976.2 FIXEDHF     0.800  0       0.0  0  3d5p      -3d5f
1511    AV 4D2526      1589.9     0.    1987.4 FIXEDHF     0.800  0       0.0  0
1512    AV 1E2526      -123.9     0.    -154.9 FIXEDHF     0.800  0       0.0  0
1513    AV 3E2526       361.8     0.     452.3 FIXEDHF     0.800  0       0.0  0
1514    AW 2D2526      3185.7     0.    3982.1 FIXEDHF     0.800  0       0.0  0  3d5p      -3d6f
1515    AW 4D2526      1068.6     0.    1335.8 FIXEDHF     0.800  0       0.0  0
1516    AW 1E2526      -233.3     0.    -291.6 FIXEDHF     0.800  0       0.0  0
1517    AW 3E2526       155.5     0.     194.4 FIXEDHF     0.800  0       0.0  0
1518    AX 2D2526      2231.4     0.    2789.2 FIXEDHF     0.800  0       0.0  0  3d5p      -3d7f
1519    AX 4D2526       757.0     0.     946.2 FIXEDHF     0.800  0       0.0  0
1520    AX 1E2526      -249.2     0.    -311.5 FIXEDHF     0.800  0       0.0  0
1521    AX 3E2526        64.2     0.      80.2 FIXEDHF     0.800  0       0.0  0
1522    AY 2D2526      1660.0     0.    2075.0 FIXEDHF     0.800  0       0.0  0  3d5p      -3d8f
1523    AY 4D2526       566.9     0.     708.6 FIXEDHF     0.800  0       0.0  0
1524    AY 1E2526      -236.7     0.    -295.9 FIXEDHF     0.800  0       0.0  0
1525    AY 3E2526        21.1     0.      26.4 FIXEDHF     0.800  0       0.0  0
1526    AZ 2D2526      1294.6     0.    1618.3 FIXEDHF     0.800  0       0.0  0  3d5p      -3d9f
1527    AZ 4D2526       443.8     0.     554.7 FIXEDHF     0.800  0       0.0  0
1528    AZ 1E2526      -216.6     0.    -270.8 FIXEDHF     0.800  0       0.0  0
1529    AZ 3E2526        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0
1530    Aa 2D2526      1046.5     0.    1308.1 FIXEDHF     0.800  0       0.0  0  3d5p      -3d10f
1531    Aa 4D2526       359.5     0.     449.4 FIXEDHF     0.800  0       0.0  0
1532    Aa 1E2526      -195.8     0.    -244.8 FIXEDHF     0.800  0       0.0  0
1533    Aa 3E2526       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0
1534    Ab 2D2526       869.4     0.    1086.8 FIXEDHF     0.800  0       0.0  0  3d5p      -3d11f
1535    Ab 4D2526       299.0     0.     373.8 FIXEDHF     0.800  0       0.0  0
1536    Ab 1E2526      -176.6     0.    -220.7 FIXEDHF     0.800  0       0.0  0
1537    Ab 3E2526       -16.3     0.     -20.4 FIXEDHF     0.800  0       0.0  0
1538    Ac 2D2526       738.1     0.     922.6 FIXEDHF     0.800  0       0.0  0  3d5p      -3d12f
1539    Ac 4D2526       254.0     0.     317.5 FIXEDHF     0.800  0       0.0  0
1540    Ac 1E2526      -159.4     0.    -199.3 FIXEDHF     0.800  0       0.0  0
1541    Ac 3E2526       -18.9     0.     -23.6 FIXEDHF     0.800  0       0.0  0
1542    Ad 2D2526       637.4     0.     796.7 FIXEDHF     0.800  0       0.0  0  3d5p      -3d13f
1543    Ad 4D2526       219.4     0.     274.3 FIXEDHF     0.800  0       0.0  0
1544    Ad 1E2526      -144.4     0.    -180.5 FIXEDHF     0.800  0       0.0  0
1545    Ad 3E2526       -19.8     0.     -24.8 FIXEDHF     0.800  0       0.0  0
1546    Ae 2D2536     -2873.9     0.   -3592.4 FIXEDHF     0.800  0       0.0  0  3d5p      -4s4f
1547    Ae 1E2536     -8738.0     0.  -10922.5 FIXEDHF     0.800  0       0.0  0
1548    Af 2D2536     -4416.5     0.   -5520.6 FIXEDHF     0.800  0       0.0  0  3d5p      -4s5f
1549    Af 1E2536     -6286.2     0.   -7857.7 FIXEDHF     0.800  0       0.0  0
1550    Ag 2D2536     -2894.2     0.   -3617.7 FIXEDHF     0.800  0       0.0  0  3d5p      -4s6f
1551    Ag 1E2536     -4691.8     0.   -5864.8 FIXEDHF     0.800  0       0.0  0
1552    Ah 2D2536     -2043.4     0.   -2554.3 FIXEDHF     0.800  0       0.0  0  3d5p      -4s7f
1553    Ah 1E2536     -3664.1     0.   -4580.1 FIXEDHF     0.800  0       0.0  0
1554    Ai 2D2536     -1536.9     0.   -1921.1 FIXEDHF     0.800  0       0.0  0  3d5p      -4s8f
1555    Ai 1E2536     -2959.0     0.   -3698.7 FIXEDHF     0.800  0       0.0  0
1556    Aj 2D2536     -1210.5     0.   -1513.1 FIXEDHF     0.800  0       0.0  0  3d5p      -4s9f
1557    Aj 1E2536     -2452.4     0.   -3065.5 FIXEDHF     0.800  0       0.0  0
1558    Ak 2D2536      -986.6     0.   -1233.3 FIXEDHF     0.800  0       0.0  0  3d5p      -4s10f
1559    Ak 1E2536     -2075.0     0.   -2593.8 FIXEDHF     0.800  0       0.0  0
1560    Al 2D2536      -825.4     0.   -1031.7 FIXEDHF     0.800  0       0.0  0  3d5p      -4s11f
1561    Al 1E2536     -1785.4     0.   -2231.8 FIXEDHF     0.800  0       0.0  0
1562    Am 2D2536      -704.5     0.    -880.6 FIXEDHF     0.800  0       0.0  0  3d5p      -4s12f
1563    Am 1E2536     -1557.5     0.   -1946.9 FIXEDHF     0.800  0       0.0  0
1564    An 2D2536      -611.2     0.    -764.0 FIXEDHF     0.800  0       0.0  0  3d5p      -4s13f
1565    An 1E2536     -1374.4     0.   -1718.0 FIXEDHF     0.800  0       0.0  0
1566    Ao 4D2527       -36.3     0.     -45.4 FIXEDHF     0.800  0       0.0  0  3d5p      -3d6h
1567    Ao 3E2527        66.7     0.      83.4 FIXEDHF     0.800  0       0.0  0
1568    Ap 4D2527        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  3d5p      -3d7h
1569    Ap 3E2527        75.2     0.      94.0 FIXEDHF     0.800  0       0.0  0
1570    Aq 4D2527        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0  3d5p      -3d8h
1571    Aq 3E2527        73.1     0.      91.4 FIXEDHF     0.800  0       0.0  0
1572    Ar 4D2527        29.8     0.      37.2 FIXEDHF     0.800  0       0.0  0  3d5p      -3d9h
1573    Ar 3E2527        68.0     0.      85.0 FIXEDHF     0.800  0       0.0  0
1574    BC 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6p      -3d7p
1575    BC 2D2525      3507.8     0.    4384.7 FIXEDHF     0.800  0       0.0  0
1576    BC 1E2525      1101.5     0.    1376.9 FIXEDHF     0.800  0       0.0  0
1577    BC 3E2525      1166.0     0.    1457.5 FIXEDHF     0.800  0       0.0  0
1578    BD 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6p      -3d8p
1579    BD 2D2525      2664.5     0.    3330.6 FIXEDHF     0.800  0       0.0  0
1580    BD 1E2525       863.5     0.    1079.4 FIXEDHF     0.800  0       0.0  0
1581    BD 3E2525       916.6     0.    1145.8 FIXEDHF     0.800  0       0.0  0
1582    BE 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6p      -3d9p
1583    BE 2D2525      2125.5     0.    2656.9 FIXEDHF     0.800  0       0.0  0
1584    BE 1E2525       701.6     0.     877.0 FIXEDHF     0.800  0       0.0  0
1585    BE 3E2525       746.1     0.     932.6 FIXEDHF     0.800  0       0.0  0
1586    BF 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6p      -3d10p
1587    BF 2D2525      1752.0     0.    2190.0 FIXEDHF     0.800  0       0.0  0
1588    BF 1E2525       585.2     0.     731.5 FIXEDHF     0.800  0       0.0  0
1589    BF 3E2525       623.0     0.     778.8 FIXEDHF     0.800  0       0.0  0
1590    BG 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6p      -3d11p
1591    BG 2D2525      1479.0     0.    1848.7 FIXEDHF     0.800  0       0.0  0
1592    BG 1E2525       498.2     0.     622.7 FIXEDHF     0.800  0       0.0  0
1593    BG 3E2525       530.8     0.     663.5 FIXEDHF     0.800  0       0.0  0
1594    BH 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6p      -3d12p
1595    BH 2D2525      1271.6     0.    1589.5 FIXEDHF     0.800  0       0.0  0
1596    BH 1E2525       430.9     0.     538.6 FIXEDHF     0.800  0       0.0  0
1597    BH 3E2525       459.4     0.     574.2 FIXEDHF     0.800  0       0.0  0
1598    BI 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6p      -3d13p
1599    BI 2D2525      1109.4     0.    1386.8 FIXEDHF     0.800  0       0.0  0
1600    BI 1E2525       377.6     0.     472.0 FIXEDHF     0.800  0       0.0  0
1601    BI 3E2525       402.8     0.     503.5 FIXEDHF     0.800  0       0.0  0
1602    BJ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6p      -3d14p
1603    BJ 2D2525       979.5     0.    1224.4 FIXEDHF     0.800  0       0.0  0
1604    BJ 1E2525       334.6     0.     418.2 FIXEDHF     0.800  0       0.0  0
1605    BJ 3E2525       357.0     0.     446.2 FIXEDHF     0.800  0       0.0  0
1606    BK 2D2535      -602.2     0.    -752.8 FIXEDHF     0.800  0       0.0  0  3d6p      -4s4p
1607    BK 1E2535        90.0     0.     112.5 FIXEDHF     0.800  0       0.0  0
1608    BL 2D2535     -1679.1     0.   -2098.9 FIXEDHF     0.800  0       0.0  0  3d6p      -4s5p
1609    BL 1E2535      -201.8     0.    -252.2 FIXEDHF     0.800  0       0.0  0
1610    BM 2D2535     -1722.6     0.   -2153.3 FIXEDHF     0.800  0       0.0  0  3d6p      -4s6p
1611    BM 1E2535      -176.0     0.    -220.0 FIXEDHF     0.800  0       0.0  0
1612    BN 2D2535      -922.3     0.   -1152.9 FIXEDHF     0.800  0       0.0  0  3d6p      -4s7p
1613    BN 1E2535      -140.5     0.    -175.6 FIXEDHF     0.800  0       0.0  0
1614    BO 2D2535      -612.7     0.    -765.9 FIXEDHF     0.800  0       0.0  0  3d6p      -4s8p
1615    BO 1E2535      -113.2     0.    -141.5 FIXEDHF     0.800  0       0.0  0
1616    BP 2D2535      -447.0     0.    -558.8 FIXEDHF     0.800  0       0.0  0  3d6p      -4s9p
1617    BP 1E2535       -93.2     0.    -116.5 FIXEDHF     0.800  0       0.0  0
1618    BQ 2D2535      -345.8     0.    -432.3 FIXEDHF     0.800  0       0.0  0  3d6p      -4s10p
1619    BQ 1E2535       -78.2     0.     -97.8 FIXEDHF     0.800  0       0.0  0
1620    BR 2D2535      -278.6     0.    -348.3 FIXEDHF     0.800  0       0.0  0  3d6p      -4s11p
1621    BR 1E2535       -66.9     0.     -83.6 FIXEDHF     0.800  0       0.0  0
1622    BS 2D2535      -231.2     0.    -289.0 FIXEDHF     0.800  0       0.0  0  3d6p      -4s12p
1623    BS 1E2535       -57.9     0.     -72.4 FIXEDHF     0.800  0       0.0  0
1624    BT 2D2535      -196.2     0.    -245.2 FIXEDHF     0.800  0       0.0  0  3d6p      -4s13p
1625    BT 1E2535       -50.9     0.     -63.6 FIXEDHF     0.800  0       0.0  0
1626    BU 2D2526      2100.7     0.    2625.9 FIXEDHF     0.800  0       0.0  0  3d6p      -3d4f
1627    BU 4D2526      1331.8     0.    1664.8 FIXEDHF     0.800  0       0.0  0
1628    BU 1E2526       243.9     0.     304.9 FIXEDHF     0.800  0       0.0  0
1629    BU 3E2526       627.2     0.     784.0 FIXEDHF     0.800  0       0.0  0
1630    BV 2D2526      2081.1     0.    2601.4 FIXEDHF     0.800  0       0.0  0  3d6p      -3d5f
1631    BV 4D2526      1044.1     0.    1305.1 FIXEDHF     0.800  0       0.0  0
1632    BV 1E2526       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0
1633    BV 3E2526       328.2     0.     410.2 FIXEDHF     0.800  0       0.0  0
1634    BW 2D2526      2258.2     0.    2822.8 FIXEDHF     0.800  0       0.0  0  3d6p      -3d6f
1635    BW 4D2526       775.7     0.     969.6 FIXEDHF     0.800  0       0.0  0
1636    BW 1E2526       -95.4     0.    -119.2 FIXEDHF     0.800  0       0.0  0
1637    BW 3E2526       176.2     0.     220.2 FIXEDHF     0.800  0       0.0  0
1638    BX 2D2526      1737.1     0.    2171.4 FIXEDHF     0.800  0       0.0  0  3d6p      -3d7f
1639    BX 4D2526       580.1     0.     725.1 FIXEDHF     0.800  0       0.0  0
1640    BX 1E2526      -116.6     0.    -145.7 FIXEDHF     0.800  0       0.0  0
1641    BX 3E2526       102.5     0.     128.1 FIXEDHF     0.800  0       0.0  0
1642    BY 2D2526      1355.4     0.    1694.3 FIXEDHF     0.800  0       0.0  0  3d6p      -3d8f
1643    BY 4D2526       450.3     0.     562.9 FIXEDHF     0.800  0       0.0  0
1644    BY 1E2526      -116.5     0.    -145.6 FIXEDHF     0.800  0       0.0  0
1645    BY 3E2526        63.8     0.      79.8 FIXEDHF     0.800  0       0.0  0
1646    BZ 2D2526      1089.5     0.    1361.9 FIXEDHF     0.800  0       0.0  0  3d6p      -3d9f
1647    BZ 4D2526       361.8     0.     452.2 FIXEDHF     0.800  0       0.0  0
1648    BZ 1E2526      -109.4     0.    -136.8 FIXEDHF     0.800  0       0.0  0
1649    BZ 3E2526        42.0     0.      52.5 FIXEDHF     0.800  0       0.0  0
1650    Ba 2D2526       899.4     0.    1124.3 FIXEDHF     0.800  0       0.0  0  3d6p      -3d10f
1651    Ba 4D2526       298.8     0.     373.5 FIXEDHF     0.800  0       0.0  0
1652    Ba 1E2526      -100.5     0.    -125.6 FIXEDHF     0.800  0       0.0  0
1653    Ba 3E2526        28.9     0.      36.1 FIXEDHF     0.800  0       0.0  0
1654    Bb 2D2526       759.0     0.     948.7 FIXEDHF     0.800  0       0.0  0  3d6p      -3d11f
1655    Bb 4D2526       252.2     0.     315.3 FIXEDHF     0.800  0       0.0  0
1656    Bb 1E2526       -91.6     0.    -114.5 FIXEDHF     0.800  0       0.0  0
1657    Bb 3E2526        20.6     0.      25.7 FIXEDHF     0.800  0       0.0  0
1658    Bc 2D2526       651.9     0.     814.9 FIXEDHF     0.800  0       0.0  0  3d6p      -3d12f
1659    Bc 4D2526       216.8     0.     271.0 FIXEDHF     0.800  0       0.0  0
1660    Bc 1E2526       -83.3     0.    -104.1 FIXEDHF     0.800  0       0.0  0
1661    Bc 3E2526        15.1     0.      18.9 FIXEDHF     0.800  0       0.0  0
1662    Bd 2D2526       568.2     0.     710.3 FIXEDHF     0.800  0       0.0  0  3d6p      -3d13f
1663    Bd 4D2526       189.0     0.     236.3 FIXEDHF     0.800  0       0.0  0
1664    Bd 1E2526       -75.8     0.     -94.8 FIXEDHF     0.800  0       0.0  0
1665    Bd 3E2526        11.4     0.      14.2 FIXEDHF     0.800  0       0.0  0
1666    Be 2D2536     -1519.9     0.   -1899.9 FIXEDHF     0.800  0       0.0  0  3d6p      -4s4f
1667    Be 1E2536     -4903.9     0.   -6129.9 FIXEDHF     0.800  0       0.0  0
1668    Bf 2D2536     -1801.3     0.   -2251.6 FIXEDHF     0.800  0       0.0  0  3d6p      -4s5f
1669    Bf 1E2536     -3659.4     0.   -4574.2 FIXEDHF     0.800  0       0.0  0
1670    Bg 2D2536     -2074.9     0.   -2593.6 FIXEDHF     0.800  0       0.0  0  3d6p      -4s6f
1671    Bg 1E2536     -2769.1     0.   -3461.4 FIXEDHF     0.800  0       0.0  0
1672    Bh 2D2536     -1586.6     0.   -1983.2 FIXEDHF     0.800  0       0.0  0  3d6p      -4s7f
1673    Bh 1E2536     -2178.8     0.   -2723.5 FIXEDHF     0.800  0       0.0  0
1674    Bi 2D2536     -1237.6     0.   -1547.0 FIXEDHF     0.800  0       0.0  0  3d6p      -4s8f
1675    Bi 1E2536     -1767.6     0.   -2209.5 FIXEDHF     0.800  0       0.0  0
1676    Bj 2D2536      -995.8     0.   -1244.7 FIXEDHF     0.800  0       0.0  0  3d6p      -4s9f
1677    Bj 1E2536     -1469.4     0.   -1836.8 FIXEDHF     0.800  0       0.0  0
1678    Bk 2D2536      -823.0     0.   -1028.8 FIXEDHF     0.800  0       0.0  0  3d6p      -4s10f
1679    Bk 1E2536     -1245.9     0.   -1557.4 FIXEDHF     0.800  0       0.0  0
1680    Bl 2D2536      -695.2     0.    -869.0 FIXEDHF     0.800  0       0.0  0  3d6p      -4s11f
1681    Bl 1E2536     -1073.6     0.   -1342.0 FIXEDHF     0.800  0       0.0  0
1682    Bm 2D2536      -597.8     0.    -747.2 FIXEDHF     0.800  0       0.0  0  3d6p      -4s12f
1683    Bm 1E2536      -937.6     0.   -1172.0 FIXEDHF     0.800  0       0.0  0
1684    Bn 2D2536      -521.4     0.    -651.8 FIXEDHF     0.800  0       0.0  0  3d6p      -4s13f
1685    Bn 1E2536      -828.1     0.   -1035.1 FIXEDHF     0.800  0       0.0  0
1686    Bo 4D2527         9.4     0.      11.7 FIXEDHF     0.800  0       0.0  0  3d6p      -3d6h
1687    Bo 3E2527        42.4     0.      53.0 FIXEDHF     0.800  0       0.0  0
1688    Bp 4D2527         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0  3d6p      -3d7h
1689    Bp 3E2527        48.0     0.      60.0 FIXEDHF     0.800  0       0.0  0
1690    Bq 4D2527         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0  3d6p      -3d8h
1691    Bq 3E2527        46.9     0.      58.6 FIXEDHF     0.800  0       0.0  0
1692    Br 4D2527         6.6     0.       8.3 FIXEDHF     0.800  0       0.0  0  3d6p      -3d9h
1693    Br 3E2527        43.7     0.      54.6 FIXEDHF     0.800  0       0.0  0
1694    CD 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7p      -3d8p
1695    CD 2D2525      2132.7     0.    2665.9 FIXEDHF     0.800  0       0.0  0
1696    CD 1E2525       644.5     0.     805.6 FIXEDHF     0.800  0       0.0  0
1697    CD 3E2525       688.2     0.     860.2 FIXEDHF     0.800  0       0.0  0
1698    CE 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7p      -3d9p
1699    CE 2D2525      1696.9     0.    2121.1 FIXEDHF     0.800  0       0.0  0
1700    CE 1E2525       524.0     0.     655.0 FIXEDHF     0.800  0       0.0  0
1701    CE 3E2525       560.6     0.     700.7 FIXEDHF     0.800  0       0.0  0
1702    CF 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7p      -3d10p
1703    CF 2D2525      1397.3     0.    1746.6 FIXEDHF     0.800  0       0.0  0
1704    CF 1E2525       437.3     0.     546.6 FIXEDHF     0.800  0       0.0  0
1705    CF 3E2525       468.4     0.     585.5 FIXEDHF     0.800  0       0.0  0
1706    CG 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7p      -3d11p
1707    CG 2D2525      1179.0     0.    1473.8 FIXEDHF     0.800  0       0.0  0
1708    CG 1E2525       372.3     0.     465.4 FIXEDHF     0.800  0       0.0  0
1709    CG 3E2525       399.2     0.     499.0 FIXEDHF     0.800  0       0.0  0
1710    CH 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7p      -3d12p
1711    CH 2D2525      1013.4     0.    1266.8 FIXEDHF     0.800  0       0.0  0
1712    CH 1E2525       322.2     0.     402.7 FIXEDHF     0.800  0       0.0  0
1713    CH 3E2525       345.6     0.     432.0 FIXEDHF     0.800  0       0.0  0
1714    CI 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7p      -3d13p
1715    CI 2D2525       884.1     0.    1105.1 FIXEDHF     0.800  0       0.0  0
1716    CI 1E2525       282.4     0.     353.0 FIXEDHF     0.800  0       0.0  0
1717    CI 3E2525       303.0     0.     378.8 FIXEDHF     0.800  0       0.0  0
1718    CJ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7p      -3d14p
1719    CJ 2D2525       780.4     0.     975.5 FIXEDHF     0.800  0       0.0  0
1720    CJ 1E2525       250.2     0.     312.8 FIXEDHF     0.800  0       0.0  0
1721    CJ 3E2525       268.6     0.     335.8 FIXEDHF     0.800  0       0.0  0
1722    CK 2D2535      -201.6     0.    -252.0 FIXEDHF     0.800  0       0.0  0  3d7p      -4s4p
1723    CK 1E2535       282.8     0.     353.5 FIXEDHF     0.800  0       0.0  0
1724    CL 2D2535     -1008.8     0.   -1261.0 FIXEDHF     0.800  0       0.0  0  3d7p      -4s5p
1725    CL 1E2535       -52.9     0.     -66.1 FIXEDHF     0.800  0       0.0  0
1726    CM 2D2535     -1024.6     0.   -1280.7 FIXEDHF     0.800  0       0.0  0  3d7p      -4s6p
1727    CM 1E2535       -71.9     0.     -89.9 FIXEDHF     0.800  0       0.0  0
1728    CN 2D2535      -930.6     0.   -1163.3 FIXEDHF     0.800  0       0.0  0  3d7p      -4s7p
1729    CN 1E2535       -63.8     0.     -79.7 FIXEDHF     0.800  0       0.0  0
1730    CO 2D2535      -592.2     0.    -740.2 FIXEDHF     0.800  0       0.0  0  3d7p      -4s8p
1731    CO 1E2535       -53.8     0.     -67.2 FIXEDHF     0.800  0       0.0  0
1732    CP 2D2535      -432.5     0.    -540.6 FIXEDHF     0.800  0       0.0  0  3d7p      -4s9p
1733    CP 1E2535       -45.4     0.     -56.7 FIXEDHF     0.800  0       0.0  0
1734    CQ 2D2535      -336.2     0.    -420.2 FIXEDHF     0.800  0       0.0  0  3d7p      -4s10p
1735    CQ 1E2535       -38.6     0.     -48.3 FIXEDHF     0.800  0       0.0  0
1736    CR 2D2535      -272.2     0.    -340.2 FIXEDHF     0.800  0       0.0  0  3d7p      -4s11p
1737    CR 1E2535       -33.4     0.     -41.7 FIXEDHF     0.800  0       0.0  0
1738    CS 2D2535      -226.8     0.    -283.5 FIXEDHF     0.800  0       0.0  0  3d7p      -4s12p
1739    CS 1E2535       -29.1     0.     -36.4 FIXEDHF     0.800  0       0.0  0
1740    CT 2D2535      -193.1     0.    -241.4 FIXEDHF     0.800  0       0.0  0  3d7p      -4s13p
1741    CT 1E2535       -25.7     0.     -32.1 FIXEDHF     0.800  0       0.0  0
1742    CU 2D2526      1482.2     0.    1852.8 FIXEDHF     0.800  0       0.0  0  3d7p      -3d4f
1743    CU 4D2526       968.7     0.    1210.9 FIXEDHF     0.800  0       0.0  0
1744    CU 1E2526       206.0     0.     257.5 FIXEDHF     0.800  0       0.0  0
1745    CU 3E2526       493.8     0.     617.3 FIXEDHF     0.800  0       0.0  0
1746    CV 2D2526      1440.0     0.    1800.0 FIXEDHF     0.800  0       0.0  0  3d7p      -3d5f
1747    CV 4D2526       769.6     0.     962.0 FIXEDHF     0.800  0       0.0  0
1748    CV 1E2526        19.3     0.      24.1 FIXEDHF     0.800  0       0.0  0
1749    CV 3E2526       274.1     0.     342.6 FIXEDHF     0.800  0       0.0  0
1750    CW 2D2526      1259.4     0.    1574.2 FIXEDHF     0.800  0       0.0  0  3d7p      -3d6f
1751    CW 4D2526       575.4     0.     719.3 FIXEDHF     0.800  0       0.0  0
1752    CW 1E2526       -47.1     0.     -58.9 FIXEDHF     0.800  0       0.0  0
1753    CW 3E2526       157.1     0.     196.4 FIXEDHF     0.800  0       0.0  0
1754    CX 2D2526      1250.9     0.    1563.6 FIXEDHF     0.800  0       0.0  0  3d7p      -3d7f
1755    CX 4D2526       443.0     0.     553.7 FIXEDHF     0.800  0       0.0  0
1756    CX 1E2526       -66.7     0.     -83.4 FIXEDHF     0.800  0       0.0  0
1757    CX 3E2526        98.2     0.     122.7 FIXEDHF     0.800  0       0.0  0
1758    CY 2D2526      1028.2     0.    1285.2 FIXEDHF     0.800  0       0.0  0  3d7p      -3d8f
1759    CY 4D2526       350.0     0.     437.5 FIXEDHF     0.800  0       0.0  0
1760    CY 1E2526       -69.8     0.     -87.2 FIXEDHF     0.800  0       0.0  0
1761    CY 3E2526        66.0     0.      82.5 FIXEDHF     0.800  0       0.0  0
1762    CZ 2D2526       847.8     0.    1059.7 FIXEDHF     0.800  0       0.0  0  3d7p      -3d9f
1763    CZ 4D2526       284.5     0.     355.6 FIXEDHF     0.800  0       0.0  0
1764    CZ 1E2526       -67.0     0.     -83.8 FIXEDHF     0.800  0       0.0  0
1765    CZ 3E2526        47.0     0.      58.8 FIXEDHF     0.800  0       0.0  0
1766    Ca 2D2526       710.6     0.     888.3 FIXEDHF     0.800  0       0.0  0  3d7p      -3d10f
1767    Ca 4D2526       237.0     0.     296.2 FIXEDHF     0.800  0       0.0  0
1768    Ca 1E2526       -62.3     0.     -77.9 FIXEDHF     0.800  0       0.0  0
1769    Ca 3E2526        35.1     0.      43.9 FIXEDHF     0.800  0       0.0  0
1770    Cb 2D2526       605.9     0.     757.4 FIXEDHF     0.800  0       0.0  0  3d7p      -3d11f
1771    Cb 4D2526       201.4     0.     251.7 FIXEDHF     0.800  0       0.0  0
1772    Cb 1E2526       -57.3     0.     -71.6 FIXEDHF     0.800  0       0.0  0
1773    Cb 3E2526        27.2     0.      34.0 FIXEDHF     0.800  0       0.0  0
1774    Cc 2D2526       524.4     0.     655.5 FIXEDHF     0.800  0       0.0  0  3d7p      -3d12f
1775    Cc 4D2526       173.9     0.     217.4 FIXEDHF     0.800  0       0.0  0
1776    Cc 1E2526       -52.4     0.     -65.5 FIXEDHF     0.800  0       0.0  0
1777    Cc 3E2526        21.8     0.      27.2 FIXEDHF     0.800  0       0.0  0
1778    Cd 2D2526       459.6     0.     574.5 FIXEDHF     0.800  0       0.0  0  3d7p      -3d13f
1779    Cd 4D2526       152.2     0.     190.3 FIXEDHF     0.800  0       0.0  0
1780    Cd 1E2526       -47.9     0.     -59.9 FIXEDHF     0.800  0       0.0  0
1781    Cd 3E2526        17.8     0.      22.3 FIXEDHF     0.800  0       0.0  0
1782    Ce 2D2536      -983.2     0.   -1229.0 FIXEDHF     0.800  0       0.0  0  3d7p      -4s4f
1783    Ce 1E2536     -3298.8     0.   -4123.5 FIXEDHF     0.800  0       0.0  0
1784    Cf 2D2536     -1170.2     0.   -1462.8 FIXEDHF     0.800  0       0.0  0  3d7p      -4s5f
1785    Cf 1E2536     -2507.5     0.   -3134.4 FIXEDHF     0.800  0       0.0  0
1786    Cg 2D2536     -1117.4     0.   -1396.8 FIXEDHF     0.800  0       0.0  0  3d7p      -4s6f
1787    Cg 1E2536     -1911.3     0.   -2389.1 FIXEDHF     0.800  0       0.0  0
1788    Ch 2D2536     -1150.5     0.   -1438.1 FIXEDHF     0.800  0       0.0  0  3d7p      -4s7f
1789    Ch 1E2536     -1509.6     0.   -1887.0 FIXEDHF     0.800  0       0.0  0
1790    Ci 2D2536      -942.6     0.   -1178.2 FIXEDHF     0.800  0       0.0  0  3d7p      -4s8f
1791    Ci 1E2536     -1227.6     0.   -1534.5 FIXEDHF     0.800  0       0.0  0
1792    Cj 2D2536      -775.7     0.    -969.6 FIXEDHF     0.800  0       0.0  0  3d7p      -4s9f
1793    Cj 1E2536     -1022.2     0.   -1277.7 FIXEDHF     0.800  0       0.0  0
1794    Ck 2D2536      -649.5     0.    -811.9 FIXEDHF     0.800  0       0.0  0  3d7p      -4s10f
1795    Ck 1E2536      -867.6     0.   -1084.5 FIXEDHF     0.800  0       0.0  0
1796    Cl 2D2536      -553.4     0.    -691.7 FIXEDHF     0.800  0       0.0  0  3d7p      -4s11f
1797    Cl 1E2536      -748.2     0.    -935.3 FIXEDHF     0.800  0       0.0  0
1798    Cm 2D2536      -478.6     0.    -598.3 FIXEDHF     0.800  0       0.0  0  3d7p      -4s12f
1799    Cm 1E2536      -653.8     0.    -817.3 FIXEDHF     0.800  0       0.0  0
1800    Cn 2D2536      -419.4     0.    -524.2 FIXEDHF     0.800  0       0.0  0  3d7p      -4s13f
1801    Cn 1E2536      -577.7     0.    -722.1 FIXEDHF     0.800  0       0.0  0
1802    Co 4D2527         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  3d7p      -3d6h
1803    Co 3E2527        30.3     0.      37.9 FIXEDHF     0.800  0       0.0  0
1804    Cp 4D2527         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0  3d7p      -3d7h
1805    Cp 3E2527        34.5     0.      43.1 FIXEDHF     0.800  0       0.0  0
1806    Cq 4D2527         6.7     0.       8.4 FIXEDHF     0.800  0       0.0  0  3d7p      -3d8h
1807    Cq 3E2527        33.7     0.      42.1 FIXEDHF     0.800  0       0.0  0
1808    Cr 4D2527         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0  3d7p      -3d9h
1809    Cr 3E2527        31.4     0.      39.3 FIXEDHF     0.800  0       0.0  0
1810    DE 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8p      -3d9p
1811    DE 2D2525      1389.3     0.    1736.6 FIXEDHF     0.800  0       0.0  0
1812    DE 1E2525       411.6     0.     514.5 FIXEDHF     0.800  0       0.0  0
1813    DE 3E2525       441.8     0.     552.2 FIXEDHF     0.800  0       0.0  0
1814    DF 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8p      -3d10p
1815    DF 2D2525      1142.1     0.    1427.6 FIXEDHF     0.800  0       0.0  0
1816    DF 1E2525       343.6     0.     429.5 FIXEDHF     0.800  0       0.0  0
1817    DF 3E2525       369.3     0.     461.6 FIXEDHF     0.800  0       0.0  0
1818    DG 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8p      -3d11p
1819    DG 2D2525       963.0     0.    1203.8 FIXEDHF     0.800  0       0.0  0
1820    DG 1E2525       292.6     0.     365.8 FIXEDHF     0.800  0       0.0  0
1821    DG 3E2525       314.8     0.     393.5 FIXEDHF     0.800  0       0.0  0
1822    DH 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8p      -3d12p
1823    DH 2D2525       827.5     0.    1034.4 FIXEDHF     0.800  0       0.0  0
1824    DH 1E2525       253.2     0.     316.5 FIXEDHF     0.800  0       0.0  0
1825    DH 3E2525       272.6     0.     340.7 FIXEDHF     0.800  0       0.0  0
1826    DI 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8p      -3d13p
1827    DI 2D2525       721.7     0.     902.1 FIXEDHF     0.800  0       0.0  0
1828    DI 1E2525       222.0     0.     277.5 FIXEDHF     0.800  0       0.0  0
1829    DI 3E2525       239.0     0.     298.8 FIXEDHF     0.800  0       0.0  0
1830    DJ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8p      -3d14p
1831    DJ 2D2525       637.0     0.     796.3 FIXEDHF     0.800  0       0.0  0
1832    DJ 1E2525       196.7     0.     245.9 FIXEDHF     0.800  0       0.0  0
1833    DJ 3E2525       211.9     0.     264.9 FIXEDHF     0.800  0       0.0  0
1834    DK 2D2535       -51.8     0.     -64.8 FIXEDHF     0.800  0       0.0  0  3d8p      -4s4p
1835    DK 1E2535       313.2     0.     391.5 FIXEDHF     0.800  0       0.0  0
1836    DL 2D2535      -690.4     0.    -863.0 FIXEDHF     0.800  0       0.0  0  3d8p      -4s5p
1837    DL 1E2535         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0
1838    DM 2D2535      -716.6     0.    -895.7 FIXEDHF     0.800  0       0.0  0  3d8p      -4s6p
1839    DM 1E2535       -30.0     0.     -37.5 FIXEDHF     0.800  0       0.0  0
1840    DN 2D2535      -637.6     0.    -797.0 FIXEDHF     0.800  0       0.0  0  3d8p      -4s7p
1841    DN 1E2535       -31.7     0.     -39.6 FIXEDHF     0.800  0       0.0  0
1842    DO 2D2535      -559.8     0.    -699.8 FIXEDHF     0.800  0       0.0  0  3d8p      -4s8p
1843    DO 1E2535       -28.4     0.     -35.5 FIXEDHF     0.800  0       0.0  0
1844    DP 2D2535      -394.9     0.    -493.6 FIXEDHF     0.800  0       0.0  0  3d8p      -4s9p
1845    DP 1E2535       -24.7     0.     -30.9 FIXEDHF     0.800  0       0.0  0
1846    DQ 2D2535      -305.8     0.    -382.3 FIXEDHF     0.800  0       0.0  0  3d8p      -4s10p
1847    DQ 1E2535       -21.5     0.     -26.9 FIXEDHF     0.800  0       0.0  0
1848    DR 2D2535      -247.5     0.    -309.4 FIXEDHF     0.800  0       0.0  0  3d8p      -4s11p
1849    DR 1E2535       -18.8     0.     -23.5 FIXEDHF     0.800  0       0.0  0
1850    DS 2D2535      -206.4     0.    -258.0 FIXEDHF     0.800  0       0.0  0  3d8p      -4s12p
1851    DS 1E2535       -16.5     0.     -20.6 FIXEDHF     0.800  0       0.0  0
1852    DT 2D2535      -176.0     0.    -220.0 FIXEDHF     0.800  0       0.0  0  3d8p      -4s13p
1853    DT 1E2535       -14.6     0.     -18.3 FIXEDHF     0.800  0       0.0  0
1854    DU 2D2526      1128.6     0.    1410.7 FIXEDHF     0.800  0       0.0  0  3d8p      -3d4f
1855    DU 4D2526       750.2     0.     937.7 FIXEDHF     0.800  0       0.0  0
1856    DU 1E2526       172.6     0.     215.8 FIXEDHF     0.800  0       0.0  0
1857    DU 3E2526       399.4     0.     499.2 FIXEDHF     0.800  0       0.0  0
1858    DV 2D2526      1086.4     0.    1358.0 FIXEDHF     0.800  0       0.0  0  3d8p      -3d5f
1859    DV 4D2526       600.6     0.     750.8 FIXEDHF     0.800  0       0.0  0
1860    DV 1E2526        27.5     0.      34.4 FIXEDHF     0.800  0       0.0  0
1861    DV 3E2526       228.4     0.     285.5 FIXEDHF     0.800  0       0.0  0
1862    DW 2D2526       936.7     0.    1170.9 FIXEDHF     0.800  0       0.0  0  3d8p      -3d6f
1863    DW 4D2526       451.8     0.     564.8 FIXEDHF     0.800  0       0.0  0
1864    DW 1E2526       -26.2     0.     -32.7 FIXEDHF     0.800  0       0.0  0
1865    DW 3E2526       135.0     0.     168.7 FIXEDHF     0.800  0       0.0  0
1866    DX 2D2526       806.0     0.    1007.5 FIXEDHF     0.800  0       0.0  0  3d8p      -3d7f
1867    DX 4D2526       349.0     0.     436.2 FIXEDHF     0.800  0       0.0  0
1868    DX 1E2526       -43.2     0.     -54.0 FIXEDHF     0.800  0       0.0  0
1869    DX 3E2526        86.9     0.     108.6 FIXEDHF     0.800  0       0.0  0
1870    DY 2D2526       769.4     0.     961.7 FIXEDHF     0.800  0       0.0  0  3d8p      -3d8f
1871    DY 4D2526       278.6     0.     348.2 FIXEDHF     0.800  0       0.0  0
1872    DY 1E2526       -47.0     0.     -58.8 FIXEDHF     0.800  0       0.0  0
1873    DY 3E2526        60.2     0.      75.2 FIXEDHF     0.800  0       0.0  0
1874    DZ 2D2526       655.5     0.     819.4 FIXEDHF     0.800  0       0.0  0  3d8p      -3d9f
1875    DZ 4D2526       228.0     0.     285.0 FIXEDHF     0.800  0       0.0  0
1876    DZ 1E2526       -46.0     0.     -57.5 FIXEDHF     0.800  0       0.0  0
1877    DZ 3E2526        44.1     0.      55.1 FIXEDHF     0.800  0       0.0  0
1878    Da 2D2526       558.6     0.     698.2 FIXEDHF     0.800  0       0.0  0  3d8p      -3d10f
1879    Da 4D2526       190.8     0.     238.5 FIXEDHF     0.800  0       0.0  0
1880    Da 1E2526       -43.2     0.     -54.0 FIXEDHF     0.800  0       0.0  0
1881    Da 3E2526        33.8     0.      42.2 FIXEDHF     0.800  0       0.0  0
1882    Db 2D2526       481.0     0.     601.2 FIXEDHF     0.800  0       0.0  0  3d8p      -3d11f
1883    Db 4D2526       162.7     0.     203.4 FIXEDHF     0.800  0       0.0  0
1884    Db 1E2526       -40.0     0.     -50.0 FIXEDHF     0.800  0       0.0  0
1885    Db 3E2526        26.8     0.      33.5 FIXEDHF     0.800  0       0.0  0
1886    Dc 2D2526       419.0     0.     523.7 FIXEDHF     0.800  0       0.0  0  3d8p      -3d12f
1887    Dc 4D2526       141.0     0.     176.2 FIXEDHF     0.800  0       0.0  0
1888    Dc 1E2526       -36.7     0.     -45.9 FIXEDHF     0.800  0       0.0  0
1889    Dc 3E2526        21.8     0.      27.3 FIXEDHF     0.800  0       0.0  0
1890    Dd 2D2526       369.0     0.     461.2 FIXEDHF     0.800  0       0.0  0  3d8p      -3d13f
1891    Dd 4D2526       123.7     0.     154.6 FIXEDHF     0.800  0       0.0  0
1892    Dd 1E2526       -33.7     0.     -42.1 FIXEDHF     0.800  0       0.0  0
1893    Dd 3E2526        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0
1894    De 2D2536      -707.8     0.    -884.8 FIXEDHF     0.800  0       0.0  0  3d8p      -4s4f
1895    De 1E2536     -2437.0     0.   -3046.2 FIXEDHF     0.800  0       0.0  0
1896    Df 2D2536      -848.8     0.   -1061.0 FIXEDHF     0.800  0       0.0  0  3d8p      -4s5f
1897    Df 1E2536     -1872.6     0.   -2340.8 FIXEDHF     0.800  0       0.0  0
1898    Dg 2D2536      -803.2     0.   -1004.0 FIXEDHF     0.800  0       0.0  0  3d8p      -4s6f
1899    Dg 1E2536     -1433.4     0.   -1791.8 FIXEDHF     0.800  0       0.0  0
1900    Dh 2D2536      -726.2     0.    -907.7 FIXEDHF     0.800  0       0.0  0  3d8p      -4s7f
1901    Dh 1E2536     -1134.9     0.   -1418.6 FIXEDHF     0.800  0       0.0  0
1902    Di 2D2536      -708.5     0.    -885.6 FIXEDHF     0.800  0       0.0  0  3d8p      -4s8f
1903    Di 1E2536      -924.2     0.   -1155.2 FIXEDHF     0.800  0       0.0  0
1904    Dj 2D2536      -602.2     0.    -752.8 FIXEDHF     0.800  0       0.0  0  3d8p      -4s9f
1905    Dj 1E2536      -770.2     0.    -962.7 FIXEDHF     0.800  0       0.0  0
1906    Dk 2D2536      -512.1     0.    -640.1 FIXEDHF     0.800  0       0.0  0  3d8p      -4s10f
1907    Dk 1E2536      -654.2     0.    -817.7 FIXEDHF     0.800  0       0.0  0
1908    Dl 2D2536      -440.2     0.    -550.3 FIXEDHF     0.800  0       0.0  0  3d8p      -4s11f
1909    Dl 1E2536      -564.4     0.    -705.5 FIXEDHF     0.800  0       0.0  0
1910    Dm 2D2536      -383.0     0.    -478.8 FIXEDHF     0.800  0       0.0  0  3d8p      -4s12f
1911    Dm 1E2536      -493.4     0.    -616.7 FIXEDHF     0.800  0       0.0  0
1912    Dn 2D2536      -337.0     0.    -421.2 FIXEDHF     0.800  0       0.0  0  3d8p      -4s13f
1913    Dn 1E2536      -436.1     0.    -545.1 FIXEDHF     0.800  0       0.0  0
1914    Do 4D2527         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0  3d8p      -3d6h
1915    Do 3E2527        23.2     0.      29.0 FIXEDHF     0.800  0       0.0  0
1916    Dp 4D2527         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0  3d8p      -3d7h
1917    Dp 3E2527        26.4     0.      33.0 FIXEDHF     0.800  0       0.0  0
1918    Dq 4D2527         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0  3d8p      -3d8h
1919    Dq 3E2527        25.8     0.      32.3 FIXEDHF     0.800  0       0.0  0
1920    Dr 4D2527         5.9     0.       7.4 FIXEDHF     0.800  0       0.0  0  3d8p      -3d9h
1921    Dr 3E2527        24.2     0.      30.2 FIXEDHF     0.800  0       0.0  0
1922    EF 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d9p      -3d10p
1923    EF 2D2525       954.3     0.    1192.9 FIXEDHF     0.800  0       0.0  0
1924    EF 1E2525       279.6     0.     349.5 FIXEDHF     0.800  0       0.0  0
1925    EF 3E2525       301.1     0.     376.4 FIXEDHF     0.800  0       0.0  0
1926    EG 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d9p      -3d11p
1927    EG 2D2525       803.7     0.    1004.6 FIXEDHF     0.800  0       0.0  0
1928    EG 1E2525       238.1     0.     297.6 FIXEDHF     0.800  0       0.0  0
1929    EG 3E2525       256.7     0.     320.9 FIXEDHF     0.800  0       0.0  0
1930    EH 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d9p      -3d12p
1931    EH 2D2525       690.2     0.     862.8 FIXEDHF     0.800  0       0.0  0
1932    EH 1E2525       206.1     0.     257.6 FIXEDHF     0.800  0       0.0  0
1933    EH 3E2525       222.3     0.     277.9 FIXEDHF     0.800  0       0.0  0
1934    EI 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d9p      -3d13p
1935    EI 2D2525       601.8     0.     752.3 FIXEDHF     0.800  0       0.0  0
1936    EI 1E2525       180.6     0.     225.8 FIXEDHF     0.800  0       0.0  0
1937    EI 3E2525       195.0     0.     243.8 FIXEDHF     0.800  0       0.0  0
1938    EJ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d9p      -3d14p
1939    EJ 2D2525       531.2     0.     664.0 FIXEDHF     0.800  0       0.0  0
1940    EJ 1E2525       160.1     0.     200.1 FIXEDHF     0.800  0       0.0  0
1941    EJ 3E2525       172.9     0.     216.1 FIXEDHF     0.800  0       0.0  0
1942    EK 2D2535        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0  3d9p      -4s4p
1943    EK 1E2535       299.8     0.     374.7 FIXEDHF     0.800  0       0.0  0
1944    EL 2D2535      -511.2     0.    -639.0 FIXEDHF     0.800  0       0.0  0  3d9p      -4s5p
1945    EL 1E2535        22.9     0.      28.6 FIXEDHF     0.800  0       0.0  0
1946    EM 2D2535      -541.0     0.    -676.3 FIXEDHF     0.800  0       0.0  0  3d9p      -4s6p
1947    EM 1E2535       -11.0     0.     -13.7 FIXEDHF     0.800  0       0.0  0
1948    EN 2D2535      -482.8     0.    -603.5 FIXEDHF     0.800  0       0.0  0  3d9p      -4s7p
1949    EN 1E2535       -16.4     0.     -20.5 FIXEDHF     0.800  0       0.0  0
1950    EO 2D2535      -416.9     0.    -521.1 FIXEDHF     0.800  0       0.0  0  3d9p      -4s8p
1951    EO 1E2535       -16.1     0.     -20.1 FIXEDHF     0.800  0       0.0  0
1952    EP 2D2535      -363.5     0.    -454.4 FIXEDHF     0.800  0       0.0  0  3d9p      -4s9p
1953    EP 1E2535       -14.6     0.     -18.2 FIXEDHF     0.800  0       0.0  0
1954    EQ 2D2535      -274.2     0.    -342.7 FIXEDHF     0.800  0       0.0  0  3d9p      -4s10p
1955    EQ 1E2535       -12.9     0.     -16.1 FIXEDHF     0.800  0       0.0  0
1956    ER 2D2535      -221.0     0.    -276.3 FIXEDHF     0.800  0       0.0  0  3d9p      -4s11p
1957    ER 1E2535       -11.4     0.     -14.3 FIXEDHF     0.800  0       0.0  0
1958    ES 2D2535      -184.2     0.    -230.2 FIXEDHF     0.800  0       0.0  0  3d9p      -4s12p
1959    ES 1E2535       -10.2     0.     -12.7 FIXEDHF     0.800  0       0.0  0
1960    ET 2D2535      -157.0     0.    -196.2 FIXEDHF     0.800  0       0.0  0  3d9p      -4s13p
1961    ET 1E2535        -9.1     0.     -11.4 FIXEDHF     0.800  0       0.0  0
1962    EU 2D2526       900.7     0.    1125.9 FIXEDHF     0.800  0       0.0  0  3d9p      -3d4f
1963    EU 4D2526       605.0     0.     756.3 FIXEDHF     0.800  0       0.0  0
1964    EU 1E2526       146.1     0.     182.6 FIXEDHF     0.800  0       0.0  0
1965    EU 3E2526       330.8     0.     413.5 FIXEDHF     0.800  0       0.0  0
1966    EV 2D2526       862.9     0.    1078.6 FIXEDHF     0.800  0       0.0  0  3d9p      -3d5f
1967    EV 4D2526       486.9     0.     608.6 FIXEDHF     0.800  0       0.0  0
1968    EV 1E2526        28.8     0.      36.0 FIXEDHF     0.800  0       0.0  0
1969    EV 3E2526       192.6     0.     240.7 FIXEDHF     0.800  0       0.0  0
1970    EW 2D2526       738.8     0.     923.5 FIXEDHF     0.800  0       0.0  0  3d9p      -3d6f
1971    EW 4D2526       367.7     0.     459.6 FIXEDHF     0.800  0       0.0  0
1972    EW 1E2526       -15.7     0.     -19.6 FIXEDHF     0.800  0       0.0  0
1973    EW 3E2526       115.8     0.     144.7 FIXEDHF     0.800  0       0.0  0
1974    EX 2D2526       629.4     0.     786.7 FIXEDHF     0.800  0       0.0  0  3d9p      -3d7f
1975    EX 4D2526       284.8     0.     356.0 FIXEDHF     0.800  0       0.0  0
1976    EX 1E2526       -30.4     0.     -38.0 FIXEDHF     0.800  0       0.0  0
1977    EX 3E2526        75.8     0.      94.7 FIXEDHF     0.800  0       0.0  0
1978    EY 2D2526       543.8     0.     679.7 FIXEDHF     0.800  0       0.0  0  3d9p      -3d8f
1979    EY 4D2526       227.7     0.     284.6 FIXEDHF     0.800  0       0.0  0
1980    EY 1E2526       -34.3     0.     -42.9 FIXEDHF     0.800  0       0.0  0
1981    EY 3E2526        53.2     0.      66.5 FIXEDHF     0.800  0       0.0  0
1982    EZ 2D2526       509.1     0.     636.4 FIXEDHF     0.800  0       0.0  0  3d9p      -3d9f
1983    EZ 4D2526       187.1     0.     233.9 FIXEDHF     0.800  0       0.0  0
1984    EZ 1E2526       -34.0     0.     -42.5 FIXEDHF     0.800  0       0.0  0
1985    EZ 3E2526        39.5     0.      49.4 FIXEDHF     0.800  0       0.0  0
1986    Ea 2D2526       443.4     0.     554.3 FIXEDHF     0.800  0       0.0  0  3d9p      -3d10f
1987    Ea 4D2526       157.1     0.     196.4 FIXEDHF     0.800  0       0.0  0
1988    Ea 1E2526       -32.2     0.     -40.3 FIXEDHF     0.800  0       0.0  0
1989    Ea 3E2526        30.6     0.      38.3 FIXEDHF     0.800  0       0.0  0
1990    Eb 2D2526       386.1     0.     482.6 FIXEDHF     0.800  0       0.0  0  3d9p      -3d11f
1991    Eb 4D2526       134.3     0.     167.9 FIXEDHF     0.800  0       0.0  0
1992    Eb 1E2526       -29.9     0.     -37.4 FIXEDHF     0.800  0       0.0  0
1993    Eb 3E2526        24.6     0.      30.7 FIXEDHF     0.800  0       0.0  0
1994    Ec 2D2526       338.6     0.     423.3 FIXEDHF     0.800  0       0.0  0  3d9p      -3d12f
1995    Ec 4D2526       116.5     0.     145.6 FIXEDHF     0.800  0       0.0  0
1996    Ec 1E2526       -27.6     0.     -34.5 FIXEDHF     0.800  0       0.0  0
1997    Ec 3E2526        20.2     0.      25.3 FIXEDHF     0.800  0       0.0  0
1998    Ed 2D2526       299.6     0.     374.5 FIXEDHF     0.800  0       0.0  0  3d9p      -3d13f
1999    Ed 4D2526       102.3     0.     127.9 FIXEDHF     0.800  0       0.0  0
2000    Ed 1E2526       -25.4     0.     -31.7 FIXEDHF     0.800  0       0.0  0
2001    Ed 3E2526        17.0     0.      21.3 FIXEDHF     0.800  0       0.0  0
2002    Ee 2D2536      -543.8     0.    -679.8 FIXEDHF     0.800  0       0.0  0  3d9p      -4s4f
2003    Ee 1E2536     -1906.0     0.   -2382.5 FIXEDHF     0.800  0       0.0  0
2004    Ef 2D2536      -656.6     0.    -820.7 FIXEDHF     0.800  0       0.0  0  3d9p      -4s5f
2005    Ef 1E2536     -1474.9     0.   -1843.6 FIXEDHF     0.800  0       0.0  0
2006    Eg 2D2536      -619.5     0.    -774.4 FIXEDHF     0.800  0       0.0  0  3d9p      -4s6f
2007    Eg 1E2536     -1132.2     0.   -1415.2 FIXEDHF     0.800  0       0.0  0
2008    Eh 2D2536      -555.2     0.    -694.0 FIXEDHF     0.800  0       0.0  0  3d9p      -4s7f
2009    Eh 1E2536      -897.6     0.   -1122.0 FIXEDHF     0.800  0       0.0  0
2010    Ei 2D2536      -494.1     0.    -617.6 FIXEDHF     0.800  0       0.0  0  3d9p      -4s8f
2011    Ei 1E2536      -731.6     0.    -914.5 FIXEDHF     0.800  0       0.0  0
2012    Ej 2D2536      -469.0     0.    -586.3 FIXEDHF     0.800  0       0.0  0  3d9p      -4s9f
2013    Ej 1E2536      -610.1     0.    -762.6 FIXEDHF     0.800  0       0.0  0
2014    Ek 2D2536      -407.8     0.    -509.7 FIXEDHF     0.800  0       0.0  0  3d9p      -4s10f
2015    Ek 1E2536      -518.4     0.    -648.0 FIXEDHF     0.800  0       0.0  0
2016    El 2D2536      -354.4     0.    -443.0 FIXEDHF     0.800  0       0.0  0  3d9p      -4s11f
2017    El 1E2536      -447.4     0.    -559.3 FIXEDHF     0.800  0       0.0  0
2018    Em 2D2536      -310.3     0.    -387.9 FIXEDHF     0.800  0       0.0  0  3d9p      -4s12f
2019    Em 1E2536      -391.2     0.    -489.0 FIXEDHF     0.800  0       0.0  0
2020    En 2D2536      -274.2     0.    -342.8 FIXEDHF     0.800  0       0.0  0  3d9p      -4s13f
2021    En 1E2536      -345.8     0.    -432.3 FIXEDHF     0.800  0       0.0  0
2022    Eo 4D2527         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0  3d9p      -3d6h
2023    Eo 3E2527        18.6     0.      23.2 FIXEDHF     0.800  0       0.0  0
2024    Ep 4D2527         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0  3d9p      -3d7h
2025    Ep 3E2527        21.2     0.      26.5 FIXEDHF     0.800  0       0.0  0
2026    Eq 4D2527         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0  3d9p      -3d8h
2027    Eq 3E2527        20.7     0.      25.9 FIXEDHF     0.800  0       0.0  0
2028    Er 4D2527         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0  3d9p      -3d9h
2029    Er 3E2527        19.4     0.      24.2 FIXEDHF     0.800  0       0.0  0
2030    FG 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d10p     -3d11p
2031    FG 2D2525       683.4     0.     854.2 FIXEDHF     0.800  0       0.0  0
2032    FG 1E2525       198.9     0.     248.6 FIXEDHF     0.800  0       0.0  0
2033    FG 3E2525       214.6     0.     268.3 FIXEDHF     0.800  0       0.0  0
2034    FH 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d10p     -3d12p
2035    FH 2D2525       586.4     0.     733.0 FIXEDHF     0.800  0       0.0  0
2036    FH 1E2525       172.1     0.     215.1 FIXEDHF     0.800  0       0.0  0
2037    FH 3E2525       185.9     0.     232.4 FIXEDHF     0.800  0       0.0  0
2038    FI 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d10p     -3d13p
2039    FI 2D2525       511.1     0.     638.9 FIXEDHF     0.800  0       0.0  0
2040    FI 1E2525       150.9     0.     188.6 FIXEDHF     0.800  0       0.0  0
2041    FI 3E2525       163.1     0.     203.9 FIXEDHF     0.800  0       0.0  0
2042    FJ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d10p     -3d14p
2043    FJ 2D2525       451.0     0.     563.8 FIXEDHF     0.800  0       0.0  0
2044    FJ 1E2525       133.7     0.     167.1 FIXEDHF     0.800  0       0.0  0
2045    FJ 3E2525       144.6     0.     180.8 FIXEDHF     0.800  0       0.0  0
2046    FK 2D2535        38.6     0.      48.2 FIXEDHF     0.800  0       0.0  0  3d10p     -4s4p
2047    FK 1E2535       275.0     0.     343.7 FIXEDHF     0.800  0       0.0  0
2048    FL 2D2535      -399.0     0.    -498.7 FIXEDHF     0.800  0       0.0  0  3d10p     -4s5p
2049    FL 1E2535        31.2     0.      39.0 FIXEDHF     0.800  0       0.0  0
2050    FM 2D2535      -428.9     0.    -536.1 FIXEDHF     0.800  0       0.0  0  3d10p     -4s6p
2051    FM 1E2535        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0
2052    FN 2D2535      -384.3     0.    -480.4 FIXEDHF     0.800  0       0.0  0  3d10p     -4s7p
2053    FN 1E2535        -8.4     0.     -10.5 FIXEDHF     0.800  0       0.0  0
2054    FO 2D2535      -331.8     0.    -414.8 FIXEDHF     0.800  0       0.0  0  3d10p     -4s8p
2055    FO 1E2535        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0
2056    FP 2D2535      -285.7     0.    -357.1 FIXEDHF     0.800  0       0.0  0  3d10p     -4s9p
2057    FP 1E2535        -9.0     0.     -11.3 FIXEDHF     0.800  0       0.0  0
2058    FQ 2D2535      -249.8     0.    -312.2 FIXEDHF     0.800  0       0.0  0  3d10p     -4s10p
2059    FQ 1E2535        -8.2     0.     -10.3 FIXEDHF     0.800  0       0.0  0
2060    FR 2D2535      -197.4     0.    -246.7 FIXEDHF     0.800  0       0.0  0  3d10p     -4s11p
2061    FR 1E2535        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0
2062    FS 2D2535      -163.8     0.    -204.8 FIXEDHF     0.800  0       0.0  0  3d10p     -4s12p
2063    FS 1E2535        -6.6     0.      -8.3 FIXEDHF     0.800  0       0.0  0
2064    FT 2D2535      -139.4     0.    -174.3 FIXEDHF     0.800  0       0.0  0  3d10p     -4s13p
2065    FT 1E2535        -6.0     0.      -7.5 FIXEDHF     0.800  0       0.0  0
2066    FU 2D2526       742.6     0.     928.3 FIXEDHF     0.800  0       0.0  0  3d10p     -3d4f
2067    FU 4D2526       502.3     0.     627.9 FIXEDHF     0.800  0       0.0  0
2068    FU 1E2526       125.1     0.     156.4 FIXEDHF     0.800  0       0.0  0
2069    FU 3E2526       279.5     0.     349.4 FIXEDHF     0.800  0       0.0  0
2070    FV 2D2526       709.3     0.     886.6 FIXEDHF     0.800  0       0.0  0  3d10p     -3d5f
2071    FV 4D2526       405.5     0.     506.9 FIXEDHF     0.800  0       0.0  0
2072    FV 1E2526        27.6     0.      34.5 FIXEDHF     0.800  0       0.0  0
2073    FV 3E2526       164.6     0.     205.7 FIXEDHF     0.800  0       0.0  0
2074    FW 2D2526       605.0     0.     756.2 FIXEDHF     0.800  0       0.0  0  3d10p     -3d6f
2075    FW 4D2526       307.0     0.     383.8 FIXEDHF     0.800  0       0.0  0
2076    FW 1E2526        -9.9     0.     -12.4 FIXEDHF     0.800  0       0.0  0
2077    FW 3E2526       100.0     0.     125.0 FIXEDHF     0.800  0       0.0  0
2078    FX 2D2526       512.7     0.     640.9 FIXEDHF     0.800  0       0.0  0  3d10p     -3d7f
2079    FX 4D2526       238.2     0.     297.8 FIXEDHF     0.800  0       0.0  0
2080    FX 1E2526       -22.7     0.     -28.4 FIXEDHF     0.800  0       0.0  0
2081    FX 3E2526        66.1     0.      82.6 FIXEDHF     0.800  0       0.0  0
2082    FY 2D2526       439.8     0.     549.7 FIXEDHF     0.800  0       0.0  0  3d10p     -3d8f
2083    FY 4D2526       190.8     0.     238.5 FIXEDHF     0.800  0       0.0  0
2084    FY 1E2526       -26.4     0.     -33.0 FIXEDHF     0.800  0       0.0  0
2085    FY 3E2526        46.9     0.      58.6 FIXEDHF     0.800  0       0.0  0
2086    FZ 2D2526       383.2     0.     479.0 FIXEDHF     0.800  0       0.0  0  3d10p     -3d9f
2087    FZ 4D2526       157.0     0.     196.2 FIXEDHF     0.800  0       0.0  0
2088    FZ 1E2526       -26.5     0.     -33.1 FIXEDHF     0.800  0       0.0  0
2089    FZ 3E2526        35.1     0.      43.9 FIXEDHF     0.800  0       0.0  0
2090    Fa 2D2526       355.4     0.     444.3 FIXEDHF     0.800  0       0.0  0  3d10p     -3d10f
2091    Fa 4D2526       132.1     0.     165.1 FIXEDHF     0.800  0       0.0  0
2092    Fa 1E2526       -25.2     0.     -31.5 FIXEDHF     0.800  0       0.0  0
2093    Fa 3E2526        27.4     0.      34.3 FIXEDHF     0.800  0       0.0  0
2094    Fb 2D2526       314.2     0.     392.8 FIXEDHF     0.800  0       0.0  0  3d10p     -3d11f
2095    Fb 4D2526       113.0     0.     141.3 FIXEDHF     0.800  0       0.0  0
2096    Fb 1E2526       -23.5     0.     -29.4 FIXEDHF     0.800  0       0.0  0
2097    Fb 3E2526        22.1     0.      27.6 FIXEDHF     0.800  0       0.0  0
2098    Fc 2D2526       277.8     0.     347.3 FIXEDHF     0.800  0       0.0  0  3d10p     -3d12f
2099    Fc 4D2526        98.2     0.     122.7 FIXEDHF     0.800  0       0.0  0
2100    Fc 1E2526       -21.8     0.     -27.2 FIXEDHF     0.800  0       0.0  0
2101    Fc 3E2526        18.3     0.      22.9 FIXEDHF     0.800  0       0.0  0
2102    Fd 2D2526       247.0     0.     308.7 FIXEDHF     0.800  0       0.0  0  3d10p     -3d13f
2103    Fd 4D2526        86.3     0.     107.9 FIXEDHF     0.800  0       0.0  0
2104    Fd 1E2526       -20.0     0.     -25.0 FIXEDHF     0.800  0       0.0  0
2105    Fd 3E2526        15.5     0.      19.4 FIXEDHF     0.800  0       0.0  0
2106    Fe 2D2536      -436.5     0.    -545.6 FIXEDHF     0.800  0       0.0  0  3d10p     -4s4f
2107    Fe 1E2536     -1549.2     0.   -1936.5 FIXEDHF     0.800  0       0.0  0
2108    Ff 2D2536      -529.7     0.    -662.1 FIXEDHF     0.800  0       0.0  0  3d10p     -4s5f
2109    Ff 1E2536     -1204.5     0.   -1505.6 FIXEDHF     0.800  0       0.0  0
2110    Fg 2D2536      -499.4     0.    -624.3 FIXEDHF     0.800  0       0.0  0  3d10p     -4s6f
2111    Fg 1E2536      -926.3     0.   -1157.9 FIXEDHF     0.800  0       0.0  0
2112    Fh 2D2536      -445.9     0.    -557.4 FIXEDHF     0.800  0       0.0  0  3d10p     -4s7f
2113    Fh 1E2536      -735.2     0.    -919.0 FIXEDHF     0.800  0       0.0  0
2114    Fi 2D2536      -393.9     0.    -492.4 FIXEDHF     0.800  0       0.0  0  3d10p     -4s8f
2115    Fi 1E2536      -599.6     0.    -749.5 FIXEDHF     0.800  0       0.0  0
2116    Fj 2D2536      -349.8     0.    -437.2 FIXEDHF     0.800  0       0.0  0  3d10p     -4s9f
2117    Fj 1E2536      -500.2     0.    -625.3 FIXEDHF     0.800  0       0.0  0
2118    Fk 2D2536      -327.4     0.    -409.3 FIXEDHF     0.800  0       0.0  0  3d10p     -4s10f
2119    Fk 1E2536      -425.2     0.    -531.5 FIXEDHF     0.800  0       0.0  0
2120    Fl 2D2536      -289.0     0.    -361.3 FIXEDHF     0.800  0       0.0  0  3d10p     -4s11f
2121    Fl 1E2536      -367.0     0.    -458.8 FIXEDHF     0.800  0       0.0  0
2122    Fm 2D2536      -255.2     0.    -319.0 FIXEDHF     0.800  0       0.0  0  3d10p     -4s12f
2123    Fm 1E2536      -321.0     0.    -401.2 FIXEDHF     0.800  0       0.0  0
2124    Fn 2D2536      -226.6     0.    -283.2 FIXEDHF     0.800  0       0.0  0  3d10p     -4s13f
2125    Fn 1E2536      -283.8     0.    -354.7 FIXEDHF     0.800  0       0.0  0
2126    Fo 4D2527         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  3d10p     -3d6h
2127    Fo 3E2527        15.4     0.      19.2 FIXEDHF     0.800  0       0.0  0
2128    Fp 4D2527         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0  3d10p     -3d7h
2129    Fp 3E2527        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0
2130    Fq 4D2527         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0  3d10p     -3d8h
2131    Fq 3E2527        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0
2132    Fr 4D2527         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0  3d10p     -3d9h
2133    Fr 3E2527        16.0     0.      20.0 FIXEDHF     0.800  0       0.0  0
2134    GH 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d11p     -3d12p
2135    GH 2D2525       506.0     0.     632.5 FIXEDHF     0.800  0       0.0  0
2136    GH 1E2525       146.6     0.     183.3 FIXEDHF     0.800  0       0.0  0
2137    GH 3E2525       158.6     0.     198.2 FIXEDHF     0.800  0       0.0  0
2138    GI 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d11p     -3d13p
2139    GI 2D2525       440.8     0.     551.0 FIXEDHF     0.800  0       0.0  0
2140    GI 1E2525       128.6     0.     160.7 FIXEDHF     0.800  0       0.0  0
2141    GI 3E2525       139.1     0.     173.9 FIXEDHF     0.800  0       0.0  0
2142    GJ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d11p     -3d14p
2143    GJ 2D2525       388.8     0.     486.0 FIXEDHF     0.800  0       0.0  0
2144    GJ 1E2525       113.9     0.     142.4 FIXEDHF     0.800  0       0.0  0
2145    GJ 3E2525       123.3     0.     154.1 FIXEDHF     0.800  0       0.0  0
2146    GK 2D2535        50.3     0.      62.9 FIXEDHF     0.800  0       0.0  0  3d11p     -4s4p
2147    GK 1E2535       248.8     0.     311.0 FIXEDHF     0.800  0       0.0  0
2148    GL 2D2535      -323.3     0.    -404.1 FIXEDHF     0.800  0       0.0  0  3d11p     -4s5p
2149    GL 1E2535        33.8     0.      42.3 FIXEDHF     0.800  0       0.0  0
2150    GM 2D2535      -351.8     0.    -439.8 FIXEDHF     0.800  0       0.0  0  3d11p     -4s6p
2151    GM 1E2535         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0
2152    GN 2D2535      -316.4     0.    -395.5 FIXEDHF     0.800  0       0.0  0  3d11p     -4s7p
2153    GN 1E2535        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0
2154    GO 2D2535      -273.5     0.    -341.9 FIXEDHF     0.800  0       0.0  0  3d11p     -4s8p
2155    GO 1E2535        -5.7     0.      -7.1 FIXEDHF     0.800  0       0.0  0
2156    GP 2D2535      -235.4     0.    -294.2 FIXEDHF     0.800  0       0.0  0  3d11p     -4s9p
2157    GP 1E2535        -5.8     0.      -7.2 FIXEDHF     0.800  0       0.0  0
2158    GQ 2D2535      -203.8     0.    -254.7 FIXEDHF     0.800  0       0.0  0  3d11p     -4s10p
2159    GQ 1E2535        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0
2160    GR 2D2535      -179.1     0.    -223.9 FIXEDHF     0.800  0       0.0  0  3d11p     -4s11p
2161    GR 1E2535        -5.0     0.      -6.2 FIXEDHF     0.800  0       0.0  0
2162    GS 2D2535      -146.5     0.    -183.1 FIXEDHF     0.800  0       0.0  0  3d11p     -4s12p
2163    GS 1E2535        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0
2164    GT 2D2535      -124.3     0.    -155.4 FIXEDHF     0.800  0       0.0  0  3d11p     -4s13p
2165    GT 1E2535        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0
2166    GU 2D2526       627.0     0.     783.7 FIXEDHF     0.800  0       0.0  0  3d11p     -3d4f
2167    GU 4D2526       426.2     0.     532.7 FIXEDHF     0.800  0       0.0  0
2168    GU 1E2526       108.5     0.     135.6 FIXEDHF     0.800  0       0.0  0
2169    GU 3E2526       240.1     0.     300.1 FIXEDHF     0.800  0       0.0  0
2170    GV 2D2526       597.7     0.     747.1 FIXEDHF     0.800  0       0.0  0  3d11p     -3d5f
2171    GV 4D2526       344.8     0.     431.0 FIXEDHF     0.800  0       0.0  0
2172    GV 1E2526        25.7     0.      32.1 FIXEDHF     0.800  0       0.0  0
2173    GV 3E2526       142.5     0.     178.1 FIXEDHF     0.800  0       0.0  0
2174    GW 2D2526       508.6     0.     635.7 FIXEDHF     0.800  0       0.0  0  3d11p     -3d6f
2175    GW 4D2526       261.5     0.     326.9 FIXEDHF     0.800  0       0.0  0
2176    GW 1E2526        -6.6     0.      -8.2 FIXEDHF     0.800  0       0.0  0
2177    GW 3E2526        87.2     0.     109.0 FIXEDHF     0.800  0       0.0  0
2178    GX 2D2526       429.7     0.     537.1 FIXEDHF     0.800  0       0.0  0  3d11p     -3d7f
2179    GX 4D2526       203.3     0.     254.1 FIXEDHF     0.800  0       0.0  0
2180    GX 1E2526       -17.8     0.     -22.2 FIXEDHF     0.800  0       0.0  0
2181    GX 3E2526        58.0     0.      72.5 FIXEDHF     0.800  0       0.0  0
2182    GY 2D2526       367.2     0.     459.0 FIXEDHF     0.800  0       0.0  0  3d11p     -3d8f
2183    GY 4D2526       163.0     0.     203.7 FIXEDHF     0.800  0       0.0  0
2184    GY 1E2526       -21.1     0.     -26.4 FIXEDHF     0.800  0       0.0  0
2185    GY 3E2526        41.4     0.      51.7 FIXEDHF     0.800  0       0.0  0
2186    GZ 2D2526       318.2     0.     397.8 FIXEDHF     0.800  0       0.0  0  3d11p     -3d9f
2187    GZ 4D2526       134.2     0.     167.7 FIXEDHF     0.800  0       0.0  0
2188    GZ 1E2526       -21.4     0.     -26.7 FIXEDHF     0.800  0       0.0  0
2189    GZ 3E2526        31.1     0.      38.9 FIXEDHF     0.800  0       0.0  0
2190    Ga 2D2526       279.8     0.     349.8 FIXEDHF     0.800  0       0.0  0  3d11p     -3d10f
2191    Ga 4D2526       112.9     0.     141.1 FIXEDHF     0.800  0       0.0  0
2192    Ga 1E2526       -20.5     0.     -25.6 FIXEDHF     0.800  0       0.0  0
2193    Ga 3E2526        24.4     0.      30.5 FIXEDHF     0.800  0       0.0  0
2194    Gb 2D2526       258.5     0.     323.1 FIXEDHF     0.800  0       0.0  0  3d11p     -3d11f
2195    Gb 4D2526        96.7     0.     120.9 FIXEDHF     0.800  0       0.0  0
2196    Gb 1E2526       -19.2     0.     -24.0 FIXEDHF     0.800  0       0.0  0
2197    Gb 3E2526        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0
2198    Gc 2D2526       231.0     0.     288.8 FIXEDHF     0.800  0       0.0  0  3d11p     -3d12f
2199    Gc 4D2526        84.1     0.     105.1 FIXEDHF     0.800  0       0.0  0
2200    Gc 1E2526       -17.8     0.     -22.2 FIXEDHF     0.800  0       0.0  0
2201    Gc 3E2526        16.4     0.      20.5 FIXEDHF     0.800  0       0.0  0
2202    Gd 2D2526       206.6     0.     258.3 FIXEDHF     0.800  0       0.0  0  3d11p     -3d13f
2203    Gd 4D2526        74.0     0.      92.5 FIXEDHF     0.800  0       0.0  0
2204    Gd 1E2526       -16.4     0.     -20.5 FIXEDHF     0.800  0       0.0  0
2205    Gd 3E2526        13.9     0.      17.4 FIXEDHF     0.800  0       0.0  0
2206    Ge 2D2536      -361.3     0.    -451.6 FIXEDHF     0.800  0       0.0  0  3d11p     -4s4f
2207    Ge 1E2536     -1294.6     0.   -1618.2 FIXEDHF     0.800  0       0.0  0
2208    Gf 2D2536      -440.2     0.    -550.3 FIXEDHF     0.800  0       0.0  0  3d11p     -4s5f
2209    Gf 1E2536     -1009.8     0.   -1262.3 FIXEDHF     0.800  0       0.0  0
2210    Gg 2D2536      -415.0     0.    -518.8 FIXEDHF     0.800  0       0.0  0  3d11p     -4s6f
2211    Gg 1E2536      -777.8     0.    -972.2 FIXEDHF     0.800  0       0.0  0
2212    Gh 2D2536      -369.9     0.    -462.4 FIXEDHF     0.800  0       0.0  0  3d11p     -4s7f
2213    Gh 1E2536      -617.8     0.    -772.2 FIXEDHF     0.800  0       0.0  0
2214    Gi 2D2536      -325.8     0.    -407.2 FIXEDHF     0.800  0       0.0  0  3d11p     -4s8f
2215    Gi 1E2536      -504.0     0.    -630.0 FIXEDHF     0.800  0       0.0  0
2216    Gj 2D2536      -287.5     0.    -359.4 FIXEDHF     0.800  0       0.0  0  3d11p     -4s9f
2217    Gj 1E2536      -420.6     0.    -525.7 FIXEDHF     0.800  0       0.0  0
2218    Gk 2D2536      -256.1     0.    -320.1 FIXEDHF     0.800  0       0.0  0  3d11p     -4s10f
2219    Gk 1E2536      -357.6     0.    -447.0 FIXEDHF     0.800  0       0.0  0
2220    Gl 2D2536      -238.1     0.    -297.6 FIXEDHF     0.800  0       0.0  0  3d11p     -4s11f
2221    Gl 1E2536      -308.7     0.    -385.9 FIXEDHF     0.800  0       0.0  0
2222    Gm 2D2536      -212.6     0.    -265.7 FIXEDHF     0.800  0       0.0  0  3d11p     -4s12f
2223    Gm 1E2536      -270.0     0.    -337.5 FIXEDHF     0.800  0       0.0  0
2224    Gn 2D2536      -189.8     0.    -237.3 FIXEDHF     0.800  0       0.0  0  3d11p     -4s13f
2225    Gn 1E2536      -238.7     0.    -298.4 FIXEDHF     0.800  0       0.0  0
2226    Go 4D2527         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  3d11p     -3d6h
2227    Go 3E2527        13.0     0.      16.2 FIXEDHF     0.800  0       0.0  0
2228    Gp 4D2527         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0  3d11p     -3d7h
2229    Gp 3E2527        14.8     0.      18.5 FIXEDHF     0.800  0       0.0  0
2230    Gq 4D2527         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0  3d11p     -3d8h
2231    Gq 3E2527        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0
2232    Gr 4D2527         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0  3d11p     -3d9h
2233    Gr 3E2527        13.5     0.      16.9 FIXEDHF     0.800  0       0.0  0
2234    HI 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d12p     -3d13p
2235    HI 2D2525       385.1     0.     481.4 FIXEDHF     0.800  0       0.0  0
2236    HI 1E2525       111.3     0.     139.1 FIXEDHF     0.800  0       0.0  0
2237    HI 3E2525       120.5     0.     150.6 FIXEDHF     0.800  0       0.0  0
2238    HJ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d12p     -3d14p
2239    HJ 2D2525       339.6     0.     424.5 FIXEDHF     0.800  0       0.0  0
2240    HJ 1E2525        98.6     0.     123.3 FIXEDHF     0.800  0       0.0  0
2241    HJ 3E2525       106.8     0.     133.5 FIXEDHF     0.800  0       0.0  0
2242    HK 2D2535        54.6     0.      68.2 FIXEDHF     0.800  0       0.0  0  3d12p     -4s4p
2243    HK 1E2535       224.5     0.     280.6 FIXEDHF     0.800  0       0.0  0
2244    HL 2D2535      -269.4     0.    -336.7 FIXEDHF     0.800  0       0.0  0  3d12p     -4s5p
2245    HL 1E2535        33.8     0.      42.3 FIXEDHF     0.800  0       0.0  0
2246    HM 2D2535      -296.0     0.    -370.0 FIXEDHF     0.800  0       0.0  0  3d12p     -4s6p
2247    HM 1E2535         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0
2248    HN 2D2535      -267.0     0.    -333.8 FIXEDHF     0.800  0       0.0  0  3d12p     -4s7p
2249    HN 1E2535        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0
2250    HO 2D2535      -231.1     0.    -288.9 FIXEDHF     0.800  0       0.0  0  3d12p     -4s8p
2251    HO 1E2535        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0
2252    HP 2D2535      -198.9     0.    -248.6 FIXEDHF     0.800  0       0.0  0  3d12p     -4s9p
2253    HP 1E2535        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0
2254    HQ 2D2535      -172.1     0.    -215.1 FIXEDHF     0.800  0       0.0  0  3d12p     -4s10p
2255    HQ 1E2535        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0
2256    HR 2D2535      -150.2     0.    -187.8 FIXEDHF     0.800  0       0.0  0  3d12p     -4s11p
2257    HR 1E2535        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0
2258    HS 2D2535      -133.0     0.    -166.3 FIXEDHF     0.800  0       0.0  0  3d12p     -4s12p
2259    HS 1E2535        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0
2260    HT 2D2535      -111.6     0.    -139.5 FIXEDHF     0.800  0       0.0  0  3d12p     -4s13p
2261    HT 1E2535        -3.0     0.      -3.7 FIXEDHF     0.800  0       0.0  0
2262    HU 2D2526       539.1     0.     673.9 FIXEDHF     0.800  0       0.0  0  3d12p     -3d4f
2263    HU 4D2526       367.7     0.     459.6 FIXEDHF     0.800  0       0.0  0
2264    HU 1E2526        95.1     0.     118.9 FIXEDHF     0.800  0       0.0  0
2265    HU 3E2526       209.0     0.     261.3 FIXEDHF     0.800  0       0.0  0
2266    HV 2D2526       513.2     0.     641.5 FIXEDHF     0.800  0       0.0  0  3d12p     -3d5f
2267    HV 4D2526       298.1     0.     372.6 FIXEDHF     0.800  0       0.0  0
2268    HV 1E2526        23.6     0.      29.5 FIXEDHF     0.800  0       0.0  0
2269    HV 3E2526       124.7     0.     155.9 FIXEDHF     0.800  0       0.0  0
2270    HW 2D2526       436.0     0.     545.0 FIXEDHF     0.800  0       0.0  0  3d12p     -3d6f
2271    HW 4D2526       226.4     0.     283.0 FIXEDHF     0.800  0       0.0  0
2272    HW 1E2526        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0
2273    HW 3E2526        76.8     0.      96.0 FIXEDHF     0.800  0       0.0  0
2274    HX 2D2526       367.7     0.     459.6 FIXEDHF     0.800  0       0.0  0  3d12p     -3d7f
2275    HX 4D2526       176.1     0.     220.1 FIXEDHF     0.800  0       0.0  0
2276    HX 1E2526       -14.3     0.     -17.9 FIXEDHF     0.800  0       0.0  0
2277    HX 3E2526        51.3     0.      64.1 FIXEDHF     0.800  0       0.0  0
2278    HY 2D2526       313.5     0.     391.9 FIXEDHF     0.800  0       0.0  0  3d12p     -3d8f
2279    HY 4D2526       141.3     0.     176.6 FIXEDHF     0.800  0       0.0  0
2280    HY 1E2526       -17.4     0.     -21.7 FIXEDHF     0.800  0       0.0  0
2281    HY 3E2526        36.7     0.      45.9 FIXEDHF     0.800  0       0.0  0
2282    HZ 2D2526       270.9     0.     338.6 FIXEDHF     0.800  0       0.0  0  3d12p     -3d9f
2283    HZ 4D2526       116.4     0.     145.5 FIXEDHF     0.800  0       0.0  0
2284    HZ 1E2526       -17.8     0.     -22.2 FIXEDHF     0.800  0       0.0  0
2285    HZ 3E2526        27.8     0.      34.7 FIXEDHF     0.800  0       0.0  0
2286    Ha 2D2526       237.3     0.     296.6 FIXEDHF     0.800  0       0.0  0  3d12p     -3d10f
2287    Ha 4D2526        98.0     0.     122.5 FIXEDHF     0.800  0       0.0  0
2288    Ha 1E2526       -17.1     0.     -21.4 FIXEDHF     0.800  0       0.0  0
2289    Ha 3E2526        21.8     0.      27.3 FIXEDHF     0.800  0       0.0  0
2290    Hb 2D2526       210.5     0.     263.1 FIXEDHF     0.800  0       0.0  0  3d12p     -3d11f
2291    Hb 4D2526        84.0     0.     105.0 FIXEDHF     0.800  0       0.0  0
2292    Hb 1E2526       -16.0     0.     -20.0 FIXEDHF     0.800  0       0.0  0
2293    Hb 3E2526        17.8     0.      22.2 FIXEDHF     0.800  0       0.0  0
2294    Hc 2D2526       194.2     0.     242.7 FIXEDHF     0.800  0       0.0  0  3d12p     -3d12f
2295    Hc 4D2526        73.0     0.      91.3 FIXEDHF     0.800  0       0.0  0
2296    Hc 1E2526       -14.9     0.     -18.6 FIXEDHF     0.800  0       0.0  0
2297    Hc 3E2526        14.8     0.      18.5 FIXEDHF     0.800  0       0.0  0
2298    Hd 2D2526       175.0     0.     218.8 FIXEDHF     0.800  0       0.0  0  3d12p     -3d13f
2299    Hd 4D2526        64.2     0.      80.3 FIXEDHF     0.800  0       0.0  0
2300    Hd 1E2526       -13.8     0.     -17.2 FIXEDHF     0.800  0       0.0  0
2301    Hd 3E2526        12.6     0.      15.7 FIXEDHF     0.800  0       0.0  0
2302    He 2D2536      -306.1     0.    -382.6 FIXEDHF     0.800  0       0.0  0  3d12p     -4s4f
2303    He 1E2536     -1104.6     0.   -1380.7 FIXEDHF     0.800  0       0.0  0
2304    Hf 2D2536      -374.2     0.    -467.7 FIXEDHF     0.800  0       0.0  0  3d12p     -4s5f
2305    Hf 1E2536      -863.8     0.   -1079.8 FIXEDHF     0.800  0       0.0  0
2306    Hg 2D2536      -352.8     0.    -441.0 FIXEDHF     0.800  0       0.0  0  3d12p     -4s6f
2307    Hg 1E2536      -665.9     0.    -832.4 FIXEDHF     0.800  0       0.0  0
2308    Hh 2D2536      -314.1     0.    -392.6 FIXEDHF     0.800  0       0.0  0  3d12p     -4s7f
2309    Hh 1E2536      -529.2     0.    -661.5 FIXEDHF     0.800  0       0.0  0
2310    Hi 2D2536      -276.1     0.    -345.1 FIXEDHF     0.800  0       0.0  0  3d12p     -4s8f
2311    Hi 1E2536      -431.9     0.    -539.9 FIXEDHF     0.800  0       0.0  0
2312    Hj 2D2536      -243.0     0.    -303.8 FIXEDHF     0.800  0       0.0  0  3d12p     -4s9f
2313    Hj 1E2536      -360.5     0.    -450.6 FIXEDHF     0.800  0       0.0  0
2314    Hk 2D2536      -215.4     0.    -269.3 FIXEDHF     0.800  0       0.0  0  3d12p     -4s10f
2315    Hk 1E2536      -306.6     0.    -383.2 FIXEDHF     0.800  0       0.0  0
2316    Hl 2D2536      -192.8     0.    -241.0 FIXEDHF     0.800  0       0.0  0  3d12p     -4s11f
2317    Hl 1E2536      -264.7     0.    -330.9 FIXEDHF     0.800  0       0.0  0
2318    Hm 2D2536      -178.7     0.    -223.4 FIXEDHF     0.800  0       0.0  0  3d12p     -4s12f
2319    Hm 1E2536      -231.5     0.    -289.4 FIXEDHF     0.800  0       0.0  0
2320    Hn 2D2536      -161.0     0.    -201.3 FIXEDHF     0.800  0       0.0  0  3d12p     -4s13f
2321    Hn 1E2536      -204.7     0.    -255.9 FIXEDHF     0.800  0       0.0  0
2322    Ho 4D2527         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0  3d12p     -3d6h
2323    Ho 3E2527        11.1     0.      13.9 FIXEDHF     0.800  0       0.0  0
2324    Hp 4D2527         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  3d12p     -3d7h
2325    Hp 3E2527        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0
2326    Hq 4D2527         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0  3d12p     -3d8h
2327    Hq 3E2527        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0
2328    Hr 4D2527         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0  3d12p     -3d9h
2329    Hr 3E2527        11.7     0.      14.6 FIXEDHF     0.800  0       0.0  0
2330    IJ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d13p     -3d14p
2331    IJ 2D2525       299.9     0.     374.9 FIXEDHF     0.800  0       0.0  0
2332    IJ 1E2525        86.5     0.     108.1 FIXEDHF     0.800  0       0.0  0
2333    IJ 3E2525        93.7     0.     117.1 FIXEDHF     0.800  0       0.0  0
2334    IK 2D2535        55.0     0.      68.8 FIXEDHF     0.800  0       0.0  0  3d13p     -4s4p
2335    IK 1E2535       202.9     0.     253.6 FIXEDHF     0.800  0       0.0  0
2336    IL 2D2535      -229.3     0.    -286.6 FIXEDHF     0.800  0       0.0  0  3d13p     -4s5p
2337    IL 1E2535        32.7     0.      40.9 FIXEDHF     0.800  0       0.0  0
2338    IM 2D2535      -253.9     0.    -317.4 FIXEDHF     0.800  0       0.0  0  3d13p     -4s6p
2339    IM 1E2535         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0
2340    IN 2D2535      -229.6     0.    -287.0 FIXEDHF     0.800  0       0.0  0  3d13p     -4s7p
2341    IN 1E2535         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
2342    IO 2D2535      -199.0     0.    -248.7 FIXEDHF     0.800  0       0.0  0  3d13p     -4s8p
2343    IO 1E2535        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0
2344    IP 2D2535      -171.4     0.    -214.2 FIXEDHF     0.800  0       0.0  0  3d13p     -4s9p
2345    IP 1E2535        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0
2346    IQ 2D2535      -148.2     0.    -185.3 FIXEDHF     0.800  0       0.0  0  3d13p     -4s10p
2347    IQ 1E2535        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0
2348    IR 2D2535      -129.4     0.    -161.7 FIXEDHF     0.800  0       0.0  0  3d13p     -4s11p
2349    IR 1E2535        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0
2350    IS 2D2535      -113.9     0.    -142.4 FIXEDHF     0.800  0       0.0  0  3d13p     -4s12p
2351    IS 1E2535        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0
2352    IT 2D2535      -101.5     0.    -126.9 FIXEDHF     0.800  0       0.0  0  3d13p     -4s13p
2353    IT 1E2535        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0
2354    IU 2D2526       470.4     0.     588.0 FIXEDHF     0.800  0       0.0  0  3d13p     -3d4f
2355    IU 4D2526       321.7     0.     402.1 FIXEDHF     0.800  0       0.0  0
2356    IU 1E2526        84.2     0.     105.2 FIXEDHF     0.800  0       0.0  0
2357    IU 3E2526       184.1     0.     230.1 FIXEDHF     0.800  0       0.0  0
2358    IV 2D2526       447.4     0.     559.2 FIXEDHF     0.800  0       0.0  0  3d13p     -3d5f
2359    IV 4D2526       261.1     0.     326.4 FIXEDHF     0.800  0       0.0  0
2360    IV 1E2526        21.6     0.      27.0 FIXEDHF     0.800  0       0.0  0
2361    IV 3E2526       110.3     0.     137.9 FIXEDHF     0.800  0       0.0  0
2362    IW 2D2526       379.6     0.     474.5 FIXEDHF     0.800  0       0.0  0  3d13p     -3d6f
2363    IW 4D2526       198.5     0.     248.1 FIXEDHF     0.800  0       0.0  0
2364    IW 1E2526        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0
2365    IW 3E2526        68.2     0.      85.2 FIXEDHF     0.800  0       0.0  0
2366    IX 2D2526       319.8     0.     399.7 FIXEDHF     0.800  0       0.0  0  3d13p     -3d7f
2367    IX 4D2526       154.5     0.     193.1 FIXEDHF     0.800  0       0.0  0
2368    IX 1E2526       -11.9     0.     -14.9 FIXEDHF     0.800  0       0.0  0
2369    IX 3E2526        45.7     0.      57.1 FIXEDHF     0.800  0       0.0  0
2370    IY 2D2526       272.2     0.     340.2 FIXEDHF     0.800  0       0.0  0  3d13p     -3d8f
2371    IY 4D2526       124.0     0.     155.0 FIXEDHF     0.800  0       0.0  0
2372    IY 1E2526       -14.6     0.     -18.3 FIXEDHF     0.800  0       0.0  0
2373    IY 3E2526        32.8     0.      41.0 FIXEDHF     0.800  0       0.0  0
2374    IZ 2D2526       234.8     0.     293.5 FIXEDHF     0.800  0       0.0  0  3d13p     -3d9f
2375    IZ 4D2526       102.2     0.     127.8 FIXEDHF     0.800  0       0.0  0
2376    IZ 1E2526       -15.1     0.     -18.9 FIXEDHF     0.800  0       0.0  0
2377    IZ 3E2526        24.9     0.      31.1 FIXEDHF     0.800  0       0.0  0
2378    Ia 2D2526       205.2     0.     256.5 FIXEDHF     0.800  0       0.0  0  3d13p     -3d10f
2379    Ia 4D2526        86.1     0.     107.6 FIXEDHF     0.800  0       0.0  0
2380    Ia 1E2526       -14.6     0.     -18.2 FIXEDHF     0.800  0       0.0  0
2381    Ia 3E2526        19.6     0.      24.5 FIXEDHF     0.800  0       0.0  0
2382    Ib 2D2526       181.4     0.     226.8 FIXEDHF     0.800  0       0.0  0  3d13p     -3d11f
2383    Ib 4D2526        73.8     0.      92.3 FIXEDHF     0.800  0       0.0  0
2384    Ib 1E2526       -13.7     0.     -17.1 FIXEDHF     0.800  0       0.0  0
2385    Ib 3E2526        15.9     0.      19.9 FIXEDHF     0.800  0       0.0  0
2386    Ic 2D2526       162.2     0.     202.7 FIXEDHF     0.800  0       0.0  0  3d13p     -3d12f
2387    Ic 4D2526        64.2     0.      80.3 FIXEDHF     0.800  0       0.0  0
2388    Ic 1E2526       -12.7     0.     -15.9 FIXEDHF     0.800  0       0.0  0
2389    Ic 3E2526        13.3     0.      16.6 FIXEDHF     0.800  0       0.0  0
2390    Id 2D2526       149.7     0.     187.1 FIXEDHF     0.800  0       0.0  0  3d13p     -3d13f
2391    Id 4D2526        56.6     0.      70.7 FIXEDHF     0.800  0       0.0  0
2392    Id 1E2526       -11.8     0.     -14.7 FIXEDHF     0.800  0       0.0  0
2393    Id 3E2526        11.3     0.      14.1 FIXEDHF     0.800  0       0.0  0
2394    Ie 2D2536      -264.1     0.    -330.1 FIXEDHF     0.800  0       0.0  0  3d13p     -4s4f
2395    Ie 1E2536      -958.0     0.   -1197.5 FIXEDHF     0.800  0       0.0  0
2396    If 2D2536      -323.6     0.    -404.5 FIXEDHF     0.800  0       0.0  0  3d13p     -4s5f
2397    If 1E2536      -750.6     0.    -938.3 FIXEDHF     0.800  0       0.0  0
2398    Ig 2D2536      -305.1     0.    -381.4 FIXEDHF     0.800  0       0.0  0  3d13p     -4s6f
2399    Ig 1E2536      -579.1     0.    -723.9 FIXEDHF     0.800  0       0.0  0
2400    Ih 2D2536      -271.5     0.    -339.4 FIXEDHF     0.800  0       0.0  0  3d13p     -4s7f
2401    Ih 1E2536      -460.4     0.    -575.5 FIXEDHF     0.800  0       0.0  0
2402    Ii 2D2536      -238.4     0.    -298.0 FIXEDHF     0.800  0       0.0  0  3d13p     -4s8f
2403    Ii 1E2536      -375.9     0.    -469.9 FIXEDHF     0.800  0       0.0  0
2404    Ij 2D2536      -209.5     0.    -261.9 FIXEDHF     0.800  0       0.0  0  3d13p     -4s9f
2405    Ij 1E2536      -313.8     0.    -392.2 FIXEDHF     0.800  0       0.0  0
2406    Ik 2D2536      -185.4     0.    -231.7 FIXEDHF     0.800  0       0.0  0  3d13p     -4s10f
2407    Ik 1E2536      -266.8     0.    -333.5 FIXEDHF     0.800  0       0.0  0
2408    Il 2D2536      -165.3     0.    -206.6 FIXEDHF     0.800  0       0.0  0  3d13p     -4s11f
2409    Il 1E2536      -230.4     0.    -288.0 FIXEDHF     0.800  0       0.0  0
2410    Im 2D2536      -148.6     0.    -185.8 FIXEDHF     0.800  0       0.0  0  3d13p     -4s12f
2411    Im 1E2536      -201.5     0.    -251.9 FIXEDHF     0.800  0       0.0  0
2412    In 2D2536      -137.8     0.    -172.2 FIXEDHF     0.800  0       0.0  0  3d13p     -4s13f
2413    In 1E2536      -178.2     0.    -222.8 FIXEDHF     0.800  0       0.0  0
2414    Io 4D2527         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  3d13p     -3d6h
2415    Io 3E2527         9.8     0.      12.2 FIXEDHF     0.800  0       0.0  0
2416    Ip 4D2527         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  3d13p     -3d7h
2417    Ip 3E2527        11.1     0.      13.9 FIXEDHF     0.800  0       0.0  0
2418    Iq 4D2527         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0  3d13p     -3d8h
2419    Iq 3E2527        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0
2420    Ir 4D2527         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  3d13p     -3d9h
2421    Ir 3E2527        10.2     0.      12.7 FIXEDHF     0.800  0       0.0  0
2422    JK 2D2535        53.8     0.      67.2 FIXEDHF     0.800  0       0.0  0  3d14p     -4s4p
2423    JK 1E2535       183.9     0.     229.9 FIXEDHF     0.800  0       0.0  0
2424    JL 2D2535      -198.5     0.    -248.1 FIXEDHF     0.800  0       0.0  0  3d14p     -4s5p
2425    JL 1E2535        31.0     0.      38.8 FIXEDHF     0.800  0       0.0  0
2426    JM 2D2535      -221.2     0.    -276.5 FIXEDHF     0.800  0       0.0  0  3d14p     -4s6p
2427    JM 1E2535         7.4     0.       9.2 FIXEDHF     0.800  0       0.0  0
2428    JN 2D2535      -200.5     0.    -250.6 FIXEDHF     0.800  0       0.0  0  3d14p     -4s7p
2429    JN 1E2535         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0
2430    JO 2D2535      -173.8     0.    -217.3 FIXEDHF     0.800  0       0.0  0  3d14p     -4s8p
2431    JO 1E2535        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0
2432    JP 2D2535      -149.8     0.    -187.2 FIXEDHF     0.800  0       0.0  0  3d14p     -4s9p
2433    JP 1E2535        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0
2434    JQ 2D2535      -129.7     0.    -162.1 FIXEDHF     0.800  0       0.0  0  3d14p     -4s10p
2435    JQ 1E2535        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0
2436    JR 2D2535      -113.1     0.    -141.4 FIXEDHF     0.800  0       0.0  0  3d14p     -4s11p
2437    JR 1E2535        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0
2438    JS 2D2535       -99.5     0.    -124.4 FIXEDHF     0.800  0       0.0  0  3d14p     -4s12p
2439    JS 1E2535        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0
2440    JT 2D2535       -88.3     0.    -110.4 FIXEDHF     0.800  0       0.0  0  3d14p     -4s13p
2441    JT 1E2535        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0
2442    JU 2D2526       415.4     0.     519.3 FIXEDHF     0.800  0       0.0  0  3d14p     -3d4f
2443    JU 4D2526       284.6     0.     355.8 FIXEDHF     0.800  0       0.0  0
2444    JU 1E2526        75.2     0.      94.0 FIXEDHF     0.800  0       0.0  0
2445    JU 3E2526       163.8     0.     204.7 FIXEDHF     0.800  0       0.0  0
2446    JV 2D2526       394.7     0.     493.4 FIXEDHF     0.800  0       0.0  0  3d14p     -3d5f
2447    JV 4D2526       231.2     0.     289.0 FIXEDHF     0.800  0       0.0  0
2448    JV 1E2526        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0
2449    JV 3E2526        98.5     0.     123.1 FIXEDHF     0.800  0       0.0  0
2450    JW 2D2526       334.6     0.     418.3 FIXEDHF     0.800  0       0.0  0  3d14p     -3d6f
2451    JW 4D2526       175.9     0.     219.9 FIXEDHF     0.800  0       0.0  0
2452    JW 1E2526        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0
2453    JW 3E2526        61.0     0.      76.3 FIXEDHF     0.800  0       0.0  0
2454    JX 2D2526       281.6     0.     352.0 FIXEDHF     0.800  0       0.0  0  3d14p     -3d7f
2455    JX 4D2526       137.0     0.     171.3 FIXEDHF     0.800  0       0.0  0
2456    JX 1E2526       -10.1     0.     -12.6 FIXEDHF     0.800  0       0.0  0
2457    JX 3E2526        41.0     0.      51.3 FIXEDHF     0.800  0       0.0  0
2458    JY 2D2526       239.4     0.     299.3 FIXEDHF     0.800  0       0.0  0  3d14p     -3d8f
2459    JY 4D2526       110.0     0.     137.5 FIXEDHF     0.800  0       0.0  0
2460    JY 1E2526       -12.6     0.     -15.8 FIXEDHF     0.800  0       0.0  0
2461    JY 3E2526        29.5     0.      36.9 FIXEDHF     0.800  0       0.0  0
2462    JZ 2D2526       206.3     0.     257.9 FIXEDHF     0.800  0       0.0  0  3d14p     -3d9f
2463    JZ 4D2526        90.7     0.     113.4 FIXEDHF     0.800  0       0.0  0
2464    JZ 1E2526       -13.0     0.     -16.3 FIXEDHF     0.800  0       0.0  0
2465    JZ 3E2526        22.4     0.      28.0 FIXEDHF     0.800  0       0.0  0
2466    Ja 2D2526       180.1     0.     225.1 FIXEDHF     0.800  0       0.0  0  3d14p     -3d10f
2467    Ja 4D2526        76.5     0.      95.6 FIXEDHF     0.800  0       0.0  0
2468    Ja 1E2526       -12.6     0.     -15.8 FIXEDHF     0.800  0       0.0  0
2469    Ja 3E2526        17.7     0.      22.1 FIXEDHF     0.800  0       0.0  0
2470    Jb 2D2526       159.0     0.     198.7 FIXEDHF     0.800  0       0.0  0  3d14p     -3d11f
2471    Jb 4D2526        65.5     0.      81.9 FIXEDHF     0.800  0       0.0  0
2472    Jb 1E2526       -11.8     0.     -14.8 FIXEDHF     0.800  0       0.0  0
2473    Jb 3E2526        14.4     0.      18.0 FIXEDHF     0.800  0       0.0  0
2474    Jc 2D2526       141.7     0.     177.1 FIXEDHF     0.800  0       0.0  0  3d14p     -3d12f
2475    Jc 4D2526        57.0     0.      71.3 FIXEDHF     0.800  0       0.0  0
2476    Jc 1E2526       -11.0     0.     -13.8 FIXEDHF     0.800  0       0.0  0
2477    Jc 3E2526        12.0     0.      15.0 FIXEDHF     0.800  0       0.0  0
2478    Jd 2D2526       127.6     0.     159.5 FIXEDHF     0.800  0       0.0  0  3d14p     -3d13f
2479    Jd 4D2526        50.2     0.      62.8 FIXEDHF     0.800  0       0.0  0
2480    Jd 1E2526       -10.2     0.     -12.8 FIXEDHF     0.800  0       0.0  0
2481    Jd 3E2526        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0
2482    Je 2D2536      -231.1     0.    -288.9 FIXEDHF     0.800  0       0.0  0  3d14p     -4s4f
2483    Je 1E2536      -841.9     0.   -1052.4 FIXEDHF     0.800  0       0.0  0
2484    Jf 2D2536      -283.7     0.    -354.6 FIXEDHF     0.800  0       0.0  0  3d14p     -4s5f
2485    Jf 1E2536      -660.7     0.    -825.9 FIXEDHF     0.800  0       0.0  0
2486    Jg 2D2536      -267.6     0.    -334.5 FIXEDHF     0.800  0       0.0  0  3d14p     -4s6f
2487    Jg 1E2536      -510.0     0.    -637.5 FIXEDHF     0.800  0       0.0  0
2488    Jh 2D2536      -238.0     0.    -297.5 FIXEDHF     0.800  0       0.0  0  3d14p     -4s7f
2489    Jh 1E2536      -405.6     0.    -507.0 FIXEDHF     0.800  0       0.0  0
2490    Ji 2D2536      -208.8     0.    -261.0 FIXEDHF     0.800  0       0.0  0  3d14p     -4s8f
2491    Ji 1E2536      -331.2     0.    -414.0 FIXEDHF     0.800  0       0.0  0
2492    Jj 2D2536      -183.4     0.    -229.2 FIXEDHF     0.800  0       0.0  0  3d14p     -4s9f
2493    Jj 1E2536      -276.6     0.    -345.7 FIXEDHF     0.800  0       0.0  0
2494    Jk 2D2536      -162.0     0.    -202.5 FIXEDHF     0.800  0       0.0  0  3d14p     -4s10f
2495    Jk 1E2536      -235.2     0.    -294.0 FIXEDHF     0.800  0       0.0  0
2496    Jl 2D2536      -144.2     0.    -180.2 FIXEDHF     0.800  0       0.0  0  3d14p     -4s11f
2497    Jl 1E2536      -203.1     0.    -253.9 FIXEDHF     0.800  0       0.0  0
2498    Jm 2D2536      -129.4     0.    -161.7 FIXEDHF     0.800  0       0.0  0  3d14p     -4s12f
2499    Jm 1E2536      -177.7     0.    -222.1 FIXEDHF     0.800  0       0.0  0
2500    Jn 2D2536      -117.0     0.    -146.3 FIXEDHF     0.800  0       0.0  0  3d14p     -4s13f
2501    Jn 1E2536      -157.1     0.    -196.4 FIXEDHF     0.800  0       0.0  0
2502    Jo 4D2527         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  3d14p     -3d6h
2503    Jo 3E2527         8.6     0.      10.8 FIXEDHF     0.800  0       0.0  0
2504    Jp 4D2527         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0  3d14p     -3d7h
2505    Jp 3E2527         9.8     0.      12.3 FIXEDHF     0.800  0       0.0  0
2506    Jq 4D2527         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  3d14p     -3d8h
2507    Jq 3E2527         9.6     0.      12.0 FIXEDHF     0.800  0       0.0  0
2508    Jr 4D2527         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  3d14p     -3d9h
2509    Jr 3E2527         9.0     0.      11.2 FIXEDHF     0.800  0       0.0  0
2510    KL 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4p      -4s5p
2511    KL 1E3535     12316.4     0.   15395.5 FIXEDHF     0.800  0       0.0  0
2512    KM 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4p      -4s6p
2513    KM 1E3535      5534.9     0.    6918.6 FIXEDHF     0.800  0       0.0  0
2514    KN 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4p      -4s7p
2515    KN 1E3535      3229.0     0.    4036.2 FIXEDHF     0.800  0       0.0  0
2516    KO 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4p      -4s8p
2517    KO 1E3535      2164.7     0.    2705.9 FIXEDHF     0.800  0       0.0  0
2518    KP 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4p      -4s9p
2519    KP 1E3535      1580.6     0.    1975.8 FIXEDHF     0.800  0       0.0  0
2520    KQ 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4p      -4s10p
2521    KQ 1E3535      1221.8     0.    1527.3 FIXEDHF     0.800  0       0.0  0
2522    KR 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4p      -4s11p
2523    KR 1E3535       983.2     0.    1229.0 FIXEDHF     0.800  0       0.0  0
2524    KS 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4p      -4s12p
2525    KS 1E3535       815.0     0.    1018.8 FIXEDHF     0.800  0       0.0  0
2526    KT 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4p      -4s13p
2527    KT 1E3535       691.0     0.     863.8 FIXEDHF     0.800  0       0.0  0
2528    KU 2D3526    -11746.9     0.  -14683.6 FIXEDHF     0.800  0       0.0  0  4s4p      -3d4f
2529    KU 3E3526     -9474.7     0.  -11843.4 FIXEDHF     0.800  0       0.0  0
2530    KV 2D3526     -5824.0     0.   -7280.0 FIXEDHF     0.800  0       0.0  0  4s4p      -3d5f
2531    KV 3E3526     -5237.0     0.   -6546.2 FIXEDHF     0.800  0       0.0  0
2532    KW 2D3526     -3429.3     0.   -4286.6 FIXEDHF     0.800  0       0.0  0  4s4p      -3d6f
2533    KW 3E3526     -3268.3     0.   -4085.4 FIXEDHF     0.800  0       0.0  0
2534    KX 2D3526     -2300.4     0.   -2875.5 FIXEDHF     0.800  0       0.0  0  4s4p      -3d7f
2535    KX 3E3526     -2272.9     0.   -2841.1 FIXEDHF     0.800  0       0.0  0
2536    KY 2D3526     -1680.5     0.   -2100.6 FIXEDHF     0.800  0       0.0  0  4s4p      -3d8f
2537    KY 3E3526     -1700.8     0.   -2126.0 FIXEDHF     0.800  0       0.0  0
2538    KZ 2D3526     -1299.9     0.   -1624.9 FIXEDHF     0.800  0       0.0  0  4s4p      -3d9f
2539    KZ 3E3526     -1338.2     0.   -1672.7 FIXEDHF     0.800  0       0.0  0
2540    Ka 2D3526     -1047.0     0.   -1308.7 FIXEDHF     0.800  0       0.0  0  4s4p      -3d10f
2541    Ka 3E3526     -1091.2     0.   -1364.0 FIXEDHF     0.800  0       0.0  0
2542    Kb 2D3526      -868.6     0.   -1085.7 FIXEDHF     0.800  0       0.0  0  4s4p      -3d11f
2543    Kb 3E3526      -913.8     0.   -1142.2 FIXEDHF     0.800  0       0.0  0
2544    Kc 2D3526      -737.0     0.    -921.2 FIXEDHF     0.800  0       0.0  0  4s4p      -3d12f
2545    Kc 3E3526      -781.0     0.    -976.2 FIXEDHF     0.800  0       0.0  0
2546    Kd 2D3526      -636.5     0.    -795.6 FIXEDHF     0.800  0       0.0  0  4s4p      -3d13f
2547    Kd 3E3526      -678.3     0.    -847.9 FIXEDHF     0.800  0       0.0  0
2548    LM 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s6p
2549    LM 1E3535      3728.3     0.    4660.4 FIXEDHF     0.800  0       0.0  0
2550    LN 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s7p
2551    LN 1E3535      2523.4     0.    3154.3 FIXEDHF     0.800  0       0.0  0
2552    LO 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s8p
2553    LO 1E3535      1859.1     0.    2323.9 FIXEDHF     0.800  0       0.0  0
2554    LP 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s9p
2555    LP 1E3535      1448.2     0.    1810.2 FIXEDHF     0.800  0       0.0  0
2556    LQ 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s10p
2557    LQ 1E3535      1172.5     0.    1465.6 FIXEDHF     0.800  0       0.0  0
2558    LR 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s11p
2559    LR 1E3535       976.5     0.    1220.6 FIXEDHF     0.800  0       0.0  0
2560    LS 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s12p
2561    LS 1E3535       830.8     0.    1038.5 FIXEDHF     0.800  0       0.0  0
2562    LT 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s13p
2563    LT 1E3535       719.0     0.     898.7 FIXEDHF     0.800  0       0.0  0
2564    LU 2D3526     -1846.2     0.   -2307.7 FIXEDHF     0.800  0       0.0  0  4s5p      -3d4f
2565    LU 3E3526     -4466.6     0.   -5583.3 FIXEDHF     0.800  0       0.0  0
2566    LV 2D3526     -4031.8     0.   -5039.7 FIXEDHF     0.800  0       0.0  0  4s5p      -3d5f
2567    LV 3E3526     -2832.2     0.   -3540.3 FIXEDHF     0.800  0       0.0  0
2568    LW 2D3526     -2900.2     0.   -3625.2 FIXEDHF     0.800  0       0.0  0  4s5p      -3d6f
2569    LW 3E3526     -1904.2     0.   -2380.2 FIXEDHF     0.800  0       0.0  0
2570    LX 2D3526     -2136.4     0.   -2670.5 FIXEDHF     0.800  0       0.0  0  4s5p      -3d7f
2571    LX 3E3526     -1385.8     0.   -1732.3 FIXEDHF     0.800  0       0.0  0
2572    LY 2D3526     -1649.6     0.   -2062.0 FIXEDHF     0.800  0       0.0  0  4s5p      -3d8f
2573    LY 3E3526     -1068.6     0.   -1335.8 FIXEDHF     0.800  0       0.0  0
2574    LZ 2D3526     -1323.5     0.   -1654.4 FIXEDHF     0.800  0       0.0  0  4s5p      -3d9f
2575    LZ 3E3526      -858.5     0.   -1073.1 FIXEDHF     0.800  0       0.0  0
2576    La 2D3526     -1093.6     0.   -1367.0 FIXEDHF     0.800  0       0.0  0  4s5p      -3d10f
2577    La 3E3526      -710.6     0.    -888.3 FIXEDHF     0.800  0       0.0  0
2578    Lb 2D3526      -924.5     0.   -1155.6 FIXEDHF     0.800  0       0.0  0  4s5p      -3d11f
2579    Lb 3E3526      -601.8     0.    -752.2 FIXEDHF     0.800  0       0.0  0
2580    Lc 2D3526      -795.7     0.    -994.6 FIXEDHF     0.800  0       0.0  0  4s5p      -3d12f
2581    Lc 3E3526      -518.8     0.    -648.5 FIXEDHF     0.800  0       0.0  0
2582    Ld 2D3526      -694.8     0.    -868.5 FIXEDHF     0.800  0       0.0  0  4s5p      -3d13f
2583    Ld 3E3526      -453.6     0.    -567.0 FIXEDHF     0.800  0       0.0  0
2584    MN 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s7p
2585    MN 1E3535      1665.8     0.    2082.2 FIXEDHF     0.800  0       0.0  0
2586    MO 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s8p
2587    MO 1E3535      1253.7     0.    1567.1 FIXEDHF     0.800  0       0.0  0
2588    MP 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s9p
2589    MP 1E3535       989.9     0.    1237.4 FIXEDHF     0.800  0       0.0  0
2590    MQ 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s10p
2591    MQ 1E3535       809.0     0.    1011.3 FIXEDHF     0.800  0       0.0  0
2592    MR 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s11p
2593    MR 1E3535       678.2     0.     847.8 FIXEDHF     0.800  0       0.0  0
2594    MS 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s12p
2595    MS 1E3535       580.0     0.     725.0 FIXEDHF     0.800  0       0.0  0
2596    MT 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s13p
2597    MT 1E3535       503.8     0.     629.7 FIXEDHF     0.800  0       0.0  0
2598    MU 2D3526      -978.0     0.   -1222.5 FIXEDHF     0.800  0       0.0  0  4s6p      -3d4f
2599    MU 3E3526     -2805.1     0.   -3506.4 FIXEDHF     0.800  0       0.0  0
2600    MV 2D3526     -1382.1     0.   -1727.6 FIXEDHF     0.800  0       0.0  0  4s6p      -3d5f
2601    MV 3E3526     -1859.6     0.   -2324.5 FIXEDHF     0.800  0       0.0  0
2602    MW 2D3526     -1852.5     0.   -2315.6 FIXEDHF     0.800  0       0.0  0  4s6p      -3d6f
2603    MW 3E3526     -1280.4     0.   -1600.5 FIXEDHF     0.800  0       0.0  0
2604    MX 2D3526     -1509.3     0.   -1886.6 FIXEDHF     0.800  0       0.0  0  4s6p      -3d7f
2605    MX 3E3526      -945.4     0.   -1181.8 FIXEDHF     0.800  0       0.0  0
2606    MY 2D3526     -1218.0     0.   -1522.5 FIXEDHF     0.800  0       0.0  0  4s6p      -3d8f
2607    MY 3E3526      -735.8     0.    -919.8 FIXEDHF     0.800  0       0.0  0
2608    MZ 2D3526     -1001.8     0.   -1252.3 FIXEDHF     0.800  0       0.0  0  4s6p      -3d9f
2609    MZ 3E3526      -595.0     0.    -743.7 FIXEDHF     0.800  0       0.0  0
2610    Ma 2D3526      -841.0     0.   -1051.3 FIXEDHF     0.800  0       0.0  0  4s6p      -3d10f
2611    Ma 3E3526      -494.7     0.    -618.4 FIXEDHF     0.800  0       0.0  0
2612    Mb 2D3526      -718.8     0.    -898.5 FIXEDHF     0.800  0       0.0  0  4s6p      -3d11f
2613    Mb 3E3526      -420.4     0.    -525.5 FIXEDHF     0.800  0       0.0  0
2614    Mc 2D3526      -623.5     0.    -779.4 FIXEDHF     0.800  0       0.0  0  4s6p      -3d12f
2615    Mc 3E3526      -363.3     0.    -454.1 FIXEDHF     0.800  0       0.0  0
2616    Md 2D3526      -547.7     0.    -684.6 FIXEDHF     0.800  0       0.0  0  4s6p      -3d13f
2617    Md 3E3526      -318.3     0.    -397.9 FIXEDHF     0.800  0       0.0  0
2618    NO 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s8p
2619    NO 1E3535       905.0     0.    1131.3 FIXEDHF     0.800  0       0.0  0
2620    NP 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s9p
2621    NP 1E3535       719.3     0.     899.1 FIXEDHF     0.800  0       0.0  0
2622    NQ 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s10p
2623    NQ 1E3535       590.4     0.     738.0 FIXEDHF     0.800  0       0.0  0
2624    NR 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s11p
2625    NR 1E3535       496.5     0.     620.6 FIXEDHF     0.800  0       0.0  0
2626    NS 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s12p
2627    NS 1E3535       425.5     0.     531.9 FIXEDHF     0.800  0       0.0  0
2628    NT 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s13p
2629    NT 1E3535       370.2     0.     462.8 FIXEDHF     0.800  0       0.0  0
2630    NU 2D3526      -621.8     0.    -777.3 FIXEDHF     0.800  0       0.0  0  4s7p      -3d4f
2631    NU 3E3526     -1985.0     0.   -2481.2 FIXEDHF     0.800  0       0.0  0
2632    NV 2D3526      -883.3     0.   -1104.1 FIXEDHF     0.800  0       0.0  0  4s7p      -3d5f
2633    NV 3E3526     -1344.4     0.   -1680.5 FIXEDHF     0.800  0       0.0  0
2634    NW 2D3526      -895.3     0.   -1119.1 FIXEDHF     0.800  0       0.0  0  4s7p      -3d6f
2635    NW 3E3526      -936.4     0.   -1170.5 FIXEDHF     0.800  0       0.0  0
2636    NX 2D3526     -1007.4     0.   -1259.3 FIXEDHF     0.800  0       0.0  0  4s7p      -3d7f
2637    NX 3E3526      -696.2     0.    -870.3 FIXEDHF     0.800  0       0.0  0
2638    NY 2D3526      -865.9     0.   -1082.4 FIXEDHF     0.800  0       0.0  0  4s7p      -3d8f
2639    NY 3E3526      -544.3     0.    -680.4 FIXEDHF     0.800  0       0.0  0
2640    NZ 2D3526      -733.0     0.    -916.2 FIXEDHF     0.800  0       0.0  0  4s7p      -3d9f
2641    NZ 3E3526      -441.4     0.    -551.8 FIXEDHF     0.800  0       0.0  0
2642    Na 2D3526      -625.5     0.    -781.9 FIXEDHF     0.800  0       0.0  0  4s7p      -3d10f
2643    Na 3E3526      -367.9     0.    -459.9 FIXEDHF     0.800  0       0.0  0
2644    Nb 2D3526      -540.2     0.    -675.3 FIXEDHF     0.800  0       0.0  0  4s7p      -3d11f
2645    Nb 3E3526      -313.1     0.    -391.4 FIXEDHF     0.800  0       0.0  0
2646    Nc 2D3526      -472.0     0.    -590.0 FIXEDHF     0.800  0       0.0  0  4s7p      -3d12f
2647    Nc 3E3526      -271.0     0.    -338.7 FIXEDHF     0.800  0       0.0  0
2648    Nd 2D3526      -416.9     0.    -521.1 FIXEDHF     0.800  0       0.0  0  4s7p      -3d13f
2649    Nd 3E3526      -237.6     0.    -297.0 FIXEDHF     0.800  0       0.0  0
2650    OP 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s9p
2651    OP 1E3535       552.1     0.     690.1 FIXEDHF     0.800  0       0.0  0
2652    OQ 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s10p
2653    OQ 1E3535       454.2     0.     567.8 FIXEDHF     0.800  0       0.0  0
2654    OR 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s11p
2655    OR 1E3535       382.7     0.     478.4 FIXEDHF     0.800  0       0.0  0
2656    OS 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s12p
2657    OS 1E3535       328.4     0.     410.5 FIXEDHF     0.800  0       0.0  0
2658    OT 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s13p
2659    OT 1E3535       286.1     0.     357.6 FIXEDHF     0.800  0       0.0  0
2660    OU 2D3526      -441.0     0.    -551.2 FIXEDHF     0.800  0       0.0  0  4s8p      -3d4f
2661    OU 3E3526     -1507.0     0.   -1883.8 FIXEDHF     0.800  0       0.0  0
2662    OV 2D3526      -630.5     0.    -788.1 FIXEDHF     0.800  0       0.0  0  4s8p      -3d5f
2663    OV 3E3526     -1033.1     0.   -1291.4 FIXEDHF     0.800  0       0.0  0
2664    OW 2D3526      -634.6     0.    -793.2 FIXEDHF     0.800  0       0.0  0  4s8p      -3d6f
2665    OW 3E3526      -724.3     0.    -905.4 FIXEDHF     0.800  0       0.0  0
2666    OX 2D3526      -591.6     0.    -739.5 FIXEDHF     0.800  0       0.0  0  4s8p      -3d7f
2667    OX 3E3526      -540.6     0.    -675.8 FIXEDHF     0.800  0       0.0  0
2668    OY 2D3526      -612.5     0.    -765.6 FIXEDHF     0.800  0       0.0  0  4s8p      -3d8f
2669    OY 3E3526      -423.8     0.    -529.7 FIXEDHF     0.800  0       0.0  0
2670    OZ 2D3526      -540.5     0.    -675.6 FIXEDHF     0.800  0       0.0  0  4s8p      -3d9f
2671    OZ 3E3526      -344.3     0.    -430.4 FIXEDHF     0.800  0       0.0  0
2672    Oa 2D3526      -470.4     0.    -588.0 FIXEDHF     0.800  0       0.0  0  4s8p      -3d10f
2673    Oa 3E3526      -287.3     0.    -359.1 FIXEDHF     0.800  0       0.0  0
2674    Ob 2D3526      -411.0     0.    -513.8 FIXEDHF     0.800  0       0.0  0  4s8p      -3d11f
2675    Ob 3E3526      -244.7     0.    -305.9 FIXEDHF     0.800  0       0.0  0
2676    Oc 2D3526      -361.9     0.    -452.4 FIXEDHF     0.800  0       0.0  0  4s8p      -3d12f
2677    Oc 3E3526      -211.9     0.    -264.9 FIXEDHF     0.800  0       0.0  0
2678    Od 2D3526      -321.3     0.    -401.6 FIXEDHF     0.800  0       0.0  0  4s8p      -3d13f
2679    Od 3E3526      -186.0     0.    -232.5 FIXEDHF     0.800  0       0.0  0
2680    PQ 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s10p
2681    PQ 1E3535       363.8     0.     454.7 FIXEDHF     0.800  0       0.0  0
2682    PR 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s11p
2683    PR 1E3535       306.8     0.     383.5 FIXEDHF     0.800  0       0.0  0
2684    PS 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s12p
2685    PS 1E3535       263.5     0.     329.4 FIXEDHF     0.800  0       0.0  0
2686    PT 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s13p
2687    PT 1E3535       229.7     0.     287.1 FIXEDHF     0.800  0       0.0  0
2688    PU 2D3526      -334.8     0.    -418.5 FIXEDHF     0.800  0       0.0  0  4s9p      -3d4f
2689    PU 3E3526     -1198.5     0.   -1498.1 FIXEDHF     0.800  0       0.0  0
2690    PV 2D3526      -482.0     0.    -602.5 FIXEDHF     0.800  0       0.0  0  4s9p      -3d5f
2691    PV 3E3526      -827.9     0.   -1034.9 FIXEDHF     0.800  0       0.0  0
2692    PW 2D3526      -483.6     0.    -604.5 FIXEDHF     0.800  0       0.0  0  4s9p      -3d6f
2693    PW 3E3526      -582.9     0.    -728.6 FIXEDHF     0.800  0       0.0  0
2694    PX 2D3526      -447.7     0.    -559.6 FIXEDHF     0.800  0       0.0  0  4s9p      -3d7f
2695    PX 3E3526      -436.1     0.    -545.1 FIXEDHF     0.800  0       0.0  0
2696    PY 2D3526      -406.4     0.    -508.0 FIXEDHF     0.800  0       0.0  0  4s9p      -3d8f
2697    PY 3E3526      -342.4     0.    -428.0 FIXEDHF     0.800  0       0.0  0
2698    PZ 2D3526      -402.4     0.    -503.0 FIXEDHF     0.800  0       0.0  0  4s9p      -3d9f
2699    PZ 3E3526      -278.5     0.    -348.1 FIXEDHF     0.800  0       0.0  0
2700    Pa 2D3526      -360.3     0.    -450.4 FIXEDHF     0.800  0       0.0  0  4s9p      -3d10f
2701    Pa 3E3526      -232.6     0.    -290.7 FIXEDHF     0.800  0       0.0  0
2702    Pb 2D3526      -319.3     0.    -399.1 FIXEDHF     0.800  0       0.0  0  4s9p      -3d11f
2703    Pb 3E3526      -198.2     0.    -247.8 FIXEDHF     0.800  0       0.0  0
2704    Pc 2D3526      -283.5     0.    -354.4 FIXEDHF     0.800  0       0.0  0  4s9p      -3d12f
2705    Pc 3E3526      -171.7     0.    -214.6 FIXEDHF     0.800  0       0.0  0
2706    Pd 2D3526      -253.1     0.    -316.4 FIXEDHF     0.800  0       0.0  0  4s9p      -3d13f
2707    Pd 3E3526      -150.7     0.    -188.4 FIXEDHF     0.800  0       0.0  0
2708    QR 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s11p
2709    QR 1E3535       253.3     0.     316.6 FIXEDHF     0.800  0       0.0  0
2710    QS 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s12p
2711    QS 1E3535       217.7     0.     272.1 FIXEDHF     0.800  0       0.0  0
2712    QT 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s13p
2713    QT 1E3535       189.8     0.     237.2 FIXEDHF     0.800  0       0.0  0
2714    QU 2D3526      -266.2     0.    -332.8 FIXEDHF     0.800  0       0.0  0  4s10p     -3d4f
2715    QU 3E3526      -984.8     0.   -1231.0 FIXEDHF     0.800  0       0.0  0
2716    QV 2D3526      -385.5     0.    -481.9 FIXEDHF     0.800  0       0.0  0  4s10p     -3d5f
2717    QV 3E3526      -683.8     0.    -854.7 FIXEDHF     0.800  0       0.0  0
2718    QW 2D3526      -386.4     0.    -483.0 FIXEDHF     0.800  0       0.0  0  4s10p     -3d6f
2719    QW 3E3526      -482.7     0.    -603.4 FIXEDHF     0.800  0       0.0  0
2720    QX 2D3526      -356.3     0.    -445.4 FIXEDHF     0.800  0       0.0  0  4s10p     -3d7f
2721    QX 3E3526      -361.8     0.    -452.3 FIXEDHF     0.800  0       0.0  0
2722    QY 2D3526      -321.6     0.    -402.0 FIXEDHF     0.800  0       0.0  0  4s10p     -3d8f
2723    QY 3E3526      -284.3     0.    -355.4 FIXEDHF     0.800  0       0.0  0
2724    QZ 2D3526      -289.7     0.    -362.1 FIXEDHF     0.800  0       0.0  0  4s10p     -3d9f
2725    QZ 3E3526      -231.4     0.    -289.3 FIXEDHF     0.800  0       0.0  0
2726    Qa 2D3526      -279.7     0.    -349.6 FIXEDHF     0.800  0       0.0  0  4s10p     -3d10f
2727    Qa 3E3526      -193.4     0.    -241.7 FIXEDHF     0.800  0       0.0  0
2728    Qb 2D3526      -252.8     0.    -316.0 FIXEDHF     0.800  0       0.0  0  4s10p     -3d11f
2729    Qb 3E3526      -164.9     0.    -206.1 FIXEDHF     0.800  0       0.0  0
2730    Qc 2D3526      -226.7     0.    -283.4 FIXEDHF     0.800  0       0.0  0  4s10p     -3d12f
2731    Qc 3E3526      -142.9     0.    -178.6 FIXEDHF     0.800  0       0.0  0
2732    Qd 2D3526      -203.7     0.    -254.6 FIXEDHF     0.800  0       0.0  0  4s10p     -3d13f
2733    Qd 3E3526      -125.4     0.    -156.8 FIXEDHF     0.800  0       0.0  0
2734    RS 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4s12p
2735    RS 1E3535       183.9     0.     229.9 FIXEDHF     0.800  0       0.0  0
2736    RT 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4s13p
2737    RT 1E3535       160.4     0.     200.5 FIXEDHF     0.800  0       0.0  0
2738    RU 2D3526      -218.8     0.    -273.5 FIXEDHF     0.800  0       0.0  0  4s11p     -3d4f
2739    RU 3E3526      -829.1     0.   -1036.4 FIXEDHF     0.800  0       0.0  0
2740    RV 2D3526      -318.4     0.    -398.0 FIXEDHF     0.800  0       0.0  0  4s11p     -3d5f
2741    RV 3E3526      -577.8     0.    -722.2 FIXEDHF     0.800  0       0.0  0
2742    RW 2D3526      -319.0     0.    -398.8 FIXEDHF     0.800  0       0.0  0  4s11p     -3d6f
2743    RW 3E3526      -408.7     0.    -510.9 FIXEDHF     0.800  0       0.0  0
2744    RX 2D3526      -293.6     0.    -367.0 FIXEDHF     0.800  0       0.0  0  4s11p     -3d7f
2745    RX 3E3526      -306.6     0.    -383.3 FIXEDHF     0.800  0       0.0  0
2746    RY 2D3526      -264.1     0.    -330.1 FIXEDHF     0.800  0       0.0  0  4s11p     -3d8f
2747    RY 3E3526      -241.2     0.    -301.5 FIXEDHF     0.800  0       0.0  0
2748    RZ 2D3526      -236.8     0.    -296.0 FIXEDHF     0.800  0       0.0  0  4s11p     -3d9f
2749    RZ 3E3526      -196.4     0.    -245.5 FIXEDHF     0.800  0       0.0  0
2750    Ra 2D3526      -213.2     0.    -266.5 FIXEDHF     0.800  0       0.0  0  4s11p     -3d10f
2751    Ra 3E3526      -164.2     0.    -205.2 FIXEDHF     0.800  0       0.0  0
2752    Rb 2D3526      -202.9     0.    -253.6 FIXEDHF     0.800  0       0.0  0  4s11p     -3d11f
2753    Rb 3E3526      -140.0     0.    -175.0 FIXEDHF     0.800  0       0.0  0
2754    Rc 2D3526      -184.6     0.    -230.7 FIXEDHF     0.800  0       0.0  0  4s11p     -3d12f
2755    Rc 3E3526      -121.4     0.    -151.7 FIXEDHF     0.800  0       0.0  0
2756    Rd 2D3526      -167.0     0.    -208.8 FIXEDHF     0.800  0       0.0  0  4s11p     -3d13f
2757    Rd 3E3526      -106.6     0.    -133.2 FIXEDHF     0.800  0       0.0  0
2758    ST 0D3535         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -4s13p
2759    ST 1E3535       137.9     0.     172.4 FIXEDHF     0.800  0       0.0  0
2760    SU 2D3526      -184.3     0.    -230.4 FIXEDHF     0.800  0       0.0  0  4s12p     -3d4f
2761    SU 3E3526      -711.4     0.    -889.2 FIXEDHF     0.800  0       0.0  0
2762    SV 2D3526      -269.4     0.    -336.7 FIXEDHF     0.800  0       0.0  0  4s12p     -3d5f
2763    SV 3E3526      -497.0     0.    -621.3 FIXEDHF     0.800  0       0.0  0
2764    SW 2D3526      -269.8     0.    -337.3 FIXEDHF     0.800  0       0.0  0  4s12p     -3d6f
2765    SW 3E3526      -352.1     0.    -440.1 FIXEDHF     0.800  0       0.0  0
2766    SX 2D3526      -248.0     0.    -310.0 FIXEDHF     0.800  0       0.0  0  4s12p     -3d7f
2767    SX 3E3526      -264.4     0.    -330.5 FIXEDHF     0.800  0       0.0  0
2768    SY 2D3526      -222.6     0.    -278.3 FIXEDHF     0.800  0       0.0  0  4s12p     -3d8f
2769    SY 3E3526      -208.1     0.    -260.1 FIXEDHF     0.800  0       0.0  0
2770    SZ 2D3526      -199.1     0.    -248.9 FIXEDHF     0.800  0       0.0  0  4s12p     -3d9f
2771    SZ 3E3526      -169.5     0.    -211.9 FIXEDHF     0.800  0       0.0  0
2772    Sa 2D3526      -178.6     0.    -223.3 FIXEDHF     0.800  0       0.0  0  4s12p     -3d10f
2773    Sa 3E3526      -141.7     0.    -177.1 FIXEDHF     0.800  0       0.0  0
2774    Sb 2D3526      -161.1     0.    -201.4 FIXEDHF     0.800  0       0.0  0  4s12p     -3d11f
2775    Sb 3E3526      -120.9     0.    -151.1 FIXEDHF     0.800  0       0.0  0
2776    Sc 2D3526      -152.1     0.    -190.1 FIXEDHF     0.800  0       0.0  0  4s12p     -3d12f
2777    Sc 3E3526      -104.8     0.    -131.0 FIXEDHF     0.800  0       0.0  0
2778    Sd 2D3526      -139.1     0.    -173.9 FIXEDHF     0.800  0       0.0  0  4s12p     -3d13f
2779    Sd 3E3526       -92.1     0.    -115.1 FIXEDHF     0.800  0       0.0  0
2780    TU 2D3526      -158.3     0.    -197.9 FIXEDHF     0.800  0       0.0  0  4s13p     -3d4f
2781    TU 3E3526      -619.4     0.    -774.3 FIXEDHF     0.800  0       0.0  0
2782    TV 2D3526      -232.0     0.    -290.0 FIXEDHF     0.800  0       0.0  0  4s13p     -3d5f
2783    TV 3E3526      -433.7     0.    -542.1 FIXEDHF     0.800  0       0.0  0
2784    TW 2D3526      -232.5     0.    -290.6 FIXEDHF     0.800  0       0.0  0  4s13p     -3d6f
2785    TW 3E3526      -307.5     0.    -384.4 FIXEDHF     0.800  0       0.0  0
2786    TX 2D3526      -213.5     0.    -266.9 FIXEDHF     0.800  0       0.0  0  4s13p     -3d7f
2787    TX 3E3526      -231.1     0.    -288.9 FIXEDHF     0.800  0       0.0  0
2788    TY 2D3526      -191.4     0.    -239.3 FIXEDHF     0.800  0       0.0  0  4s13p     -3d8f
2789    TY 3E3526      -181.9     0.    -227.4 FIXEDHF     0.800  0       0.0  0
2790    TZ 2D3526      -171.0     0.    -213.7 FIXEDHF     0.800  0       0.0  0  4s13p     -3d9f
2791    TZ 3E3526      -148.2     0.    -185.3 FIXEDHF     0.800  0       0.0  0
2792    Ta 2D3526      -153.0     0.    -191.2 FIXEDHF     0.800  0       0.0  0  4s13p     -3d10f
2793    Ta 3E3526      -124.0     0.    -155.0 FIXEDHF     0.800  0       0.0  0
2794    Tb 2D3526      -137.7     0.    -172.1 FIXEDHF     0.800  0       0.0  0  4s13p     -3d11f
2795    Tb 3E3526      -105.8     0.    -132.2 FIXEDHF     0.800  0       0.0  0
2796    Tc 2D3526      -124.7     0.    -155.9 FIXEDHF     0.800  0       0.0  0  4s13p     -3d12f
2797    Tc 3E3526       -91.7     0.    -114.6 FIXEDHF     0.800  0       0.0  0
2798    Td 2D3526      -117.1     0.    -146.4 FIXEDHF     0.800  0       0.0  0  4s13p     -3d13f
2799    Td 3E3526       -80.6     0.    -100.7 FIXEDHF     0.800  0       0.0  0
2800    UV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4f      -3d5f
2801    UV 2D2626     10314.0     0.   12892.5 FIXEDHF     0.800  0       0.0  0
2802    UV 4D2626      5620.6     0.    7025.7 FIXEDHF     0.800  0       0.0  0
2803    UV 1E2626      9069.4     0.   11336.7 FIXEDHF     0.800  0       0.0  0
2804    UV 3E2626      5353.0     0.    6691.2 FIXEDHF     0.800  0       0.0  0
2805    UV 5E2626      3708.8     0.    4636.0 FIXEDHF     0.800  0       0.0  0
2806    UW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4f      -3d6f
2807    UW 2D2626      6861.0     0.    8576.2 FIXEDHF     0.800  0       0.0  0
2808    UW 4D2626      4005.3     0.    5006.6 FIXEDHF     0.800  0       0.0  0
2809    UW 1E2626      6811.4     0.    8514.2 FIXEDHF     0.800  0       0.0  0
2810    UW 3E2626      4030.2     0.    5037.7 FIXEDHF     0.800  0       0.0  0
2811    UW 5E2626      2795.3     0.    3494.1 FIXEDHF     0.800  0       0.0  0
2812    UX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4f      -3d7f
2813    UX 2D2626      5031.8     0.    6289.7 FIXEDHF     0.800  0       0.0  0
2814    UX 4D2626      3038.7     0.    3798.4 FIXEDHF     0.800  0       0.0  0
2815    UX 1E2626      5321.8     0.    6652.3 FIXEDHF     0.800  0       0.0  0
2816    UX 3E2626      3151.1     0.    3938.9 FIXEDHF     0.800  0       0.0  0
2817    UX 5E2626      2186.2     0.    2732.8 FIXEDHF     0.800  0       0.0  0
2818    UY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4f      -3d8f
2819    UY 2D2626      3917.9     0.    4897.4 FIXEDHF     0.800  0       0.0  0
2820    UY 4D2626      2412.8     0.    3016.0 FIXEDHF     0.800  0       0.0  0
2821    UY 1E2626      4303.5     0.    5379.4 FIXEDHF     0.800  0       0.0  0
2822    UY 3E2626      2548.6     0.    3185.7 FIXEDHF     0.800  0       0.0  0
2823    UY 5E2626      1768.3     0.    2210.4 FIXEDHF     0.800  0       0.0  0
2824    UZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4f      -3d9f
2825    UZ 2D2626      3174.8     0.    3968.5 FIXEDHF     0.800  0       0.0  0
2826    UZ 4D2626      1979.6     0.    2474.5 FIXEDHF     0.800  0       0.0  0
2827    UZ 1E2626      3574.1     0.    4467.6 FIXEDHF     0.800  0       0.0  0
2828    UZ 3E2626      2116.6     0.    2645.7 FIXEDHF     0.800  0       0.0  0
2829    UZ 5E2626      1468.6     0.    1835.8 FIXEDHF     0.800  0       0.0  0
2830    Ua 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4f      -3d10f
2831    Ua 2D2626      2646.8     0.    3308.5 FIXEDHF     0.800  0       0.0  0
2832    Ua 4D2626      1664.4     0.    2080.5 FIXEDHF     0.800  0       0.0  0
2833    Ua 1E2626      3030.7     0.    3788.4 FIXEDHF     0.800  0       0.0  0
2834    Ua 3E2626      1794.7     0.    2243.4 FIXEDHF     0.800  0       0.0  0
2835    Ua 5E2626      1245.3     0.    1556.6 FIXEDHF     0.800  0       0.0  0
2836    Ub 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4f      -3d11f
2837    Ub 2D2626      2254.3     0.    2817.9 FIXEDHF     0.800  0       0.0  0
2838    Ub 4D2626      1426.1     0.    1782.6 FIXEDHF     0.800  0       0.0  0
2839    Ub 1E2626      2613.1     0.    3266.4 FIXEDHF     0.800  0       0.0  0
2840    Ub 3E2626      1547.3     0.    1934.1 FIXEDHF     0.800  0       0.0  0
2841    Ub 5E2626      1073.5     0.    1341.9 FIXEDHF     0.800  0       0.0  0
2842    Uc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4f      -3d12f
2843    Uc 2D2626      1952.3     0.    2440.4 FIXEDHF     0.800  0       0.0  0
2844    Uc 4D2626      1240.6     0.    1550.7 FIXEDHF     0.800  0       0.0  0
2845    Uc 1E2626      2283.8     0.    2854.8 FIXEDHF     0.800  0       0.0  0
2846    Uc 3E2626      1352.2     0.    1690.2 FIXEDHF     0.800  0       0.0  0
2847    Uc 5E2626       938.2     0.    1172.7 FIXEDHF     0.800  0       0.0  0
2848    Ud 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d4f      -3d13f
2849    Ud 2D2626      1713.6     0.    2142.0 FIXEDHF     0.800  0       0.0  0
2850    Ud 4D2626      1092.6     0.    1365.7 FIXEDHF     0.800  0       0.0  0
2851    Ud 1E2626      2018.7     0.    2523.4 FIXEDHF     0.800  0       0.0  0
2852    Ud 3E2626      1195.1     0.    1493.9 FIXEDHF     0.800  0       0.0  0
2853    Ud 5E2626       829.1     0.    1036.4 FIXEDHF     0.800  0       0.0  0
2854    Ue 2D2636    -10449.2     0.  -13061.5 FIXEDHF     0.800  0       0.0  0  3d4f      -4s4f
2855    Ue 3E2636    -10219.0     0.  -12773.8 FIXEDHF     0.800  0       0.0  0
2856    Uf 2D2636     -3190.2     0.   -3987.7 FIXEDHF     0.800  0       0.0  0  3d4f      -4s5f
2857    Uf 3E2636     -5998.4     0.   -7498.0 FIXEDHF     0.800  0       0.0  0
2858    Ug 2D2636     -1512.6     0.   -1890.8 FIXEDHF     0.800  0       0.0  0  3d4f      -4s6f
2859    Ug 3E2636     -4040.2     0.   -5050.3 FIXEDHF     0.800  0       0.0  0
2860    Uh 2D2636      -870.2     0.   -1087.7 FIXEDHF     0.800  0       0.0  0  3d4f      -4s7f
2861    Uh 3E2636     -2963.8     0.   -3704.7 FIXEDHF     0.800  0       0.0  0
2862    Ui 2D2636      -562.2     0.    -702.8 FIXEDHF     0.800  0       0.0  0  3d4f      -4s8f
2863    Ui 3E2636     -2297.4     0.   -2871.8 FIXEDHF     0.800  0       0.0  0
2864    Uj 2D2636      -393.2     0.    -491.5 FIXEDHF     0.800  0       0.0  0  3d4f      -4s9f
2865    Uj 3E2636     -1851.3     0.   -2314.1 FIXEDHF     0.800  0       0.0  0
2866    Uk 2D2636      -291.3     0.    -364.1 FIXEDHF     0.800  0       0.0  0  3d4f      -4s10f
2867    Uk 3E2636     -1535.1     0.   -1918.9 FIXEDHF     0.800  0       0.0  0
2868    Ul 2D2636      -225.4     0.    -281.7 FIXEDHF     0.800  0       0.0  0  3d4f      -4s11f
2869    Ul 3E2636     -1301.2     0.   -1626.5 FIXEDHF     0.800  0       0.0  0
2870    Um 2D2636      -180.4     0.    -225.5 FIXEDHF     0.800  0       0.0  0  3d4f      -4s12f
2871    Um 3E2636     -1122.2     0.   -1402.8 FIXEDHF     0.800  0       0.0  0
2872    Un 2D2636      -148.3     0.    -185.4 FIXEDHF     0.800  0       0.0  0  3d4f      -4s13f
2873    Un 3E2636      -981.5     0.   -1226.9 FIXEDHF     0.800  0       0.0  0
2874    Uo 2D2627      1813.8     0.    2267.3 FIXEDHF     0.800  0       0.0  0  3d4f      -3d6h
2875    Uo 4D2627       433.5     0.     541.9 FIXEDHF     0.800  0       0.0  0
2876    Uo 3E2627       186.6     0.     233.3 FIXEDHF     0.800  0       0.0  0
2877    Uo 5E2627       124.1     0.     155.1 FIXEDHF     0.800  0       0.0  0
2878    Up 2D2627      1797.4     0.    2246.7 FIXEDHF     0.800  0       0.0  0  3d4f      -3d7h
2879    Up 4D2627       462.9     0.     578.6 FIXEDHF     0.800  0       0.0  0
2880    Up 3E2627       210.4     0.     263.0 FIXEDHF     0.800  0       0.0  0
2881    Up 5E2627       140.5     0.     175.6 FIXEDHF     0.800  0       0.0  0
2882    Uq 2D2627      1622.5     0.    2028.1 FIXEDHF     0.800  0       0.0  0  3d4f      -3d8h
2883    Uq 4D2627       436.4     0.     545.5 FIXEDHF     0.800  0       0.0  0
2884    Uq 3E2627       204.9     0.     256.1 FIXEDHF     0.800  0       0.0  0
2885    Uq 5E2627       137.2     0.     171.5 FIXEDHF     0.800  0       0.0  0
2886    Ur 2D2627      1436.3     0.    1795.4 FIXEDHF     0.800  0       0.0  0  3d4f      -3d9h
2887    Ur 4D2627       397.2     0.     496.5 FIXEDHF     0.800  0       0.0  0
2888    Ur 3E2627       190.5     0.     238.1 FIXEDHF     0.800  0       0.0  0
2889    Ur 5E2627       127.8     0.     159.7 FIXEDHF     0.800  0       0.0  0
2890    Us 2D2637     -1642.9     0.   -2053.6 FIXEDHF     0.800  0       0.0  0  3d4f      -4s6h
2891    Us 3E2637      -529.4     0.    -661.7 FIXEDHF     0.800  0       0.0  0
2892    Ut 2D2637     -1626.0     0.   -2032.5 FIXEDHF     0.800  0       0.0  0  3d4f      -4s7h
2893    Ut 3E2637      -595.4     0.    -744.2 FIXEDHF     0.800  0       0.0  0
2894    Uu 2D2637     -1464.0     0.   -1830.0 FIXEDHF     0.800  0       0.0  0  3d4f      -4s8h
2895    Uu 3E2637      -577.6     0.    -722.0 FIXEDHF     0.800  0       0.0  0
2896    Uv 2D2637     -1291.9     0.   -1614.9 FIXEDHF     0.800  0       0.0  0  3d4f      -4s9h
2897    Uv 3E2637      -535.0     0.    -668.7 FIXEDHF     0.800  0       0.0  0
2898    Uy 4D2628        11.6     0.      14.5 FIXEDHF     0.800  0       0.0  0  3d4f      -3d8k
2899    Uy 5E2628         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0
2900    Uz 4D2628        15.1     0.      18.9 FIXEDHF     0.800  0       0.0  0  3d4f      -3d9k
2901    Uz 5E2628         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0
2902    VW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5f      -3d6f
2903    VW 2D2626      6091.4     0.    7614.3 FIXEDHF     0.800  0       0.0  0
2904    VW 4D2626      3219.2     0.    4024.0 FIXEDHF     0.800  0       0.0  0
2905    VW 1E2626      5267.9     0.    6584.9 FIXEDHF     0.800  0       0.0  0
2906    VW 3E2626      3169.0     0.    3961.2 FIXEDHF     0.800  0       0.0  0
2907    VW 5E2626      2212.8     0.    2766.0 FIXEDHF     0.800  0       0.0  0
2908    VX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5f      -3d7f
2909    VX 2D2626      4506.6     0.    5633.2 FIXEDHF     0.800  0       0.0  0
2910    VX 4D2626      2482.6     0.    3103.2 FIXEDHF     0.800  0       0.0  0
2911    VX 1E2626      4131.8     0.    5164.7 FIXEDHF     0.800  0       0.0  0
2912    VX 3E2626      2491.2     0.    3114.0 FIXEDHF     0.800  0       0.0  0
2913    VX 5E2626      1741.3     0.    2176.6 FIXEDHF     0.800  0       0.0  0
2914    VY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5f      -3d8f
2915    VY 2D2626      3527.7     0.    4409.6 FIXEDHF     0.800  0       0.0  0
2916    VY 4D2626      1989.6     0.    2487.0 FIXEDHF     0.800  0       0.0  0
2917    VY 1E2626      3349.0     0.    4186.3 FIXEDHF     0.800  0       0.0  0
2918    VY 3E2626      2021.7     0.    2527.1 FIXEDHF     0.800  0       0.0  0
2919    VY 5E2626      1413.8     0.    1767.3 FIXEDHF     0.800  0       0.0  0
2920    VZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5f      -3d9f
2921    VZ 2D2626      2868.2     0.    3585.3 FIXEDHF     0.800  0       0.0  0
2922    VZ 4D2626      1641.9     0.    2052.4 FIXEDHF     0.800  0       0.0  0
2923    VZ 1E2626      2785.7     0.    3482.1 FIXEDHF     0.800  0       0.0  0
2924    VZ 3E2626      1682.8     0.    2103.5 FIXEDHF     0.800  0       0.0  0
2925    VZ 5E2626      1177.2     0.    1471.5 FIXEDHF     0.800  0       0.0  0
2926    Va 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5f      -3d10f
2927    Va 2D2626      2396.8     0.    2996.0 FIXEDHF     0.800  0       0.0  0
2928    Va 4D2626      1385.9     0.    1732.4 FIXEDHF     0.800  0       0.0  0
2929    Va 1E2626      2364.8     0.    2956.0 FIXEDHF     0.800  0       0.0  0
2930    Va 3E2626      1429.1     0.    1786.4 FIXEDHF     0.800  0       0.0  0
2931    Va 5E2626       999.9     0.    1249.9 FIXEDHF     0.800  0       0.0  0
2932    Vb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5f      -3d11f
2933    Vb 2D2626      2044.7     0.    2555.9 FIXEDHF     0.800  0       0.0  0
2934    Vb 4D2626      1190.9     0.    1488.6 FIXEDHF     0.800  0       0.0  0
2935    Vb 1E2626      2040.6     0.    2550.7 FIXEDHF     0.800  0       0.0  0
2936    Vb 3E2626      1233.5     0.    1541.9 FIXEDHF     0.800  0       0.0  0
2937    Vb 5E2626       863.1     0.    1078.9 FIXEDHF     0.800  0       0.0  0
2938    Vc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5f      -3d12f
2939    Vc 2D2626      1772.9     0.    2216.1 FIXEDHF     0.800  0       0.0  0
2940    Vc 4D2626      1038.1     0.    1297.6 FIXEDHF     0.800  0       0.0  0
2941    Vc 1E2626      1784.5     0.    2230.6 FIXEDHF     0.800  0       0.0  0
2942    Vc 3E2626      1079.0     0.    1348.7 FIXEDHF     0.800  0       0.0  0
2943    Vc 5E2626       755.0     0.     943.8 FIXEDHF     0.800  0       0.0  0
2944    Vd 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d5f      -3d13f
2945    Vd 2D2626      1557.5     0.    1946.9 FIXEDHF     0.800  0       0.0  0
2946    Vd 4D2626       915.7     0.    1144.6 FIXEDHF     0.800  0       0.0  0
2947    Vd 1E2626      1578.0     0.    1972.5 FIXEDHF     0.800  0       0.0  0
2948    Vd 3E2626       954.2     0.    1192.8 FIXEDHF     0.800  0       0.0  0
2949    Vd 5E2626       667.8     0.     834.8 FIXEDHF     0.800  0       0.0  0
2950    Ve 2D2636     -4205.4     0.   -5256.8 FIXEDHF     0.800  0       0.0  0  3d5f      -4s4f
2951    Ve 3E2636     -5550.9     0.   -6938.6 FIXEDHF     0.800  0       0.0  0
2952    Vf 2D2636     -3800.3     0.   -4750.4 FIXEDHF     0.800  0       0.0  0  3d5f      -4s5f
2953    Vf 3E2636     -3490.6     0.   -4363.2 FIXEDHF     0.800  0       0.0  0
2954    Vg 2D2636     -1904.0     0.   -2380.0 FIXEDHF     0.800  0       0.0  0  3d5f      -4s6f
2955    Vg 3E2636     -2421.3     0.   -3026.6 FIXEDHF     0.800  0       0.0  0
2956    Vh 2D2636     -1190.2     0.   -1487.8 FIXEDHF     0.800  0       0.0  0  3d5f      -4s7f
2957    Vh 3E2636     -1805.4     0.   -2256.8 FIXEDHF     0.800  0       0.0  0
2958    Vi 2D2636      -827.8     0.   -1034.8 FIXEDHF     0.800  0       0.0  0  3d5f      -4s8f
2959    Vi 3E2636     -1413.7     0.   -1767.1 FIXEDHF     0.800  0       0.0  0
2960    Vj 2D2636      -616.8     0.    -771.0 FIXEDHF     0.800  0       0.0  0  3d5f      -4s9f
2961    Vj 3E2636     -1146.8     0.   -1433.5 FIXEDHF     0.800  0       0.0  0
2962    Vk 2D2636      -482.3     0.    -602.9 FIXEDHF     0.800  0       0.0  0  3d5f      -4s10f
2963    Vk 3E2636      -955.4     0.   -1194.2 FIXEDHF     0.800  0       0.0  0
2964    Vl 2D2636      -390.8     0.    -488.5 FIXEDHF     0.800  0       0.0  0  3d5f      -4s11f
2965    Vl 3E2636      -812.6     0.   -1015.7 FIXEDHF     0.800  0       0.0  0
2966    Vm 2D2636      -325.4     0.    -406.7 FIXEDHF     0.800  0       0.0  0  3d5f      -4s12f
2967    Vm 3E2636      -702.6     0.    -878.2 FIXEDHF     0.800  0       0.0  0
2968    Vn 2D2636      -276.6     0.    -345.8 FIXEDHF     0.800  0       0.0  0  3d5f      -4s13f
2969    Vn 3E2636      -615.7     0.    -769.6 FIXEDHF     0.800  0       0.0  0
2970    Vo 2D2627      -668.3     0.    -835.4 FIXEDHF     0.800  0       0.0  0  3d5f      -3d6h
2971    Vo 4D2627        83.0     0.     103.8 FIXEDHF     0.800  0       0.0  0
2972    Vo 3E2627       125.6     0.     157.0 FIXEDHF     0.800  0       0.0  0
2973    Vo 5E2627        81.9     0.     102.4 FIXEDHF     0.800  0       0.0  0
2974    Vp 2D2627      -182.2     0.    -227.7 FIXEDHF     0.800  0       0.0  0  3d5f      -3d7h
2975    Vp 4D2627       128.8     0.     161.0 FIXEDHF     0.800  0       0.0  0
2976    Vp 3E2627       142.5     0.     178.1 FIXEDHF     0.800  0       0.0  0
2977    Vp 5E2627        93.5     0.     116.9 FIXEDHF     0.800  0       0.0  0
2978    Vq 2D2627        29.8     0.      37.2 FIXEDHF     0.800  0       0.0  0  3d5f      -3d8h
2979    Vq 4D2627       140.9     0.     176.1 FIXEDHF     0.800  0       0.0  0
2980    Vq 3E2627       139.3     0.     174.1 FIXEDHF     0.800  0       0.0  0
2981    Vq 5E2627        91.8     0.     114.7 FIXEDHF     0.800  0       0.0  0
2982    Vr 2D2627       122.3     0.     152.9 FIXEDHF     0.800  0       0.0  0  3d5f      -3d9h
2983    Vr 4D2627       139.0     0.     173.7 FIXEDHF     0.800  0       0.0  0
2984    Vr 3E2627       129.8     0.     162.3 FIXEDHF     0.800  0       0.0  0
2985    Vr 5E2627        85.7     0.     107.1 FIXEDHF     0.800  0       0.0  0
2986    Vs 2D2637       743.7     0.     929.6 FIXEDHF     0.800  0       0.0  0  3d5f      -4s6h
2987    Vs 3E2637      -234.6     0.    -293.2 FIXEDHF     0.800  0       0.0  0
2988    Vt 2D2637       278.7     0.     348.4 FIXEDHF     0.800  0       0.0  0  3d5f      -4s7h
2989    Vt 3E2637      -268.8     0.    -336.0 FIXEDHF     0.800  0       0.0  0
2990    Vu 2D2637        65.5     0.      81.9 FIXEDHF     0.800  0       0.0  0  3d5f      -4s8h
2991    Vu 3E2637      -263.8     0.    -329.8 FIXEDHF     0.800  0       0.0  0
2992    Vv 2D2637       -34.1     0.     -42.6 FIXEDHF     0.800  0       0.0  0  3d5f      -4s9h
2993    Vv 3E2637      -246.3     0.    -307.9 FIXEDHF     0.800  0       0.0  0
2994    Vy 4D2628       -10.2     0.     -12.8 FIXEDHF     0.800  0       0.0  0  3d5f      -3d8k
2995    Vy 5E2628         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0
2996    Vz 4D2628       -11.6     0.     -14.5 FIXEDHF     0.800  0       0.0  0  3d5f      -3d9k
2997    Vz 5E2628         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0
2998    WX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6f      -3d7f
2999    WX 2D2626      3657.4     0.    4571.7 FIXEDHF     0.800  0       0.0  0
3000    WX 4D2626      1910.6     0.    2388.2 FIXEDHF     0.800  0       0.0  0
3001    WX 1E2626      3141.0     0.    3926.3 FIXEDHF     0.800  0       0.0  0
3002    WX 3E2626      1908.0     0.    2385.0 FIXEDHF     0.800  0       0.0  0
3003    WX 5E2626      1337.8     0.    1672.2 FIXEDHF     0.800  0       0.0  0
3004    WY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6f      -3d8f
3005    WY 2D2626      2871.5     0.    3589.4 FIXEDHF     0.800  0       0.0  0
3006    WY 4D2626      1540.5     0.    1925.6 FIXEDHF     0.800  0       0.0  0
3007    WY 1E2626      2549.0     0.    3186.3 FIXEDHF     0.800  0       0.0  0
3008    WY 3E2626      1551.0     0.    1938.8 FIXEDHF     0.800  0       0.0  0
3009    WY 5E2626      1088.3     0.    1360.4 FIXEDHF     0.800  0       0.0  0
3010    WZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6f      -3d9f
3011    WZ 2D2626      2339.9     0.    2924.9 FIXEDHF     0.800  0       0.0  0
3012    WZ 4D2626      1276.1     0.    1595.1 FIXEDHF     0.800  0       0.0  0
3013    WZ 1E2626      2121.9     0.    2652.4 FIXEDHF     0.800  0       0.0  0
3014    WZ 3E2626      1292.5     0.    1615.6 FIXEDHF     0.800  0       0.0  0
3015    WZ 5E2626       907.3     0.    1134.1 FIXEDHF     0.800  0       0.0  0
3016    Wa 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6f      -3d10f
3017    Wa 2D2626      1958.2     0.    2447.8 FIXEDHF     0.800  0       0.0  0
3018    Wa 4D2626      1079.8     0.    1349.8 FIXEDHF     0.800  0       0.0  0
3019    Wa 1E2626      1802.2     0.    2252.8 FIXEDHF     0.800  0       0.0  0
3020    Wa 3E2626      1098.6     0.    1373.2 FIXEDHF     0.800  0       0.0  0
3021    Wa 5E2626       771.4     0.     964.2 FIXEDHF     0.800  0       0.0  0
3022    Wb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6f      -3d11f
3023    Wb 2D2626      1672.5     0.    2090.6 FIXEDHF     0.800  0       0.0  0
3024    Wb 4D2626       929.5     0.    1161.9 FIXEDHF     0.800  0       0.0  0
3025    Wb 1E2626      1555.8     0.    1944.7 FIXEDHF     0.800  0       0.0  0
3026    Wb 3E2626       948.7     0.    1185.9 FIXEDHF     0.800  0       0.0  0
3027    Wb 5E2626       666.3     0.     832.9 FIXEDHF     0.800  0       0.0  0
3028    Wc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6f      -3d12f
3029    Wc 2D2626      1451.3     0.    1814.1 FIXEDHF     0.800  0       0.0  0
3030    Wc 4D2626       811.4     0.    1014.2 FIXEDHF     0.800  0       0.0  0
3031    Wc 1E2626      1360.9     0.    1701.1 FIXEDHF     0.800  0       0.0  0
3032    Wc 3E2626       830.2     0.    1037.8 FIXEDHF     0.800  0       0.0  0
3033    Wc 5E2626       583.2     0.     729.0 FIXEDHF     0.800  0       0.0  0
3034    Wd 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6f      -3d13f
3035    Wd 2D2626      1275.8     0.    1594.8 FIXEDHF     0.800  0       0.0  0
3036    Wd 4D2626       716.4     0.     895.5 FIXEDHF     0.800  0       0.0  0
3037    Wd 1E2626      1203.8     0.    1504.7 FIXEDHF     0.800  0       0.0  0
3038    Wd 3E2626       734.5     0.     918.1 FIXEDHF     0.800  0       0.0  0
3039    Wd 5E2626       516.0     0.     645.0 FIXEDHF     0.800  0       0.0  0
3040    We 2D2636     -2228.4     0.   -2785.5 FIXEDHF     0.800  0       0.0  0  3d6f      -4s4f
3041    We 3E2636     -3392.0     0.   -4240.0 FIXEDHF     0.800  0       0.0  0
3042    Wf 2D2636     -2185.9     0.   -2732.4 FIXEDHF     0.800  0       0.0  0  3d6f      -4s5f
3043    Wf 3E2636     -2217.0     0.   -2771.3 FIXEDHF     0.800  0       0.0  0
3044    Wg 2D2636     -1827.0     0.   -2283.7 FIXEDHF     0.800  0       0.0  0  3d6f      -4s6f
3045    Wg 3E2636     -1562.9     0.   -1953.6 FIXEDHF     0.800  0       0.0  0
3046    Wh 2D2636     -1133.7     0.   -1417.1 FIXEDHF     0.800  0       0.0  0  3d6f      -4s7f
3047    Wh 3E2636     -1175.8     0.   -1469.7 FIXEDHF     0.800  0       0.0  0
3048    Wi 2D2636      -802.4     0.   -1003.0 FIXEDHF     0.800  0       0.0  0  3d6f      -4s8f
3049    Wi 3E2636      -925.7     0.   -1157.1 FIXEDHF     0.800  0       0.0  0
3050    Wj 2D2636      -607.4     0.    -759.3 FIXEDHF     0.800  0       0.0  0  3d6f      -4s9f
3051    Wj 3E2636      -753.6     0.    -942.0 FIXEDHF     0.800  0       0.0  0
3052    Wk 2D2636      -481.2     0.    -601.5 FIXEDHF     0.800  0       0.0  0  3d6f      -4s10f
3053    Wk 3E2636      -629.4     0.    -786.7 FIXEDHF     0.800  0       0.0  0
3054    Wl 2D2636      -394.1     0.    -492.6 FIXEDHF     0.800  0       0.0  0  3d6f      -4s11f
3055    Wl 3E2636      -536.2     0.    -670.3 FIXEDHF     0.800  0       0.0  0
3056    Wm 2D2636      -330.9     0.    -413.6 FIXEDHF     0.800  0       0.0  0  3d6f      -4s12f
3057    Wm 3E2636      -464.3     0.    -580.4 FIXEDHF     0.800  0       0.0  0
3058    Wn 2D2636      -283.4     0.    -354.2 FIXEDHF     0.800  0       0.0  0  3d6f      -4s13f
3059    Wn 3E2636      -407.3     0.    -509.1 FIXEDHF     0.800  0       0.0  0
3060    Wo 2D2627       -56.5     0.     -70.6 FIXEDHF     0.800  0       0.0  0  3d6f      -3d6h
3061    Wo 4D2627        47.6     0.      59.5 FIXEDHF     0.800  0       0.0  0
3062    Wo 3E2627        88.3     0.     110.4 FIXEDHF     0.800  0       0.0  0
3063    Wo 5E2627        56.9     0.      71.1 FIXEDHF     0.800  0       0.0  0
3064    Wp 2D2627      -319.5     0.    -399.4 FIXEDHF     0.800  0       0.0  0  3d6f      -3d7h
3065    Wp 4D2627        57.9     0.      72.4 FIXEDHF     0.800  0       0.0  0
3066    Wp 3E2627       100.6     0.     125.7 FIXEDHF     0.800  0       0.0  0
3067    Wp 5E2627        65.2     0.      81.5 FIXEDHF     0.800  0       0.0  0
3068    Wq 2D2627      -229.4     0.    -286.7 FIXEDHF     0.800  0       0.0  0  3d6f      -3d8h
3069    Wq 4D2627        64.0     0.      80.0 FIXEDHF     0.800  0       0.0  0
3070    Wq 3E2627        98.5     0.     123.1 FIXEDHF     0.800  0       0.0  0
3071    Wq 5E2627        64.1     0.      80.1 FIXEDHF     0.800  0       0.0  0
3072    Wr 2D2627      -152.1     0.    -190.1 FIXEDHF     0.800  0       0.0  0  3d6f      -3d9h
3073    Wr 4D2627        64.6     0.      80.7 FIXEDHF     0.800  0       0.0  0
3074    Wr 3E2627        91.9     0.     114.9 FIXEDHF     0.800  0       0.0  0
3075    Wr 5E2627        60.0     0.      75.0 FIXEDHF     0.800  0       0.0  0
3076    Ws 2D2637       128.8     0.     161.0 FIXEDHF     0.800  0       0.0  0  3d6f      -4s6h
3077    Ws 3E2637      -124.9     0.    -156.1 FIXEDHF     0.800  0       0.0  0
3078    Wt 2D2637       391.4     0.     489.3 FIXEDHF     0.800  0       0.0  0  3d6f      -4s7h
3079    Wt 3E2637      -144.9     0.    -181.1 FIXEDHF     0.800  0       0.0  0
3080    Wu 2D2637       299.4     0.     374.2 FIXEDHF     0.800  0       0.0  0  3d6f      -4s8h
3081    Wu 3E2637      -143.4     0.    -179.2 FIXEDHF     0.800  0       0.0  0
3082    Wv 2D2637       217.0     0.     271.2 FIXEDHF     0.800  0       0.0  0  3d6f      -4s9h
3083    Wv 3E2637      -134.6     0.    -168.2 FIXEDHF     0.800  0       0.0  0
3084    Wy 4D2628         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0  3d6f      -3d8k
3085    Wy 5E2628         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0
3086    Wz 4D2628         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  3d6f      -3d9k
3087    Wz 5E2628         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0
3088    XY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7f      -3d8f
3089    XY 2D2626      2340.9     0.    2926.1 FIXEDHF     0.800  0       0.0  0
3090    XY 4D2626      1218.2     0.    1522.7 FIXEDHF     0.800  0       0.0  0
3091    XY 1E2626      2006.5     0.    2508.1 FIXEDHF     0.800  0       0.0  0
3092    XY 3E2626      1225.8     0.    1532.2 FIXEDHF     0.800  0       0.0  0
3093    XY 5E2626       861.5     0.    1076.9 FIXEDHF     0.800  0       0.0  0
3094    XZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7f      -3d9f
3095    XZ 2D2626      1909.6     0.    2387.0 FIXEDHF     0.800  0       0.0  0
3096    XZ 4D2626      1011.7     0.    1264.6 FIXEDHF     0.800  0       0.0  0
3097    XZ 1E2626      1671.0     0.    2088.8 FIXEDHF     0.800  0       0.0  0
3098    XZ 3E2626      1022.1     0.    1277.6 FIXEDHF     0.800  0       0.0  0
3099    XZ 5E2626       718.8     0.     898.5 FIXEDHF     0.800  0       0.0  0
3100    Xa 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7f      -3d10f
3101    Xa 2D2626      1599.8     0.    1999.7 FIXEDHF     0.800  0       0.0  0
3102    Xa 4D2626       857.6     0.    1072.0 FIXEDHF     0.800  0       0.0  0
3103    Xa 1E2626      1419.8     0.    1774.7 FIXEDHF     0.800  0       0.0  0
3104    Xa 3E2626       869.1     0.    1086.4 FIXEDHF     0.800  0       0.0  0
3105    Xa 5E2626       611.4     0.     764.3 FIXEDHF     0.800  0       0.0  0
3106    Xb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7f      -3d11f
3107    Xb 2D2626      1367.3     0.    1709.1 FIXEDHF     0.800  0       0.0  0
3108    Xb 4D2626       739.0     0.     923.8 FIXEDHF     0.800  0       0.0  0
3109    Xb 1E2626      1225.8     0.    1532.3 FIXEDHF     0.800  0       0.0  0
3110    Xb 3E2626       750.9     0.     938.6 FIXEDHF     0.800  0       0.0  0
3111    Xb 5E2626       528.3     0.     660.4 FIXEDHF     0.800  0       0.0  0
3112    Xc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7f      -3d12f
3113    Xc 2D2626      1187.2     0.    1484.0 FIXEDHF     0.800  0       0.0  0
3114    Xc 4D2626       645.7     0.     807.1 FIXEDHF     0.800  0       0.0  0
3115    Xc 1E2626      1072.5     0.    1340.6 FIXEDHF     0.800  0       0.0  0
3116    Xc 3E2626       657.2     0.     821.5 FIXEDHF     0.800  0       0.0  0
3117    Xc 5E2626       462.6     0.     578.2 FIXEDHF     0.800  0       0.0  0
3118    Xd 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7f      -3d13f
3119    Xd 2D2626      1044.2     0.    1305.2 FIXEDHF     0.800  0       0.0  0
3120    Xd 4D2626       570.5     0.     713.1 FIXEDHF     0.800  0       0.0  0
3121    Xd 1E2626       948.7     0.    1185.9 FIXEDHF     0.800  0       0.0  0
3122    Xd 3E2626       581.6     0.     727.0 FIXEDHF     0.800  0       0.0  0
3123    Xd 5E2626       409.4     0.     511.7 FIXEDHF     0.800  0       0.0  0
3124    Xe 2D2636     -1389.2     0.   -1736.5 FIXEDHF     0.800  0       0.0  0  3d7f      -4s4f
3125    Xe 3E2636     -2314.1     0.   -2892.6 FIXEDHF     0.800  0       0.0  0
3126    Xf 2D2636     -1456.2     0.   -1820.3 FIXEDHF     0.800  0       0.0  0  3d7f      -4s5f
3127    Xf 3E2636     -1550.2     0.   -1937.8 FIXEDHF     0.800  0       0.0  0
3128    Xg 2D2636     -1239.1     0.   -1548.9 FIXEDHF     0.800  0       0.0  0  3d7f      -4s6f
3129    Xg 3E2636     -1103.9     0.   -1379.9 FIXEDHF     0.800  0       0.0  0
3130    Xh 2D2636     -1027.4     0.   -1284.3 FIXEDHF     0.800  0       0.0  0  3d7f      -4s7f
3131    Xh 3E2636      -835.0     0.   -1043.8 FIXEDHF     0.800  0       0.0  0
3132    Xi 2D2636      -716.0     0.    -895.0 FIXEDHF     0.800  0       0.0  0  3d7f      -4s8f
3133    Xi 3E2636      -659.6     0.    -824.5 FIXEDHF     0.800  0       0.0  0
3134    Xj 2D2636      -544.4     0.    -680.5 FIXEDHF     0.800  0       0.0  0  3d7f      -4s9f
3135    Xj 3E2636      -538.2     0.    -672.7 FIXEDHF     0.800  0       0.0  0
3136    Xk 2D2636      -433.4     0.    -541.8 FIXEDHF     0.800  0       0.0  0  3d7f      -4s10f
3137    Xk 3E2636      -450.2     0.    -562.7 FIXEDHF     0.800  0       0.0  0
3138    Xl 2D2636      -356.6     0.    -445.7 FIXEDHF     0.800  0       0.0  0  3d7f      -4s11f
3139    Xl 3E2636      -384.0     0.    -480.0 FIXEDHF     0.800  0       0.0  0
3140    Xm 2D2636      -300.5     0.    -375.6 FIXEDHF     0.800  0       0.0  0  3d7f      -4s12f
3141    Xm 3E2636      -332.7     0.    -415.9 FIXEDHF     0.800  0       0.0  0
3142    Xn 2D2636      -258.1     0.    -322.6 FIXEDHF     0.800  0       0.0  0  3d7f      -4s13f
3143    Xn 3E2636      -292.1     0.    -365.1 FIXEDHF     0.800  0       0.0  0
3144    Xo 2D2627       -42.5     0.     -53.1 FIXEDHF     0.800  0       0.0  0  3d7f      -3d6h
3145    Xo 4D2627        30.2     0.      37.7 FIXEDHF     0.800  0       0.0  0
3146    Xo 3E2627        66.3     0.      82.9 FIXEDHF     0.800  0       0.0  0
3147    Xo 5E2627        42.4     0.      53.0 FIXEDHF     0.800  0       0.0  0
3148    Xp 2D2627       -51.1     0.     -63.9 FIXEDHF     0.800  0       0.0  0  3d7f      -3d7h
3149    Xp 4D2627        38.2     0.      47.7 FIXEDHF     0.800  0       0.0  0
3150    Xp 3E2627        75.6     0.      94.5 FIXEDHF     0.800  0       0.0  0
3151    Xp 5E2627        48.6     0.      60.8 FIXEDHF     0.800  0       0.0  0
3152    Xq 2D2627      -163.0     0.    -203.7 FIXEDHF     0.800  0       0.0  0  3d7f      -3d8h
3153    Xq 4D2627        39.4     0.      49.3 FIXEDHF     0.800  0       0.0  0
3154    Xq 3E2627        74.2     0.      92.7 FIXEDHF     0.800  0       0.0  0
3155    Xq 5E2627        47.9     0.      59.9 FIXEDHF     0.800  0       0.0  0
3156    Xr 2D2627      -148.4     0.    -185.5 FIXEDHF     0.800  0       0.0  0  3d7f      -3d9h
3157    Xr 4D2627        39.1     0.      48.9 FIXEDHF     0.800  0       0.0  0
3158    Xr 3E2627        69.3     0.      86.6 FIXEDHF     0.800  0       0.0  0
3159    Xr 5E2627        44.9     0.      56.1 FIXEDHF     0.800  0       0.0  0
3160    Xs 2D2637        97.0     0.     121.2 FIXEDHF     0.800  0       0.0  0  3d7f      -4s6h
3161    Xs 3E2637       -77.0     0.     -96.3 FIXEDHF     0.800  0       0.0  0
3162    Xt 2D2637       115.5     0.     144.4 FIXEDHF     0.800  0       0.0  0  3d7f      -4s7h
3163    Xt 3E2637       -90.3     0.    -112.9 FIXEDHF     0.800  0       0.0  0
3164    Xu 2D2637       222.1     0.     277.6 FIXEDHF     0.800  0       0.0  0  3d7f      -4s8h
3165    Xu 3E2637       -89.8     0.    -112.3 FIXEDHF     0.800  0       0.0  0
3166    Xv 2D2637       202.2     0.     252.8 FIXEDHF     0.800  0       0.0  0  3d7f      -4s9h
3167    Xv 3E2637       -84.6     0.    -105.8 FIXEDHF     0.800  0       0.0  0
3168    Xy 4D2628        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  3d7f      -3d8k
3169    Xy 5E2628         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
3170    Xz 4D2628         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  3d7f      -3d9k
3171    Xz 5E2628         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0
3172    YZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8f      -3d9f
3173    YZ 2D2626      1584.2     0.    1980.2 FIXEDHF     0.800  0       0.0  0
3174    YZ 4D2626       823.8     0.    1029.7 FIXEDHF     0.800  0       0.0  0
3175    YZ 1E2626      1357.8     0.    1697.3 FIXEDHF     0.800  0       0.0  0
3176    YZ 3E2626       832.6     0.    1040.7 FIXEDHF     0.800  0       0.0  0
3177    YZ 5E2626       586.1     0.     732.6 FIXEDHF     0.800  0       0.0  0
3178    Ya 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8f      -3d10f
3179    Ya 2D2626      1327.7     0.    1659.6 FIXEDHF     0.800  0       0.0  0
3180    Ya 4D2626       699.1     0.     873.9 FIXEDHF     0.800  0       0.0  0
3181    Ya 1E2626      1153.9     0.    1442.4 FIXEDHF     0.800  0       0.0  0
3182    Ya 3E2626       708.2     0.     885.2 FIXEDHF     0.800  0       0.0  0
3183    Ya 5E2626       498.7     0.     623.4 FIXEDHF     0.800  0       0.0  0
3184    Yb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8f      -3d11f
3185    Yb 2D2626      1135.3     0.    1419.1 FIXEDHF     0.800  0       0.0  0
3186    Yb 4D2626       603.0     0.     753.8 FIXEDHF     0.800  0       0.0  0
3187    Yb 1E2626       996.4     0.    1245.5 FIXEDHF     0.800  0       0.0  0
3188    Yb 3E2626       611.9     0.     764.9 FIXEDHF     0.800  0       0.0  0
3189    Yb 5E2626       431.0     0.     538.8 FIXEDHF     0.800  0       0.0  0
3190    Yc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8f      -3d12f
3191    Yc 2D2626       986.2     0.    1232.7 FIXEDHF     0.800  0       0.0  0
3192    Yc 4D2626       527.1     0.     658.9 FIXEDHF     0.800  0       0.0  0
3193    Yc 1E2626       871.8     0.    1089.8 FIXEDHF     0.800  0       0.0  0
3194    Yc 3E2626       535.7     0.     669.6 FIXEDHF     0.800  0       0.0  0
3195    Yc 5E2626       377.4     0.     471.8 FIXEDHF     0.800  0       0.0  0
3196    Yd 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8f      -3d13f
3197    Yd 2D2626       867.6     0.    1084.5 FIXEDHF     0.800  0       0.0  0
3198    Yd 4D2626       465.9     0.     582.4 FIXEDHF     0.800  0       0.0  0
3199    Yd 1E2626       771.4     0.     964.2 FIXEDHF     0.800  0       0.0  0
3200    Yd 3E2626       474.1     0.     592.6 FIXEDHF     0.800  0       0.0  0
3201    Yd 5E2626       334.1     0.     417.6 FIXEDHF     0.800  0       0.0  0
3202    Ye 2D2636      -960.6     0.   -1200.7 FIXEDHF     0.800  0       0.0  0  3d8f      -4s4f
3203    Ye 3E2636     -1704.4     0.   -2130.5 FIXEDHF     0.800  0       0.0  0
3204    Yf 2D2636     -1058.1     0.   -1322.6 FIXEDHF     0.800  0       0.0  0  3d8f      -4s5f
3205    Yf 3E2636     -1161.3     0.   -1451.6 FIXEDHF     0.800  0       0.0  0
3206    Yg 2D2636      -917.9     0.   -1147.4 FIXEDHF     0.800  0       0.0  0  3d8f      -4s6f
3207    Yg 3E2636      -832.5     0.   -1040.6 FIXEDHF     0.800  0       0.0  0
3208    Yh 2D2636      -763.8     0.    -954.7 FIXEDHF     0.800  0       0.0  0  3d8f      -4s7f
3209    Yh 3E2636      -632.0     0.    -790.0 FIXEDHF     0.800  0       0.0  0
3210    Yi 2D2636      -638.3     0.    -797.9 FIXEDHF     0.800  0       0.0  0  3d8f      -4s8f
3211    Yi 3E2636      -500.4     0.    -625.5 FIXEDHF     0.800  0       0.0  0
3212    Yj 2D2636      -478.2     0.    -597.8 FIXEDHF     0.800  0       0.0  0  3d8f      -4s9f
3213    Yj 3E2636      -408.9     0.    -511.1 FIXEDHF     0.800  0       0.0  0
3214    Yk 2D2636      -381.0     0.    -476.3 FIXEDHF     0.800  0       0.0  0  3d8f      -4s10f
3215    Yk 3E2636      -342.3     0.    -427.9 FIXEDHF     0.800  0       0.0  0
3216    Yl 2D2636      -313.9     0.    -392.4 FIXEDHF     0.800  0       0.0  0  3d8f      -4s11f
3217    Yl 3E2636      -292.2     0.    -365.3 FIXEDHF     0.800  0       0.0  0
3218    Ym 2D2636      -265.0     0.    -331.3 FIXEDHF     0.800  0       0.0  0  3d8f      -4s12f
3219    Ym 3E2636      -253.4     0.    -316.7 FIXEDHF     0.800  0       0.0  0
3220    Yn 2D2636      -228.0     0.    -285.0 FIXEDHF     0.800  0       0.0  0  3d8f      -4s13f
3221    Yn 3E2636      -222.5     0.    -278.1 FIXEDHF     0.800  0       0.0  0
3222    Yo 2D2627       -31.2     0.     -39.0 FIXEDHF     0.800  0       0.0  0  3d8f      -3d6h
3223    Yo 4D2627        21.2     0.      26.5 FIXEDHF     0.800  0       0.0  0
3224    Yo 3E2627        52.2     0.      65.3 FIXEDHF     0.800  0       0.0  0
3225    Yo 5E2627        33.2     0.      41.5 FIXEDHF     0.800  0       0.0  0
3226    Yp 2D2627       -40.4     0.     -50.5 FIXEDHF     0.800  0       0.0  0  3d8f      -3d7h
3227    Yp 4D2627        27.0     0.      33.8 FIXEDHF     0.800  0       0.0  0
3228    Yp 3E2627        59.7     0.      74.6 FIXEDHF     0.800  0       0.0  0
3229    Yp 5E2627        38.2     0.      47.7 FIXEDHF     0.800  0       0.0  0
3230    Yq 2D2627       -41.1     0.     -51.4 FIXEDHF     0.800  0       0.0  0  3d8f      -3d8h
3231    Yq 4D2627        28.4     0.      35.5 FIXEDHF     0.800  0       0.0  0
3232    Yq 3E2627        58.6     0.      73.2 FIXEDHF     0.800  0       0.0  0
3233    Yq 5E2627        37.6     0.      47.0 FIXEDHF     0.800  0       0.0  0
3234    Yr 2D2627       -92.2     0.    -115.2 FIXEDHF     0.800  0       0.0  0  3d8f      -3d9h
3235    Yr 4D2627        27.6     0.      34.5 FIXEDHF     0.800  0       0.0  0
3236    Yr 3E2627        54.7     0.      68.4 FIXEDHF     0.800  0       0.0  0
3237    Yr 5E2627        35.2     0.      44.0 FIXEDHF     0.800  0       0.0  0
3238    Ys 2D2637        74.3     0.      92.9 FIXEDHF     0.800  0       0.0  0  3d8f      -4s6h
3239    Ys 3E2637       -52.6     0.     -65.7 FIXEDHF     0.800  0       0.0  0
3240    Yt 2D2637        91.3     0.     114.1 FIXEDHF     0.800  0       0.0  0  3d8f      -4s7h
3241    Yt 3E2637       -62.2     0.     -77.7 FIXEDHF     0.800  0       0.0  0
3242    Yu 2D2637        92.6     0.     115.8 FIXEDHF     0.800  0       0.0  0  3d8f      -4s8h
3243    Yu 3E2637       -62.2     0.     -77.7 FIXEDHF     0.800  0       0.0  0
3244    Yv 2D2637       138.6     0.     173.3 FIXEDHF     0.800  0       0.0  0  3d8f      -4s9h
3245    Yv 3E2637       -58.7     0.     -73.4 FIXEDHF     0.800  0       0.0  0
3246    Yy 4D2628        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  3d8f      -3d8k
3247    Yy 5E2628         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
3248    Yz 4D2628        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  3d8f      -3d9k
3249    Yz 5E2628         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
3250    Za 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d9f      -3d10f
3251    Za 2D2626      1121.0     0.    1401.3 FIXEDHF     0.800  0       0.0  0
3252    Za 4D2626       583.2     0.     729.0 FIXEDHF     0.800  0       0.0  0
3253    Za 1E2626       961.5     0.    1201.9 FIXEDHF     0.800  0       0.0  0
3254    Za 3E2626       591.0     0.     738.8 FIXEDHF     0.800  0       0.0  0
3255    Za 5E2626       416.5     0.     520.6 FIXEDHF     0.800  0       0.0  0
3256    Zb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d9f      -3d11f
3257    Zb 2D2626       958.7     0.    1198.4 FIXEDHF     0.800  0       0.0  0
3258    Zb 4D2626       503.3     0.     629.1 FIXEDHF     0.800  0       0.0  0
3259    Zb 1E2626       830.4     0.    1038.0 FIXEDHF     0.800  0       0.0  0
3260    Zb 3E2626       510.8     0.     638.5 FIXEDHF     0.800  0       0.0  0
3261    Zb 5E2626       360.1     0.     450.1 FIXEDHF     0.800  0       0.0  0
3262    Zc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d9f      -3d12f
3263    Zc 2D2626       833.0     0.    1041.2 FIXEDHF     0.800  0       0.0  0
3264    Zc 4D2626       440.2     0.     550.2 FIXEDHF     0.800  0       0.0  0
3265    Zc 1E2626       726.6     0.     908.3 FIXEDHF     0.800  0       0.0  0
3266    Zc 3E2626       447.2     0.     559.0 FIXEDHF     0.800  0       0.0  0
3267    Zc 5E2626       315.3     0.     394.1 FIXEDHF     0.800  0       0.0  0
3268    Zd 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d9f      -3d13f
3269    Zd 2D2626       733.0     0.     916.2 FIXEDHF     0.800  0       0.0  0
3270    Zd 4D2626       389.2     0.     486.5 FIXEDHF     0.800  0       0.0  0
3271    Zd 1E2626       642.9     0.     803.6 FIXEDHF     0.800  0       0.0  0
3272    Zd 3E2626       395.8     0.     494.7 FIXEDHF     0.800  0       0.0  0
3273    Zd 5E2626       279.1     0.     348.9 FIXEDHF     0.800  0       0.0  0
3274    Ze 2D2636      -712.2     0.    -890.2 FIXEDHF     0.800  0       0.0  0  3d9f      -4s4f
3275    Ze 3E2636     -1324.0     0.   -1655.0 FIXEDHF     0.800  0       0.0  0
3276    Zf 2D2636      -814.8     0.   -1018.5 FIXEDHF     0.800  0       0.0  0  3d9f      -4s5f
3277    Zf 3E2636      -913.0     0.   -1141.3 FIXEDHF     0.800  0       0.0  0
3278    Zg 2D2636      -717.0     0.    -896.2 FIXEDHF     0.800  0       0.0  0  3d9f      -4s6f
3279    Zg 3E2636      -657.7     0.    -822.1 FIXEDHF     0.800  0       0.0  0
3280    Zh 2D2636      -601.4     0.    -751.7 FIXEDHF     0.800  0       0.0  0  3d9f      -4s7f
3281    Zh 3E2636      -500.6     0.    -625.7 FIXEDHF     0.800  0       0.0  0
3282    Zi 2D2636      -502.3     0.    -627.9 FIXEDHF     0.800  0       0.0  0  3d9f      -4s8f
3283    Zi 3E2636      -397.0     0.    -496.2 FIXEDHF     0.800  0       0.0  0
3284    Zj 2D2636      -425.1     0.    -531.4 FIXEDHF     0.800  0       0.0  0  3d9f      -4s9f
3285    Zj 3E2636      -324.6     0.    -405.8 FIXEDHF     0.800  0       0.0  0
3286    Zk 2D2636      -334.6     0.    -418.2 FIXEDHF     0.800  0       0.0  0  3d9f      -4s10f
3287    Zk 3E2636      -272.0     0.    -340.0 FIXEDHF     0.800  0       0.0  0
3288    Zl 2D2636      -275.4     0.    -344.3 FIXEDHF     0.800  0       0.0  0  3d9f      -4s11f
3289    Zl 3E2636      -232.3     0.    -290.4 FIXEDHF     0.800  0       0.0  0
3290    Zm 2D2636      -232.6     0.    -290.8 FIXEDHF     0.800  0       0.0  0  3d9f      -4s12f
3291    Zm 3E2636      -201.5     0.    -251.9 FIXEDHF     0.800  0       0.0  0
3292    Zn 2D2636      -200.2     0.    -250.3 FIXEDHF     0.800  0       0.0  0  3d9f      -4s13f
3293    Zn 3E2636      -177.0     0.    -221.2 FIXEDHF     0.800  0       0.0  0
3294    Zo 2D2627       -24.4     0.     -30.5 FIXEDHF     0.800  0       0.0  0  3d9f      -3d6h
3295    Zo 4D2627        16.0     0.      20.0 FIXEDHF     0.800  0       0.0  0
3296    Zo 3E2627        42.6     0.      53.3 FIXEDHF     0.800  0       0.0  0
3297    Zo 5E2627        27.0     0.      33.7 FIXEDHF     0.800  0       0.0  0
3298    Zp 2D2627       -31.0     0.     -38.8 FIXEDHF     0.800  0       0.0  0  3d9f      -3d7h
3299    Zp 4D2627        20.6     0.      25.7 FIXEDHF     0.800  0       0.0  0
3300    Zp 3E2627        48.7     0.      60.9 FIXEDHF     0.800  0       0.0  0
3301    Zp 5E2627        31.0     0.      38.8 FIXEDHF     0.800  0       0.0  0
3302    Zq 2D2627       -33.6     0.     -42.0 FIXEDHF     0.800  0       0.0  0  3d9f      -3d8h
3303    Zq 4D2627        21.6     0.      27.0 FIXEDHF     0.800  0       0.0  0
3304    Zq 3E2627        47.8     0.      59.8 FIXEDHF     0.800  0       0.0  0
3305    Zq 5E2627        30.6     0.      38.3 FIXEDHF     0.800  0       0.0  0
3306    Zr 2D2627       -32.2     0.     -40.3 FIXEDHF     0.800  0       0.0  0  3d9f      -3d9h
3307    Zr 4D2627        21.2     0.      26.5 FIXEDHF     0.800  0       0.0  0
3308    Zr 3E2627        44.7     0.      55.9 FIXEDHF     0.800  0       0.0  0
3309    Zr 5E2627        28.7     0.      35.9 FIXEDHF     0.800  0       0.0  0
3310    Zs 2D2637        59.7     0.      74.6 FIXEDHF     0.800  0       0.0  0  3d9f      -4s6h
3311    Zs 3E2637       -38.6     0.     -48.2 FIXEDHF     0.800  0       0.0  0
3312    Zt 2D2637        72.7     0.      90.9 FIXEDHF     0.800  0       0.0  0  3d9f      -4s7h
3313    Zt 3E2637       -45.8     0.     -57.3 FIXEDHF     0.800  0       0.0  0
3314    Zu 2D2637        75.6     0.      94.5 FIXEDHF     0.800  0       0.0  0  3d9f      -4s8h
3315    Zu 3E2637       -46.0     0.     -57.5 FIXEDHF     0.800  0       0.0  0
3316    Zv 2D2637        72.5     0.      90.6 FIXEDHF     0.800  0       0.0  0  3d9f      -4s9h
3317    Zv 3E2637       -43.5     0.     -54.4 FIXEDHF     0.800  0       0.0  0
3318    Zy 4D2628        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  3d9f      -3d8k
3319    Zy 5E2628         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
3320    Zz 4D2628        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  3d9f      -3d9k
3321    Zz 5E2628         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
3322    ab 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d10f     -3d11f
3323    ab 2D2626       822.2     0.    1027.8 FIXEDHF     0.800  0       0.0  0
3324    ab 4D2626       428.1     0.     535.1 FIXEDHF     0.800  0       0.0  0
3325    ab 1E2626       705.8     0.     882.3 FIXEDHF     0.800  0       0.0  0
3326    ab 3E2626       434.6     0.     543.3 FIXEDHF     0.800  0       0.0  0
3327    ab 5E2626       306.5     0.     383.1 FIXEDHF     0.800  0       0.0  0
3328    ac 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d10f     -3d12f
3329    ac 2D2626       714.4     0.     893.0 FIXEDHF     0.800  0       0.0  0
3330    ac 4D2626       374.5     0.     468.1 FIXEDHF     0.800  0       0.0  0
3331    ac 1E2626       617.7     0.     772.1 FIXEDHF     0.800  0       0.0  0
3332    ac 3E2626       380.6     0.     475.7 FIXEDHF     0.800  0       0.0  0
3333    ac 5E2626       268.4     0.     335.5 FIXEDHF     0.800  0       0.0  0
3334    ad 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d10f     -3d13f
3335    ad 2D2626       628.7     0.     785.9 FIXEDHF     0.800  0       0.0  0
3336    ad 4D2626       331.2     0.     414.0 FIXEDHF     0.800  0       0.0  0
3337    ad 1E2626       546.6     0.     683.2 FIXEDHF     0.800  0       0.0  0
3338    ad 3E2626       336.8     0.     421.0 FIXEDHF     0.800  0       0.0  0
3339    ad 5E2626       237.7     0.     297.1 FIXEDHF     0.800  0       0.0  0
3340    ae 2D2636      -554.8     0.    -693.5 FIXEDHF     0.800  0       0.0  0  3d10f     -4s4f
3341    ae 3E2636     -1068.7     0.   -1335.9 FIXEDHF     0.800  0       0.0  0
3342    af 2D2636      -653.8     0.    -817.2 FIXEDHF     0.800  0       0.0  0  3d10f     -4s5f
3343    af 3E2636      -743.6     0.    -929.5 FIXEDHF     0.800  0       0.0  0
3344    ag 2D2636      -581.3     0.    -726.6 FIXEDHF     0.800  0       0.0  0  3d10f     -4s6f
3345    ag 3E2636      -537.5     0.    -671.9 FIXEDHF     0.800  0       0.0  0
3346    ah 2D2636      -490.6     0.    -613.2 FIXEDHF     0.800  0       0.0  0  3d10f     -4s7f
3347    ah 3E2636      -409.9     0.    -512.4 FIXEDHF     0.800  0       0.0  0
3348    ai 2D2636      -411.4     0.    -514.3 FIXEDHF     0.800  0       0.0  0  3d10f     -4s8f
3349    ai 3E2636      -325.4     0.    -406.7 FIXEDHF     0.800  0       0.0  0
3350    aj 2D2636      -347.6     0.    -434.5 FIXEDHF     0.800  0       0.0  0  3d10f     -4s9f
3351    aj 3E2636      -266.3     0.    -332.9 FIXEDHF     0.800  0       0.0  0
3352    ak 2D2636      -298.1     0.    -372.6 FIXEDHF     0.800  0       0.0  0  3d10f     -4s10f
3353    ak 3E2636      -223.3     0.    -279.1 FIXEDHF     0.800  0       0.0  0
3354    al 2D2636      -243.0     0.    -303.7 FIXEDHF     0.800  0       0.0  0  3d10f     -4s11f
3355    al 3E2636      -190.7     0.    -238.4 FIXEDHF     0.800  0       0.0  0
3356    am 2D2636      -205.0     0.    -256.3 FIXEDHF     0.800  0       0.0  0  3d10f     -4s12f
3357    am 3E2636      -165.5     0.    -206.9 FIXEDHF     0.800  0       0.0  0
3358    an 2D2636      -176.5     0.    -220.6 FIXEDHF     0.800  0       0.0  0  3d10f     -4s13f
3359    an 3E2636      -145.4     0.    -181.7 FIXEDHF     0.800  0       0.0  0
3360    ao 2D2627       -19.9     0.     -24.9 FIXEDHF     0.800  0       0.0  0  3d10f     -3d6h
3361    ao 4D2627        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0
3362    ao 3E2627        35.7     0.      44.6 FIXEDHF     0.800  0       0.0  0
3363    ao 5E2627        22.5     0.      28.1 FIXEDHF     0.800  0       0.0  0
3364    ap 2D2627       -25.0     0.     -31.2 FIXEDHF     0.800  0       0.0  0  3d10f     -3d7h
3365    ap 4D2627        16.3     0.      20.4 FIXEDHF     0.800  0       0.0  0
3366    ap 3E2627        40.8     0.      51.0 FIXEDHF     0.800  0       0.0  0
3367    ap 5E2627        25.9     0.      32.4 FIXEDHF     0.800  0       0.0  0
3368    aq 2D2627       -26.8     0.     -33.5 FIXEDHF     0.800  0       0.0  0  3d10f     -3d8h
3369    aq 4D2627        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0
3370    aq 3E2627        40.1     0.      50.1 FIXEDHF     0.800  0       0.0  0
3371    aq 5E2627        25.6     0.      32.0 FIXEDHF     0.800  0       0.0  0
3372    ar 2D2627       -27.0     0.     -33.8 FIXEDHF     0.800  0       0.0  0  3d10f     -3d9h
3373    ar 4D2627        16.9     0.      21.1 FIXEDHF     0.800  0       0.0  0
3374    ar 3E2627        37.5     0.      46.9 FIXEDHF     0.800  0       0.0  0
3375    ar 5E2627        24.0     0.      30.0 FIXEDHF     0.800  0       0.0  0
3376    as 2D2637        49.4     0.      61.8 FIXEDHF     0.800  0       0.0  0  3d10f     -4s6h
3377    as 3E2637       -29.7     0.     -37.1 FIXEDHF     0.800  0       0.0  0
3378    at 2D2637        60.0     0.      75.0 FIXEDHF     0.800  0       0.0  0  3d10f     -4s7h
3379    at 3E2637       -35.5     0.     -44.4 FIXEDHF     0.800  0       0.0  0
3380    au 2D2637        62.1     0.      77.6 FIXEDHF     0.800  0       0.0  0  3d10f     -4s8h
3381    au 3E2637       -35.8     0.     -44.7 FIXEDHF     0.800  0       0.0  0
3382    av 2D2637        60.7     0.      75.9 FIXEDHF     0.800  0       0.0  0  3d10f     -4s9h
3383    av 3E2637       -33.9     0.     -42.4 FIXEDHF     0.800  0       0.0  0
3384    ay 4D2628        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  3d10f     -3d8k
3385    ay 5E2628         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
3386    az 4D2628        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  3d10f     -3d9k
3387    az 5E2628         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
3388    bc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d11f     -3d12f
3389    bc 2D2626       621.0     0.     776.2 FIXEDHF     0.800  0       0.0  0
3390    bc 4D2626       323.6     0.     404.5 FIXEDHF     0.800  0       0.0  0
3391    bc 1E2626       533.5     0.     666.9 FIXEDHF     0.800  0       0.0  0
3392    bc 3E2626       329.0     0.     411.2 FIXEDHF     0.800  0       0.0  0
3393    bc 5E2626       232.2     0.     290.2 FIXEDHF     0.800  0       0.0  0
3394    bd 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d11f     -3d13f
3395    bd 2D2626       546.4     0.     683.0 FIXEDHF     0.800  0       0.0  0
3396    bd 4D2626       286.2     0.     357.8 FIXEDHF     0.800  0       0.0  0
3397    bd 1E2626       472.1     0.     590.1 FIXEDHF     0.800  0       0.0  0
3398    bd 3E2626       291.2     0.     364.0 FIXEDHF     0.800  0       0.0  0
3399    bd 5E2626       205.5     0.     256.9 FIXEDHF     0.800  0       0.0  0
3400    be 2D2636      -448.2     0.    -560.3 FIXEDHF     0.800  0       0.0  0  3d11f     -4s4f
3401    be 3E2636      -887.7     0.   -1109.6 FIXEDHF     0.800  0       0.0  0
3402    bf 2D2636      -540.6     0.    -675.8 FIXEDHF     0.800  0       0.0  0  3d11f     -4s5f
3403    bf 3E2636      -621.8     0.    -777.3 FIXEDHF     0.800  0       0.0  0
3404    bg 2D2636      -484.6     0.    -605.7 FIXEDHF     0.800  0       0.0  0  3d11f     -4s6f
3405    bg 3E2636      -450.7     0.    -563.4 FIXEDHF     0.800  0       0.0  0
3406    bh 2D2636      -410.8     0.    -513.5 FIXEDHF     0.800  0       0.0  0  3d11f     -4s7f
3407    bh 3E2636      -344.2     0.    -430.2 FIXEDHF     0.800  0       0.0  0
3408    bi 2D2636      -345.6     0.    -432.0 FIXEDHF     0.800  0       0.0  0  3d11f     -4s8f
3409    bi 3E2636      -273.4     0.    -341.8 FIXEDHF     0.800  0       0.0  0
3410    bj 2D2636      -292.6     0.    -365.8 FIXEDHF     0.800  0       0.0  0  3d11f     -4s9f
3411    bj 3E2636      -223.9     0.    -279.9 FIXEDHF     0.800  0       0.0  0
3412    bk 2D2636      -250.5     0.    -313.1 FIXEDHF     0.800  0       0.0  0  3d11f     -4s10f
3413    bk 3E2636      -187.8     0.    -234.7 FIXEDHF     0.800  0       0.0  0
3414    bl 2D2636      -217.4     0.    -271.8 FIXEDHF     0.800  0       0.0  0  3d11f     -4s11f
3415    bl 3E2636      -160.5     0.    -200.6 FIXEDHF     0.800  0       0.0  0
3416    bm 2D2636      -182.0     0.    -227.5 FIXEDHF     0.800  0       0.0  0  3d11f     -4s12f
3417    bm 3E2636      -139.3     0.    -174.1 FIXEDHF     0.800  0       0.0  0
3418    bn 2D2636      -156.5     0.    -195.6 FIXEDHF     0.800  0       0.0  0  3d11f     -4s13f
3419    bn 3E2636      -122.4     0.    -153.0 FIXEDHF     0.800  0       0.0  0
3420    bo 2D2627       -16.7     0.     -20.9 FIXEDHF     0.800  0       0.0  0  3d11f     -3d6h
3421    bo 4D2627        10.4     0.      13.0 FIXEDHF     0.800  0       0.0  0
3422    bo 3E2627        30.5     0.      38.1 FIXEDHF     0.800  0       0.0  0
3423    bo 5E2627        19.2     0.      24.0 FIXEDHF     0.800  0       0.0  0
3424    bp 2D2627       -20.7     0.     -25.9 FIXEDHF     0.800  0       0.0  0  3d11f     -3d7h
3425    bp 4D2627        13.4     0.      16.7 FIXEDHF     0.800  0       0.0  0
3426    bp 3E2627        34.9     0.      43.6 FIXEDHF     0.800  0       0.0  0
3427    bp 5E2627        22.1     0.      27.6 FIXEDHF     0.800  0       0.0  0
3428    bq 2D2627       -22.1     0.     -27.6 FIXEDHF     0.800  0       0.0  0  3d11f     -3d8h
3429    bq 4D2627        14.2     0.      17.7 FIXEDHF     0.800  0       0.0  0
3430    bq 3E2627        34.2     0.      42.8 FIXEDHF     0.800  0       0.0  0
3431    bq 5E2627        21.8     0.      27.3 FIXEDHF     0.800  0       0.0  0
3432    br 2D2627       -22.2     0.     -27.7 FIXEDHF     0.800  0       0.0  0  3d11f     -3d9h
3433    br 4D2627        13.9     0.      17.4 FIXEDHF     0.800  0       0.0  0
3434    br 3E2627        32.1     0.      40.1 FIXEDHF     0.800  0       0.0  0
3435    br 5E2627        20.5     0.      25.6 FIXEDHF     0.800  0       0.0  0
3436    bs 2D2637        41.9     0.      52.4 FIXEDHF     0.800  0       0.0  0  3d11f     -4s6h
3437    bs 3E2637       -23.8     0.     -29.7 FIXEDHF     0.800  0       0.0  0
3438    bt 2D2637        50.8     0.      63.5 FIXEDHF     0.800  0       0.0  0  3d11f     -4s7h
3439    bt 3E2637       -28.6     0.     -35.7 FIXEDHF     0.800  0       0.0  0
3440    bu 2D2637        52.3     0.      65.4 FIXEDHF     0.800  0       0.0  0  3d11f     -4s8h
3441    bu 3E2637       -28.8     0.     -36.0 FIXEDHF     0.800  0       0.0  0
3442    bv 2D2637        51.0     0.      63.8 FIXEDHF     0.800  0       0.0  0  3d11f     -4s9h
3443    bv 3E2637       -27.4     0.     -34.2 FIXEDHF     0.800  0       0.0  0
3444    by 4D2628        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  3d11f     -3d8k
3445    by 5E2628         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
3446    bz 4D2628        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  3d11f     -3d9k
3447    bz 5E2628         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
3448    cd 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d12f     -3d13f
3449    cd 2D2626       480.4     0.     600.5 FIXEDHF     0.800  0       0.0  0
3450    cd 4D2626       250.6     0.     313.2 FIXEDHF     0.800  0       0.0  0
3451    cd 1E2626       413.1     0.     516.4 FIXEDHF     0.800  0       0.0  0
3452    cd 3E2626       255.0     0.     318.7 FIXEDHF     0.800  0       0.0  0
3453    cd 5E2626       180.0     0.     225.0 FIXEDHF     0.800  0       0.0  0
3454    ce 2D2636      -372.2     0.    -465.3 FIXEDHF     0.800  0       0.0  0  3d12f     -4s4f
3455    ce 3E2636      -753.7     0.    -942.1 FIXEDHF     0.800  0       0.0  0
3456    cf 2D2636      -457.6     0.    -572.0 FIXEDHF     0.800  0       0.0  0  3d12f     -4s5f
3457    cf 3E2636      -530.8     0.    -663.5 FIXEDHF     0.800  0       0.0  0
3458    cg 2D2636      -412.6     0.    -515.8 FIXEDHF     0.800  0       0.0  0  3d12f     -4s6f
3459    cg 3E2636      -385.5     0.    -481.9 FIXEDHF     0.800  0       0.0  0
3460    ch 2D2636      -351.0     0.    -438.8 FIXEDHF     0.800  0       0.0  0  3d12f     -4s7f
3461    ch 3E2636      -294.7     0.    -368.4 FIXEDHF     0.800  0       0.0  0
3462    ci 2D2636      -296.1     0.    -370.1 FIXEDHF     0.800  0       0.0  0  3d12f     -4s8f
3463    ci 3E2636      -234.3     0.    -292.9 FIXEDHF     0.800  0       0.0  0
3464    cj 2D2636      -251.2     0.    -314.0 FIXEDHF     0.800  0       0.0  0  3d12f     -4s9f
3465    cj 3E2636      -191.9     0.    -239.9 FIXEDHF     0.800  0       0.0  0
3466    ck 2D2636      -215.3     0.    -269.1 FIXEDHF     0.800  0       0.0  0  3d12f     -4s10f
3467    ck 3E2636      -161.0     0.    -201.3 FIXEDHF     0.800  0       0.0  0
3468    cl 2D2636      -186.6     0.    -233.2 FIXEDHF     0.800  0       0.0  0  3d12f     -4s11f
3469    cl 3E2636      -137.6     0.    -172.0 FIXEDHF     0.800  0       0.0  0
3470    cm 2D2636      -163.7     0.    -204.6 FIXEDHF     0.800  0       0.0  0  3d12f     -4s12f
3471    cm 3E2636      -119.4     0.    -149.3 FIXEDHF     0.800  0       0.0  0
3472    cn 2D2636      -139.8     0.    -174.8 FIXEDHF     0.800  0       0.0  0  3d12f     -4s13f
3473    cn 3E2636      -105.0     0.    -131.2 FIXEDHF     0.800  0       0.0  0
3474    co 2D2627       -14.3     0.     -17.9 FIXEDHF     0.800  0       0.0  0  3d12f     -3d6h
3475    co 4D2627         8.7     0.      10.9 FIXEDHF     0.800  0       0.0  0
3476    co 3E2627        26.5     0.      33.1 FIXEDHF     0.800  0       0.0  0
3477    co 5E2627        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0
3478    cp 2D2627       -17.7     0.     -22.1 FIXEDHF     0.800  0       0.0  0  3d12f     -3d7h
3479    cp 4D2627        11.3     0.      14.1 FIXEDHF     0.800  0       0.0  0
3480    cp 3E2627        30.2     0.      37.8 FIXEDHF     0.800  0       0.0  0
3481    cp 5E2627        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0
3482    cq 2D2627       -18.6     0.     -23.3 FIXEDHF     0.800  0       0.0  0  3d12f     -3d8h
3483    cq 4D2627        11.9     0.      14.9 FIXEDHF     0.800  0       0.0  0
3484    cq 3E2627        29.8     0.      37.2 FIXEDHF     0.800  0       0.0  0
3485    cq 5E2627        18.9     0.      23.6 FIXEDHF     0.800  0       0.0  0
3486    cr 2D2627       -18.6     0.     -23.3 FIXEDHF     0.800  0       0.0  0  3d12f     -3d9h
3487    cr 4D2627        11.7     0.      14.6 FIXEDHF     0.800  0       0.0  0
3488    cr 3E2627        27.8     0.      34.8 FIXEDHF     0.800  0       0.0  0
3489    cr 5E2627        17.8     0.      22.2 FIXEDHF     0.800  0       0.0  0
3490    cs 2D2637        36.2     0.      45.3 FIXEDHF     0.800  0       0.0  0  3d12f     -4s6h
3491    cs 3E2637       -19.6     0.     -24.5 FIXEDHF     0.800  0       0.0  0
3492    ct 2D2637        43.8     0.      54.7 FIXEDHF     0.800  0       0.0  0  3d12f     -4s7h
3493    ct 3E2637       -23.6     0.     -29.5 FIXEDHF     0.800  0       0.0  0
3494    cu 2D2637        45.0     0.      56.3 FIXEDHF     0.800  0       0.0  0  3d12f     -4s8h
3495    cu 3E2637       -23.8     0.     -29.8 FIXEDHF     0.800  0       0.0  0
3496    cv 2D2637        43.8     0.      54.7 FIXEDHF     0.800  0       0.0  0  3d12f     -4s9h
3497    cv 3E2637       -22.7     0.     -28.4 FIXEDHF     0.800  0       0.0  0
3498    cy 4D2628        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  3d12f     -3d8k
3499    cy 5E2628         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3500    cz 4D2628        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  3d12f     -3d9k
3501    cz 5E2628         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
3502    de 2D2636      -316.0     0.    -395.0 FIXEDHF     0.800  0       0.0  0  3d13f     -4s4f
3503    de 3E2636      -651.1     0.    -813.9 FIXEDHF     0.800  0       0.0  0
3504    df 2D2636      -394.3     0.    -492.9 FIXEDHF     0.800  0       0.0  0  3d13f     -4s5f
3505    df 3E2636      -460.5     0.    -575.6 FIXEDHF     0.800  0       0.0  0
3506    dg 2D2636      -357.4     0.    -446.7 FIXEDHF     0.800  0       0.0  0  3d13f     -4s6f
3507    dg 3E2636      -335.0     0.    -418.7 FIXEDHF     0.800  0       0.0  0
3508    dh 2D2636      -304.8     0.    -381.0 FIXEDHF     0.800  0       0.0  0  3d13f     -4s7f
3509    dh 3E2636      -256.3     0.    -320.4 FIXEDHF     0.800  0       0.0  0
3510    di 2D2636      -257.6     0.    -322.0 FIXEDHF     0.800  0       0.0  0  3d13f     -4s8f
3511    di 3E2636      -203.8     0.    -254.8 FIXEDHF     0.800  0       0.0  0
3512    dj 2D2636      -218.9     0.    -273.6 FIXEDHF     0.800  0       0.0  0  3d13f     -4s9f
3513    dj 3E2636      -167.1     0.    -208.9 FIXEDHF     0.800  0       0.0  0
3514    dk 2D2636      -187.8     0.    -234.7 FIXEDHF     0.800  0       0.0  0  3d13f     -4s10f
3515    dk 3E2636      -140.2     0.    -175.2 FIXEDHF     0.800  0       0.0  0
3516    dl 2D2636      -162.9     0.    -203.6 FIXEDHF     0.800  0       0.0  0  3d13f     -4s11f
3517    dl 3E2636      -119.8     0.    -149.8 FIXEDHF     0.800  0       0.0  0
3518    dm 2D2636      -142.7     0.    -178.4 FIXEDHF     0.800  0       0.0  0  3d13f     -4s12f
3519    dm 3E2636      -104.0     0.    -130.0 FIXEDHF     0.800  0       0.0  0
3520    dn 2D2636      -126.5     0.    -158.1 FIXEDHF     0.800  0       0.0  0  3d13f     -4s13f
3521    dn 3E2636       -91.4     0.    -114.3 FIXEDHF     0.800  0       0.0  0
3522    do 2D2627       -12.5     0.     -15.6 FIXEDHF     0.800  0       0.0  0  3d13f     -3d6h
3523    do 4D2627         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0
3524    do 3E2627        23.3     0.      29.1 FIXEDHF     0.800  0       0.0  0
3525    do 5E2627        14.6     0.      18.2 FIXEDHF     0.800  0       0.0  0
3526    dp 2D2627       -15.3     0.     -19.1 FIXEDHF     0.800  0       0.0  0  3d13f     -3d7h
3527    dp 4D2627         9.7     0.      12.1 FIXEDHF     0.800  0       0.0  0
3528    dp 3E2627        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0
3529    dp 5E2627        16.8     0.      21.0 FIXEDHF     0.800  0       0.0  0
3530    dq 2D2627       -16.1     0.     -20.1 FIXEDHF     0.800  0       0.0  0  3d13f     -3d8h
3531    dq 4D2627        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0
3532    dq 3E2627        26.2     0.      32.7 FIXEDHF     0.800  0       0.0  0
3533    dq 5E2627        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0
3534    dr 2D2627       -16.0     0.     -20.0 FIXEDHF     0.800  0       0.0  0  3d13f     -3d9h
3535    dr 4D2627        10.1     0.      12.6 FIXEDHF     0.800  0       0.0  0
3536    dr 3E2627        24.5     0.      30.6 FIXEDHF     0.800  0       0.0  0
3537    dr 5E2627        15.6     0.      19.5 FIXEDHF     0.800  0       0.0  0
3538    ds 2D2637        31.7     0.      39.6 FIXEDHF     0.800  0       0.0  0  3d13f     -4s6h
3539    ds 3E2637       -16.6     0.     -20.7 FIXEDHF     0.800  0       0.0  0
3540    dt 2D2637        38.3     0.      47.9 FIXEDHF     0.800  0       0.0  0  3d13f     -4s7h
3541    dt 3E2637       -20.0     0.     -25.0 FIXEDHF     0.800  0       0.0  0
3542    du 2D2637        39.3     0.      49.1 FIXEDHF     0.800  0       0.0  0  3d13f     -4s8h
3543    du 3E2637       -20.2     0.     -25.3 FIXEDHF     0.800  0       0.0  0
3544    dv 2D2637        38.1     0.      47.6 FIXEDHF     0.800  0       0.0  0  3d13f     -4s9h
3545    dv 3E2637       -19.3     0.     -24.1 FIXEDHF     0.800  0       0.0  0
3546    dy 4D2628        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  3d13f     -3d8k
3547    dy 5E2628         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3548    dz 4D2628        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  3d13f     -3d9k
3549    dz 5E2628         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
3550    ef 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s5f
3551    ef 3E3636     11243.5     0.   14054.4 FIXEDHF     0.800  0       0.0  0
3552    eg 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s6f
3553    eg 3E3636      5519.1     0.    6898.9 FIXEDHF     0.800  0       0.0  0
3554    eh 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s7f
3555    eh 3E3636      3195.6     0.    3994.5 FIXEDHF     0.800  0       0.0  0
3556    ei 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s8f
3557    ei 3E3636      2061.0     0.    2576.2 FIXEDHF     0.800  0       0.0  0
3558    ej 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s9f
3559    ej 3E3636      1434.6     0.    1793.3 FIXEDHF     0.800  0       0.0  0
3560    ek 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s10f
3561    ek 3E3636      1057.0     0.    1321.2 FIXEDHF     0.800  0       0.0  0
3562    el 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s11f
3563    el 3E3636       813.2     0.    1016.5 FIXEDHF     0.800  0       0.0  0
3564    em 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s12f
3565    em 3E3636       647.4     0.     809.3 FIXEDHF     0.800  0       0.0  0
3566    en 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s13f
3567    en 3E3636       529.7     0.     662.1 FIXEDHF     0.800  0       0.0  0
3568    eo 2D3627     -1452.2     0.   -1815.3 FIXEDHF     0.800  0       0.0  0  4s4f      -3d6h
3569    eo 5E3627      -481.6     0.    -602.0 FIXEDHF     0.800  0       0.0  0
3570    ep 2D3627     -1435.4     0.   -1794.2 FIXEDHF     0.800  0       0.0  0  4s4f      -3d7h
3571    ep 5E3627      -524.1     0.    -655.1 FIXEDHF     0.800  0       0.0  0
3572    eq 2D3627     -1291.6     0.   -1614.5 FIXEDHF     0.800  0       0.0  0  4s4f      -3d8h
3573    eq 5E3627      -499.0     0.    -623.7 FIXEDHF     0.800  0       0.0  0
3574    er 2D3627     -1140.3     0.   -1425.4 FIXEDHF     0.800  0       0.0  0  4s4f      -3d9h
3575    er 5E3627      -456.8     0.    -571.0 FIXEDHF     0.800  0       0.0  0
3576    fg 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s6f
3577    fg 3E3636      3485.4     0.    4356.7 FIXEDHF     0.800  0       0.0  0
3578    fh 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s7f
3579    fh 3E3636      2333.9     0.    2917.4 FIXEDHF     0.800  0       0.0  0
3580    fi 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s8f
3581    fi 3E3636      1689.6     0.    2112.0 FIXEDHF     0.800  0       0.0  0
3582    fj 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s9f
3583    fj 3E3636      1292.8     0.    1616.0 FIXEDHF     0.800  0       0.0  0
3584    fk 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s10f
3585    fk 3E3636      1030.2     0.    1287.8 FIXEDHF     0.800  0       0.0  0
3586    fl 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s11f
3587    fl 3E3636       846.6     0.    1058.3 FIXEDHF     0.800  0       0.0  0
3588    fm 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s12f
3589    fm 3E3636       712.5     0.     890.6 FIXEDHF     0.800  0       0.0  0
3590    fn 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s13f
3591    fn 3E3636       611.0     0.     763.7 FIXEDHF     0.800  0       0.0  0
3592    fo 2D3627       895.7     0.    1119.6 FIXEDHF     0.800  0       0.0  0  4s5f      -3d6h
3593    fo 5E3627      -219.8     0.    -274.8 FIXEDHF     0.800  0       0.0  0
3594    fp 2D3627       472.0     0.     590.0 FIXEDHF     0.800  0       0.0  0  4s5f      -3d7h
3595    fp 5E3627      -244.1     0.    -305.1 FIXEDHF     0.800  0       0.0  0
3596    fq 2D3627       254.6     0.     318.3 FIXEDHF     0.800  0       0.0  0  4s5f      -3d8h
3597    fq 5E3627      -235.4     0.    -294.2 FIXEDHF     0.800  0       0.0  0
3598    fr 2D3627       140.2     0.     175.3 FIXEDHF     0.800  0       0.0  0  4s5f      -3d9h
3599    fr 5E3627      -217.3     0.    -271.6 FIXEDHF     0.800  0       0.0  0
3600    gh 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s7f
3601    gh 3E3636      1611.9     0.    2014.9 FIXEDHF     0.800  0       0.0  0
3602    gi 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s8f
3603    gi 3E3636      1212.1     0.    1515.1 FIXEDHF     0.800  0       0.0  0
3604    gj 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s9f
3605    gj 3E3636       953.3     0.    1191.6 FIXEDHF     0.800  0       0.0  0
3606    gk 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s10f
3607    gk 3E3636       775.5     0.     969.4 FIXEDHF     0.800  0       0.0  0
3608    gl 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s11f
3609    gl 3E3636       647.4     0.     809.3 FIXEDHF     0.800  0       0.0  0
3610    gm 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s12f
3611    gm 3E3636       551.8     0.     689.7 FIXEDHF     0.800  0       0.0  0
3612    gn 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s13f
3613    gn 3E3636       477.9     0.     597.4 FIXEDHF     0.800  0       0.0  0
3614    go 2D3627       142.1     0.     177.6 FIXEDHF     0.800  0       0.0  0  4s6f      -3d6h
3615    go 5E3627      -127.4     0.    -159.2 FIXEDHF     0.800  0       0.0  0
3616    gp 2D3627       438.2     0.     547.7 FIXEDHF     0.800  0       0.0  0  4s6f      -3d7h
3617    gp 5E3627      -143.0     0.    -178.8 FIXEDHF     0.800  0       0.0  0
3618    gq 2D3627       369.1     0.     461.4 FIXEDHF     0.800  0       0.0  0  4s6f      -3d8h
3619    gq 5E3627      -138.9     0.    -173.6 FIXEDHF     0.800  0       0.0  0
3620    gr 2D3627       292.7     0.     365.9 FIXEDHF     0.800  0       0.0  0  4s6f      -3d9h
3621    gr 5E3627      -128.9     0.    -161.1 FIXEDHF     0.800  0       0.0  0
3622    hi 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s8f
3623    hi 3E3636       903.4     0.    1129.2 FIXEDHF     0.800  0       0.0  0
3624    hj 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s9f
3625    hj 3E3636       720.6     0.     900.8 FIXEDHF     0.800  0       0.0  0
3626    hk 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s10f
3627    hk 3E3636       592.3     0.     740.4 FIXEDHF     0.800  0       0.0  0
3628    hl 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s11f
3629    hl 3E3636       498.4     0.     623.0 FIXEDHF     0.800  0       0.0  0
3630    hm 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s12f
3631    hm 3E3636       427.3     0.     534.1 FIXEDHF     0.800  0       0.0  0
3632    hn 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s13f
3633    hn 3E3636       371.8     0.     464.8 FIXEDHF     0.800  0       0.0  0
3634    ho 2D3627       105.4     0.     131.8 FIXEDHF     0.800  0       0.0  0  4s7f      -3d6h
3635    ho 5E3627       -84.6     0.    -105.7 FIXEDHF     0.800  0       0.0  0
3636    hp 2D3627       121.0     0.     151.2 FIXEDHF     0.800  0       0.0  0  4s7f      -3d7h
3637    hp 5E3627       -95.7     0.    -119.6 FIXEDHF     0.800  0       0.0  0
3638    hq 2D3627       236.6     0.     295.7 FIXEDHF     0.800  0       0.0  0  4s7f      -3d8h
3639    hq 5E3627       -93.4     0.    -116.7 FIXEDHF     0.800  0       0.0  0
3640    hr 2D3627       227.4     0.     284.2 FIXEDHF     0.800  0       0.0  0  4s7f      -3d9h
3641    hr 5E3627       -86.9     0.    -108.6 FIXEDHF     0.800  0       0.0  0
3642    ij 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s9f
3643    ij 3E3636       565.0     0.     706.3 FIXEDHF     0.800  0       0.0  0
3644    ik 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s10f
3645    ik 3E3636       467.4     0.     584.2 FIXEDHF     0.800  0       0.0  0
3646    il 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s11f
3647    il 3E3636       395.1     0.     493.9 FIXEDHF     0.800  0       0.0  0
3648    im 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s12f
3649    im 3E3636       339.9     0.     424.9 FIXEDHF     0.800  0       0.0  0
3650    in 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s13f
3651    in 3E3636       296.6     0.     370.8 FIXEDHF     0.800  0       0.0  0
3652    io 2D3627        78.2     0.      97.7 FIXEDHF     0.800  0       0.0  0  4s8f      -3d6h
3653    io 5E3627       -61.1     0.     -76.4 FIXEDHF     0.800  0       0.0  0
3654    ip 2D3627        95.3     0.     119.1 FIXEDHF     0.800  0       0.0  0  4s8f      -3d7h
3655    ip 5E3627       -69.6     0.     -87.0 FIXEDHF     0.800  0       0.0  0
3656    iq 2D3627        93.6     0.     117.0 FIXEDHF     0.800  0       0.0  0  4s8f      -3d8h
3657    iq 5E3627       -68.1     0.     -85.1 FIXEDHF     0.800  0       0.0  0
3658    ir 2D3627       142.3     0.     177.9 FIXEDHF     0.800  0       0.0  0  4s8f      -3d9h
3659    ir 5E3627       -63.5     0.     -79.4 FIXEDHF     0.800  0       0.0  0
3660    jk 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s10f
3661    jk 3E3636       379.8     0.     474.8 FIXEDHF     0.800  0       0.0  0
3662    jl 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s11f
3663    jl 3E3636       322.1     0.     402.6 FIXEDHF     0.800  0       0.0  0
3664    jm 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s12f
3665    jm 3E3636       277.8     0.     347.2 FIXEDHF     0.800  0       0.0  0
3666    jn 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s13f
3667    jn 3E3636       242.9     0.     303.6 FIXEDHF     0.800  0       0.0  0
3668    jo 2D3627        61.1     0.      76.4 FIXEDHF     0.800  0       0.0  0  4s9f      -3d6h
3669    jo 5E3627       -46.9     0.     -58.6 FIXEDHF     0.800  0       0.0  0
3670    jp 2D3627        74.3     0.      92.9 FIXEDHF     0.800  0       0.0  0  4s9f      -3d7h
3671    jp 5E3627       -53.5     0.     -66.9 FIXEDHF     0.800  0       0.0  0
3672    jq 2D3627        76.7     0.      95.9 FIXEDHF     0.800  0       0.0  0  4s9f      -3d8h
3673    jq 5E3627       -52.6     0.     -65.7 FIXEDHF     0.800  0       0.0  0
3674    jr 2D3627        71.6     0.      89.5 FIXEDHF     0.800  0       0.0  0  4s9f      -3d9h
3675    jr 5E3627       -49.0     0.     -61.3 FIXEDHF     0.800  0       0.0  0
3676    kl 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s11f
3677    kl 3E3636       268.9     0.     336.1 FIXEDHF     0.800  0       0.0  0
3678    km 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s12f
3679    km 3E3636       232.2     0.     290.3 FIXEDHF     0.800  0       0.0  0
3680    kn 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s13f
3681    kn 3E3636       203.3     0.     254.1 FIXEDHF     0.800  0       0.0  0
3682    ko 2D3627        49.6     0.      62.0 FIXEDHF     0.800  0       0.0  0  4s10f     -3d6h
3683    ko 5E3627       -37.4     0.     -46.8 FIXEDHF     0.800  0       0.0  0
3684    kp 2D3627        60.2     0.      75.3 FIXEDHF     0.800  0       0.0  0  4s10f     -3d7h
3685    kp 5E3627       -42.9     0.     -53.6 FIXEDHF     0.800  0       0.0  0
3686    kq 2D3627        62.2     0.      77.7 FIXEDHF     0.800  0       0.0  0  4s10f     -3d8h
3687    kq 5E3627       -42.2     0.     -52.7 FIXEDHF     0.800  0       0.0  0
3688    kr 2D3627        60.3     0.      75.4 FIXEDHF     0.800  0       0.0  0  4s10f     -3d9h
3689    kr 5E3627       -39.4     0.     -49.3 FIXEDHF     0.800  0       0.0  0
3690    lm 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -4s12f
3691    lm 3E3636       197.9     0.     247.4 FIXEDHF     0.800  0       0.0  0
3692    ln 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -4s13f
3693    ln 3E3636       173.4     0.     216.8 FIXEDHF     0.800  0       0.0  0
3694    lo 2D3627        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0  4s11f     -3d6h
3695    lo 5E3627       -30.9     0.     -38.6 FIXEDHF     0.800  0       0.0  0
3696    lp 2D3627        50.2     0.      62.8 FIXEDHF     0.800  0       0.0  0  4s11f     -3d7h
3697    lp 5E3627       -35.4     0.     -44.3 FIXEDHF     0.800  0       0.0  0
3698    lq 2D3627        51.7     0.      64.6 FIXEDHF     0.800  0       0.0  0  4s11f     -3d8h
3699    lq 5E3627       -34.9     0.     -43.6 FIXEDHF     0.800  0       0.0  0
3700    lr 2D3627        50.2     0.      62.8 FIXEDHF     0.800  0       0.0  0  4s11f     -3d9h
3701    lr 5E3627       -32.6     0.     -40.8 FIXEDHF     0.800  0       0.0  0
3702    mn 0D3636         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -4s13f
3703    mn 3E3636       150.2     0.     187.8 FIXEDHF     0.800  0       0.0  0
3704    mo 2D3627        35.4     0.      44.2 FIXEDHF     0.800  0       0.0  0  4s12f     -3d6h
3705    mo 5E3627       -26.0     0.     -32.5 FIXEDHF     0.800  0       0.0  0
3706    mp 2D3627        42.8     0.      53.5 FIXEDHF     0.800  0       0.0  0  4s12f     -3d7h
3707    mp 5E3627       -29.9     0.     -37.4 FIXEDHF     0.800  0       0.0  0
3708    mq 2D3627        44.0     0.      55.0 FIXEDHF     0.800  0       0.0  0  4s12f     -3d8h
3709    mq 5E3627       -29.5     0.     -36.9 FIXEDHF     0.800  0       0.0  0
3710    mr 2D3627        42.6     0.      53.3 FIXEDHF     0.800  0       0.0  0  4s12f     -3d9h
3711    mr 5E3627       -27.6     0.     -34.5 FIXEDHF     0.800  0       0.0  0
3712    no 2D3627        30.7     0.      38.4 FIXEDHF     0.800  0       0.0  0  4s13f     -3d6h
3713    no 5E3627       -22.4     0.     -28.0 FIXEDHF     0.800  0       0.0  0
3714    np 2D3627        37.1     0.      46.4 FIXEDHF     0.800  0       0.0  0  4s13f     -3d7h
3715    np 5E3627       -25.8     0.     -32.2 FIXEDHF     0.800  0       0.0  0
3716    nq 2D3627        38.1     0.      47.6 FIXEDHF     0.800  0       0.0  0  4s13f     -3d8h
3717    nq 5E3627       -25.4     0.     -31.8 FIXEDHF     0.800  0       0.0  0
3718    nr 2D3627        36.9     0.      46.1 FIXEDHF     0.800  0       0.0  0  4s13f     -3d9h
3719    nr 5E3627       -23.8     0.     -29.8 FIXEDHF     0.800  0       0.0  0
3720    op 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6h      -3d7h
3721    op 2D2727       684.9     0.     856.1 FIXEDHF     0.800  0       0.0  0
3722    op 4D2727        94.4     0.     118.0 FIXEDHF     0.800  0       0.0  0
3723    op 3E2727         9.4     0.      11.8 FIXEDHF     0.800  0       0.0  0
3724    op 5E2727         6.6     0.       8.3 FIXEDHF     0.800  0       0.0  0
3725    op 7E2727         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0
3726    oq 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6h      -3d8h
3727    oq 2D2727       482.0     0.     602.5 FIXEDHF     0.800  0       0.0  0
3728    oq 4D2727        77.3     0.      96.6 FIXEDHF     0.800  0       0.0  0
3729    oq 3E2727         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0
3730    oq 5E2727         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0
3731    oq 7E2727         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0
3732    or 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d6h      -3d9h
3733    or 2D2727       369.2     0.     461.5 FIXEDHF     0.800  0       0.0  0
3734    or 4D2727        64.6     0.      80.7 FIXEDHF     0.800  0       0.0  0
3735    or 3E2727         8.3     0.      10.4 FIXEDHF     0.800  0       0.0  0
3736    or 5E2727         5.9     0.       7.4 FIXEDHF     0.800  0       0.0  0
3737    or 7E2727         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0
3738    os 2D2737     -1144.2     0.   -1430.3 FIXEDHF     0.800  0       0.0  0  3d6h      -4s6h
3739    os 5E2737       -40.6     0.     -50.8 FIXEDHF     0.800  0       0.0  0
3740    ot 2D2737      -650.6     0.    -813.3 FIXEDHF     0.800  0       0.0  0  3d6h      -4s7h
3741    ot 5E2737       -44.4     0.     -55.5 FIXEDHF     0.800  0       0.0  0
3742    ou 2D2737      -455.3     0.    -569.1 FIXEDHF     0.800  0       0.0  0  3d6h      -4s8h
3743    ou 5E2737       -42.2     0.     -52.8 FIXEDHF     0.800  0       0.0  0
3744    ov 2D2737      -346.5     0.    -433.1 FIXEDHF     0.800  0       0.0  0  3d6h      -4s9h
3745    ov 5E2737       -38.6     0.     -48.3 FIXEDHF     0.800  0       0.0  0
3746    ow 2D2738      -258.9     0.    -323.6 FIXEDHF     0.800  0       0.0  0  3d6h      -4s8k
3747    ow 5E2738        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0
3748    ox 2D2738      -257.8     0.    -322.2 FIXEDHF     0.800  0       0.0  0  3d6h      -4s9k
3749    ox 5E2738        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0
3750    oy 2D2728       271.4     0.     339.3 FIXEDHF     0.800  0       0.0  0  3d6h      -3d8k
3751    oy 4D2728        13.4     0.      16.7 FIXEDHF     0.800  0       0.0  0
3752    oy 5E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3753    oy 7E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3754    oz 2D2728       270.2     0.     337.8 FIXEDHF     0.800  0       0.0  0  3d6h      -3d9k
3755    oz 4D2728        15.1     0.      18.9 FIXEDHF     0.800  0       0.0  0
3756    oz 5E2728         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
3757    oz 7E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3758    pq 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7h      -3d8h
3759    pq 2D2727       530.0     0.     662.5 FIXEDHF     0.800  0       0.0  0
3760    pq 4D2727        77.5     0.      96.9 FIXEDHF     0.800  0       0.0  0
3761    pq 3E2727        10.0     0.      12.5 FIXEDHF     0.800  0       0.0  0
3762    pq 5E2727         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0
3763    pq 7E2727         5.4     0.       6.8 FIXEDHF     0.800  0       0.0  0
3764    pr 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d7h      -3d9h
3765    pr 2D2727       408.3     0.     510.4 FIXEDHF     0.800  0       0.0  0
3766    pr 4D2727        65.9     0.      82.4 FIXEDHF     0.800  0       0.0  0
3767    pr 3E2727         9.3     0.      11.6 FIXEDHF     0.800  0       0.0  0
3768    pr 5E2727         6.6     0.       8.2 FIXEDHF     0.800  0       0.0  0
3769    pr 7E2727         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0
3770    ps 2D2737      -653.5     0.    -816.9 FIXEDHF     0.800  0       0.0  0  3d7h      -4s6h
3771    ps 5E2737       -42.8     0.     -53.5 FIXEDHF     0.800  0       0.0  0
3772    pt 2D2737      -723.4     0.    -904.3 FIXEDHF     0.800  0       0.0  0  3d7h      -4s7h
3773    pt 5E2737       -47.0     0.     -58.7 FIXEDHF     0.800  0       0.0  0
3774    pu 2D2737      -503.5     0.    -629.4 FIXEDHF     0.800  0       0.0  0  3d7h      -4s8h
3775    pu 5E2737       -44.8     0.     -56.0 FIXEDHF     0.800  0       0.0  0
3776    pv 2D2737      -385.8     0.    -482.2 FIXEDHF     0.800  0       0.0  0  3d7h      -4s9h
3777    pv 5E2737       -41.0     0.     -51.2 FIXEDHF     0.800  0       0.0  0
3778    pw 2D2738        56.7     0.      70.9 FIXEDHF     0.800  0       0.0  0  3d7h      -4s8k
3779    pw 5E2738        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0
3780    px 2D2738       -41.0     0.     -51.3 FIXEDHF     0.800  0       0.0  0  3d7h      -4s9k
3781    px 5E2738        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0
3782    py 2D2728       -59.4     0.     -74.2 FIXEDHF     0.800  0       0.0  0  3d7h      -3d8k
3783    py 4D2728         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0
3784    py 5E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3785    py 7E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3786    pz 2D2728        43.0     0.      53.8 FIXEDHF     0.800  0       0.0  0  3d7h      -3d9k
3787    pz 4D2728         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0
3788    pz 5E2728         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
3789    pz 7E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3790    qr 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8h      -3d9h
3791    qr 2D2727       389.4     0.     486.8 FIXEDHF     0.800  0       0.0  0
3792    qr 4D2727        59.6     0.      74.5 FIXEDHF     0.800  0       0.0  0
3793    qr 3E2727         8.9     0.      11.1 FIXEDHF     0.800  0       0.0  0
3794    qr 5E2727         6.3     0.       7.9 FIXEDHF     0.800  0       0.0  0
3795    qr 7E2727         4.8     0.       6.0 FIXEDHF     0.800  0       0.0  0
3796    qs 2D2737      -459.4     0.    -574.2 FIXEDHF     0.800  0       0.0  0  3d8h      -4s6h
3797    qs 5E2737       -39.9     0.     -49.9 FIXEDHF     0.800  0       0.0  0
3798    qt 2D2737      -507.8     0.    -634.8 FIXEDHF     0.800  0       0.0  0  3d8h      -4s7h
3799    qt 5E2737       -43.8     0.     -54.8 FIXEDHF     0.800  0       0.0  0
3800    qu 2D2737      -486.0     0.    -607.5 FIXEDHF     0.800  0       0.0  0  3d8h      -4s8h
3801    qu 5E2737       -41.9     0.     -52.4 FIXEDHF     0.800  0       0.0  0
3802    qv 2D2737      -369.8     0.    -462.3 FIXEDHF     0.800  0       0.0  0  3d8h      -4s9h
3803    qv 5E2737       -38.4     0.     -48.0 FIXEDHF     0.800  0       0.0  0
3804    qw 2D2738         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  3d8h      -4s8k
3805    qw 5E2738        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0
3806    qx 2D2738        33.9     0.      42.4 FIXEDHF     0.800  0       0.0  0  3d8h      -4s9k
3807    qx 5E2738        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0
3808    qy 2D2728        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  3d8h      -3d8k
3809    qy 4D2728         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0
3810    qy 5E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3811    qy 7E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3812    qz 2D2728       -35.5     0.     -44.4 FIXEDHF     0.800  0       0.0  0  3d8h      -3d9k
3813    qz 4D2728         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0
3814    qz 5E2728         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
3815    qz 7E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3816    rs 2D2737      -351.3     0.    -439.1 FIXEDHF     0.800  0       0.0  0  3d9h      -4s6h
3817    rs 5E2737       -36.1     0.     -45.1 FIXEDHF     0.800  0       0.0  0
3818    rt 2D2737      -391.4     0.    -489.3 FIXEDHF     0.800  0       0.0  0  3d9h      -4s7h
3819    rt 5E2737       -39.7     0.     -49.6 FIXEDHF     0.800  0       0.0  0
3820    ru 2D2737      -373.5     0.    -466.9 FIXEDHF     0.800  0       0.0  0  3d9h      -4s8h
3821    ru 5E2737       -37.9     0.     -47.4 FIXEDHF     0.800  0       0.0  0
3822    rv 2D2737      -341.8     0.    -427.3 FIXEDHF     0.800  0       0.0  0  3d9h      -4s9h
3823    rv 5E2737       -34.7     0.     -43.4 FIXEDHF     0.800  0       0.0  0
3824    rw 2D2738        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  3d9h      -4s8k
3825    rw 5E2738        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0
3826    rx 2D2738         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  3d9h      -4s9k
3827    rx 5E2738        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0
3828    ry 2D2728         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  3d9h      -3d8k
3829    ry 4D2728         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0
3830    ry 5E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3831    ry 7E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3832    rz 2D2728        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  3d9h      -3d9k
3833    rz 4D2728         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0
3834    rz 5E2728         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
3835    rz 7E2728         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0
3836    st 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6h      -4s7h
3837    st 5E3737       418.2     0.     522.8 FIXEDHF     0.800  0       0.0  0
3838    su 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6h      -4s8h
3839    su 5E3737       383.0     0.     478.8 FIXEDHF     0.800  0       0.0  0
3840    sv 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6h      -4s9h
3841    sv 5E3737       341.1     0.     426.4 FIXEDHF     0.800  0       0.0  0
3842    sy 2D3728      -258.4     0.    -323.0 FIXEDHF     0.800  0       0.0  0  4s6h      -3d8k
3843    sy 7E3728        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0
3844    sz 2D3728      -257.6     0.    -322.0 FIXEDHF     0.800  0       0.0  0  4s6h      -3d9k
3845    sz 7E3728        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0
3846    tu 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7h      -4s8h
3847    tu 5E3737       398.4     0.     498.0 FIXEDHF     0.800  0       0.0  0
3848    tv 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7h      -4s9h
3849    tv 5E3737       355.8     0.     444.8 FIXEDHF     0.800  0       0.0  0
3850    ty 2D3728        58.3     0.      72.9 FIXEDHF     0.800  0       0.0  0  4s7h      -3d8k
3851    ty 7E3728        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0
3852    tz 2D3728       -39.0     0.     -48.7 FIXEDHF     0.800  0       0.0  0  4s7h      -3d9k
3853    tz 7E3728        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0
3854    uv 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8h      -4s9h
3855    uv 5E3737       328.8     0.     411.0 FIXEDHF     0.800  0       0.0  0
3856    uy 2D3728         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  4s8h      -3d8k
3857    uy 7E3728        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0
3858    uz 2D3728        35.5     0.      44.4 FIXEDHF     0.800  0       0.0  0  4s8h      -3d9k
3859    uz 7E3728        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0
3860    vy 2D3728        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  4s9h      -3d8k
3861    vy 7E3728        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0
3862    vz 2D3728         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s9h      -3d9k
3863    vz 7E3728        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0
3864    wx 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8k      -4s9k
3865    wx 7E3838         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0
3866    wy 2D3828      -189.4     0.    -236.7 FIXEDHF     0.800  0       0.0  0  4s8k      -3d8k
3867    wy 7E3828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
3868    wz 2D3828      -103.1     0.    -128.9 FIXEDHF     0.800  0       0.0  0  4s8k      -3d9k
3869    wz 7E3828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
3870    xy 2D3828      -103.1     0.    -128.9 FIXEDHF     0.800  0       0.0  0  4s9k      -3d8k
3871    xy 7E3828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
3872    xz 2D3828      -133.0     0.    -166.3 FIXEDHF     0.800  0       0.0  0  4s9k      -3d9k
3873    xz 7E3828        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0
3874    yz 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  3d8k      -3d9k
3875    yz 2D2828       108.1     0.     135.1 FIXEDHF     0.800  0       0.0  0
3876    yz 4D2828         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0
3877    yz 5E2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
3878    yz 7E2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
3879    yz 9E2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
