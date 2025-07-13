$SET def 2000
$SET VERIFY=NOIMAGE
$ASSIGN B2000Oy.PUN FOR007
$ASSIGN POOLQ:H2000Oy.HAM FOR001
$ASSIGN B2000Oy.EIG FOR003
$ASSIGN EAV2000Oy.DAT FOR066
$ASSIGN POOLG:B2000O15 FOR015
$ASSIGN POOLG:B2000O16 FOR016
$RUN CRAY:LEAST3007
1 Sugar, J, and Corliss, C. J.Phys.Chem.Ref.Data vol. 14,Supple 2, 1985.
2 Geller, M. NASA Ref. Pub. 1224, vol 3, 1992.  8h,9h,8k,9k from polarization formula
3 Gaardsted, J.O., Andersen, T., Haugen, H.K., Hansen, J.E., and Vaeck, N,  J.Phys.B 24, 4363-4377, 1991.
4 Kim, J.B., Xiong, X., Laham, N.M., Lacatorio, T.B., and McIlrath, T. 1994.  J. Phys. B27, 2953-2960.
5 Chang, E.S., Engleman, R., and Geller, M. 200o. Physics Essays 13, 198-205.
6 The 3dnl and 4pnl fit needs to be much more sophisticated because of the mixing.
7 However energies and widths are the observed.
8
9
    0    0    0    0        .3       1.5
    2  .6        100  120  100  130   20   20   20   30   30   10   10   10   10   10   10
  20.00
4s4p      4s5p      4s6p      4s7p      4s8p      4s9p      4s10p     4s11p
4s12p     4s13p     4s14p     3d4p      3d5p      3d6p      3d7p      3d8p
3d9p      3d10p     3d11p     3d12p     3d13p     3d14p     4s4f      4s5f
4s6f      4s7f      4s8f      4s9f      4s10f     4s11f     4s12f     4s13f
4s14f     3d4f      3d5f      3d6f      3d7f      3d8f      3d9f      3d10f
3d11f     3d12f     3d13f     3d14f     4s6h      4s7h      4s8h      4s9h
3d6h      3d7h      3d8h      3d9h      4p5s      4p6s      4p7s      4p8s
4p4d      4p5d      4p6d      4p7d      4p8d
  -1.
   0.0     15157.901             4s4p 3P                  4s4p 3P
   0.0     36547.688             4s5p 3P                  4s5p 3P
   0.0     39333.382             3d4p 3P                  3d4p 3P
   0.0     42514.845             4s6p 3P                  4s6p 3P
   0.0     44955.67              4s7p 3P                  4s7p 3P
   0.0     46284.12              4s8p 3P                  4s8p 3P
1  0.0                           4s9p 3P                  4s9p 3P
1  0.0                           4s10p 3P                 4s10p 3P
1  0.0                           4s11p 3P                 4s11p 3P
1  0.0                           4s12p 3P                 4s12p 3P
1  0.0                           4s13p 3P                 4s13p 3P
1  0.0                           4s14p 3P                 4s14p 3P
1  0.0                           3d5p 3P                  3d5p 3P
1  0.0                           3d4f 3P                  3d4f 3P
1  0.0                           3d6p 3P                  3d6p 3P
1  0.0                           3d5f 3P                  3d5f 3P
1  0.0                           3d7p 3P                  3d7p 3P
1  0.0                           3d6f 3P                  3d6f 3P
1  0.0                           3d8p 3P                  3d8p 3P
1  0.0                           3d7f 3P                  3d7f 3P
1  0.0                           4p4d 3P                  4p4d 3D
1  0.0                           3d9p 3P                  3d9p 3P
1  0.0                           3d8f 3P                  3d8f 3P
1  0.0                           3d10p 3P                 3d10p 3P
1  0.0                           3d9f 3P                  3d9f 3P
1  0.0                           3d11p 3P                 3d11p 3P
1  0.0                           3d10f 3P                 3d10f 3P
1  0.0                           3d12p 3P                 3d12p 3P
1  0.0                           3d11f 3P                 3d11f 3P
1  0.0                           3d13p 3P                 3d13p 3P
1  0.0                           3d12f 3P                 3d12f 3P
1  0.0                           3d14p 3P                 3d14p 3P
1  0.0                           3d13f 3P                 3d13f 3P
1  0.0                           3d14f 3P                 3d14f 3P
1  0.0                           4p5d 3P                  4p5d 3P
1  0.0                           4p6d 3P                  4p6d 3P
1  0.0                           4p7d 3P                  4p7d 3P
1  0.0                           4p8d 3P                  4p8d 3P
   -1.
   1.0     15210.063             4s4p 3P                  4s4p 3P
   1.0     23652.304             4s4p 1P                  4s4p 1P
   1.0     36554.749             4s5p 3P                  4s5p 3P
   1.0     36731.615             4s5p 1P                  4s5p 1P
   1.0     38192.392             3d4p 3D                  3d4p 3D
   1.0     39335.322             3d4p 3P                  3d4p 3P
   1.0     41679.008             4s6p 1P                  4s6p 1P
   1.0     42518.708             4s6p 3P                  4s6p 3P
   1.0     43933.477             3d4p 1P                  3d4p 1P
   1.0     44957.655             4s7p 3P                  4s7p 3P
   1.0     45425.358             4s7p 1P                  4s7p 1P
   1.0     46285.23              4s8p 3P                  4s8p 3P
   1.0     46479.813             4s8p 1P                  4s8p 1P
   1.0     47085.38              4s9p 3P                  4s9p 3P
   1.0     47184.370             4s9p 1P                  4s9p 1P
   1.0     47604.75              4s10p 3P                 4s10p 3P
   1.0     47662.10              4s10p 1P                 4s10p 1P
   1.0     47960.87              4s11p 3P                 4s11p 3P
   1.0     47997.49              4s11p 1P                 4s11p 1P
   1.0     48215.81              4s12p 3P                 4s12p 3P
   1.0     48240.53              4s12p 1P                 4s12p 1P
   1.0     48404.57              4s13p 3P                 4s13p 3P
   1.0     48422.09              4s13p 1P                 4s13p 1P
   1.0     48548.30              4s14p 3P                 4s14p 3P
   1.0     48561.10              4s14p 1P                 4s14p 1P
   1.0     51709.5               3d5p 3D                  3d5p 3D
   1.0     51908.                3d5p 3P                  3d5p 3P
   1.0     53100.                3d5p 1P                  3d5p 1P
   1.0     55902.8               3d4f 3D                  3d4f 3D
   1.0     55946.6               3d4f 3P                  3d4f 3P
   1.0     55982.3               3d4f 1P                  3d4f 1P
   1.0     56254.                3d6p 3D                  3d6p 3D
   1.0     56532.63              3d6p 3P                  3d6p 3P
1  1.0     56651.                3d6p 1P                  3d6p 1P
   1.0     57462.                4p5s 3P                  4p5s 3P
   1.0     57960.                4p5s 1P                  4p5s 1P
   1.0     58431.31              3d5f 3D                  3d5f 3D
   1.0     58491.91              3d5f 3P                  3d5f 3P
   1.0     58505.89              3d5f 1P                  3d5f 1P
   1.0     58798.92              3d7p 3D                  3d7p 3D
   1.0     59010.87              3d7p 3P                  3d7p 3P
   1.0     59197.                3d7p 1P                  3d7p 1P
   1.0     59802.21              3d6f 3D                  3d6f 3D
   1.0     59862.26              3d6f 3P                  3d6f 3P
   1.0     59878.52              3d6f 1P                  3d6f 1P
   1.0     60046.13              3d8p 3D                  3d8p 3D
   1.0     60150.26              3d8p 3P                  3d8p 3P
   1.0     60300.                3d8p 1P                  3d8p 1P
   1.0     60632.18              3d7f 3D                  3d7f 3D
   1.0     60690.27              3d7f 3P                  3d7f 3P
   1.0     60709.54              3d7f 1P                  3d7f 1P
   1.0     60807.28              3d9p 3D                  3d9p 3D
   1.0     60869.28              3d9p 3P                  3d9p 3P
   1.0     60973.6               3d9p 1P                  3d9p 1P
   1.0     61172.54              3d8f 3D                  3d8f 3D
   1.0     61228.65              3d8f 3P                  3d8f 3P
   1.0     61251.39              3d8f 1P                  3d8f 1P
   1.0     61306.65              3d10p 3D                 3d10p 3D
   1.0     61345.74              3d10p 3P                 3d10p 3P
   1.0     61428.1               3d10p 1P                 3d10p 1P
   1.0     61543.95              3d9f 3D                  3d9f 3D
   1.0     61596.69              3d9f 3P                  3d9f 3P
   1.0     61622.60              3d9f 1P                  3d9f 1P
   1.0     61652.25              3d11p 3D                 3d11p 3D
   1.0     61676.62              3d11p 3P                 3d11p 3P
   1.0     61747.2               3d11p 1P                 3d11p 1P
   1.0     61810.68              3d10f 3D                 3d10f 3D
   1.0     61859.22              3d10f 3P                 3d10f 3P
   1.0     61888.22              3d10f 1P                 3d10f 1P
   1.0     61901.04              3d12p 3D                 3d12p 3D
   1.0     61916.38              3d12p 3P                 3d12p 3P
   1.0     61980.49              3d12p 1P                 3d12p 1P
   1.0     62009.17              3d11f 3D                 3d11f 3D
   1.0     62052.49              3d11f 3P                 3d11f 3P
   1.0     62084.92              3d13p 3D                 3d13p 3D
   1.0     62084.92              3d11f 1P                 3d11f 1P
   1.0     62097.08              3d13p 3P                 3d13p 3P
   1.0     62154.62              3d13p 1P                 3d13p 1P
   1.0     62161.61              3d12f 3D                 3d12f 3D
   1.0     62223.68              3d14p 3D                 3d14p 3D
   1.0     62198.92              3d12f 3P                 3d12f 3P
   1.0     62234.47              3d12f 1P                 3d12f 1P
   1.0     62237.12              3d14p 3P                 3d14p 3P
   1.0     62279.33              3d13f 3D                 3d13f 3D
   1.0     62288.02              3d14p 1P                 3d14p 1P
   1.0     62312.63              3d13f 3P                 3d13f 3P
   1.0     62346.47              3d13f 1P                 3d13f 1P
   1.0     62375.29              3d14f 3D                 3d14f 3D
   1.0     62403.22              3d14f 3P                 3d14f 3P
   1.0     62433.38              3d14f 1P                 3d14f 1P
   1.0     62552.97              4p4d 3D?                 4p4d 3D?
   1.0     62557.45              4p4d 3P?                 4p4d 3P?
1  1.0     62561.72              4p4d 1P?                 4p4d 1P?
   1.0     64977.                4p6s 3P                  4p6s 3P
   1.0     65445.                4p6s 1P                  4p6s 1P
1  1.0                           4p5d 3D                  4p5d 3D
1  1.0                           4p5d 3P                  4p5d 3P
1  1.0     66578.                4p5d 1P                  4p5d 1P
1  1.0                           4p6d 3D                  4p6d 3D
   1.0     68913.                4p7s 3P                  4p7s 3P
   1.0     69247.                4p7s 1P                  4p7s 1P
1  1.0                           4p6d 3P                  4p6d 3P
   1.0     69643.                4p6d 1P                  4p6d 1P
   1.0     70787.                4p8s 3P                  4p8s 3P
1  1.0                           4p7d 3D                  4p7d 3D
   1.0     71001.                4p8s 1P                  4p8s 1P
1  1.0                           4p7d 3P                  4p7d 3P
   1.0     71237.                4p7d 1P                  4p7d 1P
1  1.0                           4p8d 3D                  4p8d 3D
1  1.0                           4p8d 3P                  4p8d 3P
   1.0     72289.                4p8d 1P                  4p8d 1P
   2.0     15315.943             4s4p 3P                  4s4p 3P
   2.0     35835.413     0.893   3d4p 1D                  3d4p 1D
   2.0     35730.454     0.754   3d4p 3F                  3d4p 3F
   2.0     36575.119             4s5p 3P                  4s5p 3P
   2.0     38219.118             3d4p 3D                  3d4p 3D
   2.0     39340.080             3d4p 3P                  3d4p 3P
   2.0     42170.214             4s4f 3F                  4s4f 3F
   2.0     42526.591             4s6p 3P                  4s6p 3P
   2.0     44762.620             4s5f 3F                  4s5f 3F
   2.0     44961.757             4s7p 3P                  4s7p 3P
   2.0     46164.644             4s6f 3F                  4s6f 3F
   2.0     46287.63              4s8p 3P                  4s8p 3P
   2.0     47006.194             4s7f 3F                  4s7f 3F
   2.0     47086.99              4s9p 3P                  4s9p 3P
   2.0     47550.214             4s8f 3F                  4s8f 3F
   2.0     47605.77              4s10p 3P                 4s10p 3P
   2.0     47921.87              4s9f 3F                  4s9f 3F
   2.0     47961.53              4s11p 3P                 4s11p 3P
   2.0     48187.045             4s10f 3F                 4s10f 3F
   2.0     48216.36              4s12p 3P                 4s12p 3P
   2.0     48382.70              4s11f 3F                 4s11f 3F
   2.0     48404.95              4s13p 3P                 4s13p 3P
1  2.0                           4s12f 3F                 4s12f 3F
   2.0     48548.51              4s14p 3P                 4s14p 3P
1  2.0                           4s13f 3F                 4s13f 3F
1  2.0                           4s14f 3F                 4s14f 3F
1  2.0                           3d5p 1D                  3d5p 1D
   2.0     51734.6               3d5p 3D                  3d5p 3D
1  2.0                           3d5p 3F                  3d5p 3F
1  2.0                           3d5p 3P                  3d5p 3P
   2.0     55894.                3d4f 3D                  3d4f 3D
   2.0     55906.                3d4f 1D                  3d4f 1D
   2.0     55959.                3d4f 3P                  3d4f 3P
   2.0     55967.                3d4f 3F                  3d4f 3F
1  2.0                           3d6p 3D                  3d6p 3D
1  2.0                           3d6p 1D                  3d6p 1D
1  2.0                           3d6p 3F                  3d6p 3F
1  2.0                           3d6p 3P                  3d6p 3P
1  2.0                           3d5f 1D                  3d5f 1D
1  2.0                           3d5f 3D                  3d5f 3D
1  2.0                           3d5f 3F                  3d5f 3F
1  2.0                           3d5f 3P                  3d5f 3P
1  2.0                           3d7p 3D                  3d7p 3D
1  2.0                           3d7p 1D                  3d7p 1D
1  2.0                           3d7p 3F                  3d7p 3F
1  2.0                           3d7p 3P                  3d7p 3P
1  2.0                           4p4d 1D                  4p4d 1D
1  2.0                           4p4d 3F                  4p4d 3F
1  2.0                           3d6f 3D                  3d6f 3D
1  2.0                           3d6f 3P                  3d6f 3P
1  2.0                           3d6h 3F                  3d6h 3F
1  2.0                           3d6f 3F                  3d6f 3F
1  2.0                           3d6f 1D                  3d6f 1D
1  2.0                           4p4d 3D                  4p4d 3D
1  2.0                           3d8p 3P                  3d8p 3P
1  2.0                           3d8p 1D                  3d8p 1D
1  2.0                           3d8p 3F                  3d8p 3F
1  2.0                           3d8p 3D                  3d8p 3D
1  2.0                           3d7f 3F                  3d7f 3F
1  2.0                           3d7f 3P                  3d7f 3P
1  2.0                           3d7h 3F                  3d7h 3F
1  2.0                           3d7f 1D                  3d7f 1D
1  2.0                           3d7f 3D                  3d7f 3D
1  2.0                           4p4d 3P                  4p4d 3P
1  2.0                           3d9p 3F                  3d9p 3F
1  2.0                           3d9p 1D                  3d9p 1D
1  2.0                           3d9p 3D                  3d9p 3D
1  2.0                           3d9p 3P                  3d9p 3P
1  2.0                           3d8f 3F                  3d8f 3F
1  2.0                           3d8h 3F                  3d8h 3F
1  2.0                           3d8f 1D                  3d8f 1D
1  2.0                           3d8f 3D                  3d8f 3D
1  2.0                           3d8f 3P                  3d8f 3P
1  2.0                           3d10p 3F                 3d10p 3F
1  2.0                           3d10p 1D                 3d10p 1D
1  2.0                           3d10p 3D                 3d10p 3D
1  2.0                           3d9f 3F                  3d9f 3F
1  2.0                           3d9f 3P                  3d9f 3P
1  2.0                           3d9h 3F                  3d9h 3F
1  2.0                           3d9f 1D                  3d9f 1D
1  2.0                           3d9f 3D                  3d9f 3D
1  2.0                           3d10p 3P                 3d10p 3P
1  2.0                           3d10f 3F                 3d10f 3F
1  2.0                           3d11p 3D                 3d11p 3D
1  2.0                           3d10f 3P                 3d10f 3P
1  2.0                           3d11p 1D                 3d11p 1D
1  2.0                           3d10f 1D                 3d10f 1D
1  2.0                           3d10f 3D                 3d10f 3D
1  2.0                           3d11p 3F                 3d11p 3F
1  2.0                           3d11p 3P                 3d11p 3P
1  2.0                           3d11f 3F                 3d11f 3F
1  2.0                           3d11f 3P                 3d11f 3P
1  2.0                           3d12p 3D                 3d12p 3D
1  2.0                           3d12p 1D                 3d12p 1D
1  2.0                           3d11f 1D                 3d11f 1D
1  2.0                           3d11f 3D                 3d11f 3D
1  2.0                           3d12p 3F                 3d12p 3F
1  2.0                           3d12p 3P                 3d12p 3P
1  2.0                           3d12f 3F                 3d12f 3F
1  2.0                           3d12f 3P                 3d12f 3P
1  2.0                           3d13p 3D                 3d13p 3D
1  2.0                           3d13p 1D                 3d13p 1D
1  2.0                           3d12f 1D                 3d12f 1D
1  2.0                           3d12f 3D                 3d12f 3D
1  2.0                           3d13p 3F                 3d13p 3F
1  2.0                           3d13p 3P                 3d13p 3P
1  2.0                           3d14p 3F                 3d14p 3F
1  2.0                           3d14p 3D                 3d14p 3D
1  2.0                           3d14p 1D                 3d14p 1D
1  2.0                           3d13f 3F                 3d13f 3F
1  2.0                           3d13f 3D                 3d13f 3D
1  2.0                           3d14p 3P                 3d14p 3P
1  2.0                           3d13f 1D                 3d13f 1D
1  2.0                           3d13f 3D                 3d13f 3D
1  2.0                           3d14f 3F                 3d14f 3F
1  2.0                           3d14f 3P                 3d14f 3P
1  2.0                           3d14f 1D                 3d14f 1D
1  2.0                           3d14f 3D                 3d14f 3D
1  2.0                           4p5d 1D                  4p5d 1D
1  2.0                           4p5d 3F                  4p5d 3F
1  2.0                           4p5d 3D                  4p5d 3D
1  2.0                           4p5d 3P                  4p5d 3P
1  2.0                           4p6d 3F                  4p6d 3F
1  2.0                           4p6d 3D                  4p6d 3D
1  2.0                           4p6d 1D                  4p6d 1D
1  2.0                           4p6d 3P                  4p6d 3P
1  2.0                           4p7d 3F                  4p7d 3F
1  2.0                           4p7d 3D                  4p7d 3D
1  2.0                           4p7d 1D                  4p7d 1D
1  2.0                           4p7d 3P                  4p7d 3P
1  2.0                           4p8d 3F                  4p8d 3F
1  2.0                           4p8d 3D                  4p8d 3D
1  2.0                           4p8d 1D                  4p8d 1D
1  2.0                           4p8d 3P                  4p8d 3P
   -1.
   3.0     35818.713     1.076   3d4p 3F                  3d4p 3F
   3.0     38259.124             3d4p 3D                  3d4p 3D
   3.0     40537.893             3d4p 1F                  3d4p 1F
   3.0     42170.558             4s4f 3F                  4s4f 3F
   3.0     42343.587             4s4f 1F                  4s4f 1F
   3.0     44762.839             4s5f 3F                  4s5f 3F
   3.0     44804.878             4s5f 1F                  4s5f 1F
   3.0     46164.785             4s6f 3F                  4s6f 3F
   3.0     46182.399             4s6f 1F                  4s6f 1F
   3.0     47006.280             4s7f 3F                  4s7f 3F
   3.0     47015.141             4s7f 1F                  4s7f 1F
   3.0     47550.271             4s8f 3F                  4s8f 3F
   3.0     47555.23              4s8f 1F                  4s8f 1F
   3.0     47921.981             4s9f 3F                  4s9f 3F
   3.0     47924.947             4s9f 1F                  4s9f 1F
   3.0     48187.075             4s10f 3F                 4s10f 3F
   3.0     48188.990             4s10f 1F                 4s10f 1F
   3.0     48382.781             4s11f 3F                 4s11f 3F
   3.0     48384.039             4s11f 1F                 4s11f 1F
   3.0     48531.04              4s12f 3F                 4s12f 3F
   3.0     48532.139             4s12f 1F                 4s12f 1F
1  3.0                           4s13f 3F                 4s13f 3F
   3.0     48647.30              4s13f 1F                 4s13f 1F
1  3.0                           4s14f 3F                 4s14f 3F
   3.0     48738.54              4s14f 1F                 4s14f 1F
   3.0     51767.0               3d5p 3D                  3d5p 3D
1  3.0                           3d5p 3F                  3d5p 3F
1  3.0                           3d5p 1F                  3d5p 1F
   3.0     55915.                3d4f 3F                  3d4f 3F
   3.0     55951.                3d4f 3G                  3d4f 3G
   3.0     55974.                3d4f 3D                  3d4f 3D
   3.0     56010.                3d4f 1F                  3d4f 1F
1  3.0                           3d6p 3D                  3d6p 3D
   3.0     56586.                3d6p 3F                  3d6p 3F
   3.0     56634.                3d6p 1F                  3d6p 1F
   3.0     58441.                3d5f 3F                  3d5f 3F
   3.0     58483.                3d5f 3G                  3d5f 3G
   3.0     58502.                3d5f 3D                  3d5f 3D
   3.0     58539.                3d5f 1F                  3d5f 1F
1  3.0                           3d7p 3D                  3d7p 3D
1  3.0                           3d7p 3F                  3d7p 3F
1  3.0                           3d7p 1F                  3d7p 1F
   3.0     59813.                3d6f 3F                  3d6f 3F
   3.0     59856.                3d6f 3D                  3d6f 3D
1  3.0                           3d6h 1F                  3d6h 1F
   3.0     59877.                3d6f 1F                  3d6f 1F
   3.0     59910.                3d6f 3G                  3d6f 3G
1  3.0                           3d6h 3G                  3d6h 3G
1  3.0                           3d6h 3F                  3d6h 3F
1  3.0                           4p4d 3F                  4p4d 3F
1  3.0                           4p4d 3D                  4p4d 3D
1  3.0                           3d8p 1F                  3d8p 1F
1  3.0                           3d8p 3F                  3d8p 3F
   3.0     60643.                3d7f 3D                  3d7f 3D
   3.0     60682.                3d7f 3G                  3d7f 3G
1  3.0                           3d7h 1F                  3d7h 1F
   3.0     60704.                3d7f 1F                  3d7f 1F
1  3.0                           3d7h 3G                  3d7h 3G
   3.0     60734.                3d7f 3F                  3d7f 3F
1  3.0                           3d7h 3F                  3d7h 3F
1  3.0                           3d8p 3D                  3d8p 3D
1  3.0                           3d9p 1F                  3d9p 1F
1  3.0                           3d9p 3F                  3d9p 3F
1  3.0                           3d9p 3D                  3d9p 3D
   3.0     61187.1               3d8f 3G                  3d8f 3G
1  3.0                           3d8h 3D                  3d8h 3D
   3.0     61219.8               3d8f 3F                  3d8f 3F
   3.0     61244.3               3d8f 1F                  3d8f 1F
1  3.0                           3d8h 3D                  3d8h 3D
1  3.0                           3d8h 1F                  3d8h 1F
   3.0     61271.2               3d8f 3D                  3d8f 3D
1  3.0                           3d10p 1F                 3d10p 1F
1  3.0                           3d10p 3F                 3d10p 3F
   3.0     61560.3               3d9f 3F                  3d9f 3F
   3.0     61587.6               3d9f 3G                  3d9f 3G
1  3.0                           3d9h 1F                  3d9h 1F
1  3.0                           3d10p 3D                 3d10p 3D
   3.0     61613.8               3d9f 1F                  3d9f 1F
1  3.0                           3d9h 3G                  3d9h 3G
1  3.0                           3d9h 3F                  3d9h 3F
   3.0     61639.5               3d9f 3D                  3d9f 3D
1  3.0                           3d11p 1F                 3d11p 1F
1  3.0                           3d11p 3F                 3d11p 3F
   3.0     61829.5               3d10f 3G                 3d10f 3G
   3.0     61851.6               3d10f 3D                 3d10f 3D
1  3.0                           3d11p 3D                 3d11p 3D
   3.0     61895.6               3d10f 3F                 3d10f 3F
   3.0     61914.2               3d10f 1F                 3d10f 1F
1  3.0                           3d12p 1F                 3d12p 1F
   3.0     62023.1               3d11f 3G                 3d11f 3G
   3.0     62040.5               3d11f 1F                 3d11f 1F
1  3.0                           3d12p 3F                 3d12p 3F
   3.0     62080.0               3d11f 3F                 3d11f 3F
   3.0     62101.2               3d11f 3D                 3d11f 3D
1  3.0                           3d12p 3D                 3d12p 3D
1  3.0                           3d13p 1F                 3d13p 1F
   3.0     62175.6               3d12f 3G                 3d12f 3G
   3.0     62188.7               3d12f 1F                 3d12f 1F
1  3.0                           3d13p 3F                 3d13p 3F
   3.0     62229.1               3d12f 3F                 3d12f 3F
   3.0     62245.1               3d12f 3F                 3d12f 3D
1  3.0                           3d13p 3D                 3d13p 3D
1  3.0                           3d14p 3D                 3d14p 3D
1  3.0                           3d14p 1F                 3d14p 1F
1  3.0                           3d14p 3F                 3d14p 3F
1  3.0                           3d13f 3G                 3d13f 3G
1  3.0                           3d13f 1F                 3d13f 1F
1  3.0                           3d13f 3F                 3d13f 3F
1  3.0                           3d13f 3D                 3d13f 3D
1  3.0                           3d14f 3G                 3d14f 3G
1  3.0                           3d14f 3D                 3d14f 3D
1  3.0                           4p4d 1F                  4p4d 1F
1  3.0                           3d14f 3D                 3d14f 3D
1  3.0                           3d14f 1F                 3d14f 1F
1  3.0                           4p5d 3F                  4p5d 3F
1  3.0                           4p5d 3D                  4p5d 3D
1  3.0                           4p5d 1F                  4p5d 1F
1  3.0                           4p6d 3F                  4p6d 3F
1  3.0                           4p6d 3D                  4p6d 3D
1  3.0                           4p6d 1F                  4p6d 1F
1  3.0                           4p7d 3F                  4p7d 3F
1  3.0                           4p7d 3D                  4p7d 3D
1  3.0                           4p7d 1F                  4p7d 1F
1  3.0                           4p8d 3F                  4p8d 3F
1  3.0                           4p8d 3D                  4p8d 3D
1  3.0                           4p8d 1F                  4p8d 1F
   4.0     35896.889     1.245   3d4p 3F                  3d4p 3F
   4.0     42171.026             4s4f 3F                  4s4f 3F
   4.0     44763.118             4s5f 3F                  4s5f 3F
   4.0     46164.971             4s6f 3F                  4s6f 3F
   4.0     46249.15              4s6h 3H                  4s6h 3H
   4.0     47006.400             4s7f 3F                  4s7f 3F
   4.0     47060.478             4s7h 3H                  4s7h 3H
   4.0     47550.371             4s8f 3F                  4s8f 3F
   4.0     47587.1  P            4s8h 3H                  4s8h 3H
   4.0     47922.033             4s9f 3F                  4s9f 3F
   4.0     47948.1  P            4s9h 3H                  4s9h 3H
   4.0     48187.118             4s10f 3F                 4s10f 3F
   4.0     48382.801             4s11f 3F                 4s11f 3F
   4.0     48531.04              4s12f 3F                 4s12f 3F
   4.0     48646.38              4s13f 3F                 4s13f 3F
1  4.0                           4s14f 3F                 4s14f 3F
1  4.0                           3d5p 3F                  3d5p 3F
1  4.0                           3d4f 3F                  3d4f 3F
1  4.0                           3d4f 1G                  3d4f 1G
1  4.0                           3d4f 3G                  3d4f 3G
1  4.0                           3d4f 3H                  3d4f 3H
1  4.0                           3d6p 3F                  3d6p 3F
1  4.0                           3d5f 3F                  3d5f 3F
1  4.0                           3d5f 1G                  3d5f 1G
1  4.0                           3d5f 3G                  3d5f 3G
1  4.0                           3d5f 3H                  3d5f 3H
1  4.0                           3d7p 3F                  3d7p 3F
1  4.0                           3d6f 3F                  3d6f 3F
1  4.0                           3d6h 3H                  3d6h 3H
1  4.0                           3d6h 3F                  3d6h 3F
1  4.0                           3d6f 3H                  3d6f 1G
1  4.0                           3d6f 3G                  3d6f 3G
1  4.0                           3d6h 1G                  3d6h 1G
1  4.0                           3d6h 3G                  3d6h 3G
1  4.0                           3d6f 1G                  3d6f 3H
1  4.0                           4p4d 3F                  4p4d 3F
1  4.0                           3d8p 3F                  3d8p 3F
1  4.0                           3d7f 1G                  3d7f 3F
1  4.0                           3d7h 3H                  3d7h 3H
1  4.0                           3d7f 3H                  3d7f 1G
1  4.0                           3d7h 3F                  3d7h 3F
1  4.0                           3d7f 3G                  3d7f 3G
1  4.0                           3d7h 1G                  3d7h 1G
1  4.0                           3d7h 3G                  3d7h 3G
1  4.0                           3d7f 3F                  3d7f 3F
1  4.0                           3d9p 3F                  3d9p 3F
1  4.0                           3d8h 3H                  3d8h 3H
1  4.0                           3d8h 3F                  3d8h 3F
1  4.0                           3d8f 1G                  3d8f 1G
1  4.0                           3d8f 3H                  3d8f 3H
1  4.0                           3d8h 1G                  3d8h 1G
1  4.0                           3d8h 3G                  3d8h 3G
1  4.0                           3d8f 3G                  3d8f 3G
1  4.0                           3d8f 3F                  3d8f 3F
1  4.0                           3d10p 3F                 3d10p 3F
1  4.0                           3d9h 3H                  3d9h 3H
1  4.0                           3d9h 3F                  3d9h 3F
1  4.0                           3d9f 1G                  3d9f 1G
1  4.0                           3d9f 3H                  3d9f 3H
1  4.0                           3d9h 1G                  3d9h 1G
1  4.0                           3d9h 3G                  3d9h 3G
1  4.0                           3d9f 3G                  3d9f 3G
1  4.0                           3d9f 3F                  3d9f 3F
1  4.0                           3d10f 1G                 3d10f 1G
1  4.0                           3d10f 3H                 3d10f 3H
1  4.0                           3d10f 3G                 3d10f 3G
1  4.0                           3d10f 3F                 3d10f 3F
1  4.0                           3d11p 3F                 3d11p 3F
1  4.0                           3d11f 1G                 3d11f 1G
1  4.0                           3d11f 3H                 3d11f 3H
1  4.0                           3d11f 3G                 3d11f 3G
1  4.0                           3d11f 3F                 3d11f 3F
1  4.0                           3d12p 3F                 3d12p 3F
1  4.0                           3d12f 1G                 3d12f 1G
1  4.0                           3d12f 3H                 3d12f 3H
1  4.0                           3d12f 3G                 3d12f 3G
1  4.0                           3d12f 3F                 3d12f 3F
1  4.0                           3d13p 3F                 3d13p 3F
1  4.0                           3e14p 1G                 3d14p 1G
1  4.0                           3d13f 3H                 3d13f 3H
1  4.0                           3d13f 3G                 3d13f 3G
1  4.0                           3d13f 3F                 3d13f 3F
1  4.0                           3d13f 3H                 3d13f 3H
1  4.0                           3d14f 1G                 3d14f 1G
1  4.0                           3d14f 3H                 3d14f 3H
1  4.0                           3d14f 3G                 3d14f 3G
1  4.0                           3d14f 3F                 3d14f 3F
1  4.0                           4p5d 3F                  4p5d 3F
1  4.0                           4p6d 3F                  4p6d 3F
1  4.0                           4p7d 3F                  4p7d 3F
1  4.0                           4p8d 3F                  4p8d 3F
   5.0     46249.15              4s6h 1H                  4s6h 1H
   5.0     46249.15              4s6h 3H                  4s6h 3H
   5.0     47060.478             4s7h 1H                  4s7h 1H
   5.0     47060.478             4s7h 3H                  4s7h 3H
   5.0     47587.1  P            4s8h 1H                  4s8h 1H
   5.0     47587.1  P            4s8h 3H                  4s8h 3H
   5.0     47948.1  P            4s9h 1H                  4s9h 1H
   5.0     47948.1  P            4s9h 3H                  4s9h 3H
1  5.0                           3d4f 3G                  3d4f 3G
1  5.0                           3d4f 3H                  3d4f 3H
1  5.0                           3d4f 1H                  3d4f 1H
1  5.0                           3d5f 3G                  3d5f 3G
1  5.0                           3d5f 3H                  3d5f 3H
1  5.0                           3d5f 1H                  3d5f 1H
1  5.0                           3d6h 3I                  3d6h 3I
1  5.0                           3d6h 3H                  3d6h 3H
1  5.0                           3d6f 3G                  3d6f 3G
1  5.0                           3d6h 1H                  3d6h 1H
1  5.0                           3d6h 3G                  3d6h 3G
1  5.0                           3d6f 3H                  3d6f 3H
1  5.0                           3d6f 1H                  3d6f 1H
1  5.0                           3d7h 3I                  3d7h 3I
1  5.0                           3d7h 3H                  3d7h 3H
1  5.0                           3d7f 3G                  3d7f 3G
1  5.0                           3d7f 3H                  3d7f 3H
1  5.0                           3d7h 1H                  3d7h 1H
1  5.0                           3d7h 3G                  3d7h 3G
1  5.0                           3d7f 1H                  3d7f 1H
1  5.0                           3d8h 3I                  3d8h 3I
1  5.0                           3d8h 3H                  3d8h 3H
1  5.0                           3d8f 3G                  3d8f 3G
1  5.0                           3d8h 1H                  3d8h 1H
1  5.0                           3d8h 3G                  3d8h 3G
1  5.0                           3d8f 3H                  3d8f 3H
1  5.0                           3d8f 1H                  3d8f 1H
1  5.0                           3d9h 3I                  3d9h 3I
1  5.0                           3d9h 3H                  3d9h 3H
1  5.0                           3d9f 3G                  3d9f 3G
1  5.0                           3d9h 1H                  3d9h 1H
1  5.0                           3d9h 3G                  3d9h 3G
1  5.0                           3d9f 3H                  3d9f 3H
1  5.0                           3d9f 1H                  3d9f 1H
1  5.0                           3d10f 3G                 3d10f 3G
1  5.0                           3d10f 3H                 3d10f 3H
1  5.0                           3d10f 1H                 3d10f 1H
1  5.0                           3d11f 3G                 3d11f 3G
1  5.0                           3d11f 3H                 3d11f 3H
1  5.0                           3d11f 1H                 3d11f 1H
1  5.0                           3d12f 3G                 3d12f 3G
1  5.0                           3d12f 3H                 3d12f 3H
1  5.0                           3d12f 1H                 3d12f 1H
1  5.0                           3d13f 3G                 3d13f 3G
1  5.0                           3d13f 3H                 3d13f 3H
1  5.0                           3d13f 1H                 3d13f 1H
1  5.0                           3d14f 3G                 3d14f 3G
1  5.0                           3d14f 3H                 3d14f 3H
1  5.0                           3d14f 1H                 3d14f 1H
   6.0     46249.15              4s6h 3H                  4s6h 3H
   6.0     47060.478             4s7h 3H                  4s7h 3H
   6.0     47587.1  P            4s8h 3H                  4s8h 3H
   6.0     47948.1  P            4s9h 3H                  4s9h 3H
1  6.0                           3d4f 3H                  3d4f 3H
1  6.0                           3d5f 3H                  3d5f 3H
1  6.0                           3d6h 3I                  3d6h 3I
1  6.0                           3d6h 3K                  3d6h 3K
1  6.0                           3d6h 3H                  3d6h 3H
1  6.0                           3d6h 1I                  3d6h 1I
1  6.0                           3d6f 3H                  3d6f 3H
1  6.0                           3d7h 3I                  3d7h 3I
1  6.0                           3d7h 3K                  3d7h 3K
1  6.0                           3d7h 3H                  3d7h 3H
1  6.0                           3d7h 1I                  3d7h 1I
1  6.0                           3d7f 3H                  3d7f 3H
1  6.0                           3d8h 3I                  3d8h 3I
1  6.0                           3d8h 3K                  3d8h 3K
1  6.0                           3d8h 3H                  3d8h 3H
1  6.0                           3d8h 1I                  3d8h 1I
1  6.0                           3d8f 3H                  3d8f 3H
1  6.0                           3d9h 3I                  3d9h 3I
1  6.0                           3d9h 3K                  3d9h 3K
1  6.0                           3d9h 3H                  3d9h 3H
1  6.0                           3d9h 1I                  3d9h 1I
1  6.0                           3d9f 3H                  3d9f 3H
1  6.0                           3d10f 3H                 3d10f 3H
1  6.0                           3d11f 3H                 3d11f 3H
1  6.0                           3d12f 3H                 3d12f 3H
1  6.0                           3d13f 3H                 3d13f 3H
1  6.0                           3d14f 3H                 3d14f 3H
1  7.0                           3d6h 3K                  3d6h 3K
1  7.0                           3d6h 3I                  3d6h 3I
1  7.0                           3d6h 1K                  3d6h 1K
1  7.0                           3d7h 3K                  3d7h 3K
1  7.0                           3d7h 3I                  3d7h 3I
1  7.0                           3d7h 1K                  3d7h 1K
1  7.0                           3d8h 3K                  3d8h 3K
1  7.0                           3d8h 3I                  3d8h 3I
1  7.0                           3d8h 1K                  3d8h 1K
1  7.0                           3d9h 3K                  3d9h 3K
1  7.0                           3d9h 3I                  3d9h 3I
1  7.0                           3d9h 1K                  3d9h 1K
1  8.0                           3d6h 3K                  3d6h 3K
1  8.0                           3d7h 3K                  3d7h 3K
1  8.0                           3d8h 3K                  3d8h 3K
1  8.0                           3d9h 3K                  3d9h 3K
 4104      58.8   66      LEAST SQUARES
   1    1  EAV        18556.9    31.   13674.8             1.000  0    2700.0  0             4s4p
   2    1  ZETA 3       106.9    53.     102.5             1.000  0       0.0  0
   3    1  G1(23)     17610.6   119.   24527.6             0.700  0       0.0  0
   4    2  EAV        37236.4    33.   34156.1             1.000  0    2700.0  0             4s5p
   5    2  ZETA 4        18.8    55.      21.9             1.000  0       0.0  0
   6    2  G1(24)      2109.9   132.    2739.9             0.700  0       0.0  0
   7    3  EAV        42630.7    32.   39723.0             1.000  0    2700.0  0             4s6p
   8    3  ZETA 4         9.1     0.       9.1 FIXEDHF     1.000  0       0.0  0
   9    3  G1(24)       336.9     0.     962.6 FIXEDHF     0.350  0       0.0  0
  10    4  EAV        45009.2    32.   42194.6             1.000  0    2700.0  0             4s7p
  11    4  ZETA 4         4.7     0.       4.7 FIXEDHF     1.000  0       0.0  0
  12    4  G1(24)       137.7     0.     459.0 FIXEDHF     0.300  0       0.0  0
  13    5  EAV        46313.8    31.   43523.9             1.000  0    2700.0  0             4s8p
  14    5  ZETA 4         2.7     0.       2.7 FIXEDHF     1.000  0       0.0  0
  15    5  G1(24)        76.9     0.     256.4 FIXEDHF     0.300  0       0.0  0
  16    6  EAV        47105.3    35.   44323.5             1.000  0    2700.0  0             4s9p
  17    6  ZETA 4         1.7     0.       1.7 FIXEDHF     1.000  0       0.0  0
  18    6  G1(24)        47.5     0.     158.2 FIXEDHF     0.300  0       0.0  0
  19    7  EAV        47617.9    35.   44842.0             1.000  0    2700.0  0             4s10p
  20    7  ZETA 4         1.1     0.       1.1 FIXEDHF     1.000  0       0.0  0
  21    7  G1(24)        31.4     0.     104.6 FIXEDHF     0.300  0       0.0  0
  22    8  EAV        47970.0    35.   45197.4             1.000  0    2700.0  0             4s11p
  23    8  ZETA 4         0.8     0.       0.8 FIXEDHF     1.000  0       0.0  0
  24    8  G1(24)        21.9     0.      72.9 FIXEDHF     0.300  0       0.0  0
  25    9  EAV        48222.3    34.   45451.9             1.000  0    2700.0  0             4s12p
  26    9  ZETA 4         0.6     0.       0.6 FIXEDHF     1.000  0       0.0  0
  27    9  G1(24)        15.8     0.      52.8 FIXEDHF     0.300  0       0.0  0
  28    A  EAV        48409.2    34.   45640.4             1.000  0    2700.0  0             4s13p
  29    A  ZETA 4         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0
  30    A  G1(24)        11.8     0.      39.5 FIXEDHF     0.300  0       0.0  0
  31    B  EAV        48551.4    34.   45783.9             1.000  0    2700.0  0             4s14p
  32    B  ZETA 4         0.3     0.       0.3 FIXEDHF     1.000  0       0.0  0
  33    B  G1(24)         9.1     0.      30.4 FIXEDHF     0.300  0       0.0  0
  34    C  EAV        37924.5    18.   35193.8             1.000  0    1000.0  0             3d4p
  35    C  ZETA 1        19.0     0.      29.3 FIXEDHF     0.650  0       0.0  0
  36    C  ZETA 3        69.1     0.      69.1 FIXEDHF     1.000  0       0.0  0
  37    C  F2(13)      7313.4   114.   11053.8             0.500  0       0.0  0
  38    C  G1(13)      6953.8    75.    8148.0             0.500  0       0.0  0
  39    C  G3(13)      1662.9     0.    5542.9 FIXEDHF     0.300  0       0.0  0
  40    D  EAV        52516.6    30.   50600.2             1.000  0    1000.0  0             3d5p
  41    D  ZETA 1        21.1     0.      32.5 FIXEDHF     0.650  0       0.0  0
  42    D  ZETA 4        20.4     0.      20.4 FIXEDHF     1.000  0       0.0  0
  43    D  F2(14)      1549.1     0.    2581.8 FIXEDHF     0.600  0       0.0  0
  44    D  G1(14)      1093.1     0.    1366.4 FIXEDHF     0.800  0       0.0  0
  45    D  G3(14)       317.8     0.    1059.5 FIXEDHF     0.300  0       0.0  0
  46    E  EAV        56877.6    38.   55531.8             1.000  0    1000.0  0             3d6p
  47    E  ZETA 1        21.4     0.      33.0 FIXEDHF     0.650  0       0.0  0
  48    E  ZETA 4         8.9     0.       8.9 FIXEDHF     1.000  0       0.0  0
  49    E  F2(14)       618.1     0.    1030.1 FIXEDHF     0.600  0       0.0  0
  50    E  G1(14)       259.8     0.     519.5 FIXEDHF     0.500  0       0.0  0
  51    E  G3(14)       124.9     0.     416.5 FIXEDHF     0.300  0       0.0  0
  52    F  EAV        59140.1    47.   57809.9             1.000  0    1000.0  0             3d7p
  53    F  ZETA 1        21.5     0.      33.1 FIXEDHF     0.650  0       0.0  0
  54    F  ZETA 4         4.6     0.       4.6 FIXEDHF     1.000  0       0.0  0
  55    F  F2(14)       258.2     0.     516.4 FIXEDHF     0.500  0       0.0  0
  56    F  G1(14)       127.8     0.     255.7 FIXEDHF     0.500  0       0.0  0
  57    F  G3(14)       104.1     0.     208.2 FIXEDHF     0.500  0       0.0  0
  58    G  EAV        60303.2    50.   59057.3             1.000  0    1000.0  0             3d8p
  59    G  ZETA 1        21.6     0.      33.2 FIXEDHF     0.650  0       0.0  0
  60    G  ZETA 4         2.7     0.       2.7 FIXEDHF     1.000  0       0.0  0
  61    G  F2(14)       148.0     0.     296.0 FIXEDHF     0.500  0       0.0  0
  62    G  G1(14)        72.5     0.     145.1 FIXEDHF     0.500  0       0.0  0
  63    G  G3(14)        59.6     0.     119.2 FIXEDHF     0.500  0       0.0  0
  64    H  EAV        61011.2    52.   59816.1             1.000  0    1000.0  0             3d9p
  65    H  ZETA 1        21.6     0.      33.2 FIXEDHF     0.650  0       0.0  0
  66    H  ZETA 4         1.7     0.       1.7 FIXEDHF     1.000  0       0.0  0
  67    H  F2(14)        92.8     0.     185.5 FIXEDHF     0.500  0       0.0  0
  68    H  G1(14)        45.1     0.      90.3 FIXEDHF     0.500  0       0.0  0
  69    H  G3(14)        37.3     0.      74.6 FIXEDHF     0.500  0       0.0  0
  70    I  EAV        61466.1    47.   60312.0             1.000  0    1000.0  0             3d10p
  71    I  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
  72    I  ZETA 4         1.2     0.       1.2 FIXEDHF     1.000  0       0.0  0
  73    I  F2(14)        62.0     0.     123.9 FIXEDHF     0.500  0       0.0  0
  74    I  G1(14)        30.0     0.      60.0 FIXEDHF     0.500  0       0.0  0
  75    I  G3(14)        24.9     0.      49.8 FIXEDHF     0.500  0       0.0  0
  76    J  EAV        61772.7    46.   60653.7             1.000  0    1000.0  0             3d11p
  77    J  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
  78    J  ZETA 4         0.8     0.       0.8 FIXEDHF     1.000  0       0.0  0
  79    J  F2(14)        43.5     0.      86.9 FIXEDHF     0.500  0       0.0  0
  80    J  G1(14)        20.9     0.      41.9 FIXEDHF     0.500  0       0.0  0
  81    J  G3(14)        17.4     0.      34.9 FIXEDHF     0.500  0       0.0  0
  82    K  EAV        62009.5    35.   60899.5             1.000  0    1000.0  0             3d12p
  83    K  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
  84    K  ZETA 4         0.6     0.       0.6 FIXEDHF     1.000  0       0.0  0
  85    K  F2(14)        31.6     0.      63.3 FIXEDHF     0.500  0       0.0  0
  86    K  G1(14)        15.2     0.      30.4 FIXEDHF     0.500  0       0.0  0
  87    K  G3(14)        12.7     0.      25.4 FIXEDHF     0.500  0       0.0  0
  88    L  EAV        62171.6    35.   61082.1             1.000  0    1000.0  0             3d13p
  89    L  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
  90    L  ZETA 4         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0
  91    L  F2(14)        23.8     0.      47.5 FIXEDHF     0.500  0       0.0  0
  92    L  G1(14)        11.4     0.      22.8 FIXEDHF     0.500  0       0.0  0
  93    L  G3(14)         9.5     0.      19.0 FIXEDHF     0.500  0       0.0  0
  94    M  EAV        62274.3    44.   61221.4             1.000  0    1000.0  0             3d14p
  95    M  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
  96    M  ZETA 4         0.3     0.       0.3 FIXEDHF     1.000  0       0.0  0
  97    M  F2(14)        18.3     0.      36.5 FIXEDHF     0.500  0       0.0  0
  98    M  G1(14)         8.8     0.      17.5 FIXEDHF     0.500  0       0.0  0
  99    M  G3(14)         7.3     0.      14.6 FIXEDHF     0.500  0       0.0  0
 100    N  EAV        42247.6    31.   39424.9             1.000  0    2700.0  0             4s4f
 101    N  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 102    N  G3(25)        34.7     0.     115.8 FIXEDHF     0.300  0       0.0  0
 103    O  EAV        44814.3    30.   41996.0             1.000  0    2700.0  0             4s5f
 104    O  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 105    O  G3(25)        29.3     0.      97.6 FIXEDHF     0.300  0       0.0  0
 106    P  EAV        46197.3    30.   43396.8             1.000  0    2700.0  0             4s6f
 107    P  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 108    P  G3(25)        21.5     0.      71.8 FIXEDHF     0.300  0       0.0  0
 109    Q  EAV        47028.0    30.   44238.8             1.000  0    2700.0  0             4s7f
 110    Q  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 111    Q  G3(25)        24.5   239.      52.3             0.700  0       0.0  0
 112    R  EAV        47565.5    30.   44783.4             1.000  0    2700.0  0             4s8f
 113    R  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 114    R  G3(25)        19.5   239.      38.6             0.700  0       0.0  0
 115    S  EAV        47932.9    30.   45155.6             1.000  0    2700.0  0             4s9f
 116    S  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 117    S  G3(25)        15.5   239.      29.1             0.700  0       0.0  0
 118    T  EAV        48195.2    30.   45421.1             1.000  0    2700.0  0             4s10f
 119    T  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 120    T  G3(25)        12.5   239.      22.4             0.700  0       0.0  0
 121    U  EAV        48388.9    30.   45617.2             1.000  0    2700.0  0             4s11f
 122    U  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 123    U  G3(25)        10.1   239.      17.6             0.700  0       0.0  0
 124    V  EAV        48535.8    34.   45765.8             1.000  0    2700.0  0             4s12f
 125    V  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 126    V  G3(25)         9.1   253.      14.1             0.700  0       0.0  0
 127    W  EAV        48650.1    42.   45881.2             1.000  0    2700.0  0             4s13f
 128    W  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 129    W  G3(25)         8.1   292.      11.4             0.700  0       0.0  0
 130    X  EAV        48740.8    59.   45972.7             1.000  0    2700.0  0             4s14f
 131    X  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 132    X  G3(25)         6.6     0.       9.4 FIXEDHF     0.700  0       0.0  0
 133    Y  EAV        56095.6    22.   54914.2             1.000  0    1000.0  0             3d4f
 134    Y  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 135    Y  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 136    Y  F2(15)       286.9     0.     573.8 FIXEDHF     0.500  0       0.0  0
 137    Y  F4(15)        49.1     0.      98.3 FIXEDHF     0.500  0       0.0  0
 138    Y  G1(15)        28.1     0.      56.3 FIXEDHF     0.500  0       0.0  0
 139    Y  G3(15)        16.4     0.      32.7 FIXEDHF     0.500  0       0.0  0
 140    Y  G5(15)        11.3     0.      22.6 FIXEDHF     0.500  0       0.0  0
 141    Z  EAV        58559.6    28.   57464.7             1.000  0    1000.0  0             3d5f
 142    Z  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 143    Z  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 144    Z  F2(15)       147.7     0.     295.3 FIXEDHF     0.500  0       0.0  0
 145    Z  F4(15)        30.8     0.      61.6 FIXEDHF     0.500  0       0.0  0
 146    Z  G1(15)        22.1     0.      44.3 FIXEDHF     0.500  0       0.0  0
 147    Z  G3(15)        12.9     0.      25.8 FIXEDHF     0.500  0       0.0  0
 148    Z  G5(15)         8.9     0.      17.8 FIXEDHF     0.500  0       0.0  0
 149    a  EAV        59916.7    35.   58849.7             1.000  0    1000.0  0             3d6f
 150    a  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 151    a  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 152    a  F2(15)        86.0     0.     172.1 FIXEDHF     0.500  0       0.0  0
 153    a  F4(15)        19.6     0.      39.3 FIXEDHF     0.500  0       0.0  0
 154    a  G1(15)        15.6     0.      31.1 FIXEDHF     0.500  0       0.0  0
 155    a  G3(15)         9.1     0.      18.1 FIXEDHF     0.500  0       0.0  0
 156    a  G5(15)         6.3     0.      12.5 FIXEDHF     0.500  0       0.0  0
 157    b  EAV        60715.0    34.   59682.1             1.000  0    1000.0  0             3d7f
 158    b  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 159    b  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 160    b  F2(15)        54.6     0.     109.3 FIXEDHF     0.500  0       0.0  0
 161    b  F4(15)        13.2     0.      26.3 FIXEDHF     0.500  0       0.0  0
 162    b  G1(15)        10.9     0.      21.9 FIXEDHF     0.500  0       0.0  0
 163    b  G3(15)         6.4     0.      12.8 FIXEDHF     0.500  0       0.0  0
 164    b  G5(15)         4.4     0.       8.8 FIXEDHF     0.500  0       0.0  0
 165    c  EAV        61231.1    31.   60220.7             1.000  0    1000.0  0             3d8f
 166    c  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 167    c  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 168    c  F2(15)        36.9     0.      73.7 FIXEDHF     0.500  0       0.0  0
 169    c  F4(15)         9.2     0.      18.4 FIXEDHF     0.500  0       0.0  0
 170    c  G1(15)         7.9     0.      15.8 FIXEDHF     0.500  0       0.0  0
 171    c  G3(15)         4.6     0.       9.2 FIXEDHF     0.500  0       0.0  0
 172    c  G5(15)         3.2     0.       6.4 FIXEDHF     0.500  0       0.0  0
 173    d  EAV        61613.0    40.   60589.2             1.000  0    1000.0  0             3d9f
 174    d  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 175    d  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 176    d  F2(15)        26.1     0.      52.1 FIXEDHF     0.500  0       0.0  0
 177    d  F4(15)         6.7     0.      13.3 FIXEDHF     0.500  0       0.0  0
 178    d  G1(15)         5.8     0.      11.7 FIXEDHF     0.500  0       0.0  0
 179    d  G3(15)         3.4     0.       6.8 FIXEDHF     0.500  0       0.0  0
 180    d  G5(15)         2.4     0.       4.7 FIXEDHF     0.500  0       0.0  0
 181    e  EAV        61878.4    28.   60852.3             1.000  0    1000.0  0             3d10f
 182    e  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 183    e  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 184    e  F2(15)        19.1     0.      38.2 FIXEDHF     0.500  0       0.0  0
 185    e  F4(15)         5.0     0.       9.9 FIXEDHF     0.500  0       0.0  0
 186    e  G1(15)         4.5     0.       8.9 FIXEDHF     0.500  0       0.0  0
 187    e  G3(15)         2.6     0.       5.2 FIXEDHF     0.500  0       0.0  0
 188    e  G5(15)         1.8     0.       3.6 FIXEDHF     0.500  0       0.0  0
 189    f  EAV        62071.1    32.   61046.5             1.000  0    1000.0  0             3d11f
 190    f  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 191    f  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 192    f  F2(15)        14.4     0.      28.9 FIXEDHF     0.500  0       0.0  0
 193    f  F4(15)         3.8     0.       7.6 FIXEDHF     0.500  0       0.0  0
 194    f  G1(15)         3.5     0.       6.9 FIXEDHF     0.500  0       0.0  0
 195    f  G3(15)         2.0     0.       4.0 FIXEDHF     0.500  0       0.0  0
 196    f  G5(15)         1.4     0.       2.8 FIXEDHF     0.500  0       0.0  0
 197    g  EAV        62227.0    42.   61193.8             1.000  0    1000.0  0             3d12f
 198    g  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 199    g  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 200    g  F2(15)        11.2     0.      22.4 FIXEDHF     0.500  0       0.0  0
 201    g  F4(15)         3.0     0.       5.9 FIXEDHF     0.500  0       0.0  0
 202    g  G1(15)         2.7     0.       5.4 FIXEDHF     0.500  0       0.0  0
 203    g  G3(15)         1.6     0.       3.2 FIXEDHF     0.500  0       0.0  0
 204    g  G5(15)         1.1     0.       2.2 FIXEDHF     0.500  0       0.0  0
 205    h  EAV        62337.4    38.   61308.4             1.000  0    1000.0  0             3d13f
 206    h  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 207    h  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 208    h  F2(15)         8.8     0.      17.7 FIXEDHF     0.500  0       0.0  0
 209    h  F4(15)         2.4     0.       4.7 FIXEDHF     0.500  0       0.0  0
 210    h  G1(15)         2.2     0.       4.4 FIXEDHF     0.500  0       0.0  0
 211    h  G3(15)         1.3     0.       2.6 FIXEDHF     0.500  0       0.0  0
 212    h  G5(15)         0.9     0.       1.8 FIXEDHF     0.500  0       0.0  0
 213    i  EAV        62496.7    37.   61399.3             1.000  0    1000.0  0             3d14f
 214    i  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 215    i  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 216    i  F2(15)         7.1     0.      14.2 FIXEDHF     0.500  0       0.0  0
 217    i  F4(15)         1.9     0.       3.8 FIXEDHF     0.500  0       0.0  0
 218    i  G1(15)         1.8     0.       3.6 FIXEDHF     0.500  0       0.0  0
 219    i  G3(15)         1.1     0.       2.1 FIXEDHF     0.500  0       0.0  0
 220    i  G5(15)         0.7     0.       1.4 FIXEDHF     0.500  0       0.0  0
 221    j  EAV        46249.2    29.   43491.4             1.000  0    2700.0  0             4s6h
 222    j  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 223    j  G5(26)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 224    k  EAV        47060.5    29.   44300.0             1.000  0    2700.0  0             4s7h
 225    k  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 226    k  G5(26)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 227    l  EAV        47587.1    29.   44825.1             1.000  0    2700.0  0             4s8h
 228    l  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 229    l  G5(26)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 230    m  EAV        47948.1    29.   45185.3             1.000  0    2700.0  0             4s9h
 231    m  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 232    m  G5(26)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 233    n  EAV        59915.5     0.   58915.5 FIXEDHF     1.000  0    1000.0  0             3d6h
 234    n  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 235    n  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 236    n  F2(16)        21.7     0.      43.4 FIXEDHF     0.500  0       0.0  0
 237    n  F4(16)         0.6     0.       1.1 FIXEDHF     0.500  0       0.0  0
 238    n  G3(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 239    n  G5(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 240    n  G7(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 241    o  EAV        60724.1     0.   59724.1 FIXEDHF     1.000  0    1000.0  0             3d7h
 242    o  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 243    o  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 244    o  F2(16)        13.7     0.      27.4 FIXEDHF     0.500  0       0.0  0
 245    o  F4(16)         0.5     0.       0.9 FIXEDHF     0.500  0       0.0  0
 246    o  G3(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 247    o  G5(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 248    o  G7(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 249    p  EAV        61249.3     0.   60249.3 FIXEDHF     1.000  0    1000.0  0             3d8h
 250    p  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 251    p  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 252    p  F2(16)         9.2     0.      18.3 FIXEDHF     0.500  0       0.0  0
 253    p  F4(16)         0.3     0.       0.7 FIXEDHF     0.500  0       0.0  0
 254    p  G3(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 255    p  G5(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 256    p  G7(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 257    q  EAV        61609.4     0.   60609.4 FIXEDHF     1.000  0    1000.0  0             3d9h
 258    q  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 259    q  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 260    q  F2(16)         6.5     0.      12.9 FIXEDHF     0.500  0       0.0  0
 261    q  F4(16)         0.3     0.       0.5 FIXEDHF     0.500  0       0.0  0
 262    q  G3(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 263    q  G5(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 264    q  G7(16)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 265    r  EAV        57363.1    71.   52982.4             1.000  0    3000.0  0             4p5s
 266    r  ZETA 3       154.4     0.     154.4 FIXEDHF     1.000  0       0.0  0
 267    r  G1(37)      2160.7   222.    2426.8             0.700  0       0.0  0
 268    s  EAV        65267.0    50.   62343.1             1.000  0    3000.0  0             4p6s
 269    s  ZETA 3       162.7     0.     162.7 FIXEDHF     1.000  0       0.0  0
 270    s  G1(37)       459.5     0.     656.4 FIXEDHF     0.700  0       0.0  0
 271    t  EAV        69141.2    59.   65860.0             1.000  0    3000.0  0             4p7s
 272    t  ZETA 3       164.5     0.     164.5 FIXEDHF     1.000  0       0.0  0
 273    t  G1(37)       198.2     0.     283.1 FIXEDHF     0.700  0       0.0  0
 274    u  EAV        70930.6    52.   67617.7             1.000  0    3000.0  0             4p8s
 275    u  ZETA 3       165.1     0.     165.1 FIXEDHF     1.000  0       0.0  0
 276    u  G1(37)       104.2     0.     148.8 FIXEDHF     0.700  0       0.0  0
 277    v  EAV        60003.3     0.   59003.3 FIXEDHF     1.000  0    1000.0  0             4p4d
 278    v  ZETA 3       155.6     0.     155.6 FIXEDHF     1.000  0       0.0  0
 279    v  ZETA 8         2.7     0.       2.7 FIXEDHF     1.000  0       0.0  0
 280    v  F2(38)      3765.6     0.    5379.4 FIXEDHF     0.700  0       0.0  0
 281    v  G1(38)      1278.8     0.    1826.8 FIXEDHF     0.700  0       0.0  0
 282    v  G3(38)       998.8     0.    1426.8 FIXEDHF     0.700  0       0.0  0
 283    w  EAV        65538.3     0.   64538.3 FIXEDHF     1.000  0    1000.0  0             4p5d
 284    w  ZETA 3       161.7     0.     161.7 FIXEDHF     1.000  0       0.0  0
 285    w  ZETA 8         1.2     0.       1.2 FIXEDHF     1.000  0       0.0  0
 286    w  F2(38)      1477.8     0.    2111.2 FIXEDHF     0.700  0       0.0  0
 287    w  G1(38)       606.6     0.     866.6 FIXEDHF     0.700  0       0.0  0
 288    w  G3(38)       465.8     0.     665.5 FIXEDHF     0.700  0       0.0  0
 289    x  EAV        68932.2     0.   66932.2 FIXEDHF     1.000  0    2000.0  0             4p6d
 290    x  ZETA 3       163.8     0.     163.8 FIXEDHF     1.000  0       0.0  0
 291    x  ZETA 8         0.6     0.       0.6 FIXEDHF     1.000  0       0.0  0
 292    x  F2(38)       730.0     0.    1042.8 FIXEDHF     0.700  0       0.0  0
 293    x  G1(38)       325.6     0.     465.1 FIXEDHF     0.700  0       0.0  0
 294    x  G3(38)       248.4     0.     354.8 FIXEDHF     0.700  0       0.0  0
 295    y  EAV        71000.0     0.   68223.3 FIXED       1.000  0    3000.0  0             4p7d
 296    y  ZETA 3       164.7     0.     164.7 FIXEDHF     1.000  0       0.0  0
 297    y  ZETA 8         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0
 298    y  F2(38)       412.1     0.     588.7 FIXEDHF     0.700  0       0.0  0
 299    y  G1(38)       191.6     0.     273.7 FIXEDHF     0.700  0       0.0  0
 300    y  G3(38)       145.7     0.     208.2 FIXEDHF     0.700  0       0.0  0
 301    z  EAV        71527.2     0.   69002.6 FIXED       1.000  0    3000.0  0             4p8d
 302    z  ZETA 3       165.1     0.     165.1 FIXEDHF     1.000  0       0.0  0
 303    z  ZETA 8         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0
 304    z  F2(38)       254.8     0.     364.0 FIXEDHF     0.700  0       0.0  0
 305    z  G1(38)       121.2     0.     173.2 FIXEDHF     0.700  0       0.0  0
 306    z  G3(38)        92.1     0.     131.6 FIXEDHF     0.700  0       0.0  0
 307    12 0D2324       884.4     0.    1263.5 FIXEDHF     0.700  0       0.0  0  4s4p      -4s5p
 308    12 1E2324      5175.0     0.    7392.9 FIXEDHF     0.700  0       0.0  0
 309    13 0D2324       503.9     0.     719.9 FIXEDHF     0.700  0       0.0  0  4s4p      -4s6p
 310    13 1E2324      2923.3     0.    4176.1 FIXEDHF     0.700  0       0.0  0
 311    14 0D2324       340.8     0.     486.9 FIXEDHF     0.700  0       0.0  0  4s4p      -4s7p
 312    14 1E2324      1969.5     0.    2813.6 FIXEDHF     0.700  0       0.0  0
 313    15 0D2324       251.6     0.     359.4 FIXEDHF     0.700  0       0.0  0  4s4p      -4s8p
 314    15 1E2324      1450.5     0.    2072.1 FIXEDHF     0.700  0       0.0  0
 315    16 0D2324       196.0     0.     280.0 FIXEDHF     0.700  0       0.0  0  4s4p      -4s9p
 316    16 1E2324      1128.5     0.    1612.2 FIXEDHF     0.700  0       0.0  0
 317    17 0D2324       158.5     0.     226.4 FIXEDHF     0.700  0       0.0  0  4s4p      -4s10p
 318    17 1E2324       911.7     0.    1302.4 FIXEDHF     0.700  0       0.0  0
 319    18 0D2324       131.7     0.     188.1 FIXEDHF     0.700  0       0.0  0  4s4p      -4s11p
 320    18 1E2324       757.0     0.    1081.5 FIXEDHF     0.700  0       0.0  0
 321    19 0D2324       111.7     0.     159.6 FIXEDHF     0.700  0       0.0  0  4s4p      -4s12p
 322    19 1E2324       642.1     0.     917.3 FIXEDHF     0.700  0       0.0  0
 323    1A 0D2324        96.4     0.     137.7 FIXEDHF     0.700  0       0.0  0  4s4p      -4s13p
 324    1A 1E2324       553.8     0.     791.1 FIXEDHF     0.700  0       0.0  0
 325    1B 0D2324        84.3     0.     120.4 FIXEDHF     0.700  0       0.0  0  4s4p      -4s14p
 326    1B 1E2324       484.1     0.     691.6 FIXEDHF     0.700  0       0.0  0
 327    1C 2D2313     -8919.5     0.  -12742.2 FIXEDHF     0.700  0       0.0  0  4s4p      -3d4p
 328    1C 1E2313     -9491.8     0.  -13559.7 FIXEDHF     0.700  0       0.0  0
 329    1D 2D2314     -3126.3     0.   -4466.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d5p
 330    1D 1E2314     -3524.5     0.   -5035.0 FIXEDHF     0.700  0       0.0  0
 331    1E 2D2314     -1791.6     0.   -2559.4 FIXEDHF     0.700  0       0.0  0  4s4p      -3d6p
 332    1E 1E2314     -2060.2     0.   -2943.1 FIXEDHF     0.700  0       0.0  0
 333    1F 2D2314     -1209.2     0.   -1727.4 FIXEDHF     0.700  0       0.0  0  4s4p      -3d7p
 334    1F 1E2314     -1404.8     0.   -2006.9 FIXEDHF     0.700  0       0.0  0
 335    1G 2D2314      -889.7     0.   -1271.0 FIXEDHF     0.700  0       0.0  0  4s4p      -3d8p
 336    1G 1E2314     -1040.1     0.   -1485.9 FIXEDHF     0.700  0       0.0  0
 337    1H 2D2314      -691.0     0.    -987.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d9p
 338    1H 1E2314      -811.3     0.   -1159.0 FIXEDHF     0.700  0       0.0  0
 339    1I 2D2314      -557.0     0.    -795.7 FIXEDHF     0.700  0       0.0  0  4s4p      -3d10p
 340    1I 1E2314      -656.0     0.    -937.2 FIXEDHF     0.700  0       0.0  0
 341    1J 2D2314      -461.5     0.    -659.3 FIXEDHF     0.700  0       0.0  0  4s4p      -3d11p
 342    1J 1E2314      -544.9     0.    -778.4 FIXEDHF     0.700  0       0.0  0
 343    1K 2D2314      -390.5     0.    -557.9 FIXEDHF     0.700  0       0.0  0  4s4p      -3d12p
 344    1K 1E2314      -462.0     0.    -660.0 FIXEDHF     0.700  0       0.0  0
 345    1L 2D2314      -336.1     0.    -480.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d13p
 346    1L 1E2314      -398.2     0.    -568.8 FIXEDHF     0.700  0       0.0  0
 347    1M 2D2314      -293.2     0.    -418.9 FIXEDHF     0.700  0       0.0  0  4s4p      -3d14p
 348    1M 1E2314      -347.8     0.    -496.9 FIXEDHF     0.700  0       0.0  0
 349    1Y 2D2315      -957.0     0.   -1367.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d4f
 350    1Y 3E2315      -467.3     0.    -667.6 FIXEDHF     0.700  0       0.0  0
 351    1Z 2D2315      -830.3     0.   -1186.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d5f
 352    1Z 3E2315      -421.0     0.    -601.4 FIXEDHF     0.700  0       0.0  0
 353    1a 2D2315      -686.9     0.    -981.3 FIXEDHF     0.700  0       0.0  0  4s4p      -3d6f
 354    1a 3E2315      -355.5     0.    -507.8 FIXEDHF     0.700  0       0.0  0
 355    1b 2D2315      -571.9     0.    -817.0 FIXEDHF     0.700  0       0.0  0  4s4p      -3d7f
 356    1b 3E2315      -299.6     0.    -428.0 FIXEDHF     0.700  0       0.0  0
 357    1c 2D2315      -483.1     0.    -690.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d8f
 358    1c 3E2315      -255.2     0.    -364.6 FIXEDHF     0.700  0       0.0  0
 359    1d 2D2315      -414.0     0.    -591.5 FIXEDHF     0.700  0       0.0  0  4s4p      -3d9f
 360    1d 3E2315      -220.1     0.    -314.4 FIXEDHF     0.700  0       0.0  0
 361    1e 2D2315      -359.6     0.    -513.7 FIXEDHF     0.700  0       0.0  0  4s4p      -3d10f
 362    1e 3E2315      -192.0     0.    -274.3 FIXEDHF     0.700  0       0.0  0
 363    1f 2D2315      -315.9     0.    -451.3 FIXEDHF     0.700  0       0.0  0  4s4p      -3d11f
 364    1f 3E2315      -169.3     0.    -241.9 FIXEDHF     0.700  0       0.0  0
 365    1g 2D2315      -280.3     0.    -400.5 FIXEDHF     0.700  0       0.0  0  4s4p      -3d12f
 366    1g 3E2315      -150.7     0.    -215.3 FIXEDHF     0.700  0       0.0  0
 367    1h 2D2315      -250.9     0.    -358.5 FIXEDHF     0.700  0       0.0  0  4s4p      -3d13f
 368    1h 3E2315      -135.2     0.    -193.1 FIXEDHF     0.700  0       0.0  0
 369    1i 2D2315      -226.4     0.    -323.4 FIXEDHF     0.700  0       0.0  0  4s4p      -3d14f
 370    1i 3E2315      -122.2     0.    -174.6 FIXEDHF     0.700  0       0.0  0
 371    1r 1D2337     -1763.2     0.   -2518.8 FIXEDHF     0.700  0       0.0  0  4s4p      -4p5s
 372    1r 0E2337      -157.7     0.    -225.3 FIXEDHF     0.700  0       0.0  0
 373    1s 1D2337      -893.1     0.   -1275.8 FIXEDHF     0.700  0       0.0  0  4s4p      -4p6s
 374    1s 0E2337       -83.5     0.    -119.3 FIXEDHF     0.700  0       0.0  0
 375    1t 1D2337      -587.4     0.    -839.1 FIXEDHF     0.700  0       0.0  0  4s4p      -4p7s
 376    1t 0E2337       -58.2     0.     -83.2 FIXEDHF     0.700  0       0.0  0
 377    1u 1D2337      -427.1     0.    -610.2 FIXEDHF     0.700  0       0.0  0  4s4p      -4p8s
 378    1u 0E2337       -43.8     0.     -62.6 FIXEDHF     0.700  0       0.0  0
 379    1v 1D2338      4030.3     0.    5757.6 FIXEDHF     0.700  0       0.0  0  4s4p      -4p4d
 380    1v 2E2338      1051.8     0.    1502.5 FIXEDHF     0.700  0       0.0  0
 381    1w 1D2338      3026.2     0.    4323.1 FIXEDHF     0.700  0       0.0  0  4s4p      -4p5d
 382    1w 2E2338      1178.7     0.    1683.9 FIXEDHF     0.700  0       0.0  0
 383    1x 1D2338      2256.7     0.    3223.9 FIXEDHF     0.700  0       0.0  0  4s4p      -4p6d
 384    1x 2E2338       994.7     0.    1421.0 FIXEDHF     0.700  0       0.0  0
 385    1y 1D2338      1740.2     0.    2486.0 FIXEDHF     0.700  0       0.0  0  4s4p      -4p7d
 386    1y 2E2338       815.0     0.    1164.3 FIXEDHF     0.700  0       0.0  0
 387    1z 1D2338      1386.4     0.    1980.6 FIXEDHF     0.700  0       0.0  0  4s4p      -4p8d
 388    1z 2E2338       672.9     0.     961.3 FIXEDHF     0.700  0       0.0  0
 389    23 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s6p
 390    23 1E2424      1131.8     0.    1616.9 FIXEDHF     0.700  0       0.0  0
 391    24 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s7p
 392    24 1E2424       777.8     0.    1111.1 FIXEDHF     0.700  0       0.0  0
 393    25 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s8p
 394    25 1E2424       579.2     0.     827.4 FIXEDHF     0.700  0       0.0  0
 395    26 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s9p
 396    26 1E2424       453.8     0.     648.3 FIXEDHF     0.700  0       0.0  0
 397    27 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s10p
 398    27 1E2424       368.4     0.     526.3 FIXEDHF     0.700  0       0.0  0
 399    28 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s11p
 400    28 1E2424       307.0     0.     438.6 FIXEDHF     0.700  0       0.0  0
 401    29 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s12p
 402    29 1E2424       261.1     0.     373.0 FIXEDHF     0.700  0       0.0  0
 403    2A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s13p
 404    2A 1E2424       225.6     0.     322.3 FIXEDHF     0.700  0       0.0  0
 405    2B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s14p
 406    2B 1E2424       197.6     0.     282.3 FIXEDHF     0.700  0       0.0  0
 407    2C 2D2413     -2032.9     0.   -2904.1 FIXEDHF     0.700  0       0.0  0  4s5p      -3d4p
 408    2C 1E2413     -2788.9     0.   -3984.2 FIXEDHF     0.700  0       0.0  0
 409    2D 2D2414     -1779.2     0.   -2541.7 FIXEDHF     0.700  0       0.0  0  4s5p      -3d5p
 410    2D 1E2414     -1237.5     0.   -1767.8 FIXEDHF     0.700  0       0.0  0
 411    2E 2D2414     -1023.6     0.   -1462.3 FIXEDHF     0.700  0       0.0  0  4s5p      -3d6p
 412    2E 1E2414      -752.4     0.   -1074.9 FIXEDHF     0.700  0       0.0  0
 413    2F 2D2414      -699.3     0.    -999.0 FIXEDHF     0.700  0       0.0  0  4s5p      -3d7p
 414    2F 1E2414      -522.3     0.    -746.2 FIXEDHF     0.700  0       0.0  0
 415    2G 2D2414      -519.2     0.    -741.7 FIXEDHF     0.700  0       0.0  0  4s5p      -3d8p
 416    2G 1E2414      -390.7     0.    -558.2 FIXEDHF     0.700  0       0.0  0
 417    2H 2D2414      -406.0     0.    -580.0 FIXEDHF     0.700  0       0.0  0  4s5p      -3d9p
 418    2H 1E2414      -306.7     0.    -438.2 FIXEDHF     0.700  0       0.0  0
 419    2I 2D2414      -329.1     0.    -470.1 FIXEDHF     0.700  0       0.0  0  4s5p      -3d10p
 420    2I 1E2414      -249.2     0.    -356.0 FIXEDHF     0.700  0       0.0  0
 421    2J 2D2414      -273.9     0.    -391.3 FIXEDHF     0.700  0       0.0  0  4s5p      -3d11p
 422    2J 1E2414      -207.7     0.    -296.7 FIXEDHF     0.700  0       0.0  0
 423    2K 2D2414      -232.6     0.    -332.3 FIXEDHF     0.700  0       0.0  0  4s5p      -3d12p
 424    2K 1E2414      -176.5     0.    -252.2 FIXEDHF     0.700  0       0.0  0
 425    2L 2D2414      -200.8     0.    -286.9 FIXEDHF     0.700  0       0.0  0  4s5p      -3d13p
 426    2L 1E2414      -152.5     0.    -217.9 FIXEDHF     0.700  0       0.0  0
 427    2M 2D2414      -175.7     0.    -251.0 FIXEDHF     0.700  0       0.0  0  4s5p      -3d14p
 428    2M 1E2414      -133.4     0.    -190.6 FIXEDHF     0.700  0       0.0  0
 429    2Y 2D2415       397.3     0.     567.5 FIXEDHF     0.700  0       0.0  0  4s5p      -3d4f
 430    2Y 3E2415      -121.0     0.    -172.8 FIXEDHF     0.700  0       0.0  0
 431    2Z 2D2415       196.3     0.     280.5 FIXEDHF     0.700  0       0.0  0  4s5p      -3d5f
 432    2Z 3E2415      -111.9     0.    -159.8 FIXEDHF     0.700  0       0.0  0
 433    2a 2D2415       111.6     0.     159.5 FIXEDHF     0.700  0       0.0  0  4s5p      -3d6f
 434    2a 3E2415       -95.8     0.    -136.9 FIXEDHF     0.700  0       0.0  0
 435    2b 2D2415        70.2     0.     100.3 FIXEDHF     0.700  0       0.0  0  4s5p      -3d7f
 436    2b 3E2415       -81.5     0.    -116.5 FIXEDHF     0.700  0       0.0  0
 437    2c 2D2415        47.4     0.      67.7 FIXEDHF     0.700  0       0.0  0  4s5p      -3d8f
 438    2c 3E2415       -69.9     0.     -99.9 FIXEDHF     0.700  0       0.0  0
 439    2d 2D2415        33.7     0.      48.2 FIXEDHF     0.700  0       0.0  0  4s5p      -3d9f
 440    2d 3E2415       -60.5     0.     -86.5 FIXEDHF     0.700  0       0.0  0
 441    2e 2D2415        25.0     0.      35.7 FIXEDHF     0.700  0       0.0  0  4s5p      -3d10f
 442    2e 3E2415       -53.1     0.     -75.8 FIXEDHF     0.700  0       0.0  0
 443    2f 2D2415        19.1     0.      27.3 FIXEDHF     0.700  0       0.0  0  4s5p      -3d11f
 444    2f 3E2415       -46.9     0.     -67.0 FIXEDHF     0.700  0       0.0  0
 445    2g 2D2415        15.0     0.      21.4 FIXEDHF     0.700  0       0.0  0  4s5p      -3d12f
 446    2g 3E2415       -41.9     0.     -59.8 FIXEDHF     0.700  0       0.0  0
 447    2h 2D2415        12.0     0.      17.1 FIXEDHF     0.700  0       0.0  0  4s5p      -3d13f
 448    2h 3E2415       -37.6     0.     -53.7 FIXEDHF     0.700  0       0.0  0
 449    2i 2D2415         9.7     0.      13.9 FIXEDHF     0.700  0       0.0  0  4s5p      -3d14f
 450    2i 3E2415       -34.1     0.     -48.7 FIXEDHF     0.700  0       0.0  0
 451    2r 1D2437      4836.6     0.    6909.5 FIXEDHF     0.700  0       0.0  0  4s5p      -4p5s
 452    2r 0E2437      1241.2     0.    1773.2 FIXEDHF     0.700  0       0.0  0
 453    2s 1D2437       196.6     0.     280.9 FIXEDHF     0.700  0       0.0  0  4s5p      -4p6s
 454    2s 0E2437       660.7     0.     943.8 FIXEDHF     0.700  0       0.0  0
 455    2t 1D2437        65.8     0.      94.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4p7s
 456    2t 0E2437       425.8     0.     608.3 FIXEDHF     0.700  0       0.0  0
 457    2u 1D2437        21.0     0.      30.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4p8s
 458    2u 0E2437       304.4     0.     434.9 FIXEDHF     0.700  0       0.0  0
 459    2v 1D2438     -3539.3     0.   -5056.1 FIXEDHF     0.700  0       0.0  0  4s5p      -4p4d
 460    2v 2E2438      -180.8     0.    -258.3 FIXEDHF     0.700  0       0.0  0
 461    2w 1D2438      -230.6     0.    -329.4 FIXEDHF     0.700  0       0.0  0  4s5p      -4p5d
 462    2w 2E2438        38.4     0.      54.9 FIXEDHF     0.700  0       0.0  0
 463    2x 1D2438       188.6     0.     269.5 FIXEDHF     0.700  0       0.0  0  4s5p      -4p6d
 464    2x 2E2438        81.1     0.     115.8 FIXEDHF     0.700  0       0.0  0
 465    2y 1D2438       267.3     0.     381.8 FIXEDHF     0.700  0       0.0  0  4s5p      -4p7d
 466    2y 2E2438        84.2     0.     120.3 FIXEDHF     0.700  0       0.0  0
 467    2z 1D2438       267.6     0.     382.3 FIXEDHF     0.700  0       0.0  0  4s5p      -4p8d
 468    2z 2E2438        77.8     0.     111.1 FIXEDHF     0.700  0       0.0  0
 469    34 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s7p
 470    34 1E2424       464.9     0.     664.1 FIXEDHF     0.700  0       0.0  0
 471    35 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s8p
 472    35 1E2424       347.0     0.     495.7 FIXEDHF     0.700  0       0.0  0
 473    36 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s9p
 474    36 1E2424       272.2     0.     388.9 FIXEDHF     0.700  0       0.0  0
 475    37 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s10p
 476    37 1E2424       221.2     0.     316.0 FIXEDHF     0.700  0       0.0  0
 477    38 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s11p
 478    38 1E2424       184.4     0.     263.5 FIXEDHF     0.700  0       0.0  0
 479    39 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s12p
 480    39 1E2424       157.0     0.     224.3 FIXEDHF     0.700  0       0.0  0
 481    3A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s13p
 482    3A 1E2424       135.7     0.     193.9 FIXEDHF     0.700  0       0.0  0
 483    3B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s14p
 484    3B 1E2424       118.9     0.     169.8 FIXEDHF     0.700  0       0.0  0
 485    3C 2D2413     -1070.2     0.   -1528.9 FIXEDHF     0.700  0       0.0  0  4s6p      -3d4p
 486    3C 1E2413     -1583.7     0.   -2262.4 FIXEDHF     0.700  0       0.0  0
 487    3D 2D2414      -867.6     0.   -1239.4 FIXEDHF     0.700  0       0.0  0  4s6p      -3d5p
 488    3D 1E2414      -727.3     0.   -1039.0 FIXEDHF     0.700  0       0.0  0
 489    3E 2D2414      -681.0     0.    -972.8 FIXEDHF     0.700  0       0.0  0  4s6p      -3d6p
 490    3E 1E2414      -445.7     0.    -636.7 FIXEDHF     0.700  0       0.0  0
 491    3F 2D2414      -464.2     0.    -663.1 FIXEDHF     0.700  0       0.0  0  4s6p      -3d7p
 492    3F 1E2414      -310.5     0.    -443.6 FIXEDHF     0.700  0       0.0  0
 493    3G 2D2414      -345.8     0.    -494.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d8p
 494    3G 1E2414      -232.7     0.    -332.5 FIXEDHF     0.700  0       0.0  0
 495    3H 2D2414      -271.1     0.    -387.3 FIXEDHF     0.700  0       0.0  0  4s6p      -3d9p
 496    3H 1E2414      -183.0     0.    -261.4 FIXEDHF     0.700  0       0.0  0
 497    3I 2D2414      -220.2     0.    -314.6 FIXEDHF     0.700  0       0.0  0  4s6p      -3d10p
 498    3I 1E2414      -148.8     0.    -212.5 FIXEDHF     0.700  0       0.0  0
 499    3J 2D2414      -183.5     0.    -262.2 FIXEDHF     0.700  0       0.0  0  4s6p      -3d11p
 500    3J 1E2414      -124.0     0.    -177.2 FIXEDHF     0.700  0       0.0  0
 501    3K 2D2414      -156.1     0.    -223.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d12p
 502    3K 1E2414      -105.5     0.    -150.7 FIXEDHF     0.700  0       0.0  0
 503    3L 2D2414      -135.0     0.    -192.8 FIXEDHF     0.700  0       0.0  0  4s6p      -3d13p
 504    3L 1E2414       -91.2     0.    -130.3 FIXEDHF     0.700  0       0.0  0
 505    3M 2D2414      -118.2     0.    -168.8 FIXEDHF     0.700  0       0.0  0  4s6p      -3d14p
 506    3M 1E2414       -79.8     0.    -114.0 FIXEDHF     0.700  0       0.0  0
 507    3Y 2D2415        86.4     0.     123.4 FIXEDHF     0.700  0       0.0  0  4s6p      -3d4f
 508    3Y 3E2415       -65.7     0.     -93.8 FIXEDHF     0.700  0       0.0  0
 509    3Z 2D2415       140.0     0.     200.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d5f
 510    3Z 3E2415       -61.2     0.     -87.4 FIXEDHF     0.700  0       0.0  0
 511    3a 2D2415       102.7     0.     146.7 FIXEDHF     0.700  0       0.0  0  4s6p      -3d6f
 512    3a 3E2415       -52.6     0.     -75.2 FIXEDHF     0.700  0       0.0  0
 513    3b 2D2415        76.2     0.     108.9 FIXEDHF     0.700  0       0.0  0  4s6p      -3d7f
 514    3b 3E2415       -44.9     0.     -64.1 FIXEDHF     0.700  0       0.0  0
 515    3c 2D2415        58.8     0.      84.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d8f
 516    3c 3E2415       -38.6     0.     -55.1 FIXEDHF     0.700  0       0.0  0
 517    3d 2D2415        46.9     0.      67.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d9f
 518    3d 3E2415       -33.5     0.     -47.8 FIXEDHF     0.700  0       0.0  0
 519    3e 2D2415        38.4     0.      54.9 FIXEDHF     0.700  0       0.0  0  4s6p      -3d10f
 520    3e 3E2415       -29.3     0.     -41.9 FIXEDHF     0.700  0       0.0  0
 521    3f 2D2415        32.2     0.      46.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d11f
 522    3f 3E2415       -25.9     0.     -37.0 FIXEDHF     0.700  0       0.0  0
 523    3g 2D2415        27.4     0.      39.2 FIXEDHF     0.700  0       0.0  0  4s6p      -3d12f
 524    3g 3E2415       -23.2     0.     -33.1 FIXEDHF     0.700  0       0.0  0
 525    3h 2D2415        23.7     0.      33.9 FIXEDHF     0.700  0       0.0  0  4s6p      -3d13f
 526    3h 3E2415       -20.9     0.     -29.8 FIXEDHF     0.700  0       0.0  0
 527    3i 2D2415        20.8     0.      29.7 FIXEDHF     0.700  0       0.0  0  4s6p      -3d14f
 528    3i 3E2415       -18.8     0.     -26.9 FIXEDHF     0.700  0       0.0  0
 529    3r 1D2437      2667.8     0.    3811.2 FIXEDHF     0.700  0       0.0  0  4s6p      -4p5s
 530    3r 0E2437       728.1     0.    1040.2 FIXEDHF     0.700  0       0.0  0
 531    3s 1D2437      1746.6     0.    2495.1 FIXEDHF     0.700  0       0.0  0  4s6p      -4p6s
 532    3s 0E2437       393.5     0.     562.1 FIXEDHF     0.700  0       0.0  0
 533    3t 1D2437       224.8     0.     321.2 FIXEDHF     0.700  0       0.0  0  4s6p      -4p7s
 534    3t 0E2437       254.9     0.     364.2 FIXEDHF     0.700  0       0.0  0
 535    3u 1D2437       127.8     0.     182.6 FIXEDHF     0.700  0       0.0  0  4s6p      -4p8s
 536    3u 0E2437       182.8     0.     261.1 FIXEDHF     0.700  0       0.0  0
 537    3v 1D2438     -1476.5     0.   -2109.3 FIXEDHF     0.700  0       0.0  0  4s6p      -4p4d
 538    3v 2E2438      -170.0     0.    -242.9 FIXEDHF     0.700  0       0.0  0
 539    3w 1D2438     -1489.5     0.   -2127.8 FIXEDHF     0.700  0       0.0  0  4s6p      -4p5d
 540    3w 2E2438       -25.8     0.     -36.8 FIXEDHF     0.700  0       0.0  0
 541    3x 1D2438      -356.7     0.    -509.6 FIXEDHF     0.700  0       0.0  0  4s6p      -4p6d
 542    3x 2E2438        11.7     0.      16.7 FIXEDHF     0.700  0       0.0  0
 543    3y 1D2438      -111.6     0.    -159.5 FIXEDHF     0.700  0       0.0  0  4s6p      -4p7d
 544    3y 2E2438        21.8     0.      31.2 FIXEDHF     0.700  0       0.0  0
 545    3z 1D2438       -23.2     0.     -33.2 FIXEDHF     0.700  0       0.0  0  4s6p      -4p8d
 546    3z 2E2438        23.7     0.      33.9 FIXEDHF     0.700  0       0.0  0
 547    45 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s8p
 548    45 1E2424       240.1     0.     343.0 FIXEDHF     0.700  0       0.0  0
 549    46 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s9p
 550    46 1E2424       188.5     0.     269.3 FIXEDHF     0.700  0       0.0  0
 551    47 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s10p
 552    47 1E2424       153.2     0.     218.9 FIXEDHF     0.700  0       0.0  0
 553    48 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s11p
 554    48 1E2424       127.8     0.     182.6 FIXEDHF     0.700  0       0.0  0
 555    49 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s12p
 556    49 1E2424       108.8     0.     155.4 FIXEDHF     0.700  0       0.0  0
 557    4A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s13p
 558    4A 1E2424        94.1     0.     134.4 FIXEDHF     0.700  0       0.0  0
 559    4B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s14p
 560    4B 1E2424        82.4     0.     117.7 FIXEDHF     0.700  0       0.0  0
 561    4C 2D2413      -696.4     0.    -994.9 FIXEDHF     0.700  0       0.0  0  4s7p      -3d4p
 562    4C 1E2413     -1071.0     0.   -1530.0 FIXEDHF     0.700  0       0.0  0
 563    4D 2D2414      -562.7     0.    -803.8 FIXEDHF     0.700  0       0.0  0  4s7p      -3d5p
 564    4D 1E2414      -499.3     0.    -713.3 FIXEDHF     0.700  0       0.0  0
 565    4E 2D2414      -424.4     0.    -606.3 FIXEDHF     0.700  0       0.0  0  4s7p      -3d6p
 566    4E 1E2414      -307.0     0.    -438.6 FIXEDHF     0.700  0       0.0  0
 567    4F 2D2414      -335.2     0.    -478.8 FIXEDHF     0.700  0       0.0  0  4s7p      -3d7p
 568    4F 1E2414      -214.3     0.    -306.1 FIXEDHF     0.700  0       0.0  0
 569    4G 2D2414      -249.3     0.    -356.1 FIXEDHF     0.700  0       0.0  0  4s7p      -3d8p
 570    4G 1E2414      -160.7     0.    -229.6 FIXEDHF     0.700  0       0.0  0
 571    4H 2D2414      -195.7     0.    -279.6 FIXEDHF     0.700  0       0.0  0  4s7p      -3d9p
 572    4H 1E2414      -126.4     0.    -180.6 FIXEDHF     0.700  0       0.0  0
 573    4I 2D2414      -159.2     0.    -227.4 FIXEDHF     0.700  0       0.0  0  4s7p      -3d10p
 574    4I 1E2414      -102.8     0.    -146.9 FIXEDHF     0.700  0       0.0  0
 575    4J 2D2414      -132.9     0.    -189.8 FIXEDHF     0.700  0       0.0  0  4s7p      -3d11p
 576    4J 1E2414       -85.8     0.    -122.6 FIXEDHF     0.700  0       0.0  0
 577    4K 2D2414      -113.1     0.    -161.6 FIXEDHF     0.700  0       0.0  0  4s7p      -3d12p
 578    4K 1E2414       -73.0     0.    -104.3 FIXEDHF     0.700  0       0.0  0
 579    4L 2D2414       -97.9     0.    -139.8 FIXEDHF     0.700  0       0.0  0  4s7p      -3d13p
 580    4L 1E2414       -63.1     0.     -90.1 FIXEDHF     0.700  0       0.0  0
 581    4M 2D2414       -85.7     0.    -122.4 FIXEDHF     0.700  0       0.0  0  4s7p      -3d14p
 582    4M 1E2414       -55.2     0.     -78.9 FIXEDHF     0.700  0       0.0  0
 583    4Y 2D2415        54.7     0.      78.1 FIXEDHF     0.700  0       0.0  0  4s7p      -3d4f
 584    4Y 3E2415       -43.4     0.     -62.0 FIXEDHF     0.700  0       0.0  0
 585    4Z 2D2415        52.8     0.      75.5 FIXEDHF     0.700  0       0.0  0  4s7p      -3d5f
 586    4Z 3E2415       -40.5     0.     -57.9 FIXEDHF     0.700  0       0.0  0
 587    4a 2D2415        64.5     0.      92.1 FIXEDHF     0.700  0       0.0  0  4s7p      -3d6f
 588    4a 3E2415       -34.9     0.     -49.9 FIXEDHF     0.700  0       0.0  0
 589    4b 2D2415        53.3     0.      76.1 FIXEDHF     0.700  0       0.0  0  4s7p      -3d7f
 590    4b 3E2415       -29.8     0.     -42.6 FIXEDHF     0.700  0       0.0  0
 591    4c 2D2415        43.3     0.      61.9 FIXEDHF     0.700  0       0.0  0  4s7p      -3d8f
 592    4c 3E2415       -25.6     0.     -36.6 FIXEDHF     0.700  0       0.0  0
 593    4d 2D2415        35.8     0.      51.1 FIXEDHF     0.700  0       0.0  0  4s7p      -3d9f
 594    4d 3E2415       -22.3     0.     -31.8 FIXEDHF     0.700  0       0.0  0
 595    4e 2D2415        30.0     0.      42.9 FIXEDHF     0.700  0       0.0  0  4s7p      -3d10f
 596    4e 3E2415       -19.5     0.     -27.9 FIXEDHF     0.700  0       0.0  0
 597    4f 2D2415        25.6     0.      36.6 FIXEDHF     0.700  0       0.0  0  4s7p      -3d11f
 598    4f 3E2415       -17.3     0.     -24.7 FIXEDHF     0.700  0       0.0  0
 599    4g 2D2415        22.2     0.      31.7 FIXEDHF     0.700  0       0.0  0  4s7p      -3d12f
 600    4g 3E2415       -15.4     0.     -22.0 FIXEDHF     0.700  0       0.0  0
 601    4h 2D2415        19.4     0.      27.7 FIXEDHF     0.700  0       0.0  0  4s7p      -3d13f
 602    4h 3E2415       -13.9     0.     -19.8 FIXEDHF     0.700  0       0.0  0
 603    4i 2D2415        17.1     0.      24.5 FIXEDHF     0.700  0       0.0  0  4s7p      -3d14f
 604    4i 3E2415       -12.6     0.     -18.0 FIXEDHF     0.700  0       0.0  0
 605    4r 1D2437      1804.6     0.    2578.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4p5s
 606    4r 0E2437       498.4     0.     712.0 FIXEDHF     0.700  0       0.0  0
 607    4s 1D2437      1175.2     0.    1678.8 FIXEDHF     0.700  0       0.0  0  4s7p      -4p6s
 608    4s 0E2437       271.1     0.     387.3 FIXEDHF     0.700  0       0.0  0
 609    4t 1D2437       796.5     0.    1137.9 FIXEDHF     0.700  0       0.0  0  4s7p      -4p7s
 610    4t 0E2437       176.1     0.     251.6 FIXEDHF     0.700  0       0.0  0
 611    4u 1D2437       163.7     0.     233.9 FIXEDHF     0.700  0       0.0  0  4s7p      -4p8s
 612    4u 0E2437       126.4     0.     180.6 FIXEDHF     0.700  0       0.0  0
 613    4v 1D2438      -953.7     0.   -1362.4 FIXEDHF     0.700  0       0.0  0  4s7p      -4p4d
 614    4v 2E2438      -136.0     0.    -194.3 FIXEDHF     0.700  0       0.0  0
 615    4w 1D2438      -763.7     0.   -1091.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4p5d
 616    4w 2E2438       -32.6     0.     -46.6 FIXEDHF     0.700  0       0.0  0
 617    4x 1D2438      -751.7     0.   -1073.8 FIXEDHF     0.700  0       0.0  0  4s7p      -4p6d
 618    4x 2E2438        -3.2     0.      -4.6 FIXEDHF     0.700  0       0.0  0
 619    4y 1D2438      -266.6     0.    -380.8 FIXEDHF     0.700  0       0.0  0  4s7p      -4p7d
 620    4y 2E2438         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
 621    4z 1D2438      -133.3     0.    -190.4 FIXEDHF     0.700  0       0.0  0  4s7p      -4p8d
 622    4z 2E2438         9.4     0.      13.4 FIXEDHF     0.700  0       0.0  0
 623    56 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s9p
 624    56 1E2424       141.0     0.     201.4 FIXEDHF     0.700  0       0.0  0
 625    57 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s10p
 626    57 1E2424       114.6     0.     163.7 FIXEDHF     0.700  0       0.0  0
 627    58 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s11p
 628    58 1E2424        95.6     0.     136.6 FIXEDHF     0.700  0       0.0  0
 629    59 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s12p
 630    59 1E2424        81.4     0.     116.3 FIXEDHF     0.700  0       0.0  0
 631    5A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s13p
 632    5A 1E2424        70.4     0.     100.6 FIXEDHF     0.700  0       0.0  0
 633    5B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s14p
 634    5B 1E2424        61.7     0.      88.1 FIXEDHF     0.700  0       0.0  0
 635    5C 2D2413      -502.4     0.    -717.7 FIXEDHF     0.700  0       0.0  0  4s8p      -3d4p
 636    5C 1E2413      -790.6     0.   -1129.5 FIXEDHF     0.700  0       0.0  0
 637    5D 2D2414      -406.9     0.    -581.3 FIXEDHF     0.700  0       0.0  0  4s8p      -3d5p
 638    5D 1E2414      -371.7     0.    -531.0 FIXEDHF     0.700  0       0.0  0
 639    5E 2D2414      -305.3     0.    -436.1 FIXEDHF     0.700  0       0.0  0  4s8p      -3d6p
 640    5E 1E2414      -229.0     0.    -327.2 FIXEDHF     0.700  0       0.0  0
 641    5F 2D2414      -235.8     0.    -336.9 FIXEDHF     0.700  0       0.0  0  4s8p      -3d7p
 642    5F 1E2414      -159.9     0.    -228.5 FIXEDHF     0.700  0       0.0  0
 643    5G 2D2414      -190.3     0.    -271.8 FIXEDHF     0.700  0       0.0  0  4s8p      -3d8p
 644    5G 1E2414      -120.0     0.    -171.5 FIXEDHF     0.700  0       0.0  0
 645    5H 2D2414      -149.2     0.    -213.2 FIXEDHF     0.700  0       0.0  0  4s8p      -3d9p
 646    5H 1E2414       -94.4     0.    -134.9 FIXEDHF     0.700  0       0.0  0
 647    5I 2D2414      -121.5     0.    -173.6 FIXEDHF     0.700  0       0.0  0  4s8p      -3d10p
 648    5I 1E2414       -76.9     0.    -109.8 FIXEDHF     0.700  0       0.0  0
 649    5J 2D2414      -101.5     0.    -145.0 FIXEDHF     0.700  0       0.0  0  4s8p      -3d11p
 650    5J 1E2414       -64.1     0.     -91.6 FIXEDHF     0.700  0       0.0  0
 651    5K 2D2414       -86.4     0.    -123.5 FIXEDHF     0.700  0       0.0  0  4s8p      -3d12p
 652    5K 1E2414       -54.5     0.     -77.9 FIXEDHF     0.700  0       0.0  0
 653    5L 2D2414       -74.8     0.    -106.9 FIXEDHF     0.700  0       0.0  0  4s8p      -3d13p
 654    5L 1E2414       -47.2     0.     -67.4 FIXEDHF     0.700  0       0.0  0
 655    5M 2D2414       -65.6     0.     -93.7 FIXEDHF     0.700  0       0.0  0  4s8p      -3d14p
 656    5M 1E2414       -41.3     0.     -59.0 FIXEDHF     0.700  0       0.0  0
 657    5Y 2D2415        39.1     0.      55.8 FIXEDHF     0.700  0       0.0  0  4s8p      -3d4f
 658    5Y 3E2415       -31.6     0.     -45.1 FIXEDHF     0.700  0       0.0  0
 659    5Z 2D2415        37.2     0.      53.1 FIXEDHF     0.700  0       0.0  0  4s8p      -3d5f
 660    5Z 3E2415       -29.5     0.     -42.2 FIXEDHF     0.700  0       0.0  0
 661    5a 2D2415        32.8     0.      46.8 FIXEDHF     0.700  0       0.0  0  4s8p      -3d6f
 662    5a 3E2415       -25.5     0.     -36.4 FIXEDHF     0.700  0       0.0  0
 663    5b 2D2415        35.2     0.      50.3 FIXEDHF     0.700  0       0.0  0  4s8p      -3d7f
 664    5b 3E2415       -21.8     0.     -31.1 FIXEDHF     0.700  0       0.0  0
 665    5c 2D2415        30.5     0.      43.6 FIXEDHF     0.700  0       0.0  0  4s8p      -3d8f
 666    5c 3E2415       -18.8     0.     -26.8 FIXEDHF     0.700  0       0.0  0
 667    5d 2D2415        26.0     0.      37.1 FIXEDHF     0.700  0       0.0  0  4s8p      -3d9f
 668    5d 3E2415       -16.3     0.     -23.3 FIXEDHF     0.700  0       0.0  0
 669    5e 2D2415        22.3     0.      31.8 FIXEDHF     0.700  0       0.0  0  4s8p      -3d10f
 670    5e 3E2415       -14.3     0.     -20.4 FIXEDHF     0.700  0       0.0  0
 671    5f 2D2415        19.3     0.      27.5 FIXEDHF     0.700  0       0.0  0  4s8p      -3d11f
 672    5f 3E2415       -12.7     0.     -18.1 FIXEDHF     0.700  0       0.0  0
 673    5g 2D2415        16.8     0.      24.0 FIXEDHF     0.700  0       0.0  0  4s8p      -3d12f
 674    5g 3E2415       -11.3     0.     -16.1 FIXEDHF     0.700  0       0.0  0
 675    5h 2D2415        14.8     0.      21.2 FIXEDHF     0.700  0       0.0  0  4s8p      -3d13f
 676    5h 3E2415       -10.1     0.     -14.5 FIXEDHF     0.700  0       0.0  0
 677    5i 2D2415        13.2     0.      18.8 FIXEDHF     0.700  0       0.0  0  4s8p      -3d14f
 678    5i 3E2415        -9.2     0.     -13.1 FIXEDHF     0.700  0       0.0  0
 679    5r 1D2437      1336.2     0.    1908.8 FIXEDHF     0.700  0       0.0  0  4s8p      -4p5s
 680    5r 0E2437       370.2     0.     528.9 FIXEDHF     0.700  0       0.0  0
 681    5s 1D2437       873.7     0.    1248.1 FIXEDHF     0.700  0       0.0  0  4s8p      -4p6s
 682    5s 0E2437       202.2     0.     288.8 FIXEDHF     0.700  0       0.0  0
 683    5t 1D2437       594.9     0.     849.9 FIXEDHF     0.700  0       0.0  0  4s8p      -4p7s
 684    5t 0E2437       131.5     0.     187.9 FIXEDHF     0.700  0       0.0  0
 685    5u 1D2437       423.0     0.     604.3 FIXEDHF     0.700  0       0.0  0  4s8p      -4p8s
 686    5u 0E2437        94.4     0.     134.9 FIXEDHF     0.700  0       0.0  0
 687    5v 1D2438      -693.5     0.    -990.7 FIXEDHF     0.700  0       0.0  0  4s8p      -4p4d
 688    5v 2E2438      -109.2     0.    -156.0 FIXEDHF     0.700  0       0.0  0
 689    5w 1D2438      -535.7     0.    -765.3 FIXEDHF     0.700  0       0.0  0  4s8p      -4p5d
 690    5w 2E2438       -30.5     0.     -43.6 FIXEDHF     0.700  0       0.0  0
 691    5x 1D2438      -434.2     0.    -620.3 FIXEDHF     0.700  0       0.0  0  4s8p      -4p6d
 692    5x 2E2438        -7.1     0.     -10.1 FIXEDHF     0.700  0       0.0  0
 693    5y 1D2438      -428.5     0.    -612.2 FIXEDHF     0.700  0       0.0  0  4s8p      -4p7d
 694    5y 2E2438         1.1     0.       1.5 FIXEDHF     0.700  0       0.0  0
 695    5z 1D2438      -188.3     0.    -269.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4p8d
 696    5z 2E2438         4.1     0.       5.8 FIXEDHF     0.700  0       0.0  0
 697    67 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4s10p
 698    67 1E2424        90.0     0.     128.6 FIXEDHF     0.700  0       0.0  0
 699    68 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4s11p
 700    68 1E2424        75.1     0.     107.3 FIXEDHF     0.700  0       0.0  0
 701    69 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4s12p
 702    69 1E2424        64.0     0.      91.4 FIXEDHF     0.700  0       0.0  0
 703    6A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4s13p
 704    6A 1E2424        55.3     0.      79.0 FIXEDHF     0.700  0       0.0  0
 705    6B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4s14p
 706    6B 1E2424        48.5     0.      69.3 FIXEDHF     0.700  0       0.0  0
 707    6C 2D2413      -385.6     0.    -550.8 FIXEDHF     0.700  0       0.0  0  4s9p      -3d4p
 708    6C 1E2413      -616.1     0.    -880.2 FIXEDHF     0.700  0       0.0  0
 709    6D 2D2414      -313.2     0.    -447.4 FIXEDHF     0.700  0       0.0  0  4s9p      -3d5p
 710    6D 1E2414      -291.2     0.    -416.0 FIXEDHF     0.700  0       0.0  0
 711    6E 2D2414      -234.7     0.    -335.3 FIXEDHF     0.700  0       0.0  0  4s9p      -3d6p
 712    6E 1E2414      -179.6     0.    -256.6 FIXEDHF     0.700  0       0.0  0
 713    6F 2D2414      -180.7     0.    -258.1 FIXEDHF     0.700  0       0.0  0  4s9p      -3d7p
 714    6F 1E2414      -125.5     0.    -179.3 FIXEDHF     0.700  0       0.0  0
 715    6G 2D2414      -143.8     0.    -205.4 FIXEDHF     0.700  0       0.0  0  4s9p      -3d8p
 716    6G 1E2414       -94.2     0.    -134.6 FIXEDHF     0.700  0       0.0  0
 717    6H 2D2414      -118.6     0.    -169.4 FIXEDHF     0.700  0       0.0  0  4s9p      -3d9p
 718    6H 1E2414       -74.1     0.    -105.9 FIXEDHF     0.700  0       0.0  0
 719    6I 2D2414       -96.5     0.    -137.8 FIXEDHF     0.700  0       0.0  0  4s9p      -3d10p
 720    6I 1E2414       -60.3     0.     -86.2 FIXEDHF     0.700  0       0.0  0
 721    6J 2D2414       -80.6     0.    -115.2 FIXEDHF     0.700  0       0.0  0  4s9p      -3d11p
 722    6J 1E2414       -50.3     0.     -71.9 FIXEDHF     0.700  0       0.0  0
 723    6K 2D2414       -68.7     0.     -98.1 FIXEDHF     0.700  0       0.0  0  4s9p      -3d12p
 724    6K 1E2414       -42.8     0.     -61.2 FIXEDHF     0.700  0       0.0  0
 725    6L 2D2414       -59.5     0.     -85.0 FIXEDHF     0.700  0       0.0  0  4s9p      -3d13p
 726    6L 1E2414       -37.0     0.     -52.9 FIXEDHF     0.700  0       0.0  0
 727    6M 2D2414       -52.1     0.     -74.5 FIXEDHF     0.700  0       0.0  0  4s9p      -3d14p
 728    6M 1E2414       -32.4     0.     -46.3 FIXEDHF     0.700  0       0.0  0
 729    6Y 2D2415        29.9     0.      42.7 FIXEDHF     0.700  0       0.0  0  4s9p      -3d4f
 730    6Y 3E2415       -24.4     0.     -34.8 FIXEDHF     0.700  0       0.0  0
 731    6Z 2D2415        28.2     0.      40.3 FIXEDHF     0.700  0       0.0  0  4s9p      -3d5f
 732    6Z 3E2415       -22.8     0.     -32.6 FIXEDHF     0.700  0       0.0  0
 733    6a 2D2415        24.6     0.      35.2 FIXEDHF     0.700  0       0.0  0  4s9p      -3d6f
 734    6a 3E2415       -19.7     0.     -28.2 FIXEDHF     0.700  0       0.0  0
 735    6b 2D2415        21.3     0.      30.5 FIXEDHF     0.700  0       0.0  0  4s9p      -3d7f
 736    6b 3E2415       -16.9     0.     -24.1 FIXEDHF     0.700  0       0.0  0
 737    6c 2D2415        21.5     0.      30.7 FIXEDHF     0.700  0       0.0  0  4s9p      -3d8f
 738    6c 3E2415       -14.5     0.     -20.7 FIXEDHF     0.700  0       0.0  0
 739    6d 2D2415        19.0     0.      27.2 FIXEDHF     0.700  0       0.0  0  4s9p      -3d9f
 740    6d 3E2415       -12.6     0.     -18.0 FIXEDHF     0.700  0       0.0  0
 741    6e 2D2415        16.7     0.      23.8 FIXEDHF     0.700  0       0.0  0  4s9p      -3d10f
 742    6e 3E2415       -11.1     0.     -15.8 FIXEDHF     0.700  0       0.0  0
 743    6f 2D2415        14.6     0.      20.8 FIXEDHF     0.700  0       0.0  0  4s9p      -3d11f
 744    6f 3E2415        -9.8     0.     -14.0 FIXEDHF     0.700  0       0.0  0
 745    6g 2D2415        12.8     0.      18.3 FIXEDHF     0.700  0       0.0  0  4s9p      -3d12f
 746    6g 3E2415        -8.8     0.     -12.5 FIXEDHF     0.700  0       0.0  0
 747    6h 2D2415        11.4     0.      16.3 FIXEDHF     0.700  0       0.0  0  4s9p      -3d13f
 748    6h 3E2415        -7.9     0.     -11.3 FIXEDHF     0.700  0       0.0  0
 749    6i 2D2415        10.2     0.      14.6 FIXEDHF     0.700  0       0.0  0  4s9p      -3d14f
 750    6i 3E2415        -7.1     0.     -10.2 FIXEDHF     0.700  0       0.0  0
 751    6r 1D2437      1044.4     0.    1492.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4p5s
 752    6r 0E2437       289.6     0.     413.7 FIXEDHF     0.700  0       0.0  0
 753    6s 1D2437       685.3     0.     979.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4p6s
 754    6s 0E2437       158.5     0.     226.4 FIXEDHF     0.700  0       0.0  0
 755    6t 1D2437       469.6     0.     670.9 FIXEDHF     0.700  0       0.0  0  4s9p      -4p7s
 756    6t 0E2437       103.2     0.     147.4 FIXEDHF     0.700  0       0.0  0
 757    6u 1D2437       336.8     0.     481.1 FIXEDHF     0.700  0       0.0  0  4s9p      -4p8s
 758    6u 0E2437        74.1     0.     105.9 FIXEDHF     0.700  0       0.0  0
 759    6v 1D2438      -537.0     0.    -767.2 FIXEDHF     0.700  0       0.0  0  4s9p      -4p4d
 760    6v 2E2438       -89.5     0.    -127.9 FIXEDHF     0.700  0       0.0  0
 761    6w 1D2438      -409.4     0.    -584.9 FIXEDHF     0.700  0       0.0  0  4s9p      -4p5d
 762    6w 2E2438       -27.0     0.     -38.6 FIXEDHF     0.700  0       0.0  0
 763    6x 1D2438      -321.3     0.    -459.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4p6d
 764    6x 2E2438        -7.9     0.     -11.3 FIXEDHF     0.700  0       0.0  0
 765    6y 1D2438      -268.0     0.    -382.9 FIXEDHF     0.700  0       0.0  0  4s9p      -4p7d
 766    6y 2E2438        -1.0     0.      -1.4 FIXEDHF     0.700  0       0.0  0
 767    6z 1D2438      -266.4     0.    -380.6 FIXEDHF     0.700  0       0.0  0  4s9p      -4p8d
 768    6z 2E2438         1.8     0.       2.5 FIXEDHF     0.700  0       0.0  0
 769    78 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10p     -4s11p
 770    78 1E2424        61.1     0.      87.3 FIXEDHF     0.700  0       0.0  0
 771    79 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10p     -4s12p
 772    79 1E2424        52.0     0.      74.3 FIXEDHF     0.700  0       0.0  0
 773    7A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10p     -4s13p
 774    7A 1E2424        45.0     0.      64.3 FIXEDHF     0.700  0       0.0  0
 775    7B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10p     -4s14p
 776    7B 1E2424        39.4     0.      56.3 FIXEDHF     0.700  0       0.0  0
 777    7C 2D2413      -308.5     0.    -440.7 FIXEDHF     0.700  0       0.0  0  4s10p     -3d4p
 778    7C 1E2413      -498.3     0.    -711.9 FIXEDHF     0.700  0       0.0  0
 779    7D 2D2414      -251.3     0.    -359.0 FIXEDHF     0.700  0       0.0  0  4s10p     -3d5p
 780    7D 1E2414      -236.3     0.    -337.6 FIXEDHF     0.700  0       0.0  0
 781    7E 2D2414      -188.2     0.    -268.9 FIXEDHF     0.700  0       0.0  0  4s10p     -3d6p
 782    7E 1E2414      -145.9     0.    -208.5 FIXEDHF     0.700  0       0.0  0
 783    7F 2D2414      -144.8     0.    -206.8 FIXEDHF     0.700  0       0.0  0  4s10p     -3d7p
 784    7F 1E2414      -102.0     0.    -145.7 FIXEDHF     0.700  0       0.0  0
 785    7G 2D2414      -114.9     0.    -164.2 FIXEDHF     0.700  0       0.0  0  4s10p     -3d8p
 786    7G 1E2414       -76.6     0.    -109.4 FIXEDHF     0.700  0       0.0  0
 787    7H 2D2414       -93.9     0.    -134.2 FIXEDHF     0.700  0       0.0  0  4s10p     -3d9p
 788    7H 1E2414       -60.3     0.     -86.1 FIXEDHF     0.700  0       0.0  0
 789    7I 2D2414       -79.0     0.    -112.8 FIXEDHF     0.700  0       0.0  0  4s10p     -3d10p
 790    7I 1E2414       -49.1     0.     -70.1 FIXEDHF     0.700  0       0.0  0
 791    7J 2D2414       -65.9     0.     -94.2 FIXEDHF     0.700  0       0.0  0  4s10p     -3d11p
 792    7J 1E2414       -40.9     0.     -58.5 FIXEDHF     0.700  0       0.0  0
 793    7K 2D2414       -56.2     0.     -80.3 FIXEDHF     0.700  0       0.0  0  4s10p     -3d12p
 794    7K 1E2414       -34.9     0.     -49.8 FIXEDHF     0.700  0       0.0  0
 795    7L 2D2414       -48.7     0.     -69.6 FIXEDHF     0.700  0       0.0  0  4s10p     -3d13p
 796    7L 1E2414       -30.1     0.     -43.0 FIXEDHF     0.700  0       0.0  0
 797    7M 2D2414       -42.7     0.     -61.0 FIXEDHF     0.700  0       0.0  0  4s10p     -3d14p
 798    7M 1E2414       -26.4     0.     -37.7 FIXEDHF     0.700  0       0.0  0
 799    7Y 2D2415        23.9     0.      34.2 FIXEDHF     0.700  0       0.0  0  4s10p     -3d4f
 800    7Y 3E2415       -19.6     0.     -28.0 FIXEDHF     0.700  0       0.0  0
 801    7Z 2D2415        22.5     0.      32.1 FIXEDHF     0.700  0       0.0  0  4s10p     -3d5f
 802    7Z 3E2415       -18.4     0.     -26.3 FIXEDHF     0.700  0       0.0  0
 803    7a 2D2415        19.5     0.      27.9 FIXEDHF     0.700  0       0.0  0  4s10p     -3d6f
 804    7a 3E2415       -15.9     0.     -22.7 FIXEDHF     0.700  0       0.0  0
 805    7b 2D2415        16.9     0.      24.1 FIXEDHF     0.700  0       0.0  0  4s10p     -3d7f
 806    7b 3E2415       -13.6     0.     -19.4 FIXEDHF     0.700  0       0.0  0
 807    7c 2D2415        14.6     0.      20.9 FIXEDHF     0.700  0       0.0  0  4s10p     -3d8f
 808    7c 3E2415       -11.7     0.     -16.7 FIXEDHF     0.700  0       0.0  0
 809    7d 2D2415        14.1     0.      20.2 FIXEDHF     0.700  0       0.0  0  4s10p     -3d9f
 810    7d 3E2415       -10.1     0.     -14.5 FIXEDHF     0.700  0       0.0  0
 811    7e 2D2415        12.7     0.      18.1 FIXEDHF     0.700  0       0.0  0  4s10p     -3d10f
 812    7e 3E2415        -8.9     0.     -12.7 FIXEDHF     0.700  0       0.0  0
 813    7f 2D2415        11.3     0.      16.1 FIXEDHF     0.700  0       0.0  0  4s10p     -3d11f
 814    7f 3E2415        -7.9     0.     -11.3 FIXEDHF     0.700  0       0.0  0
 815    7g 2D2415        10.0     0.      14.3 FIXEDHF     0.700  0       0.0  0  4s10p     -3d12f
 816    7g 3E2415        -7.1     0.     -10.1 FIXEDHF     0.700  0       0.0  0
 817    7h 2D2415         9.0     0.      12.8 FIXEDHF     0.700  0       0.0  0  4s10p     -3d13f
 818    7h 3E2415        -6.4     0.      -9.1 FIXEDHF     0.700  0       0.0  0
 819    7i 2D2415         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0  4s10p     -3d14f
 820    7i 3E2415        -5.7     0.      -8.2 FIXEDHF     0.700  0       0.0  0
 821    7r 1D2437       846.9     0.    1209.8 FIXEDHF     0.700  0       0.0  0  4s10p     -4p5s
 822    7r 0E2437       234.8     0.     335.4 FIXEDHF     0.700  0       0.0  0
 823    7s 1D2437       557.2     0.     796.0 FIXEDHF     0.700  0       0.0  0  4s10p     -4p6s
 824    7s 0E2437       128.7     0.     183.9 FIXEDHF     0.700  0       0.0  0
 825    7t 1D2437       383.5     0.     547.8 FIXEDHF     0.700  0       0.0  0  4s10p     -4p7s
 826    7t 0E2437        83.9     0.     119.8 FIXEDHF     0.700  0       0.0  0
 827    7u 1D2437       276.9     0.     395.6 FIXEDHF     0.700  0       0.0  0  4s10p     -4p8s
 828    7u 0E2437        60.3     0.      86.1 FIXEDHF     0.700  0       0.0  0
 829    7v 1D2438      -433.1     0.    -618.7 FIXEDHF     0.700  0       0.0  0  4s10p     -4p4d
 830    7v 2E2438       -74.8     0.    -106.9 FIXEDHF     0.700  0       0.0  0
 831    7w 1D2438      -328.2     0.    -468.9 FIXEDHF     0.700  0       0.0  0  4s10p     -4p5d
 832    7w 2E2438       -23.7     0.     -33.8 FIXEDHF     0.700  0       0.0  0
 833    7x 1D2438      -254.3     0.    -363.3 FIXEDHF     0.700  0       0.0  0  4s10p     -4p6d
 834    7x 2E2438        -7.7     0.     -11.0 FIXEDHF     0.700  0       0.0  0
 835    7y 1D2438      -206.0     0.    -294.3 FIXEDHF     0.700  0       0.0  0  4s10p     -4p7d
 836    7y 2E2438        -1.8     0.      -2.6 FIXEDHF     0.700  0       0.0  0
 837    7z 1D2438      -176.5     0.    -252.2 FIXEDHF     0.700  0       0.0  0  4s10p     -4p8d
 838    7z 2E2438         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
 839    89 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11p     -4s12p
 840    89 1E2424        43.4     0.      62.0 FIXEDHF     0.700  0       0.0  0
 841    8A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11p     -4s13p
 842    8A 1E2424        37.6     0.      53.7 FIXEDHF     0.700  0       0.0  0
 843    8B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11p     -4s14p
 844    8B 1E2424        32.9     0.      47.0 FIXEDHF     0.700  0       0.0  0
 845    8C 2D2413      -254.3     0.    -363.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d4p
 846    8C 1E2413      -414.2     0.    -591.7 FIXEDHF     0.700  0       0.0  0
 847    8D 2D2414      -207.7     0.    -296.7 FIXEDHF     0.700  0       0.0  0  4s11p     -3d5p
 848    8D 1E2414      -197.0     0.    -281.4 FIXEDHF     0.700  0       0.0  0
 849    8E 2D2414      -155.6     0.    -222.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d6p
 850    8E 1E2414      -121.7     0.    -173.8 FIXEDHF     0.700  0       0.0  0
 851    8F 2D2414      -119.6     0.    -170.8 FIXEDHF     0.700  0       0.0  0  4s11p     -3d7p
 852    8F 1E2414       -85.1     0.    -121.6 FIXEDHF     0.700  0       0.0  0
 853    8G 2D2414       -94.8     0.    -135.5 FIXEDHF     0.700  0       0.0  0  4s11p     -3d8p
 854    8G 1E2414       -63.9     0.     -91.3 FIXEDHF     0.700  0       0.0  0
 855    8H 2D2414       -77.4     0.    -110.6 FIXEDHF     0.700  0       0.0  0  4s11p     -3d9p
 856    8H 1E2414       -50.3     0.     -71.9 FIXEDHF     0.700  0       0.0  0
 857    8I 2D2414       -64.7     0.     -92.4 FIXEDHF     0.700  0       0.0  0  4s11p     -3d10p
 858    8I 1E2414       -40.9     0.     -58.5 FIXEDHF     0.700  0       0.0  0
 859    8J 2D2414       -55.2     0.     -78.9 FIXEDHF     0.700  0       0.0  0  4s11p     -3d11p
 860    8J 1E2414       -34.2     0.     -48.8 FIXEDHF     0.700  0       0.0  0
 861    8K 2D2414       -47.1     0.     -67.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d12p
 862    8K 1E2414       -29.0     0.     -41.5 FIXEDHF     0.700  0       0.0  0
 863    8L 2D2414       -40.8     0.     -58.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d13p
 864    8L 1E2414       -25.1     0.     -35.9 FIXEDHF     0.700  0       0.0  0
 865    8M 2D2414       -35.8     0.     -51.1 FIXEDHF     0.700  0       0.0  0  4s11p     -3d14p
 866    8M 1E2414       -22.0     0.     -31.4 FIXEDHF     0.700  0       0.0  0
 867    8Y 2D2415        19.8     0.      28.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d4f
 868    8Y 3E2415       -16.2     0.     -23.1 FIXEDHF     0.700  0       0.0  0
 869    8Z 2D2415        18.5     0.      26.4 FIXEDHF     0.700  0       0.0  0  4s11p     -3d5f
 870    8Z 3E2415       -15.2     0.     -21.7 FIXEDHF     0.700  0       0.0  0
 871    8a 2D2415        16.0     0.      22.9 FIXEDHF     0.700  0       0.0  0  4s11p     -3d6f
 872    8a 3E2415       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0
 873    8b 2D2415        13.7     0.      19.6 FIXEDHF     0.700  0       0.0  0  4s11p     -3d7f
 874    8b 3E2415       -11.3     0.     -16.1 FIXEDHF     0.700  0       0.0  0
 875    8c 2D2415        11.9     0.      17.0 FIXEDHF     0.700  0       0.0  0  4s11p     -3d8f
 876    8c 3E2415        -9.7     0.     -13.8 FIXEDHF     0.700  0       0.0  0
 877    8d 2D2415        10.4     0.      14.8 FIXEDHF     0.700  0       0.0  0  4s11p     -3d9f
 878    8d 3E2415        -8.4     0.     -12.0 FIXEDHF     0.700  0       0.0  0
 879    8e 2D2415         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0  4s11p     -3d10f
 880    8e 3E2415        -7.3     0.     -10.5 FIXEDHF     0.700  0       0.0  0
 881    8f 2D2415         8.9     0.      12.7 FIXEDHF     0.700  0       0.0  0  4s11p     -3d11f
 882    8f 3E2415        -6.5     0.      -9.3 FIXEDHF     0.700  0       0.0  0
 883    8g 2D2415         8.0     0.      11.4 FIXEDHF     0.700  0       0.0  0  4s11p     -3d12f
 884    8g 3E2415        -5.8     0.      -8.3 FIXEDHF     0.700  0       0.0  0
 885    8h 2D2415         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d13f
 886    8h 3E2415        -5.3     0.      -7.5 FIXEDHF     0.700  0       0.0  0
 887    8i 2D2415         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d14f
 888    8i 3E2415        -4.8     0.      -6.8 FIXEDHF     0.700  0       0.0  0
 889    8r 1D2437       705.4     0.    1007.7 FIXEDHF     0.700  0       0.0  0  4s11p     -4p5s
 890    8r 0E2437       195.5     0.     279.3 FIXEDHF     0.700  0       0.0  0
 891    8s 1D2437       465.1     0.     664.5 FIXEDHF     0.700  0       0.0  0  4s11p     -4p6s
 892    8s 0E2437       107.3     0.     153.3 FIXEDHF     0.700  0       0.0  0
 893    8t 1D2437       321.1     0.     458.7 FIXEDHF     0.700  0       0.0  0  4s11p     -4p7s
 894    8t 0E2437        69.9     0.      99.9 FIXEDHF     0.700  0       0.0  0
 895    8u 1D2437       233.0     0.     332.8 FIXEDHF     0.700  0       0.0  0  4s11p     -4p8s
 896    8u 0E2437        50.3     0.      71.8 FIXEDHF     0.700  0       0.0  0
 897    8v 1D2438      -359.4     0.    -513.5 FIXEDHF     0.700  0       0.0  0  4s11p     -4p4d
 898    8v 2E2438       -63.7     0.     -91.0 FIXEDHF     0.700  0       0.0  0
 899    8w 1D2438      -271.5     0.    -387.9 FIXEDHF     0.700  0       0.0  0  4s11p     -4p5d
 900    8w 2E2438       -20.8     0.     -29.7 FIXEDHF     0.700  0       0.0  0
 901    8x 1D2438      -209.1     0.    -298.7 FIXEDHF     0.700  0       0.0  0  4s11p     -4p6d
 902    8x 2E2438        -7.2     0.     -10.3 FIXEDHF     0.700  0       0.0  0
 903    8y 1D2438      -167.4     0.    -239.2 FIXEDHF     0.700  0       0.0  0  4s11p     -4p7d
 904    8y 2E2438        -2.1     0.      -3.0 FIXEDHF     0.700  0       0.0  0
 905    8z 1D2438      -139.6     0.    -199.5 FIXEDHF     0.700  0       0.0  0  4s11p     -4p8d
 906    8z 2E2438         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
 907    9A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12p     -4s13p
 908    9A 1E2424        32.0     0.      45.7 FIXEDHF     0.700  0       0.0  0
 909    9B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12p     -4s14p
 910    9B 1E2424        28.0     0.      40.0 FIXEDHF     0.700  0       0.0  0
 911    9C 2D2413      -214.5     0.    -306.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d4p
 912    9C 1E2413      -351.5     0.    -502.1 FIXEDHF     0.700  0       0.0  0
 913    9D 2D2414      -175.5     0.    -250.7 FIXEDHF     0.700  0       0.0  0  4s12p     -3d5p
 914    9D 1E2414      -167.5     0.    -239.3 FIXEDHF     0.700  0       0.0  0
 915    9E 2D2414      -131.5     0.    -187.9 FIXEDHF     0.700  0       0.0  0  4s12p     -3d6p
 916    9E 1E2414      -103.5     0.    -147.9 FIXEDHF     0.700  0       0.0  0
 917    9F 2D2414      -101.1     0.    -144.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d7p
 918    9F 1E2414       -72.4     0.    -103.4 FIXEDHF     0.700  0       0.0  0
 919    9G 2D2414       -80.1     0.    -114.5 FIXEDHF     0.700  0       0.0  0  4s12p     -3d8p
 920    9G 1E2414       -54.4     0.     -77.7 FIXEDHF     0.700  0       0.0  0
 921    9H 2D2414       -65.4     0.     -93.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d9p
 922    9H 1E2414       -42.8     0.     -61.2 FIXEDHF     0.700  0       0.0  0
 923    9I 2D2414       -54.5     0.     -77.9 FIXEDHF     0.700  0       0.0  0  4s12p     -3d10p
 924    9I 1E2414       -34.9     0.     -49.8 FIXEDHF     0.700  0       0.0  0
 925    9J 2D2414       -46.4     0.     -66.3 FIXEDHF     0.700  0       0.0  0  4s12p     -3d11p
 926    9J 1E2414       -29.0     0.     -41.5 FIXEDHF     0.700  0       0.0  0
 927    9K 2D2414       -40.2     0.     -57.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d12p
 928    9K 1E2414       -24.7     0.     -35.3 FIXEDHF     0.700  0       0.0  0
 929    9L 2D2414       -34.8     0.     -49.7 FIXEDHF     0.700  0       0.0  0  4s12p     -3d13p
 930    9L 1E2414       -21.4     0.     -30.6 FIXEDHF     0.700  0       0.0  0
 931    9M 2D2414       -30.5     0.     -43.6 FIXEDHF     0.700  0       0.0  0  4s12p     -3d14p
 932    9M 1E2414       -18.8     0.     -26.8 FIXEDHF     0.700  0       0.0  0
 933    9Y 2D2415        16.7     0.      23.9 FIXEDHF     0.700  0       0.0  0  4s12p     -3d4f
 934    9Y 3E2415       -13.7     0.     -19.6 FIXEDHF     0.700  0       0.0  0
 935    9Z 2D2415        15.6     0.      22.3 FIXEDHF     0.700  0       0.0  0  4s12p     -3d5f
 936    9Z 3E2415       -12.9     0.     -18.4 FIXEDHF     0.700  0       0.0  0
 937    9a 2D2415        13.4     0.      19.2 FIXEDHF     0.700  0       0.0  0  4s12p     -3d6f
 938    9a 3E2415       -11.1     0.     -15.9 FIXEDHF     0.700  0       0.0  0
 939    9b 2D2415        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0  4s12p     -3d7f
 940    9b 3E2415        -9.5     0.     -13.6 FIXEDHF     0.700  0       0.0  0
 941    9c 2D2415         9.9     0.      14.2 FIXEDHF     0.700  0       0.0  0  4s12p     -3d8f
 942    9c 3E2415        -8.2     0.     -11.7 FIXEDHF     0.700  0       0.0  0
 943    9d 2D2415         8.7     0.      12.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d9f
 944    9d 3E2415        -7.1     0.     -10.2 FIXEDHF     0.700  0       0.0  0
 945    9e 2D2415         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0  4s12p     -3d10f
 946    9e 3E2415        -6.2     0.      -8.9 FIXEDHF     0.700  0       0.0  0
 947    9f 2D2415         7.1     0.      10.2 FIXEDHF     0.700  0       0.0  0  4s12p     -3d11f
 948    9f 3E2415        -5.5     0.      -7.9 FIXEDHF     0.700  0       0.0  0
 949    9g 2D2415         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0  4s12p     -3d12f
 950    9g 3E2415        -5.0     0.      -7.1 FIXEDHF     0.700  0       0.0  0
 951    9h 2D2415         5.9     0.       8.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d13f
 952    9h 3E2415        -4.5     0.      -6.4 FIXEDHF     0.700  0       0.0  0
 953    9i 2D2415         5.3     0.       7.6 FIXEDHF     0.700  0       0.0  0  4s12p     -3d14f
 954    9i 3E2415        -4.1     0.      -5.8 FIXEDHF     0.700  0       0.0  0
 955    9r 1D2437       599.8     0.     856.8 FIXEDHF     0.700  0       0.0  0  4s12p     -4p5s
 956    9r 0E2437       166.1     0.     237.3 FIXEDHF     0.700  0       0.0  0
 957    9s 1D2437       396.2     0.     566.0 FIXEDHF     0.700  0       0.0  0  4s12p     -4p6s
 958    9s 0E2437        91.3     0.     130.4 FIXEDHF     0.700  0       0.0  0
 959    9t 1D2437       274.0     0.     391.5 FIXEDHF     0.700  0       0.0  0  4s12p     -4p7s
 960    9t 0E2437        59.5     0.      85.0 FIXEDHF     0.700  0       0.0  0
 961    9u 1D2437       199.4     0.     284.9 FIXEDHF     0.700  0       0.0  0  4s12p     -4p8s
 962    9u 0E2437        42.8     0.      61.1 FIXEDHF     0.700  0       0.0  0
 963    9v 1D2438      -304.8     0.    -435.5 FIXEDHF     0.700  0       0.0  0  4s12p     -4p4d
 964    9v 2E2438       -55.0     0.     -78.6 FIXEDHF     0.700  0       0.0  0
 965    9w 1D2438      -229.9     0.    -328.4 FIXEDHF     0.700  0       0.0  0  4s12p     -4p5d
 966    9w 2E2438       -18.3     0.     -26.2 FIXEDHF     0.700  0       0.0  0
 967    9x 1D2438      -176.4     0.    -252.0 FIXEDHF     0.700  0       0.0  0  4s12p     -4p6d
 968    9x 2E2438        -6.6     0.      -9.5 FIXEDHF     0.700  0       0.0  0
 969    9y 1D2438      -140.4     0.    -200.6 FIXEDHF     0.700  0       0.0  0  4s12p     -4p7d
 970    9y 2E2438        -2.2     0.      -3.2 FIXEDHF     0.700  0       0.0  0
 971    9z 1D2438      -115.8     0.    -165.5 FIXEDHF     0.700  0       0.0  0  4s12p     -4p8d
 972    9z 2E2438        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
 973    AB 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s13p     -4s14p
 974    AB 1E2424        24.2     0.      34.6 FIXEDHF     0.700  0       0.0  0
 975    AC 2D2413      -184.2     0.    -263.1 FIXEDHF     0.700  0       0.0  0  4s13p     -3d4p
 976    AC 1E2413      -303.3     0.    -433.3 FIXEDHF     0.700  0       0.0  0
 977    AD 2D2414      -150.9     0.    -215.6 FIXEDHF     0.700  0       0.0  0  4s13p     -3d5p
 978    AD 1E2414      -144.8     0.    -206.8 FIXEDHF     0.700  0       0.0  0
 979    AE 2D2414      -113.1     0.    -161.6 FIXEDHF     0.700  0       0.0  0  4s13p     -3d6p
 980    AE 1E2414       -89.5     0.    -127.8 FIXEDHF     0.700  0       0.0  0
 981    AF 2D2414       -86.9     0.    -124.2 FIXEDHF     0.700  0       0.0  0  4s13p     -3d7p
 982    AF 1E2414       -62.6     0.     -89.4 FIXEDHF     0.700  0       0.0  0
 983    AG 2D2414       -68.9     0.     -98.5 FIXEDHF     0.700  0       0.0  0  4s13p     -3d8p
 984    AG 1E2414       -47.0     0.     -67.2 FIXEDHF     0.700  0       0.0  0
 985    AH 2D2414       -56.2     0.     -80.3 FIXEDHF     0.700  0       0.0  0  4s13p     -3d9p
 986    AH 1E2414       -37.0     0.     -52.9 FIXEDHF     0.700  0       0.0  0
 987    AI 2D2414       -46.9     0.     -67.0 FIXEDHF     0.700  0       0.0  0  4s13p     -3d10p
 988    AI 1E2414       -30.1     0.     -43.0 FIXEDHF     0.700  0       0.0  0
 989    AJ 2D2414       -39.8     0.     -56.9 FIXEDHF     0.700  0       0.0  0  4s13p     -3d11p
 990    AJ 1E2414       -25.1     0.     -35.9 FIXEDHF     0.700  0       0.0  0
 991    AK 2D2414       -34.4     0.     -49.2 FIXEDHF     0.700  0       0.0  0  4s13p     -3d12p
 992    AK 1E2414       -21.4     0.     -30.6 FIXEDHF     0.700  0       0.0  0
 993    AL 2D2414       -30.2     0.     -43.1 FIXEDHF     0.700  0       0.0  0  4s13p     -3d13p
 994    AL 1E2414       -18.5     0.     -26.4 FIXEDHF     0.700  0       0.0  0
 995    AM 2D2414       -26.5     0.     -37.8 FIXEDHF     0.700  0       0.0  0  4s13p     -3d14p
 996    AM 1E2414       -16.2     0.     -23.1 FIXEDHF     0.700  0       0.0  0
 997    AY 2D2415        14.4     0.      20.6 FIXEDHF     0.700  0       0.0  0  4s13p     -3d4f
 998    AY 3E2415       -11.8     0.     -16.8 FIXEDHF     0.700  0       0.0  0
 999    AZ 2D2415        13.4     0.      19.1 FIXEDHF     0.700  0       0.0  0  4s13p     -3d5f
1000    AZ 3E2415       -11.1     0.     -15.8 FIXEDHF     0.700  0       0.0  0
1001    Aa 2D2415        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0  4s13p     -3d6f
1002    Aa 3E2415        -9.6     0.     -13.7 FIXEDHF     0.700  0       0.0  0
1003    Ab 2D2415         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0  4s13p     -3d7f
1004    Ab 3E2415        -8.2     0.     -11.7 FIXEDHF     0.700  0       0.0  0
1005    Ac 2D2415         8.5     0.      12.1 FIXEDHF     0.700  0       0.0  0  4s13p     -3d8f
1006    Ac 3E2415        -7.1     0.     -10.1 FIXEDHF     0.700  0       0.0  0
1007    Ad 2D2415         7.4     0.      10.6 FIXEDHF     0.700  0       0.0  0  4s13p     -3d9f
1008    Ad 3E2415        -6.2     0.      -8.8 FIXEDHF     0.700  0       0.0  0
1009    Ae 2D2415         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0  4s13p     -3d10f
1010    Ae 3E2415        -5.4     0.      -7.7 FIXEDHF     0.700  0       0.0  0
1011    Af 2D2415         5.7     0.       8.2 FIXEDHF     0.700  0       0.0  0  4s13p     -3d11f
1012    Af 3E2415        -4.8     0.      -6.8 FIXEDHF     0.700  0       0.0  0
1013    Ag 2D2415         5.4     0.       7.7 FIXEDHF     0.700  0       0.0  0  4s13p     -3d12f
1014    Ag 3E2415        -4.3     0.      -6.1 FIXEDHF     0.700  0       0.0  0
1015    Ah 2D2415         4.9     0.       7.0 FIXEDHF     0.700  0       0.0  0  4s13p     -3d13f
1016    Ah 3E2415        -3.8     0.      -5.5 FIXEDHF     0.700  0       0.0  0
1017    Ai 2D2415         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0  4s13p     -3d14f
1018    Ai 3E2415        -3.5     0.      -5.0 FIXEDHF     0.700  0       0.0  0
1019    Ar 1D2437       518.3     0.     740.4 FIXEDHF     0.700  0       0.0  0  4s13p     -4p5s
1020    Ar 0E2437       143.5     0.     205.0 FIXEDHF     0.700  0       0.0  0
1021    As 1D2437       342.9     0.     489.8 FIXEDHF     0.700  0       0.0  0  4s13p     -4p6s
1022    As 0E2437        78.9     0.     112.7 FIXEDHF     0.700  0       0.0  0
1023    At 1D2437       237.6     0.     339.4 FIXEDHF     0.700  0       0.0  0  4s13p     -4p7s
1024    At 0E2437        51.4     0.      73.5 FIXEDHF     0.700  0       0.0  0
1025    Au 1D2437       173.3     0.     247.6 FIXEDHF     0.700  0       0.0  0  4s13p     -4p8s
1026    Au 0E2437        37.0     0.      52.8 FIXEDHF     0.700  0       0.0  0
1027    Av 1D2438      -262.9     0.    -375.6 FIXEDHF     0.700  0       0.0  0  4s13p     -4p4d
1028    Av 2E2438       -48.2     0.     -68.8 FIXEDHF     0.700  0       0.0  0
1029    Aw 1D2438      -198.1     0.    -283.0 FIXEDHF     0.700  0       0.0  0  4s13p     -4p5d
1030    Aw 2E2438       -16.3     0.     -23.3 FIXEDHF     0.700  0       0.0  0
1031    Ax 1D2438      -151.7     0.    -216.7 FIXEDHF     0.700  0       0.0  0  4s13p     -4p6d
1032    Ax 2E2438        -6.1     0.      -8.7 FIXEDHF     0.700  0       0.0  0
1033    Ay 1D2438      -120.3     0.    -171.9 FIXEDHF     0.700  0       0.0  0  4s13p     -4p7d
1034    Ay 2E2438        -2.2     0.      -3.1 FIXEDHF     0.700  0       0.0  0
1035    Az 1D2438       -98.7     0.    -141.0 FIXEDHF     0.700  0       0.0  0  4s13p     -4p8d
1036    Az 2E2438        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
1037    BC 2D2413      -160.4     0.    -229.2 FIXEDHF     0.700  0       0.0  0  4s14p     -3d4p
1038    BC 1E2413      -265.3     0.    -379.0 FIXEDHF     0.700  0       0.0  0
1039    BD 2D2414      -131.7     0.    -188.1 FIXEDHF     0.700  0       0.0  0  4s14p     -3d5p
1040    BD 1E2414      -126.8     0.    -181.1 FIXEDHF     0.700  0       0.0  0
1041    BE 2D2414       -98.7     0.    -141.0 FIXEDHF     0.700  0       0.0  0  4s14p     -3d6p
1042    BE 1E2414       -78.4     0.    -112.0 FIXEDHF     0.700  0       0.0  0
1043    BF 2D2414       -75.9     0.    -108.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d7p
1044    BF 1E2414       -54.8     0.     -78.3 FIXEDHF     0.700  0       0.0  0
1045    BG 2D2414       -60.1     0.     -85.9 FIXEDHF     0.700  0       0.0  0  4s14p     -3d8p
1046    BG 1E2414       -41.2     0.     -58.9 FIXEDHF     0.700  0       0.0  0
1047    BH 2D2414       -49.1     0.     -70.1 FIXEDHF     0.700  0       0.0  0  4s14p     -3d9p
1048    BH 1E2414       -32.4     0.     -46.3 FIXEDHF     0.700  0       0.0  0
1049    BI 2D2414       -40.9     0.     -58.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d10p
1050    BI 1E2414       -26.4     0.     -37.7 FIXEDHF     0.700  0       0.0  0
1051    BJ 2D2414       -34.7     0.     -49.6 FIXEDHF     0.700  0       0.0  0  4s14p     -3d11p
1052    BJ 1E2414       -22.0     0.     -31.5 FIXEDHF     0.700  0       0.0  0
1053    BK 2D2414       -30.0     0.     -42.8 FIXEDHF     0.700  0       0.0  0  4s14p     -3d12p
1054    BK 1E2414       -18.8     0.     -26.8 FIXEDHF     0.700  0       0.0  0
1055    BL 2D2414       -26.2     0.     -37.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d13p
1056    BL 1E2414       -16.2     0.     -23.2 FIXEDHF     0.700  0       0.0  0
1057    BM 2D2414       -23.2     0.     -33.2 FIXEDHF     0.700  0       0.0  0  4s14p     -3d14p
1058    BM 1E2414       -14.2     0.     -20.3 FIXEDHF     0.700  0       0.0  0
1059    BY 2D2415        12.6     0.      18.0 FIXEDHF     0.700  0       0.0  0  4s14p     -3d4f
1060    BY 3E2415       -10.3     0.     -14.7 FIXEDHF     0.700  0       0.0  0
1061    BZ 2D2415        11.7     0.      16.7 FIXEDHF     0.700  0       0.0  0  4s14p     -3d5f
1062    BZ 3E2415        -9.7     0.     -13.8 FIXEDHF     0.700  0       0.0  0
1063    Ba 2D2415        10.1     0.      14.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d6f
1064    Ba 3E2415        -8.3     0.     -11.9 FIXEDHF     0.700  0       0.0  0
1065    Bb 2D2415         8.6     0.      12.3 FIXEDHF     0.700  0       0.0  0  4s14p     -3d7f
1066    Bb 3E2415        -7.1     0.     -10.2 FIXEDHF     0.700  0       0.0  0
1067    Bc 2D2415         7.4     0.      10.6 FIXEDHF     0.700  0       0.0  0  4s14p     -3d8f
1068    Bc 3E2415        -6.2     0.      -8.8 FIXEDHF     0.700  0       0.0  0
1069    Bd 2D2415         6.4     0.       9.2 FIXEDHF     0.700  0       0.0  0  4s14p     -3d9f
1070    Bd 3E2415        -5.4     0.      -7.7 FIXEDHF     0.700  0       0.0  0
1071    Be 2D2415         5.6     0.       8.0 FIXEDHF     0.700  0       0.0  0  4s14p     -3d10f
1072    Be 3E2415        -4.7     0.      -6.7 FIXEDHF     0.700  0       0.0  0
1073    Bf 2D2415         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0  4s14p     -3d11f
1074    Bf 3E2415        -4.1     0.      -5.9 FIXEDHF     0.700  0       0.0  0
1075    Bg 2D2415         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d12f
1076    Bg 3E2415        -3.7     0.      -5.3 FIXEDHF     0.700  0       0.0  0
1077    Bh 2D2415         4.1     0.       5.9 FIXEDHF     0.700  0       0.0  0  4s14p     -3d13f
1078    Bh 3E2415        -3.4     0.      -4.8 FIXEDHF     0.700  0       0.0  0
1079    Bi 2D2415         3.8     0.       5.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d14f
1080    Bi 3E2415        -3.0     0.      -4.3 FIXEDHF     0.700  0       0.0  0
1081    Br 1D2437       453.9     0.     648.4 FIXEDHF     0.700  0       0.0  0  4s14p     -4p5s
1082    Br 0E2437       125.6     0.     179.4 FIXEDHF     0.700  0       0.0  0
1083    Bs 1D2437       300.6     0.     429.5 FIXEDHF     0.700  0       0.0  0  4s14p     -4p6s
1084    Bs 0E2437        69.1     0.      98.7 FIXEDHF     0.700  0       0.0  0
1085    Bt 1D2437       208.6     0.     298.0 FIXEDHF     0.700  0       0.0  0  4s14p     -4p7s
1086    Bt 0E2437        45.1     0.      64.4 FIXEDHF     0.700  0       0.0  0
1087    Bu 1D2437       152.4     0.     217.7 FIXEDHF     0.700  0       0.0  0  4s14p     -4p8s
1088    Bu 0E2437        32.4     0.      46.3 FIXEDHF     0.700  0       0.0  0
1089    Bv 1D2438      -229.9     0.    -328.4 FIXEDHF     0.700  0       0.0  0  4s14p     -4p4d
1090    Bv 2E2438       -42.6     0.     -60.8 FIXEDHF     0.700  0       0.0  0
1091    Bw 1D2438      -173.1     0.    -247.3 FIXEDHF     0.700  0       0.0  0  4s14p     -4p5d
1092    Bw 2E2438       -14.6     0.     -20.9 FIXEDHF     0.700  0       0.0  0
1093    Bx 1D2438      -132.4     0.    -189.2 FIXEDHF     0.700  0       0.0  0  4s14p     -4p6d
1094    Bx 2E2438        -5.6     0.      -8.0 FIXEDHF     0.700  0       0.0  0
1095    By 1D2438      -104.7     0.    -149.6 FIXEDHF     0.700  0       0.0  0  4s14p     -4p7d
1096    By 2E2438        -2.1     0.      -3.0 FIXEDHF     0.700  0       0.0  0
1097    Bz 1D2438       -85.6     0.    -122.3 FIXEDHF     0.700  0       0.0  0  4s14p     -4p8d
1098    Bz 2E2438        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
1099    CD 0D1314       217.1     0.     310.2 FIXEDHF     0.700  0       0.0  0  3d4p      -3d5p
1100    CD 2D1314      2815.7     0.    4022.4 FIXEDHF     0.700  0       0.0  0
1101    CD 1E1314      2169.2     0.    3098.8 FIXEDHF     0.700  0       0.0  0
1102    CD 3E1314      1599.2     0.    2284.6 FIXEDHF     0.700  0       0.0  0
1103    CE 0D1314       130.8     0.     186.9 FIXEDHF     0.700  0       0.0  0  3d4p      -3d6p
1104    CE 2D1314      1646.2     0.    2351.7 FIXEDHF     0.700  0       0.0  0
1105    CE 1E1314      1291.2     0.    1844.6 FIXEDHF     0.700  0       0.0  0
1106    CE 3E1314       971.1     0.    1387.3 FIXEDHF     0.700  0       0.0  0
1107    CF 0D1314        90.6     0.     129.4 FIXEDHF     0.700  0       0.0  0  3d4p      -3d7p
1108    CF 2D1314      1123.3     0.    1604.7 FIXEDHF     0.700  0       0.0  0
1109    CF 1E1314       889.6     0.    1270.9 FIXEDHF     0.700  0       0.0  0
1110    CF 3E1314       674.9     0.     964.2 FIXEDHF     0.700  0       0.0  0
1111    CG 0D1314        67.7     0.      96.7 FIXEDHF     0.700  0       0.0  0  3d4p      -3d8p
1112    CG 2D1314       832.0     0.    1188.6 FIXEDHF     0.700  0       0.0  0
1113    CG 1E1314       663.0     0.     947.1 FIXEDHF     0.700  0       0.0  0
1114    CG 3E1314       505.4     0.     722.0 FIXEDHF     0.700  0       0.0  0
1115    CH 0D1314        53.1     0.      75.9 FIXEDHF     0.700  0       0.0  0  3d4p      -3d9p
1116    CH 2D1314       649.0     0.     927.2 FIXEDHF     0.700  0       0.0  0
1117    CH 1E1314       519.3     0.     741.9 FIXEDHF     0.700  0       0.0  0
1118    CH 3E1314       397.1     0.     567.3 FIXEDHF     0.700  0       0.0  0
1119    CI 0D1314        43.2     0.      61.7 FIXEDHF     0.700  0       0.0  0  3d4p      -3d10p
1120    CI 2D1314       524.9     0.     749.8 FIXEDHF     0.700  0       0.0  0
1121    CI 1E1314       421.3     0.     601.8 FIXEDHF     0.700  0       0.0  0
1122    CI 3E1314       322.8     0.     461.2 FIXEDHF     0.700  0       0.0  0
1123    CJ 0D1314        36.0     0.      51.4 FIXEDHF     0.700  0       0.0  0  3d4p      -3d11p
1124    CJ 2D1314       436.0     0.     622.8 FIXEDHF     0.700  0       0.0  0
1125    CJ 1E1314       350.7     0.     501.0 FIXEDHF     0.700  0       0.0  0
1126    CJ 3E1314       269.2     0.     384.6 FIXEDHF     0.700  0       0.0  0
1127    CK 0D1314        30.6     0.      43.7 FIXEDHF     0.700  0       0.0  0  3d4p      -3d12p
1128    CK 2D1314       369.6     0.     528.0 FIXEDHF     0.700  0       0.0  0
1129    CK 1E1314       297.8     0.     425.5 FIXEDHF     0.700  0       0.0  0
1130    CK 3E1314       228.9     0.     327.0 FIXEDHF     0.700  0       0.0  0
1131    CL 0D1314        26.4     0.      37.7 FIXEDHF     0.700  0       0.0  0  3d4p      -3d13p
1132    CL 2D1314       318.5     0.     455.0 FIXEDHF     0.700  0       0.0  0
1133    CL 1E1314       257.1     0.     367.3 FIXEDHF     0.700  0       0.0  0
1134    CL 3E1314       197.8     0.     282.6 FIXEDHF     0.700  0       0.0  0
1135    CM 0D1314        23.1     0.      33.0 FIXEDHF     0.700  0       0.0  0  3d4p      -3d14p
1136    CM 2D1314       278.3     0.     397.5 FIXEDHF     0.700  0       0.0  0
1137    CM 1E1314       224.8     0.     321.2 FIXEDHF     0.700  0       0.0  0
1138    CM 3E1314       173.1     0.     247.3 FIXEDHF     0.700  0       0.0  0
1139    CN 2D1325     -1172.7     0.   -1675.3 FIXEDHF     0.700  0       0.0  0  3d4p      -4s4f
1140    CN 1E1325      -918.4     0.   -1312.0 FIXEDHF     0.700  0       0.0  0
1141    CO 2D1325     -1029.3     0.   -1470.5 FIXEDHF     0.700  0       0.0  0  3d4p      -4s5f
1142    CO 1E1325      -841.5     0.   -1202.2 FIXEDHF     0.700  0       0.0  0
1143    CP 2D1325      -861.5     0.   -1230.7 FIXEDHF     0.700  0       0.0  0  3d4p      -4s6f
1144    CP 1E1325      -721.1     0.   -1030.1 FIXEDHF     0.700  0       0.0  0
1145    CQ 2D1325      -723.9     0.   -1034.1 FIXEDHF     0.700  0       0.0  0  3d4p      -4s7f
1146    CQ 1E1325      -614.9     0.    -878.4 FIXEDHF     0.700  0       0.0  0
1147    CR 2D1325      -615.9     0.    -879.8 FIXEDHF     0.700  0       0.0  0  3d4p      -4s8f
1148    CR 1E1325      -528.4     0.    -754.9 FIXEDHF     0.700  0       0.0  0
1149    CS 2D1325      -530.8     0.    -758.3 FIXEDHF     0.700  0       0.0  0  3d4p      -4s9f
1150    CS 1E1325      -458.8     0.    -655.5 FIXEDHF     0.700  0       0.0  0
1151    CT 2D1325      -463.1     0.    -661.6 FIXEDHF     0.700  0       0.0  0  3d4p      -4s10f
1152    CT 1E1325      -402.5     0.    -575.0 FIXEDHF     0.700  0       0.0  0
1153    CU 2D1325      -408.3     0.    -583.3 FIXEDHF     0.700  0       0.0  0  3d4p      -4s11f
1154    CU 1E1325      -356.4     0.    -509.2 FIXEDHF     0.700  0       0.0  0
1155    CV 2D1325      -363.4     0.    -519.1 FIXEDHF     0.700  0       0.0  0  3d4p      -4s12f
1156    CV 1E1325      -318.3     0.    -454.7 FIXEDHF     0.700  0       0.0  0
1157    CW 2D1325      -326.1     0.    -465.8 FIXEDHF     0.700  0       0.0  0  3d4p      -4s13f
1158    CW 1E1325      -286.4     0.    -409.2 FIXEDHF     0.700  0       0.0  0
1159    CX 2D1325      -294.6     0.    -420.9 FIXEDHF     0.700  0       0.0  0  3d4p      -4s14f
1160    CX 1E1325      -259.4     0.    -370.6 FIXEDHF     0.700  0       0.0  0
1161    CY 2D1315       839.4     0.    1199.2 FIXEDHF     0.700  0       0.0  0  3d4p      -3d4f
1162    CY 4D1315       324.2     0.     463.1 FIXEDHF     0.700  0       0.0  0
1163    CY 1E1315       481.4     0.     687.7 FIXEDHF     0.700  0       0.0  0
1164    CY 3E1315       270.8     0.     386.8 FIXEDHF     0.700  0       0.0  0
1165    CZ 2D1315       717.8     0.    1025.5 FIXEDHF     0.700  0       0.0  0  3d4p      -3d5f
1166    CZ 4D1315       287.5     0.     410.7 FIXEDHF     0.700  0       0.0  0
1167    CZ 1E1315       424.4     0.     606.3 FIXEDHF     0.700  0       0.0  0
1168    CZ 3E1315       243.1     0.     347.3 FIXEDHF     0.700  0       0.0  0
1169    Ca 2D1315       589.7     0.     842.4 FIXEDHF     0.700  0       0.0  0  3d4p      -3d6f
1170    Ca 4D1315       240.7     0.     343.9 FIXEDHF     0.700  0       0.0  0
1171    Ca 1E1315       354.3     0.     506.1 FIXEDHF     0.700  0       0.0  0
1172    Ca 3E1315       205.0     0.     292.8 FIXEDHF     0.700  0       0.0  0
1173    Cb 2D1315       488.8     0.     698.3 FIXEDHF     0.700  0       0.0  0  3d4p      -3d7f
1174    Cb 4D1315       201.9     0.     288.4 FIXEDHF     0.700  0       0.0  0
1175    Cb 1E1315       296.7     0.     423.8 FIXEDHF     0.700  0       0.0  0
1176    Cb 3E1315       172.6     0.     246.6 FIXEDHF     0.700  0       0.0  0
1177    Cc 2D1315       411.7     0.     588.2 FIXEDHF     0.700  0       0.0  0  3d4p      -3d8f
1178    Cc 4D1315       171.4     0.     244.8 FIXEDHF     0.700  0       0.0  0
1179    Cc 1E1315       251.5     0.     359.3 FIXEDHF     0.700  0       0.0  0
1180    Cc 3E1315       146.9     0.     209.9 FIXEDHF     0.700  0       0.0  0
1181    Cd 2D1315       352.2     0.     503.1 FIXEDHF     0.700  0       0.0  0  3d4p      -3d9f
1182    Cd 4D1315       147.3     0.     210.5 FIXEDHF     0.700  0       0.0  0
1183    Cd 1E1315       216.2     0.     308.8 FIXEDHF     0.700  0       0.0  0
1184    Cd 3E1315       126.6     0.     180.9 FIXEDHF     0.700  0       0.0  0
1185    Ce 2D1315       305.4     0.     436.3 FIXEDHF     0.700  0       0.0  0  3d4p      -3d10f
1186    Ce 4D1315       128.3     0.     183.3 FIXEDHF     0.700  0       0.0  0
1187    Ce 1E1315       188.2     0.     268.8 FIXEDHF     0.700  0       0.0  0
1188    Ce 3E1315       110.5     0.     157.8 FIXEDHF     0.700  0       0.0  0
1189    Cf 2D1315       268.0     0.     382.9 FIXEDHF     0.700  0       0.0  0  3d4p      -3d11f
1190    Cf 4D1315       113.0     0.     161.4 FIXEDHF     0.700  0       0.0  0
1191    Cf 1E1315       165.5     0.     236.5 FIXEDHF     0.700  0       0.0  0
1192    Cf 3E1315        97.4     0.     139.1 FIXEDHF     0.700  0       0.0  0
1193    Cg 2D1315       237.6     0.     339.5 FIXEDHF     0.700  0       0.0  0  3d4p      -3d12f
1194    Cg 4D1315       100.4     0.     143.5 FIXEDHF     0.700  0       0.0  0
1195    Cg 1E1315       147.1     0.     210.2 FIXEDHF     0.700  0       0.0  0
1196    Cg 3E1315        86.7     0.     123.8 FIXEDHF     0.700  0       0.0  0
1197    Ch 2D1315       212.5     0.     303.6 FIXEDHF     0.700  0       0.0  0  3d4p      -3d13f
1198    Ch 4D1315        90.0     0.     128.6 FIXEDHF     0.700  0       0.0  0
1199    Ch 1E1315       131.8     0.     188.3 FIXEDHF     0.700  0       0.0  0
1200    Ch 3E1315        77.7     0.     111.0 FIXEDHF     0.700  0       0.0  0
1201    Ci 2D1315       191.6     0.     273.7 FIXEDHF     0.700  0       0.0  0  3d4p      -3d14f
1202    Ci 4D1315        81.3     0.     116.1 FIXEDHF     0.700  0       0.0  0
1203    Ci 1E1315       119.0     0.     170.0 FIXEDHF     0.700  0       0.0  0
1204    Ci 3E1315        70.2     0.     100.3 FIXEDHF     0.700  0       0.0  0
1205    Cn 4D1316         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0  3d4p      -3d6h
1206    Cn 3E1316         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0
1207    Co 4D1316         4.4     0.       6.3 FIXEDHF     0.700  0       0.0  0  3d4p      -3d7h
1208    Co 3E1316         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
1209    Cp 4D1316         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0  3d4p      -3d8h
1210    Cp 3E1316         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
1211    Cq 4D1316         4.1     0.       5.8 FIXEDHF     0.700  0       0.0  0  3d4p      -3d9h
1212    Cq 3E1316         2.8     0.       4.0 FIXEDHF     0.700  0       0.0  0
1213    Cr 1D1337      2171.0     0.    3101.4 FIXEDHF     0.700  0       0.0  0  3d4p      -4p5s
1214    Cr 2E1337      -820.0     0.   -1171.4 FIXEDHF     0.700  0       0.0  0
1215    Cs 1D1337       980.7     0.    1401.0 FIXEDHF     0.700  0       0.0  0  3d4p      -4p6s
1216    Cs 2E1337      -385.2     0.    -550.3 FIXEDHF     0.700  0       0.0  0
1217    Ct 1D1337       617.1     0.     881.6 FIXEDHF     0.700  0       0.0  0  3d4p      -4p7s
1218    Ct 2E1337      -232.8     0.    -332.6 FIXEDHF     0.700  0       0.0  0
1219    Cu 1D1337       438.5     0.     626.5 FIXEDHF     0.700  0       0.0  0  3d4p      -4p8s
1220    Cu 2E1337      -160.2     0.    -228.8 FIXEDHF     0.700  0       0.0  0
1221    Cv 1D1338     -2946.7     0.   -4209.6 FIXEDHF     0.700  0       0.0  0  3d4p      -4p4d
1222    Cv 3D1338     -1015.6     0.   -1450.9 FIXEDHF     0.700  0       0.0  0
1223    Cv 0E1338      -171.4     0.    -244.9 FIXEDHF     0.700  0       0.0  0
1224    Cv 2E1338       258.4     0.     369.2 FIXEDHF     0.700  0       0.0  0
1225    Cw 1D1338     -2018.7     0.   -2883.8 FIXEDHF     0.700  0       0.0  0  3d4p      -4p5d
1226    Cw 3D1338      -859.3     0.   -1227.5 FIXEDHF     0.700  0       0.0  0
1227    Cw 0E1338      -133.4     0.    -190.6 FIXEDHF     0.700  0       0.0  0
1228    Cw 2E1338       -93.2     0.    -133.1 FIXEDHF     0.700  0       0.0  0
1229    Cx 1D1338     -1451.8     0.   -2074.0 FIXEDHF     0.700  0       0.0  0  3d4p      -4p6d
1230    Cx 3D1338      -668.1     0.    -954.4 FIXEDHF     0.700  0       0.0  0
1231    Cx 0E1338      -101.3     0.    -144.7 FIXEDHF     0.700  0       0.0  0
1232    Cx 2E1338      -147.6     0.    -210.9 FIXEDHF     0.700  0       0.0  0
1233    Cy 1D1338     -1097.7     0.   -1568.2 FIXEDHF     0.700  0       0.0  0  3d4p      -4p7d
1234    Cy 3D1338      -526.1     0.    -751.6 FIXEDHF     0.700  0       0.0  0
1235    Cy 0E1338       -78.9     0.    -112.7 FIXEDHF     0.700  0       0.0  0
1236    Cy 2E1338      -144.5     0.    -206.4 FIXEDHF     0.700  0       0.0  0
1237    Cz 1D1338      -863.9     0.   -1234.2 FIXEDHF     0.700  0       0.0  0  3d4p      -4p8d
1238    Cz 3D1338      -424.4     0.    -606.3 FIXEDHF     0.700  0       0.0  0
1239    Cz 0E1338       -63.3     0.     -90.4 FIXEDHF     0.700  0       0.0  0
1240    Cz 2E1338      -129.6     0.    -185.2 FIXEDHF     0.700  0       0.0  0
1241    DE 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d6p
1242    DE 2D1414      1032.8     0.    1475.4 FIXEDHF     0.700  0       0.0  0
1243    DE 1E1414       587.6     0.     839.5 FIXEDHF     0.700  0       0.0  0
1244    DE 3E1414       463.4     0.     662.0 FIXEDHF     0.700  0       0.0  0
1245    DF 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d7p
1246    DF 2D1414       705.7     0.    1008.1 FIXEDHF     0.700  0       0.0  0
1247    DF 1E1414       410.6     0.     586.6 FIXEDHF     0.700  0       0.0  0
1248    DF 3E1414       326.3     0.     466.1 FIXEDHF     0.700  0       0.0  0
1249    DG 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d8p
1250    DG 2D1414       524.1     0.     748.7 FIXEDHF     0.700  0       0.0  0
1251    DG 1E1414       308.4     0.     440.6 FIXEDHF     0.700  0       0.0  0
1252    DG 3E1414       246.2     0.     351.7 FIXEDHF     0.700  0       0.0  0
1253    DH 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d9p
1254    DH 2D1414       409.8     0.     585.5 FIXEDHF     0.700  0       0.0  0
1255    DH 1E1414       242.8     0.     346.9 FIXEDHF     0.700  0       0.0  0
1256    DH 3E1414       194.4     0.     277.7 FIXEDHF     0.700  0       0.0  0
1257    DI 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d10p
1258    DI 2D1414       332.2     0.     474.6 FIXEDHF     0.700  0       0.0  0
1259    DI 1E1414       197.7     0.     282.4 FIXEDHF     0.700  0       0.0  0
1260    DI 3E1414       158.5     0.     226.5 FIXEDHF     0.700  0       0.0  0
1261    DJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d11p
1262    DJ 2D1414       276.5     0.     395.0 FIXEDHF     0.700  0       0.0  0
1263    DJ 1E1414       165.0     0.     235.7 FIXEDHF     0.700  0       0.0  0
1264    DJ 3E1414       132.5     0.     189.3 FIXEDHF     0.700  0       0.0  0
1265    DK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d12p
1266    DK 2D1414       234.8     0.     335.4 FIXEDHF     0.700  0       0.0  0
1267    DK 1E1414       140.4     0.     200.6 FIXEDHF     0.700  0       0.0  0
1268    DK 3E1414       112.9     0.     161.3 FIXEDHF     0.700  0       0.0  0
1269    DL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d13p
1270    DL 2D1414       202.6     0.     289.5 FIXEDHF     0.700  0       0.0  0
1271    DL 1E1414       121.4     0.     173.4 FIXEDHF     0.700  0       0.0  0
1272    DL 3E1414        97.7     0.     139.6 FIXEDHF     0.700  0       0.0  0
1273    DM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d14p
1274    DM 2D1414       177.2     0.     253.2 FIXEDHF     0.700  0       0.0  0
1275    DM 1E1414       106.3     0.     151.9 FIXEDHF     0.700  0       0.0  0
1276    DM 3E1414        85.6     0.     122.3 FIXEDHF     0.700  0       0.0  0
1277    DN 2D1425       223.0     0.     318.6 FIXEDHF     0.700  0       0.0  0  3d5p      -4s4f
1278    DN 1E1425      -296.8     0.    -424.0 FIXEDHF     0.700  0       0.0  0
1279    DO 2D1425        23.0     0.      32.8 FIXEDHF     0.700  0       0.0  0  3d5p      -4s5f
1280    DO 1E1425      -279.9     0.    -399.9 FIXEDHF     0.700  0       0.0  0
1281    DP 2D1425       -39.5     0.     -56.4 FIXEDHF     0.700  0       0.0  0  3d5p      -4s6f
1282    DP 1E1425      -243.7     0.    -348.1 FIXEDHF     0.700  0       0.0  0
1283    DQ 2D1425       -59.8     0.     -85.4 FIXEDHF     0.700  0       0.0  0  3d5p      -4s7f
1284    DQ 1E1425      -209.9     0.    -299.8 FIXEDHF     0.700  0       0.0  0
1285    DR 2D1425       -65.0     0.     -92.8 FIXEDHF     0.700  0       0.0  0  3d5p      -4s8f
1286    DR 1E1425      -181.6     0.    -259.4 FIXEDHF     0.700  0       0.0  0
1287    DS 2D1425       -64.3     0.     -91.8 FIXEDHF     0.700  0       0.0  0  3d5p      -4s9f
1288    DS 1E1425      -158.4     0.    -226.3 FIXEDHF     0.700  0       0.0  0
1289    DT 2D1425       -61.3     0.     -87.6 FIXEDHF     0.700  0       0.0  0  3d5p      -4s10f
1290    DT 1E1425      -139.4     0.    -199.2 FIXEDHF     0.700  0       0.0  0
1291    DU 2D1425       -57.5     0.     -82.2 FIXEDHF     0.700  0       0.0  0  3d5p      -4s11f
1292    DU 1E1425      -123.8     0.    -176.9 FIXEDHF     0.700  0       0.0  0
1293    DV 2D1425       -53.7     0.     -76.7 FIXEDHF     0.700  0       0.0  0  3d5p      -4s12f
1294    DV 1E1425      -110.9     0.    -158.4 FIXEDHF     0.700  0       0.0  0
1295    DW 2D1425       -49.9     0.     -71.3 FIXEDHF     0.700  0       0.0  0  3d5p      -4s13f
1296    DW 1E1425      -100.0     0.    -142.8 FIXEDHF     0.700  0       0.0  0
1297    DX 2D1425       -46.5     0.     -66.4 FIXEDHF     0.700  0       0.0  0  3d5p      -4s14f
1298    DX 1E1425       -90.6     0.    -129.5 FIXEDHF     0.700  0       0.0  0
1299    DY 2D1415      -160.4     0.    -229.2 FIXEDHF     0.700  0       0.0  0  3d5p      -3d4f
1300    DY 4D1415        49.5     0.      70.7 FIXEDHF     0.700  0       0.0  0
1301    DY 1E1415       155.2     0.     221.7 FIXEDHF     0.700  0       0.0  0
1302    DY 3E1415        90.1     0.     128.7 FIXEDHF     0.700  0       0.0  0
1303    DZ 2D1415       -21.0     0.     -30.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d5f
1304    DZ 4D1415        56.6     0.      80.9 FIXEDHF     0.700  0       0.0  0
1305    DZ 1E1415       140.2     0.     200.3 FIXEDHF     0.700  0       0.0  0
1306    DZ 3E1415        82.7     0.     118.2 FIXEDHF     0.700  0       0.0  0
1307    Da 2D1415        20.6     0.      29.5 FIXEDHF     0.700  0       0.0  0  3d5p      -3d6f
1308    Da 4D1415        52.4     0.      74.9 FIXEDHF     0.700  0       0.0  0
1309    Da 1E1415       118.6     0.     169.4 FIXEDHF     0.700  0       0.0  0
1310    Da 3E1415        70.6     0.     100.9 FIXEDHF     0.700  0       0.0  0
1311    Db 2D1415        33.7     0.      48.1 FIXEDHF     0.700  0       0.0  0  3d5p      -3d7f
1312    Db 4D1415        46.5     0.      66.4 FIXEDHF     0.700  0       0.0  0
1313    Db 1E1415       100.0     0.     142.9 FIXEDHF     0.700  0       0.0  0
1314    Db 3E1415        59.9     0.      85.6 FIXEDHF     0.700  0       0.0  0
1315    Dc 2D1415        36.9     0.      52.7 FIXEDHF     0.700  0       0.0  0  3d5p      -3d8f
1316    Dc 4D1415        40.8     0.      58.3 FIXEDHF     0.700  0       0.0  0
1317    Dc 1E1415        85.3     0.     121.9 FIXEDHF     0.700  0       0.0  0
1318    Dc 3E1415        51.3     0.      73.3 FIXEDHF     0.700  0       0.0  0
1319    Dd 2D1415        36.5     0.      52.1 FIXEDHF     0.700  0       0.0  0  3d5p      -3d9f
1320    Dd 4D1415        35.9     0.      51.3 FIXEDHF     0.700  0       0.0  0
1321    Dd 1E1415        73.6     0.     105.2 FIXEDHF     0.700  0       0.0  0
1322    Dd 3E1415        44.4     0.      63.4 FIXEDHF     0.700  0       0.0  0
1323    De 2D1415        34.6     0.      49.5 FIXEDHF     0.700  0       0.0  0  3d5p      -3d10f
1324    De 4D1415        31.8     0.      45.4 FIXEDHF     0.700  0       0.0  0
1325    De 1E1415        64.3     0.      91.8 FIXEDHF     0.700  0       0.0  0
1326    De 3E1415        38.8     0.      55.5 FIXEDHF     0.700  0       0.0  0
1327    Df 2D1415        32.4     0.      46.3 FIXEDHF     0.700  0       0.0  0  3d5p      -3d11f
1328    Df 4D1415        28.3     0.      40.5 FIXEDHF     0.700  0       0.0  0
1329    Df 1E1415        56.7     0.      81.0 FIXEDHF     0.700  0       0.0  0
1330    Df 3E1415        34.3     0.      49.0 FIXEDHF     0.700  0       0.0  0
1331    Dg 2D1415        30.2     0.      43.1 FIXEDHF     0.700  0       0.0  0  3d5p      -3d12f
1332    Dg 4D1415        25.4     0.      36.3 FIXEDHF     0.700  0       0.0  0
1333    Dg 1E1415        50.5     0.      72.1 FIXEDHF     0.700  0       0.0  0
1334    Dg 3E1415        30.6     0.      43.7 FIXEDHF     0.700  0       0.0  0
1335    Dh 2D1415        28.0     0.      40.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d13f
1336    Dh 4D1415        23.0     0.      32.8 FIXEDHF     0.700  0       0.0  0
1337    Dh 1E1415        45.3     0.      64.7 FIXEDHF     0.700  0       0.0  0
1338    Dh 3E1415        27.5     0.      39.3 FIXEDHF     0.700  0       0.0  0
1339    Di 2D1415        26.0     0.      37.1 FIXEDHF     0.700  0       0.0  0  3d5p      -3d14f
1340    Di 4D1415        20.9     0.      29.9 FIXEDHF     0.700  0       0.0  0
1341    Di 1E1415        40.9     0.      58.5 FIXEDHF     0.700  0       0.0  0
1342    Di 3E1415        24.9     0.      35.6 FIXEDHF     0.700  0       0.0  0
1343    Dn 4D1416        -2.7     0.      -3.8 FIXEDHF     0.700  0       0.0  0  3d5p      -3d6h
1344    Dn 3E1416         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
1345    Do 4D1416        -2.8     0.      -4.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d7h
1346    Do 3E1416         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0
1347    Dp 4D1416        -2.7     0.      -3.8 FIXEDHF     0.700  0       0.0  0  3d5p      -3d8h
1348    Dp 3E1416         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0
1349    Dq 4D1416        -2.4     0.      -3.4 FIXEDHF     0.700  0       0.0  0  3d5p      -3d9h
1350    Dq 3E1416         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0
1351    Dr 1D1437     -2042.5     0.   -2917.8 FIXEDHF     0.700  0       0.0  0  3d5p      -4p5s
1352    Dr 2E1437      -709.7     0.   -1013.9 FIXEDHF     0.700  0       0.0  0
1353    Ds 1D1437       390.3     0.     557.6 FIXEDHF     0.700  0       0.0  0  3d5p      -4p6s
1354    Ds 2E1437      -359.7     0.    -513.9 FIXEDHF     0.700  0       0.0  0
1355    Dt 1D1437       232.0     0.     331.4 FIXEDHF     0.700  0       0.0  0  3d5p      -4p7s
1356    Dt 2E1437      -227.7     0.    -325.3 FIXEDHF     0.700  0       0.0  0
1357    Du 1D1437       169.3     0.     241.9 FIXEDHF     0.700  0       0.0  0  3d5p      -4p8s
1358    Du 2E1437      -161.2     0.    -230.3 FIXEDHF     0.700  0       0.0  0
1359    Dv 1D1438      1558.9     0.    2227.0 FIXEDHF     0.700  0       0.0  0  3d5p      -4p4d
1360    Dv 3D1438       317.7     0.     453.8 FIXEDHF     0.700  0       0.0  0
1361    Dv 0E1438      1924.5     0.    2749.3 FIXEDHF     0.700  0       0.0  0
1362    Dv 2E1438       488.9     0.     698.4 FIXEDHF     0.700  0       0.0  0
1363    Dw 1D1438      -295.1     0.    -421.6 FIXEDHF     0.700  0       0.0  0  3d5p      -4p5d
1364    Dw 3D1438       -23.8     0.     -34.0 FIXEDHF     0.700  0       0.0  0
1365    Dw 0E1438      1130.3     0.    1614.7 FIXEDHF     0.700  0       0.0  0
1366    Dw 2E1438       211.4     0.     302.0 FIXEDHF     0.700  0       0.0  0
1367    Dx 1D1438      -381.8     0.    -545.4 FIXEDHF     0.700  0       0.0  0  3d5p      -4p6d
1368    Dx 3D1438       -80.6     0.    -115.2 FIXEDHF     0.700  0       0.0  0
1369    Dx 0E1438       764.5     0.    1092.1 FIXEDHF     0.700  0       0.0  0
1370    Dx 2E1438       114.7     0.     163.8 FIXEDHF     0.700  0       0.0  0
1371    Dy 1D1438      -345.3     0.    -493.3 FIXEDHF     0.700  0       0.0  0  3d5p      -4p7d
1372    Dy 3D1438       -86.4     0.    -123.4 FIXEDHF     0.700  0       0.0  0
1373    Dy 0E1438       561.0     0.     801.5 FIXEDHF     0.700  0       0.0  0
1374    Dy 2E1438        71.4     0.     102.0 FIXEDHF     0.700  0       0.0  0
1375    Dz 1D1438      -297.2     0.    -424.6 FIXEDHF     0.700  0       0.0  0  3d5p      -4p8d
1376    Dz 3D1438       -80.4     0.    -114.8 FIXEDHF     0.700  0       0.0  0
1377    Dz 0E1438       434.5     0.     620.7 FIXEDHF     0.700  0       0.0  0
1378    Dz 2E1438        48.9     0.      69.8 FIXEDHF     0.700  0       0.0  0
1379    EF 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d7p
1380    EF 2D1414       486.6     0.     695.2 FIXEDHF     0.700  0       0.0  0
1381    EF 1E1414       254.9     0.     364.2 FIXEDHF     0.700  0       0.0  0
1382    EF 3E1414       205.9     0.     294.2 FIXEDHF     0.700  0       0.0  0
1383    EG 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d8p
1384    EG 2D1414       361.3     0.     516.1 FIXEDHF     0.700  0       0.0  0
1385    EG 1E1414       191.8     0.     274.0 FIXEDHF     0.700  0       0.0  0
1386    EG 3E1414       155.7     0.     222.4 FIXEDHF     0.700  0       0.0  0
1387    EH 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d9p
1388    EH 2D1414       282.7     0.     403.8 FIXEDHF     0.700  0       0.0  0
1389    EH 1E1414       151.2     0.     216.0 FIXEDHF     0.700  0       0.0  0
1390    EH 3E1414       123.1     0.     175.8 FIXEDHF     0.700  0       0.0  0
1391    EI 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d10p
1392    EI 2D1414       229.2     0.     327.5 FIXEDHF     0.700  0       0.0  0
1393    EI 1E1414       123.2     0.     176.0 FIXEDHF     0.700  0       0.0  0
1394    EI 3E1414       100.4     0.     143.5 FIXEDHF     0.700  0       0.0  0
1395    EJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d11p
1396    EJ 2D1414       190.9     0.     272.7 FIXEDHF     0.700  0       0.0  0
1397    EJ 1E1414       102.9     0.     147.0 FIXEDHF     0.700  0       0.0  0
1398    EJ 3E1414        84.0     0.     120.0 FIXEDHF     0.700  0       0.0  0
1399    EK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d12p
1400    EK 2D1414       162.3     0.     231.8 FIXEDHF     0.700  0       0.0  0
1401    EK 1E1414        87.6     0.     125.1 FIXEDHF     0.700  0       0.0  0
1402    EK 3E1414        71.6     0.     102.3 FIXEDHF     0.700  0       0.0  0
1403    EL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d13p
1404    EL 2D1414       140.1     0.     200.1 FIXEDHF     0.700  0       0.0  0
1405    EL 1E1414        75.7     0.     108.2 FIXEDHF     0.700  0       0.0  0
1406    EL 3E1414        62.0     0.      88.6 FIXEDHF     0.700  0       0.0  0
1407    EM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d14p
1408    EM 2D1414       122.6     0.     175.1 FIXEDHF     0.700  0       0.0  0
1409    EM 1E1414        66.4     0.      94.8 FIXEDHF     0.700  0       0.0  0
1410    EM 3E1414        54.4     0.      77.7 FIXEDHF     0.700  0       0.0  0
1411    EN 2D1425        35.8     0.      51.2 FIXEDHF     0.700  0       0.0  0  3d6p      -4s4f
1412    EN 1E1425      -169.6     0.    -242.3 FIXEDHF     0.700  0       0.0  0
1413    EO 2D1425        72.5     0.     103.6 FIXEDHF     0.700  0       0.0  0  3d6p      -4s5f
1414    EO 1E1425      -160.9     0.    -229.9 FIXEDHF     0.700  0       0.0  0
1415    EP 2D1425        34.1     0.      48.7 FIXEDHF     0.700  0       0.0  0  3d6p      -4s6f
1416    EP 1E1425      -140.5     0.    -200.7 FIXEDHF     0.700  0       0.0  0
1417    EQ 2D1425        13.4     0.      19.1 FIXEDHF     0.700  0       0.0  0  3d6p      -4s7f
1418    EQ 1E1425      -121.2     0.    -173.2 FIXEDHF     0.700  0       0.0  0
1419    ER 2D1425         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0  3d6p      -4s8f
1420    ER 1E1425      -105.1     0.    -150.1 FIXEDHF     0.700  0       0.0  0
1421    ES 2D1425        -3.1     0.      -4.5 FIXEDHF     0.700  0       0.0  0  3d6p      -4s9f
1422    ES 1E1425       -91.7     0.    -131.0 FIXEDHF     0.700  0       0.0  0
1423    ET 2D1425        -6.3     0.      -9.0 FIXEDHF     0.700  0       0.0  0  3d6p      -4s10f
1424    ET 1E1425       -80.8     0.    -115.5 FIXEDHF     0.700  0       0.0  0
1425    EU 2D1425        -7.9     0.     -11.3 FIXEDHF     0.700  0       0.0  0  3d6p      -4s11f
1426    EU 1E1425       -71.8     0.    -102.6 FIXEDHF     0.700  0       0.0  0
1427    EV 2D1425        -8.8     0.     -12.5 FIXEDHF     0.700  0       0.0  0  3d6p      -4s12f
1428    EV 1E1425       -64.3     0.     -91.9 FIXEDHF     0.700  0       0.0  0
1429    EW 2D1425        -9.1     0.     -13.0 FIXEDHF     0.700  0       0.0  0  3d6p      -4s13f
1430    EW 1E1425       -58.0     0.     -82.8 FIXEDHF     0.700  0       0.0  0
1431    EX 2D1425        -9.1     0.     -13.0 FIXEDHF     0.700  0       0.0  0  3d6p      -4s14f
1432    EX 1E1425       -52.6     0.     -75.2 FIXEDHF     0.700  0       0.0  0
1433    EY 2D1415       -22.3     0.     -31.9 FIXEDHF     0.700  0       0.0  0  3d6p      -3d4f
1434    EY 4D1415        26.0     0.      37.2 FIXEDHF     0.700  0       0.0  0
1435    EY 1E1415        89.3     0.     127.6 FIXEDHF     0.700  0       0.0  0
1436    EY 3E1415        51.7     0.      73.8 FIXEDHF     0.700  0       0.0  0
1437    EZ 2D1415       -53.3     0.     -76.2 FIXEDHF     0.700  0       0.0  0  3d6p      -3d5f
1438    EZ 4D1415        26.9     0.      38.5 FIXEDHF     0.700  0       0.0  0
1439    EZ 1E1415        81.0     0.     115.7 FIXEDHF     0.700  0       0.0  0
1440    EZ 3E1415        47.7     0.      68.2 FIXEDHF     0.700  0       0.0  0
1441    Ea 2D1415       -27.7     0.     -39.6 FIXEDHF     0.700  0       0.0  0  3d6p      -3d6f
1442    Ea 4D1415        25.1     0.      35.8 FIXEDHF     0.700  0       0.0  0
1443    Ea 1E1415        68.7     0.      98.1 FIXEDHF     0.700  0       0.0  0
1444    Ea 3E1415        40.9     0.      58.4 FIXEDHF     0.700  0       0.0  0
1445    Eb 2D1415       -13.9     0.     -19.8 FIXEDHF     0.700  0       0.0  0  3d6p      -3d7f
1446    Eb 4D1415        22.4     0.      32.0 FIXEDHF     0.700  0       0.0  0
1447    Eb 1E1415        58.0     0.      82.9 FIXEDHF     0.700  0       0.0  0
1448    Eb 3E1415        34.8     0.      49.7 FIXEDHF     0.700  0       0.0  0
1449    Ec 2D1415        -6.5     0.      -9.3 FIXEDHF     0.700  0       0.0  0  3d6p      -3d8f
1450    Ec 4D1415        19.8     0.      28.3 FIXEDHF     0.700  0       0.0  0
1451    Ec 1E1415        49.6     0.      70.8 FIXEDHF     0.700  0       0.0  0
1452    Ec 3E1415        29.8     0.      42.6 FIXEDHF     0.700  0       0.0  0
1453    Ed 2D1415        -2.4     0.      -3.5 FIXEDHF     0.700  0       0.0  0  3d6p      -3d9f
1454    Ed 4D1415        17.6     0.      25.1 FIXEDHF     0.700  0       0.0  0
1455    Ed 1E1415        42.8     0.      61.1 FIXEDHF     0.700  0       0.0  0
1456    Ed 3E1415        25.8     0.      36.9 FIXEDHF     0.700  0       0.0  0
1457    Ee 2D1415        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d6p      -3d10f
1458    Ee 4D1415        15.6     0.      22.3 FIXEDHF     0.700  0       0.0  0
1459    Ee 1E1415        37.4     0.      53.4 FIXEDHF     0.700  0       0.0  0
1460    Ee 3E1415        22.6     0.      32.3 FIXEDHF     0.700  0       0.0  0
1461    Ef 2D1415         1.2     0.       1.7 FIXEDHF     0.700  0       0.0  0  3d6p      -3d11f
1462    Ef 4D1415        14.0     0.      20.0 FIXEDHF     0.700  0       0.0  0
1463    Ef 1E1415        33.0     0.      47.1 FIXEDHF     0.700  0       0.0  0
1464    Ef 3E1415        19.9     0.      28.5 FIXEDHF     0.700  0       0.0  0
1465    Eg 2D1415         2.0     0.       2.9 FIXEDHF     0.700  0       0.0  0  3d6p      -3d12f
1466    Eg 4D1415        12.6     0.      18.0 FIXEDHF     0.700  0       0.0  0
1467    Eg 1E1415        29.4     0.      42.0 FIXEDHF     0.700  0       0.0  0
1468    Eg 3E1415        17.8     0.      25.5 FIXEDHF     0.700  0       0.0  0
1469    Eh 2D1415         2.4     0.       3.5 FIXEDHF     0.700  0       0.0  0  3d6p      -3d13f
1470    Eh 4D1415        11.4     0.      16.3 FIXEDHF     0.700  0       0.0  0
1471    Eh 1E1415        26.4     0.      37.7 FIXEDHF     0.700  0       0.0  0
1472    Eh 3E1415        16.0     0.      22.9 FIXEDHF     0.700  0       0.0  0
1473    Ei 2D1415         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0  3d6p      -3d14f
1474    Ei 4D1415        10.4     0.      14.9 FIXEDHF     0.700  0       0.0  0
1475    Ei 1E1415        23.9     0.      34.1 FIXEDHF     0.700  0       0.0  0
1476    Ei 3E1415        14.5     0.      20.7 FIXEDHF     0.700  0       0.0  0
1477    En 4D1416         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d6h
1478    En 3E1416         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
1479    Eo 4D1416        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0  3d6p      -3d7h
1480    Eo 3E1416         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
1481    Ep 4D1416        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0  3d6p      -3d8h
1482    Ep 3E1416         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
1483    Eq 4D1416        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0  3d6p      -3d9h
1484    Eq 3E1416         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
1485    Er 1D1437     -1290.7     0.   -1843.8 FIXEDHF     0.700  0       0.0  0  3d6p      -4p5s
1486    Er 2E1437      -474.6     0.    -678.0 FIXEDHF     0.700  0       0.0  0
1487    Es 1D1437      -665.3     0.    -950.5 FIXEDHF     0.700  0       0.0  0  3d6p      -4p6s
1488    Es 2E1437      -245.6     0.    -350.8 FIXEDHF     0.700  0       0.0  0
1489    Et 1D1437       115.8     0.     165.5 FIXEDHF     0.700  0       0.0  0  3d6p      -4p7s
1490    Et 2E1437      -156.9     0.    -224.1 FIXEDHF     0.700  0       0.0  0
1491    Eu 1D1437        77.1     0.     110.2 FIXEDHF     0.700  0       0.0  0  3d6p      -4p8s
1492    Eu 2E1437      -111.6     0.    -159.5 FIXEDHF     0.700  0       0.0  0
1493    Ev 1D1438       765.9     0.    1094.2 FIXEDHF     0.700  0       0.0  0  3d6p      -4p4d
1494    Ev 3D1438       255.4     0.     364.9 FIXEDHF     0.700  0       0.0  0
1495    Ev 0E1438      1156.4     0.    1652.0 FIXEDHF     0.700  0       0.0  0
1496    Ev 2E1438       350.3     0.     500.5 FIXEDHF     0.700  0       0.0  0
1497    Ew 1D1438       634.2     0.     906.0 FIXEDHF     0.700  0       0.0  0  3d6p      -4p5d
1498    Ew 3D1438        81.5     0.     116.5 FIXEDHF     0.700  0       0.0  0
1499    Ew 0E1438       688.1     0.     983.0 FIXEDHF     0.700  0       0.0  0
1500    Ew 2E1438       166.7     0.     238.1 FIXEDHF     0.700  0       0.0  0
1501    Ex 1D1438        -5.5     0.      -7.9 FIXEDHF     0.700  0       0.0  0  3d6p      -4p6d
1502    Ex 3D1438        10.8     0.      15.4 FIXEDHF     0.700  0       0.0  0
1503    Ex 0E1438       467.9     0.     668.4 FIXEDHF     0.700  0       0.0  0
1504    Ex 2E1438        97.6     0.     139.4 FIXEDHF     0.700  0       0.0  0
1505    Ey 1D1438       -88.1     0.    -125.8 FIXEDHF     0.700  0       0.0  0  3d6p      -4p7d
1506    Ey 3D1438       -10.6     0.     -15.2 FIXEDHF     0.700  0       0.0  0
1507    Ey 0E1438       344.3     0.     491.8 FIXEDHF     0.700  0       0.0  0
1508    Ey 2E1438        64.7     0.      92.4 FIXEDHF     0.700  0       0.0  0
1509    Ez 1D1438      -102.3     0.    -146.2 FIXEDHF     0.700  0       0.0  0  3d6p      -4p8d
1510    Ez 3D1438       -17.4     0.     -24.9 FIXEDHF     0.700  0       0.0  0
1511    Ez 0E1438       267.1     0.     381.5 FIXEDHF     0.700  0       0.0  0
1512    Ez 2E1438        46.5     0.      66.5 FIXEDHF     0.700  0       0.0  0
1513    FG 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d8p
1514    FG 2D1414       266.4     0.     380.6 FIXEDHF     0.700  0       0.0  0
1515    FG 1E1414       134.8     0.     192.5 FIXEDHF     0.700  0       0.0  0
1516    FG 3E1414       110.3     0.     157.5 FIXEDHF     0.700  0       0.0  0
1517    FH 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d9p
1518    FH 2D1414       208.4     0.     297.7 FIXEDHF     0.700  0       0.0  0
1519    FH 1E1414       106.3     0.     151.8 FIXEDHF     0.700  0       0.0  0
1520    FH 3E1414        87.2     0.     124.6 FIXEDHF     0.700  0       0.0  0
1521    FI 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d10p
1522    FI 2D1414       169.0     0.     241.5 FIXEDHF     0.700  0       0.0  0
1523    FI 1E1414        86.6     0.     123.7 FIXEDHF     0.700  0       0.0  0
1524    FI 3E1414        71.2     0.     101.7 FIXEDHF     0.700  0       0.0  0
1525    FJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d11p
1526    FJ 2D1414       140.8     0.     201.1 FIXEDHF     0.700  0       0.0  0
1527    FJ 1E1414        72.4     0.     103.4 FIXEDHF     0.700  0       0.0  0
1528    FJ 3E1414        59.6     0.      85.1 FIXEDHF     0.700  0       0.0  0
1529    FK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d12p
1530    FK 2D1414       119.7     0.     171.0 FIXEDHF     0.700  0       0.0  0
1531    FK 1E1414        61.6     0.      88.0 FIXEDHF     0.700  0       0.0  0
1532    FK 3E1414        50.8     0.      72.6 FIXEDHF     0.700  0       0.0  0
1533    FL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d13p
1534    FL 2D1414       103.4     0.     147.7 FIXEDHF     0.700  0       0.0  0
1535    FL 1E1414        53.3     0.      76.1 FIXEDHF     0.700  0       0.0  0
1536    FL 3E1414        44.0     0.      62.8 FIXEDHF     0.700  0       0.0  0
1537    FM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d14p
1538    FM 2D1414        90.5     0.     129.3 FIXEDHF     0.700  0       0.0  0
1539    FM 1E1414        46.7     0.      66.7 FIXEDHF     0.700  0       0.0  0
1540    FM 3E1414        38.6     0.      55.1 FIXEDHF     0.700  0       0.0  0
1541    FN 2D1425        22.1     0.      31.6 FIXEDHF     0.700  0       0.0  0  3d7p      -4s4f
1542    FN 1E1425      -114.7     0.    -163.8 FIXEDHF     0.700  0       0.0  0
1543    FO 2D1425        19.0     0.      27.1 FIXEDHF     0.700  0       0.0  0  3d7p      -4s5f
1544    FO 1E1425      -109.0     0.    -155.7 FIXEDHF     0.700  0       0.0  0
1545    FP 2D1425        29.3     0.      41.8 FIXEDHF     0.700  0       0.0  0  3d7p      -4s6f
1546    FP 1E1425       -95.3     0.    -136.1 FIXEDHF     0.700  0       0.0  0
1547    FQ 2D1425        18.9     0.      27.0 FIXEDHF     0.700  0       0.0  0  3d7p      -4s7f
1548    FQ 1E1425       -82.3     0.    -117.6 FIXEDHF     0.700  0       0.0  0
1549    FR 2D1425        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0  3d7p      -4s8f
1550    FR 1E1425       -71.3     0.    -101.9 FIXEDHF     0.700  0       0.0  0
1551    FS 2D1425         6.9     0.       9.8 FIXEDHF     0.700  0       0.0  0  3d7p      -4s9f
1552    FS 1E1425       -62.4     0.     -89.1 FIXEDHF     0.700  0       0.0  0
1553    FT 2D1425         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0  3d7p      -4s10f
1554    FT 1E1425       -54.9     0.     -78.5 FIXEDHF     0.700  0       0.0  0
1555    FU 2D1425         1.9     0.       2.7 FIXEDHF     0.700  0       0.0  0  3d7p      -4s11f
1556    FU 1E1425       -48.9     0.     -69.8 FIXEDHF     0.700  0       0.0  0
1557    FV 2D1425         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0  3d7p      -4s12f
1558    FV 1E1425       -43.8     0.     -62.5 FIXEDHF     0.700  0       0.0  0
1559    FW 2D1425        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d7p      -4s13f
1560    FW 1E1425       -39.5     0.     -56.4 FIXEDHF     0.700  0       0.0  0
1561    FX 2D1425        -0.8     0.      -1.1 FIXEDHF     0.700  0       0.0  0  3d7p      -4s14f
1562    FX 1E1425       -35.8     0.     -51.2 FIXEDHF     0.700  0       0.0  0
1563    FY 2D1415       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0  3d7p      -3d4f
1564    FY 4D1415        16.4     0.      23.5 FIXEDHF     0.700  0       0.0  0
1565    FY 1E1415        60.6     0.      86.6 FIXEDHF     0.700  0       0.0  0
1566    FY 3E1415        34.9     0.      49.9 FIXEDHF     0.700  0       0.0  0
1567    FZ 2D1415       -12.9     0.     -18.5 FIXEDHF     0.700  0       0.0  0  3d7p      -3d5f
1568    FZ 4D1415        17.2     0.      24.6 FIXEDHF     0.700  0       0.0  0
1569    FZ 1E1415        55.1     0.      78.7 FIXEDHF     0.700  0       0.0  0
1570    FZ 3E1415        32.3     0.      46.2 FIXEDHF     0.700  0       0.0  0
1571    Fa 2D1415       -22.2     0.     -31.7 FIXEDHF     0.700  0       0.0  0  3d7p      -3d6f
1572    Fa 4D1415        15.7     0.      22.5 FIXEDHF     0.700  0       0.0  0
1573    Fa 1E1415        46.8     0.      66.8 FIXEDHF     0.700  0       0.0  0
1574    Fa 3E1415        27.8     0.      39.7 FIXEDHF     0.700  0       0.0  0
1575    Fb 2D1415       -15.6     0.     -22.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d7f
1576    Fb 4D1415        14.1     0.      20.1 FIXEDHF     0.700  0       0.0  0
1577    Fb 1E1415        39.5     0.      56.5 FIXEDHF     0.700  0       0.0  0
1578    Fb 3E1415        23.7     0.      33.8 FIXEDHF     0.700  0       0.0  0
1579    Fc 2D1415       -10.7     0.     -15.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d8f
1580    Fc 4D1415        12.5     0.      17.8 FIXEDHF     0.700  0       0.0  0
1581    Fc 1E1415        33.7     0.      48.2 FIXEDHF     0.700  0       0.0  0
1582    Fc 3E1415        20.3     0.      29.0 FIXEDHF     0.700  0       0.0  0
1583    Fd 2D1415        -7.5     0.     -10.7 FIXEDHF     0.700  0       0.0  0  3d7p      -3d9f
1584    Fd 4D1415        11.1     0.      15.8 FIXEDHF     0.700  0       0.0  0
1585    Fd 1E1415        29.2     0.      41.7 FIXEDHF     0.700  0       0.0  0
1586    Fd 3E1415        17.6     0.      25.1 FIXEDHF     0.700  0       0.0  0
1587    Fe 2D1415        -5.4     0.      -7.7 FIXEDHF     0.700  0       0.0  0  3d7p      -3d10f
1588    Fe 4D1415         9.8     0.      14.0 FIXEDHF     0.700  0       0.0  0
1589    Fe 1E1415        25.5     0.      36.4 FIXEDHF     0.700  0       0.0  0
1590    Fe 3E1415        15.4     0.      22.0 FIXEDHF     0.700  0       0.0  0
1591    Ff 2D1415        -3.9     0.      -5.6 FIXEDHF     0.700  0       0.0  0  3d7p      -3d11f
1592    Ff 4D1415         8.8     0.      12.6 FIXEDHF     0.700  0       0.0  0
1593    Ff 1E1415        22.5     0.      32.1 FIXEDHF     0.700  0       0.0  0
1594    Ff 3E1415        13.6     0.      19.4 FIXEDHF     0.700  0       0.0  0
1595    Fg 2D1415        -2.9     0.      -4.1 FIXEDHF     0.700  0       0.0  0  3d7p      -3d12f
1596    Fg 4D1415         7.9     0.      11.3 FIXEDHF     0.700  0       0.0  0
1597    Fg 1E1415        20.0     0.      28.6 FIXEDHF     0.700  0       0.0  0
1598    Fg 3E1415        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
1599    Fh 2D1415        -2.2     0.      -3.1 FIXEDHF     0.700  0       0.0  0  3d7p      -3d13f
1600    Fh 4D1415         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
1601    Fh 1E1415        18.0     0.      25.7 FIXEDHF     0.700  0       0.0  0
1602    Fh 3E1415        10.9     0.      15.6 FIXEDHF     0.700  0       0.0  0
1603    Fi 2D1415        -1.6     0.      -2.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d14f
1604    Fi 4D1415         6.6     0.       9.4 FIXEDHF     0.700  0       0.0  0
1605    Fi 1E1415        16.2     0.      23.2 FIXEDHF     0.700  0       0.0  0
1606    Fi 3E1415         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0
1607    Fn 4D1416        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d6h
1608    Fn 3E1416         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
1609    Fo 4D1416        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d7h
1610    Fo 3E1416         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
1611    Fp 4D1416        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d8h
1612    Fp 3E1416         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
1613    Fq 4D1416        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d9h
1614    Fq 3E1416         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
1615    Fr 1D1437      -915.2     0.   -1307.4 FIXEDHF     0.700  0       0.0  0  3d7p      -4p5s
1616    Fr 2E1437      -342.8     0.    -489.7 FIXEDHF     0.700  0       0.0  0
1617    Fs 1D1437      -505.0     0.    -721.4 FIXEDHF     0.700  0       0.0  0  3d7p      -4p6s
1618    Fs 2E1437      -179.1     0.    -255.8 FIXEDHF     0.700  0       0.0  0
1619    Ft 1D1437      -278.4     0.    -397.7 FIXEDHF     0.700  0       0.0  0  3d7p      -4p7s
1620    Ft 2E1437      -114.9     0.    -164.1 FIXEDHF     0.700  0       0.0  0
1621    Fu 1D1437        42.7     0.      61.0 FIXEDHF     0.700  0       0.0  0  3d7p      -4p8s
1622    Fu 2E1437       -81.9     0.    -117.0 FIXEDHF     0.700  0       0.0  0
1623    Fv 1D1438       520.0     0.     742.8 FIXEDHF     0.700  0       0.0  0  3d7p      -4p4d
1624    Fv 3D1438       198.0     0.     282.8 FIXEDHF     0.700  0       0.0  0
1625    Fv 0E1438       796.6     0.    1138.0 FIXEDHF     0.700  0       0.0  0
1626    Fv 2E1438       260.4     0.     372.0 FIXEDHF     0.700  0       0.0  0
1627    Fw 1D1438       359.0     0.     512.9 FIXEDHF     0.700  0       0.0  0  3d7p      -4p5d
1628    Fw 3D1438        76.4     0.     109.2 FIXEDHF     0.700  0       0.0  0
1629    Fw 0E1438       476.7     0.     681.0 FIXEDHF     0.700  0       0.0  0
1630    Fw 2E1438       128.1     0.     183.0 FIXEDHF     0.700  0       0.0  0
1631    Fx 1D1438       312.1     0.     445.8 FIXEDHF     0.700  0       0.0  0  3d7p      -4p6d
1632    Fx 3D1438        29.9     0.      42.7 FIXEDHF     0.700  0       0.0  0
1633    Fx 0E1438       324.9     0.     464.2 FIXEDHF     0.700  0       0.0  0
1634    Fx 2E1438        76.9     0.     109.8 FIXEDHF     0.700  0       0.0  0
1635    Fy 1D1438        36.9     0.      52.7 FIXEDHF     0.700  0       0.0  0  3d7p      -4p7d
1636    Fy 3D1438         8.5     0.      12.2 FIXEDHF     0.700  0       0.0  0
1637    Fy 0E1438       239.3     0.     341.9 FIXEDHF     0.700  0       0.0  0
1638    Fy 2E1438        51.9     0.      74.1 FIXEDHF     0.700  0       0.0  0
1639    Fz 1D1438       -13.4     0.     -19.2 FIXEDHF     0.700  0       0.0  0  3d7p      -4p8d
1640    Fz 3D1438        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
1641    Fz 0E1438       185.8     0.     265.4 FIXEDHF     0.700  0       0.0  0
1642    Fz 2E1438        37.9     0.      54.1 FIXEDHF     0.700  0       0.0  0
1643    GH 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d9p
1644    GH 2D1414       161.3     0.     230.5 FIXEDHF     0.700  0       0.0  0
1645    GH 1E1414        80.1     0.     114.4 FIXEDHF     0.700  0       0.0  0
1646    GH 3E1414        66.0     0.      94.3 FIXEDHF     0.700  0       0.0  0
1647    GI 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d10p
1648    GI 2D1414       130.8     0.     186.9 FIXEDHF     0.700  0       0.0  0
1649    GI 1E1414        65.3     0.      93.3 FIXEDHF     0.700  0       0.0  0
1650    GI 3E1414        53.9     0.      77.0 FIXEDHF     0.700  0       0.0  0
1651    GJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d11p
1652    GJ 2D1414       109.0     0.     155.7 FIXEDHF     0.700  0       0.0  0
1653    GJ 1E1414        54.5     0.      77.9 FIXEDHF     0.700  0       0.0  0
1654    GJ 3E1414        45.1     0.      64.5 FIXEDHF     0.700  0       0.0  0
1655    GK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d12p
1656    GK 2D1414        92.6     0.     132.3 FIXEDHF     0.700  0       0.0  0
1657    GK 1E1414        46.5     0.      66.4 FIXEDHF     0.700  0       0.0  0
1658    GK 3E1414        38.5     0.      55.0 FIXEDHF     0.700  0       0.0  0
1659    GL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d13p
1660    GL 2D1414        80.0     0.     114.3 FIXEDHF     0.700  0       0.0  0
1661    GL 1E1414        40.2     0.      57.4 FIXEDHF     0.700  0       0.0  0
1662    GL 3E1414        33.3     0.      47.6 FIXEDHF     0.700  0       0.0  0
1663    GM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d14p
1664    GM 2D1414        70.1     0.     100.1 FIXEDHF     0.700  0       0.0  0
1665    GM 1E1414        35.2     0.      50.3 FIXEDHF     0.700  0       0.0  0
1666    GM 3E1414        29.2     0.      41.7 FIXEDHF     0.700  0       0.0  0
1667    GN 2D1425        16.2     0.      23.1 FIXEDHF     0.700  0       0.0  0  3d8p      -4s4f
1668    GN 1E1425       -84.5     0.    -120.7 FIXEDHF     0.700  0       0.0  0
1669    GO 2D1425        12.9     0.      18.5 FIXEDHF     0.700  0       0.0  0  3d8p      -4s5f
1670    GO 1E1425       -80.4     0.    -114.9 FIXEDHF     0.700  0       0.0  0
1671    GP 2D1425        10.5     0.      15.0 FIXEDHF     0.700  0       0.0  0  3d8p      -4s6f
1672    GP 1E1425       -70.3     0.    -100.5 FIXEDHF     0.700  0       0.0  0
1673    GQ 2D1425        13.9     0.      19.9 FIXEDHF     0.700  0       0.0  0  3d8p      -4s7f
1674    GQ 1E1425       -60.8     0.     -86.9 FIXEDHF     0.700  0       0.0  0
1675    GR 2D1425        10.4     0.      14.8 FIXEDHF     0.700  0       0.0  0  3d8p      -4s8f
1676    GR 1E1425       -52.7     0.     -75.3 FIXEDHF     0.700  0       0.0  0
1677    GS 2D1425         7.3     0.      10.5 FIXEDHF     0.700  0       0.0  0  3d8p      -4s9f
1678    GS 1E1425       -46.1     0.     -65.8 FIXEDHF     0.700  0       0.0  0
1679    GT 2D1425         5.2     0.       7.4 FIXEDHF     0.700  0       0.0  0  3d8p      -4s10f
1680    GT 1E1425       -40.6     0.     -58.0 FIXEDHF     0.700  0       0.0  0
1681    GU 2D1425         3.7     0.       5.3 FIXEDHF     0.700  0       0.0  0  3d8p      -4s11f
1682    GU 1E1425       -36.1     0.     -51.6 FIXEDHF     0.700  0       0.0  0
1683    GV 2D1425         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0  3d8p      -4s12f
1684    GV 1E1425       -32.3     0.     -46.2 FIXEDHF     0.700  0       0.0  0
1685    GW 2D1425         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0  3d8p      -4s13f
1686    GW 1E1425       -29.2     0.     -41.7 FIXEDHF     0.700  0       0.0  0
1687    GX 2D1425         1.3     0.       1.8 FIXEDHF     0.700  0       0.0  0  3d8p      -4s14f
1688    GX 1E1425       -26.5     0.     -37.8 FIXEDHF     0.700  0       0.0  0
1689    GY 2D1415        -9.4     0.     -13.5 FIXEDHF     0.700  0       0.0  0  3d8p      -3d4f
1690    GY 4D1415        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0
1691    GY 1E1415        44.8     0.      64.0 FIXEDHF     0.700  0       0.0  0
1692    GY 3E1415        25.8     0.      36.8 FIXEDHF     0.700  0       0.0  0
1693    GZ 2D1415        -8.6     0.     -12.3 FIXEDHF     0.700  0       0.0  0  3d8p      -3d5f
1694    GZ 4D1415        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
1695    GZ 1E1415        40.7     0.      58.2 FIXEDHF     0.700  0       0.0  0
1696    GZ 3E1415        23.9     0.      34.1 FIXEDHF     0.700  0       0.0  0
1697    Ga 2D1415        -7.8     0.     -11.1 FIXEDHF     0.700  0       0.0  0  3d8p      -3d6f
1698    Ga 4D1415        11.2     0.      16.0 FIXEDHF     0.700  0       0.0  0
1699    Ga 1E1415        34.6     0.      49.4 FIXEDHF     0.700  0       0.0  0
1700    Ga 3E1415        20.5     0.      29.3 FIXEDHF     0.700  0       0.0  0
1701    Gb 2D1415       -11.0     0.     -15.7 FIXEDHF     0.700  0       0.0  0  3d8p      -3d7f
1702    Gb 4D1415         9.9     0.      14.2 FIXEDHF     0.700  0       0.0  0
1703    Gb 1E1415        29.3     0.      41.8 FIXEDHF     0.700  0       0.0  0
1704    Gb 3E1415        17.5     0.      25.0 FIXEDHF     0.700  0       0.0  0
1705    Gc 2D1415        -8.8     0.     -12.6 FIXEDHF     0.700  0       0.0  0  3d8p      -3d8f
1706    Gc 4D1415         8.8     0.      12.6 FIXEDHF     0.700  0       0.0  0
1707    Gc 1E1415        25.0     0.      35.7 FIXEDHF     0.700  0       0.0  0
1708    Gc 3E1415        15.0     0.      21.4 FIXEDHF     0.700  0       0.0  0
1709    Gd 2D1415        -6.8     0.      -9.7 FIXEDHF     0.700  0       0.0  0  3d8p      -3d9f
1710    Gd 4D1415         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0
1711    Gd 1E1415        21.6     0.      30.9 FIXEDHF     0.700  0       0.0  0
1712    Gd 3E1415        13.0     0.      18.6 FIXEDHF     0.700  0       0.0  0
1713    Ge 2D1415        -5.3     0.      -7.6 FIXEDHF     0.700  0       0.0  0  3d8p      -3d10f
1714    Ge 4D1415         6.9     0.       9.9 FIXEDHF     0.700  0       0.0  0
1715    Ge 1E1415        18.9     0.      27.0 FIXEDHF     0.700  0       0.0  0
1716    Ge 3E1415        11.4     0.      16.3 FIXEDHF     0.700  0       0.0  0
1717    Gf 2D1415        -4.2     0.      -6.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d11f
1718    Gf 4D1415         6.2     0.       8.9 FIXEDHF     0.700  0       0.0  0
1719    Gf 1E1415        16.7     0.      23.8 FIXEDHF     0.700  0       0.0  0
1720    Gf 3E1415        10.1     0.      14.4 FIXEDHF     0.700  0       0.0  0
1721    Gg 2D1415        -3.4     0.      -4.8 FIXEDHF     0.700  0       0.0  0  3d8p      -3d12f
1722    Gg 4D1415         5.6     0.       8.0 FIXEDHF     0.700  0       0.0  0
1723    Gg 1E1415        14.8     0.      21.2 FIXEDHF     0.700  0       0.0  0
1724    Gg 3E1415         9.0     0.      12.8 FIXEDHF     0.700  0       0.0  0
1725    Gh 2D1415        -2.8     0.      -4.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d13f
1726    Gh 4D1415         5.1     0.       7.3 FIXEDHF     0.700  0       0.0  0
1727    Gh 1E1415        13.3     0.      19.0 FIXEDHF     0.700  0       0.0  0
1728    Gh 3E1415         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0
1729    Gi 2D1415        -2.3     0.      -3.3 FIXEDHF     0.700  0       0.0  0  3d8p      -3d14f
1730    Gi 4D1415         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0
1731    Gi 1E1415        12.0     0.      17.2 FIXEDHF     0.700  0       0.0  0
1732    Gi 3E1415         7.3     0.      10.4 FIXEDHF     0.700  0       0.0  0
1733    Gn 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d8p      -3d6h
1734    Gn 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1735    Go 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d8p      -3d7h
1736    Go 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1737    Gp 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d8p      -3d8h
1738    Gp 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1739    Gq 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d8p      -3d9h
1740    Gq 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1741    Gr 1D1437      -694.0     0.    -991.5 FIXEDHF     0.700  0       0.0  0  3d8p      -4p5s
1742    Gr 2E1437      -262.1     0.    -374.4 FIXEDHF     0.700  0       0.0  0
1743    Gs 1D1437      -394.1     0.    -563.0 FIXEDHF     0.700  0       0.0  0  3d8p      -4p6s
1744    Gs 2E1437      -137.6     0.    -196.6 FIXEDHF     0.700  0       0.0  0
1745    Gt 1D1437      -233.8     0.    -334.0 FIXEDHF     0.700  0       0.0  0  3d8p      -4p7s
1746    Gt 2E1437       -88.4     0.    -126.3 FIXEDHF     0.700  0       0.0  0
1747    Gu 1D1437      -137.3     0.    -196.2 FIXEDHF     0.700  0       0.0  0  3d8p      -4p8s
1748    Gu 2E1437       -63.1     0.     -90.2 FIXEDHF     0.700  0       0.0  0
1749    Gv 1D1438       388.2     0.     554.6 FIXEDHF     0.700  0       0.0  0  3d8p      -4p4d
1750    Gv 3D1438       157.1     0.     224.4 FIXEDHF     0.700  0       0.0  0
1751    Gv 0E1438       592.8     0.     846.9 FIXEDHF     0.700  0       0.0  0
1752    Gv 2E1438       202.2     0.     288.8 FIXEDHF     0.700  0       0.0  0
1753    Gw 1D1438       261.6     0.     373.7 FIXEDHF     0.700  0       0.0  0  3d8p      -4p5d
1754    Gw 3D1438        65.5     0.      93.5 FIXEDHF     0.700  0       0.0  0
1755    Gw 0E1438       355.9     0.     508.4 FIXEDHF     0.700  0       0.0  0
1756    Gw 2E1438       101.2     0.     144.6 FIXEDHF     0.700  0       0.0  0
1757    Gx 1D1438       192.5     0.     275.0 FIXEDHF     0.700  0       0.0  0  3d8p      -4p6d
1758    Gx 3D1438        29.5     0.      42.1 FIXEDHF     0.700  0       0.0  0
1759    Gx 0E1438       242.9     0.     347.0 FIXEDHF     0.700  0       0.0  0
1760    Gx 2E1438        61.5     0.      87.8 FIXEDHF     0.700  0       0.0  0
1761    Gy 1D1438       174.4     0.     249.2 FIXEDHF     0.700  0       0.0  0  3d8p      -4p7d
1762    Gy 3D1438        13.6     0.      19.4 FIXEDHF     0.700  0       0.0  0
1763    Gy 0E1438       179.1     0.     255.8 FIXEDHF     0.700  0       0.0  0
1764    Gy 2E1438        41.9     0.      59.8 FIXEDHF     0.700  0       0.0  0
1765    Gz 1D1438        37.8     0.      54.0 FIXEDHF     0.700  0       0.0  0  3d8p      -4p8d
1766    Gz 3D1438         5.5     0.       7.8 FIXEDHF     0.700  0       0.0  0
1767    Gz 0E1438       139.0     0.     198.6 FIXEDHF     0.700  0       0.0  0
1768    Gz 2E1438        30.7     0.      43.9 FIXEDHF     0.700  0       0.0  0
1769    HI 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d10p
1770    HI 2D1414       105.0     0.     150.0 FIXEDHF     0.700  0       0.0  0
1771    HI 1E1414        51.5     0.      73.6 FIXEDHF     0.700  0       0.0  0
1772    HI 3E1414        42.7     0.      61.0 FIXEDHF     0.700  0       0.0  0
1773    HJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d11p
1774    HJ 2D1414        87.4     0.     124.9 FIXEDHF     0.700  0       0.0  0
1775    HJ 1E1414        43.0     0.      61.5 FIXEDHF     0.700  0       0.0  0
1776    HJ 3E1414        35.7     0.      51.0 FIXEDHF     0.700  0       0.0  0
1777    HK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d12p
1778    HK 2D1414        74.3     0.     106.2 FIXEDHF     0.700  0       0.0  0
1779    HK 1E1414        36.7     0.      52.4 FIXEDHF     0.700  0       0.0  0
1780    HK 3E1414        30.4     0.      43.5 FIXEDHF     0.700  0       0.0  0
1781    HL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d13p
1782    HL 2D1414        64.2     0.      91.7 FIXEDHF     0.700  0       0.0  0
1783    HL 1E1414        31.7     0.      45.3 FIXEDHF     0.700  0       0.0  0
1784    HL 3E1414        26.4     0.      37.7 FIXEDHF     0.700  0       0.0  0
1785    HM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d14p
1786    HM 2D1414        56.2     0.      80.3 FIXEDHF     0.700  0       0.0  0
1787    HM 1E1414        27.8     0.      39.7 FIXEDHF     0.700  0       0.0  0
1788    HM 3E1414        23.1     0.      33.0 FIXEDHF     0.700  0       0.0  0
1789    HN 2D1425        12.7     0.      18.2 FIXEDHF     0.700  0       0.0  0  3d9p      -4s4f
1790    HN 1E1425       -65.7     0.     -93.8 FIXEDHF     0.700  0       0.0  0
1791    HO 2D1425         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0  3d9p      -4s5f
1792    HO 1E1425       -62.6     0.     -89.4 FIXEDHF     0.700  0       0.0  0
1793    HP 2D1425         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0  3d9p      -4s6f
1794    HP 1E1425       -54.8     0.     -78.3 FIXEDHF     0.700  0       0.0  0
1795    HQ 2D1425         6.2     0.       8.8 FIXEDHF     0.700  0       0.0  0  3d9p      -4s7f
1796    HQ 1E1425       -47.4     0.     -67.7 FIXEDHF     0.700  0       0.0  0
1797    HR 2D1425         7.5     0.      10.7 FIXEDHF     0.700  0       0.0  0  3d9p      -4s8f
1798    HR 1E1425       -41.1     0.     -58.7 FIXEDHF     0.700  0       0.0  0
1799    HS 2D1425         6.0     0.       8.6 FIXEDHF     0.700  0       0.0  0  3d9p      -4s9f
1800    HS 1E1425       -35.9     0.     -51.3 FIXEDHF     0.700  0       0.0  0
1801    HT 2D1425         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0  3d9p      -4s10f
1802    HT 1E1425       -31.6     0.     -45.2 FIXEDHF     0.700  0       0.0  0
1803    HU 2D1425         3.6     0.       5.1 FIXEDHF     0.700  0       0.0  0  3d9p      -4s11f
1804    HU 1E1425       -28.1     0.     -40.2 FIXEDHF     0.700  0       0.0  0
1805    HV 2D1425         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0  3d9p      -4s12f
1806    HV 1E1425       -25.2     0.     -36.0 FIXEDHF     0.700  0       0.0  0
1807    HW 2D1425         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0  3d9p      -4s13f
1808    HW 1E1425       -22.8     0.     -32.5 FIXEDHF     0.700  0       0.0  0
1809    HX 2D1425         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0  3d9p      -4s14f
1810    HX 1E1425       -20.6     0.     -29.5 FIXEDHF     0.700  0       0.0  0
1811    HY 2D1415        -7.3     0.     -10.5 FIXEDHF     0.700  0       0.0  0  3d9p      -3d4f
1812    HY 4D1415         8.7     0.      12.4 FIXEDHF     0.700  0       0.0  0
1813    HY 1E1415        34.9     0.      49.8 FIXEDHF     0.700  0       0.0  0
1814    HY 3E1415        20.0     0.      28.6 FIXEDHF     0.700  0       0.0  0
1815    HZ 2D1415        -6.4     0.      -9.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d5f
1816    HZ 4D1415         9.2     0.      13.1 FIXEDHF     0.700  0       0.0  0
1817    HZ 1E1415        31.7     0.      45.3 FIXEDHF     0.700  0       0.0  0
1818    HZ 3E1415        18.6     0.      26.6 FIXEDHF     0.700  0       0.0  0
1819    Ha 2D1415        -5.5     0.      -7.9 FIXEDHF     0.700  0       0.0  0  3d9p      -3d6f
1820    Ha 4D1415         8.5     0.      12.1 FIXEDHF     0.700  0       0.0  0
1821    Ha 1E1415        26.9     0.      38.5 FIXEDHF     0.700  0       0.0  0
1822    Ha 3E1415        16.0     0.      22.8 FIXEDHF     0.700  0       0.0  0
1823    Hb 2D1415        -4.9     0.      -7.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d7f
1824    Hb 4D1415         7.6     0.      10.8 FIXEDHF     0.700  0       0.0  0
1825    Hb 1E1415        22.8     0.      32.6 FIXEDHF     0.700  0       0.0  0
1826    Hb 3E1415        13.6     0.      19.4 FIXEDHF     0.700  0       0.0  0
1827    Hc 2D1415        -6.2     0.      -8.8 FIXEDHF     0.700  0       0.0  0  3d9p      -3d8f
1828    Hc 4D1415         6.6     0.       9.5 FIXEDHF     0.700  0       0.0  0
1829    Hc 1E1415        19.5     0.      27.9 FIXEDHF     0.700  0       0.0  0
1830    Hc 3E1415        11.7     0.      16.7 FIXEDHF     0.700  0       0.0  0
1831    Hd 2D1415        -5.3     0.      -7.5 FIXEDHF     0.700  0       0.0  0  3d9p      -3d9f
1832    Hd 4D1415         5.9     0.       8.4 FIXEDHF     0.700  0       0.0  0
1833    Hd 1E1415        16.9     0.      24.1 FIXEDHF     0.700  0       0.0  0
1834    Hd 3E1415        10.1     0.      14.5 FIXEDHF     0.700  0       0.0  0
1835    He 2D1415        -4.3     0.      -6.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d10f
1836    He 4D1415         5.3     0.       7.5 FIXEDHF     0.700  0       0.0  0
1837    He 1E1415        14.7     0.      21.0 FIXEDHF     0.700  0       0.0  0
1838    He 3E1415         8.9     0.      12.7 FIXEDHF     0.700  0       0.0  0
1839    Hf 2D1415        -3.6     0.      -5.1 FIXEDHF     0.700  0       0.0  0  3d9p      -3d11f
1840    Hf 4D1415         4.8     0.       6.8 FIXEDHF     0.700  0       0.0  0
1841    Hf 1E1415        13.0     0.      18.6 FIXEDHF     0.700  0       0.0  0
1842    Hf 3E1415         7.8     0.      11.2 FIXEDHF     0.700  0       0.0  0
1843    Hg 2D1415        -3.0     0.      -4.3 FIXEDHF     0.700  0       0.0  0  3d9p      -3d12f
1844    Hg 4D1415         4.3     0.       6.1 FIXEDHF     0.700  0       0.0  0
1845    Hg 1E1415        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0
1846    Hg 3E1415         7.0     0.      10.0 FIXEDHF     0.700  0       0.0  0
1847    Hh 2D1415        -2.5     0.      -3.6 FIXEDHF     0.700  0       0.0  0  3d9p      -3d13f
1848    Hh 4D1415         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
1849    Hh 1E1415        10.4     0.      14.9 FIXEDHF     0.700  0       0.0  0
1850    Hh 3E1415         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
1851    Hi 2D1415        -2.1     0.      -3.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d14f
1852    Hi 4D1415         3.5     0.       5.0 FIXEDHF     0.700  0       0.0  0
1853    Hi 1E1415         9.4     0.      13.4 FIXEDHF     0.700  0       0.0  0
1854    Hi 3E1415         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0
1855    Hn 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d6h
1856    Hn 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1857    Ho 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d7h
1858    Ho 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1859    Hp 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d8h
1860    Hp 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1861    Hq 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d9h
1862    Hq 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1863    Hr 1D1437      -550.4     0.    -786.3 FIXEDHF     0.700  0       0.0  0  3d9p      -4p5s
1864    Hr 2E1437      -208.6     0.    -298.0 FIXEDHF     0.700  0       0.0  0
1865    Hs 1D1437      -317.4     0.    -453.5 FIXEDHF     0.700  0       0.0  0  3d9p      -4p6s
1866    Hs 2E1437      -109.8     0.    -156.9 FIXEDHF     0.700  0       0.0  0
1867    Ht 1D1437      -194.2     0.    -277.4 FIXEDHF     0.700  0       0.0  0  3d9p      -4p7s
1868    Ht 2E1437       -70.7     0.    -101.0 FIXEDHF     0.700  0       0.0  0
1869    Hu 1D1437      -122.9     0.    -175.6 FIXEDHF     0.700  0       0.0  0  3d9p      -4p8s
1870    Hu 2E1437       -50.5     0.     -72.2 FIXEDHF     0.700  0       0.0  0
1871    Hv 1D1438       305.8     0.     436.8 FIXEDHF     0.700  0       0.0  0  3d9p      -4p4d
1872    Hv 3D1438       128.0     0.     182.9 FIXEDHF     0.700  0       0.0  0
1873    Hv 0E1438       463.7     0.     662.5 FIXEDHF     0.700  0       0.0  0
1874    Hv 2E1438       162.5     0.     232.1 FIXEDHF     0.700  0       0.0  0
1875    Hw 1D1438       204.7     0.     292.4 FIXEDHF     0.700  0       0.0  0  3d9p      -4p5d
1876    Hw 3D1438        55.6     0.      79.4 FIXEDHF     0.700  0       0.0  0
1877    Hw 0E1438       278.9     0.     398.5 FIXEDHF     0.700  0       0.0  0
1878    Hw 2E1438        82.2     0.     117.4 FIXEDHF     0.700  0       0.0  0
1879    Hx 1D1438       146.7     0.     209.6 FIXEDHF     0.700  0       0.0  0  3d9p      -4p6d
1880    Hx 3D1438        26.6     0.      38.0 FIXEDHF     0.700  0       0.0  0
1881    Hx 0E1438       190.5     0.     272.2 FIXEDHF     0.700  0       0.0  0
1882    Hx 2E1438        50.3     0.      71.8 FIXEDHF     0.700  0       0.0  0
1883    Hy 1D1438       114.2     0.     163.2 FIXEDHF     0.700  0       0.0  0  3d9p      -4p7d
1884    Hy 3D1438        13.6     0.      19.4 FIXEDHF     0.700  0       0.0  0
1885    Hy 0E1438       140.5     0.     200.7 FIXEDHF     0.700  0       0.0  0
1886    Hy 2E1438        34.4     0.      49.1 FIXEDHF     0.700  0       0.0  0
1887    Hz 1D1438       106.8     0.     152.6 FIXEDHF     0.700  0       0.0  0  3d9p      -4p8d
1888    Hz 3D1438         7.1     0.      10.2 FIXEDHF     0.700  0       0.0  0
1889    Hz 0E1438       109.1     0.     155.9 FIXEDHF     0.700  0       0.0  0
1890    Hz 2E1438        25.3     0.      36.2 FIXEDHF     0.700  0       0.0  0
1891    IJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10p     -3d11p
1892    IJ 2D1414        72.1     0.     103.0 FIXEDHF     0.700  0       0.0  0
1893    IJ 1E1414        35.1     0.      50.1 FIXEDHF     0.700  0       0.0  0
1894    IJ 3E1414        29.2     0.      41.7 FIXEDHF     0.700  0       0.0  0
1895    IK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10p     -3d12p
1896    IK 2D1414        61.2     0.      87.5 FIXEDHF     0.700  0       0.0  0
1897    IK 1E1414        29.9     0.      42.7 FIXEDHF     0.700  0       0.0  0
1898    IK 3E1414        24.8     0.      35.5 FIXEDHF     0.700  0       0.0  0
1899    IL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10p     -3d13p
1900    IL 2D1414        52.9     0.      75.6 FIXEDHF     0.700  0       0.0  0
1901    IL 1E1414        25.9     0.      37.0 FIXEDHF     0.700  0       0.0  0
1902    IL 3E1414        21.6     0.      30.8 FIXEDHF     0.700  0       0.0  0
1903    IM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10p     -3d14p
1904    IM 2D1414        46.3     0.      66.2 FIXEDHF     0.700  0       0.0  0
1905    IM 1E1414        22.7     0.      32.4 FIXEDHF     0.700  0       0.0  0
1906    IM 3E1414        18.9     0.      27.0 FIXEDHF     0.700  0       0.0  0
1907    IN 2D1425        10.5     0.      15.0 FIXEDHF     0.700  0       0.0  0  3d10p     -4s4f
1908    IN 1E1425       -53.0     0.     -75.7 FIXEDHF     0.700  0       0.0  0
1909    IO 2D1425         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0  3d10p     -4s5f
1910    IO 1E1425       -50.5     0.     -72.2 FIXEDHF     0.700  0       0.0  0
1911    IP 2D1425         6.1     0.       8.7 FIXEDHF     0.700  0       0.0  0  3d10p     -4s6f
1912    IP 1E1425       -44.2     0.     -63.2 FIXEDHF     0.700  0       0.0  0
1913    IQ 2D1425         4.8     0.       6.8 FIXEDHF     0.700  0       0.0  0  3d10p     -4s7f
1914    IQ 1E1425       -38.3     0.     -54.7 FIXEDHF     0.700  0       0.0  0
1915    IR 2D1425         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0  3d10p     -4s8f
1916    IR 1E1425       -33.2     0.     -47.4 FIXEDHF     0.700  0       0.0  0
1917    IS 2D1425         4.4     0.       6.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4s9f
1918    IS 1E1425       -29.0     0.     -41.5 FIXEDHF     0.700  0       0.0  0
1919    IT 2D1425         3.7     0.       5.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4s10f
1920    IT 1E1425       -25.5     0.     -36.5 FIXEDHF     0.700  0       0.0  0
1921    IU 2D1425         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4s11f
1922    IU 1E1425       -22.8     0.     -32.5 FIXEDHF     0.700  0       0.0  0
1923    IV 2D1425         2.4     0.       3.4 FIXEDHF     0.700  0       0.0  0  3d10p     -4s12f
1924    IV 1E1425       -20.4     0.     -29.1 FIXEDHF     0.700  0       0.0  0
1925    IW 2D1425         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0  3d10p     -4s13f
1926    IW 1E1425       -18.4     0.     -26.3 FIXEDHF     0.700  0       0.0  0
1927    IX 2D1425         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4s14f
1928    IX 1E1425       -16.7     0.     -23.8 FIXEDHF     0.700  0       0.0  0
1929    IY 2D1415        -6.0     0.      -8.6 FIXEDHF     0.700  0       0.0  0  3d10p     -3d4f
1930    IY 4D1415         6.9     0.       9.8 FIXEDHF     0.700  0       0.0  0
1931    IY 1E1415        28.2     0.      40.3 FIXEDHF     0.700  0       0.0  0
1932    IY 3E1415        16.2     0.      23.1 FIXEDHF     0.700  0       0.0  0
1933    IZ 2D1415        -5.2     0.      -7.4 FIXEDHF     0.700  0       0.0  0  3d10p     -3d5f
1934    IZ 4D1415         7.3     0.      10.4 FIXEDHF     0.700  0       0.0  0
1935    IZ 1E1415        25.7     0.      36.7 FIXEDHF     0.700  0       0.0  0
1936    IZ 3E1415        15.0     0.      21.5 FIXEDHF     0.700  0       0.0  0
1937    Ia 2D1415        -4.3     0.      -6.2 FIXEDHF     0.700  0       0.0  0  3d10p     -3d6f
1938    Ia 4D1415         6.7     0.       9.6 FIXEDHF     0.700  0       0.0  0
1939    Ia 1E1415        21.8     0.      31.2 FIXEDHF     0.700  0       0.0  0
1940    Ia 3E1415        12.9     0.      18.4 FIXEDHF     0.700  0       0.0  0
1941    Ib 2D1415        -3.7     0.      -5.3 FIXEDHF     0.700  0       0.0  0  3d10p     -3d7f
1942    Ib 4D1415         5.9     0.       8.5 FIXEDHF     0.700  0       0.0  0
1943    Ib 1E1415        18.5     0.      26.4 FIXEDHF     0.700  0       0.0  0
1944    Ib 3E1415        11.0     0.      15.7 FIXEDHF     0.700  0       0.0  0
1945    Ic 2D1415        -3.3     0.      -4.7 FIXEDHF     0.700  0       0.0  0  3d10p     -3d8f
1946    Ic 4D1415         5.3     0.       7.6 FIXEDHF     0.700  0       0.0  0
1947    Ic 1E1415        15.7     0.      22.5 FIXEDHF     0.700  0       0.0  0
1948    Ic 3E1415         9.4     0.      13.5 FIXEDHF     0.700  0       0.0  0
1949    Id 2D1415        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0  3d10p     -3d9f
1950    Id 4D1415         4.7     0.       6.7 FIXEDHF     0.700  0       0.0  0
1951    Id 1E1415        13.6     0.      19.5 FIXEDHF     0.700  0       0.0  0
1952    Id 3E1415         8.2     0.      11.7 FIXEDHF     0.700  0       0.0  0
1953    Ie 2D1415        -3.4     0.      -4.8 FIXEDHF     0.700  0       0.0  0  3d10p     -3d10f
1954    Ie 4D1415         4.2     0.       6.0 FIXEDHF     0.700  0       0.0  0
1955    Ie 1E1415        11.9     0.      17.0 FIXEDHF     0.700  0       0.0  0
1956    Ie 3E1415         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
1957    If 2D1415        -2.9     0.      -4.1 FIXEDHF     0.700  0       0.0  0  3d10p     -3d11f
1958    If 4D1415         3.7     0.       5.3 FIXEDHF     0.700  0       0.0  0
1959    If 1E1415        10.5     0.      15.0 FIXEDHF     0.700  0       0.0  0
1960    If 3E1415         6.4     0.       9.1 FIXEDHF     0.700  0       0.0  0
1961    Ig 2D1415        -2.4     0.      -3.5 FIXEDHF     0.700  0       0.0  0  3d10p     -3d12f
1962    Ig 4D1415         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
1963    Ig 1E1415         9.4     0.      13.4 FIXEDHF     0.700  0       0.0  0
1964    Ig 3E1415         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0
1965    Ih 2D1415        -2.1     0.      -3.0 FIXEDHF     0.700  0       0.0  0  3d10p     -3d13f
1966    Ih 4D1415         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
1967    Ih 1E1415         8.4     0.      12.0 FIXEDHF     0.700  0       0.0  0
1968    Ih 3E1415         5.1     0.       7.3 FIXEDHF     0.700  0       0.0  0
1969    Ii 2D1415        -1.8     0.      -2.6 FIXEDHF     0.700  0       0.0  0  3d10p     -3d14f
1970    Ii 4D1415         2.8     0.       4.0 FIXEDHF     0.700  0       0.0  0
1971    Ii 1E1415         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0
1972    Ii 3E1415         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0
1973    In 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d10p     -3d6h
1974    In 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1975    Io 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d10p     -3d7h
1976    Io 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1977    Ip 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d10p     -3d8h
1978    Ip 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1979    Iq 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d10p     -3d9h
1980    Iq 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1981    Ir 1D1437      -450.7     0.    -643.8 FIXEDHF     0.700  0       0.0  0  3d10p     -4p5s
1982    Ir 2E1437      -171.1     0.    -244.4 FIXEDHF     0.700  0       0.0  0
1983    Is 1D1437      -262.6     0.    -375.1 FIXEDHF     0.700  0       0.0  0  3d10p     -4p6s
1984    Is 2E1437       -90.3     0.    -129.0 FIXEDHF     0.700  0       0.0  0
1985    It 1D1437      -163.2     0.    -233.1 FIXEDHF     0.700  0       0.0  0  3d10p     -4p7s
1986    It 2E1437       -58.2     0.     -83.1 FIXEDHF     0.700  0       0.0  0
1987    Iu 1D1437      -106.6     0.    -152.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4p8s
1988    Iu 2E1437       -41.6     0.     -59.4 FIXEDHF     0.700  0       0.0  0
1989    Iv 1D1438       249.4     0.     356.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4p4d
1990    Iv 3D1438       106.8     0.     152.5 FIXEDHF     0.700  0       0.0  0
1991    Iv 0E1438       375.7     0.     536.7 FIXEDHF     0.700  0       0.0  0
1992    Iv 2E1438       134.1     0.     191.6 FIXEDHF     0.700  0       0.0  0
1993    Iw 1D1438       166.7     0.     238.1 FIXEDHF     0.700  0       0.0  0  3d10p     -4p5d
1994    Iw 3D1438        47.5     0.      67.9 FIXEDHF     0.700  0       0.0  0
1995    Iw 0E1438       226.3     0.     323.3 FIXEDHF     0.700  0       0.0  0
1996    Iw 2E1438        68.3     0.      97.6 FIXEDHF     0.700  0       0.0  0
1997    Ix 1D1438       118.4     0.     169.2 FIXEDHF     0.700  0       0.0  0  3d10p     -4p6d
1998    Ix 3D1438        23.6     0.      33.7 FIXEDHF     0.700  0       0.0  0
1999    Ix 0E1438       154.7     0.     221.0 FIXEDHF     0.700  0       0.0  0
2000    Ix 2E1438        42.0     0.      60.0 FIXEDHF     0.700  0       0.0  0
2001    Iy 1D1438        89.9     0.     128.4 FIXEDHF     0.700  0       0.0  0  3d10p     -4p7d
2002    Iy 3D1438        12.7     0.      18.1 FIXEDHF     0.700  0       0.0  0
2003    Iy 0E1438       114.1     0.     163.0 FIXEDHF     0.700  0       0.0  0
2004    Iy 2E1438        28.8     0.      41.2 FIXEDHF     0.700  0       0.0  0
2005    Iz 1D1438        73.1     0.     104.5 FIXEDHF     0.700  0       0.0  0  3d10p     -4p8d
2006    Iz 3D1438         7.1     0.      10.2 FIXEDHF     0.700  0       0.0  0
2007    Iz 0E1438        88.6     0.     126.6 FIXEDHF     0.700  0       0.0  0
2008    Iz 2E1438        21.3     0.      30.4 FIXEDHF     0.700  0       0.0  0
2009    JK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11p     -3d12p
2010    JK 2D1414        51.6     0.      73.7 FIXEDHF     0.700  0       0.0  0
2011    JK 1E1414        25.0     0.      35.7 FIXEDHF     0.700  0       0.0  0
2012    JK 3E1414        20.9     0.      29.8 FIXEDHF     0.700  0       0.0  0
2013    JL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11p     -3d13p
2014    JL 2D1414        44.6     0.      63.7 FIXEDHF     0.700  0       0.0  0
2015    JL 1E1414        21.6     0.      30.9 FIXEDHF     0.700  0       0.0  0
2016    JL 3E1414        18.1     0.      25.8 FIXEDHF     0.700  0       0.0  0
2017    JM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11p     -3d14p
2018    JM 2D1414        39.1     0.      55.8 FIXEDHF     0.700  0       0.0  0
2019    JM 1E1414        19.0     0.      27.1 FIXEDHF     0.700  0       0.0  0
2020    JM 3E1414        15.8     0.      22.6 FIXEDHF     0.700  0       0.0  0
2021    JN 2D1425         8.9     0.      12.7 FIXEDHF     0.700  0       0.0  0  3d11p     -4s4f
2022    JN 1E1425       -44.0     0.     -62.8 FIXEDHF     0.700  0       0.0  0
2023    JO 2D1425         6.8     0.       9.7 FIXEDHF     0.700  0       0.0  0  3d11p     -4s5f
2024    JO 1E1425       -41.9     0.     -59.9 FIXEDHF     0.700  0       0.0  0
2025    JP 2D1425         5.0     0.       7.2 FIXEDHF     0.700  0       0.0  0  3d11p     -4s6f
2026    JP 1E1425       -36.8     0.     -52.5 FIXEDHF     0.700  0       0.0  0
2027    JQ 2D1425         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0  3d11p     -4s7f
2028    JQ 1E1425       -31.8     0.     -45.4 FIXEDHF     0.700  0       0.0  0
2029    JR 2D1425         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0  3d11p     -4s8f
2030    JR 1E1425       -27.6     0.     -39.4 FIXEDHF     0.700  0       0.0  0
2031    JS 2D1425         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0  3d11p     -4s9f
2032    JS 1E1425       -24.1     0.     -34.4 FIXEDHF     0.700  0       0.0  0
2033    JT 2D1425         2.8     0.       4.0 FIXEDHF     0.700  0       0.0  0  3d11p     -4s10f
2034    JT 1E1425       -21.2     0.     -30.3 FIXEDHF     0.700  0       0.0  0
2035    JU 2D1425         2.4     0.       3.4 FIXEDHF     0.700  0       0.0  0  3d11p     -4s11f
2036    JU 1E1425       -18.9     0.     -27.0 FIXEDHF     0.700  0       0.0  0
2037    JV 2D1425         2.0     0.       2.9 FIXEDHF     0.700  0       0.0  0  3d11p     -4s12f
2038    JV 1E1425       -16.9     0.     -24.2 FIXEDHF     0.700  0       0.0  0
2039    JW 2D1425         1.7     0.       2.4 FIXEDHF     0.700  0       0.0  0  3d11p     -4s13f
2040    JW 1E1425       -15.3     0.     -21.8 FIXEDHF     0.700  0       0.0  0
2041    JX 2D1425         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0  3d11p     -4s14f
2042    JX 1E1425       -13.9     0.     -19.8 FIXEDHF     0.700  0       0.0  0
2043    JY 2D1415        -5.1     0.      -7.3 FIXEDHF     0.700  0       0.0  0  3d11p     -3d4f
2044    JY 4D1415         5.5     0.       7.9 FIXEDHF     0.700  0       0.0  0
2045    JY 1E1415        23.4     0.      33.4 FIXEDHF     0.700  0       0.0  0
2046    JY 3E1415        13.4     0.      19.1 FIXEDHF     0.700  0       0.0  0
2047    JZ 2D1415        -4.3     0.      -6.2 FIXEDHF     0.700  0       0.0  0  3d11p     -3d5f
2048    JZ 4D1415         5.9     0.       8.4 FIXEDHF     0.700  0       0.0  0
2049    JZ 1E1415        21.3     0.      30.5 FIXEDHF     0.700  0       0.0  0
2050    JZ 3E1415        12.5     0.      17.8 FIXEDHF     0.700  0       0.0  0
2051    Ja 2D1415        -3.6     0.      -5.1 FIXEDHF     0.700  0       0.0  0  3d11p     -3d6f
2052    Ja 4D1415         5.5     0.       7.8 FIXEDHF     0.700  0       0.0  0
2053    Ja 1E1415        18.1     0.      25.9 FIXEDHF     0.700  0       0.0  0
2054    Ja 3E1415        10.7     0.      15.3 FIXEDHF     0.700  0       0.0  0
2055    Jb 2D1415        -3.0     0.      -4.3 FIXEDHF     0.700  0       0.0  0  3d11p     -3d7f
2056    Jb 4D1415         4.9     0.       7.0 FIXEDHF     0.700  0       0.0  0
2057    Jb 1E1415        15.3     0.      21.9 FIXEDHF     0.700  0       0.0  0
2058    Jb 3E1415         9.1     0.      13.0 FIXEDHF     0.700  0       0.0  0
2059    Jc 2D1415        -2.6     0.      -3.7 FIXEDHF     0.700  0       0.0  0  3d11p     -3d8f
2060    Jc 4D1415         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
2061    Jc 1E1415        13.1     0.      18.7 FIXEDHF     0.700  0       0.0  0
2062    Jc 3E1415         7.8     0.      11.2 FIXEDHF     0.700  0       0.0  0
2063    Jd 2D1415        -2.3     0.      -3.3 FIXEDHF     0.700  0       0.0  0  3d11p     -3d9f
2064    Jd 4D1415         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
2065    Jd 1E1415        11.3     0.      16.2 FIXEDHF     0.700  0       0.0  0
2066    Jd 3E1415         6.8     0.       9.7 FIXEDHF     0.700  0       0.0  0
2067    Je 2D1415        -2.5     0.      -3.6 FIXEDHF     0.700  0       0.0  0  3d11p     -3d10f
2068    Je 4D1415         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0
2069    Je 1E1415         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0
2070    Je 3E1415         5.9     0.       8.5 FIXEDHF     0.700  0       0.0  0
2071    Jf 2D1415        -2.2     0.      -3.2 FIXEDHF     0.700  0       0.0  0  3d11p     -3d11f
2072    Jf 4D1415         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
2073    Jf 1E1415         8.8     0.      12.5 FIXEDHF     0.700  0       0.0  0
2074    Jf 3E1415         5.3     0.       7.5 FIXEDHF     0.700  0       0.0  0
2075    Jg 2D1415        -2.0     0.      -2.8 FIXEDHF     0.700  0       0.0  0  3d11p     -3d12f
2076    Jg 4D1415         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0
2077    Jg 1E1415         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0
2078    Jg 3E1415         4.7     0.       6.7 FIXEDHF     0.700  0       0.0  0
2079    Jh 2D1415        -1.8     0.      -2.5 FIXEDHF     0.700  0       0.0  0  3d11p     -3d13f
2080    Jh 4D1415         2.5     0.       3.6 FIXEDHF     0.700  0       0.0  0
2081    Jh 1E1415         7.0     0.      10.0 FIXEDHF     0.700  0       0.0  0
2082    Jh 3E1415         4.3     0.       6.1 FIXEDHF     0.700  0       0.0  0
2083    Ji 2D1415        -1.5     0.      -2.2 FIXEDHF     0.700  0       0.0  0  3d11p     -3d14f
2084    Ji 4D1415         2.3     0.       3.3 FIXEDHF     0.700  0       0.0  0
2085    Ji 1E1415         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
2086    Ji 3E1415         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
2087    Jn 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11p     -3d6h
2088    Jn 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2089    Jo 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11p     -3d7h
2090    Jo 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2091    Jp 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11p     -3d8h
2092    Jp 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2093    Jq 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11p     -3d9h
2094    Jq 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2095    Jr 1D1437      -377.9     0.    -539.9 FIXEDHF     0.700  0       0.0  0  3d11p     -4p5s
2096    Jr 2E1437      -143.6     0.    -205.1 FIXEDHF     0.700  0       0.0  0
2097    Js 1D1437      -221.8     0.    -316.8 FIXEDHF     0.700  0       0.0  0  3d11p     -4p6s
2098    Js 2E1437       -75.9     0.    -108.4 FIXEDHF     0.700  0       0.0  0
2099    Jt 1D1437      -139.2     0.    -198.9 FIXEDHF     0.700  0       0.0  0  3d11p     -4p7s
2100    Jt 2E1437       -48.9     0.     -69.9 FIXEDHF     0.700  0       0.0  0
2101    Ju 1D1437       -92.5     0.    -132.1 FIXEDHF     0.700  0       0.0  0  3d11p     -4p8s
2102    Ju 2E1437       -35.0     0.     -50.0 FIXEDHF     0.700  0       0.0  0
2103    Jv 1D1438       208.7     0.     298.2 FIXEDHF     0.700  0       0.0  0  3d11p     -4p4d
2104    Jv 3D1438        90.7     0.     129.6 FIXEDHF     0.700  0       0.0  0
2105    Jv 0E1438       312.4     0.     446.3 FIXEDHF     0.700  0       0.0  0
2106    Jv 2E1438       113.1     0.     161.6 FIXEDHF     0.700  0       0.0  0
2107    Jw 1D1438       139.5     0.     199.3 FIXEDHF     0.700  0       0.0  0  3d11p     -4p5d
2108    Jw 3D1438        41.2     0.      58.8 FIXEDHF     0.700  0       0.0  0
2109    Jw 0E1438       188.4     0.     269.1 FIXEDHF     0.700  0       0.0  0
2110    Jw 2E1438        57.9     0.      82.7 FIXEDHF     0.700  0       0.0  0
2111    Jx 1D1438        98.8     0.     141.2 FIXEDHF     0.700  0       0.0  0  3d11p     -4p6d
2112    Jx 3D1438        20.9     0.      29.8 FIXEDHF     0.700  0       0.0  0
2113    Jx 0E1438       128.8     0.     184.0 FIXEDHF     0.700  0       0.0  0
2114    Jx 2E1438        35.7     0.      51.0 FIXEDHF     0.700  0       0.0  0
2115    Jy 1D1438        74.3     0.     106.1 FIXEDHF     0.700  0       0.0  0  3d11p     -4p7d
2116    Jy 3D1438        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0
2117    Jy 0E1438        95.1     0.     135.8 FIXEDHF     0.700  0       0.0  0
2118    Jy 2E1438        24.6     0.      35.1 FIXEDHF     0.700  0       0.0  0
2119    Jz 1D1438        58.9     0.      84.2 FIXEDHF     0.700  0       0.0  0  3d11p     -4p8d
2120    Jz 3D1438         6.8     0.       9.7 FIXEDHF     0.700  0       0.0  0
2121    Jz 0E1438        73.8     0.     105.5 FIXEDHF     0.700  0       0.0  0
2122    Jz 2E1438        18.2     0.      26.0 FIXEDHF     0.700  0       0.0  0
2123    KL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d12p     -3d13p
2124    KL 2D1414        38.2     0.      54.6 FIXEDHF     0.700  0       0.0  0
2125    KL 1E1414        18.4     0.      26.3 FIXEDHF     0.700  0       0.0  0
2126    KL 3E1414        15.4     0.      22.0 FIXEDHF     0.700  0       0.0  0
2127    KM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d12p     -3d14p
2128    KM 2D1414        33.5     0.      47.8 FIXEDHF     0.700  0       0.0  0
2129    KM 1E1414        16.1     0.      23.0 FIXEDHF     0.700  0       0.0  0
2130    KM 3E1414        13.5     0.      19.3 FIXEDHF     0.700  0       0.0  0
2131    KN 2D1425         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0  3d12p     -4s4f
2132    KN 1E1425       -37.2     0.     -53.2 FIXEDHF     0.700  0       0.0  0
2133    KO 2D1425         5.9     0.       8.4 FIXEDHF     0.700  0       0.0  0  3d12p     -4s5f
2134    KO 1E1425       -35.5     0.     -50.7 FIXEDHF     0.700  0       0.0  0
2135    KP 2D1425         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0  3d12p     -4s6f
2136    KP 1E1425       -31.1     0.     -44.5 FIXEDHF     0.700  0       0.0  0
2137    KQ 2D1425         3.3     0.       4.7 FIXEDHF     0.700  0       0.0  0  3d12p     -4s7f
2138    KQ 1E1425       -26.9     0.     -38.5 FIXEDHF     0.700  0       0.0  0
2139    KR 2D1425         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0  3d12p     -4s8f
2140    KR 1E1425       -23.4     0.     -33.4 FIXEDHF     0.700  0       0.0  0
2141    KS 2D1425         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0  3d12p     -4s9f
2142    KS 1E1425       -20.4     0.     -29.2 FIXEDHF     0.700  0       0.0  0
2143    KT 2D1425         1.8     0.       2.5 FIXEDHF     0.700  0       0.0  0  3d12p     -4s10f
2144    KT 1E1425       -18.0     0.     -25.7 FIXEDHF     0.700  0       0.0  0
2145    KU 2D1425         1.9     0.       2.7 FIXEDHF     0.700  0       0.0  0  3d12p     -4s11f
2146    KU 1E1425       -16.0     0.     -22.9 FIXEDHF     0.700  0       0.0  0
2147    KV 2D1425         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0  3d12p     -4s12f
2148    KV 1E1425       -14.3     0.     -20.5 FIXEDHF     0.700  0       0.0  0
2149    KW 2D1425         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0  3d12p     -4s13f
2150    KW 1E1425       -12.9     0.     -18.5 FIXEDHF     0.700  0       0.0  0
2151    KX 2D1425         1.2     0.       1.7 FIXEDHF     0.700  0       0.0  0  3d12p     -4s14f
2152    KX 1E1425       -11.8     0.     -16.8 FIXEDHF     0.700  0       0.0  0
2153    KY 2D1415        -4.4     0.      -6.3 FIXEDHF     0.700  0       0.0  0  3d12p     -3d4f
2154    KY 4D1415         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0
2155    KY 1E1415        19.8     0.      28.3 FIXEDHF     0.700  0       0.0  0
2156    KY 3E1415        11.3     0.      16.2 FIXEDHF     0.700  0       0.0  0
2157    KZ 2D1415        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0  3d12p     -3d5f
2158    KZ 4D1415         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0
2159    KZ 1E1415        18.1     0.      25.8 FIXEDHF     0.700  0       0.0  0
2160    KZ 3E1415        10.6     0.      15.1 FIXEDHF     0.700  0       0.0  0
2161    Ka 2D1415        -3.1     0.      -4.4 FIXEDHF     0.700  0       0.0  0  3d12p     -3d6f
2162    Ka 4D1415         4.5     0.       6.5 FIXEDHF     0.700  0       0.0  0
2163    Ka 1E1415        15.3     0.      21.9 FIXEDHF     0.700  0       0.0  0
2164    Ka 3E1415         9.1     0.      13.0 FIXEDHF     0.700  0       0.0  0
2165    Kb 2D1415        -2.5     0.      -3.6 FIXEDHF     0.700  0       0.0  0  3d12p     -3d7f
2166    Kb 4D1415         4.1     0.       5.8 FIXEDHF     0.700  0       0.0  0
2167    Kb 1E1415        13.0     0.      18.6 FIXEDHF     0.700  0       0.0  0
2168    Kb 3E1415         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0
2169    Kc 2D1415        -2.2     0.      -3.1 FIXEDHF     0.700  0       0.0  0  3d12p     -3d8f
2170    Kc 4D1415         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
2171    Kc 1E1415        11.1     0.      15.9 FIXEDHF     0.700  0       0.0  0
2172    Kc 3E1415         6.6     0.       9.5 FIXEDHF     0.700  0       0.0  0
2173    Kd 2D1415        -1.9     0.      -2.7 FIXEDHF     0.700  0       0.0  0  3d12p     -3d9f
2174    Kd 4D1415         3.2     0.       4.6 FIXEDHF     0.700  0       0.0  0
2175    Kd 1E1415         9.6     0.      13.7 FIXEDHF     0.700  0       0.0  0
2176    Kd 3E1415         5.7     0.       8.2 FIXEDHF     0.700  0       0.0  0
2177    Ke 2D1415        -1.7     0.      -2.4 FIXEDHF     0.700  0       0.0  0  3d12p     -3d10f
2178    Ke 4D1415         2.9     0.       4.1 FIXEDHF     0.700  0       0.0  0
2179    Ke 1E1415         8.4     0.      12.0 FIXEDHF     0.700  0       0.0  0
2180    Ke 3E1415         5.0     0.       7.2 FIXEDHF     0.700  0       0.0  0
2181    Kf 2D1415        -1.8     0.      -2.5 FIXEDHF     0.700  0       0.0  0  3d12p     -3d11f
2182    Kf 4D1415         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0
2183    Kf 1E1415         7.4     0.      10.6 FIXEDHF     0.700  0       0.0  0
2184    Kf 3E1415         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0
2185    Kg 2D1415        -1.6     0.      -2.3 FIXEDHF     0.700  0       0.0  0  3d12p     -3d12f
2186    Kg 4D1415         2.3     0.       3.3 FIXEDHF     0.700  0       0.0  0
2187    Kg 1E1415         6.6     0.       9.4 FIXEDHF     0.700  0       0.0  0
2188    Kg 3E1415         4.0     0.       5.7 FIXEDHF     0.700  0       0.0  0
2189    Kh 2D1415        -1.4     0.      -2.0 FIXEDHF     0.700  0       0.0  0  3d12p     -3d13f
2190    Kh 4D1415         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0
2191    Kh 1E1415         5.9     0.       8.5 FIXEDHF     0.700  0       0.0  0
2192    Kh 3E1415         3.6     0.       5.1 FIXEDHF     0.700  0       0.0  0
2193    Ki 2D1415        -1.3     0.      -1.8 FIXEDHF     0.700  0       0.0  0  3d12p     -3d14f
2194    Ki 4D1415         1.9     0.       2.7 FIXEDHF     0.700  0       0.0  0
2195    Ki 1E1415         5.4     0.       7.7 FIXEDHF     0.700  0       0.0  0
2196    Ki 3E1415         3.2     0.       4.6 FIXEDHF     0.700  0       0.0  0
2197    Kn 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12p     -3d6h
2198    Kn 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2199    Ko 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12p     -3d7h
2200    Ko 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2201    Kp 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12p     -3d8h
2202    Kp 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2203    Kq 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12p     -3d9h
2204    Kq 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2205    Kr 1D1437      -323.0     0.    -461.5 FIXEDHF     0.700  0       0.0  0  3d12p     -4p5s
2206    Kr 2E1437      -122.7     0.    -175.3 FIXEDHF     0.700  0       0.0  0
2207    Ks 1D1437      -190.5     0.    -272.1 FIXEDHF     0.700  0       0.0  0  3d12p     -4p6s
2208    Ks 2E1437       -65.0     0.     -92.8 FIXEDHF     0.700  0       0.0  0
2209    Kt 1D1437      -120.5     0.    -172.1 FIXEDHF     0.700  0       0.0  0  3d12p     -4p7s
2210    Kt 2E1437       -41.9     0.     -59.9 FIXEDHF     0.700  0       0.0  0
2211    Ku 1D1437       -80.8     0.    -115.5 FIXEDHF     0.700  0       0.0  0  3d12p     -4p8s
2212    Ku 2E1437       -30.0     0.     -42.8 FIXEDHF     0.700  0       0.0  0
2213    Kv 1D1438       178.2     0.     254.6 FIXEDHF     0.700  0       0.0  0  3d12p     -4p4d
2214    Kv 3D1438        78.3     0.     111.8 FIXEDHF     0.700  0       0.0  0
2215    Kv 0E1438       265.2     0.     378.8 FIXEDHF     0.700  0       0.0  0
2216    Kv 2E1438        97.0     0.     138.6 FIXEDHF     0.700  0       0.0  0
2217    Kw 1D1438       119.2     0.     170.3 FIXEDHF     0.700  0       0.0  0  3d12p     -4p5d
2218    Kw 3D1438        35.9     0.      51.3 FIXEDHF     0.700  0       0.0  0
2219    Kw 0E1438       160.0     0.     228.6 FIXEDHF     0.700  0       0.0  0
2220    Kw 2E1438        49.8     0.      71.2 FIXEDHF     0.700  0       0.0  0
2221    Kx 1D1438        84.3     0.     120.4 FIXEDHF     0.700  0       0.0  0  3d12p     -4p6d
2222    Kx 3D1438        18.5     0.      26.5 FIXEDHF     0.700  0       0.0  0
2223    Kx 0E1438       109.4     0.     156.3 FIXEDHF     0.700  0       0.0  0
2224    Kx 2E1438        30.8     0.      44.0 FIXEDHF     0.700  0       0.0  0
2225    Ky 1D1438        63.1     0.      90.1 FIXEDHF     0.700  0       0.0  0  3d12p     -4p7d
2226    Ky 3D1438        10.4     0.      14.9 FIXEDHF     0.700  0       0.0  0
2227    Ky 0E1438        80.8     0.     115.4 FIXEDHF     0.700  0       0.0  0
2228    Ky 2E1438        21.3     0.      30.4 FIXEDHF     0.700  0       0.0  0
2229    Kz 1D1438        49.6     0.      70.9 FIXEDHF     0.700  0       0.0  0  3d12p     -4p8d
2230    Kz 3D1438         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
2231    Kz 0E1438        62.7     0.      89.6 FIXEDHF     0.700  0       0.0  0
2232    Kz 2E1438        15.7     0.      22.5 FIXEDHF     0.700  0       0.0  0
2233    LM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d13p     -3d14p
2234    LM 2D1414        29.0     0.      41.5 FIXEDHF     0.700  0       0.0  0
2235    LM 1E1414        13.9     0.      19.9 FIXEDHF     0.700  0       0.0  0
2236    LM 3E1414        11.7     0.      16.7 FIXEDHF     0.700  0       0.0  0
2237    LN 2D1425         6.7     0.       9.6 FIXEDHF     0.700  0       0.0  0  3d13p     -4s4f
2238    LN 1E1425       -32.1     0.     -45.8 FIXEDHF     0.700  0       0.0  0
2239    LO 2D1425         5.2     0.       7.4 FIXEDHF     0.700  0       0.0  0  3d13p     -4s5f
2240    LO 1E1425       -30.6     0.     -43.7 FIXEDHF     0.700  0       0.0  0
2241    LP 2D1425         3.8     0.       5.4 FIXEDHF     0.700  0       0.0  0  3d13p     -4s6f
2242    LP 1E1425       -26.8     0.     -38.3 FIXEDHF     0.700  0       0.0  0
2243    LQ 2D1425         2.9     0.       4.1 FIXEDHF     0.700  0       0.0  0  3d13p     -4s7f
2244    LQ 1E1425       -23.2     0.     -33.1 FIXEDHF     0.700  0       0.0  0
2245    LR 2D1425         2.2     0.       3.2 FIXEDHF     0.700  0       0.0  0  3d13p     -4s8f
2246    LR 1E1425       -20.2     0.     -28.8 FIXEDHF     0.700  0       0.0  0
2247    LS 2D1425         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0  3d13p     -4s9f
2248    LS 1E1425       -17.6     0.     -25.1 FIXEDHF     0.700  0       0.0  0
2249    LT 2D1425         1.5     0.       2.2 FIXEDHF     0.700  0       0.0  0  3d13p     -4s10f
2250    LT 1E1425       -15.5     0.     -22.2 FIXEDHF     0.700  0       0.0  0
2251    LU 2D1425         1.3     0.       1.8 FIXEDHF     0.700  0       0.0  0  3d13p     -4s11f
2252    LU 1E1425       -13.8     0.     -19.7 FIXEDHF     0.700  0       0.0  0
2253    LV 2D1425         1.3     0.       1.9 FIXEDHF     0.700  0       0.0  0  3d13p     -4s12f
2254    LV 1E1425       -12.4     0.     -17.7 FIXEDHF     0.700  0       0.0  0
2255    LW 2D1425         1.2     0.       1.7 FIXEDHF     0.700  0       0.0  0  3d13p     -4s13f
2256    LW 1E1425       -11.1     0.     -15.9 FIXEDHF     0.700  0       0.0  0
2257    LX 2D1425         1.1     0.       1.5 FIXEDHF     0.700  0       0.0  0  3d13p     -4s14f
2258    LX 1E1425       -10.1     0.     -14.5 FIXEDHF     0.700  0       0.0  0
2259    LY 2D1415        -3.8     0.      -5.5 FIXEDHF     0.700  0       0.0  0  3d13p     -3d4f
2260    LY 4D1415         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
2261    LY 1E1415        17.1     0.      24.4 FIXEDHF     0.700  0       0.0  0
2262    LY 3E1415         9.8     0.      14.0 FIXEDHF     0.700  0       0.0  0
2263    LZ 2D1415        -3.3     0.      -4.7 FIXEDHF     0.700  0       0.0  0  3d13p     -3d5f
2264    LZ 4D1415         4.2     0.       6.0 FIXEDHF     0.700  0       0.0  0
2265    LZ 1E1415        15.6     0.      22.3 FIXEDHF     0.700  0       0.0  0
2266    LZ 3E1415         9.1     0.      13.0 FIXEDHF     0.700  0       0.0  0
2267    La 2D1415        -2.7     0.      -3.8 FIXEDHF     0.700  0       0.0  0  3d13p     -3d6f
2268    La 4D1415         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
2269    La 1E1415        13.2     0.      18.9 FIXEDHF     0.700  0       0.0  0
2270    La 3E1415         7.8     0.      11.2 FIXEDHF     0.700  0       0.0  0
2271    Lb 2D1415        -2.2     0.      -3.2 FIXEDHF     0.700  0       0.0  0  3d13p     -3d7f
2272    Lb 4D1415         3.5     0.       5.0 FIXEDHF     0.700  0       0.0  0
2273    Lb 1E1415        11.2     0.      16.0 FIXEDHF     0.700  0       0.0  0
2274    Lb 3E1415         6.6     0.       9.5 FIXEDHF     0.700  0       0.0  0
2275    Lc 2D1415        -1.9     0.      -2.7 FIXEDHF     0.700  0       0.0  0  3d13p     -3d8f
2276    Lc 4D1415         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
2277    Lc 1E1415         9.6     0.      13.7 FIXEDHF     0.700  0       0.0  0
2278    Lc 3E1415         5.7     0.       8.2 FIXEDHF     0.700  0       0.0  0
2279    Ld 2D1415        -1.6     0.      -2.3 FIXEDHF     0.700  0       0.0  0  3d13p     -3d9f
2280    Ld 4D1415         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0
2281    Ld 1E1415         8.3     0.      11.8 FIXEDHF     0.700  0       0.0  0
2282    Ld 3E1415         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0
2283    Le 2D1415        -1.4     0.      -2.0 FIXEDHF     0.700  0       0.0  0  3d13p     -3d10f
2284    Le 4D1415         2.4     0.       3.5 FIXEDHF     0.700  0       0.0  0
2285    Le 1E1415         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
2286    Le 3E1415         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
2287    Lf 2D1415        -1.3     0.      -1.8 FIXEDHF     0.700  0       0.0  0  3d13p     -3d11f
2288    Lf 4D1415         2.2     0.       3.1 FIXEDHF     0.700  0       0.0  0
2289    Lf 1E1415         6.4     0.       9.1 FIXEDHF     0.700  0       0.0  0
2290    Lf 3E1415         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
2291    Lg 2D1415        -1.3     0.      -1.8 FIXEDHF     0.700  0       0.0  0  3d13p     -3d12f
2292    Lg 4D1415         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0
2293    Lg 1E1415         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0
2294    Lg 3E1415         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0
2295    Lh 2D1415        -1.1     0.      -1.6 FIXEDHF     0.700  0       0.0  0  3d13p     -3d13f
2296    Lh 4D1415         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0
2297    Lh 1E1415         5.1     0.       7.3 FIXEDHF     0.700  0       0.0  0
2298    Lh 3E1415         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
2299    Li 2D1415        -1.1     0.      -1.5 FIXEDHF     0.700  0       0.0  0  3d13p     -3d14f
2300    Li 4D1415         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0
2301    Li 1E1415         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0
2302    Li 3E1415         2.8     0.       4.0 FIXEDHF     0.700  0       0.0  0
2303    Ln 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13p     -3d6h
2304    Ln 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2305    Lo 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13p     -3d7h
2306    Lo 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2307    Lp 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13p     -3d8h
2308    Lp 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2309    Lq 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13p     -3d9h
2310    Lq 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2311    Lr 1D1437      -280.3     0.    -400.4 FIXEDHF     0.700  0       0.0  0  3d13p     -4p5s
2312    Lr 2E1437      -106.5     0.    -152.1 FIXEDHF     0.700  0       0.0  0
2313    Ls 1D1437      -166.0     0.    -237.1 FIXEDHF     0.700  0       0.0  0  3d13p     -4p6s
2314    Ls 2E1437       -56.4     0.     -80.6 FIXEDHF     0.700  0       0.0  0
2315    Lt 1D1437      -105.5     0.    -150.7 FIXEDHF     0.700  0       0.0  0  3d13p     -4p7s
2316    Lt 2E1437       -36.4     0.     -52.0 FIXEDHF     0.700  0       0.0  0
2317    Lu 1D1437       -71.3     0.    -101.8 FIXEDHF     0.700  0       0.0  0  3d13p     -4p8s
2318    Lu 2E1437       -26.0     0.     -37.2 FIXEDHF     0.700  0       0.0  0
2319    Lv 1D1438       154.6     0.     220.8 FIXEDHF     0.700  0       0.0  0  3d13p     -4p4d
2320    Lv 3D1438        68.5     0.      97.8 FIXEDHF     0.700  0       0.0  0
2321    Lv 0E1438       228.7     0.     326.7 FIXEDHF     0.700  0       0.0  0
2322    Lv 2E1438        84.4     0.     120.6 FIXEDHF     0.700  0       0.0  0
2323    Lw 1D1438       103.5     0.     147.8 FIXEDHF     0.700  0       0.0  0  3d13p     -4p5d
2324    Lw 3D1438        31.7     0.      45.3 FIXEDHF     0.700  0       0.0  0
2325    Lw 0E1438       138.1     0.     197.3 FIXEDHF     0.700  0       0.0  0
2326    Lw 2E1438        43.5     0.      62.2 FIXEDHF     0.700  0       0.0  0
2327    Lx 1D1438        73.1     0.     104.5 FIXEDHF     0.700  0       0.0  0  3d13p     -4p6d
2328    Lx 3D1438        16.6     0.      23.7 FIXEDHF     0.700  0       0.0  0
2329    Lx 0E1438        94.5     0.     135.0 FIXEDHF     0.700  0       0.0  0
2330    Lx 2E1438        26.9     0.      38.5 FIXEDHF     0.700  0       0.0  0
2331    Ly 1D1438        54.6     0.      78.0 FIXEDHF     0.700  0       0.0  0  3d13p     -4p7d
2332    Ly 3D1438         9.4     0.      13.5 FIXEDHF     0.700  0       0.0  0
2333    Ly 0E1438        69.7     0.      99.6 FIXEDHF     0.700  0       0.0  0
2334    Ly 2E1438        18.6     0.      26.6 FIXEDHF     0.700  0       0.0  0
2335    Lz 1D1438        42.8     0.      61.1 FIXEDHF     0.700  0       0.0  0  3d13p     -4p8d
2336    Lz 3D1438         5.8     0.       8.3 FIXEDHF     0.700  0       0.0  0
2337    Lz 0E1438        54.2     0.      77.4 FIXEDHF     0.700  0       0.0  0
2338    Lz 2E1438        13.8     0.      19.7 FIXEDHF     0.700  0       0.0  0
2339    MN 2D1425         5.9     0.       8.5 FIXEDHF     0.700  0       0.0  0  3d14p     -4s4f
2340    MN 1E1425       -28.0     0.     -40.0 FIXEDHF     0.700  0       0.0  0
2341    MO 2D1425         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0  3d14p     -4s5f
2342    MO 1E1425       -26.7     0.     -38.2 FIXEDHF     0.700  0       0.0  0
2343    MP 2D1425         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0  3d14p     -4s6f
2344    MP 1E1425       -23.4     0.     -33.5 FIXEDHF     0.700  0       0.0  0
2345    MQ 2D1425         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0  3d14p     -4s7f
2346    MQ 1E1425       -20.2     0.     -28.9 FIXEDHF     0.700  0       0.0  0
2347    MR 2D1425         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0  3d14p     -4s8f
2348    MR 1E1425       -17.6     0.     -25.1 FIXEDHF     0.700  0       0.0  0
2349    MS 2D1425         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0  3d14p     -4s9f
2350    MS 1E1425       -15.4     0.     -22.0 FIXEDHF     0.700  0       0.0  0
2351    MT 2D1425         1.3     0.       1.9 FIXEDHF     0.700  0       0.0  0  3d14p     -4s10f
2352    MT 1E1425       -13.6     0.     -19.4 FIXEDHF     0.700  0       0.0  0
2353    MU 2D1425         1.1     0.       1.6 FIXEDHF     0.700  0       0.0  0  3d14p     -4s11f
2354    MU 1E1425       -12.0     0.     -17.2 FIXEDHF     0.700  0       0.0  0
2355    MV 2D1425         1.0     0.       1.4 FIXEDHF     0.700  0       0.0  0  3d14p     -4s12f
2356    MV 1E1425       -10.8     0.     -15.4 FIXEDHF     0.700  0       0.0  0
2357    MW 2D1425         1.0     0.       1.4 FIXEDHF     0.700  0       0.0  0  3d14p     -4s13f
2358    MW 1E1425        -9.7     0.     -13.9 FIXEDHF     0.700  0       0.0  0
2359    MX 2D1425         0.8     0.       1.2 FIXEDHF     0.700  0       0.0  0  3d14p     -4s14f
2360    MX 1E1425        -8.8     0.     -12.6 FIXEDHF     0.700  0       0.0  0
2361    MY 2D1415        -3.4     0.      -4.9 FIXEDHF     0.700  0       0.0  0  3d14p     -3d4f
2362    MY 4D1415         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
2363    MY 1E1415        14.9     0.      21.3 FIXEDHF     0.700  0       0.0  0
2364    MY 3E1415         8.5     0.      12.2 FIXEDHF     0.700  0       0.0  0
2365    MZ 2D1415        -2.9     0.      -4.2 FIXEDHF     0.700  0       0.0  0  3d14p     -3d5f
2366    MZ 4D1415         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
2367    MZ 1E1415        13.6     0.      19.4 FIXEDHF     0.700  0       0.0  0
2368    MZ 3E1415         7.9     0.      11.3 FIXEDHF     0.700  0       0.0  0
2369    Ma 2D1415        -2.4     0.      -3.4 FIXEDHF     0.700  0       0.0  0  3d14p     -3d6f
2370    Ma 4D1415         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
2371    Ma 1E1415        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0
2372    Ma 3E1415         6.9     0.       9.8 FIXEDHF     0.700  0       0.0  0
2373    Mb 2D1415        -2.0     0.      -2.8 FIXEDHF     0.700  0       0.0  0  3d14p     -3d7f
2374    Mb 4D1415         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
2375    Mb 1E1415         9.8     0.      14.0 FIXEDHF     0.700  0       0.0  0
2376    Mb 3E1415         5.8     0.       8.3 FIXEDHF     0.700  0       0.0  0
2377    Mc 2D1415        -1.6     0.      -2.3 FIXEDHF     0.700  0       0.0  0  3d14p     -3d8f
2378    Mc 4D1415         2.7     0.       3.8 FIXEDHF     0.700  0       0.0  0
2379    Mc 1E1415         8.4     0.      12.0 FIXEDHF     0.700  0       0.0  0
2380    Mc 3E1415         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0
2381    Md 2D1415        -1.4     0.      -2.0 FIXEDHF     0.700  0       0.0  0  3d14p     -3d9f
2382    Md 4D1415         2.4     0.       3.4 FIXEDHF     0.700  0       0.0  0
2383    Md 1E1415         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
2384    Md 3E1415         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
2385    Me 2D1415        -1.2     0.      -1.7 FIXEDHF     0.700  0       0.0  0  3d14p     -3d10f
2386    Me 4D1415         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0
2387    Me 1E1415         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
2388    Me 3E1415         3.8     0.       5.4 FIXEDHF     0.700  0       0.0  0
2389    Mf 2D1415        -1.1     0.      -1.5 FIXEDHF     0.700  0       0.0  0  3d14p     -3d11f
2390    Mf 4D1415         1.9     0.       2.7 FIXEDHF     0.700  0       0.0  0
2391    Mf 1E1415         5.6     0.       8.0 FIXEDHF     0.700  0       0.0  0
2392    Mf 3E1415         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
2393    Mg 2D1415        -1.0     0.      -1.4 FIXEDHF     0.700  0       0.0  0  3d14p     -3d12f
2394    Mg 4D1415         1.7     0.       2.4 FIXEDHF     0.700  0       0.0  0
2395    Mg 1E1415         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0
2396    Mg 3E1415         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
2397    Mh 2D1415        -1.0     0.      -1.4 FIXEDHF     0.700  0       0.0  0  3d14p     -3d13f
2398    Mh 4D1415         1.5     0.       2.2 FIXEDHF     0.700  0       0.0  0
2399    Mh 1E1415         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0
2400    Mh 3E1415         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0
2401    Mi 2D1415        -0.9     0.      -1.3 FIXEDHF     0.700  0       0.0  0  3d14p     -3d14f
2402    Mi 4D1415         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0
2403    Mi 1E1415         4.1     0.       5.8 FIXEDHF     0.700  0       0.0  0
2404    Mi 3E1415         2.4     0.       3.5 FIXEDHF     0.700  0       0.0  0
2405    Mn 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14p     -3d6h
2406    Mn 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2407    Mo 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14p     -3d7h
2408    Mo 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2409    Mp 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14p     -3d8h
2410    Mp 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2411    Mq 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14p     -3d9h
2412    Mq 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2413    Mr 1D1437      -246.2     0.    -351.7 FIXEDHF     0.700  0       0.0  0  3d14p     -4p5s
2414    Mr 2E1437       -93.4     0.    -133.5 FIXEDHF     0.700  0       0.0  0
2415    Ms 1D1437      -146.2     0.    -208.9 FIXEDHF     0.700  0       0.0  0  3d14p     -4p6s
2416    Ms 2E1437       -49.6     0.     -70.8 FIXEDHF     0.700  0       0.0  0
2417    Mt 1D1437       -93.3     0.    -133.3 FIXEDHF     0.700  0       0.0  0  3d14p     -4p7s
2418    Mt 2E1437       -32.0     0.     -45.7 FIXEDHF     0.700  0       0.0  0
2419    Mu 1D1437       -63.4     0.     -90.6 FIXEDHF     0.700  0       0.0  0  3d14p     -4p8s
2420    Mu 2E1437       -22.9     0.     -32.7 FIXEDHF     0.700  0       0.0  0
2421    Mv 1D1438       135.7     0.     193.9 FIXEDHF     0.700  0       0.0  0  3d14p     -4p4d
2422    Mv 3D1438        60.5     0.      86.4 FIXEDHF     0.700  0       0.0  0
2423    Mv 0E1438       199.8     0.     285.5 FIXEDHF     0.700  0       0.0  0
2424    Mv 2E1438        74.3     0.     106.1 FIXEDHF     0.700  0       0.0  0
2425    Mw 1D1438        90.9     0.     129.9 FIXEDHF     0.700  0       0.0  0  3d14p     -4p5d
2426    Mw 3D1438        28.3     0.      40.4 FIXEDHF     0.700  0       0.0  0
2427    Mw 0E1438       120.7     0.     172.5 FIXEDHF     0.700  0       0.0  0
2428    Mw 2E1438        38.4     0.      54.8 FIXEDHF     0.700  0       0.0  0
2429    Mx 1D1438        64.3     0.      91.8 FIXEDHF     0.700  0       0.0  0  3d14p     -4p6d
2430    Mx 3D1438        14.9     0.      21.3 FIXEDHF     0.700  0       0.0  0
2431    Mx 0E1438        82.7     0.     118.1 FIXEDHF     0.700  0       0.0  0
2432    Mx 2E1438        23.8     0.      34.0 FIXEDHF     0.700  0       0.0  0
2433    My 1D1438        47.9     0.      68.5 FIXEDHF     0.700  0       0.0  0  3d14p     -4p7d
2434    My 3D1438         8.6     0.      12.3 FIXEDHF     0.700  0       0.0  0
2435    My 0E1438        61.0     0.      87.1 FIXEDHF     0.700  0       0.0  0
2436    My 2E1438        16.4     0.      23.5 FIXEDHF     0.700  0       0.0  0
2437    Mz 1D1438        37.4     0.      53.5 FIXEDHF     0.700  0       0.0  0  3d14p     -4p8d
2438    Mz 3D1438         5.3     0.       7.6 FIXEDHF     0.700  0       0.0  0
2439    Mz 0E1438        47.4     0.      67.7 FIXEDHF     0.700  0       0.0  0
2440    Mz 2E1438        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
2441    NO 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s5f
2442    NO 3E2525        74.3     0.     106.1 FIXEDHF     0.700  0       0.0  0
2443    NP 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s6f
2444    NP 3E2525        63.6     0.      90.8 FIXEDHF     0.700  0       0.0  0
2445    NQ 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s7f
2446    NQ 3E2525        54.1     0.      77.3 FIXEDHF     0.700  0       0.0  0
2447    NR 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s8f
2448    NR 3E2525        46.5     0.      66.4 FIXEDHF     0.700  0       0.0  0
2449    NS 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s9f
2450    NS 3E2525        40.3     0.      57.6 FIXEDHF     0.700  0       0.0  0
2451    NT 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s10f
2452    NT 3E2525        35.3     0.      50.5 FIXEDHF     0.700  0       0.0  0
2453    NU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s11f
2454    NU 3E2525        31.3     0.      44.7 FIXEDHF     0.700  0       0.0  0
2455    NV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s12f
2456    NV 3E2525        27.9     0.      39.9 FIXEDHF     0.700  0       0.0  0
2457    NW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s13f
2458    NW 3E2525        25.1     0.      35.9 FIXEDHF     0.700  0       0.0  0
2459    NX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s14f
2460    NX 3E2525        22.8     0.      32.5 FIXEDHF     0.700  0       0.0  0
2461    NY 2D2515      -542.2     0.    -774.6 FIXEDHF     0.700  0       0.0  0  4s4f      -3d4f
2462    NY 3E2515       -43.0     0.     -61.5 FIXEDHF     0.700  0       0.0  0
2463    NZ 2D2515      -316.3     0.    -451.9 FIXEDHF     0.700  0       0.0  0  4s4f      -3d5f
2464    NZ 3E2515       -38.1     0.     -54.5 FIXEDHF     0.700  0       0.0  0
2465    Na 2D2515      -223.0     0.    -318.6 FIXEDHF     0.700  0       0.0  0  4s4f      -3d6f
2466    Na 3E2515       -31.9     0.     -45.6 FIXEDHF     0.700  0       0.0  0
2467    Nb 2D2515      -170.1     0.    -243.0 FIXEDHF     0.700  0       0.0  0  4s4f      -3d7f
2468    Nb 3E2515       -26.7     0.     -38.2 FIXEDHF     0.700  0       0.0  0
2469    Nc 2D2515      -135.9     0.    -194.2 FIXEDHF     0.700  0       0.0  0  4s4f      -3d8f
2470    Nc 3E2515       -22.7     0.     -32.4 FIXEDHF     0.700  0       0.0  0
2471    Nd 2D2515      -112.2     0.    -160.3 FIXEDHF     0.700  0       0.0  0  4s4f      -3d9f
2472    Nd 3E2515       -19.5     0.     -27.8 FIXEDHF     0.700  0       0.0  0
2473    Ne 2D2515       -94.8     0.    -135.5 FIXEDHF     0.700  0       0.0  0  4s4f      -3d10f
2474    Ne 3E2515       -16.9     0.     -24.2 FIXEDHF     0.700  0       0.0  0
2475    Nf 2D2515       -81.6     0.    -116.6 FIXEDHF     0.700  0       0.0  0  4s4f      -3d11f
2476    Nf 3E2515       -14.9     0.     -21.3 FIXEDHF     0.700  0       0.0  0
2477    Ng 2D2515       -71.3     0.    -101.8 FIXEDHF     0.700  0       0.0  0  4s4f      -3d12f
2478    Ng 3E2515       -13.3     0.     -19.0 FIXEDHF     0.700  0       0.0  0
2479    Nh 2D2515       -62.9     0.     -89.9 FIXEDHF     0.700  0       0.0  0  4s4f      -3d13f
2480    Nh 3E2515       -11.9     0.     -17.0 FIXEDHF     0.700  0       0.0  0
2481    Ni 2D2515       -56.2     0.     -80.3 FIXEDHF     0.700  0       0.0  0  4s4f      -3d14f
2482    Ni 3E2515       -10.7     0.     -15.3 FIXEDHF     0.700  0       0.0  0
2483    Nn 2D2516       -64.0     0.     -91.4 FIXEDHF     0.700  0       0.0  0  4s4f      -3d6h
2484    Nn 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2485    No 2D2516       -62.2     0.     -88.9 FIXEDHF     0.700  0       0.0  0  4s4f      -3d7h
2486    No 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2487    Np 2D2516       -55.5     0.     -79.3 FIXEDHF     0.700  0       0.0  0  4s4f      -3d8h
2488    Np 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2489    Nq 2D2516       -48.8     0.     -69.7 FIXEDHF     0.700  0       0.0  0  4s4f      -3d9h
2490    Nq 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2491    Nv 1D2538      3212.2     0.    4588.8 FIXEDHF     0.700  0       0.0  0  4s4f      -4p4d
2492    Nv 2E2538       213.2     0.     304.6 FIXEDHF     0.700  0       0.0  0
2493    Nw 1D2538       198.2     0.     283.1 FIXEDHF     0.700  0       0.0  0  4s4f      -4p5d
2494    Nw 2E2538       181.1     0.     258.7 FIXEDHF     0.700  0       0.0  0
2495    Nx 1D2538       152.1     0.     217.3 FIXEDHF     0.700  0       0.0  0  4s4f      -4p6d
2496    Nx 2E2538       141.3     0.     201.9 FIXEDHF     0.700  0       0.0  0
2497    Ny 1D2538        98.3     0.     140.4 FIXEDHF     0.700  0       0.0  0  4s4f      -4p7d
2498    Ny 2E2538       111.6     0.     159.5 FIXEDHF     0.700  0       0.0  0
2499    Nz 1D2538        67.5     0.      96.5 FIXEDHF     0.700  0       0.0  0  4s4f      -4p8d
2500    Nz 2E2538        90.3     0.     129.0 FIXEDHF     0.700  0       0.0  0
2501    OP 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s6f
2502    OP 3E2525        58.5     0.      83.6 FIXEDHF     0.700  0       0.0  0
2503    OQ 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s7f
2504    OQ 3E2525        49.9     0.      71.3 FIXEDHF     0.700  0       0.0  0
2505    OR 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s8f
2506    OR 3E2525        42.9     0.      61.3 FIXEDHF     0.700  0       0.0  0
2507    OS 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s9f
2508    OS 3E2525        37.2     0.      53.2 FIXEDHF     0.700  0       0.0  0
2509    OT 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s10f
2510    OT 3E2525        32.6     0.      46.6 FIXEDHF     0.700  0       0.0  0
2511    OU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s11f
2512    OU 3E2525        28.9     0.      41.3 FIXEDHF     0.700  0       0.0  0
2513    OV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s12f
2514    OV 3E2525        25.8     0.      36.9 FIXEDHF     0.700  0       0.0  0
2515    OW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s13f
2516    OW 3E2525        23.2     0.      33.2 FIXEDHF     0.700  0       0.0  0
2517    OX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s14f
2518    OX 3E2525        21.0     0.      30.0 FIXEDHF     0.700  0       0.0  0
2519    OY 2D2515      -317.2     0.    -453.1 FIXEDHF     0.700  0       0.0  0  4s5f      -3d4f
2520    OY 3E2515       -39.5     0.     -56.4 FIXEDHF     0.700  0       0.0  0
2521    OZ 2D2515      -282.3     0.    -403.3 FIXEDHF     0.700  0       0.0  0  4s5f      -3d5f
2522    OZ 3E2515       -35.1     0.     -50.1 FIXEDHF     0.700  0       0.0  0
2523    Oa 2D2515      -198.9     0.    -284.2 FIXEDHF     0.700  0       0.0  0  4s5f      -3d6f
2524    Oa 3E2515       -29.4     0.     -42.0 FIXEDHF     0.700  0       0.0  0
2525    Ob 2D2515      -152.6     0.    -218.0 FIXEDHF     0.700  0       0.0  0  4s5f      -3d7f
2526    Ob 3E2515       -24.6     0.     -35.2 FIXEDHF     0.700  0       0.0  0
2527    Oc 2D2515      -122.4     0.    -174.9 FIXEDHF     0.700  0       0.0  0  4s5f      -3d8f
2528    Oc 3E2515       -20.9     0.     -29.9 FIXEDHF     0.700  0       0.0  0
2529    Od 2D2515      -101.4     0.    -144.8 FIXEDHF     0.700  0       0.0  0  4s5f      -3d9f
2530    Od 3E2515       -18.0     0.     -25.7 FIXEDHF     0.700  0       0.0  0
2531    Oe 2D2515       -85.8     0.    -122.6 FIXEDHF     0.700  0       0.0  0  4s5f      -3d10f
2532    Oe 3E2515       -15.7     0.     -22.4 FIXEDHF     0.700  0       0.0  0
2533    Of 2D2515       -74.0     0.    -105.7 FIXEDHF     0.700  0       0.0  0  4s5f      -3d11f
2534    Of 3E2515       -13.8     0.     -19.7 FIXEDHF     0.700  0       0.0  0
2535    Og 2D2515       -64.7     0.     -92.4 FIXEDHF     0.700  0       0.0  0  4s5f      -3d12f
2536    Og 3E2515       -12.3     0.     -17.5 FIXEDHF     0.700  0       0.0  0
2537    Oh 2D2515       -57.2     0.     -81.7 FIXEDHF     0.700  0       0.0  0  4s5f      -3d13f
2538    Oh 3E2515       -11.0     0.     -15.7 FIXEDHF     0.700  0       0.0  0
2539    Oi 2D2515       -51.1     0.     -73.0 FIXEDHF     0.700  0       0.0  0  4s5f      -3d14f
2540    Oi 3E2515        -9.9     0.     -14.2 FIXEDHF     0.700  0       0.0  0
2541    On 2D2516        15.7     0.      22.5 FIXEDHF     0.700  0       0.0  0  4s5f      -3d6h
2542    On 5E2516        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
2543    Oo 2D2516        -1.5     0.      -2.1 FIXEDHF     0.700  0       0.0  0  4s5f      -3d7h
2544    Oo 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2545    Op 2D2516        -7.8     0.     -11.1 FIXEDHF     0.700  0       0.0  0  4s5f      -3d8h
2546    Op 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2547    Oq 2D2516        -9.9     0.     -14.2 FIXEDHF     0.700  0       0.0  0  4s5f      -3d9h
2548    Oq 5E2516        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
2549    Ov 1D2538      2025.6     0.    2893.7 FIXEDHF     0.700  0       0.0  0  4s5f      -4p4d
2550    Ov 2E2538       181.2     0.     258.9 FIXEDHF     0.700  0       0.0  0
2551    Ow 1D2538      1168.7     0.    1669.6 FIXEDHF     0.700  0       0.0  0  4s5f      -4p5d
2552    Ow 2E2538       158.3     0.     226.1 FIXEDHF     0.700  0       0.0  0
2553    Ox 1D2538       116.6     0.     166.6 FIXEDHF     0.700  0       0.0  0  4s5f      -4p6d
2554    Ox 2E2538       124.6     0.     178.0 FIXEDHF     0.700  0       0.0  0
2555    Oy 1D2538       107.8     0.     154.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4p7d
2556    Oy 2E2538        98.8     0.     141.2 FIXEDHF     0.700  0       0.0  0
2557    Oz 1D2538        78.1     0.     111.6 FIXEDHF     0.700  0       0.0  0  4s5f      -4p8d
2558    Oz 2E2538        80.1     0.     114.5 FIXEDHF     0.700  0       0.0  0
2559    PQ 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s7f
2560    PQ 3E2525        42.8     0.      61.2 FIXEDHF     0.700  0       0.0  0
2561    PR 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s8f
2562    PR 3E2525        36.8     0.      52.6 FIXEDHF     0.700  0       0.0  0
2563    PS 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s9f
2564    PS 3E2525        32.0     0.      45.7 FIXEDHF     0.700  0       0.0  0
2565    PT 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s10f
2566    PT 3E2525        28.1     0.      40.1 FIXEDHF     0.700  0       0.0  0
2567    PU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s11f
2568    PU 3E2525        24.8     0.      35.5 FIXEDHF     0.700  0       0.0  0
2569    PV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s12f
2570    PV 3E2525        22.2     0.      31.7 FIXEDHF     0.700  0       0.0  0
2571    PW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s13f
2572    PW 3E2525        19.9     0.      28.5 FIXEDHF     0.700  0       0.0  0
2573    PX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s14f
2574    PX 3E2525        18.1     0.      25.8 FIXEDHF     0.700  0       0.0  0
2575    PY 2D2515      -224.3     0.    -320.4 FIXEDHF     0.700  0       0.0  0  4s6f      -3d4f
2576    PY 3E2515       -33.8     0.     -48.3 FIXEDHF     0.700  0       0.0  0
2577    PZ 2D2515      -198.9     0.    -284.1 FIXEDHF     0.700  0       0.0  0  4s6f      -3d5f
2578    PZ 3E2515       -30.1     0.     -43.0 FIXEDHF     0.700  0       0.0  0
2579    Pa 2D2515      -166.2     0.    -237.4 FIXEDHF     0.700  0       0.0  0  4s6f      -3d6f
2580    Pa 3E2515       -25.2     0.     -36.0 FIXEDHF     0.700  0       0.0  0
2581    Pb 2D2515      -127.3     0.    -181.9 FIXEDHF     0.700  0       0.0  0  4s6f      -3d7f
2582    Pb 3E2515       -21.1     0.     -30.2 FIXEDHF     0.700  0       0.0  0
2583    Pc 2D2515      -102.5     0.    -146.4 FIXEDHF     0.700  0       0.0  0  4s6f      -3d8f
2584    Pc 3E2515       -18.0     0.     -25.7 FIXEDHF     0.700  0       0.0  0
2585    Pd 2D2515       -85.0     0.    -121.4 FIXEDHF     0.700  0       0.0  0  4s6f      -3d9f
2586    Pd 3E2515       -15.5     0.     -22.1 FIXEDHF     0.700  0       0.0  0
2587    Pe 2D2515       -72.1     0.    -103.0 FIXEDHF     0.700  0       0.0  0  4s6f      -3d10f
2588    Pe 3E2515       -13.4     0.     -19.2 FIXEDHF     0.700  0       0.0  0
2589    Pf 2D2515       -62.2     0.     -88.9 FIXEDHF     0.700  0       0.0  0  4s6f      -3d11f
2590    Pf 3E2515       -11.8     0.     -16.9 FIXEDHF     0.700  0       0.0  0
2591    Pg 2D2515       -54.5     0.     -77.8 FIXEDHF     0.700  0       0.0  0  4s6f      -3d12f
2592    Pg 3E2515       -10.6     0.     -15.1 FIXEDHF     0.700  0       0.0  0
2593    Ph 2D2515       -48.2     0.     -68.8 FIXEDHF     0.700  0       0.0  0  4s6f      -3d13f
2594    Ph 3E2515        -9.4     0.     -13.5 FIXEDHF     0.700  0       0.0  0
2595    Pi 2D2515       -43.0     0.     -61.5 FIXEDHF     0.700  0       0.0  0  4s6f      -3d14f
2596    Pi 3E2515        -8.5     0.     -12.2 FIXEDHF     0.700  0       0.0  0
2597    Pn 2D2516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  4s6f      -3d6h
2598    Pn 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2599    Po 2D2516         7.3     0.      10.4 FIXEDHF     0.700  0       0.0  0  4s6f      -3d7h
2600    Po 5E2516        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
2601    Pp 2D2516         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0  4s6f      -3d8h
2602    Pp 5E2516        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
2603    Pq 2D2516         0.9     0.       1.3 FIXEDHF     0.700  0       0.0  0  4s6f      -3d9h
2604    Pq 5E2516        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
2605    Pv 1D2538      1439.1     0.    2055.8 FIXEDHF     0.700  0       0.0  0  4s6f      -4p4d
2606    Pv 2E2538       148.0     0.     211.5 FIXEDHF     0.700  0       0.0  0
2607    Pw 1D2538       946.8     0.    1352.6 FIXEDHF     0.700  0       0.0  0  4s6f      -4p5d
2608    Pw 2E2538       131.6     0.     188.0 FIXEDHF     0.700  0       0.0  0
2609    Px 1D2538       518.9     0.     741.3 FIXEDHF     0.700  0       0.0  0  4s6f      -4p6d
2610    Px 2E2538       104.2     0.     148.8 FIXEDHF     0.700  0       0.0  0
2611    Py 1D2538        70.4     0.     100.6 FIXEDHF     0.700  0       0.0  0  4s6f      -4p7d
2612    Py 2E2538        82.9     0.     118.4 FIXEDHF     0.700  0       0.0  0
2613    Pz 1D2538        72.8     0.     104.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4p8d
2614    Pz 2E2538        67.3     0.      96.1 FIXEDHF     0.700  0       0.0  0
2615    QR 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s8f
2616    QR 3E2525        31.4     0.      44.9 FIXEDHF     0.700  0       0.0  0
2617    QS 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s9f
2618    QS 3E2525        27.3     0.      39.0 FIXEDHF     0.700  0       0.0  0
2619    QT 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s10f
2620    QT 3E2525        23.9     0.      34.2 FIXEDHF     0.700  0       0.0  0
2621    QU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s11f
2622    QU 3E2525        21.2     0.      30.3 FIXEDHF     0.700  0       0.0  0
2623    QV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s12f
2624    QV 3E2525        19.0     0.      27.1 FIXEDHF     0.700  0       0.0  0
2625    QW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s13f
2626    QW 3E2525        17.1     0.      24.4 FIXEDHF     0.700  0       0.0  0
2627    QX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s14f
2628    QX 3E2525        15.5     0.      22.1 FIXEDHF     0.700  0       0.0  0
2629    QY 2D2515      -171.4     0.    -244.9 FIXEDHF     0.700  0       0.0  0  4s7f      -3d4f
2630    QY 3E2515       -28.8     0.     -41.2 FIXEDHF     0.700  0       0.0  0
2631    QZ 2D2515      -152.7     0.    -218.1 FIXEDHF     0.700  0       0.0  0  4s7f      -3d5f
2632    QZ 3E2515       -25.7     0.     -36.7 FIXEDHF     0.700  0       0.0  0
2633    Qa 2D2515      -127.1     0.    -181.6 FIXEDHF     0.700  0       0.0  0  4s7f      -3d6f
2634    Qa 3E2515       -21.6     0.     -30.8 FIXEDHF     0.700  0       0.0  0
2635    Qb 2D2515      -106.3     0.    -151.8 FIXEDHF     0.700  0       0.0  0  4s7f      -3d7f
2636    Qb 3E2515       -18.1     0.     -25.8 FIXEDHF     0.700  0       0.0  0
2637    Qc 2D2515       -85.4     0.    -122.0 FIXEDHF     0.700  0       0.0  0  4s7f      -3d8f
2638    Qc 3E2515       -15.3     0.     -21.9 FIXEDHF     0.700  0       0.0  0
2639    Qd 2D2515       -71.0     0.    -101.4 FIXEDHF     0.700  0       0.0  0  4s7f      -3d9f
2640    Qd 3E2515       -13.2     0.     -18.9 FIXEDHF     0.700  0       0.0  0
2641    Qe 2D2515       -60.3     0.     -86.1 FIXEDHF     0.700  0       0.0  0  4s7f      -3d10f
2642    Qe 3E2515       -11.5     0.     -16.4 FIXEDHF     0.700  0       0.0  0
2643    Qf 2D2515       -52.1     0.     -74.4 FIXEDHF     0.700  0       0.0  0  4s7f      -3d11f
2644    Qf 3E2515       -10.1     0.     -14.5 FIXEDHF     0.700  0       0.0  0
2645    Qg 2D2515       -45.6     0.     -65.1 FIXEDHF     0.700  0       0.0  0  4s7f      -3d12f
2646    Qg 3E2515        -9.0     0.     -12.9 FIXEDHF     0.700  0       0.0  0
2647    Qh 2D2515       -40.4     0.     -57.7 FIXEDHF     0.700  0       0.0  0  4s7f      -3d13f
2648    Qh 3E2515        -8.0     0.     -11.5 FIXEDHF     0.700  0       0.0  0
2649    Qi 2D2515       -36.1     0.     -51.6 FIXEDHF     0.700  0       0.0  0  4s7f      -3d14f
2650    Qi 3E2515        -7.3     0.     -10.4 FIXEDHF     0.700  0       0.0  0
2651    Qn 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -3d6h
2652    Qn 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2653    Qo 2D2516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  4s7f      -3d7h
2654    Qo 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2655    Qp 2D2516         3.5     0.       5.0 FIXEDHF     0.700  0       0.0  0  4s7f      -3d8h
2656    Qp 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2657    Qq 2D2516         2.7     0.       3.8 FIXEDHF     0.700  0       0.0  0  4s7f      -3d9h
2658    Qq 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2659    Qv 1D2538      1095.6     0.    1565.1 FIXEDHF     0.700  0       0.0  0  4s7f      -4p4d
2660    Qv 2E2538       122.3     0.     174.7 FIXEDHF     0.700  0       0.0  0
2661    Qw 1D2538       761.3     0.    1087.5 FIXEDHF     0.700  0       0.0  0  4s7f      -4p5d
2662    Qw 2E2538       110.0     0.     157.1 FIXEDHF     0.700  0       0.0  0
2663    Qx 1D2538       470.2     0.     671.7 FIXEDHF     0.700  0       0.0  0  4s7f      -4p6d
2664    Qx 2E2538        87.4     0.     124.8 FIXEDHF     0.700  0       0.0  0
2665    Qy 1D2538       264.9     0.     378.4 FIXEDHF     0.700  0       0.0  0  4s7f      -4p7d
2666    Qy 2E2538        69.6     0.      99.5 FIXEDHF     0.700  0       0.0  0
2667    Qz 1D2538        45.3     0.      64.7 FIXEDHF     0.700  0       0.0  0  4s7f      -4p8d
2668    Qz 2E2538        56.6     0.      80.8 FIXEDHF     0.700  0       0.0  0
2669    RS 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s9f
2670    RS 3E2525        23.4     0.      33.5 FIXEDHF     0.700  0       0.0  0
2671    RT 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s10f
2672    RT 3E2525        20.6     0.      29.4 FIXEDHF     0.700  0       0.0  0
2673    RU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s11f
2674    RU 3E2525        18.3     0.      26.1 FIXEDHF     0.700  0       0.0  0
2675    RV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s12f
2676    RV 3E2525        16.3     0.      23.3 FIXEDHF     0.700  0       0.0  0
2677    RW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s13f
2678    RW 3E2525        14.7     0.      21.0 FIXEDHF     0.700  0       0.0  0
2679    RX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s14f
2680    RX 3E2525        13.3     0.      19.0 FIXEDHF     0.700  0       0.0  0
2681    RY 2D2515      -137.2     0.    -196.0 FIXEDHF     0.700  0       0.0  0  4s8f      -3d4f
2682    RY 3E2515       -24.8     0.     -35.4 FIXEDHF     0.700  0       0.0  0
2683    RZ 2D2515      -122.7     0.    -175.3 FIXEDHF     0.700  0       0.0  0  4s8f      -3d5f
2684    RZ 3E2515       -22.0     0.     -31.5 FIXEDHF     0.700  0       0.0  0
2685    Ra 2D2515      -102.3     0.    -146.1 FIXEDHF     0.700  0       0.0  0  4s8f      -3d6f
2686    Ra 3E2515       -18.5     0.     -26.4 FIXEDHF     0.700  0       0.0  0
2687    Rb 2D2515       -85.3     0.    -121.8 FIXEDHF     0.700  0       0.0  0  4s8f      -3d7f
2688    Rb 3E2515       -15.5     0.     -22.2 FIXEDHF     0.700  0       0.0  0
2689    Rc 2D2515       -72.2     0.    -103.1 FIXEDHF     0.700  0       0.0  0  4s8f      -3d8f
2690    Rc 3E2515       -13.2     0.     -18.9 FIXEDHF     0.700  0       0.0  0
2691    Rd 2D2515       -59.8     0.     -85.5 FIXEDHF     0.700  0       0.0  0  4s8f      -3d9f
2692    Rd 3E2515       -11.3     0.     -16.2 FIXEDHF     0.700  0       0.0  0
2693    Re 2D2515       -50.9     0.     -72.7 FIXEDHF     0.700  0       0.0  0  4s8f      -3d10f
2694    Re 3E2515        -9.9     0.     -14.1 FIXEDHF     0.700  0       0.0  0
2695    Rf 2D2515       -44.0     0.     -62.8 FIXEDHF     0.700  0       0.0  0  4s8f      -3d11f
2696    Rf 3E2515        -8.7     0.     -12.4 FIXEDHF     0.700  0       0.0  0
2697    Rg 2D2515       -38.6     0.     -55.1 FIXEDHF     0.700  0       0.0  0  4s8f      -3d12f
2698    Rg 3E2515        -7.8     0.     -11.1 FIXEDHF     0.700  0       0.0  0
2699    Rh 2D2515       -34.2     0.     -48.8 FIXEDHF     0.700  0       0.0  0  4s8f      -3d13f
2700    Rh 3E2515        -6.9     0.      -9.9 FIXEDHF     0.700  0       0.0  0
2701    Ri 2D2515       -30.6     0.     -43.7 FIXEDHF     0.700  0       0.0  0  4s8f      -3d14f
2702    Ri 3E2515        -6.2     0.      -8.9 FIXEDHF     0.700  0       0.0  0
2703    Rn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s8f      -3d6h
2704    Rn 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2705    Ro 2D2516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  4s8f      -3d7h
2706    Ro 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2707    Rp 2D2516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  4s8f      -3d8h
2708    Rp 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2709    Rq 2D2516         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0  4s8f      -3d9h
2710    Rq 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2711    Rv 1D2538       872.5     0.    1246.4 FIXEDHF     0.700  0       0.0  0  4s8f      -4p4d
2712    Rv 2E2538       102.8     0.     146.8 FIXEDHF     0.700  0       0.0  0
2713    Rw 1D2538       625.2     0.     893.2 FIXEDHF     0.700  0       0.0  0  4s8f      -4p5d
2714    Rw 2E2538        93.2     0.     133.1 FIXEDHF     0.700  0       0.0  0
2715    Rx 1D2538       405.3     0.     579.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4p6d
2716    Rx 2E2538        74.2     0.     106.0 FIXEDHF     0.700  0       0.0  0
2717    Ry 1D2538       255.6     0.     365.1 FIXEDHF     0.700  0       0.0  0  4s8f      -4p7d
2718    Ry 2E2538        59.2     0.      84.6 FIXEDHF     0.700  0       0.0  0
2719    Rz 1D2538       149.9     0.     214.2 FIXEDHF     0.700  0       0.0  0  4s8f      -4p8d
2720    Rz 2E2538        48.2     0.      68.8 FIXEDHF     0.700  0       0.0  0
2721    ST 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -4s10f
2722    ST 3E2525        17.9     0.      25.6 FIXEDHF     0.700  0       0.0  0
2723    SU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -4s11f
2724    SU 3E2525        15.8     0.      22.6 FIXEDHF     0.700  0       0.0  0
2725    SV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -4s12f
2726    SV 3E2525        14.1     0.      20.2 FIXEDHF     0.700  0       0.0  0
2727    SW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -4s13f
2728    SW 3E2525        12.7     0.      18.2 FIXEDHF     0.700  0       0.0  0
2729    SX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -4s14f
2730    SX 3E2525        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0
2731    SY 2D2515      -113.3     0.    -161.9 FIXEDHF     0.700  0       0.0  0  4s9f      -3d4f
2732    SY 3E2515       -21.5     0.     -30.7 FIXEDHF     0.700  0       0.0  0
2733    SZ 2D2515      -101.6     0.    -145.2 FIXEDHF     0.700  0       0.0  0  4s9f      -3d5f
2734    SZ 3E2515       -19.2     0.     -27.4 FIXEDHF     0.700  0       0.0  0
2735    Sa 2D2515       -84.9     0.    -121.3 FIXEDHF     0.700  0       0.0  0  4s9f      -3d6f
2736    Sa 3E2515       -16.1     0.     -23.0 FIXEDHF     0.700  0       0.0  0
2737    Sb 2D2515       -70.8     0.    -101.1 FIXEDHF     0.700  0       0.0  0  4s9f      -3d7f
2738    Sb 3E2515       -13.5     0.     -19.3 FIXEDHF     0.700  0       0.0  0
2739    Sc 2D2515       -59.7     0.     -85.3 FIXEDHF     0.700  0       0.0  0  4s9f      -3d8f
2740    Sc 3E2515       -11.5     0.     -16.4 FIXEDHF     0.700  0       0.0  0
2741    Sd 2D2515       -51.2     0.     -73.2 FIXEDHF     0.700  0       0.0  0  4s9f      -3d9f
2742    Sd 3E2515        -9.9     0.     -14.1 FIXEDHF     0.700  0       0.0  0
2743    Se 2D2515       -43.5     0.     -62.2 FIXEDHF     0.700  0       0.0  0  4s9f      -3d10f
2744    Se 3E2515        -8.6     0.     -12.3 FIXEDHF     0.700  0       0.0  0
2745    Sf 2D2515       -37.7     0.     -53.8 FIXEDHF     0.700  0       0.0  0  4s9f      -3d11f
2746    Sf 3E2515        -7.6     0.     -10.8 FIXEDHF     0.700  0       0.0  0
2747    Sg 2D2515       -33.0     0.     -47.2 FIXEDHF     0.700  0       0.0  0  4s9f      -3d12f
2748    Sg 3E2515        -6.7     0.      -9.6 FIXEDHF     0.700  0       0.0  0
2749    Sh 2D2515       -29.3     0.     -41.8 FIXEDHF     0.700  0       0.0  0  4s9f      -3d13f
2750    Sh 3E2515        -6.0     0.      -8.6 FIXEDHF     0.700  0       0.0  0
2751    Si 2D2515       -26.2     0.     -37.4 FIXEDHF     0.700  0       0.0  0  4s9f      -3d14f
2752    Si 3E2515        -5.5     0.      -7.8 FIXEDHF     0.700  0       0.0  0
2753    Sn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s9f      -3d6h
2754    Sn 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2755    So 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -3d7h
2756    So 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2757    Sp 2D2516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  4s9f      -3d8h
2758    Sp 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2759    Sq 2D2516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  4s9f      -3d9h
2760    Sq 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2761    Sv 1D2538       717.3     0.    1024.7 FIXEDHF     0.700  0       0.0  0  4s9f      -4p4d
2762    Sv 2E2538        87.7     0.     125.3 FIXEDHF     0.700  0       0.0  0
2763    Sw 1D2538       524.5     0.     749.3 FIXEDHF     0.700  0       0.0  0  4s9f      -4p5d
2764    Sw 2E2538        80.0     0.     114.3 FIXEDHF     0.700  0       0.0  0
2765    Sx 1D2538       349.2     0.     498.8 FIXEDHF     0.700  0       0.0  0  4s9f      -4p6d
2766    Sx 2E2538        63.8     0.      91.2 FIXEDHF     0.700  0       0.0  0
2767    Sy 1D2538       230.4     0.     329.1 FIXEDHF     0.700  0       0.0  0  4s9f      -4p7d
2768    Sy 2E2538        51.0     0.      72.8 FIXEDHF     0.700  0       0.0  0
2769    Sz 1D2538       150.4     0.     214.8 FIXEDHF     0.700  0       0.0  0  4s9f      -4p8d
2770    Sz 2E2538        41.5     0.      59.3 FIXEDHF     0.700  0       0.0  0
2771    TU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10f     -4s11f
2772    TU 3E2525        13.9     0.      19.9 FIXEDHF     0.700  0       0.0  0
2773    TV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10f     -4s12f
2774    TV 3E2525        12.5     0.      17.8 FIXEDHF     0.700  0       0.0  0
2775    TW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10f     -4s13f
2776    TW 3E2525        11.2     0.      16.0 FIXEDHF     0.700  0       0.0  0
2777    TX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10f     -4s14f
2778    TX 3E2525        10.1     0.      14.5 FIXEDHF     0.700  0       0.0  0
2779    TY 2D2515       -95.8     0.    -136.9 FIXEDHF     0.700  0       0.0  0  4s10f     -3d4f
2780    TY 3E2515       -18.8     0.     -26.9 FIXEDHF     0.700  0       0.0  0
2781    TZ 2D2515       -86.1     0.    -123.0 FIXEDHF     0.700  0       0.0  0  4s10f     -3d5f
2782    TZ 3E2515       -16.8     0.     -24.0 FIXEDHF     0.700  0       0.0  0
2783    Ta 2D2515       -72.0     0.    -102.9 FIXEDHF     0.700  0       0.0  0  4s10f     -3d6f
2784    Ta 3E2515       -14.1     0.     -20.1 FIXEDHF     0.700  0       0.0  0
2785    Tb 2D2515       -60.1     0.     -85.9 FIXEDHF     0.700  0       0.0  0  4s10f     -3d7f
2786    Tb 3E2515       -11.8     0.     -16.9 FIXEDHF     0.700  0       0.0  0
2787    Tc 2D2515       -50.8     0.     -72.5 FIXEDHF     0.700  0       0.0  0  4s10f     -3d8f
2788    Tc 3E2515       -10.1     0.     -14.4 FIXEDHF     0.700  0       0.0  0
2789    Td 2D2515       -43.4     0.     -62.0 FIXEDHF     0.700  0       0.0  0  4s10f     -3d9f
2790    Td 3E2515        -8.7     0.     -12.4 FIXEDHF     0.700  0       0.0  0
2791    Te 2D2515       -37.7     0.     -53.9 FIXEDHF     0.700  0       0.0  0  4s10f     -3d10f
2792    Te 3E2515        -7.6     0.     -10.8 FIXEDHF     0.700  0       0.0  0
2793    Tf 2D2515       -32.6     0.     -46.6 FIXEDHF     0.700  0       0.0  0  4s10f     -3d11f
2794    Tf 3E2515        -6.6     0.      -9.5 FIXEDHF     0.700  0       0.0  0
2795    Tg 2D2515       -28.6     0.     -40.8 FIXEDHF     0.700  0       0.0  0  4s10f     -3d12f
2796    Tg 3E2515        -5.9     0.      -8.4 FIXEDHF     0.700  0       0.0  0
2797    Th 2D2515       -25.3     0.     -36.2 FIXEDHF     0.700  0       0.0  0  4s10f     -3d13f
2798    Th 3E2515        -5.3     0.      -7.6 FIXEDHF     0.700  0       0.0  0
2799    Ti 2D2515       -22.7     0.     -32.4 FIXEDHF     0.700  0       0.0  0  4s10f     -3d14f
2800    Ti 3E2515        -4.8     0.      -6.8 FIXEDHF     0.700  0       0.0  0
2801    Tn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s10f     -3d6h
2802    Tn 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2803    To 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10f     -3d7h
2804    To 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2805    Tp 2D2516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  4s10f     -3d8h
2806    Tp 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2807    Tq 2D2516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  4s10f     -3d9h
2808    Tq 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2809    Tv 1D2538       603.9     0.     862.7 FIXEDHF     0.700  0       0.0  0  4s10f     -4p4d
2810    Tv 2E2538        75.9     0.     108.5 FIXEDHF     0.700  0       0.0  0
2811    Tw 1D2538       448.0     0.     640.0 FIXEDHF     0.700  0       0.0  0  4s10f     -4p5d
2812    Tw 2E2538        69.6     0.      99.5 FIXEDHF     0.700  0       0.0  0
2813    Tx 1D2538       303.3     0.     433.3 FIXEDHF     0.700  0       0.0  0  4s10f     -4p6d
2814    Tx 2E2538        55.6     0.      79.5 FIXEDHF     0.700  0       0.0  0
2815    Ty 1D2538       205.2     0.     293.1 FIXEDHF     0.700  0       0.0  0  4s10f     -4p7d
2816    Ty 2E2538        44.4     0.      63.5 FIXEDHF     0.700  0       0.0  0
2817    Tz 1D2538       139.8     0.     199.7 FIXEDHF     0.700  0       0.0  0  4s10f     -4p8d
2818    Tz 2E2538        36.2     0.      51.7 FIXEDHF     0.700  0       0.0  0
2819    UV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11f     -4s12f
2820    UV 3E2525        11.0     0.      15.7 FIXEDHF     0.700  0       0.0  0
2821    UW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11f     -4s13f
2822    UW 3E2525         9.9     0.      14.2 FIXEDHF     0.700  0       0.0  0
2823    UX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11f     -4s14f
2824    UX 3E2525         9.0     0.      12.8 FIXEDHF     0.700  0       0.0  0
2825    UY 2D2515       -82.5     0.    -117.8 FIXEDHF     0.700  0       0.0  0  4s11f     -3d4f
2826    UY 3E2515       -16.7     0.     -23.8 FIXEDHF     0.700  0       0.0  0
2827    UZ 2D2515       -74.2     0.    -106.0 FIXEDHF     0.700  0       0.0  0  4s11f     -3d5f
2828    UZ 3E2515       -14.9     0.     -21.3 FIXEDHF     0.700  0       0.0  0
2829    Ua 2D2515       -62.2     0.     -88.8 FIXEDHF     0.700  0       0.0  0  4s11f     -3d6f
2830    Ua 3E2515       -12.5     0.     -17.8 FIXEDHF     0.700  0       0.0  0
2831    Ub 2D2515       -51.9     0.     -74.2 FIXEDHF     0.700  0       0.0  0  4s11f     -3d7f
2832    Ub 3E2515       -10.5     0.     -15.0 FIXEDHF     0.700  0       0.0  0
2833    Uc 2D2515       -43.9     0.     -62.7 FIXEDHF     0.700  0       0.0  0  4s11f     -3d8f
2834    Uc 3E2515        -8.9     0.     -12.7 FIXEDHF     0.700  0       0.0  0
2835    Ud 2D2515       -37.5     0.     -53.6 FIXEDHF     0.700  0       0.0  0  4s11f     -3d9f
2836    Ud 3E2515        -7.7     0.     -11.0 FIXEDHF     0.700  0       0.0  0
2837    Ue 2D2515       -32.5     0.     -46.5 FIXEDHF     0.700  0       0.0  0  4s11f     -3d10f
2838    Ue 3E2515        -6.6     0.      -9.5 FIXEDHF     0.700  0       0.0  0
2839    Uf 2D2515       -28.6     0.     -40.8 FIXEDHF     0.700  0       0.0  0  4s11f     -3d11f
2840    Uf 3E2515        -5.9     0.      -8.4 FIXEDHF     0.700  0       0.0  0
2841    Ug 2D2515       -25.1     0.     -35.8 FIXEDHF     0.700  0       0.0  0  4s11f     -3d12f
2842    Ug 3E2515        -5.3     0.      -7.5 FIXEDHF     0.700  0       0.0  0
2843    Uh 2D2515       -22.3     0.     -31.8 FIXEDHF     0.700  0       0.0  0  4s11f     -3d13f
2844    Uh 3E2515        -4.7     0.      -6.7 FIXEDHF     0.700  0       0.0  0
2845    Ui 2D2515       -19.9     0.     -28.4 FIXEDHF     0.700  0       0.0  0  4s11f     -3d14f
2846    Ui 3E2515        -4.3     0.      -6.1 FIXEDHF     0.700  0       0.0  0
2847    Un 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s11f     -3d6h
2848    Un 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2849    Uo 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11f     -3d7h
2850    Uo 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2851    Up 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11f     -3d8h
2852    Up 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2853    Uq 2D2516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  4s11f     -3d9h
2854    Uq 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2855    Uv 1D2538       517.9     0.     739.8 FIXEDHF     0.700  0       0.0  0  4s11f     -4p4d
2856    Uv 2E2538        66.6     0.      95.1 FIXEDHF     0.700  0       0.0  0
2857    Uw 1D2538       388.4     0.     554.9 FIXEDHF     0.700  0       0.0  0  4s11f     -4p5d
2858    Uw 2E2538        61.2     0.      87.5 FIXEDHF     0.700  0       0.0  0
2859    Ux 1D2538       266.1     0.     380.1 FIXEDHF     0.700  0       0.0  0  4s11f     -4p6d
2860    Ux 2E2538        49.0     0.      70.0 FIXEDHF     0.700  0       0.0  0
2861    Uy 1D2538       182.8     0.     261.2 FIXEDHF     0.700  0       0.0  0  4s11f     -4p7d
2862    Uy 2E2538        39.2     0.      56.0 FIXEDHF     0.700  0       0.0  0
2863    Uz 1D2538       127.6     0.     182.3 FIXEDHF     0.700  0       0.0  0  4s11f     -4p8d
2864    Uz 2E2538        31.9     0.      45.6 FIXEDHF     0.700  0       0.0  0
2865    VW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12f     -4s13f
2866    VW 3E2525         8.8     0.      12.6 FIXEDHF     0.700  0       0.0  0
2867    VX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12f     -4s14f
2868    VX 3E2525         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0
2869    VY 2D2515       -72.0     0.    -102.9 FIXEDHF     0.700  0       0.0  0  4s12f     -3d4f
2870    VY 3E2515       -14.9     0.     -21.3 FIXEDHF     0.700  0       0.0  0
2871    VZ 2D2515       -64.9     0.     -92.7 FIXEDHF     0.700  0       0.0  0  4s12f     -3d5f
2872    VZ 3E2515       -13.3     0.     -19.0 FIXEDHF     0.700  0       0.0  0
2873    Va 2D2515       -54.4     0.     -77.7 FIXEDHF     0.700  0       0.0  0  4s12f     -3d6f
2874    Va 3E2515       -11.1     0.     -15.9 FIXEDHF     0.700  0       0.0  0
2875    Vb 2D2515       -45.5     0.     -65.0 FIXEDHF     0.700  0       0.0  0  4s12f     -3d7f
2876    Vb 3E2515        -9.4     0.     -13.4 FIXEDHF     0.700  0       0.0  0
2877    Vc 2D2515       -38.4     0.     -54.9 FIXEDHF     0.700  0       0.0  0  4s12f     -3d8f
2878    Vc 3E2515        -8.0     0.     -11.4 FIXEDHF     0.700  0       0.0  0
2879    Vd 2D2515       -32.9     0.     -47.0 FIXEDHF     0.700  0       0.0  0  4s12f     -3d9f
2880    Vd 3E2515        -6.9     0.      -9.8 FIXEDHF     0.700  0       0.0  0
2881    Ve 2D2515       -28.6     0.     -40.8 FIXEDHF     0.700  0       0.0  0  4s12f     -3d10f
2882    Ve 3E2515        -5.9     0.      -8.5 FIXEDHF     0.700  0       0.0  0
2883    Vf 2D2515       -25.0     0.     -35.7 FIXEDHF     0.700  0       0.0  0  4s12f     -3d11f
2884    Vf 3E2515        -5.3     0.      -7.5 FIXEDHF     0.700  0       0.0  0
2885    Vg 2D2515       -22.2     0.     -31.7 FIXEDHF     0.700  0       0.0  0  4s12f     -3d12f
2886    Vg 3E2515        -4.7     0.      -6.7 FIXEDHF     0.700  0       0.0  0
2887    Vh 2D2515       -19.7     0.     -28.1 FIXEDHF     0.700  0       0.0  0  4s12f     -3d13f
2888    Vh 3E2515        -4.2     0.      -6.0 FIXEDHF     0.700  0       0.0  0
2889    Vi 2D2515       -17.6     0.     -25.2 FIXEDHF     0.700  0       0.0  0  4s12f     -3d14f
2890    Vi 3E2515        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0
2891    Vn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s12f     -3d6h
2892    Vn 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2893    Vo 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12f     -3d7h
2894    Vo 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2895    Vp 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12f     -3d8h
2896    Vp 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2897    Vq 2D2516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  4s12f     -3d9h
2898    Vq 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2899    Vv 1D2538       450.7     0.     643.8 FIXEDHF     0.700  0       0.0  0  4s12f     -4p4d
2900    Vv 2E2538        58.9     0.      84.2 FIXEDHF     0.700  0       0.0  0
2901    Vw 1D2538       341.0     0.     487.1 FIXEDHF     0.700  0       0.0  0  4s12f     -4p5d
2902    Vw 2E2538        54.4     0.      77.7 FIXEDHF     0.700  0       0.0  0
2903    Vx 1D2538       235.6     0.     336.6 FIXEDHF     0.700  0       0.0  0  4s12f     -4p6d
2904    Vx 2E2538        43.6     0.      62.3 FIXEDHF     0.700  0       0.0  0
2905    Vy 1D2538       163.7     0.     233.9 FIXEDHF     0.700  0       0.0  0  4s12f     -4p7d
2906    Vy 2E2538        34.9     0.      49.8 FIXEDHF     0.700  0       0.0  0
2907    Vz 1D2538       115.9     0.     165.6 FIXEDHF     0.700  0       0.0  0  4s12f     -4p8d
2908    Vz 2E2538        28.4     0.      40.6 FIXEDHF     0.700  0       0.0  0
2909    WX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s13f     -4s14f
2910    WX 3E2525         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
2911    WY 2D2515       -63.6     0.     -90.9 FIXEDHF     0.700  0       0.0  0  4s13f     -3d4f
2912    WY 3E2515       -13.4     0.     -19.1 FIXEDHF     0.700  0       0.0  0
2913    WZ 2D2515       -57.4     0.     -82.0 FIXEDHF     0.700  0       0.0  0  4s13f     -3d5f
2914    WZ 3E2515       -12.0     0.     -17.1 FIXEDHF     0.700  0       0.0  0
2915    Wa 2D2515       -48.2     0.     -68.8 FIXEDHF     0.700  0       0.0  0  4s13f     -3d6f
2916    Wa 3E2515       -10.0     0.     -14.3 FIXEDHF     0.700  0       0.0  0
2917    Wb 2D2515       -40.3     0.     -57.5 FIXEDHF     0.700  0       0.0  0  4s13f     -3d7f
2918    Wb 3E2515        -8.5     0.     -12.1 FIXEDHF     0.700  0       0.0  0
2919    Wc 2D2515       -34.0     0.     -48.6 FIXEDHF     0.700  0       0.0  0  4s13f     -3d8f
2920    Wc 3E2515        -7.1     0.     -10.2 FIXEDHF     0.700  0       0.0  0
2921    Wd 2D2515       -29.2     0.     -41.7 FIXEDHF     0.700  0       0.0  0  4s13f     -3d9f
2922    Wd 3E2515        -6.2     0.      -8.8 FIXEDHF     0.700  0       0.0  0
2923    We 2D2515       -25.3     0.     -36.1 FIXEDHF     0.700  0       0.0  0  4s13f     -3d10f
2924    We 3E2515        -5.4     0.      -7.7 FIXEDHF     0.700  0       0.0  0
2925    Wf 2D2515       -22.2     0.     -31.7 FIXEDHF     0.700  0       0.0  0  4s13f     -3d11f
2926    Wf 3E2515        -4.8     0.      -6.8 FIXEDHF     0.700  0       0.0  0
2927    Wg 2D2515       -19.7     0.     -28.1 FIXEDHF     0.700  0       0.0  0  4s13f     -3d12f
2928    Wg 3E2515        -4.2     0.      -6.0 FIXEDHF     0.700  0       0.0  0
2929    Wh 2D2515       -17.6     0.     -25.1 FIXEDHF     0.700  0       0.0  0  4s13f     -3d13f
2930    Wh 3E2515        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0
2931    Wi 2D2515       -15.7     0.     -22.5 FIXEDHF     0.700  0       0.0  0  4s13f     -3d14f
2932    Wi 3E2515        -3.4     0.      -4.9 FIXEDHF     0.700  0       0.0  0
2933    Wn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s13f     -3d6h
2934    Wn 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2935    Wo 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s13f     -3d7h
2936    Wo 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2937    Wp 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s13f     -3d8h
2938    Wp 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2939    Wq 2D2516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  4s13f     -3d9h
2940    Wq 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2941    Wv 1D2538       397.0     0.     567.1 FIXEDHF     0.700  0       0.0  0  4s13f     -4p4d
2942    Wv 2E2538        52.6     0.      75.2 FIXEDHF     0.700  0       0.0  0
2943    Ww 1D2538       302.5     0.     432.1 FIXEDHF     0.700  0       0.0  0  4s13f     -4p5d
2944    Ww 2E2538        48.8     0.      69.7 FIXEDHF     0.700  0       0.0  0
2945    Wx 1D2538       210.5     0.     300.7 FIXEDHF     0.700  0       0.0  0  4s13f     -4p6d
2946    Wx 2E2538        39.1     0.      55.8 FIXEDHF     0.700  0       0.0  0
2947    Wy 1D2538       147.4     0.     210.6 FIXEDHF     0.700  0       0.0  0  4s13f     -4p7d
2948    Wy 2E2538        31.3     0.      44.7 FIXEDHF     0.700  0       0.0  0
2949    Wz 1D2538       105.5     0.     150.7 FIXEDHF     0.700  0       0.0  0  4s13f     -4p8d
2950    Wz 2E2538        25.5     0.      36.4 FIXEDHF     0.700  0       0.0  0
2951    XY 2D2515       -56.7     0.     -81.0 FIXEDHF     0.700  0       0.0  0  4s14f     -3d4f
2952    XY 3E2515       -12.1     0.     -17.3 FIXEDHF     0.700  0       0.0  0
2953    XZ 2D2515       -51.2     0.     -73.2 FIXEDHF     0.700  0       0.0  0  4s14f     -3d5f
2954    XZ 3E2515       -10.8     0.     -15.5 FIXEDHF     0.700  0       0.0  0
2955    Xa 2D2515       -43.0     0.     -61.5 FIXEDHF     0.700  0       0.0  0  4s14f     -3d6f
2956    Xa 3E2515        -9.1     0.     -13.0 FIXEDHF     0.700  0       0.0  0
2957    Xb 2D2515       -36.0     0.     -51.4 FIXEDHF     0.700  0       0.0  0  4s14f     -3d7f
2958    Xb 3E2515        -7.6     0.     -10.9 FIXEDHF     0.700  0       0.0  0
2959    Xc 2D2515       -30.4     0.     -43.5 FIXEDHF     0.700  0       0.0  0  4s14f     -3d8f
2960    Xc 3E2515        -6.5     0.      -9.3 FIXEDHF     0.700  0       0.0  0
2961    Xd 2D2515       -26.1     0.     -37.3 FIXEDHF     0.700  0       0.0  0  4s14f     -3d9f
2962    Xd 3E2515        -5.6     0.      -8.0 FIXEDHF     0.700  0       0.0  0
2963    Xe 2D2515       -22.6     0.     -32.3 FIXEDHF     0.700  0       0.0  0  4s14f     -3d10f
2964    Xe 3E2515        -4.8     0.      -6.9 FIXEDHF     0.700  0       0.0  0
2965    Xf 2D2515       -19.8     0.     -28.3 FIXEDHF     0.700  0       0.0  0  4s14f     -3d11f
2966    Xf 3E2515        -4.3     0.      -6.1 FIXEDHF     0.700  0       0.0  0
2967    Xg 2D2515       -17.6     0.     -25.1 FIXEDHF     0.700  0       0.0  0  4s14f     -3d12f
2968    Xg 3E2515        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0
2969    Xh 2D2515       -15.7     0.     -22.4 FIXEDHF     0.700  0       0.0  0  4s14f     -3d13f
2970    Xh 3E2515        -3.4     0.      -4.9 FIXEDHF     0.700  0       0.0  0
2971    Xi 2D2515       -14.1     0.     -20.2 FIXEDHF     0.700  0       0.0  0  4s14f     -3d14f
2972    Xi 3E2515        -3.1     0.      -4.4 FIXEDHF     0.700  0       0.0  0
2973    Xn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s14f     -3d6h
2974    Xn 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2975    Xo 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s14f     -3d7h
2976    Xo 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2977    Xp 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s14f     -3d8h
2978    Xp 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2979    Xq 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s14f     -3d9h
2980    Xq 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2981    Xv 1D2538       353.3     0.     504.7 FIXEDHF     0.700  0       0.0  0  4s14f     -4p4d
2982    Xv 2E2538        47.5     0.      67.8 FIXEDHF     0.700  0       0.0  0
2983    Xw 1D2538       270.7     0.     386.7 FIXEDHF     0.700  0       0.0  0  4s14f     -4p5d
2984    Xw 2E2538        44.0     0.      62.9 FIXEDHF     0.700  0       0.0  0
2985    Xx 1D2538       189.4     0.     270.6 FIXEDHF     0.700  0       0.0  0  4s14f     -4p6d
2986    Xx 2E2538        35.3     0.      50.4 FIXEDHF     0.700  0       0.0  0
2987    Xy 1D2538       133.5     0.     190.7 FIXEDHF     0.700  0       0.0  0  4s14f     -4p7d
2988    Xy 2E2538        28.2     0.      40.3 FIXEDHF     0.700  0       0.0  0
2989    Xz 1D2538        96.3     0.     137.5 FIXEDHF     0.700  0       0.0  0  4s14f     -4p8d
2990    Xz 2E2538        23.0     0.      32.9 FIXEDHF     0.700  0       0.0  0
2991    YZ 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d5f
2992    YZ 2D1515       233.4     0.     333.4 FIXEDHF     0.700  0       0.0  0
2993    YZ 4D1515        52.4     0.      74.8 FIXEDHF     0.700  0       0.0  0
2994    YZ 1E1515        34.9     0.      49.9 FIXEDHF     0.700  0       0.0  0
2995    YZ 3E1515        20.3     0.      29.0 FIXEDHF     0.700  0       0.0  0
2996    YZ 5E1515        14.0     0.      20.0 FIXEDHF     0.700  0       0.0  0
2997    Ya 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d6f
2998    Ya 2D1515       164.3     0.     234.7 FIXEDHF     0.700  0       0.0  0
2999    Ya 4D1515        40.8     0.      58.3 FIXEDHF     0.700  0       0.0  0
3000    Ya 1E1515        29.2     0.      41.7 FIXEDHF     0.700  0       0.0  0
3001    Ya 3E1515        17.0     0.      24.3 FIXEDHF     0.700  0       0.0  0
3002    Ya 5E1515        11.8     0.      16.8 FIXEDHF     0.700  0       0.0  0
3003    Yb 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d7f
3004    Yb 2D1515       125.2     0.     178.9 FIXEDHF     0.700  0       0.0  0
3005    Yb 4D1515        32.8     0.      46.8 FIXEDHF     0.700  0       0.0  0
3006    Yb 1E1515        24.5     0.      35.0 FIXEDHF     0.700  0       0.0  0
3007    Yb 3E1515        14.3     0.      20.4 FIXEDHF     0.700  0       0.0  0
3008    Yb 5E1515         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0
3009    Yc 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d8f
3010    Yc 2D1515       100.0     0.     142.9 FIXEDHF     0.700  0       0.0  0
3011    Yc 4D1515        27.1     0.      38.7 FIXEDHF     0.700  0       0.0  0
3012    Yc 1E1515        20.8     0.      29.7 FIXEDHF     0.700  0       0.0  0
3013    Yc 3E1515        12.1     0.      17.3 FIXEDHF     0.700  0       0.0  0
3014    Yc 5E1515         8.3     0.      11.9 FIXEDHF     0.700  0       0.0  0
3015    Yd 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d9f
3016    Yd 2D1515        82.6     0.     118.0 FIXEDHF     0.700  0       0.0  0
3017    Yd 4D1515        22.8     0.      32.6 FIXEDHF     0.700  0       0.0  0
3018    Yd 1E1515        17.8     0.      25.5 FIXEDHF     0.700  0       0.0  0
3019    Yd 3E1515        10.4     0.      14.9 FIXEDHF     0.700  0       0.0  0
3020    Yd 5E1515         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
3021    Ye 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d10f
3022    Ye 2D1515        69.8     0.      99.7 FIXEDHF     0.700  0       0.0  0
3023    Ye 4D1515        19.6     0.      28.0 FIXEDHF     0.700  0       0.0  0
3024    Ye 1E1515        15.5     0.      22.2 FIXEDHF     0.700  0       0.0  0
3025    Ye 3E1515         9.0     0.      12.9 FIXEDHF     0.700  0       0.0  0
3026    Ye 5E1515         6.2     0.       8.9 FIXEDHF     0.700  0       0.0  0
3027    Yf 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d11f
3028    Yf 2D1515        60.1     0.      85.8 FIXEDHF     0.700  0       0.0  0
3029    Yf 4D1515        17.1     0.      24.4 FIXEDHF     0.700  0       0.0  0
3030    Yf 1E1515        13.7     0.      19.6 FIXEDHF     0.700  0       0.0  0
3031    Yf 3E1515         8.0     0.      11.4 FIXEDHF     0.700  0       0.0  0
3032    Yf 5E1515         5.5     0.       7.8 FIXEDHF     0.700  0       0.0  0
3033    Yg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d12f
3034    Yg 2D1515        52.4     0.      74.9 FIXEDHF     0.700  0       0.0  0
3035    Yg 4D1515        15.0     0.      21.5 FIXEDHF     0.700  0       0.0  0
3036    Yg 1E1515        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
3037    Yg 3E1515         7.1     0.      10.1 FIXEDHF     0.700  0       0.0  0
3038    Yg 5E1515         4.9     0.       7.0 FIXEDHF     0.700  0       0.0  0
3039    Yh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d13f
3040    Yh 2D1515        46.3     0.      66.2 FIXEDHF     0.700  0       0.0  0
3041    Yh 4D1515        13.4     0.      19.1 FIXEDHF     0.700  0       0.0  0
3042    Yh 1E1515        10.9     0.      15.6 FIXEDHF     0.700  0       0.0  0
3043    Yh 3E1515         6.4     0.       9.1 FIXEDHF     0.700  0       0.0  0
3044    Yh 5E1515         4.4     0.       6.3 FIXEDHF     0.700  0       0.0  0
3045    Yi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d14f
3046    Yi 2D1515        41.3     0.      59.0 FIXEDHF     0.700  0       0.0  0
3047    Yi 4D1515        12.0     0.      17.2 FIXEDHF     0.700  0       0.0  0
3048    Yi 1E1515         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0
3049    Yi 3E1515         5.7     0.       8.2 FIXEDHF     0.700  0       0.0  0
3050    Yi 5E1515         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
3051    Yj 2D1526       -64.0     0.     -91.5 FIXEDHF     0.700  0       0.0  0  3d4f      -4s6h
3052    Yj 3E1526        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
3053    Yk 2D1526       -62.2     0.     -88.9 FIXEDHF     0.700  0       0.0  0  3d4f      -4s7h
3054    Yk 3E1526        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
3055    Yl 2D1526       -55.5     0.     -79.3 FIXEDHF     0.700  0       0.0  0  3d4f      -4s8h
3056    Yl 3E1526        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
3057    Ym 2D1526       -48.8     0.     -69.7 FIXEDHF     0.700  0       0.0  0  3d4f      -4s9h
3058    Ym 3E1526        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
3059    Yn 2D1516        47.9     0.      68.4 FIXEDHF     0.700  0       0.0  0  3d4f      -3d6h
3060    Yn 4D1516         3.3     0.       4.7 FIXEDHF     0.700  0       0.0  0
3061    Yn 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3062    Yn 5E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3063    Yo 2D1516        46.5     0.      66.4 FIXEDHF     0.700  0       0.0  0  3d4f      -3d7h
3064    Yo 4D1516         3.5     0.       5.0 FIXEDHF     0.700  0       0.0  0
3065    Yo 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3066    Yo 5E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3067    Yp 2D1516        41.4     0.      59.2 FIXEDHF     0.700  0       0.0  0  3d4f      -3d8h
3068    Yp 4D1516         3.3     0.       4.7 FIXEDHF     0.700  0       0.0  0
3069    Yp 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3070    Yp 5E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3071    Yq 2D1516        36.4     0.      52.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d9h
3072    Yq 4D1516         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
3073    Yq 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3074    Yq 5E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3075    Yr 3D1537       425.6     0.     608.0 FIXEDHF     0.700  0       0.0  0  3d4f      -4p5s
3076    Yr 2E1537        -5.2     0.      -7.4 FIXEDHF     0.700  0       0.0  0
3077    Ys 3D1537        98.7     0.     141.0 FIXEDHF     0.700  0       0.0  0  3d4f      -4p6s
3078    Ys 2E1537         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
3079    Yt 3D1537        59.7     0.      85.3 FIXEDHF     0.700  0       0.0  0  3d4f      -4p7s
3080    Yt 2E1537         4.0     0.       5.7 FIXEDHF     0.700  0       0.0  0
3081    Yu 3D1537        40.8     0.      58.3 FIXEDHF     0.700  0       0.0  0  3d4f      -4p8s
3082    Yu 2E1537         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
3083    Yv 1D1538     -1868.3     0.   -2669.0 FIXEDHF     0.700  0       0.0  0  3d4f      -4p4d
3084    Yv 3D1538      -422.4     0.    -603.5 FIXEDHF     0.700  0       0.0  0
3085    Yv 2E1538       -57.7     0.     -82.5 FIXEDHF     0.700  0       0.0  0
3086    Yv 4E1538       -75.2     0.    -107.4 FIXEDHF     0.700  0       0.0  0
3087    Yw 1D1538      -100.9     0.    -144.2 FIXEDHF     0.700  0       0.0  0  3d4f      -4p5d
3088    Yw 3D1538      -181.9     0.    -259.8 FIXEDHF     0.700  0       0.0  0
3089    Yw 2E1538       -60.2     0.     -86.0 FIXEDHF     0.700  0       0.0  0
3090    Yw 4E1538       -61.9     0.     -88.5 FIXEDHF     0.700  0       0.0  0
3091    Yx 1D1538       -80.2     0.    -114.6 FIXEDHF     0.700  0       0.0  0  3d4f      -4p6d
3092    Yx 3D1538      -113.7     0.    -162.4 FIXEDHF     0.700  0       0.0  0
3093    Yx 2E1538       -49.5     0.     -70.7 FIXEDHF     0.700  0       0.0  0
3094    Yx 4E1538       -47.9     0.     -68.4 FIXEDHF     0.700  0       0.0  0
3095    Yy 1D1538       -51.2     0.     -73.1 FIXEDHF     0.700  0       0.0  0  3d4f      -4p7d
3096    Yy 3D1538       -79.7     0.    -113.8 FIXEDHF     0.700  0       0.0  0
3097    Yy 2E1538       -40.0     0.     -57.1 FIXEDHF     0.700  0       0.0  0
3098    Yy 4E1538       -37.7     0.     -53.8 FIXEDHF     0.700  0       0.0  0
3099    Yz 1D1538       -34.6     0.     -49.5 FIXEDHF     0.700  0       0.0  0  3d4f      -4p8d
3100    Yz 3D1538       -59.7     0.     -85.3 FIXEDHF     0.700  0       0.0  0
3101    Yz 2E1538       -32.8     0.     -46.8 FIXEDHF     0.700  0       0.0  0
3102    Yz 4E1538       -30.3     0.     -43.3 FIXEDHF     0.700  0       0.0  0
3103    Za 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d6f
3104    Za 2D1515       144.8     0.     206.9 FIXEDHF     0.700  0       0.0  0
3105    Za 4D1515        34.2     0.      48.8 FIXEDHF     0.700  0       0.0  0
3106    Za 1E1515        26.0     0.      37.1 FIXEDHF     0.700  0       0.0  0
3107    Za 3E1515        15.1     0.      21.6 FIXEDHF     0.700  0       0.0  0
3108    Za 5E1515        10.4     0.      14.9 FIXEDHF     0.700  0       0.0  0
3109    Zb 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d7f
3110    Zb 2D1515       110.8     0.     158.3 FIXEDHF     0.700  0       0.0  0
3111    Zb 4D1515        27.7     0.      39.6 FIXEDHF     0.700  0       0.0  0
3112    Zb 1E1515        21.8     0.      31.1 FIXEDHF     0.700  0       0.0  0
3113    Zb 3E1515        12.7     0.      18.1 FIXEDHF     0.700  0       0.0  0
3114    Zb 5E1515         8.8     0.      12.5 FIXEDHF     0.700  0       0.0  0
3115    Zc 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d8f
3116    Zc 2D1515        88.8     0.     126.9 FIXEDHF     0.700  0       0.0  0
3117    Zc 4D1515        23.0     0.      32.9 FIXEDHF     0.700  0       0.0  0
3118    Zc 1E1515        18.5     0.      26.4 FIXEDHF     0.700  0       0.0  0
3119    Zc 3E1515        10.8     0.      15.4 FIXEDHF     0.700  0       0.0  0
3120    Zc 5E1515         7.4     0.      10.6 FIXEDHF     0.700  0       0.0  0
3121    Zd 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d9f
3122    Zd 2D1515        73.4     0.     104.9 FIXEDHF     0.700  0       0.0  0
3123    Zd 4D1515        19.5     0.      27.8 FIXEDHF     0.700  0       0.0  0
3124    Zd 1E1515        15.9     0.      22.7 FIXEDHF     0.700  0       0.0  0
3125    Zd 3E1515         9.3     0.      13.3 FIXEDHF     0.700  0       0.0  0
3126    Zd 5E1515         6.4     0.       9.1 FIXEDHF     0.700  0       0.0  0
3127    Ze 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d10f
3128    Ze 2D1515        62.2     0.      88.8 FIXEDHF     0.700  0       0.0  0
3129    Ze 4D1515        16.8     0.      24.0 FIXEDHF     0.700  0       0.0  0
3130    Ze 1E1515        13.9     0.      19.8 FIXEDHF     0.700  0       0.0  0
3131    Ze 3E1515         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0
3132    Ze 5E1515         5.6     0.       8.0 FIXEDHF     0.700  0       0.0  0
3133    Zf 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d11f
3134    Zf 2D1515        53.5     0.      76.5 FIXEDHF     0.700  0       0.0  0
3135    Zf 4D1515        14.6     0.      20.9 FIXEDHF     0.700  0       0.0  0
3136    Zf 1E1515        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
3137    Zf 3E1515         7.1     0.      10.2 FIXEDHF     0.700  0       0.0  0
3138    Zf 5E1515         4.9     0.       7.0 FIXEDHF     0.700  0       0.0  0
3139    Zg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d12f
3140    Zg 2D1515        46.8     0.      66.9 FIXEDHF     0.700  0       0.0  0
3141    Zg 4D1515        12.9     0.      18.4 FIXEDHF     0.700  0       0.0  0
3142    Zg 1E1515        10.8     0.      15.5 FIXEDHF     0.700  0       0.0  0
3143    Zg 3E1515         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
3144    Zg 5E1515         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
3145    Zh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d13f
3146    Zh 2D1515        41.4     0.      59.1 FIXEDHF     0.700  0       0.0  0
3147    Zh 4D1515        11.5     0.      16.4 FIXEDHF     0.700  0       0.0  0
3148    Zh 1E1515         9.7     0.      13.9 FIXEDHF     0.700  0       0.0  0
3149    Zh 3E1515         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0
3150    Zh 5E1515         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
3151    Zi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d14f
3152    Zi 2D1515        37.0     0.      52.8 FIXEDHF     0.700  0       0.0  0
3153    Zi 4D1515        10.4     0.      14.8 FIXEDHF     0.700  0       0.0  0
3154    Zi 1E1515         8.8     0.      12.5 FIXEDHF     0.700  0       0.0  0
3155    Zi 3E1515         5.1     0.       7.3 FIXEDHF     0.700  0       0.0  0
3156    Zi 5E1515         3.5     0.       5.0 FIXEDHF     0.700  0       0.0  0
3157    Zj 2D1526        15.3     0.      21.8 FIXEDHF     0.700  0       0.0  0  3d5f      -4s6h
3158    Zj 3E1526        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0
3159    Zk 2D1526        -2.0     0.      -2.9 FIXEDHF     0.700  0       0.0  0  3d5f      -4s7h
3160    Zk 3E1526        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
3161    Zl 2D1526        -8.3     0.     -11.9 FIXEDHF     0.700  0       0.0  0  3d5f      -4s8h
3162    Zl 3E1526        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0
3163    Zm 2D1526       -10.4     0.     -14.8 FIXEDHF     0.700  0       0.0  0  3d5f      -4s9h
3164    Zm 3E1526        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0
3165    Zn 2D1516       -11.4     0.     -16.3 FIXEDHF     0.700  0       0.0  0  3d5f      -3d6h
3166    Zn 4D1516         1.1     0.       1.6 FIXEDHF     0.700  0       0.0  0
3167    Zn 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3168    Zn 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3169    Zo 2D1516         1.5     0.       2.2 FIXEDHF     0.700  0       0.0  0  3d5f      -3d7h
3170    Zo 4D1516         1.5     0.       2.1 FIXEDHF     0.700  0       0.0  0
3171    Zo 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3172    Zo 5E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3173    Zp 2D1516         6.2     0.       8.9 FIXEDHF     0.700  0       0.0  0  3d5f      -3d8h
3174    Zp 4D1516         1.5     0.       2.2 FIXEDHF     0.700  0       0.0  0
3175    Zp 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3176    Zp 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3177    Zq 2D1516         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0  3d5f      -3d9h
3178    Zq 4D1516         1.5     0.       2.1 FIXEDHF     0.700  0       0.0  0
3179    Zq 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3180    Zq 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3181    Zr 3D1537       323.8     0.     462.6 FIXEDHF     0.700  0       0.0  0  3d5f      -4p5s
3182    Zr 2E1537       -13.4     0.     -19.2 FIXEDHF     0.700  0       0.0  0
3183    Zs 3D1537       117.4     0.     167.7 FIXEDHF     0.700  0       0.0  0  3d5f      -4p6s
3184    Zs 2E1537        -1.5     0.      -2.1 FIXEDHF     0.700  0       0.0  0
3185    Zt 3D1537        56.6     0.      80.8 FIXEDHF     0.700  0       0.0  0  3d5f      -4p7s
3186    Zt 2E1537         0.9     0.       1.3 FIXEDHF     0.700  0       0.0  0
3187    Zu 3D1537        39.0     0.      55.7 FIXEDHF     0.700  0       0.0  0  3d5f      -4p8s
3188    Zu 2E1537         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0
3189    Zv 1D1538     -1171.9     0.   -1674.1 FIXEDHF     0.700  0       0.0  0  3d5f      -4p4d
3190    Zv 3D1538      -317.8     0.    -454.0 FIXEDHF     0.700  0       0.0  0
3191    Zv 2E1538       -44.2     0.     -63.2 FIXEDHF     0.700  0       0.0  0
3192    Zv 4E1538       -62.2     0.     -88.9 FIXEDHF     0.700  0       0.0  0
3193    Zw 1D1538      -661.9     0.    -945.6 FIXEDHF     0.700  0       0.0  0  3d5f      -4p5d
3194    Zw 3D1538      -178.4     0.    -254.9 FIXEDHF     0.700  0       0.0  0
3195    Zw 2E1538       -49.5     0.     -70.7 FIXEDHF     0.700  0       0.0  0
3196    Zw 4E1538       -52.8     0.     -75.4 FIXEDHF     0.700  0       0.0  0
3197    Zx 1D1538       -49.9     0.     -71.3 FIXEDHF     0.700  0       0.0  0  3d5f      -4p6d
3198    Zx 3D1538      -106.9     0.    -152.7 FIXEDHF     0.700  0       0.0  0
3199    Zx 2E1538       -41.3     0.     -59.0 FIXEDHF     0.700  0       0.0  0
3200    Zx 4E1538       -41.2     0.     -58.8 FIXEDHF     0.700  0       0.0  0
3201    Zy 1D1538       -51.4     0.     -73.5 FIXEDHF     0.700  0       0.0  0  3d5f      -4p7d
3202    Zy 3D1538       -75.0     0.    -107.2 FIXEDHF     0.700  0       0.0  0
3203    Zy 2E1538       -33.7     0.     -48.1 FIXEDHF     0.700  0       0.0  0
3204    Zy 4E1538       -32.5     0.     -46.4 FIXEDHF     0.700  0       0.0  0
3205    Zz 1D1538       -37.0     0.     -52.9 FIXEDHF     0.700  0       0.0  0  3d5f      -4p8d
3206    Zz 3D1538       -56.4     0.     -80.6 FIXEDHF     0.700  0       0.0  0
3207    Zz 2E1538       -27.6     0.     -39.5 FIXEDHF     0.700  0       0.0  0
3208    Zz 4E1538       -26.3     0.     -37.5 FIXEDHF     0.700  0       0.0  0
3209    ab 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d7f
3210    ab 2D1515        91.8     0.     131.2 FIXEDHF     0.700  0       0.0  0
3211    ab 4D1515        22.5     0.      32.1 FIXEDHF     0.700  0       0.0  0
3212    ab 1E1515        18.3     0.      26.1 FIXEDHF     0.700  0       0.0  0
3213    ab 3E1515        10.6     0.      15.2 FIXEDHF     0.700  0       0.0  0
3214    ab 5E1515         7.3     0.      10.5 FIXEDHF     0.700  0       0.0  0
3215    ac 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d8f
3216    ac 2D1515        73.7     0.     105.3 FIXEDHF     0.700  0       0.0  0
3217    ac 4D1515        18.7     0.      26.7 FIXEDHF     0.700  0       0.0  0
3218    ac 1E1515        15.5     0.      22.1 FIXEDHF     0.700  0       0.0  0
3219    ac 3E1515         9.0     0.      12.9 FIXEDHF     0.700  0       0.0  0
3220    ac 5E1515         6.2     0.       8.9 FIXEDHF     0.700  0       0.0  0
3221    ad 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d9f
3222    ad 2D1515        61.0     0.      87.2 FIXEDHF     0.700  0       0.0  0
3223    ad 4D1515        15.9     0.      22.7 FIXEDHF     0.700  0       0.0  0
3224    ad 1E1515        13.3     0.      19.0 FIXEDHF     0.700  0       0.0  0
3225    ad 3E1515         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0
3226    ad 5E1515         5.4     0.       7.7 FIXEDHF     0.700  0       0.0  0
3227    ae 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d10f
3228    ae 2D1515        51.7     0.      73.9 FIXEDHF     0.700  0       0.0  0
3229    ae 4D1515        13.6     0.      19.5 FIXEDHF     0.700  0       0.0  0
3230    ae 1E1515        11.6     0.      16.6 FIXEDHF     0.700  0       0.0  0
3231    ae 3E1515         6.8     0.       9.7 FIXEDHF     0.700  0       0.0  0
3232    ae 5E1515         4.7     0.       6.7 FIXEDHF     0.700  0       0.0  0
3233    af 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d11f
3234    af 2D1515        44.6     0.      63.7 FIXEDHF     0.700  0       0.0  0
3235    af 4D1515        12.0     0.      17.1 FIXEDHF     0.700  0       0.0  0
3236    af 1E1515        10.2     0.      14.6 FIXEDHF     0.700  0       0.0  0
3237    af 3E1515         5.9     0.       8.5 FIXEDHF     0.700  0       0.0  0
3238    af 5E1515         4.1     0.       5.9 FIXEDHF     0.700  0       0.0  0
3239    ag 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d12f
3240    ag 2D1515        39.0     0.      55.7 FIXEDHF     0.700  0       0.0  0
3241    ag 4D1515        10.6     0.      15.1 FIXEDHF     0.700  0       0.0  0
3242    ag 1E1515         9.1     0.      13.0 FIXEDHF     0.700  0       0.0  0
3243    ag 3E1515         5.3     0.       7.6 FIXEDHF     0.700  0       0.0  0
3244    ag 5E1515         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
3245    ah 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d13f
3246    ah 2D1515        34.5     0.      49.3 FIXEDHF     0.700  0       0.0  0
3247    ah 4D1515         9.4     0.      13.4 FIXEDHF     0.700  0       0.0  0
3248    ah 1E1515         8.1     0.      11.6 FIXEDHF     0.700  0       0.0  0
3249    ah 3E1515         4.8     0.       6.8 FIXEDHF     0.700  0       0.0  0
3250    ah 5E1515         3.3     0.       4.7 FIXEDHF     0.700  0       0.0  0
3251    ai 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d14f
3252    ai 2D1515        30.8     0.      44.0 FIXEDHF     0.700  0       0.0  0
3253    ai 4D1515         8.5     0.      12.1 FIXEDHF     0.700  0       0.0  0
3254    ai 1E1515         7.3     0.      10.5 FIXEDHF     0.700  0       0.0  0
3255    ai 3E1515         4.3     0.       6.1 FIXEDHF     0.700  0       0.0  0
3256    ai 5E1515         2.9     0.       4.2 FIXEDHF     0.700  0       0.0  0
3257    aj 2D1526         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d6f      -4s6h
3258    aj 3E1526        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
3259    ak 2D1526         6.9     0.       9.9 FIXEDHF     0.700  0       0.0  0  3d6f      -4s7h
3260    ak 3E1526        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
3261    al 2D1526         2.9     0.       4.2 FIXEDHF     0.700  0       0.0  0  3d6f      -4s8h
3262    al 3E1526        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
3263    am 2D1526         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0  3d6f      -4s9h
3264    am 3E1526        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
3265    an 2D1516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d6f      -3d6h
3266    an 4D1516         0.8     0.       1.1 FIXEDHF     0.700  0       0.0  0
3267    an 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3268    an 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3269    ao 2D1516        -5.2     0.      -7.4 FIXEDHF     0.700  0       0.0  0  3d6f      -3d7h
3270    ao 4D1516         0.9     0.       1.3 FIXEDHF     0.700  0       0.0  0
3271    ao 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3272    ao 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3273    ap 2D1516        -2.2     0.      -3.2 FIXEDHF     0.700  0       0.0  0  3d6f      -3d8h
3274    ap 4D1516         1.0     0.       1.4 FIXEDHF     0.700  0       0.0  0
3275    ap 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3276    ap 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3277    aq 2D1516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0  3d6f      -3d9h
3278    aq 4D1516         0.9     0.       1.3 FIXEDHF     0.700  0       0.0  0
3279    aq 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3280    aq 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3281    ar 3D1537       248.4     0.     354.9 FIXEDHF     0.700  0       0.0  0  3d6f      -4p5s
3282    ar 2E1537       -15.5     0.     -22.1 FIXEDHF     0.700  0       0.0  0
3283    as 3D1537       102.6     0.     146.6 FIXEDHF     0.700  0       0.0  0  3d6f      -4p6s
3284    as 2E1537        -3.3     0.      -4.7 FIXEDHF     0.700  0       0.0  0
3285    at 3D1537        53.3     0.      76.2 FIXEDHF     0.700  0       0.0  0  3d6f      -4p7s
3286    at 2E1537        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
3287    au 3D1537        33.8     0.      48.3 FIXEDHF     0.700  0       0.0  0  3d6f      -4p8s
3288    au 2E1537         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3289    av 1D1538      -830.9     0.   -1187.0 FIXEDHF     0.700  0       0.0  0  3d6f      -4p4d
3290    av 3D1538      -243.9     0.    -348.5 FIXEDHF     0.700  0       0.0  0
3291    av 2E1538       -33.6     0.     -48.0 FIXEDHF     0.700  0       0.0  0
3292    av 4E1538       -49.9     0.     -71.3 FIXEDHF     0.700  0       0.0  0
3293    aw 1D1538      -533.5     0.    -762.2 FIXEDHF     0.700  0       0.0  0  3d6f      -4p5d
3294    aw 3D1538      -147.6     0.    -210.9 FIXEDHF     0.700  0       0.0  0
3295    aw 2E1538       -39.5     0.     -56.4 FIXEDHF     0.700  0       0.0  0
3296    aw 4E1538       -43.0     0.     -61.5 FIXEDHF     0.700  0       0.0  0
3297    ax 1D1538      -282.5     0.    -403.6 FIXEDHF     0.700  0       0.0  0  3d6f      -4p6d
3298    ax 3D1538       -94.0     0.    -134.3 FIXEDHF     0.700  0       0.0  0
3299    ax 2E1538       -33.3     0.     -47.6 FIXEDHF     0.700  0       0.0  0
3300    ax 4E1538       -33.7     0.     -48.2 FIXEDHF     0.700  0       0.0  0
3301    ay 1D1538       -24.9     0.     -35.6 FIXEDHF     0.700  0       0.0  0  3d6f      -4p7d
3302    ay 3D1538       -64.9     0.     -92.7 FIXEDHF     0.700  0       0.0  0
3303    ay 2E1538       -27.2     0.     -38.9 FIXEDHF     0.700  0       0.0  0
3304    ay 4E1538       -26.7     0.     -38.2 FIXEDHF     0.700  0       0.0  0
3305    az 1D1538       -31.6     0.     -45.2 FIXEDHF     0.700  0       0.0  0  3d6f      -4p8d
3306    az 3D1538       -48.8     0.     -69.7 FIXEDHF     0.700  0       0.0  0
3307    az 2E1538       -22.5     0.     -32.1 FIXEDHF     0.700  0       0.0  0
3308    az 4E1538       -21.6     0.     -30.9 FIXEDHF     0.700  0       0.0  0
3309    bc 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d8f
3310    bc 2D1515        61.2     0.      87.4 FIXEDHF     0.700  0       0.0  0
3311    bc 4D1515        15.4     0.      22.0 FIXEDHF     0.700  0       0.0  0
3312    bc 1E1515        13.0     0.      18.6 FIXEDHF     0.700  0       0.0  0
3313    bc 3E1515         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0
3314    bc 5E1515         5.3     0.       7.5 FIXEDHF     0.700  0       0.0  0
3315    bd 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d9f
3316    bd 2D1515        50.8     0.      72.5 FIXEDHF     0.700  0       0.0  0
3317    bd 4D1515        13.1     0.      18.7 FIXEDHF     0.700  0       0.0  0
3318    bd 1E1515        11.2     0.      16.0 FIXEDHF     0.700  0       0.0  0
3319    bd 3E1515         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0
3320    bd 5E1515         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0
3321    be 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d10f
3322    be 2D1515        43.0     0.      61.4 FIXEDHF     0.700  0       0.0  0
3323    be 4D1515        11.3     0.      16.1 FIXEDHF     0.700  0       0.0  0
3324    be 1E1515         9.7     0.      13.9 FIXEDHF     0.700  0       0.0  0
3325    be 3E1515         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0
3326    be 5E1515         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
3327    bf 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d11f
3328    bf 2D1515        37.1     0.      53.0 FIXEDHF     0.700  0       0.0  0
3329    bf 4D1515         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0
3330    bf 1E1515         8.6     0.      12.3 FIXEDHF     0.700  0       0.0  0
3331    bf 3E1515         5.0     0.       7.2 FIXEDHF     0.700  0       0.0  0
3332    bf 5E1515         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0
3333    bg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d12f
3334    bg 2D1515        32.5     0.      46.4 FIXEDHF     0.700  0       0.0  0
3335    bg 4D1515         8.7     0.      12.4 FIXEDHF     0.700  0       0.0  0
3336    bg 1E1515         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0
3337    bg 3E1515         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0
3338    bg 5E1515         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
3339    bh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d13f
3340    bh 2D1515        28.8     0.      41.1 FIXEDHF     0.700  0       0.0  0
3341    bh 4D1515         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0
3342    bh 1E1515         6.9     0.       9.8 FIXEDHF     0.700  0       0.0  0
3343    bh 3E1515         4.0     0.       5.7 FIXEDHF     0.700  0       0.0  0
3344    bh 5E1515         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0
3345    bi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d14f
3346    bi 2D1515        25.7     0.      36.7 FIXEDHF     0.700  0       0.0  0
3347    bi 4D1515         7.0     0.      10.0 FIXEDHF     0.700  0       0.0  0
3348    bi 1E1515         6.2     0.       8.8 FIXEDHF     0.700  0       0.0  0
3349    bi 3E1515         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
3350    bi 5E1515         2.5     0.       3.6 FIXEDHF     0.700  0       0.0  0
3351    bj 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d7f      -4s6h
3352    bj 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3353    bk 2D1526         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d7f      -4s7h
3354    bk 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3355    bl 2D1526         3.2     0.       4.6 FIXEDHF     0.700  0       0.0  0  3d7f      -4s8h
3356    bl 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3357    bm 2D1526         2.3     0.       3.3 FIXEDHF     0.700  0       0.0  0  3d7f      -4s9h
3358    bm 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3359    bn 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d7f      -3d6h
3360    bn 4D1516         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
3361    bn 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3362    bn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3363    bo 2D1516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d7f      -3d7h
3364    bo 4D1516         0.7     0.       1.0 FIXEDHF     0.700  0       0.0  0
3365    bo 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3366    bo 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3367    bp 2D1516        -2.4     0.      -3.5 FIXEDHF     0.700  0       0.0  0  3d7f      -3d8h
3368    bp 4D1516         0.7     0.       1.0 FIXEDHF     0.700  0       0.0  0
3369    bp 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3370    bp 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3371    bq 2D1516        -1.8     0.      -2.5 FIXEDHF     0.700  0       0.0  0  3d7f      -3d9h
3372    bq 4D1516         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0
3373    bq 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3374    bq 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3375    br 3D1537       197.0     0.     281.4 FIXEDHF     0.700  0       0.0  0  3d7f      -4p5s
3376    br 2E1537       -15.3     0.     -21.8 FIXEDHF     0.700  0       0.0  0
3377    bs 3D1537        86.6     0.     123.7 FIXEDHF     0.700  0       0.0  0  3d7f      -4p6s
3378    bs 2E1537        -3.8     0.      -5.5 FIXEDHF     0.700  0       0.0  0
3379    bt 3D1537        46.8     0.      66.9 FIXEDHF     0.700  0       0.0  0  3d7f      -4p7s
3380    bt 2E1537        -1.1     0.      -1.6 FIXEDHF     0.700  0       0.0  0
3381    bu 3D1537        30.0     0.      42.8 FIXEDHF     0.700  0       0.0  0  3d7f      -4p8s
3382    bu 2E1537        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3383    bv 1D1538      -632.4     0.    -903.4 FIXEDHF     0.700  0       0.0  0  3d7f      -4p4d
3384    bv 3D1538      -194.0     0.    -277.2 FIXEDHF     0.700  0       0.0  0
3385    bv 2E1538       -26.4     0.     -37.7 FIXEDHF     0.700  0       0.0  0
3386    bv 4E1538       -40.7     0.     -58.1 FIXEDHF     0.700  0       0.0  0
3387    bw 1D1538      -427.3     0.    -610.5 FIXEDHF     0.700  0       0.0  0  3d7f      -4p5d
3388    bw 3D1538      -121.7     0.    -173.9 FIXEDHF     0.700  0       0.0  0
3389    bw 2E1538       -32.1     0.     -45.8 FIXEDHF     0.700  0       0.0  0
3390    bw 4E1538       -35.4     0.     -50.6 FIXEDHF     0.700  0       0.0  0
3391    bx 1D1538      -256.2     0.    -366.0 FIXEDHF     0.700  0       0.0  0  3d7f      -4p6d
3392    bx 3D1538       -79.6     0.    -113.7 FIXEDHF     0.700  0       0.0  0
3393    bx 2E1538       -27.2     0.     -38.9 FIXEDHF     0.700  0       0.0  0
3394    bx 4E1538       -27.9     0.     -39.8 FIXEDHF     0.700  0       0.0  0
3395    by 1D1538      -137.6     0.    -196.6 FIXEDHF     0.700  0       0.0  0  3d7f      -4p7d
3396    by 3D1538       -55.9     0.     -79.9 FIXEDHF     0.700  0       0.0  0
3397    by 2E1538       -22.3     0.     -31.9 FIXEDHF     0.700  0       0.0  0
3398    by 4E1538       -22.1     0.     -31.6 FIXEDHF     0.700  0       0.0  0
3399    bz 1D1538       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0  3d7f      -4p8d
3400    bz 3D1538       -41.7     0.     -59.6 FIXEDHF     0.700  0       0.0  0
3401    bz 2E1538       -18.5     0.     -26.4 FIXEDHF     0.700  0       0.0  0
3402    bz 4E1538       -17.9     0.     -25.6 FIXEDHF     0.700  0       0.0  0
3403    cd 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d9f
3404    cd 2D1515        42.7     0.      61.0 FIXEDHF     0.700  0       0.0  0
3405    cd 4D1515        10.9     0.      15.6 FIXEDHF     0.700  0       0.0  0
3406    cd 1E1515         9.5     0.      13.6 FIXEDHF     0.700  0       0.0  0
3407    cd 3E1515         5.5     0.       7.9 FIXEDHF     0.700  0       0.0  0
3408    cd 5E1515         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
3409    ce 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d10f
3410    ce 2D1515        36.2     0.      51.7 FIXEDHF     0.700  0       0.0  0
3411    ce 4D1515         9.4     0.      13.5 FIXEDHF     0.700  0       0.0  0
3412    ce 1E1515         8.3     0.      11.8 FIXEDHF     0.700  0       0.0  0
3413    ce 3E1515         4.8     0.       6.9 FIXEDHF     0.700  0       0.0  0
3414    ce 5E1515         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
3415    cf 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d11f
3416    cf 2D1515        31.2     0.      44.6 FIXEDHF     0.700  0       0.0  0
3417    cf 4D1515         8.3     0.      11.8 FIXEDHF     0.700  0       0.0  0
3418    cf 1E1515         7.3     0.      10.4 FIXEDHF     0.700  0       0.0  0
3419    cf 3E1515         4.3     0.       6.1 FIXEDHF     0.700  0       0.0  0
3420    cf 5E1515         2.9     0.       4.2 FIXEDHF     0.700  0       0.0  0
3421    cg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d12f
3422    cg 2D1515        27.4     0.      39.1 FIXEDHF     0.700  0       0.0  0
3423    cg 4D1515         7.3     0.      10.4 FIXEDHF     0.700  0       0.0  0
3424    cg 1E1515         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0
3425    cg 3E1515         3.8     0.       5.4 FIXEDHF     0.700  0       0.0  0
3426    cg 5E1515         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0
3427    ch 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d13f
3428    ch 2D1515        24.2     0.      34.6 FIXEDHF     0.700  0       0.0  0
3429    ch 4D1515         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0
3430    ch 1E1515         5.8     0.       8.3 FIXEDHF     0.700  0       0.0  0
3431    ch 3E1515         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
3432    ch 5E1515         2.3     0.       3.3 FIXEDHF     0.700  0       0.0  0
3433    ci 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d14f
3434    ci 2D1515        21.6     0.      30.9 FIXEDHF     0.700  0       0.0  0
3435    ci 4D1515         5.9     0.       8.4 FIXEDHF     0.700  0       0.0  0
3436    ci 1E1515         5.3     0.       7.5 FIXEDHF     0.700  0       0.0  0
3437    ci 3E1515         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
3438    ci 5E1515         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0
3439    cj 2D1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d8f      -4s6h
3440    cj 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3441    ck 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d8f      -4s7h
3442    ck 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3443    cl 2D1526         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d8f      -4s8h
3444    cl 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3445    cm 2D1526         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0  3d8f      -4s9h
3446    cm 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3447    cn 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d8f      -3d6h
3448    cn 4D1516         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3449    cn 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3450    cn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3451    co 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d8f      -3d7h
3452    co 4D1516         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
3453    co 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3454    co 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3455    cp 2D1516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d8f      -3d8h
3456    cp 4D1516         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
3457    cp 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3458    cp 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3459    cq 2D1516        -1.3     0.      -1.8 FIXEDHF     0.700  0       0.0  0  3d8f      -3d9h
3460    cq 4D1516         0.5     0.       0.7 FIXEDHF     0.700  0       0.0  0
3461    cq 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3462    cq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3463    cr 3D1537       160.8     0.     229.7 FIXEDHF     0.700  0       0.0  0  3d8f      -4p5s
3464    cr 2E1537       -14.3     0.     -20.4 FIXEDHF     0.700  0       0.0  0
3465    cs 3D1537        73.4     0.     104.8 FIXEDHF     0.700  0       0.0  0  3d8f      -4p6s
3466    cs 2E1537        -3.9     0.      -5.6 FIXEDHF     0.700  0       0.0  0
3467    ct 3D1537        40.6     0.      58.0 FIXEDHF     0.700  0       0.0  0  3d8f      -4p7s
3468    ct 2E1537        -1.4     0.      -2.0 FIXEDHF     0.700  0       0.0  0
3469    cu 3D1537        26.3     0.      37.5 FIXEDHF     0.700  0       0.0  0  3d8f      -4p8s
3470    cu 2E1537        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
3471    cv 1D1538      -503.9     0.    -719.8 FIXEDHF     0.700  0       0.0  0  3d8f      -4p4d
3472    cv 3D1538      -158.9     0.    -227.0 FIXEDHF     0.700  0       0.0  0
3473    cv 2E1538       -21.3     0.     -30.5 FIXEDHF     0.700  0       0.0  0
3474    cv 4E1538       -33.8     0.     -48.3 FIXEDHF     0.700  0       0.0  0
3475    cw 1D1538      -350.0     0.    -500.0 FIXEDHF     0.700  0       0.0  0  3d8f      -4p5d
3476    cw 3D1538      -101.8     0.    -145.5 FIXEDHF     0.700  0       0.0  0
3477    cw 2E1538       -26.6     0.     -38.0 FIXEDHF     0.700  0       0.0  0
3478    cw 4E1538       -29.7     0.     -42.4 FIXEDHF     0.700  0       0.0  0
3479    cx 1D1538      -220.4     0.    -314.8 FIXEDHF     0.700  0       0.0  0  3d8f      -4p6d
3480    cx 3D1538       -67.5     0.     -96.5 FIXEDHF     0.700  0       0.0  0
3481    cx 2E1538       -22.8     0.     -32.5 FIXEDHF     0.700  0       0.0  0
3482    cx 4E1538       -23.4     0.     -33.5 FIXEDHF     0.700  0       0.0  0
3483    cy 1D1538      -134.0     0.    -191.5 FIXEDHF     0.700  0       0.0  0  3d8f      -4p7d
3484    cy 3D1538       -47.9     0.     -68.5 FIXEDHF     0.700  0       0.0  0
3485    cy 2E1538       -18.7     0.     -26.7 FIXEDHF     0.700  0       0.0  0
3486    cy 4E1538       -18.6     0.     -26.6 FIXEDHF     0.700  0       0.0  0
3487    cz 1D1538       -74.0     0.    -105.7 FIXEDHF     0.700  0       0.0  0  3d8f      -4p8d
3488    cz 3D1538       -36.0     0.     -51.5 FIXEDHF     0.700  0       0.0  0
3489    cz 2E1538       -15.4     0.     -22.0 FIXEDHF     0.700  0       0.0  0
3490    cz 4E1538       -15.1     0.     -21.6 FIXEDHF     0.700  0       0.0  0
3491    de 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d10f
3492    de 2D1515        30.9     0.      44.1 FIXEDHF     0.700  0       0.0  0
3493    de 4D1515         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0
3494    de 1E1515         7.1     0.      10.2 FIXEDHF     0.700  0       0.0  0
3495    de 3E1515         4.1     0.       5.9 FIXEDHF     0.700  0       0.0  0
3496    de 5E1515         2.9     0.       4.1 FIXEDHF     0.700  0       0.0  0
3497    df 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d11f
3498    df 2D1515        26.7     0.      38.1 FIXEDHF     0.700  0       0.0  0
3499    df 4D1515         7.1     0.      10.1 FIXEDHF     0.700  0       0.0  0
3500    df 1E1515         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
3501    df 3E1515         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
3502    df 5E1515         2.5     0.       3.6 FIXEDHF     0.700  0       0.0  0
3503    dg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d12f
3504    dg 2D1515        23.4     0.      33.4 FIXEDHF     0.700  0       0.0  0
3505    dg 4D1515         6.2     0.       8.9 FIXEDHF     0.700  0       0.0  0
3506    dg 1E1515         5.6     0.       8.0 FIXEDHF     0.700  0       0.0  0
3507    dg 3E1515         3.3     0.       4.7 FIXEDHF     0.700  0       0.0  0
3508    dg 5E1515         2.2     0.       3.2 FIXEDHF     0.700  0       0.0  0
3509    dh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d13f
3510    dh 2D1515        20.6     0.      29.5 FIXEDHF     0.700  0       0.0  0
3511    dh 4D1515         5.5     0.       7.9 FIXEDHF     0.700  0       0.0  0
3512    dh 1E1515         5.0     0.       7.2 FIXEDHF     0.700  0       0.0  0
3513    dh 3E1515         2.9     0.       4.2 FIXEDHF     0.700  0       0.0  0
3514    dh 5E1515         2.0     0.       2.9 FIXEDHF     0.700  0       0.0  0
3515    di 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d14f
3516    di 2D1515        18.5     0.      26.4 FIXEDHF     0.700  0       0.0  0
3517    di 4D1515         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0
3518    di 1E1515         4.5     0.       6.5 FIXEDHF     0.700  0       0.0  0
3519    di 3E1515         2.7     0.       3.8 FIXEDHF     0.700  0       0.0  0
3520    di 5E1515         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0
3521    dj 2D1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d9f      -4s6h
3522    dj 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3523    dk 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d9f      -4s7h
3524    dk 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3525    dl 2D1526         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -4s8h
3526    dl 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3527    dm 2D1526         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d9f      -4s9h
3528    dm 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3529    dn 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d9f      -3d6h
3530    dn 4D1516         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
3531    dn 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3532    dn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3533    do 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d9f      -3d7h
3534    do 4D1516         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3535    do 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3536    do 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3537    dp 2D1516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d8h
3538    dp 4D1516         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3539    dp 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3540    dp 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3541    dq 2D1516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d9f      -3d9h
3542    dq 4D1516         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3543    dq 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3544    dq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3545    dr 3D1537       134.4     0.     192.0 FIXEDHF     0.700  0       0.0  0  3d9f      -4p5s
3546    dr 2E1537       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0
3547    ds 3D1537        62.8     0.      89.7 FIXEDHF     0.700  0       0.0  0  3d9f      -4p6s
3548    ds 2E1537        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0
3549    dt 3D1537        35.2     0.      50.3 FIXEDHF     0.700  0       0.0  0  3d9f      -4p7s
3550    dt 2E1537        -1.5     0.      -2.1 FIXEDHF     0.700  0       0.0  0
3551    du 3D1537        23.0     0.      32.8 FIXEDHF     0.700  0       0.0  0  3d9f      -4p8s
3552    du 2E1537        -0.6     0.      -0.9 FIXEDHF     0.700  0       0.0  0
3553    dv 1D1538      -414.6     0.    -592.3 FIXEDHF     0.700  0       0.0  0  3d9f      -4p4d
3554    dv 3D1538      -133.2     0.    -190.3 FIXEDHF     0.700  0       0.0  0
3555    dv 2E1538       -17.6     0.     -25.2 FIXEDHF     0.700  0       0.0  0
3556    dv 4E1538       -28.6     0.     -40.8 FIXEDHF     0.700  0       0.0  0
3557    dw 1D1538      -293.0     0.    -418.6 FIXEDHF     0.700  0       0.0  0  3d9f      -4p5d
3558    dw 3D1538       -86.6     0.    -123.7 FIXEDHF     0.700  0       0.0  0
3559    dw 2E1538       -22.5     0.     -32.1 FIXEDHF     0.700  0       0.0  0
3560    dw 4E1538       -25.3     0.     -36.1 FIXEDHF     0.700  0       0.0  0
3561    dx 1D1538      -189.3     0.    -270.5 FIXEDHF     0.700  0       0.0  0  3d9f      -4p6d
3562    dx 3D1538       -58.0     0.     -82.8 FIXEDHF     0.700  0       0.0  0
3563    dx 2E1538       -19.3     0.     -27.5 FIXEDHF     0.700  0       0.0  0
3564    dx 4E1538       -20.0     0.     -28.6 FIXEDHF     0.700  0       0.0  0
3565    dy 1D1538      -121.0     0.    -172.8 FIXEDHF     0.700  0       0.0  0  3d9f      -4p7d
3566    dy 3D1538       -41.4     0.     -59.1 FIXEDHF     0.700  0       0.0  0
3567    dy 2E1538       -15.9     0.     -22.7 FIXEDHF     0.700  0       0.0  0
3568    dy 4E1538       -15.9     0.     -22.7 FIXEDHF     0.700  0       0.0  0
3569    dz 1D1538       -75.7     0.    -108.1 FIXEDHF     0.700  0       0.0  0  3d9f      -4p8d
3570    dz 3D1538       -31.2     0.     -44.6 FIXEDHF     0.700  0       0.0  0
3571    dz 2E1538       -13.1     0.     -18.7 FIXEDHF     0.700  0       0.0  0
3572    dz 4E1538       -12.9     0.     -18.4 FIXEDHF     0.700  0       0.0  0
3573    ef 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d11f
3574    ef 2D1515        23.1     0.      33.0 FIXEDHF     0.700  0       0.0  0
3575    ef 4D1515         6.1     0.       8.7 FIXEDHF     0.700  0       0.0  0
3576    ef 1E1515         5.5     0.       7.8 FIXEDHF     0.700  0       0.0  0
3577    ef 3E1515         3.2     0.       4.6 FIXEDHF     0.700  0       0.0  0
3578    ef 5E1515         2.2     0.       3.2 FIXEDHF     0.700  0       0.0  0
3579    eg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d12f
3580    eg 2D1515        20.2     0.      28.9 FIXEDHF     0.700  0       0.0  0
3581    eg 4D1515         5.4     0.       7.7 FIXEDHF     0.700  0       0.0  0
3582    eg 1E1515         4.8     0.       6.9 FIXEDHF     0.700  0       0.0  0
3583    eg 3E1515         2.9     0.       4.1 FIXEDHF     0.700  0       0.0  0
3584    eg 5E1515         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0
3585    eh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d13f
3586    eh 2D1515        17.9     0.      25.6 FIXEDHF     0.700  0       0.0  0
3587    eh 4D1515         4.8     0.       6.8 FIXEDHF     0.700  0       0.0  0
3588    eh 1E1515         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
3589    eh 3E1515         2.5     0.       3.6 FIXEDHF     0.700  0       0.0  0
3590    eh 5E1515         1.8     0.       2.5 FIXEDHF     0.700  0       0.0  0
3591    ei 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d14f
3592    ei 2D1515        16.0     0.      22.9 FIXEDHF     0.700  0       0.0  0
3593    ei 4D1515         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
3594    ei 1E1515         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
3595    ei 3E1515         2.3     0.       3.3 FIXEDHF     0.700  0       0.0  0
3596    ei 5E1515         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0
3597    ej 2D1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d10f     -4s6h
3598    ej 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3599    ek 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d10f     -4s7h
3600    ek 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3601    el 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d10f     -4s8h
3602    el 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3603    em 2D1526         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -4s9h
3604    em 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3605    en 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d10f     -3d6h
3606    en 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3607    en 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3608    en 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3609    eo 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d10f     -3d7h
3610    eo 4D1516         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
3611    eo 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3612    eo 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3613    ep 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d10f     -3d8h
3614    ep 4D1516         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
3615    ep 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3616    ep 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3617    eq 2D1516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d9h
3618    eq 4D1516         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
3619    eq 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3620    eq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3621    er 3D1537       114.5     0.     163.6 FIXEDHF     0.700  0       0.0  0  3d10f     -4p5s
3622    er 2E1537       -12.0     0.     -17.1 FIXEDHF     0.700  0       0.0  0
3623    es 3D1537        54.4     0.      77.7 FIXEDHF     0.700  0       0.0  0  3d10f     -4p6s
3624    es 2E1537        -3.6     0.      -5.1 FIXEDHF     0.700  0       0.0  0
3625    et 3D1537        30.8     0.      44.0 FIXEDHF     0.700  0       0.0  0  3d10f     -4p7s
3626    et 2E1537        -1.5     0.      -2.1 FIXEDHF     0.700  0       0.0  0
3627    eu 3D1537        20.2     0.      28.9 FIXEDHF     0.700  0       0.0  0  3d10f     -4p8s
3628    eu 2E1537        -0.7     0.      -1.0 FIXEDHF     0.700  0       0.0  0
3629    ev 1D1538      -349.4     0.    -499.1 FIXEDHF     0.700  0       0.0  0  3d10f     -4p4d
3630    ev 3D1538      -113.8     0.    -162.6 FIXEDHF     0.700  0       0.0  0
3631    ev 2E1538       -14.9     0.     -21.3 FIXEDHF     0.700  0       0.0  0
3632    ev 4E1538       -24.6     0.     -35.1 FIXEDHF     0.700  0       0.0  0
3633    ew 1D1538      -249.9     0.    -357.0 FIXEDHF     0.700  0       0.0  0  3d10f     -4p5d
3634    ew 3D1538       -74.8     0.    -106.8 FIXEDHF     0.700  0       0.0  0
3635    ew 2E1538       -19.3     0.     -27.6 FIXEDHF     0.700  0       0.0  0
3636    ew 4E1538       -21.8     0.     -31.2 FIXEDHF     0.700  0       0.0  0
3637    ex 1D1538      -164.1     0.    -234.5 FIXEDHF     0.700  0       0.0  0  3d10f     -4p6d
3638    ex 3D1538       -50.3     0.     -71.9 FIXEDHF     0.700  0       0.0  0
3639    ex 2E1538       -16.6     0.     -23.7 FIXEDHF     0.700  0       0.0  0
3640    ex 4E1538       -17.3     0.     -24.7 FIXEDHF     0.700  0       0.0  0
3641    ey 1D1538      -107.7     0.    -153.8 FIXEDHF     0.700  0       0.0  0  3d10f     -4p7d
3642    ey 3D1538       -36.0     0.     -51.5 FIXEDHF     0.700  0       0.0  0
3643    ey 2E1538       -13.6     0.     -19.5 FIXEDHF     0.700  0       0.0  0
3644    ey 4E1538       -13.8     0.     -19.7 FIXEDHF     0.700  0       0.0  0
3645    ez 1D1538       -70.8     0.    -101.1 FIXEDHF     0.700  0       0.0  0  3d10f     -4p8d
3646    ez 3D1538       -27.3     0.     -39.0 FIXEDHF     0.700  0       0.0  0
3647    ez 2E1538       -11.3     0.     -16.2 FIXEDHF     0.700  0       0.0  0
3648    ez 4E1538       -11.2     0.     -16.0 FIXEDHF     0.700  0       0.0  0
3649    fg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11f     -3d12f
3650    fg 2D1515        17.7     0.      25.3 FIXEDHF     0.700  0       0.0  0
3651    fg 4D1515         4.7     0.       6.7 FIXEDHF     0.700  0       0.0  0
3652    fg 1E1515         4.3     0.       6.1 FIXEDHF     0.700  0       0.0  0
3653    fg 3E1515         2.5     0.       3.6 FIXEDHF     0.700  0       0.0  0
3654    fg 5E1515         1.8     0.       2.5 FIXEDHF     0.700  0       0.0  0
3655    fh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11f     -3d13f
3656    fh 2D1515        15.7     0.      22.4 FIXEDHF     0.700  0       0.0  0
3657    fh 4D1515         4.2     0.       6.0 FIXEDHF     0.700  0       0.0  0
3658    fh 1E1515         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
3659    fh 3E1515         2.2     0.       3.2 FIXEDHF     0.700  0       0.0  0
3660    fh 5E1515         1.5     0.       2.2 FIXEDHF     0.700  0       0.0  0
3661    fi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11f     -3d14f
3662    fi 2D1515        14.0     0.      20.0 FIXEDHF     0.700  0       0.0  0
3663    fi 4D1515         3.8     0.       5.4 FIXEDHF     0.700  0       0.0  0
3664    fi 1E1515         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0
3665    fi 3E1515         2.0     0.       2.9 FIXEDHF     0.700  0       0.0  0
3666    fi 5E1515         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0
3667    fj 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d11f     -4s6h
3668    fj 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3669    fk 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d11f     -4s7h
3670    fk 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3671    fl 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11f     -4s8h
3672    fl 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3673    fm 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11f     -4s9h
3674    fm 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3675    fn 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d11f     -3d6h
3676    fn 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3677    fn 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3678    fn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3679    fo 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d11f     -3d7h
3680    fo 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3681    fo 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3682    fo 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3683    fp 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d11f     -3d8h
3684    fp 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3685    fp 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3686    fp 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3687    fq 2D1516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11f     -3d9h
3688    fq 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3689    fq 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3690    fq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3691    fr 3D1537        99.1     0.     141.6 FIXEDHF     0.700  0       0.0  0  3d11f     -4p5s
3692    fr 2E1537       -10.9     0.     -15.6 FIXEDHF     0.700  0       0.0  0
3693    fs 3D1537        47.7     0.      68.1 FIXEDHF     0.700  0       0.0  0  3d11f     -4p6s
3694    fs 2E1537        -3.4     0.      -4.8 FIXEDHF     0.700  0       0.0  0
3695    ft 3D1537        27.2     0.      38.9 FIXEDHF     0.700  0       0.0  0  3d11f     -4p7s
3696    ft 2E1537        -1.4     0.      -2.0 FIXEDHF     0.700  0       0.0  0
3697    fu 3D1537        17.9     0.      25.6 FIXEDHF     0.700  0       0.0  0  3d11f     -4p8s
3698    fu 2E1537        -0.7     0.      -1.0 FIXEDHF     0.700  0       0.0  0
3699    fv 1D1538      -299.9     0.    -428.5 FIXEDHF     0.700  0       0.0  0  3d11f     -4p4d
3700    fv 3D1538       -98.7     0.    -141.0 FIXEDHF     0.700  0       0.0  0
3701    fv 2E1538       -12.8     0.     -18.3 FIXEDHF     0.700  0       0.0  0
3702    fv 4E1538       -21.4     0.     -30.6 FIXEDHF     0.700  0       0.0  0
3703    fw 1D1538      -216.4     0.    -309.2 FIXEDHF     0.700  0       0.0  0  3d11f     -4p5d
3704    fw 3D1538       -65.3     0.     -93.3 FIXEDHF     0.700  0       0.0  0
3705    fw 2E1538       -16.8     0.     -24.0 FIXEDHF     0.700  0       0.0  0
3706    fw 4E1538       -19.1     0.     -27.3 FIXEDHF     0.700  0       0.0  0
3707    fx 1D1538      -143.8     0.    -205.4 FIXEDHF     0.700  0       0.0  0  3d11f     -4p6d
3708    fx 3D1538       -44.2     0.     -63.1 FIXEDHF     0.700  0       0.0  0
3709    fx 2E1538       -14.5     0.     -20.7 FIXEDHF     0.700  0       0.0  0
3710    fx 4E1538       -15.2     0.     -21.7 FIXEDHF     0.700  0       0.0  0
3711    fy 1D1538       -95.8     0.    -136.9 FIXEDHF     0.700  0       0.0  0  3d11f     -4p7d
3712    fy 3D1538       -31.8     0.     -45.4 FIXEDHF     0.700  0       0.0  0
3713    fy 2E1538       -12.0     0.     -17.1 FIXEDHF     0.700  0       0.0  0
3714    fy 4E1538       -12.0     0.     -17.2 FIXEDHF     0.700  0       0.0  0
3715    fz 1D1538       -64.7     0.     -92.4 FIXEDHF     0.700  0       0.0  0  3d11f     -4p8d
3716    fz 3D1538       -24.1     0.     -34.4 FIXEDHF     0.700  0       0.0  0
3717    fz 2E1538        -9.9     0.     -14.1 FIXEDHF     0.700  0       0.0  0
3718    fz 4E1538        -9.8     0.     -14.0 FIXEDHF     0.700  0       0.0  0
3719    gh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d12f     -3d13f
3720    gh 2D1515        13.9     0.      19.8 FIXEDHF     0.700  0       0.0  0
3721    gh 4D1515         3.7     0.       5.3 FIXEDHF     0.700  0       0.0  0
3722    gh 1E1515         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0
3723    gh 3E1515         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0
3724    gh 5E1515         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0
3725    gi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d12f     -3d14f
3726    gi 2D1515        12.4     0.      17.7 FIXEDHF     0.700  0       0.0  0
3727    gi 4D1515         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
3728    gi 1E1515         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
3729    gi 3E1515         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0
3730    gi 5E1515         1.3     0.       1.8 FIXEDHF     0.700  0       0.0  0
3731    gj 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d12f     -4s6h
3732    gj 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3733    gk 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d12f     -4s7h
3734    gk 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3735    gl 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12f     -4s8h
3736    gl 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3737    gm 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12f     -4s9h
3738    gm 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3739    gn 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d12f     -3d6h
3740    gn 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3741    gn 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3742    gn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3743    go 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d12f     -3d7h
3744    go 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3745    go 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3746    go 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3747    gp 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d12f     -3d8h
3748    gp 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3749    gp 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3750    gp 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3751    gq 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d12f     -3d9h
3752    gq 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3753    gq 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3754    gq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3755    gr 3D1537        86.9     0.     124.1 FIXEDHF     0.700  0       0.0  0  3d12f     -4p5s
3756    gr 2E1537       -10.0     0.     -14.3 FIXEDHF     0.700  0       0.0  0
3757    gs 3D1537        42.1     0.      60.2 FIXEDHF     0.700  0       0.0  0  3d12f     -4p6s
3758    gs 2E1537        -3.1     0.      -4.5 FIXEDHF     0.700  0       0.0  0
3759    gt 3D1537        24.2     0.      34.6 FIXEDHF     0.700  0       0.0  0  3d12f     -4p7s
3760    gt 2E1537        -1.3     0.      -1.9 FIXEDHF     0.700  0       0.0  0
3761    gu 3D1537        16.0     0.      22.8 FIXEDHF     0.700  0       0.0  0  3d12f     -4p8s
3762    gu 2E1537        -0.7     0.      -1.0 FIXEDHF     0.700  0       0.0  0
3763    gv 1D1538      -261.4     0.    -373.4 FIXEDHF     0.700  0       0.0  0  3d12f     -4p4d
3764    gv 3D1538       -86.7     0.    -123.8 FIXEDHF     0.700  0       0.0  0
3765    gv 2E1538       -11.2     0.     -16.0 FIXEDHF     0.700  0       0.0  0
3766    gv 4E1538       -18.9     0.     -27.0 FIXEDHF     0.700  0       0.0  0
3767    gw 1D1538      -189.8     0.    -271.2 FIXEDHF     0.700  0       0.0  0  3d12f     -4p5d
3768    gw 3D1538       -57.7     0.     -82.4 FIXEDHF     0.700  0       0.0  0
3769    gw 2E1538       -14.8     0.     -21.1 FIXEDHF     0.700  0       0.0  0
3770    gw 4E1538       -16.9     0.     -24.2 FIXEDHF     0.700  0       0.0  0
3771    gx 1D1538      -127.1     0.    -181.6 FIXEDHF     0.700  0       0.0  0  3d12f     -4p6d
3772    gx 3D1538       -39.1     0.     -55.9 FIXEDHF     0.700  0       0.0  0
3773    gx 2E1538       -12.8     0.     -18.3 FIXEDHF     0.700  0       0.0  0
3774    gx 4E1538       -13.4     0.     -19.2 FIXEDHF     0.700  0       0.0  0
3775    gy 1D1538       -85.7     0.    -122.4 FIXEDHF     0.700  0       0.0  0  3d12f     -4p7d
3776    gy 3D1538       -28.2     0.     -40.3 FIXEDHF     0.700  0       0.0  0
3777    gy 2E1538       -10.6     0.     -15.1 FIXEDHF     0.700  0       0.0  0
3778    gy 4E1538       -10.7     0.     -15.3 FIXEDHF     0.700  0       0.0  0
3779    gz 1D1538       -58.8     0.     -84.0 FIXEDHF     0.700  0       0.0  0  3d12f     -4p8d
3780    gz 3D1538       -21.4     0.     -30.6 FIXEDHF     0.700  0       0.0  0
3781    gz 2E1538        -8.8     0.     -12.5 FIXEDHF     0.700  0       0.0  0
3782    gz 4E1538        -8.7     0.     -12.4 FIXEDHF     0.700  0       0.0  0
3783    hi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d13f     -3d14f
3784    hi 2D1515        11.1     0.      15.8 FIXEDHF     0.700  0       0.0  0
3785    hi 4D1515         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
3786    hi 1E1515         2.8     0.       4.0 FIXEDHF     0.700  0       0.0  0
3787    hi 3E1515         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0
3788    hi 5E1515         1.1     0.       1.6 FIXEDHF     0.700  0       0.0  0
3789    hj 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d13f     -4s6h
3790    hj 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3791    hk 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d13f     -4s7h
3792    hk 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3793    hl 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -4s8h
3794    hl 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3795    hm 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -4s9h
3796    hm 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3797    hn 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -3d6h
3798    hn 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3799    hn 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3800    hn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3801    ho 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -3d7h
3802    ho 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3803    ho 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3804    ho 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3805    hp 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -3d8h
3806    hp 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3807    hp 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3808    hp 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3809    hq 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -3d9h
3810    hq 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3811    hq 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3812    hq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3813    hr 3D1537        76.9     0.     109.9 FIXEDHF     0.700  0       0.0  0  3d13f     -4p5s
3814    hr 2E1537        -9.2     0.     -13.1 FIXEDHF     0.700  0       0.0  0
3815    hs 3D1537        37.7     0.      53.8 FIXEDHF     0.700  0       0.0  0  3d13f     -4p6s
3816    hs 2E1537        -2.9     0.      -4.2 FIXEDHF     0.700  0       0.0  0
3817    ht 3D1537        21.7     0.      31.0 FIXEDHF     0.700  0       0.0  0  3d13f     -4p7s
3818    ht 2E1537        -1.3     0.      -1.8 FIXEDHF     0.700  0       0.0  0
3819    hu 3D1537        14.3     0.      20.5 FIXEDHF     0.700  0       0.0  0  3d13f     -4p8s
3820    hu 2E1537        -0.7     0.      -1.0 FIXEDHF     0.700  0       0.0  0
3821    hv 1D1538      -230.5     0.    -329.3 FIXEDHF     0.700  0       0.0  0  3d13f     -4p4d
3822    hv 3D1538       -76.9     0.    -109.8 FIXEDHF     0.700  0       0.0  0
3823    hv 2E1538        -9.9     0.     -14.1 FIXEDHF     0.700  0       0.0  0
3824    hv 4E1538       -16.8     0.     -24.0 FIXEDHF     0.700  0       0.0  0
3825    hw 1D1538      -168.3     0.    -240.5 FIXEDHF     0.700  0       0.0  0  3d13f     -4p5d
3826    hw 3D1538       -51.4     0.     -73.4 FIXEDHF     0.700  0       0.0  0
3827    hw 2E1538       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0
3828    hw 4E1538       -15.1     0.     -21.6 FIXEDHF     0.700  0       0.0  0
3829    hx 1D1538      -113.4     0.    -162.0 FIXEDHF     0.700  0       0.0  0  3d13f     -4p6d
3830    hx 3D1538       -35.0     0.     -50.0 FIXEDHF     0.700  0       0.0  0
3831    hx 2E1538       -11.4     0.     -16.3 FIXEDHF     0.700  0       0.0  0
3832    hx 4E1538       -12.0     0.     -17.1 FIXEDHF     0.700  0       0.0  0
3833    hy 1D1538       -77.1     0.    -110.1 FIXEDHF     0.700  0       0.0  0  3d13f     -4p7d
3834    hy 3D1538       -25.3     0.     -36.1 FIXEDHF     0.700  0       0.0  0
3835    hy 2E1538        -9.4     0.     -13.4 FIXEDHF     0.700  0       0.0  0
3836    hy 4E1538        -9.5     0.     -13.6 FIXEDHF     0.700  0       0.0  0
3837    hz 1D1538       -53.5     0.     -76.4 FIXEDHF     0.700  0       0.0  0  3d13f     -4p8d
3838    hz 3D1538       -19.3     0.     -27.5 FIXEDHF     0.700  0       0.0  0
3839    hz 2E1538        -7.8     0.     -11.1 FIXEDHF     0.700  0       0.0  0
3840    hz 4E1538        -7.8     0.     -11.1 FIXEDHF     0.700  0       0.0  0
3841    ij 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d14f     -4s6h
3842    ij 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3843    ik 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d14f     -4s7h
3844    ik 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3845    il 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -4s8h
3846    il 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3847    im 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -4s9h
3848    im 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3849    in 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -3d6h
3850    in 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3851    in 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3852    in 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3853    io 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -3d7h
3854    io 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3855    io 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3856    io 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3857    ip 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -3d8h
3858    ip 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3859    ip 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3860    ip 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3861    iq 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -3d9h
3862    iq 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3863    iq 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3864    iq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3865    ir 3D1537        68.8     0.      98.3 FIXEDHF     0.700  0       0.0  0  3d14f     -4p5s
3866    ir 2E1537        -8.5     0.     -12.1 FIXEDHF     0.700  0       0.0  0
3867    is 3D1537        33.9     0.      48.4 FIXEDHF     0.700  0       0.0  0  3d14f     -4p6s
3868    is 2E1537        -2.7     0.      -3.9 FIXEDHF     0.700  0       0.0  0
3869    it 3D1537        19.6     0.      28.0 FIXEDHF     0.700  0       0.0  0  3d14f     -4p7s
3870    it 2E1537        -1.2     0.      -1.7 FIXEDHF     0.700  0       0.0  0
3871    iu 3D1537        13.0     0.      18.6 FIXEDHF     0.700  0       0.0  0  3d14f     -4p8s
3872    iu 2E1537        -0.6     0.      -0.9 FIXEDHF     0.700  0       0.0  0
3873    iv 1D1538      -205.4     0.    -293.4 FIXEDHF     0.700  0       0.0  0  3d14f     -4p4d
3874    iv 3D1538       -68.9     0.     -98.4 FIXEDHF     0.700  0       0.0  0
3875    iv 2E1538        -8.8     0.     -12.5 FIXEDHF     0.700  0       0.0  0
3876    iv 4E1538       -15.1     0.     -21.6 FIXEDHF     0.700  0       0.0  0
3877    iw 1D1538      -150.6     0.    -215.1 FIXEDHF     0.700  0       0.0  0  3d14f     -4p5d
3878    iw 3D1538       -46.2     0.     -66.0 FIXEDHF     0.700  0       0.0  0
3879    iw 2E1538       -11.8     0.     -16.9 FIXEDHF     0.700  0       0.0  0
3880    iw 4E1538       -13.6     0.     -19.4 FIXEDHF     0.700  0       0.0  0
3881    ix 1D1538      -101.9     0.    -145.6 FIXEDHF     0.700  0       0.0  0  3d14f     -4p6d
3882    ix 3D1538       -31.5     0.     -45.0 FIXEDHF     0.700  0       0.0  0
3883    ix 2E1538       -10.2     0.     -14.6 FIXEDHF     0.700  0       0.0  0
3884    ix 4E1538       -10.8     0.     -15.4 FIXEDHF     0.700  0       0.0  0
3885    iy 1D1538       -69.6     0.     -99.5 FIXEDHF     0.700  0       0.0  0  3d14f     -4p7d
3886    iy 3D1538       -22.8     0.     -32.6 FIXEDHF     0.700  0       0.0  0
3887    iy 2E1538        -8.5     0.     -12.1 FIXEDHF     0.700  0       0.0  0
3888    iy 4E1538        -8.6     0.     -12.3 FIXEDHF     0.700  0       0.0  0
3889    iz 1D1538       -48.7     0.     -69.6 FIXEDHF     0.700  0       0.0  0  3d14f     -4p8d
3890    iz 3D1538       -17.4     0.     -24.8 FIXEDHF     0.700  0       0.0  0
3891    iz 2E1538        -7.0     0.     -10.0 FIXEDHF     0.700  0       0.0  0
3892    iz 4E1538        -7.0     0.     -10.0 FIXEDHF     0.700  0       0.0  0
3893    jk 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6h      -4s7h
3894    jk 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3895    jl 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6h      -4s8h
3896    jl 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3897    jm 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6h      -4s9h
3898    jm 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3899    jn 2D2616       -40.7     0.     -58.2 FIXEDHF     0.700  0       0.0  0  4s6h      -3d6h
3900    jn 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3901    jo 2D2616       -23.2     0.     -33.2 FIXEDHF     0.700  0       0.0  0  4s6h      -3d7h
3902    jo 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3903    jp 2D2616       -16.3     0.     -23.3 FIXEDHF     0.700  0       0.0  0  4s6h      -3d8h
3904    jp 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3905    jq 2D2616       -12.5     0.     -17.9 FIXEDHF     0.700  0       0.0  0  4s6h      -3d9h
3906    jq 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3907    kl 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7h      -4s8h
3908    kl 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3909    km 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7h      -4s9h
3910    km 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3911    kn 2D2616       -23.2     0.     -33.2 FIXEDHF     0.700  0       0.0  0  4s7h      -3d6h
3912    kn 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3913    ko 2D2616       -25.6     0.     -36.6 FIXEDHF     0.700  0       0.0  0  4s7h      -3d7h
3914    ko 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3915    kp 2D2616       -17.9     0.     -25.6 FIXEDHF     0.700  0       0.0  0  4s7h      -3d8h
3916    kp 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3917    kq 2D2616       -13.8     0.     -19.7 FIXEDHF     0.700  0       0.0  0  4s7h      -3d9h
3918    kq 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3919    lm 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8h      -4s9h
3920    lm 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3921    ln 2D2616       -16.3     0.     -23.3 FIXEDHF     0.700  0       0.0  0  4s8h      -3d6h
3922    ln 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3923    lo 2D2616       -17.9     0.     -25.6 FIXEDHF     0.700  0       0.0  0  4s8h      -3d7h
3924    lo 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3925    lp 2D2616       -17.1     0.     -24.5 FIXEDHF     0.700  0       0.0  0  4s8h      -3d8h
3926    lp 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3927    lq 2D2616       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0  4s8h      -3d9h
3928    lq 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3929    mn 2D2616       -12.5     0.     -17.9 FIXEDHF     0.700  0       0.0  0  4s9h      -3d6h
3930    mn 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3931    mo 2D2616       -13.8     0.     -19.7 FIXEDHF     0.700  0       0.0  0  4s9h      -3d7h
3932    mo 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3933    mp 2D2616       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0  4s9h      -3d8h
3934    mp 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3935    mq 2D2616       -12.0     0.     -17.2 FIXEDHF     0.700  0       0.0  0  4s9h      -3d9h
3936    mq 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3937    no 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6h      -3d7h
3938    no 2D1616        17.4     0.      24.8 FIXEDHF     0.700  0       0.0  0
3939    no 4D1616         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0
3940    no 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3941    no 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3942    no 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3943    np 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6h      -3d8h
3944    np 2D1616        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
3945    np 4D1616         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
3946    np 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3947    np 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3948    np 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3949    nq 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6h      -3d9h
3950    nq 2D1616         9.3     0.      13.3 FIXEDHF     0.700  0       0.0  0
3951    nq 4D1616         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3952    nq 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3953    nq 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3954    nq 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3955    nv 3D1638       -19.9     0.     -28.5 FIXEDHF     0.700  0       0.0  0  3d6h      -4p4d
3956    nv 4E1638        -1.6     0.      -2.3 FIXEDHF     0.700  0       0.0  0
3957    nw 3D1638         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0  3d6h      -4p5d
3958    nw 4E1638        -1.1     0.      -1.5 FIXEDHF     0.700  0       0.0  0
3959    nx 3D1638        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d6h      -4p6d
3960    nx 4E1638        -0.7     0.      -1.0 FIXEDHF     0.700  0       0.0  0
3961    ny 3D1638         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0  3d6h      -4p7d
3962    ny 4E1638        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
3963    nz 3D1638         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  3d6h      -4p8d
3964    nz 4E1638        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0
3965    op 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7h      -3d8h
3966    op 2D1616        13.4     0.      19.1 FIXEDHF     0.700  0       0.0  0
3967    op 4D1616         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
3968    op 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3969    op 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3970    op 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3971    oq 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7h      -3d9h
3972    oq 2D1616        10.3     0.      14.7 FIXEDHF     0.700  0       0.0  0
3973    oq 4D1616         0.5     0.       0.7 FIXEDHF     0.700  0       0.0  0
3974    oq 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3975    oq 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3976    oq 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3977    ov 3D1638       -21.6     0.     -30.9 FIXEDHF     0.700  0       0.0  0  3d7h      -4p4d
3978    ov 4E1638        -1.8     0.      -2.6 FIXEDHF     0.700  0       0.0  0
3979    ow 3D1638         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0  3d7h      -4p5d
3980    ow 4E1638        -1.2     0.      -1.7 FIXEDHF     0.700  0       0.0  0
3981    ox 3D1638         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0  3d7h      -4p6d
3982    ox 4E1638        -0.8     0.      -1.2 FIXEDHF     0.700  0       0.0  0
3983    oy 3D1638         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d7h      -4p7d
3984    oy 4E1638        -0.6     0.      -0.9 FIXEDHF     0.700  0       0.0  0
3985    oz 3D1638         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0  3d7h      -4p8d
3986    oz 4E1638        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
3987    pq 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8h      -3d9h
3988    pq 2D1616         9.8     0.      14.0 FIXEDHF     0.700  0       0.0  0
3989    pq 4D1616         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3990    pq 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3991    pq 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3992    pq 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3993    pv 3D1638       -20.6     0.     -29.4 FIXEDHF     0.700  0       0.0  0  3d8h      -4p4d
3994    pv 4E1638        -1.8     0.      -2.6 FIXEDHF     0.700  0       0.0  0
3995    pw 3D1638         4.0     0.       5.7 FIXEDHF     0.700  0       0.0  0  3d8h      -4p5d
3996    pw 4E1638        -1.2     0.      -1.7 FIXEDHF     0.700  0       0.0  0
3997    px 3D1638         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0  3d8h      -4p6d
3998    px 4E1638        -0.8     0.      -1.2 FIXEDHF     0.700  0       0.0  0
3999    py 3D1638         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0  3d8h      -4p7d
4000    py 4E1638        -0.6     0.      -0.9 FIXEDHF     0.700  0       0.0  0
4001    pz 3D1638         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  3d8h      -4p8d
4002    pz 4E1638        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
4003    qv 3D1638       -18.9     0.     -27.0 FIXEDHF     0.700  0       0.0  0  3d9h      -4p4d
4004    qv 4E1638        -1.7     0.      -2.4 FIXEDHF     0.700  0       0.0  0
4005    qw 3D1638         2.9     0.       4.1 FIXEDHF     0.700  0       0.0  0  3d9h      -4p5d
4006    qw 4E1638        -1.1     0.      -1.6 FIXEDHF     0.700  0       0.0  0
4007    qx 3D1638         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0  3d9h      -4p6d
4008    qx 4E1638        -0.8     0.      -1.1 FIXEDHF     0.700  0       0.0  0
4009    qy 3D1638         0.8     0.       1.1 FIXEDHF     0.700  0       0.0  0  3d9h      -4p7d
4010    qy 4E1638        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
4011    qz 3D1638         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0  3d9h      -4p8d
4012    qz 4E1638        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
4013    rs 0D3737         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p5s      -4p6s
4014    rs 1E3737       845.4     0.    1207.7 FIXEDHF     0.700  0       0.0  0
4015    rt 0D3737         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p5s      -4p7s
4016    rt 1E3737       538.2     0.     768.9 FIXEDHF     0.700  0       0.0  0
4017    ru 0D3737         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p5s      -4p8s
4018    ru 1E3737       383.1     0.     547.3 FIXEDHF     0.700  0       0.0  0
4019    rv 2D3738     -4070.4     0.   -5814.8 FIXEDHF     0.700  0       0.0  0  4p5s      -4p4d
4020    rv 1E3738     -1145.0     0.   -1635.7 FIXEDHF     0.700  0       0.0  0
4021    rw 2D3738     -2003.7     0.   -2862.4 FIXEDHF     0.700  0       0.0  0  4p5s      -4p5d
4022    rw 1E3738      -653.7     0.    -933.8 FIXEDHF     0.700  0       0.0  0
4023    rx 2D3738     -1214.1     0.   -1734.4 FIXEDHF     0.700  0       0.0  0  4p5s      -4p6d
4024    rx 1E3738      -426.2     0.    -608.8 FIXEDHF     0.700  0       0.0  0
4025    ry 2D3738      -824.8     0.   -1178.3 FIXEDHF     0.700  0       0.0  0  4p5s      -4p7d
4026    ry 1E3738      -303.6     0.    -433.7 FIXEDHF     0.700  0       0.0  0
4027    rz 2D3738      -603.5     0.    -862.1 FIXEDHF     0.700  0       0.0  0  4p5s      -4p8d
4028    rz 1E3738      -229.7     0.    -328.2 FIXEDHF     0.700  0       0.0  0
4029    st 0D3737         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p6s      -4p7s
4030    st 1E3737       300.5     0.     429.3 FIXEDHF     0.700  0       0.0  0
4031    su 0D3737         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p6s      -4p8s
4032    su 1E3737       216.7     0.     309.6 FIXEDHF     0.700  0       0.0  0
4033    sv 2D3738     -1318.0     0.   -1882.9 FIXEDHF     0.700  0       0.0  0  4p6s      -4p4d
4034    sv 1E3738      -584.4     0.    -834.8 FIXEDHF     0.700  0       0.0  0
4035    sw 2D3738     -1353.9     0.   -1934.1 FIXEDHF     0.700  0       0.0  0  4p6s      -4p5d
4036    sw 1E3738      -365.6     0.    -522.3 FIXEDHF     0.700  0       0.0  0
4037    sx 2D3738      -899.6     0.   -1285.2 FIXEDHF     0.700  0       0.0  0  4p6s      -4p6d
4038    sx 1E3738      -248.8     0.    -355.5 FIXEDHF     0.700  0       0.0  0
4039    sy 2D3738      -642.8     0.    -918.3 FIXEDHF     0.700  0       0.0  0  4p6s      -4p7d
4040    sy 1E3738      -181.9     0.    -259.9 FIXEDHF     0.700  0       0.0  0
4041    sz 2D3738      -486.4     0.    -694.8 FIXEDHF     0.700  0       0.0  0  4p6s      -4p8d
4042    sz 1E3738      -140.1     0.    -200.1 FIXEDHF     0.700  0       0.0  0
4043    tu 0D3737         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p7s      -4p8s
4044    tu 1E3737       143.5     0.     205.0 FIXEDHF     0.700  0       0.0  0
4045    tv 2D3738      -778.5     0.   -1112.2 FIXEDHF     0.700  0       0.0  0  4p7s      -4p4d
4046    tv 1E3738      -377.4     0.    -539.2 FIXEDHF     0.700  0       0.0  0
4047    tw 2D3738      -681.7     0.    -973.8 FIXEDHF     0.700  0       0.0  0  4p7s      -4p5d
4048    tw 1E3738      -243.2     0.    -347.4 FIXEDHF     0.700  0       0.0  0
4049    tx 2D3738      -614.3     0.    -877.5 FIXEDHF     0.700  0       0.0  0  4p7s      -4p6d
4050    tx 1E3738      -167.7     0.    -239.6 FIXEDHF     0.700  0       0.0  0
4051    ty 2D3738      -457.8     0.    -654.0 FIXEDHF     0.700  0       0.0  0  4p7s      -4p7d
4052    ty 1E3738      -123.6     0.    -176.6 FIXEDHF     0.700  0       0.0  0
4053    tz 2D3738      -353.8     0.    -505.4 FIXEDHF     0.700  0       0.0  0  4p7s      -4p8d
4054    tz 1E3738       -95.6     0.    -136.6 FIXEDHF     0.700  0       0.0  0
4055    uv 2D3738      -534.6     0.    -763.7 FIXEDHF     0.700  0       0.0  0  4p8s      -4p4d
4056    uv 1E3738      -270.8     0.    -386.9 FIXEDHF     0.700  0       0.0  0
4057    uw 2D3738      -463.2     0.    -661.7 FIXEDHF     0.700  0       0.0  0  4p8s      -4p5d
4058    uw 1E3738      -177.0     0.    -252.9 FIXEDHF     0.700  0       0.0  0
4059    ux 2D3738      -380.0     0.    -542.8 FIXEDHF     0.700  0       0.0  0  4p8s      -4p6d
4060    ux 1E3738      -122.9     0.    -175.6 FIXEDHF     0.700  0       0.0  0
4061    uy 2D3738      -330.8     0.    -472.6 FIXEDHF     0.700  0       0.0  0  4p8s      -4p7d
4062    uy 1E3738       -90.9     0.    -129.8 FIXEDHF     0.700  0       0.0  0
4063    uz 2D3738      -261.8     0.    -374.0 FIXEDHF     0.700  0       0.0  0  4p8s      -4p8d
4064    uz 1E3738       -70.5     0.    -100.7 FIXEDHF     0.700  0       0.0  0
4065    vw 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p4d      -4p5d
4066    vw 2D3838      1780.3     0.    2543.3 FIXEDHF     0.700  0       0.0  0
4067    vw 1E3838       850.4     0.    1214.9 FIXEDHF     0.700  0       0.0  0
4068    vw 3E3838       660.0     0.     942.9 FIXEDHF     0.700  0       0.0  0
4069    vx 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p4d      -4p6d
4070    vx 2D3838      1102.4     0.    1574.8 FIXEDHF     0.700  0       0.0  0
4071    vx 1E3838       602.4     0.     860.6 FIXEDHF     0.700  0       0.0  0
4072    vx 3E3838       465.6     0.     665.2 FIXEDHF     0.700  0       0.0  0
4073    vy 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p4d      -4p7d
4074    vy 2D3838       765.9     0.    1094.2 FIXEDHF     0.700  0       0.0  0
4075    vy 1E3838       451.8     0.     645.4 FIXEDHF     0.700  0       0.0  0
4076    vy 3E3838       348.2     0.     497.4 FIXEDHF     0.700  0       0.0  0
4077    vz 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p4d      -4p8d
4078    vz 2D3838       570.9     0.     815.6 FIXEDHF     0.700  0       0.0  0
4079    vz 1E3838       353.8     0.     505.5 FIXEDHF     0.700  0       0.0  0
4080    vz 3E3838       272.1     0.     388.7 FIXEDHF     0.700  0       0.0  0
4081    wx 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p5d      -4p6d
4082    wx 2D3838       925.6     0.    1322.3 FIXEDHF     0.700  0       0.0  0
4083    wx 1E3838       442.0     0.     631.4 FIXEDHF     0.700  0       0.0  0
4084    wx 3E3838       338.1     0.     483.0 FIXEDHF     0.700  0       0.0  0
4085    wy 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p5d      -4p7d
4086    wy 2D3838       655.3     0.     936.2 FIXEDHF     0.700  0       0.0  0
4087    wy 1E3838       336.6     0.     480.8 FIXEDHF     0.700  0       0.0  0
4088    wy 3E3838       256.9     0.     367.0 FIXEDHF     0.700  0       0.0  0
4089    wz 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p5d      -4p8d
4090    wz 2D3838       495.5     0.     707.8 FIXEDHF     0.700  0       0.0  0
4091    wz 1E3838       266.1     0.     380.2 FIXEDHF     0.700  0       0.0  0
4092    wz 3E3838       202.8     0.     289.7 FIXEDHF     0.700  0       0.0  0
4093    xy 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p6d      -4p7d
4094    xy 2D3838       516.7     0.     738.2 FIXEDHF     0.700  0       0.0  0
4095    xy 1E3838       249.4     0.     356.3 FIXEDHF     0.700  0       0.0  0
4096    xy 3E3838       189.9     0.     271.3 FIXEDHF     0.700  0       0.0  0
4097    xz 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p6d      -4p8d
4098    xz 2D3838       393.3     0.     561.8 FIXEDHF     0.700  0       0.0  0
4099    xz 1E3838       197.9     0.     282.7 FIXEDHF     0.700  0       0.0  0
4100    xz 3E3838       150.6     0.     215.1 FIXEDHF     0.700  0       0.0  0
4101    yz 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p7d      -4p8d
4102    yz 2D3838       312.9     0.     447.0 FIXEDHF     0.700  0       0.0  0
4103    yz 1E3838       152.3     0.     217.6 FIXEDHF     0.700  0       0.0  0
4104    yz 3E3838       115.8     0.     165.4 FIXEDHF     0.700  0       0.0  0
