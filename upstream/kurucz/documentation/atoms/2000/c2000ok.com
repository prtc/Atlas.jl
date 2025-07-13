$SET def 2000
$SET VERIFY=NOIMAGE
$ASSIGN B2000O.PUN FOR007
$ASSIGN POOLQ:H2000O.HAM FOR001
$ASSIGN C2000O.EIG FOR003
$ASSIGN EAV2000O.DAT FOR066
$ASSIGN POOLG:B2000O15 FOR015
$ASSIGN POOLG:B2000O16 FOR016
$RUN CRAY:LEAST3007
1
2 Sugar, J, and Corliss, C. J.Phys.Chem.Ref.Data vol. 14,Supple 2, 1985.
3 Geller, M. NASA Ref. Pub. 1224, vol 3, 1992.
4     8h,9h,8k,9k from polarization formula
5 Gaardsted, J.O., Andersen, T., Haugen, H.K., Hansen, J.E., and Vaeck, N,
6      J.Phys.B 24, 4363-4377, 1991.
7 Kim, J.B., Xiong, X., Laham, N.M., Lacatorio, T.B., and McIlrath, T. 1994.  J. Phys. B27, 2953-2960.
8 Chang, E.S., Engleman, R., and Geller, M. 200o. Physics Essays 13, 198-205.
9 The 3dnl fit needs to be much more sophisticated because of the mixing.  However energies and widths are the observed.
    1    0    0    0        .3       1.5
    1  .6        100  110   80  130   20   20   20   30   30   10   10   10   10   10   10
  20.00
4s4p      4s5p      4s6p      4s7p      4s8p      4s9p      4s10p     4s11p
4s12p     4s13p     4s14p     3d4p      3d5p      3d6p      3d7p      3d8p
3d9p      3d10p     3d11p     3d12p     3d13p     3d14p     4s4f      4s5f
4s6f      4s7f      4s8f      4s9f      4s10f     4s11f     4s12f     4s13f
4s14f     3d4f      3d5f      3d6f      3d7f      3d8f      3d9f      3d10f
3d11f     3d12f     3d13f     3d14f     4s6h      4s7h      4s8h      4s9h
3d6h      3d7h      3d8h      3d9h      4s8k      4s9k      3d8k      3d9k
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
   1.0     62312.63              3d13f 3P                 3d13f 3P
   1.0     62346.47              3d13f 1P                 3d13f 1P
   1.0     62375.29              3d14f 3D                 3d14f 3D
   1.0     62403.22              3d14f 3P                 3d14f 3P
   1.0     62433.38              3d14f 1P                 3d14f 1P
1  1.0     62288.02              3d14p 1P                 3d14p 1P
   1.0     62552.97              4p4d 3D?                 4p4d 3D?
   1.0     62557.45              4p4d 3P?                 4p4d 3P?
   1.0     62561.72              4p4d 1P?                 4p4d 1P?
1  1.0                           4p5d 3D                  4p5d 3D
1  1.0                           4p5d 3P                  4p5d 3P
   1.0     66578.                4p5d 1P                  4p5d 1P
1  1.0                           4p6d 3D                  4p6d 3D
1  1.0                           4p6d 3P                  4p6d 3P
   1.0     69643.                4p6d 1P                  4p6d 1P
1  1.0                           4p7d 3D                  4p7d 3D
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
1  4.0                           3d8k 3H                  3d8k 3H
1  4.0                           3d8f 3G                  3d8f 3G
1  4.0                           3d8f 3F                  3d8f 3F
1  4.0                           3d10p 3F                 3d10p 3F
1  4.0                           3d9h 3H                  3d9h 3H
1  4.0                           3d9h 3F                  3d9h 3F
1  4.0                           3d9f 1G                  3d9f 1G
1  4.0                           3d9f 3H                  3d9f 3H
1  4.0                           3d9h 1G                  3d9h 1G
1  4.0                           3d9h 3G                  3d9h 3G
1  4.0                           3d9k 3H                  3d9k 3H
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
1  5.0                           3d8k 1H                  3d8k 1H
1  5.0                           3d8f 3G                  3d8f 3G
1  5.0                           3d8h 1H                  3d8h 1H
1  5.0                           3d8h 3G                  3d8h 3G
1  5.0                           3d8k 3I                  3d8k 3I
1  5.0                           3d8k 3H                  3d8k 3H
1  5.0                           3d8f 3H                  3d8f 3H
1  5.0                           3d8f 1H                  3d8f 1H
1  5.0                           3d9h 3I                  3d9h 3I
1  5.0                           3d9h 3H                  3d9h 3H
1  5.0                           3d9k 1H                  3d9k 1H
1  5.0                           3d9f 3G                  3d9f 3G
1  5.0                           3d9h 1H                  3d9h 1H
1  5.0                           3d9h 3G                  3d9h 3G
1  5.0                           3d9k 3I                  3d9k 3I
1  5.0                           3d9k 3H                  3d9k 3H
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
   6.0     47590.6  P            4s8k 3K                  4s8k 3K
   6.0     47948.1  P            4s9h 3H                  4s9h 3H
   6.0     47950.6  P            4s9k 3K                  4s9k 3K
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
1  6.0                           3d8k 3K                  3d8k 3K
1  6.0                           3d8h 3K                  3d8h 3K
1  6.0                           3d8k 3H                  3d8k 3H
1  6.0                           3d8h 3H                  3d8h 3H
1  6.0                           3d8h 1I                  3d8h 1I
1  6.0                           3d8k 3K                  3d8k 3K
1  6.0                           3d8k 3I                  3d8k 3I
1  6.0                           3d8f 3H                  3d8f 3H
1  6.0                           3d9h 3I                  3d9h 3I
1  6.0                           3d9h 3K                  3d9h 3K
1  6.0                           3d9k 3K                  3d9k 3K
1  6.0                           3d9k 3H                  3d9k 3H
1  6.0                           3d9h 3H                  3d9h 3H
1  6.0                           3d9h 1I                  3d9h 1I
1  6.0                           3d9k 3K                  3d9k 3K
1  6.0                           3d9k 3I                  3d9k 3I
1  6.0                           3d9f 3H                  3d9f 3H
1  6.0                           3d10f 3H                 3d10f 3H
1  6.0                           3d11f 3H                 3d11f 3H
1  6.0                           3d12f 3H                 3d12f 3H
1  6.0                           3d13f 3H                 3d13f 3H
1  6.0                           3d14f 3H                 3d14f 3H
   7.0     47590.6  P            4s8k 3K                  4s8k 3K
   7.0     47590.6  P            4s8k 1K                  4s8k 1K
   7.0     47950.6  P            4s9k 3K                  4s9k 3K
   7.0     47950.6  P            4s9k 1K                  4s9k 1K
1  7.0                           3d6h 3K                  3d6h 3K
1  7.0                           3d6h 3I                  3d6h 3I
1  7.0                           3d6h 1K                  3d6h 1K
1  7.0                           3d7h 3K                  3d7h 3K
1  7.0                           3d7h 3I                  3d7h 3I
1  7.0                           3d7h 1K                  3d7h 1K
1  7.0                           3d8k 3L                  3d8k 3L
1  7.0                           3d8k 3I                  3d8k 3I
1  7.0                           3d8h 3K                  3d8h 3K
1  7.0                           3d8h 3I                  3d8h 3I
1  7.0                           3d8k 1K                  3d8k 1K
1  7.0                           3d8k 3K                  3d8k 3K
1  7.0                           3d8h 1K                  3d8h 1K
1  7.0                           3d9k 3L                  3d9k 3L
1  7.0                           3d9h 3K                  3d9h 3K
1  7.0                           3d9k 3I                  3d9k 3I
1  7.0                           3d9h 3I                  3d9h 3I
1  7.0                           3d9k 1K                  3d9k 1K
1  7.0                           3d9k 3K                  3d9k 3K
1  7.0                           3d9h 1K                  3d9h 1K
   8.0     47590.6  P            4s8k 3K                  4s8k 3K
   8.0     47950.6  P            4s9k 3K                  4s9k 3K
1  8.0                           3d6h 3K                  3d6h 3K
1  8.0                           3d7h 3K                  3d7h 3K
1  8.0                           3d8k 3L                  3d8k 3L
1  8.0                           3d8k 3M                  3d8k 3M
1  8.0                           3d8k 3K                  3d8k 3K
1  8.0                           3d8k 1L                  3d8k 1L
1  8.0                           3d8h 3K                  3d8h 3K
1  8.0                           3d9k 3L                  3d9k 3L
1  8.0                           3d9k 3M                  3d9k 3M
1  8.0                           3d9k 3K                  3d9k 3K
1  8.0                           3d9k 1L                  3d9k 1L
1  8.0                           3d9h 3K                  3d9h 3K
1  9.0                           3d8k 3M                  3d8k 3M
1  9.0                           3d8k 3L                  3d8k 3L
1  9.0                           3d8k 1M                  3d8k 1M
1  9.0                           3d9k 3M                  3d9k 3M
1  9.0                           3d9k 3L                  3d9k 3L
1  9.0                           3d9k 1M                  3d9k 1M
1 10.0                           3d8k 3M                  3d8k 3M
1 10.0                           3d9k 3M                  3d9k 3M
 3922      51.4   70      LEAST SQUARES
   1    1  EAV        18665.2    27.   13674.8             1.000  0    2700.0  0             4s4p
   2    1  ZETA 3       107.1    47.     102.5             1.000  0       0.0  0
   3    1  G1(23)     18146.6   106.   24527.6             0.700  0       0.0  0
   4    2  EAV        37092.0    28.   34156.1             1.000  0    2700.0  0             4s5p
   5    2  ZETA 4        21.4    47.      21.9             1.000  0       0.0  0
   6    2  G1(24)      1384.4   112.    2739.9             0.700  0       0.0  0
   7    3  EAV        42590.8    28.   39723.0             1.000  0    2700.0  0             4s6p
   8    3  ZETA 4         9.1     0.       9.1 FIXEDHF     1.000  0       0.0  0
   9    3  G1(24)       336.9     0.     962.6 FIXEDHF     0.350  0       0.0  0
  10    4  EAV        44992.5    28.   42194.6             1.000  0    2700.0  0             4s7p
  11    4  ZETA 4         4.7     0.       4.7 FIXEDHF     1.000  0       0.0  0
  12    4  G1(24)       137.7     0.     459.0 FIXEDHF     0.300  0       0.0  0
  13    5  EAV        46298.9    27.   43523.9             1.000  0    2700.0  0             4s8p
  14    5  ZETA 4         2.7     0.       2.7 FIXEDHF     1.000  0       0.0  0
  15    5  G1(24)        76.9     0.     256.4 FIXEDHF     0.300  0       0.0  0
  16    6  EAV        47089.6    31.   44323.5             1.000  0    2700.0  0             4s9p
  17    6  ZETA 4         1.7     0.       1.7 FIXEDHF     1.000  0       0.0  0
  18    6  G1(24)        47.5     0.     158.2 FIXEDHF     0.300  0       0.0  0
  19    7  EAV        47605.8    31.   44842.0             1.000  0    2700.0  0             4s10p
  20    7  ZETA 4         1.1     0.       1.1 FIXEDHF     1.000  0       0.0  0
  21    7  G1(24)        31.4     0.     104.6 FIXEDHF     0.300  0       0.0  0
  22    8  EAV        47960.5    31.   45197.4             1.000  0    2700.0  0             4s11p
  23    8  ZETA 4         0.8     0.       0.8 FIXEDHF     1.000  0       0.0  0
  24    8  G1(24)        21.9     0.      72.9 FIXEDHF     0.300  0       0.0  0
  25    9  EAV        48214.5    31.   45451.9             1.000  0    2700.0  0             4s12p
  26    9  ZETA 4         0.6     0.       0.6 FIXEDHF     1.000  0       0.0  0
  27    9  G1(24)        15.8     0.      52.8 FIXEDHF     0.300  0       0.0  0
  28    A  EAV        48402.2    31.   45640.4             1.000  0    2700.0  0             4s13p
  29    A  ZETA 4         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0
  30    A  G1(24)        11.8     0.      39.5 FIXEDHF     0.300  0       0.0  0
  31    B  EAV        48543.2    31.   45783.9             1.000  0    2700.0  0             4s14p
  32    B  ZETA 4         0.3     0.       0.3 FIXEDHF     1.000  0       0.0  0
  33    B  G1(24)         9.1     0.      30.4 FIXEDHF     0.300  0       0.0  0
  34    C  EAV        37887.1    16.   35193.8             1.000  0    1000.0  0             3d4p
  35    C  ZETA 1        19.0     0.      29.3 FIXEDHF     0.650  0       0.0  0
  36    C  ZETA 3        69.1     0.      69.1 FIXEDHF     1.000  0       0.0  0
  37    C  F2(13)      6988.2   101.   11053.8             0.500  0       0.0  0
  38    C  G1(13)      6863.4    65.    8148.0             0.500  0       0.0  0
  39    C  G3(13)      1662.9     0.    5542.9 FIXEDHF     0.300  0       0.0  0
  40    D  EAV        52471.4    26.   50600.2             1.000  0    1000.0  0             3d5p
  41    D  ZETA 1        21.1     0.      32.5 FIXEDHF     0.650  0       0.0  0
  42    D  ZETA 4        20.4     0.      20.4 FIXEDHF     1.000  0       0.0  0
  43    D  F2(14)      1549.1     0.    2581.8 FIXEDHF     0.600  0       0.0  0
  44    D  G1(14)      1093.1     0.    1366.4 FIXEDHF     0.800  0       0.0  0
  45    D  G3(14)       317.8     0.    1059.5 FIXEDHF     0.300  0       0.0  0
  46    E  EAV        56772.5    33.   55531.8             1.000  0    1000.0  0             3d6p
  47    E  ZETA 1        21.4     0.      33.0 FIXEDHF     0.650  0       0.0  0
  48    E  ZETA 4         8.9     0.       8.9 FIXEDHF     1.000  0       0.0  0
  49    E  F2(14)       618.1     0.    1030.1 FIXEDHF     0.600  0       0.0  0
  50    E  G1(14)       259.8     0.     519.5 FIXEDHF     0.500  0       0.0  0
  51    E  G3(14)       124.9     0.     416.5 FIXEDHF     0.300  0       0.0  0
  52    F  EAV        59204.6    46.   57809.9             1.000  0    1000.0  0             3d7p
  53    F  ZETA 1        21.5     0.      33.1 FIXEDHF     0.650  0       0.0  0
  54    F  ZETA 4         4.6     0.       4.6 FIXEDHF     1.000  0       0.0  0
  55    F  F2(14)       489.2     0.     516.4 FIXED       0.500  0       0.0  0
  56    F  G1(14)       127.8     0.     255.7 FIXEDHF     0.500  0       0.0  0
  57    F  G3(14)       104.1     0.     208.2 FIXEDHF     0.500  0       0.0  0
  58    G  EAV        60384.7    53.   59057.3             1.000  0    1000.0  0             3d8p
  59    G  ZETA 1        21.6     0.      33.2 FIXEDHF     0.650  0       0.0  0
  60    G  ZETA 4         2.7     0.       2.7 FIXEDHF     1.000  0       0.0  0
  61    G  F2(14)       148.0     0.     296.0 FIXEDHF     0.500  0       0.0  0
  62    G  G1(14)        72.5     0.     145.1 FIXEDHF     0.500  0       0.0  0
  63    G  G3(14)        59.6     0.     119.2 FIXEDHF     0.500  0       0.0  0
  64    H  EAV        61095.1    49.   59816.1             1.000  0    1000.0  0             3d9p
  65    H  ZETA 1        21.6     0.      33.2 FIXEDHF     0.650  0       0.0  0
  66    H  ZETA 4         1.7     0.       1.7 FIXEDHF     1.000  0       0.0  0
  67    H  F2(14)        92.8     0.     185.5 FIXEDHF     0.500  0       0.0  0
  68    H  G1(14)        45.1     0.      90.3 FIXEDHF     0.500  0       0.0  0
  69    H  G3(14)        37.3     0.      74.6 FIXEDHF     0.500  0       0.0  0
  70    I  EAV        61559.0    42.   60312.0             1.000  0    1000.0  0             3d10p
  71    I  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
  72    I  ZETA 4         1.2     0.       1.2 FIXEDHF     1.000  0       0.0  0
  73    I  F2(14)        62.0     0.     123.9 FIXEDHF     0.500  0       0.0  0
  74    I  G1(14)        30.0     0.      60.0 FIXEDHF     0.500  0       0.0  0
  75    I  G3(14)        24.9     0.      49.8 FIXEDHF     0.500  0       0.0  0
  76    J  EAV        61814.2    48.   60653.7             1.000  0    1000.0  0             3d11p
  77    J  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
  78    J  ZETA 4         0.8     0.       0.8 FIXEDHF     1.000  0       0.0  0
  79    J  F2(14)        43.5     0.      86.9 FIXEDHF     0.500  0       0.0  0
  80    J  G1(14)        20.9     0.      41.9 FIXEDHF     0.500  0       0.0  0
  81    J  G3(14)        17.4     0.      34.9 FIXEDHF     0.500  0       0.0  0
  82    K  EAV        62054.8    43.   60899.5             1.000  0    1000.0  0             3d12p
  83    K  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
  84    K  ZETA 4         0.6     0.       0.6 FIXEDHF     1.000  0       0.0  0
  85    K  F2(14)        31.6     0.      63.3 FIXEDHF     0.500  0       0.0  0
  86    K  G1(14)        15.2     0.      30.4 FIXEDHF     0.500  0       0.0  0
  87    K  G3(14)        12.7     0.      25.4 FIXEDHF     0.500  0       0.0  0
  88    L  EAV        62202.0    40.   61082.1             1.000  0    1000.0  0             3d13p
  89    L  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
  90    L  ZETA 4         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0
  91    L  F2(14)        23.8     0.      47.5 FIXEDHF     0.500  0       0.0  0
  92    L  G1(14)        11.4     0.      22.8 FIXEDHF     0.500  0       0.0  0
  93    L  G3(14)         9.5     0.      19.0 FIXEDHF     0.500  0       0.0  0
  94    M  EAV        62528.8    36.   61221.4             1.000  0    1000.0  0             3d14p
  95    M  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
  96    M  ZETA 4         0.3     0.       0.3 FIXEDHF     1.000  0       0.0  0
  97    M  F2(14)        18.3     0.      36.5 FIXEDHF     0.500  0       0.0  0
  98    M  G1(14)         8.8     0.      17.5 FIXEDHF     0.500  0       0.0  0
  99    M  G3(14)         7.3     0.      14.6 FIXEDHF     0.500  0       0.0  0
 100    N  EAV        42258.0    27.   39424.9             1.000  0    2700.0  0             4s4f
 101    N  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 102    N  G3(25)        34.7     0.     115.8 FIXEDHF     0.300  0       0.0  0
 103    O  EAV        44816.9    26.   41996.0             1.000  0    2700.0  0             4s5f
 104    O  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 105    O  G3(25)        29.3     0.      97.6 FIXEDHF     0.300  0       0.0  0
 106    P  EAV        46198.8    26.   43396.8             1.000  0    2700.0  0             4s6f
 107    P  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 108    P  G3(25)        21.5     0.      71.8 FIXEDHF     0.300  0       0.0  0
 109    Q  EAV        47029.0    26.   44238.8             1.000  0    2700.0  0             4s7f
 110    Q  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 111    Q  G3(25)        30.6   209.      52.3             0.700  0       0.0  0
 112    R  EAV        47566.2    26.   44783.4             1.000  0    2700.0  0             4s8f
 113    R  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 114    R  G3(25)        23.8   209.      38.6             0.700  0       0.0  0
 115    S  EAV        47933.4    26.   45155.6             1.000  0    2700.0  0             4s9f
 116    S  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 117    S  G3(25)        18.6   209.      29.1             0.700  0       0.0  0
 118    T  EAV        48195.5    26.   45421.1             1.000  0    2700.0  0             4s10f
 119    T  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 120    T  G3(25)        14.8   209.      22.4             0.700  0       0.0  0
 121    U  EAV        48389.2    26.   45617.2             1.000  0    2700.0  0             4s11f
 122    U  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 123    U  G3(25)        12.0   209.      17.6             0.700  0       0.0  0
 124    V  EAV        48536.0    30.   45765.8             1.000  0    2700.0  0             4s12f
 125    V  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 126    V  G3(25)        10.6   222.      14.1             0.700  0       0.0  0
 127    W  EAV        48650.3    36.   45881.2             1.000  0    2700.0  0             4s13f
 128    W  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 129    W  G3(25)         9.2   255.      11.4             0.700  0       0.0  0
 130    X  EAV        48741.1    52.   45972.7             1.000  0    2700.0  0             4s14f
 131    X  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 132    X  G3(25)         6.6     0.       9.4 FIXEDHF     0.700  0       0.0  0
 133    Y  EAV        56119.3    22.   54914.2             1.000  0    1000.0  0             3d4f
 134    Y  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 135    Y  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 136    Y  F2(15)       578.4   172.     573.8             0.500  0       0.0  0
 137    Y  F4(15)        93.5     0.      98.3 FIXED       0.500  0       0.0  0
 138    Y  G1(15)        28.1     0.      56.3 FIXEDHF     0.500  0       0.0  0
 139    Y  G3(15)        16.4     0.      32.7 FIXEDHF     0.500  0       0.0  0
 140    Y  G5(15)        11.3     0.      22.6 FIXEDHF     0.500  0       0.0  0
 141    Z  EAV        58598.3    27.   57464.7             1.000  0    1000.0  0             3d5f
 142    Z  ZETA 1        19.5    32.      33.3             0.650  0       0.0  0
 143    Z  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 144    Z  F2(15)       371.8   215.     295.3             0.500  0       0.0  0
 145    Z  F4(15)        30.8     0.      61.6 FIXEDHF     0.500  0       0.0  0
 146    Z  G1(15)        22.1     0.      44.3 FIXEDHF     0.500  0       0.0  0
 147    Z  G3(15)        12.9     0.      25.8 FIXEDHF     0.500  0       0.0  0
 148    Z  G5(15)         8.9     0.      17.8 FIXEDHF     0.500  0       0.0  0
 149    a  EAV        59937.0    32.   58849.7             1.000  0    1000.0  0             3d6f
 150    a  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 151    a  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 152    a  F2(15)        86.0     0.     172.1 FIXEDHF     0.500  0       0.0  0
 153    a  F4(15)        19.6     0.      39.3 FIXEDHF     0.500  0       0.0  0
 154    a  G1(15)        15.6     0.      31.1 FIXEDHF     0.500  0       0.0  0
 155    a  G3(15)         9.1     0.      18.1 FIXEDHF     0.500  0       0.0  0
 156    a  G5(15)         6.3     0.      12.5 FIXEDHF     0.500  0       0.0  0
 157    b  EAV        60714.5    31.   59682.1             1.000  0    1000.0  0             3d7f
 158    b  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 159    b  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 160    b  F2(15)       117.6     0.     109.3 FIXED       0.500  0       0.0  0
 161    b  F4(15)        13.2     0.      26.3 FIXEDHF     0.500  0       0.0  0
 162    b  G1(15)        10.9     0.      21.9 FIXEDHF     0.500  0       0.0  0
 163    b  G3(15)         6.4     0.      12.8 FIXEDHF     0.500  0       0.0  0
 164    b  G5(15)         4.4     0.       8.8 FIXEDHF     0.500  0       0.0  0
 165    c  EAV        61222.9    38.   60220.7             1.000  0    1000.0  0             3d8f
 166    c  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 167    c  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 168    c  F2(15)        36.9     0.      73.7 FIXEDHF     0.500  0       0.0  0
 169    c  F4(15)         9.2     0.      18.4 FIXEDHF     0.500  0       0.0  0
 170    c  G1(15)         7.9     0.      15.8 FIXEDHF     0.500  0       0.0  0
 171    c  G3(15)         4.6     0.       9.2 FIXEDHF     0.500  0       0.0  0
 172    c  G5(15)         3.2     0.       6.4 FIXEDHF     0.500  0       0.0  0
 173    d  EAV        61590.1    30.   60589.2             1.000  0    1000.0  0             3d9f
 174    d  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 175    d  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 176    d  F2(15)        26.1     0.      52.1 FIXEDHF     0.500  0       0.0  0
 177    d  F4(15)         6.7     0.      13.3 FIXEDHF     0.500  0       0.0  0
 178    d  G1(15)         5.8     0.      11.7 FIXEDHF     0.500  0       0.0  0
 179    d  G3(15)         3.4     0.       6.8 FIXEDHF     0.500  0       0.0  0
 180    d  G5(15)         2.4     0.       4.7 FIXEDHF     0.500  0       0.0  0
 181    e  EAV        61875.3    23.   60852.3             1.000  0    1000.0  0             3d10f
 182    e  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 183    e  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 184    e  F2(15)        19.1     0.      38.2 FIXEDHF     0.500  0       0.0  0
 185    e  F4(15)         5.0     0.       9.9 FIXEDHF     0.500  0       0.0  0
 186    e  G1(15)         4.5     0.       8.9 FIXEDHF     0.500  0       0.0  0
 187    e  G3(15)         2.6     0.       5.2 FIXEDHF     0.500  0       0.0  0
 188    e  G5(15)         1.8     0.       3.6 FIXEDHF     0.500  0       0.0  0
 189    f  EAV        62058.5    22.   61046.5             1.000  0    1000.0  0             3d11f
 190    f  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 191    f  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 192    f  F2(15)        14.4     0.      28.9 FIXEDHF     0.500  0       0.0  0
 193    f  F4(15)         3.8     0.       7.6 FIXEDHF     0.500  0       0.0  0
 194    f  G1(15)         3.5     0.       6.9 FIXEDHF     0.500  0       0.0  0
 195    f  G3(15)         2.0     0.       4.0 FIXEDHF     0.500  0       0.0  0
 196    f  G5(15)         1.4     0.       2.8 FIXEDHF     0.500  0       0.0  0
 197    g  EAV        62206.7    21.   61193.8             1.000  0    1000.0  0             3d12f
 198    g  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 199    g  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 200    g  F2(15)        11.2     0.      22.4 FIXEDHF     0.500  0       0.0  0
 201    g  F4(15)         3.0     0.       5.9 FIXEDHF     0.500  0       0.0  0
 202    g  G1(15)         2.7     0.       5.4 FIXEDHF     0.500  0       0.0  0
 203    g  G3(15)         1.6     0.       3.2 FIXEDHF     0.500  0       0.0  0
 204    g  G5(15)         1.1     0.       2.2 FIXEDHF     0.500  0       0.0  0
 205    h  EAV        62301.9    31.   61308.4             1.000  0    1000.0  0             3d13f
 206    h  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 207    h  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 208    h  F2(15)         8.8     0.      17.7 FIXEDHF     0.500  0       0.0  0
 209    h  F4(15)         2.4     0.       4.7 FIXEDHF     0.500  0       0.0  0
 210    h  G1(15)         2.2     0.       4.4 FIXEDHF     0.500  0       0.0  0
 211    h  G3(15)         1.3     0.       2.6 FIXEDHF     0.500  0       0.0  0
 212    h  G5(15)         0.9     0.       1.8 FIXEDHF     0.500  0       0.0  0
 213    i  EAV        62395.6    33.   61399.3             1.000  0    1000.0  0             3d14f
 214    i  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 215    i  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 216    i  F2(15)         7.1     0.      14.2 FIXEDHF     0.500  0       0.0  0
 217    i  F4(15)         1.9     0.       3.8 FIXEDHF     0.500  0       0.0  0
 218    i  G1(15)         1.8     0.       3.6 FIXEDHF     0.500  0       0.0  0
 219    i  G3(15)         1.1     0.       2.1 FIXEDHF     0.500  0       0.0  0
 220    i  G5(15)         0.7     0.       1.4 FIXEDHF     0.500  0       0.0  0
 221    j  EAV        46249.2    26.   43491.4             1.000  0    2700.0  0             4s6h
 222    j  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 223    j  G5(26)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 224    k  EAV        47060.5    26.   44300.0             1.000  0    2700.0  0             4s7h
 225    k  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 226    k  G5(26)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 227    l  EAV        47587.1    26.   44825.1             1.000  0    2700.0  0             4s8h
 228    l  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 229    l  G5(26)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 230    m  EAV        47948.1    26.   45185.3             1.000  0    2700.0  0             4s9h
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
 265    r  EAV        47590.6    26.   44826.0             1.000  0    2700.0  0             4s8k
 266    r  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 267    r  G7(27)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 268    s  EAV        47950.6    26.   45185.9             1.000  0    2700.0  0             4s9k
 269    s  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 270    s  G7(27)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 271    t  EAV        61250.0     0.   60250.0 FIXEDHF     1.000  0    1000.0  0             3d8k
 272    t  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 273    t  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 274    t  F2(17)         3.6     0.       7.2 FIXEDHF     0.500  0       0.0  0
 275    t  F4(17)         0.1     0.       0.1 FIXEDHF     0.500  0       0.0  0
 276    t  G5(17)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 277    t  G7(17)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 278    t  G9(17)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 279    u  EAV        61610.1     0.   60610.1 FIXEDHF     1.000  0    1000.0  0             3d9k
 280    u  ZETA 1        21.6     0.      33.3 FIXEDHF     0.650  0       0.0  0
 281    u  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 282    u  F2(17)         2.5     0.       5.1 FIXEDHF     0.500  0       0.0  0
 283    u  F4(17)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 284    u  G5(17)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 285    u  G7(17)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 286    u  G9(17)         0.0     0.       0.0 FIXEDHF     0.500  0       0.0  0
 287    v  EAV        59479.8     0.   59003.3 FIXED       1.000  0    3000.0  0             4p4d
 288    v  ZETA 3       155.6     0.     155.6 FIXEDHF     1.000  0       0.0  0
 289    v  ZETA 8         2.7     0.       2.7 FIXEDHF     1.000  0       0.0  0
 290    v  F2(38)      1764.7     0.    5379.4 FIXED       0.500  0       0.0  0
 291    v  G1(38)       913.4     0.    1826.8 FIXEDHF     0.500  0       0.0  0
 292    v  G3(38)       713.4     0.    1426.8 FIXEDHF     0.500  0       0.0  0
 293    w  EAV        65590.8    63.   64538.3             1.000  0    3000.0  0             4p5d
 294    w  ZETA 3       161.7     0.     161.7 FIXEDHF     1.000  0       0.0  0
 295    w  ZETA 8         1.2     0.       1.2 FIXEDHF     1.000  0       0.0  0
 296    w  F2(38)      1055.6     0.    2111.2 FIXEDHF     0.500  0       0.0  0
 297    w  G1(38)       433.3     0.     866.6 FIXEDHF     0.500  0       0.0  0
 298    w  G3(38)       332.8     0.     665.5 FIXEDHF     0.500  0       0.0  0
 299    x  EAV        69198.9    58.   66932.2             1.000  0    3000.0  0             4p6d
 300    x  ZETA 3       163.8     0.     163.8 FIXEDHF     1.000  0       0.0  0
 301    x  ZETA 8         0.6     0.       0.6 FIXEDHF     1.000  0       0.0  0
 302    x  F2(38)       521.4     0.    1042.8 FIXEDHF     0.500  0       0.0  0
 303    x  G1(38)       232.6     0.     465.1 FIXEDHF     0.500  0       0.0  0
 304    x  G3(38)       177.4     0.     354.8 FIXEDHF     0.500  0       0.0  0
 305    y  EAV        70932.4    59.   68223.3             1.000  0    3000.0  0             4p7d
 306    y  ZETA 3       164.7     0.     164.7 FIXEDHF     1.000  0       0.0  0
 307    y  ZETA 8         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0
 308    y  F2(38)       294.4     0.     588.7 FIXEDHF     0.500  0       0.0  0
 309    y  G1(38)       136.8     0.     273.7 FIXEDHF     0.500  0       0.0  0
 310    y  G3(38)       104.1     0.     208.2 FIXEDHF     0.500  0       0.0  0
 311    z  EAV        72009.4    56.   69002.6             1.000  0    3000.0  0             4p8d
 312    z  ZETA 3       165.1     0.     165.1 FIXEDHF     1.000  0       0.0  0
 313    z  ZETA 8         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0
 314    z  F2(38)       182.0     0.     364.0 FIXEDHF     0.500  0       0.0  0
 315    z  G1(38)        86.6     0.     173.2 FIXEDHF     0.500  0       0.0  0
 316    z  G3(38)        65.8     0.     131.6 FIXEDHF     0.500  0       0.0  0
 317    12 0D2324       884.4     0.    1263.5 FIXEDHF     0.700  0       0.0  0  4s4p      -4s5p
 318    12 1E2324      5175.0     0.    7392.9 FIXEDHF     0.700  0       0.0  0
 319    13 0D2324       503.9     0.     719.9 FIXEDHF     0.700  0       0.0  0  4s4p      -4s6p
 320    13 1E2324      2923.3     0.    4176.1 FIXEDHF     0.700  0       0.0  0
 321    14 0D2324       340.8     0.     486.9 FIXEDHF     0.700  0       0.0  0  4s4p      -4s7p
 322    14 1E2324      1969.5     0.    2813.6 FIXEDHF     0.700  0       0.0  0
 323    15 0D2324       251.6     0.     359.4 FIXEDHF     0.700  0       0.0  0  4s4p      -4s8p
 324    15 1E2324      1450.5     0.    2072.1 FIXEDHF     0.700  0       0.0  0
 325    16 0D2324       196.0     0.     280.0 FIXEDHF     0.700  0       0.0  0  4s4p      -4s9p
 326    16 1E2324      1128.5     0.    1612.2 FIXEDHF     0.700  0       0.0  0
 327    17 0D2324       158.5     0.     226.4 FIXEDHF     0.700  0       0.0  0  4s4p      -4s10p
 328    17 1E2324       911.7     0.    1302.4 FIXEDHF     0.700  0       0.0  0
 329    18 0D2324       131.7     0.     188.1 FIXEDHF     0.700  0       0.0  0  4s4p      -4s11p
 330    18 1E2324       757.0     0.    1081.5 FIXEDHF     0.700  0       0.0  0
 331    19 0D2324       111.7     0.     159.6 FIXEDHF     0.700  0       0.0  0  4s4p      -4s12p
 332    19 1E2324       642.1     0.     917.3 FIXEDHF     0.700  0       0.0  0
 333    1A 0D2324        96.4     0.     137.7 FIXEDHF     0.700  0       0.0  0  4s4p      -4s13p
 334    1A 1E2324       553.8     0.     791.1 FIXEDHF     0.700  0       0.0  0
 335    1B 0D2324        84.3     0.     120.4 FIXEDHF     0.700  0       0.0  0  4s4p      -4s14p
 336    1B 1E2324       484.1     0.     691.6 FIXEDHF     0.700  0       0.0  0
 337    1C 2D2313     -9556.7     0.  -12742.2 FIXEDHF     0.750  0       0.0  0  4s4p      -3d4p
 338    1C 1E2313    -10169.8     0.  -13559.7 FIXEDHF     0.750  0       0.0  0
 339    1D 2D2314     -3126.3     0.   -4466.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d5p
 340    1D 1E2314     -3524.5     0.   -5035.0 FIXEDHF     0.700  0       0.0  0
 341    1E 2D2314     -1791.6     0.   -2559.4 FIXEDHF     0.700  0       0.0  0  4s4p      -3d6p
 342    1E 1E2314     -2060.2     0.   -2943.1 FIXEDHF     0.700  0       0.0  0
 343    1F 2D2314     -1209.2     0.   -1727.4 FIXEDHF     0.700  0       0.0  0  4s4p      -3d7p
 344    1F 1E2314     -1404.8     0.   -2006.9 FIXEDHF     0.700  0       0.0  0
 345    1G 2D2314      -889.7     0.   -1271.0 FIXEDHF     0.700  0       0.0  0  4s4p      -3d8p
 346    1G 1E2314     -1040.1     0.   -1485.9 FIXEDHF     0.700  0       0.0  0
 347    1H 2D2314      -691.0     0.    -987.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d9p
 348    1H 1E2314      -811.3     0.   -1159.0 FIXEDHF     0.700  0       0.0  0
 349    1I 2D2314      -557.0     0.    -795.7 FIXEDHF     0.700  0       0.0  0  4s4p      -3d10p
 350    1I 1E2314      -656.0     0.    -937.2 FIXEDHF     0.700  0       0.0  0
 351    1J 2D2314      -461.5     0.    -659.3 FIXEDHF     0.700  0       0.0  0  4s4p      -3d11p
 352    1J 1E2314      -544.9     0.    -778.4 FIXEDHF     0.700  0       0.0  0
 353    1K 2D2314      -390.5     0.    -557.9 FIXEDHF     0.700  0       0.0  0  4s4p      -3d12p
 354    1K 1E2314      -462.0     0.    -660.0 FIXEDHF     0.700  0       0.0  0
 355    1L 2D2314      -336.1     0.    -480.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d13p
 356    1L 1E2314      -398.2     0.    -568.8 FIXEDHF     0.700  0       0.0  0
 357    1M 2D2314      -293.2     0.    -418.9 FIXEDHF     0.700  0       0.0  0  4s4p      -3d14p
 358    1M 1E2314      -347.8     0.    -496.9 FIXEDHF     0.700  0       0.0  0
 359    1Y 2D2315      -957.0     0.   -1367.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d4f
 360    1Y 3E2315      -467.3     0.    -667.6 FIXEDHF     0.700  0       0.0  0
 361    1Z 2D2315      -830.3     0.   -1186.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d5f
 362    1Z 3E2315      -421.0     0.    -601.4 FIXEDHF     0.700  0       0.0  0
 363    1a 2D2315      -686.9     0.    -981.3 FIXEDHF     0.700  0       0.0  0  4s4p      -3d6f
 364    1a 3E2315      -355.5     0.    -507.8 FIXEDHF     0.700  0       0.0  0
 365    1b 2D2315      -571.9     0.    -817.0 FIXEDHF     0.700  0       0.0  0  4s4p      -3d7f
 366    1b 3E2315      -299.6     0.    -428.0 FIXEDHF     0.700  0       0.0  0
 367    1c 2D2315      -483.1     0.    -690.1 FIXEDHF     0.700  0       0.0  0  4s4p      -3d8f
 368    1c 3E2315      -255.2     0.    -364.6 FIXEDHF     0.700  0       0.0  0
 369    1d 2D2315      -414.0     0.    -591.5 FIXEDHF     0.700  0       0.0  0  4s4p      -3d9f
 370    1d 3E2315      -220.1     0.    -314.4 FIXEDHF     0.700  0       0.0  0
 371    1e 2D2315      -359.6     0.    -513.7 FIXEDHF     0.700  0       0.0  0  4s4p      -3d10f
 372    1e 3E2315      -192.0     0.    -274.3 FIXEDHF     0.700  0       0.0  0
 373    1f 2D2315      -315.9     0.    -451.3 FIXEDHF     0.700  0       0.0  0  4s4p      -3d11f
 374    1f 3E2315      -169.3     0.    -241.9 FIXEDHF     0.700  0       0.0  0
 375    1g 2D2315      -280.3     0.    -400.5 FIXEDHF     0.700  0       0.0  0  4s4p      -3d12f
 376    1g 3E2315      -150.7     0.    -215.3 FIXEDHF     0.700  0       0.0  0
 377    1h 2D2315      -250.9     0.    -358.5 FIXEDHF     0.700  0       0.0  0  4s4p      -3d13f
 378    1h 3E2315      -135.2     0.    -193.1 FIXEDHF     0.700  0       0.0  0
 379    1i 2D2315      -226.4     0.    -323.4 FIXEDHF     0.700  0       0.0  0  4s4p      -3d14f
 380    1i 3E2315      -122.2     0.    -174.6 FIXEDHF     0.700  0       0.0  0
 381    1v 1D2338      4030.3     0.    5757.6 FIXEDHF     0.700  0       0.0  0  4s4p      -4p4d
 382    1v 2E2338      1051.8     0.    1502.5 FIXEDHF     0.700  0       0.0  0
 383    1w 1D2338      3026.2     0.    4323.1 FIXEDHF     0.700  0       0.0  0  4s4p      -4p5d
 384    1w 2E2338      1178.7     0.    1683.9 FIXEDHF     0.700  0       0.0  0
 385    1x 1D2338      2256.7     0.    3223.9 FIXEDHF     0.700  0       0.0  0  4s4p      -4p6d
 386    1x 2E2338       994.7     0.    1421.0 FIXEDHF     0.700  0       0.0  0
 387    1y 1D2338      1740.2     0.    2486.0 FIXEDHF     0.700  0       0.0  0  4s4p      -4p7d
 388    1y 2E2338       815.0     0.    1164.3 FIXEDHF     0.700  0       0.0  0
 389    1z 1D2338      1386.4     0.    1980.6 FIXEDHF     0.700  0       0.0  0  4s4p      -4p8d
 390    1z 2E2338       672.9     0.     961.3 FIXEDHF     0.700  0       0.0  0
 391    23 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s6p
 392    23 1E2424      1131.8     0.    1616.9 FIXEDHF     0.700  0       0.0  0
 393    24 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s7p
 394    24 1E2424       777.8     0.    1111.1 FIXEDHF     0.700  0       0.0  0
 395    25 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s8p
 396    25 1E2424       579.2     0.     827.4 FIXEDHF     0.700  0       0.0  0
 397    26 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s9p
 398    26 1E2424       453.8     0.     648.3 FIXEDHF     0.700  0       0.0  0
 399    27 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s10p
 400    27 1E2424       368.4     0.     526.3 FIXEDHF     0.700  0       0.0  0
 401    28 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s11p
 402    28 1E2424       307.0     0.     438.6 FIXEDHF     0.700  0       0.0  0
 403    29 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s12p
 404    29 1E2424       261.1     0.     373.0 FIXEDHF     0.700  0       0.0  0
 405    2A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s13p
 406    2A 1E2424       225.6     0.     322.3 FIXEDHF     0.700  0       0.0  0
 407    2B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5p      -4s14p
 408    2B 1E2424       197.6     0.     282.3 FIXEDHF     0.700  0       0.0  0
 409    2C 2D2413     -2032.9     0.   -2904.1 FIXEDHF     0.700  0       0.0  0  4s5p      -3d4p
 410    2C 1E2413     -2788.9     0.   -3984.2 FIXEDHF     0.700  0       0.0  0
 411    2D 2D2414     -1779.2     0.   -2541.7 FIXEDHF     0.700  0       0.0  0  4s5p      -3d5p
 412    2D 1E2414     -1237.5     0.   -1767.8 FIXEDHF     0.700  0       0.0  0
 413    2E 2D2414     -1023.6     0.   -1462.3 FIXEDHF     0.700  0       0.0  0  4s5p      -3d6p
 414    2E 1E2414      -752.4     0.   -1074.9 FIXEDHF     0.700  0       0.0  0
 415    2F 2D2414      -699.3     0.    -999.0 FIXEDHF     0.700  0       0.0  0  4s5p      -3d7p
 416    2F 1E2414      -522.3     0.    -746.2 FIXEDHF     0.700  0       0.0  0
 417    2G 2D2414      -519.2     0.    -741.7 FIXEDHF     0.700  0       0.0  0  4s5p      -3d8p
 418    2G 1E2414      -390.7     0.    -558.2 FIXEDHF     0.700  0       0.0  0
 419    2H 2D2414      -406.0     0.    -580.0 FIXEDHF     0.700  0       0.0  0  4s5p      -3d9p
 420    2H 1E2414      -306.7     0.    -438.2 FIXEDHF     0.700  0       0.0  0
 421    2I 2D2414      -329.1     0.    -470.1 FIXEDHF     0.700  0       0.0  0  4s5p      -3d10p
 422    2I 1E2414      -249.2     0.    -356.0 FIXEDHF     0.700  0       0.0  0
 423    2J 2D2414      -273.9     0.    -391.3 FIXEDHF     0.700  0       0.0  0  4s5p      -3d11p
 424    2J 1E2414      -207.7     0.    -296.7 FIXEDHF     0.700  0       0.0  0
 425    2K 2D2414      -232.6     0.    -332.3 FIXEDHF     0.700  0       0.0  0  4s5p      -3d12p
 426    2K 1E2414      -176.5     0.    -252.2 FIXEDHF     0.700  0       0.0  0
 427    2L 2D2414      -200.8     0.    -286.9 FIXEDHF     0.700  0       0.0  0  4s5p      -3d13p
 428    2L 1E2414      -152.5     0.    -217.9 FIXEDHF     0.700  0       0.0  0
 429    2M 2D2414      -175.7     0.    -251.0 FIXEDHF     0.700  0       0.0  0  4s5p      -3d14p
 430    2M 1E2414      -133.4     0.    -190.6 FIXEDHF     0.700  0       0.0  0
 431    2Y 2D2415       397.3     0.     567.5 FIXEDHF     0.700  0       0.0  0  4s5p      -3d4f
 432    2Y 3E2415      -121.0     0.    -172.8 FIXEDHF     0.700  0       0.0  0
 433    2Z 2D2415       196.3     0.     280.5 FIXEDHF     0.700  0       0.0  0  4s5p      -3d5f
 434    2Z 3E2415      -111.9     0.    -159.8 FIXEDHF     0.700  0       0.0  0
 435    2a 2D2415       111.6     0.     159.5 FIXEDHF     0.700  0       0.0  0  4s5p      -3d6f
 436    2a 3E2415       -95.8     0.    -136.9 FIXEDHF     0.700  0       0.0  0
 437    2b 2D2415        70.2     0.     100.3 FIXEDHF     0.700  0       0.0  0  4s5p      -3d7f
 438    2b 3E2415       -81.5     0.    -116.5 FIXEDHF     0.700  0       0.0  0
 439    2c 2D2415        47.4     0.      67.7 FIXEDHF     0.700  0       0.0  0  4s5p      -3d8f
 440    2c 3E2415       -69.9     0.     -99.9 FIXEDHF     0.700  0       0.0  0
 441    2d 2D2415        33.7     0.      48.2 FIXEDHF     0.700  0       0.0  0  4s5p      -3d9f
 442    2d 3E2415       -60.5     0.     -86.5 FIXEDHF     0.700  0       0.0  0
 443    2e 2D2415        25.0     0.      35.7 FIXEDHF     0.700  0       0.0  0  4s5p      -3d10f
 444    2e 3E2415       -53.1     0.     -75.8 FIXEDHF     0.700  0       0.0  0
 445    2f 2D2415        19.1     0.      27.3 FIXEDHF     0.700  0       0.0  0  4s5p      -3d11f
 446    2f 3E2415       -46.9     0.     -67.0 FIXEDHF     0.700  0       0.0  0
 447    2g 2D2415        15.0     0.      21.4 FIXEDHF     0.700  0       0.0  0  4s5p      -3d12f
 448    2g 3E2415       -41.9     0.     -59.8 FIXEDHF     0.700  0       0.0  0
 449    2h 2D2415        12.0     0.      17.1 FIXEDHF     0.700  0       0.0  0  4s5p      -3d13f
 450    2h 3E2415       -37.6     0.     -53.7 FIXEDHF     0.700  0       0.0  0
 451    2i 2D2415         9.7     0.      13.9 FIXEDHF     0.700  0       0.0  0  4s5p      -3d14f
 452    2i 3E2415       -34.1     0.     -48.7 FIXEDHF     0.700  0       0.0  0
 453    2v 1D2438     -3539.3     0.   -5056.1 FIXEDHF     0.700  0       0.0  0  4s5p      -4p4d
 454    2v 2E2438      -180.8     0.    -258.3 FIXEDHF     0.700  0       0.0  0
 455    2w 1D2438      -230.6     0.    -329.4 FIXEDHF     0.700  0       0.0  0  4s5p      -4p5d
 456    2w 2E2438        38.4     0.      54.9 FIXEDHF     0.700  0       0.0  0
 457    2x 1D2438       188.6     0.     269.5 FIXEDHF     0.700  0       0.0  0  4s5p      -4p6d
 458    2x 2E2438        81.1     0.     115.8 FIXEDHF     0.700  0       0.0  0
 459    2y 1D2438       267.3     0.     381.8 FIXEDHF     0.700  0       0.0  0  4s5p      -4p7d
 460    2y 2E2438        84.2     0.     120.3 FIXEDHF     0.700  0       0.0  0
 461    2z 1D2438       267.6     0.     382.3 FIXEDHF     0.700  0       0.0  0  4s5p      -4p8d
 462    2z 2E2438        77.8     0.     111.1 FIXEDHF     0.700  0       0.0  0
 463    34 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s7p
 464    34 1E2424       464.9     0.     664.1 FIXEDHF     0.700  0       0.0  0
 465    35 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s8p
 466    35 1E2424       347.0     0.     495.7 FIXEDHF     0.700  0       0.0  0
 467    36 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s9p
 468    36 1E2424       272.2     0.     388.9 FIXEDHF     0.700  0       0.0  0
 469    37 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s10p
 470    37 1E2424       221.2     0.     316.0 FIXEDHF     0.700  0       0.0  0
 471    38 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s11p
 472    38 1E2424       184.4     0.     263.5 FIXEDHF     0.700  0       0.0  0
 473    39 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s12p
 474    39 1E2424       157.0     0.     224.3 FIXEDHF     0.700  0       0.0  0
 475    3A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s13p
 476    3A 1E2424       135.7     0.     193.9 FIXEDHF     0.700  0       0.0  0
 477    3B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6p      -4s14p
 478    3B 1E2424       118.9     0.     169.8 FIXEDHF     0.700  0       0.0  0
 479    3C 2D2413     -1070.2     0.   -1528.9 FIXEDHF     0.700  0       0.0  0  4s6p      -3d4p
 480    3C 1E2413     -1583.7     0.   -2262.4 FIXEDHF     0.700  0       0.0  0
 481    3D 2D2414      -867.6     0.   -1239.4 FIXEDHF     0.700  0       0.0  0  4s6p      -3d5p
 482    3D 1E2414      -727.3     0.   -1039.0 FIXEDHF     0.700  0       0.0  0
 483    3E 2D2414      -681.0     0.    -972.8 FIXEDHF     0.700  0       0.0  0  4s6p      -3d6p
 484    3E 1E2414      -445.7     0.    -636.7 FIXEDHF     0.700  0       0.0  0
 485    3F 2D2414      -464.2     0.    -663.1 FIXEDHF     0.700  0       0.0  0  4s6p      -3d7p
 486    3F 1E2414      -310.5     0.    -443.6 FIXEDHF     0.700  0       0.0  0
 487    3G 2D2414      -345.8     0.    -494.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d8p
 488    3G 1E2414      -232.7     0.    -332.5 FIXEDHF     0.700  0       0.0  0
 489    3H 2D2414      -271.1     0.    -387.3 FIXEDHF     0.700  0       0.0  0  4s6p      -3d9p
 490    3H 1E2414      -183.0     0.    -261.4 FIXEDHF     0.700  0       0.0  0
 491    3I 2D2414      -220.2     0.    -314.6 FIXEDHF     0.700  0       0.0  0  4s6p      -3d10p
 492    3I 1E2414      -148.8     0.    -212.5 FIXEDHF     0.700  0       0.0  0
 493    3J 2D2414      -183.5     0.    -262.2 FIXEDHF     0.700  0       0.0  0  4s6p      -3d11p
 494    3J 1E2414      -124.0     0.    -177.2 FIXEDHF     0.700  0       0.0  0
 495    3K 2D2414      -156.1     0.    -223.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d12p
 496    3K 1E2414      -105.5     0.    -150.7 FIXEDHF     0.700  0       0.0  0
 497    3L 2D2414      -135.0     0.    -192.8 FIXEDHF     0.700  0       0.0  0  4s6p      -3d13p
 498    3L 1E2414       -91.2     0.    -130.3 FIXEDHF     0.700  0       0.0  0
 499    3M 2D2414      -118.2     0.    -168.8 FIXEDHF     0.700  0       0.0  0  4s6p      -3d14p
 500    3M 1E2414       -79.8     0.    -114.0 FIXEDHF     0.700  0       0.0  0
 501    3Y 2D2415        86.4     0.     123.4 FIXEDHF     0.700  0       0.0  0  4s6p      -3d4f
 502    3Y 3E2415       -65.7     0.     -93.8 FIXEDHF     0.700  0       0.0  0
 503    3Z 2D2415       140.0     0.     200.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d5f
 504    3Z 3E2415       -61.2     0.     -87.4 FIXEDHF     0.700  0       0.0  0
 505    3a 2D2415       102.7     0.     146.7 FIXEDHF     0.700  0       0.0  0  4s6p      -3d6f
 506    3a 3E2415       -52.6     0.     -75.2 FIXEDHF     0.700  0       0.0  0
 507    3b 2D2415        76.2     0.     108.9 FIXEDHF     0.700  0       0.0  0  4s6p      -3d7f
 508    3b 3E2415       -44.9     0.     -64.1 FIXEDHF     0.700  0       0.0  0
 509    3c 2D2415        58.8     0.      84.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d8f
 510    3c 3E2415       -38.6     0.     -55.1 FIXEDHF     0.700  0       0.0  0
 511    3d 2D2415        46.9     0.      67.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d9f
 512    3d 3E2415       -33.5     0.     -47.8 FIXEDHF     0.700  0       0.0  0
 513    3e 2D2415        38.4     0.      54.9 FIXEDHF     0.700  0       0.0  0  4s6p      -3d10f
 514    3e 3E2415       -29.3     0.     -41.9 FIXEDHF     0.700  0       0.0  0
 515    3f 2D2415        32.2     0.      46.0 FIXEDHF     0.700  0       0.0  0  4s6p      -3d11f
 516    3f 3E2415       -25.9     0.     -37.0 FIXEDHF     0.700  0       0.0  0
 517    3g 2D2415        27.4     0.      39.2 FIXEDHF     0.700  0       0.0  0  4s6p      -3d12f
 518    3g 3E2415       -23.2     0.     -33.1 FIXEDHF     0.700  0       0.0  0
 519    3h 2D2415        23.7     0.      33.9 FIXEDHF     0.700  0       0.0  0  4s6p      -3d13f
 520    3h 3E2415       -20.9     0.     -29.8 FIXEDHF     0.700  0       0.0  0
 521    3i 2D2415        20.8     0.      29.7 FIXEDHF     0.700  0       0.0  0  4s6p      -3d14f
 522    3i 3E2415       -18.8     0.     -26.9 FIXEDHF     0.700  0       0.0  0
 523    3v 1D2438     -1476.5     0.   -2109.3 FIXEDHF     0.700  0       0.0  0  4s6p      -4p4d
 524    3v 2E2438      -170.0     0.    -242.9 FIXEDHF     0.700  0       0.0  0
 525    3w 1D2438     -1489.5     0.   -2127.8 FIXEDHF     0.700  0       0.0  0  4s6p      -4p5d
 526    3w 2E2438       -25.8     0.     -36.8 FIXEDHF     0.700  0       0.0  0
 527    3x 1D2438      -356.7     0.    -509.6 FIXEDHF     0.700  0       0.0  0  4s6p      -4p6d
 528    3x 2E2438        11.7     0.      16.7 FIXEDHF     0.700  0       0.0  0
 529    3y 1D2438      -111.6     0.    -159.5 FIXEDHF     0.700  0       0.0  0  4s6p      -4p7d
 530    3y 2E2438        21.8     0.      31.2 FIXEDHF     0.700  0       0.0  0
 531    3z 1D2438       -23.2     0.     -33.2 FIXEDHF     0.700  0       0.0  0  4s6p      -4p8d
 532    3z 2E2438        23.7     0.      33.9 FIXEDHF     0.700  0       0.0  0
 533    45 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s8p
 534    45 1E2424       240.1     0.     343.0 FIXEDHF     0.700  0       0.0  0
 535    46 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s9p
 536    46 1E2424       188.5     0.     269.3 FIXEDHF     0.700  0       0.0  0
 537    47 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s10p
 538    47 1E2424       153.2     0.     218.9 FIXEDHF     0.700  0       0.0  0
 539    48 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s11p
 540    48 1E2424       127.8     0.     182.6 FIXEDHF     0.700  0       0.0  0
 541    49 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s12p
 542    49 1E2424       108.8     0.     155.4 FIXEDHF     0.700  0       0.0  0
 543    4A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s13p
 544    4A 1E2424        94.1     0.     134.4 FIXEDHF     0.700  0       0.0  0
 545    4B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4s14p
 546    4B 1E2424        82.4     0.     117.7 FIXEDHF     0.700  0       0.0  0
 547    4C 2D2413      -696.4     0.    -994.9 FIXEDHF     0.700  0       0.0  0  4s7p      -3d4p
 548    4C 1E2413     -1071.0     0.   -1530.0 FIXEDHF     0.700  0       0.0  0
 549    4D 2D2414      -562.7     0.    -803.8 FIXEDHF     0.700  0       0.0  0  4s7p      -3d5p
 550    4D 1E2414      -499.3     0.    -713.3 FIXEDHF     0.700  0       0.0  0
 551    4E 2D2414      -424.4     0.    -606.3 FIXEDHF     0.700  0       0.0  0  4s7p      -3d6p
 552    4E 1E2414      -307.0     0.    -438.6 FIXEDHF     0.700  0       0.0  0
 553    4F 2D2414      -335.2     0.    -478.8 FIXEDHF     0.700  0       0.0  0  4s7p      -3d7p
 554    4F 1E2414      -214.3     0.    -306.1 FIXEDHF     0.700  0       0.0  0
 555    4G 2D2414      -249.3     0.    -356.1 FIXEDHF     0.700  0       0.0  0  4s7p      -3d8p
 556    4G 1E2414      -160.7     0.    -229.6 FIXEDHF     0.700  0       0.0  0
 557    4H 2D2414      -195.7     0.    -279.6 FIXEDHF     0.700  0       0.0  0  4s7p      -3d9p
 558    4H 1E2414      -126.4     0.    -180.6 FIXEDHF     0.700  0       0.0  0
 559    4I 2D2414      -159.2     0.    -227.4 FIXEDHF     0.700  0       0.0  0  4s7p      -3d10p
 560    4I 1E2414      -102.8     0.    -146.9 FIXEDHF     0.700  0       0.0  0
 561    4J 2D2414      -132.9     0.    -189.8 FIXEDHF     0.700  0       0.0  0  4s7p      -3d11p
 562    4J 1E2414       -85.8     0.    -122.6 FIXEDHF     0.700  0       0.0  0
 563    4K 2D2414      -113.1     0.    -161.6 FIXEDHF     0.700  0       0.0  0  4s7p      -3d12p
 564    4K 1E2414       -73.0     0.    -104.3 FIXEDHF     0.700  0       0.0  0
 565    4L 2D2414       -97.9     0.    -139.8 FIXEDHF     0.700  0       0.0  0  4s7p      -3d13p
 566    4L 1E2414       -63.1     0.     -90.1 FIXEDHF     0.700  0       0.0  0
 567    4M 2D2414       -85.7     0.    -122.4 FIXEDHF     0.700  0       0.0  0  4s7p      -3d14p
 568    4M 1E2414       -55.2     0.     -78.9 FIXEDHF     0.700  0       0.0  0
 569    4Y 2D2415        54.7     0.      78.1 FIXEDHF     0.700  0       0.0  0  4s7p      -3d4f
 570    4Y 3E2415       -43.4     0.     -62.0 FIXEDHF     0.700  0       0.0  0
 571    4Z 2D2415        52.8     0.      75.5 FIXEDHF     0.700  0       0.0  0  4s7p      -3d5f
 572    4Z 3E2415       -40.5     0.     -57.9 FIXEDHF     0.700  0       0.0  0
 573    4a 2D2415        64.5     0.      92.1 FIXEDHF     0.700  0       0.0  0  4s7p      -3d6f
 574    4a 3E2415       -34.9     0.     -49.9 FIXEDHF     0.700  0       0.0  0
 575    4b 2D2415        53.3     0.      76.1 FIXEDHF     0.700  0       0.0  0  4s7p      -3d7f
 576    4b 3E2415       -29.8     0.     -42.6 FIXEDHF     0.700  0       0.0  0
 577    4c 2D2415        43.3     0.      61.9 FIXEDHF     0.700  0       0.0  0  4s7p      -3d8f
 578    4c 3E2415       -25.6     0.     -36.6 FIXEDHF     0.700  0       0.0  0
 579    4d 2D2415        35.8     0.      51.1 FIXEDHF     0.700  0       0.0  0  4s7p      -3d9f
 580    4d 3E2415       -22.3     0.     -31.8 FIXEDHF     0.700  0       0.0  0
 581    4e 2D2415        30.0     0.      42.9 FIXEDHF     0.700  0       0.0  0  4s7p      -3d10f
 582    4e 3E2415       -19.5     0.     -27.9 FIXEDHF     0.700  0       0.0  0
 583    4f 2D2415        25.6     0.      36.6 FIXEDHF     0.700  0       0.0  0  4s7p      -3d11f
 584    4f 3E2415       -17.3     0.     -24.7 FIXEDHF     0.700  0       0.0  0
 585    4g 2D2415        22.2     0.      31.7 FIXEDHF     0.700  0       0.0  0  4s7p      -3d12f
 586    4g 3E2415       -15.4     0.     -22.0 FIXEDHF     0.700  0       0.0  0
 587    4h 2D2415        19.4     0.      27.7 FIXEDHF     0.700  0       0.0  0  4s7p      -3d13f
 588    4h 3E2415       -13.9     0.     -19.8 FIXEDHF     0.700  0       0.0  0
 589    4i 2D2415        17.1     0.      24.5 FIXEDHF     0.700  0       0.0  0  4s7p      -3d14f
 590    4i 3E2415       -12.6     0.     -18.0 FIXEDHF     0.700  0       0.0  0
 591    4v 1D2438      -953.7     0.   -1362.4 FIXEDHF     0.700  0       0.0  0  4s7p      -4p4d
 592    4v 2E2438      -136.0     0.    -194.3 FIXEDHF     0.700  0       0.0  0
 593    4w 1D2438      -763.7     0.   -1091.0 FIXEDHF     0.700  0       0.0  0  4s7p      -4p5d
 594    4w 2E2438       -32.6     0.     -46.6 FIXEDHF     0.700  0       0.0  0
 595    4x 1D2438      -751.7     0.   -1073.8 FIXEDHF     0.700  0       0.0  0  4s7p      -4p6d
 596    4x 2E2438        -3.2     0.      -4.6 FIXEDHF     0.700  0       0.0  0
 597    4y 1D2438      -266.6     0.    -380.8 FIXEDHF     0.700  0       0.0  0  4s7p      -4p7d
 598    4y 2E2438         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
 599    4z 1D2438      -133.3     0.    -190.4 FIXEDHF     0.700  0       0.0  0  4s7p      -4p8d
 600    4z 2E2438         9.4     0.      13.4 FIXEDHF     0.700  0       0.0  0
 601    56 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s9p
 602    56 1E2424       141.0     0.     201.4 FIXEDHF     0.700  0       0.0  0
 603    57 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s10p
 604    57 1E2424       114.6     0.     163.7 FIXEDHF     0.700  0       0.0  0
 605    58 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s11p
 606    58 1E2424        95.6     0.     136.6 FIXEDHF     0.700  0       0.0  0
 607    59 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s12p
 608    59 1E2424        81.4     0.     116.3 FIXEDHF     0.700  0       0.0  0
 609    5A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s13p
 610    5A 1E2424        70.4     0.     100.6 FIXEDHF     0.700  0       0.0  0
 611    5B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4s14p
 612    5B 1E2424        61.7     0.      88.1 FIXEDHF     0.700  0       0.0  0
 613    5C 2D2413      -502.4     0.    -717.7 FIXEDHF     0.700  0       0.0  0  4s8p      -3d4p
 614    5C 1E2413      -790.6     0.   -1129.5 FIXEDHF     0.700  0       0.0  0
 615    5D 2D2414      -406.9     0.    -581.3 FIXEDHF     0.700  0       0.0  0  4s8p      -3d5p
 616    5D 1E2414      -371.7     0.    -531.0 FIXEDHF     0.700  0       0.0  0
 617    5E 2D2414      -305.3     0.    -436.1 FIXEDHF     0.700  0       0.0  0  4s8p      -3d6p
 618    5E 1E2414      -229.0     0.    -327.2 FIXEDHF     0.700  0       0.0  0
 619    5F 2D2414      -235.8     0.    -336.9 FIXEDHF     0.700  0       0.0  0  4s8p      -3d7p
 620    5F 1E2414      -159.9     0.    -228.5 FIXEDHF     0.700  0       0.0  0
 621    5G 2D2414      -190.3     0.    -271.8 FIXEDHF     0.700  0       0.0  0  4s8p      -3d8p
 622    5G 1E2414      -120.0     0.    -171.5 FIXEDHF     0.700  0       0.0  0
 623    5H 2D2414      -149.2     0.    -213.2 FIXEDHF     0.700  0       0.0  0  4s8p      -3d9p
 624    5H 1E2414       -94.4     0.    -134.9 FIXEDHF     0.700  0       0.0  0
 625    5I 2D2414      -121.5     0.    -173.6 FIXEDHF     0.700  0       0.0  0  4s8p      -3d10p
 626    5I 1E2414       -76.9     0.    -109.8 FIXEDHF     0.700  0       0.0  0
 627    5J 2D2414      -101.5     0.    -145.0 FIXEDHF     0.700  0       0.0  0  4s8p      -3d11p
 628    5J 1E2414       -64.1     0.     -91.6 FIXEDHF     0.700  0       0.0  0
 629    5K 2D2414       -86.4     0.    -123.5 FIXEDHF     0.700  0       0.0  0  4s8p      -3d12p
 630    5K 1E2414       -54.5     0.     -77.9 FIXEDHF     0.700  0       0.0  0
 631    5L 2D2414       -74.8     0.    -106.9 FIXEDHF     0.700  0       0.0  0  4s8p      -3d13p
 632    5L 1E2414       -47.2     0.     -67.4 FIXEDHF     0.700  0       0.0  0
 633    5M 2D2414       -65.6     0.     -93.7 FIXEDHF     0.700  0       0.0  0  4s8p      -3d14p
 634    5M 1E2414       -41.3     0.     -59.0 FIXEDHF     0.700  0       0.0  0
 635    5Y 2D2415        39.1     0.      55.8 FIXEDHF     0.700  0       0.0  0  4s8p      -3d4f
 636    5Y 3E2415       -31.6     0.     -45.1 FIXEDHF     0.700  0       0.0  0
 637    5Z 2D2415        37.2     0.      53.1 FIXEDHF     0.700  0       0.0  0  4s8p      -3d5f
 638    5Z 3E2415       -29.5     0.     -42.2 FIXEDHF     0.700  0       0.0  0
 639    5a 2D2415        32.8     0.      46.8 FIXEDHF     0.700  0       0.0  0  4s8p      -3d6f
 640    5a 3E2415       -25.5     0.     -36.4 FIXEDHF     0.700  0       0.0  0
 641    5b 2D2415        35.2     0.      50.3 FIXEDHF     0.700  0       0.0  0  4s8p      -3d7f
 642    5b 3E2415       -21.8     0.     -31.1 FIXEDHF     0.700  0       0.0  0
 643    5c 2D2415        30.5     0.      43.6 FIXEDHF     0.700  0       0.0  0  4s8p      -3d8f
 644    5c 3E2415       -18.8     0.     -26.8 FIXEDHF     0.700  0       0.0  0
 645    5d 2D2415        26.0     0.      37.1 FIXEDHF     0.700  0       0.0  0  4s8p      -3d9f
 646    5d 3E2415       -16.3     0.     -23.3 FIXEDHF     0.700  0       0.0  0
 647    5e 2D2415        22.3     0.      31.8 FIXEDHF     0.700  0       0.0  0  4s8p      -3d10f
 648    5e 3E2415       -14.3     0.     -20.4 FIXEDHF     0.700  0       0.0  0
 649    5f 2D2415        19.3     0.      27.5 FIXEDHF     0.700  0       0.0  0  4s8p      -3d11f
 650    5f 3E2415       -12.7     0.     -18.1 FIXEDHF     0.700  0       0.0  0
 651    5g 2D2415        16.8     0.      24.0 FIXEDHF     0.700  0       0.0  0  4s8p      -3d12f
 652    5g 3E2415       -11.3     0.     -16.1 FIXEDHF     0.700  0       0.0  0
 653    5h 2D2415        14.8     0.      21.2 FIXEDHF     0.700  0       0.0  0  4s8p      -3d13f
 654    5h 3E2415       -10.1     0.     -14.5 FIXEDHF     0.700  0       0.0  0
 655    5i 2D2415        13.2     0.      18.8 FIXEDHF     0.700  0       0.0  0  4s8p      -3d14f
 656    5i 3E2415        -9.2     0.     -13.1 FIXEDHF     0.700  0       0.0  0
 657    5v 1D2438      -693.5     0.    -990.7 FIXEDHF     0.700  0       0.0  0  4s8p      -4p4d
 658    5v 2E2438      -109.2     0.    -156.0 FIXEDHF     0.700  0       0.0  0
 659    5w 1D2438      -535.7     0.    -765.3 FIXEDHF     0.700  0       0.0  0  4s8p      -4p5d
 660    5w 2E2438       -30.5     0.     -43.6 FIXEDHF     0.700  0       0.0  0
 661    5x 1D2438      -434.2     0.    -620.3 FIXEDHF     0.700  0       0.0  0  4s8p      -4p6d
 662    5x 2E2438        -7.1     0.     -10.1 FIXEDHF     0.700  0       0.0  0
 663    5y 1D2438      -428.5     0.    -612.2 FIXEDHF     0.700  0       0.0  0  4s8p      -4p7d
 664    5y 2E2438         1.1     0.       1.5 FIXEDHF     0.700  0       0.0  0
 665    5z 1D2438      -188.3     0.    -269.0 FIXEDHF     0.700  0       0.0  0  4s8p      -4p8d
 666    5z 2E2438         4.1     0.       5.8 FIXEDHF     0.700  0       0.0  0
 667    67 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4s10p
 668    67 1E2424        90.0     0.     128.6 FIXEDHF     0.700  0       0.0  0
 669    68 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4s11p
 670    68 1E2424        75.1     0.     107.3 FIXEDHF     0.700  0       0.0  0
 671    69 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4s12p
 672    69 1E2424        64.0     0.      91.4 FIXEDHF     0.700  0       0.0  0
 673    6A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4s13p
 674    6A 1E2424        55.3     0.      79.0 FIXEDHF     0.700  0       0.0  0
 675    6B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4s14p
 676    6B 1E2424        48.5     0.      69.3 FIXEDHF     0.700  0       0.0  0
 677    6C 2D2413      -385.6     0.    -550.8 FIXEDHF     0.700  0       0.0  0  4s9p      -3d4p
 678    6C 1E2413      -616.1     0.    -880.2 FIXEDHF     0.700  0       0.0  0
 679    6D 2D2414      -313.2     0.    -447.4 FIXEDHF     0.700  0       0.0  0  4s9p      -3d5p
 680    6D 1E2414      -291.2     0.    -416.0 FIXEDHF     0.700  0       0.0  0
 681    6E 2D2414      -234.7     0.    -335.3 FIXEDHF     0.700  0       0.0  0  4s9p      -3d6p
 682    6E 1E2414      -179.6     0.    -256.6 FIXEDHF     0.700  0       0.0  0
 683    6F 2D2414      -180.7     0.    -258.1 FIXEDHF     0.700  0       0.0  0  4s9p      -3d7p
 684    6F 1E2414      -125.5     0.    -179.3 FIXEDHF     0.700  0       0.0  0
 685    6G 2D2414      -143.8     0.    -205.4 FIXEDHF     0.700  0       0.0  0  4s9p      -3d8p
 686    6G 1E2414       -94.2     0.    -134.6 FIXEDHF     0.700  0       0.0  0
 687    6H 2D2414      -118.6     0.    -169.4 FIXEDHF     0.700  0       0.0  0  4s9p      -3d9p
 688    6H 1E2414       -74.1     0.    -105.9 FIXEDHF     0.700  0       0.0  0
 689    6I 2D2414       -96.5     0.    -137.8 FIXEDHF     0.700  0       0.0  0  4s9p      -3d10p
 690    6I 1E2414       -60.3     0.     -86.2 FIXEDHF     0.700  0       0.0  0
 691    6J 2D2414       -80.6     0.    -115.2 FIXEDHF     0.700  0       0.0  0  4s9p      -3d11p
 692    6J 1E2414       -50.3     0.     -71.9 FIXEDHF     0.700  0       0.0  0
 693    6K 2D2414       -68.7     0.     -98.1 FIXEDHF     0.700  0       0.0  0  4s9p      -3d12p
 694    6K 1E2414       -42.8     0.     -61.2 FIXEDHF     0.700  0       0.0  0
 695    6L 2D2414       -59.5     0.     -85.0 FIXEDHF     0.700  0       0.0  0  4s9p      -3d13p
 696    6L 1E2414       -37.0     0.     -52.9 FIXEDHF     0.700  0       0.0  0
 697    6M 2D2414       -52.1     0.     -74.5 FIXEDHF     0.700  0       0.0  0  4s9p      -3d14p
 698    6M 1E2414       -32.4     0.     -46.3 FIXEDHF     0.700  0       0.0  0
 699    6Y 2D2415        29.9     0.      42.7 FIXEDHF     0.700  0       0.0  0  4s9p      -3d4f
 700    6Y 3E2415       -24.4     0.     -34.8 FIXEDHF     0.700  0       0.0  0
 701    6Z 2D2415        28.2     0.      40.3 FIXEDHF     0.700  0       0.0  0  4s9p      -3d5f
 702    6Z 3E2415       -22.8     0.     -32.6 FIXEDHF     0.700  0       0.0  0
 703    6a 2D2415        24.6     0.      35.2 FIXEDHF     0.700  0       0.0  0  4s9p      -3d6f
 704    6a 3E2415       -19.7     0.     -28.2 FIXEDHF     0.700  0       0.0  0
 705    6b 2D2415        21.3     0.      30.5 FIXEDHF     0.700  0       0.0  0  4s9p      -3d7f
 706    6b 3E2415       -16.9     0.     -24.1 FIXEDHF     0.700  0       0.0  0
 707    6c 2D2415        21.5     0.      30.7 FIXEDHF     0.700  0       0.0  0  4s9p      -3d8f
 708    6c 3E2415       -14.5     0.     -20.7 FIXEDHF     0.700  0       0.0  0
 709    6d 2D2415        19.0     0.      27.2 FIXEDHF     0.700  0       0.0  0  4s9p      -3d9f
 710    6d 3E2415       -12.6     0.     -18.0 FIXEDHF     0.700  0       0.0  0
 711    6e 2D2415        16.7     0.      23.8 FIXEDHF     0.700  0       0.0  0  4s9p      -3d10f
 712    6e 3E2415       -11.1     0.     -15.8 FIXEDHF     0.700  0       0.0  0
 713    6f 2D2415        14.6     0.      20.8 FIXEDHF     0.700  0       0.0  0  4s9p      -3d11f
 714    6f 3E2415        -9.8     0.     -14.0 FIXEDHF     0.700  0       0.0  0
 715    6g 2D2415        12.8     0.      18.3 FIXEDHF     0.700  0       0.0  0  4s9p      -3d12f
 716    6g 3E2415        -8.8     0.     -12.5 FIXEDHF     0.700  0       0.0  0
 717    6h 2D2415        11.4     0.      16.3 FIXEDHF     0.700  0       0.0  0  4s9p      -3d13f
 718    6h 3E2415        -7.9     0.     -11.3 FIXEDHF     0.700  0       0.0  0
 719    6i 2D2415        10.2     0.      14.6 FIXEDHF     0.700  0       0.0  0  4s9p      -3d14f
 720    6i 3E2415        -7.1     0.     -10.2 FIXEDHF     0.700  0       0.0  0
 721    6v 1D2438      -537.0     0.    -767.2 FIXEDHF     0.700  0       0.0  0  4s9p      -4p4d
 722    6v 2E2438       -89.5     0.    -127.9 FIXEDHF     0.700  0       0.0  0
 723    6w 1D2438      -409.4     0.    -584.9 FIXEDHF     0.700  0       0.0  0  4s9p      -4p5d
 724    6w 2E2438       -27.0     0.     -38.6 FIXEDHF     0.700  0       0.0  0
 725    6x 1D2438      -321.3     0.    -459.0 FIXEDHF     0.700  0       0.0  0  4s9p      -4p6d
 726    6x 2E2438        -7.9     0.     -11.3 FIXEDHF     0.700  0       0.0  0
 727    6y 1D2438      -268.0     0.    -382.9 FIXEDHF     0.700  0       0.0  0  4s9p      -4p7d
 728    6y 2E2438        -1.0     0.      -1.4 FIXEDHF     0.700  0       0.0  0
 729    6z 1D2438      -266.4     0.    -380.6 FIXEDHF     0.700  0       0.0  0  4s9p      -4p8d
 730    6z 2E2438         1.8     0.       2.5 FIXEDHF     0.700  0       0.0  0
 731    78 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10p     -4s11p
 732    78 1E2424        61.1     0.      87.3 FIXEDHF     0.700  0       0.0  0
 733    79 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10p     -4s12p
 734    79 1E2424        52.0     0.      74.3 FIXEDHF     0.700  0       0.0  0
 735    7A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10p     -4s13p
 736    7A 1E2424        45.0     0.      64.3 FIXEDHF     0.700  0       0.0  0
 737    7B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10p     -4s14p
 738    7B 1E2424        39.4     0.      56.3 FIXEDHF     0.700  0       0.0  0
 739    7C 2D2413      -308.5     0.    -440.7 FIXEDHF     0.700  0       0.0  0  4s10p     -3d4p
 740    7C 1E2413      -498.3     0.    -711.9 FIXEDHF     0.700  0       0.0  0
 741    7D 2D2414      -251.3     0.    -359.0 FIXEDHF     0.700  0       0.0  0  4s10p     -3d5p
 742    7D 1E2414      -236.3     0.    -337.6 FIXEDHF     0.700  0       0.0  0
 743    7E 2D2414      -188.2     0.    -268.9 FIXEDHF     0.700  0       0.0  0  4s10p     -3d6p
 744    7E 1E2414      -145.9     0.    -208.5 FIXEDHF     0.700  0       0.0  0
 745    7F 2D2414      -144.8     0.    -206.8 FIXEDHF     0.700  0       0.0  0  4s10p     -3d7p
 746    7F 1E2414      -102.0     0.    -145.7 FIXEDHF     0.700  0       0.0  0
 747    7G 2D2414      -114.9     0.    -164.2 FIXEDHF     0.700  0       0.0  0  4s10p     -3d8p
 748    7G 1E2414       -76.6     0.    -109.4 FIXEDHF     0.700  0       0.0  0
 749    7H 2D2414       -93.9     0.    -134.2 FIXEDHF     0.700  0       0.0  0  4s10p     -3d9p
 750    7H 1E2414       -60.3     0.     -86.1 FIXEDHF     0.700  0       0.0  0
 751    7I 2D2414       -79.0     0.    -112.8 FIXEDHF     0.700  0       0.0  0  4s10p     -3d10p
 752    7I 1E2414       -49.1     0.     -70.1 FIXEDHF     0.700  0       0.0  0
 753    7J 2D2414       -65.9     0.     -94.2 FIXEDHF     0.700  0       0.0  0  4s10p     -3d11p
 754    7J 1E2414       -40.9     0.     -58.5 FIXEDHF     0.700  0       0.0  0
 755    7K 2D2414       -56.2     0.     -80.3 FIXEDHF     0.700  0       0.0  0  4s10p     -3d12p
 756    7K 1E2414       -34.9     0.     -49.8 FIXEDHF     0.700  0       0.0  0
 757    7L 2D2414       -48.7     0.     -69.6 FIXEDHF     0.700  0       0.0  0  4s10p     -3d13p
 758    7L 1E2414       -30.1     0.     -43.0 FIXEDHF     0.700  0       0.0  0
 759    7M 2D2414       -42.7     0.     -61.0 FIXEDHF     0.700  0       0.0  0  4s10p     -3d14p
 760    7M 1E2414       -26.4     0.     -37.7 FIXEDHF     0.700  0       0.0  0
 761    7Y 2D2415        23.9     0.      34.2 FIXEDHF     0.700  0       0.0  0  4s10p     -3d4f
 762    7Y 3E2415       -19.6     0.     -28.0 FIXEDHF     0.700  0       0.0  0
 763    7Z 2D2415        22.5     0.      32.1 FIXEDHF     0.700  0       0.0  0  4s10p     -3d5f
 764    7Z 3E2415       -18.4     0.     -26.3 FIXEDHF     0.700  0       0.0  0
 765    7a 2D2415        19.5     0.      27.9 FIXEDHF     0.700  0       0.0  0  4s10p     -3d6f
 766    7a 3E2415       -15.9     0.     -22.7 FIXEDHF     0.700  0       0.0  0
 767    7b 2D2415        16.9     0.      24.1 FIXEDHF     0.700  0       0.0  0  4s10p     -3d7f
 768    7b 3E2415       -13.6     0.     -19.4 FIXEDHF     0.700  0       0.0  0
 769    7c 2D2415        14.6     0.      20.9 FIXEDHF     0.700  0       0.0  0  4s10p     -3d8f
 770    7c 3E2415       -11.7     0.     -16.7 FIXEDHF     0.700  0       0.0  0
 771    7d 2D2415        14.1     0.      20.2 FIXEDHF     0.700  0       0.0  0  4s10p     -3d9f
 772    7d 3E2415       -10.1     0.     -14.5 FIXEDHF     0.700  0       0.0  0
 773    7e 2D2415        12.7     0.      18.1 FIXEDHF     0.700  0       0.0  0  4s10p     -3d10f
 774    7e 3E2415        -8.9     0.     -12.7 FIXEDHF     0.700  0       0.0  0
 775    7f 2D2415        11.3     0.      16.1 FIXEDHF     0.700  0       0.0  0  4s10p     -3d11f
 776    7f 3E2415        -7.9     0.     -11.3 FIXEDHF     0.700  0       0.0  0
 777    7g 2D2415        10.0     0.      14.3 FIXEDHF     0.700  0       0.0  0  4s10p     -3d12f
 778    7g 3E2415        -7.1     0.     -10.1 FIXEDHF     0.700  0       0.0  0
 779    7h 2D2415         9.0     0.      12.8 FIXEDHF     0.700  0       0.0  0  4s10p     -3d13f
 780    7h 3E2415        -6.4     0.      -9.1 FIXEDHF     0.700  0       0.0  0
 781    7i 2D2415         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0  4s10p     -3d14f
 782    7i 3E2415        -5.7     0.      -8.2 FIXEDHF     0.700  0       0.0  0
 783    7v 1D2438      -433.1     0.    -618.7 FIXEDHF     0.700  0       0.0  0  4s10p     -4p4d
 784    7v 2E2438       -74.8     0.    -106.9 FIXEDHF     0.700  0       0.0  0
 785    7w 1D2438      -328.2     0.    -468.9 FIXEDHF     0.700  0       0.0  0  4s10p     -4p5d
 786    7w 2E2438       -23.7     0.     -33.8 FIXEDHF     0.700  0       0.0  0
 787    7x 1D2438      -254.3     0.    -363.3 FIXEDHF     0.700  0       0.0  0  4s10p     -4p6d
 788    7x 2E2438        -7.7     0.     -11.0 FIXEDHF     0.700  0       0.0  0
 789    7y 1D2438      -206.0     0.    -294.3 FIXEDHF     0.700  0       0.0  0  4s10p     -4p7d
 790    7y 2E2438        -1.8     0.      -2.6 FIXEDHF     0.700  0       0.0  0
 791    7z 1D2438      -176.5     0.    -252.2 FIXEDHF     0.700  0       0.0  0  4s10p     -4p8d
 792    7z 2E2438         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
 793    89 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11p     -4s12p
 794    89 1E2424        43.4     0.      62.0 FIXEDHF     0.700  0       0.0  0
 795    8A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11p     -4s13p
 796    8A 1E2424        37.6     0.      53.7 FIXEDHF     0.700  0       0.0  0
 797    8B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11p     -4s14p
 798    8B 1E2424        32.9     0.      47.0 FIXEDHF     0.700  0       0.0  0
 799    8C 2D2413      -254.3     0.    -363.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d4p
 800    8C 1E2413      -414.2     0.    -591.7 FIXEDHF     0.700  0       0.0  0
 801    8D 2D2414      -207.7     0.    -296.7 FIXEDHF     0.700  0       0.0  0  4s11p     -3d5p
 802    8D 1E2414      -197.0     0.    -281.4 FIXEDHF     0.700  0       0.0  0
 803    8E 2D2414      -155.6     0.    -222.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d6p
 804    8E 1E2414      -121.7     0.    -173.8 FIXEDHF     0.700  0       0.0  0
 805    8F 2D2414      -119.6     0.    -170.8 FIXEDHF     0.700  0       0.0  0  4s11p     -3d7p
 806    8F 1E2414       -85.1     0.    -121.6 FIXEDHF     0.700  0       0.0  0
 807    8G 2D2414       -94.8     0.    -135.5 FIXEDHF     0.700  0       0.0  0  4s11p     -3d8p
 808    8G 1E2414       -63.9     0.     -91.3 FIXEDHF     0.700  0       0.0  0
 809    8H 2D2414       -77.4     0.    -110.6 FIXEDHF     0.700  0       0.0  0  4s11p     -3d9p
 810    8H 1E2414       -50.3     0.     -71.9 FIXEDHF     0.700  0       0.0  0
 811    8I 2D2414       -64.7     0.     -92.4 FIXEDHF     0.700  0       0.0  0  4s11p     -3d10p
 812    8I 1E2414       -40.9     0.     -58.5 FIXEDHF     0.700  0       0.0  0
 813    8J 2D2414       -55.2     0.     -78.9 FIXEDHF     0.700  0       0.0  0  4s11p     -3d11p
 814    8J 1E2414       -34.2     0.     -48.8 FIXEDHF     0.700  0       0.0  0
 815    8K 2D2414       -47.1     0.     -67.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d12p
 816    8K 1E2414       -29.0     0.     -41.5 FIXEDHF     0.700  0       0.0  0
 817    8L 2D2414       -40.8     0.     -58.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d13p
 818    8L 1E2414       -25.1     0.     -35.9 FIXEDHF     0.700  0       0.0  0
 819    8M 2D2414       -35.8     0.     -51.1 FIXEDHF     0.700  0       0.0  0  4s11p     -3d14p
 820    8M 1E2414       -22.0     0.     -31.4 FIXEDHF     0.700  0       0.0  0
 821    8Y 2D2415        19.8     0.      28.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d4f
 822    8Y 3E2415       -16.2     0.     -23.1 FIXEDHF     0.700  0       0.0  0
 823    8Z 2D2415        18.5     0.      26.4 FIXEDHF     0.700  0       0.0  0  4s11p     -3d5f
 824    8Z 3E2415       -15.2     0.     -21.7 FIXEDHF     0.700  0       0.0  0
 825    8a 2D2415        16.0     0.      22.9 FIXEDHF     0.700  0       0.0  0  4s11p     -3d6f
 826    8a 3E2415       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0
 827    8b 2D2415        13.7     0.      19.6 FIXEDHF     0.700  0       0.0  0  4s11p     -3d7f
 828    8b 3E2415       -11.3     0.     -16.1 FIXEDHF     0.700  0       0.0  0
 829    8c 2D2415        11.9     0.      17.0 FIXEDHF     0.700  0       0.0  0  4s11p     -3d8f
 830    8c 3E2415        -9.7     0.     -13.8 FIXEDHF     0.700  0       0.0  0
 831    8d 2D2415        10.4     0.      14.8 FIXEDHF     0.700  0       0.0  0  4s11p     -3d9f
 832    8d 3E2415        -8.4     0.     -12.0 FIXEDHF     0.700  0       0.0  0
 833    8e 2D2415         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0  4s11p     -3d10f
 834    8e 3E2415        -7.3     0.     -10.5 FIXEDHF     0.700  0       0.0  0
 835    8f 2D2415         8.9     0.      12.7 FIXEDHF     0.700  0       0.0  0  4s11p     -3d11f
 836    8f 3E2415        -6.5     0.      -9.3 FIXEDHF     0.700  0       0.0  0
 837    8g 2D2415         8.0     0.      11.4 FIXEDHF     0.700  0       0.0  0  4s11p     -3d12f
 838    8g 3E2415        -5.8     0.      -8.3 FIXEDHF     0.700  0       0.0  0
 839    8h 2D2415         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d13f
 840    8h 3E2415        -5.3     0.      -7.5 FIXEDHF     0.700  0       0.0  0
 841    8i 2D2415         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0  4s11p     -3d14f
 842    8i 3E2415        -4.8     0.      -6.8 FIXEDHF     0.700  0       0.0  0
 843    8v 1D2438      -359.4     0.    -513.5 FIXEDHF     0.700  0       0.0  0  4s11p     -4p4d
 844    8v 2E2438       -63.7     0.     -91.0 FIXEDHF     0.700  0       0.0  0
 845    8w 1D2438      -271.5     0.    -387.9 FIXEDHF     0.700  0       0.0  0  4s11p     -4p5d
 846    8w 2E2438       -20.8     0.     -29.7 FIXEDHF     0.700  0       0.0  0
 847    8x 1D2438      -209.1     0.    -298.7 FIXEDHF     0.700  0       0.0  0  4s11p     -4p6d
 848    8x 2E2438        -7.2     0.     -10.3 FIXEDHF     0.700  0       0.0  0
 849    8y 1D2438      -167.4     0.    -239.2 FIXEDHF     0.700  0       0.0  0  4s11p     -4p7d
 850    8y 2E2438        -2.1     0.      -3.0 FIXEDHF     0.700  0       0.0  0
 851    8z 1D2438      -139.6     0.    -199.5 FIXEDHF     0.700  0       0.0  0  4s11p     -4p8d
 852    8z 2E2438         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
 853    9A 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12p     -4s13p
 854    9A 1E2424        32.0     0.      45.7 FIXEDHF     0.700  0       0.0  0
 855    9B 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12p     -4s14p
 856    9B 1E2424        28.0     0.      40.0 FIXEDHF     0.700  0       0.0  0
 857    9C 2D2413      -214.5     0.    -306.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d4p
 858    9C 1E2413      -351.5     0.    -502.1 FIXEDHF     0.700  0       0.0  0
 859    9D 2D2414      -175.5     0.    -250.7 FIXEDHF     0.700  0       0.0  0  4s12p     -3d5p
 860    9D 1E2414      -167.5     0.    -239.3 FIXEDHF     0.700  0       0.0  0
 861    9E 2D2414      -131.5     0.    -187.9 FIXEDHF     0.700  0       0.0  0  4s12p     -3d6p
 862    9E 1E2414      -103.5     0.    -147.9 FIXEDHF     0.700  0       0.0  0
 863    9F 2D2414      -101.1     0.    -144.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d7p
 864    9F 1E2414       -72.4     0.    -103.4 FIXEDHF     0.700  0       0.0  0
 865    9G 2D2414       -80.1     0.    -114.5 FIXEDHF     0.700  0       0.0  0  4s12p     -3d8p
 866    9G 1E2414       -54.4     0.     -77.7 FIXEDHF     0.700  0       0.0  0
 867    9H 2D2414       -65.4     0.     -93.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d9p
 868    9H 1E2414       -42.8     0.     -61.2 FIXEDHF     0.700  0       0.0  0
 869    9I 2D2414       -54.5     0.     -77.9 FIXEDHF     0.700  0       0.0  0  4s12p     -3d10p
 870    9I 1E2414       -34.9     0.     -49.8 FIXEDHF     0.700  0       0.0  0
 871    9J 2D2414       -46.4     0.     -66.3 FIXEDHF     0.700  0       0.0  0  4s12p     -3d11p
 872    9J 1E2414       -29.0     0.     -41.5 FIXEDHF     0.700  0       0.0  0
 873    9K 2D2414       -40.2     0.     -57.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d12p
 874    9K 1E2414       -24.7     0.     -35.3 FIXEDHF     0.700  0       0.0  0
 875    9L 2D2414       -34.8     0.     -49.7 FIXEDHF     0.700  0       0.0  0  4s12p     -3d13p
 876    9L 1E2414       -21.4     0.     -30.6 FIXEDHF     0.700  0       0.0  0
 877    9M 2D2414       -30.5     0.     -43.6 FIXEDHF     0.700  0       0.0  0  4s12p     -3d14p
 878    9M 1E2414       -18.8     0.     -26.8 FIXEDHF     0.700  0       0.0  0
 879    9Y 2D2415        16.7     0.      23.9 FIXEDHF     0.700  0       0.0  0  4s12p     -3d4f
 880    9Y 3E2415       -13.7     0.     -19.6 FIXEDHF     0.700  0       0.0  0
 881    9Z 2D2415        15.6     0.      22.3 FIXEDHF     0.700  0       0.0  0  4s12p     -3d5f
 882    9Z 3E2415       -12.9     0.     -18.4 FIXEDHF     0.700  0       0.0  0
 883    9a 2D2415        13.4     0.      19.2 FIXEDHF     0.700  0       0.0  0  4s12p     -3d6f
 884    9a 3E2415       -11.1     0.     -15.9 FIXEDHF     0.700  0       0.0  0
 885    9b 2D2415        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0  4s12p     -3d7f
 886    9b 3E2415        -9.5     0.     -13.6 FIXEDHF     0.700  0       0.0  0
 887    9c 2D2415         9.9     0.      14.2 FIXEDHF     0.700  0       0.0  0  4s12p     -3d8f
 888    9c 3E2415        -8.2     0.     -11.7 FIXEDHF     0.700  0       0.0  0
 889    9d 2D2415         8.7     0.      12.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d9f
 890    9d 3E2415        -7.1     0.     -10.2 FIXEDHF     0.700  0       0.0  0
 891    9e 2D2415         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0  4s12p     -3d10f
 892    9e 3E2415        -6.2     0.      -8.9 FIXEDHF     0.700  0       0.0  0
 893    9f 2D2415         7.1     0.      10.2 FIXEDHF     0.700  0       0.0  0  4s12p     -3d11f
 894    9f 3E2415        -5.5     0.      -7.9 FIXEDHF     0.700  0       0.0  0
 895    9g 2D2415         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0  4s12p     -3d12f
 896    9g 3E2415        -5.0     0.      -7.1 FIXEDHF     0.700  0       0.0  0
 897    9h 2D2415         5.9     0.       8.4 FIXEDHF     0.700  0       0.0  0  4s12p     -3d13f
 898    9h 3E2415        -4.5     0.      -6.4 FIXEDHF     0.700  0       0.0  0
 899    9i 2D2415         5.3     0.       7.6 FIXEDHF     0.700  0       0.0  0  4s12p     -3d14f
 900    9i 3E2415        -4.1     0.      -5.8 FIXEDHF     0.700  0       0.0  0
 901    9v 1D2438      -304.8     0.    -435.5 FIXEDHF     0.700  0       0.0  0  4s12p     -4p4d
 902    9v 2E2438       -55.0     0.     -78.6 FIXEDHF     0.700  0       0.0  0
 903    9w 1D2438      -229.9     0.    -328.4 FIXEDHF     0.700  0       0.0  0  4s12p     -4p5d
 904    9w 2E2438       -18.3     0.     -26.2 FIXEDHF     0.700  0       0.0  0
 905    9x 1D2438      -176.4     0.    -252.0 FIXEDHF     0.700  0       0.0  0  4s12p     -4p6d
 906    9x 2E2438        -6.6     0.      -9.5 FIXEDHF     0.700  0       0.0  0
 907    9y 1D2438      -140.4     0.    -200.6 FIXEDHF     0.700  0       0.0  0  4s12p     -4p7d
 908    9y 2E2438        -2.2     0.      -3.2 FIXEDHF     0.700  0       0.0  0
 909    9z 1D2438      -115.8     0.    -165.5 FIXEDHF     0.700  0       0.0  0  4s12p     -4p8d
 910    9z 2E2438        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
 911    AB 0D2424         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s13p     -4s14p
 912    AB 1E2424        24.2     0.      34.6 FIXEDHF     0.700  0       0.0  0
 913    AC 2D2413      -184.2     0.    -263.1 FIXEDHF     0.700  0       0.0  0  4s13p     -3d4p
 914    AC 1E2413      -303.3     0.    -433.3 FIXEDHF     0.700  0       0.0  0
 915    AD 2D2414      -150.9     0.    -215.6 FIXEDHF     0.700  0       0.0  0  4s13p     -3d5p
 916    AD 1E2414      -144.8     0.    -206.8 FIXEDHF     0.700  0       0.0  0
 917    AE 2D2414      -113.1     0.    -161.6 FIXEDHF     0.700  0       0.0  0  4s13p     -3d6p
 918    AE 1E2414       -89.5     0.    -127.8 FIXEDHF     0.700  0       0.0  0
 919    AF 2D2414       -86.9     0.    -124.2 FIXEDHF     0.700  0       0.0  0  4s13p     -3d7p
 920    AF 1E2414       -62.6     0.     -89.4 FIXEDHF     0.700  0       0.0  0
 921    AG 2D2414       -68.9     0.     -98.5 FIXEDHF     0.700  0       0.0  0  4s13p     -3d8p
 922    AG 1E2414       -47.0     0.     -67.2 FIXEDHF     0.700  0       0.0  0
 923    AH 2D2414       -56.2     0.     -80.3 FIXEDHF     0.700  0       0.0  0  4s13p     -3d9p
 924    AH 1E2414       -37.0     0.     -52.9 FIXEDHF     0.700  0       0.0  0
 925    AI 2D2414       -46.9     0.     -67.0 FIXEDHF     0.700  0       0.0  0  4s13p     -3d10p
 926    AI 1E2414       -30.1     0.     -43.0 FIXEDHF     0.700  0       0.0  0
 927    AJ 2D2414       -39.8     0.     -56.9 FIXEDHF     0.700  0       0.0  0  4s13p     -3d11p
 928    AJ 1E2414       -25.1     0.     -35.9 FIXEDHF     0.700  0       0.0  0
 929    AK 2D2414       -34.4     0.     -49.2 FIXEDHF     0.700  0       0.0  0  4s13p     -3d12p
 930    AK 1E2414       -21.4     0.     -30.6 FIXEDHF     0.700  0       0.0  0
 931    AL 2D2414       -30.2     0.     -43.1 FIXEDHF     0.700  0       0.0  0  4s13p     -3d13p
 932    AL 1E2414       -18.5     0.     -26.4 FIXEDHF     0.700  0       0.0  0
 933    AM 2D2414       -26.5     0.     -37.8 FIXEDHF     0.700  0       0.0  0  4s13p     -3d14p
 934    AM 1E2414       -16.2     0.     -23.1 FIXEDHF     0.700  0       0.0  0
 935    AY 2D2415        14.4     0.      20.6 FIXEDHF     0.700  0       0.0  0  4s13p     -3d4f
 936    AY 3E2415       -11.8     0.     -16.8 FIXEDHF     0.700  0       0.0  0
 937    AZ 2D2415        13.4     0.      19.1 FIXEDHF     0.700  0       0.0  0  4s13p     -3d5f
 938    AZ 3E2415       -11.1     0.     -15.8 FIXEDHF     0.700  0       0.0  0
 939    Aa 2D2415        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0  4s13p     -3d6f
 940    Aa 3E2415        -9.6     0.     -13.7 FIXEDHF     0.700  0       0.0  0
 941    Ab 2D2415         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0  4s13p     -3d7f
 942    Ab 3E2415        -8.2     0.     -11.7 FIXEDHF     0.700  0       0.0  0
 943    Ac 2D2415         8.5     0.      12.1 FIXEDHF     0.700  0       0.0  0  4s13p     -3d8f
 944    Ac 3E2415        -7.1     0.     -10.1 FIXEDHF     0.700  0       0.0  0
 945    Ad 2D2415         7.4     0.      10.6 FIXEDHF     0.700  0       0.0  0  4s13p     -3d9f
 946    Ad 3E2415        -6.2     0.      -8.8 FIXEDHF     0.700  0       0.0  0
 947    Ae 2D2415         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0  4s13p     -3d10f
 948    Ae 3E2415        -5.4     0.      -7.7 FIXEDHF     0.700  0       0.0  0
 949    Af 2D2415         5.7     0.       8.2 FIXEDHF     0.700  0       0.0  0  4s13p     -3d11f
 950    Af 3E2415        -4.8     0.      -6.8 FIXEDHF     0.700  0       0.0  0
 951    Ag 2D2415         5.4     0.       7.7 FIXEDHF     0.700  0       0.0  0  4s13p     -3d12f
 952    Ag 3E2415        -4.3     0.      -6.1 FIXEDHF     0.700  0       0.0  0
 953    Ah 2D2415         4.9     0.       7.0 FIXEDHF     0.700  0       0.0  0  4s13p     -3d13f
 954    Ah 3E2415        -3.8     0.      -5.5 FIXEDHF     0.700  0       0.0  0
 955    Ai 2D2415         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0  4s13p     -3d14f
 956    Ai 3E2415        -3.5     0.      -5.0 FIXEDHF     0.700  0       0.0  0
 957    Av 1D2438      -262.9     0.    -375.6 FIXEDHF     0.700  0       0.0  0  4s13p     -4p4d
 958    Av 2E2438       -48.2     0.     -68.8 FIXEDHF     0.700  0       0.0  0
 959    Aw 1D2438      -198.1     0.    -283.0 FIXEDHF     0.700  0       0.0  0  4s13p     -4p5d
 960    Aw 2E2438       -16.3     0.     -23.3 FIXEDHF     0.700  0       0.0  0
 961    Ax 1D2438      -151.7     0.    -216.7 FIXEDHF     0.700  0       0.0  0  4s13p     -4p6d
 962    Ax 2E2438        -6.1     0.      -8.7 FIXEDHF     0.700  0       0.0  0
 963    Ay 1D2438      -120.3     0.    -171.9 FIXEDHF     0.700  0       0.0  0  4s13p     -4p7d
 964    Ay 2E2438        -2.2     0.      -3.1 FIXEDHF     0.700  0       0.0  0
 965    Az 1D2438       -98.7     0.    -141.0 FIXEDHF     0.700  0       0.0  0  4s13p     -4p8d
 966    Az 2E2438        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
 967    BC 2D2413      -160.4     0.    -229.2 FIXEDHF     0.700  0       0.0  0  4s14p     -3d4p
 968    BC 1E2413      -265.3     0.    -379.0 FIXEDHF     0.700  0       0.0  0
 969    BD 2D2414      -131.7     0.    -188.1 FIXEDHF     0.700  0       0.0  0  4s14p     -3d5p
 970    BD 1E2414      -126.8     0.    -181.1 FIXEDHF     0.700  0       0.0  0
 971    BE 2D2414       -98.7     0.    -141.0 FIXEDHF     0.700  0       0.0  0  4s14p     -3d6p
 972    BE 1E2414       -78.4     0.    -112.0 FIXEDHF     0.700  0       0.0  0
 973    BF 2D2414       -75.9     0.    -108.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d7p
 974    BF 1E2414       -54.8     0.     -78.3 FIXEDHF     0.700  0       0.0  0
 975    BG 2D2414       -60.1     0.     -85.9 FIXEDHF     0.700  0       0.0  0  4s14p     -3d8p
 976    BG 1E2414       -41.2     0.     -58.9 FIXEDHF     0.700  0       0.0  0
 977    BH 2D2414       -49.1     0.     -70.1 FIXEDHF     0.700  0       0.0  0  4s14p     -3d9p
 978    BH 1E2414       -32.4     0.     -46.3 FIXEDHF     0.700  0       0.0  0
 979    BI 2D2414       -40.9     0.     -58.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d10p
 980    BI 1E2414       -26.4     0.     -37.7 FIXEDHF     0.700  0       0.0  0
 981    BJ 2D2414       -34.7     0.     -49.6 FIXEDHF     0.700  0       0.0  0  4s14p     -3d11p
 982    BJ 1E2414       -22.0     0.     -31.5 FIXEDHF     0.700  0       0.0  0
 983    BK 2D2414       -30.0     0.     -42.8 FIXEDHF     0.700  0       0.0  0  4s14p     -3d12p
 984    BK 1E2414       -18.8     0.     -26.8 FIXEDHF     0.700  0       0.0  0
 985    BL 2D2414       -26.2     0.     -37.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d13p
 986    BL 1E2414       -16.2     0.     -23.2 FIXEDHF     0.700  0       0.0  0
 987    BM 2D2414       -23.2     0.     -33.2 FIXEDHF     0.700  0       0.0  0  4s14p     -3d14p
 988    BM 1E2414       -14.2     0.     -20.3 FIXEDHF     0.700  0       0.0  0
 989    BY 2D2415        12.6     0.      18.0 FIXEDHF     0.700  0       0.0  0  4s14p     -3d4f
 990    BY 3E2415       -10.3     0.     -14.7 FIXEDHF     0.700  0       0.0  0
 991    BZ 2D2415        11.7     0.      16.7 FIXEDHF     0.700  0       0.0  0  4s14p     -3d5f
 992    BZ 3E2415        -9.7     0.     -13.8 FIXEDHF     0.700  0       0.0  0
 993    Ba 2D2415        10.1     0.      14.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d6f
 994    Ba 3E2415        -8.3     0.     -11.9 FIXEDHF     0.700  0       0.0  0
 995    Bb 2D2415         8.6     0.      12.3 FIXEDHF     0.700  0       0.0  0  4s14p     -3d7f
 996    Bb 3E2415        -7.1     0.     -10.2 FIXEDHF     0.700  0       0.0  0
 997    Bc 2D2415         7.4     0.      10.6 FIXEDHF     0.700  0       0.0  0  4s14p     -3d8f
 998    Bc 3E2415        -6.2     0.      -8.8 FIXEDHF     0.700  0       0.0  0
 999    Bd 2D2415         6.4     0.       9.2 FIXEDHF     0.700  0       0.0  0  4s14p     -3d9f
1000    Bd 3E2415        -5.4     0.      -7.7 FIXEDHF     0.700  0       0.0  0
1001    Be 2D2415         5.6     0.       8.0 FIXEDHF     0.700  0       0.0  0  4s14p     -3d10f
1002    Be 3E2415        -4.7     0.      -6.7 FIXEDHF     0.700  0       0.0  0
1003    Bf 2D2415         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0  4s14p     -3d11f
1004    Bf 3E2415        -4.1     0.      -5.9 FIXEDHF     0.700  0       0.0  0
1005    Bg 2D2415         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d12f
1006    Bg 3E2415        -3.7     0.      -5.3 FIXEDHF     0.700  0       0.0  0
1007    Bh 2D2415         4.1     0.       5.9 FIXEDHF     0.700  0       0.0  0  4s14p     -3d13f
1008    Bh 3E2415        -3.4     0.      -4.8 FIXEDHF     0.700  0       0.0  0
1009    Bi 2D2415         3.8     0.       5.4 FIXEDHF     0.700  0       0.0  0  4s14p     -3d14f
1010    Bi 3E2415        -3.0     0.      -4.3 FIXEDHF     0.700  0       0.0  0
1011    Bv 1D2438      -229.9     0.    -328.4 FIXEDHF     0.700  0       0.0  0  4s14p     -4p4d
1012    Bv 2E2438       -42.6     0.     -60.8 FIXEDHF     0.700  0       0.0  0
1013    Bw 1D2438      -173.1     0.    -247.3 FIXEDHF     0.700  0       0.0  0  4s14p     -4p5d
1014    Bw 2E2438       -14.6     0.     -20.9 FIXEDHF     0.700  0       0.0  0
1015    Bx 1D2438      -132.4     0.    -189.2 FIXEDHF     0.700  0       0.0  0  4s14p     -4p6d
1016    Bx 2E2438        -5.6     0.      -8.0 FIXEDHF     0.700  0       0.0  0
1017    By 1D2438      -104.7     0.    -149.6 FIXEDHF     0.700  0       0.0  0  4s14p     -4p7d
1018    By 2E2438        -2.1     0.      -3.0 FIXEDHF     0.700  0       0.0  0
1019    Bz 1D2438       -85.6     0.    -122.3 FIXEDHF     0.700  0       0.0  0  4s14p     -4p8d
1020    Bz 2E2438        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
1021    CD 0D1314       217.1     0.     310.2 FIXEDHF     0.700  0       0.0  0  3d4p      -3d5p
1022    CD 2D1314      2815.7     0.    4022.4 FIXEDHF     0.700  0       0.0  0
1023    CD 1E1314      2169.2     0.    3098.8 FIXEDHF     0.700  0       0.0  0
1024    CD 3E1314      1599.2     0.    2284.6 FIXEDHF     0.700  0       0.0  0
1025    CE 0D1314       130.8     0.     186.9 FIXEDHF     0.700  0       0.0  0  3d4p      -3d6p
1026    CE 2D1314      1646.2     0.    2351.7 FIXEDHF     0.700  0       0.0  0
1027    CE 1E1314      1291.2     0.    1844.6 FIXEDHF     0.700  0       0.0  0
1028    CE 3E1314       971.1     0.    1387.3 FIXEDHF     0.700  0       0.0  0
1029    CF 0D1314        90.6     0.     129.4 FIXEDHF     0.700  0       0.0  0  3d4p      -3d7p
1030    CF 2D1314      1123.3     0.    1604.7 FIXEDHF     0.700  0       0.0  0
1031    CF 1E1314       889.6     0.    1270.9 FIXEDHF     0.700  0       0.0  0
1032    CF 3E1314       674.9     0.     964.2 FIXEDHF     0.700  0       0.0  0
1033    CG 0D1314        67.7     0.      96.7 FIXEDHF     0.700  0       0.0  0  3d4p      -3d8p
1034    CG 2D1314       832.0     0.    1188.6 FIXEDHF     0.700  0       0.0  0
1035    CG 1E1314       663.0     0.     947.1 FIXEDHF     0.700  0       0.0  0
1036    CG 3E1314       505.4     0.     722.0 FIXEDHF     0.700  0       0.0  0
1037    CH 0D1314        53.1     0.      75.9 FIXEDHF     0.700  0       0.0  0  3d4p      -3d9p
1038    CH 2D1314       649.0     0.     927.2 FIXEDHF     0.700  0       0.0  0
1039    CH 1E1314       519.3     0.     741.9 FIXEDHF     0.700  0       0.0  0
1040    CH 3E1314       397.1     0.     567.3 FIXEDHF     0.700  0       0.0  0
1041    CI 0D1314        43.2     0.      61.7 FIXEDHF     0.700  0       0.0  0  3d4p      -3d10p
1042    CI 2D1314       524.9     0.     749.8 FIXEDHF     0.700  0       0.0  0
1043    CI 1E1314       421.3     0.     601.8 FIXEDHF     0.700  0       0.0  0
1044    CI 3E1314       322.8     0.     461.2 FIXEDHF     0.700  0       0.0  0
1045    CJ 0D1314        36.0     0.      51.4 FIXEDHF     0.700  0       0.0  0  3d4p      -3d11p
1046    CJ 2D1314       436.0     0.     622.8 FIXEDHF     0.700  0       0.0  0
1047    CJ 1E1314       350.7     0.     501.0 FIXEDHF     0.700  0       0.0  0
1048    CJ 3E1314       269.2     0.     384.6 FIXEDHF     0.700  0       0.0  0
1049    CK 0D1314        30.6     0.      43.7 FIXEDHF     0.700  0       0.0  0  3d4p      -3d12p
1050    CK 2D1314       369.6     0.     528.0 FIXEDHF     0.700  0       0.0  0
1051    CK 1E1314       297.8     0.     425.5 FIXEDHF     0.700  0       0.0  0
1052    CK 3E1314       228.9     0.     327.0 FIXEDHF     0.700  0       0.0  0
1053    CL 0D1314        26.4     0.      37.7 FIXEDHF     0.700  0       0.0  0  3d4p      -3d13p
1054    CL 2D1314       318.5     0.     455.0 FIXEDHF     0.700  0       0.0  0
1055    CL 1E1314       257.1     0.     367.3 FIXEDHF     0.700  0       0.0  0
1056    CL 3E1314       197.8     0.     282.6 FIXEDHF     0.700  0       0.0  0
1057    CM 0D1314        23.1     0.      33.0 FIXEDHF     0.700  0       0.0  0  3d4p      -3d14p
1058    CM 2D1314       278.3     0.     397.5 FIXEDHF     0.700  0       0.0  0
1059    CM 1E1314       224.8     0.     321.2 FIXEDHF     0.700  0       0.0  0
1060    CM 3E1314       173.1     0.     247.3 FIXEDHF     0.700  0       0.0  0
1061    CN 2D1325     -1172.7     0.   -1675.3 FIXEDHF     0.700  0       0.0  0  3d4p      -4s4f
1062    CN 1E1325      -918.4     0.   -1312.0 FIXEDHF     0.700  0       0.0  0
1063    CO 2D1325     -1029.3     0.   -1470.5 FIXEDHF     0.700  0       0.0  0  3d4p      -4s5f
1064    CO 1E1325      -841.5     0.   -1202.2 FIXEDHF     0.700  0       0.0  0
1065    CP 2D1325      -861.5     0.   -1230.7 FIXEDHF     0.700  0       0.0  0  3d4p      -4s6f
1066    CP 1E1325      -721.1     0.   -1030.1 FIXEDHF     0.700  0       0.0  0
1067    CQ 2D1325      -723.9     0.   -1034.1 FIXEDHF     0.700  0       0.0  0  3d4p      -4s7f
1068    CQ 1E1325      -614.9     0.    -878.4 FIXEDHF     0.700  0       0.0  0
1069    CR 2D1325      -615.9     0.    -879.8 FIXEDHF     0.700  0       0.0  0  3d4p      -4s8f
1070    CR 1E1325      -528.4     0.    -754.9 FIXEDHF     0.700  0       0.0  0
1071    CS 2D1325      -530.8     0.    -758.3 FIXEDHF     0.700  0       0.0  0  3d4p      -4s9f
1072    CS 1E1325      -458.8     0.    -655.5 FIXEDHF     0.700  0       0.0  0
1073    CT 2D1325      -463.1     0.    -661.6 FIXEDHF     0.700  0       0.0  0  3d4p      -4s10f
1074    CT 1E1325      -402.5     0.    -575.0 FIXEDHF     0.700  0       0.0  0
1075    CU 2D1325      -408.3     0.    -583.3 FIXEDHF     0.700  0       0.0  0  3d4p      -4s11f
1076    CU 1E1325      -356.4     0.    -509.2 FIXEDHF     0.700  0       0.0  0
1077    CV 2D1325      -363.4     0.    -519.1 FIXEDHF     0.700  0       0.0  0  3d4p      -4s12f
1078    CV 1E1325      -318.3     0.    -454.7 FIXEDHF     0.700  0       0.0  0
1079    CW 2D1325      -326.1     0.    -465.8 FIXEDHF     0.700  0       0.0  0  3d4p      -4s13f
1080    CW 1E1325      -286.4     0.    -409.2 FIXEDHF     0.700  0       0.0  0
1081    CX 2D1325      -294.6     0.    -420.9 FIXEDHF     0.700  0       0.0  0  3d4p      -4s14f
1082    CX 1E1325      -259.4     0.    -370.6 FIXEDHF     0.700  0       0.0  0
1083    CY 2D1315       839.4     0.    1199.2 FIXEDHF     0.700  0       0.0  0  3d4p      -3d4f
1084    CY 4D1315       324.2     0.     463.1 FIXEDHF     0.700  0       0.0  0
1085    CY 1E1315       481.4     0.     687.7 FIXEDHF     0.700  0       0.0  0
1086    CY 3E1315       270.8     0.     386.8 FIXEDHF     0.700  0       0.0  0
1087    CZ 2D1315       717.8     0.    1025.5 FIXEDHF     0.700  0       0.0  0  3d4p      -3d5f
1088    CZ 4D1315       287.5     0.     410.7 FIXEDHF     0.700  0       0.0  0
1089    CZ 1E1315       424.4     0.     606.3 FIXEDHF     0.700  0       0.0  0
1090    CZ 3E1315       243.1     0.     347.3 FIXEDHF     0.700  0       0.0  0
1091    Ca 2D1315       589.7     0.     842.4 FIXEDHF     0.700  0       0.0  0  3d4p      -3d6f
1092    Ca 4D1315       240.7     0.     343.9 FIXEDHF     0.700  0       0.0  0
1093    Ca 1E1315       354.3     0.     506.1 FIXEDHF     0.700  0       0.0  0
1094    Ca 3E1315       205.0     0.     292.8 FIXEDHF     0.700  0       0.0  0
1095    Cb 2D1315       488.8     0.     698.3 FIXEDHF     0.700  0       0.0  0  3d4p      -3d7f
1096    Cb 4D1315       201.9     0.     288.4 FIXEDHF     0.700  0       0.0  0
1097    Cb 1E1315       296.7     0.     423.8 FIXEDHF     0.700  0       0.0  0
1098    Cb 3E1315       172.6     0.     246.6 FIXEDHF     0.700  0       0.0  0
1099    Cc 2D1315       411.7     0.     588.2 FIXEDHF     0.700  0       0.0  0  3d4p      -3d8f
1100    Cc 4D1315       171.4     0.     244.8 FIXEDHF     0.700  0       0.0  0
1101    Cc 1E1315       251.5     0.     359.3 FIXEDHF     0.700  0       0.0  0
1102    Cc 3E1315       146.9     0.     209.9 FIXEDHF     0.700  0       0.0  0
1103    Cd 2D1315       352.2     0.     503.1 FIXEDHF     0.700  0       0.0  0  3d4p      -3d9f
1104    Cd 4D1315       147.3     0.     210.5 FIXEDHF     0.700  0       0.0  0
1105    Cd 1E1315       216.2     0.     308.8 FIXEDHF     0.700  0       0.0  0
1106    Cd 3E1315       126.6     0.     180.9 FIXEDHF     0.700  0       0.0  0
1107    Ce 2D1315       305.4     0.     436.3 FIXEDHF     0.700  0       0.0  0  3d4p      -3d10f
1108    Ce 4D1315       128.3     0.     183.3 FIXEDHF     0.700  0       0.0  0
1109    Ce 1E1315       188.2     0.     268.8 FIXEDHF     0.700  0       0.0  0
1110    Ce 3E1315       110.5     0.     157.8 FIXEDHF     0.700  0       0.0  0
1111    Cf 2D1315       268.0     0.     382.9 FIXEDHF     0.700  0       0.0  0  3d4p      -3d11f
1112    Cf 4D1315       113.0     0.     161.4 FIXEDHF     0.700  0       0.0  0
1113    Cf 1E1315       165.5     0.     236.5 FIXEDHF     0.700  0       0.0  0
1114    Cf 3E1315        97.4     0.     139.1 FIXEDHF     0.700  0       0.0  0
1115    Cg 2D1315       237.6     0.     339.5 FIXEDHF     0.700  0       0.0  0  3d4p      -3d12f
1116    Cg 4D1315       100.4     0.     143.5 FIXEDHF     0.700  0       0.0  0
1117    Cg 1E1315       147.1     0.     210.2 FIXEDHF     0.700  0       0.0  0
1118    Cg 3E1315        86.7     0.     123.8 FIXEDHF     0.700  0       0.0  0
1119    Ch 2D1315       212.5     0.     303.6 FIXEDHF     0.700  0       0.0  0  3d4p      -3d13f
1120    Ch 4D1315        90.0     0.     128.6 FIXEDHF     0.700  0       0.0  0
1121    Ch 1E1315       131.8     0.     188.3 FIXEDHF     0.700  0       0.0  0
1122    Ch 3E1315        77.7     0.     111.0 FIXEDHF     0.700  0       0.0  0
1123    Ci 2D1315       191.6     0.     273.7 FIXEDHF     0.700  0       0.0  0  3d4p      -3d14f
1124    Ci 4D1315        81.3     0.     116.1 FIXEDHF     0.700  0       0.0  0
1125    Ci 1E1315       119.0     0.     170.0 FIXEDHF     0.700  0       0.0  0
1126    Ci 3E1315        70.2     0.     100.3 FIXEDHF     0.700  0       0.0  0
1127    Cn 4D1316         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0  3d4p      -3d6h
1128    Cn 3E1316         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0
1129    Co 4D1316         4.4     0.       6.3 FIXEDHF     0.700  0       0.0  0  3d4p      -3d7h
1130    Co 3E1316         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
1131    Cp 4D1316         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0  3d4p      -3d8h
1132    Cp 3E1316         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
1133    Cq 4D1316         4.1     0.       5.8 FIXEDHF     0.700  0       0.0  0  3d4p      -3d9h
1134    Cq 3E1316         2.8     0.       4.0 FIXEDHF     0.700  0       0.0  0
1135    Cv 1D1338     -2946.7     0.   -4209.6 FIXEDHF     0.700  0       0.0  0  3d4p      -4p4d
1136    Cv 3D1338     -1015.6     0.   -1450.9 FIXEDHF     0.700  0       0.0  0
1137    Cv 0E1338      -171.4     0.    -244.9 FIXEDHF     0.700  0       0.0  0
1138    Cv 2E1338       258.4     0.     369.2 FIXEDHF     0.700  0       0.0  0
1139    Cw 1D1338     -2018.7     0.   -2883.8 FIXEDHF     0.700  0       0.0  0  3d4p      -4p5d
1140    Cw 3D1338      -859.3     0.   -1227.5 FIXEDHF     0.700  0       0.0  0
1141    Cw 0E1338      -133.4     0.    -190.6 FIXEDHF     0.700  0       0.0  0
1142    Cw 2E1338       -93.2     0.    -133.1 FIXEDHF     0.700  0       0.0  0
1143    Cx 1D1338     -1451.8     0.   -2074.0 FIXEDHF     0.700  0       0.0  0  3d4p      -4p6d
1144    Cx 3D1338      -668.1     0.    -954.4 FIXEDHF     0.700  0       0.0  0
1145    Cx 0E1338      -101.3     0.    -144.7 FIXEDHF     0.700  0       0.0  0
1146    Cx 2E1338      -147.6     0.    -210.9 FIXEDHF     0.700  0       0.0  0
1147    Cy 1D1338     -1097.7     0.   -1568.2 FIXEDHF     0.700  0       0.0  0  3d4p      -4p7d
1148    Cy 3D1338      -526.1     0.    -751.6 FIXEDHF     0.700  0       0.0  0
1149    Cy 0E1338       -78.9     0.    -112.7 FIXEDHF     0.700  0       0.0  0
1150    Cy 2E1338      -144.5     0.    -206.4 FIXEDHF     0.700  0       0.0  0
1151    Cz 1D1338      -863.9     0.   -1234.2 FIXEDHF     0.700  0       0.0  0  3d4p      -4p8d
1152    Cz 3D1338      -424.4     0.    -606.3 FIXEDHF     0.700  0       0.0  0
1153    Cz 0E1338       -63.3     0.     -90.4 FIXEDHF     0.700  0       0.0  0
1154    Cz 2E1338      -129.6     0.    -185.2 FIXEDHF     0.700  0       0.0  0
1155    DE 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d6p
1156    DE 2D1414      1032.8     0.    1475.4 FIXEDHF     0.700  0       0.0  0
1157    DE 1E1414       587.6     0.     839.5 FIXEDHF     0.700  0       0.0  0
1158    DE 3E1414       463.4     0.     662.0 FIXEDHF     0.700  0       0.0  0
1159    DF 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d7p
1160    DF 2D1414       705.7     0.    1008.1 FIXEDHF     0.700  0       0.0  0
1161    DF 1E1414       410.6     0.     586.6 FIXEDHF     0.700  0       0.0  0
1162    DF 3E1414       326.3     0.     466.1 FIXEDHF     0.700  0       0.0  0
1163    DG 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d8p
1164    DG 2D1414       524.1     0.     748.7 FIXEDHF     0.700  0       0.0  0
1165    DG 1E1414       308.4     0.     440.6 FIXEDHF     0.700  0       0.0  0
1166    DG 3E1414       246.2     0.     351.7 FIXEDHF     0.700  0       0.0  0
1167    DH 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d9p
1168    DH 2D1414       409.8     0.     585.5 FIXEDHF     0.700  0       0.0  0
1169    DH 1E1414       242.8     0.     346.9 FIXEDHF     0.700  0       0.0  0
1170    DH 3E1414       194.4     0.     277.7 FIXEDHF     0.700  0       0.0  0
1171    DI 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d10p
1172    DI 2D1414       332.2     0.     474.6 FIXEDHF     0.700  0       0.0  0
1173    DI 1E1414       197.7     0.     282.4 FIXEDHF     0.700  0       0.0  0
1174    DI 3E1414       158.5     0.     226.5 FIXEDHF     0.700  0       0.0  0
1175    DJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d11p
1176    DJ 2D1414       276.5     0.     395.0 FIXEDHF     0.700  0       0.0  0
1177    DJ 1E1414       165.0     0.     235.7 FIXEDHF     0.700  0       0.0  0
1178    DJ 3E1414       132.5     0.     189.3 FIXEDHF     0.700  0       0.0  0
1179    DK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d12p
1180    DK 2D1414       234.8     0.     335.4 FIXEDHF     0.700  0       0.0  0
1181    DK 1E1414       140.4     0.     200.6 FIXEDHF     0.700  0       0.0  0
1182    DK 3E1414       112.9     0.     161.3 FIXEDHF     0.700  0       0.0  0
1183    DL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d13p
1184    DL 2D1414       202.6     0.     289.5 FIXEDHF     0.700  0       0.0  0
1185    DL 1E1414       121.4     0.     173.4 FIXEDHF     0.700  0       0.0  0
1186    DL 3E1414        97.7     0.     139.6 FIXEDHF     0.700  0       0.0  0
1187    DM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d14p
1188    DM 2D1414       177.2     0.     253.2 FIXEDHF     0.700  0       0.0  0
1189    DM 1E1414       106.3     0.     151.9 FIXEDHF     0.700  0       0.0  0
1190    DM 3E1414        85.6     0.     122.3 FIXEDHF     0.700  0       0.0  0
1191    DN 2D1425       223.0     0.     318.6 FIXEDHF     0.700  0       0.0  0  3d5p      -4s4f
1192    DN 1E1425      -296.8     0.    -424.0 FIXEDHF     0.700  0       0.0  0
1193    DO 2D1425        23.0     0.      32.8 FIXEDHF     0.700  0       0.0  0  3d5p      -4s5f
1194    DO 1E1425      -279.9     0.    -399.9 FIXEDHF     0.700  0       0.0  0
1195    DP 2D1425       -39.5     0.     -56.4 FIXEDHF     0.700  0       0.0  0  3d5p      -4s6f
1196    DP 1E1425      -243.7     0.    -348.1 FIXEDHF     0.700  0       0.0  0
1197    DQ 2D1425       -59.8     0.     -85.4 FIXEDHF     0.700  0       0.0  0  3d5p      -4s7f
1198    DQ 1E1425      -209.9     0.    -299.8 FIXEDHF     0.700  0       0.0  0
1199    DR 2D1425       -65.0     0.     -92.8 FIXEDHF     0.700  0       0.0  0  3d5p      -4s8f
1200    DR 1E1425      -181.6     0.    -259.4 FIXEDHF     0.700  0       0.0  0
1201    DS 2D1425       -64.3     0.     -91.8 FIXEDHF     0.700  0       0.0  0  3d5p      -4s9f
1202    DS 1E1425      -158.4     0.    -226.3 FIXEDHF     0.700  0       0.0  0
1203    DT 2D1425       -61.3     0.     -87.6 FIXEDHF     0.700  0       0.0  0  3d5p      -4s10f
1204    DT 1E1425      -139.4     0.    -199.2 FIXEDHF     0.700  0       0.0  0
1205    DU 2D1425       -57.5     0.     -82.2 FIXEDHF     0.700  0       0.0  0  3d5p      -4s11f
1206    DU 1E1425      -123.8     0.    -176.9 FIXEDHF     0.700  0       0.0  0
1207    DV 2D1425       -53.7     0.     -76.7 FIXEDHF     0.700  0       0.0  0  3d5p      -4s12f
1208    DV 1E1425      -110.9     0.    -158.4 FIXEDHF     0.700  0       0.0  0
1209    DW 2D1425       -49.9     0.     -71.3 FIXEDHF     0.700  0       0.0  0  3d5p      -4s13f
1210    DW 1E1425      -100.0     0.    -142.8 FIXEDHF     0.700  0       0.0  0
1211    DX 2D1425       -46.5     0.     -66.4 FIXEDHF     0.700  0       0.0  0  3d5p      -4s14f
1212    DX 1E1425       -90.6     0.    -129.5 FIXEDHF     0.700  0       0.0  0
1213    DY 2D1415      -160.4     0.    -229.2 FIXEDHF     0.700  0       0.0  0  3d5p      -3d4f
1214    DY 4D1415        49.5     0.      70.7 FIXEDHF     0.700  0       0.0  0
1215    DY 1E1415       155.2     0.     221.7 FIXEDHF     0.700  0       0.0  0
1216    DY 3E1415        90.1     0.     128.7 FIXEDHF     0.700  0       0.0  0
1217    DZ 2D1415       -21.0     0.     -30.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d5f
1218    DZ 4D1415        56.6     0.      80.9 FIXEDHF     0.700  0       0.0  0
1219    DZ 1E1415       140.2     0.     200.3 FIXEDHF     0.700  0       0.0  0
1220    DZ 3E1415        82.7     0.     118.2 FIXEDHF     0.700  0       0.0  0
1221    Da 2D1415        20.6     0.      29.5 FIXEDHF     0.700  0       0.0  0  3d5p      -3d6f
1222    Da 4D1415        52.4     0.      74.9 FIXEDHF     0.700  0       0.0  0
1223    Da 1E1415       118.6     0.     169.4 FIXEDHF     0.700  0       0.0  0
1224    Da 3E1415        70.6     0.     100.9 FIXEDHF     0.700  0       0.0  0
1225    Db 2D1415        33.7     0.      48.1 FIXEDHF     0.700  0       0.0  0  3d5p      -3d7f
1226    Db 4D1415        46.5     0.      66.4 FIXEDHF     0.700  0       0.0  0
1227    Db 1E1415       100.0     0.     142.9 FIXEDHF     0.700  0       0.0  0
1228    Db 3E1415        59.9     0.      85.6 FIXEDHF     0.700  0       0.0  0
1229    Dc 2D1415        36.9     0.      52.7 FIXEDHF     0.700  0       0.0  0  3d5p      -3d8f
1230    Dc 4D1415        40.8     0.      58.3 FIXEDHF     0.700  0       0.0  0
1231    Dc 1E1415        85.3     0.     121.9 FIXEDHF     0.700  0       0.0  0
1232    Dc 3E1415        51.3     0.      73.3 FIXEDHF     0.700  0       0.0  0
1233    Dd 2D1415        36.5     0.      52.1 FIXEDHF     0.700  0       0.0  0  3d5p      -3d9f
1234    Dd 4D1415        35.9     0.      51.3 FIXEDHF     0.700  0       0.0  0
1235    Dd 1E1415        73.6     0.     105.2 FIXEDHF     0.700  0       0.0  0
1236    Dd 3E1415        44.4     0.      63.4 FIXEDHF     0.700  0       0.0  0
1237    De 2D1415        34.6     0.      49.5 FIXEDHF     0.700  0       0.0  0  3d5p      -3d10f
1238    De 4D1415        31.8     0.      45.4 FIXEDHF     0.700  0       0.0  0
1239    De 1E1415        64.3     0.      91.8 FIXEDHF     0.700  0       0.0  0
1240    De 3E1415        38.8     0.      55.5 FIXEDHF     0.700  0       0.0  0
1241    Df 2D1415        32.4     0.      46.3 FIXEDHF     0.700  0       0.0  0  3d5p      -3d11f
1242    Df 4D1415        28.3     0.      40.5 FIXEDHF     0.700  0       0.0  0
1243    Df 1E1415        56.7     0.      81.0 FIXEDHF     0.700  0       0.0  0
1244    Df 3E1415        34.3     0.      49.0 FIXEDHF     0.700  0       0.0  0
1245    Dg 2D1415        30.2     0.      43.1 FIXEDHF     0.700  0       0.0  0  3d5p      -3d12f
1246    Dg 4D1415        25.4     0.      36.3 FIXEDHF     0.700  0       0.0  0
1247    Dg 1E1415        50.5     0.      72.1 FIXEDHF     0.700  0       0.0  0
1248    Dg 3E1415        30.6     0.      43.7 FIXEDHF     0.700  0       0.0  0
1249    Dh 2D1415        28.0     0.      40.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d13f
1250    Dh 4D1415        23.0     0.      32.8 FIXEDHF     0.700  0       0.0  0
1251    Dh 1E1415        45.3     0.      64.7 FIXEDHF     0.700  0       0.0  0
1252    Dh 3E1415        27.5     0.      39.3 FIXEDHF     0.700  0       0.0  0
1253    Di 2D1415        26.0     0.      37.1 FIXEDHF     0.700  0       0.0  0  3d5p      -3d14f
1254    Di 4D1415        20.9     0.      29.9 FIXEDHF     0.700  0       0.0  0
1255    Di 1E1415        40.9     0.      58.5 FIXEDHF     0.700  0       0.0  0
1256    Di 3E1415        24.9     0.      35.6 FIXEDHF     0.700  0       0.0  0
1257    Dn 4D1416        -2.7     0.      -3.8 FIXEDHF     0.700  0       0.0  0  3d5p      -3d6h
1258    Dn 3E1416         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
1259    Do 4D1416        -2.8     0.      -4.0 FIXEDHF     0.700  0       0.0  0  3d5p      -3d7h
1260    Do 3E1416         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0
1261    Dp 4D1416        -2.7     0.      -3.8 FIXEDHF     0.700  0       0.0  0  3d5p      -3d8h
1262    Dp 3E1416         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0
1263    Dq 4D1416        -2.4     0.      -3.4 FIXEDHF     0.700  0       0.0  0  3d5p      -3d9h
1264    Dq 3E1416         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0
1265    Dv 1D1438      1558.9     0.    2227.0 FIXEDHF     0.700  0       0.0  0  3d5p      -4p4d
1266    Dv 3D1438       317.7     0.     453.8 FIXEDHF     0.700  0       0.0  0
1267    Dv 0E1438      1924.5     0.    2749.3 FIXEDHF     0.700  0       0.0  0
1268    Dv 2E1438       488.9     0.     698.4 FIXEDHF     0.700  0       0.0  0
1269    Dw 1D1438      -295.1     0.    -421.6 FIXEDHF     0.700  0       0.0  0  3d5p      -4p5d
1270    Dw 3D1438       -23.8     0.     -34.0 FIXEDHF     0.700  0       0.0  0
1271    Dw 0E1438      1130.3     0.    1614.7 FIXEDHF     0.700  0       0.0  0
1272    Dw 2E1438       211.4     0.     302.0 FIXEDHF     0.700  0       0.0  0
1273    Dx 1D1438      -381.8     0.    -545.4 FIXEDHF     0.700  0       0.0  0  3d5p      -4p6d
1274    Dx 3D1438       -80.6     0.    -115.2 FIXEDHF     0.700  0       0.0  0
1275    Dx 0E1438       764.5     0.    1092.1 FIXEDHF     0.700  0       0.0  0
1276    Dx 2E1438       114.7     0.     163.8 FIXEDHF     0.700  0       0.0  0
1277    Dy 1D1438      -345.3     0.    -493.3 FIXEDHF     0.700  0       0.0  0  3d5p      -4p7d
1278    Dy 3D1438       -86.4     0.    -123.4 FIXEDHF     0.700  0       0.0  0
1279    Dy 0E1438       561.0     0.     801.5 FIXEDHF     0.700  0       0.0  0
1280    Dy 2E1438        71.4     0.     102.0 FIXEDHF     0.700  0       0.0  0
1281    Dz 1D1438      -297.2     0.    -424.6 FIXEDHF     0.700  0       0.0  0  3d5p      -4p8d
1282    Dz 3D1438       -80.4     0.    -114.8 FIXEDHF     0.700  0       0.0  0
1283    Dz 0E1438       434.5     0.     620.7 FIXEDHF     0.700  0       0.0  0
1284    Dz 2E1438        48.9     0.      69.8 FIXEDHF     0.700  0       0.0  0
1285    EF 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d7p
1286    EF 2D1414       486.6     0.     695.2 FIXEDHF     0.700  0       0.0  0
1287    EF 1E1414       254.9     0.     364.2 FIXEDHF     0.700  0       0.0  0
1288    EF 3E1414       205.9     0.     294.2 FIXEDHF     0.700  0       0.0  0
1289    EG 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d8p
1290    EG 2D1414       361.3     0.     516.1 FIXEDHF     0.700  0       0.0  0
1291    EG 1E1414       191.8     0.     274.0 FIXEDHF     0.700  0       0.0  0
1292    EG 3E1414       155.7     0.     222.4 FIXEDHF     0.700  0       0.0  0
1293    EH 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d9p
1294    EH 2D1414       282.7     0.     403.8 FIXEDHF     0.700  0       0.0  0
1295    EH 1E1414       151.2     0.     216.0 FIXEDHF     0.700  0       0.0  0
1296    EH 3E1414       123.1     0.     175.8 FIXEDHF     0.700  0       0.0  0
1297    EI 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d10p
1298    EI 2D1414       229.2     0.     327.5 FIXEDHF     0.700  0       0.0  0
1299    EI 1E1414       123.2     0.     176.0 FIXEDHF     0.700  0       0.0  0
1300    EI 3E1414       100.4     0.     143.5 FIXEDHF     0.700  0       0.0  0
1301    EJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d11p
1302    EJ 2D1414       190.9     0.     272.7 FIXEDHF     0.700  0       0.0  0
1303    EJ 1E1414       102.9     0.     147.0 FIXEDHF     0.700  0       0.0  0
1304    EJ 3E1414        84.0     0.     120.0 FIXEDHF     0.700  0       0.0  0
1305    EK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d12p
1306    EK 2D1414       162.3     0.     231.8 FIXEDHF     0.700  0       0.0  0
1307    EK 1E1414        87.6     0.     125.1 FIXEDHF     0.700  0       0.0  0
1308    EK 3E1414        71.6     0.     102.3 FIXEDHF     0.700  0       0.0  0
1309    EL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d13p
1310    EL 2D1414       140.1     0.     200.1 FIXEDHF     0.700  0       0.0  0
1311    EL 1E1414        75.7     0.     108.2 FIXEDHF     0.700  0       0.0  0
1312    EL 3E1414        62.0     0.      88.6 FIXEDHF     0.700  0       0.0  0
1313    EM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d14p
1314    EM 2D1414       122.6     0.     175.1 FIXEDHF     0.700  0       0.0  0
1315    EM 1E1414        66.4     0.      94.8 FIXEDHF     0.700  0       0.0  0
1316    EM 3E1414        54.4     0.      77.7 FIXEDHF     0.700  0       0.0  0
1317    EN 2D1425        35.8     0.      51.2 FIXEDHF     0.700  0       0.0  0  3d6p      -4s4f
1318    EN 1E1425      -169.6     0.    -242.3 FIXEDHF     0.700  0       0.0  0
1319    EO 2D1425        72.5     0.     103.6 FIXEDHF     0.700  0       0.0  0  3d6p      -4s5f
1320    EO 1E1425      -160.9     0.    -229.9 FIXEDHF     0.700  0       0.0  0
1321    EP 2D1425        34.1     0.      48.7 FIXEDHF     0.700  0       0.0  0  3d6p      -4s6f
1322    EP 1E1425      -140.5     0.    -200.7 FIXEDHF     0.700  0       0.0  0
1323    EQ 2D1425        13.4     0.      19.1 FIXEDHF     0.700  0       0.0  0  3d6p      -4s7f
1324    EQ 1E1425      -121.2     0.    -173.2 FIXEDHF     0.700  0       0.0  0
1325    ER 2D1425         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0  3d6p      -4s8f
1326    ER 1E1425      -105.1     0.    -150.1 FIXEDHF     0.700  0       0.0  0
1327    ES 2D1425        -3.1     0.      -4.5 FIXEDHF     0.700  0       0.0  0  3d6p      -4s9f
1328    ES 1E1425       -91.7     0.    -131.0 FIXEDHF     0.700  0       0.0  0
1329    ET 2D1425        -6.3     0.      -9.0 FIXEDHF     0.700  0       0.0  0  3d6p      -4s10f
1330    ET 1E1425       -80.8     0.    -115.5 FIXEDHF     0.700  0       0.0  0
1331    EU 2D1425        -7.9     0.     -11.3 FIXEDHF     0.700  0       0.0  0  3d6p      -4s11f
1332    EU 1E1425       -71.8     0.    -102.6 FIXEDHF     0.700  0       0.0  0
1333    EV 2D1425        -8.8     0.     -12.5 FIXEDHF     0.700  0       0.0  0  3d6p      -4s12f
1334    EV 1E1425       -64.3     0.     -91.9 FIXEDHF     0.700  0       0.0  0
1335    EW 2D1425        -9.1     0.     -13.0 FIXEDHF     0.700  0       0.0  0  3d6p      -4s13f
1336    EW 1E1425       -58.0     0.     -82.8 FIXEDHF     0.700  0       0.0  0
1337    EX 2D1425        -9.1     0.     -13.0 FIXEDHF     0.700  0       0.0  0  3d6p      -4s14f
1338    EX 1E1425       -52.6     0.     -75.2 FIXEDHF     0.700  0       0.0  0
1339    EY 2D1415       -22.3     0.     -31.9 FIXEDHF     0.700  0       0.0  0  3d6p      -3d4f
1340    EY 4D1415        26.0     0.      37.2 FIXEDHF     0.700  0       0.0  0
1341    EY 1E1415        89.3     0.     127.6 FIXEDHF     0.700  0       0.0  0
1342    EY 3E1415        51.7     0.      73.8 FIXEDHF     0.700  0       0.0  0
1343    EZ 2D1415       -53.3     0.     -76.2 FIXEDHF     0.700  0       0.0  0  3d6p      -3d5f
1344    EZ 4D1415        26.9     0.      38.5 FIXEDHF     0.700  0       0.0  0
1345    EZ 1E1415        81.0     0.     115.7 FIXEDHF     0.700  0       0.0  0
1346    EZ 3E1415        47.7     0.      68.2 FIXEDHF     0.700  0       0.0  0
1347    Ea 2D1415       -27.7     0.     -39.6 FIXEDHF     0.700  0       0.0  0  3d6p      -3d6f
1348    Ea 4D1415        25.1     0.      35.8 FIXEDHF     0.700  0       0.0  0
1349    Ea 1E1415        68.7     0.      98.1 FIXEDHF     0.700  0       0.0  0
1350    Ea 3E1415        40.9     0.      58.4 FIXEDHF     0.700  0       0.0  0
1351    Eb 2D1415       -13.9     0.     -19.8 FIXEDHF     0.700  0       0.0  0  3d6p      -3d7f
1352    Eb 4D1415        22.4     0.      32.0 FIXEDHF     0.700  0       0.0  0
1353    Eb 1E1415        58.0     0.      82.9 FIXEDHF     0.700  0       0.0  0
1354    Eb 3E1415        34.8     0.      49.7 FIXEDHF     0.700  0       0.0  0
1355    Ec 2D1415        -6.5     0.      -9.3 FIXEDHF     0.700  0       0.0  0  3d6p      -3d8f
1356    Ec 4D1415        19.8     0.      28.3 FIXEDHF     0.700  0       0.0  0
1357    Ec 1E1415        49.6     0.      70.8 FIXEDHF     0.700  0       0.0  0
1358    Ec 3E1415        29.8     0.      42.6 FIXEDHF     0.700  0       0.0  0
1359    Ed 2D1415        -2.4     0.      -3.5 FIXEDHF     0.700  0       0.0  0  3d6p      -3d9f
1360    Ed 4D1415        17.6     0.      25.1 FIXEDHF     0.700  0       0.0  0
1361    Ed 1E1415        42.8     0.      61.1 FIXEDHF     0.700  0       0.0  0
1362    Ed 3E1415        25.8     0.      36.9 FIXEDHF     0.700  0       0.0  0
1363    Ee 2D1415        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d6p      -3d10f
1364    Ee 4D1415        15.6     0.      22.3 FIXEDHF     0.700  0       0.0  0
1365    Ee 1E1415        37.4     0.      53.4 FIXEDHF     0.700  0       0.0  0
1366    Ee 3E1415        22.6     0.      32.3 FIXEDHF     0.700  0       0.0  0
1367    Ef 2D1415         1.2     0.       1.7 FIXEDHF     0.700  0       0.0  0  3d6p      -3d11f
1368    Ef 4D1415        14.0     0.      20.0 FIXEDHF     0.700  0       0.0  0
1369    Ef 1E1415        33.0     0.      47.1 FIXEDHF     0.700  0       0.0  0
1370    Ef 3E1415        19.9     0.      28.5 FIXEDHF     0.700  0       0.0  0
1371    Eg 2D1415         2.0     0.       2.9 FIXEDHF     0.700  0       0.0  0  3d6p      -3d12f
1372    Eg 4D1415        12.6     0.      18.0 FIXEDHF     0.700  0       0.0  0
1373    Eg 1E1415        29.4     0.      42.0 FIXEDHF     0.700  0       0.0  0
1374    Eg 3E1415        17.8     0.      25.5 FIXEDHF     0.700  0       0.0  0
1375    Eh 2D1415         2.4     0.       3.5 FIXEDHF     0.700  0       0.0  0  3d6p      -3d13f
1376    Eh 4D1415        11.4     0.      16.3 FIXEDHF     0.700  0       0.0  0
1377    Eh 1E1415        26.4     0.      37.7 FIXEDHF     0.700  0       0.0  0
1378    Eh 3E1415        16.0     0.      22.9 FIXEDHF     0.700  0       0.0  0
1379    Ei 2D1415         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0  3d6p      -3d14f
1380    Ei 4D1415        10.4     0.      14.9 FIXEDHF     0.700  0       0.0  0
1381    Ei 1E1415        23.9     0.      34.1 FIXEDHF     0.700  0       0.0  0
1382    Ei 3E1415        14.5     0.      20.7 FIXEDHF     0.700  0       0.0  0
1383    En 4D1416         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6p      -3d6h
1384    En 3E1416         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
1385    Eo 4D1416        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0  3d6p      -3d7h
1386    Eo 3E1416         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
1387    Ep 4D1416        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0  3d6p      -3d8h
1388    Ep 3E1416         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
1389    Eq 4D1416        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0  3d6p      -3d9h
1390    Eq 3E1416         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
1391    Ev 1D1438       765.9     0.    1094.2 FIXEDHF     0.700  0       0.0  0  3d6p      -4p4d
1392    Ev 3D1438       255.4     0.     364.9 FIXEDHF     0.700  0       0.0  0
1393    Ev 0E1438      1156.4     0.    1652.0 FIXEDHF     0.700  0       0.0  0
1394    Ev 2E1438       350.3     0.     500.5 FIXEDHF     0.700  0       0.0  0
1395    Ew 1D1438       634.2     0.     906.0 FIXEDHF     0.700  0       0.0  0  3d6p      -4p5d
1396    Ew 3D1438        81.5     0.     116.5 FIXEDHF     0.700  0       0.0  0
1397    Ew 0E1438       688.1     0.     983.0 FIXEDHF     0.700  0       0.0  0
1398    Ew 2E1438       166.7     0.     238.1 FIXEDHF     0.700  0       0.0  0
1399    Ex 1D1438        -5.5     0.      -7.9 FIXEDHF     0.700  0       0.0  0  3d6p      -4p6d
1400    Ex 3D1438        10.8     0.      15.4 FIXEDHF     0.700  0       0.0  0
1401    Ex 0E1438       467.9     0.     668.4 FIXEDHF     0.700  0       0.0  0
1402    Ex 2E1438        97.6     0.     139.4 FIXEDHF     0.700  0       0.0  0
1403    Ey 1D1438       -88.1     0.    -125.8 FIXEDHF     0.700  0       0.0  0  3d6p      -4p7d
1404    Ey 3D1438       -10.6     0.     -15.2 FIXEDHF     0.700  0       0.0  0
1405    Ey 0E1438       344.3     0.     491.8 FIXEDHF     0.700  0       0.0  0
1406    Ey 2E1438        64.7     0.      92.4 FIXEDHF     0.700  0       0.0  0
1407    Ez 1D1438      -102.3     0.    -146.2 FIXEDHF     0.700  0       0.0  0  3d6p      -4p8d
1408    Ez 3D1438       -17.4     0.     -24.9 FIXEDHF     0.700  0       0.0  0
1409    Ez 0E1438       267.1     0.     381.5 FIXEDHF     0.700  0       0.0  0
1410    Ez 2E1438        46.5     0.      66.5 FIXEDHF     0.700  0       0.0  0
1411    FG 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d8p
1412    FG 2D1414       266.4     0.     380.6 FIXEDHF     0.700  0       0.0  0
1413    FG 1E1414       134.8     0.     192.5 FIXEDHF     0.700  0       0.0  0
1414    FG 3E1414       110.3     0.     157.5 FIXEDHF     0.700  0       0.0  0
1415    FH 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d9p
1416    FH 2D1414       208.4     0.     297.7 FIXEDHF     0.700  0       0.0  0
1417    FH 1E1414       106.3     0.     151.8 FIXEDHF     0.700  0       0.0  0
1418    FH 3E1414        87.2     0.     124.6 FIXEDHF     0.700  0       0.0  0
1419    FI 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d10p
1420    FI 2D1414       169.0     0.     241.5 FIXEDHF     0.700  0       0.0  0
1421    FI 1E1414        86.6     0.     123.7 FIXEDHF     0.700  0       0.0  0
1422    FI 3E1414        71.2     0.     101.7 FIXEDHF     0.700  0       0.0  0
1423    FJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d11p
1424    FJ 2D1414       140.8     0.     201.1 FIXEDHF     0.700  0       0.0  0
1425    FJ 1E1414        72.4     0.     103.4 FIXEDHF     0.700  0       0.0  0
1426    FJ 3E1414        59.6     0.      85.1 FIXEDHF     0.700  0       0.0  0
1427    FK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d12p
1428    FK 2D1414       119.7     0.     171.0 FIXEDHF     0.700  0       0.0  0
1429    FK 1E1414        61.6     0.      88.0 FIXEDHF     0.700  0       0.0  0
1430    FK 3E1414        50.8     0.      72.6 FIXEDHF     0.700  0       0.0  0
1431    FL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d13p
1432    FL 2D1414       103.4     0.     147.7 FIXEDHF     0.700  0       0.0  0
1433    FL 1E1414        53.3     0.      76.1 FIXEDHF     0.700  0       0.0  0
1434    FL 3E1414        44.0     0.      62.8 FIXEDHF     0.700  0       0.0  0
1435    FM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7p      -3d14p
1436    FM 2D1414        90.5     0.     129.3 FIXEDHF     0.700  0       0.0  0
1437    FM 1E1414        46.7     0.      66.7 FIXEDHF     0.700  0       0.0  0
1438    FM 3E1414        38.6     0.      55.1 FIXEDHF     0.700  0       0.0  0
1439    FN 2D1425        22.1     0.      31.6 FIXEDHF     0.700  0       0.0  0  3d7p      -4s4f
1440    FN 1E1425      -114.7     0.    -163.8 FIXEDHF     0.700  0       0.0  0
1441    FO 2D1425        19.0     0.      27.1 FIXEDHF     0.700  0       0.0  0  3d7p      -4s5f
1442    FO 1E1425      -109.0     0.    -155.7 FIXEDHF     0.700  0       0.0  0
1443    FP 2D1425        29.3     0.      41.8 FIXEDHF     0.700  0       0.0  0  3d7p      -4s6f
1444    FP 1E1425       -95.3     0.    -136.1 FIXEDHF     0.700  0       0.0  0
1445    FQ 2D1425        18.9     0.      27.0 FIXEDHF     0.700  0       0.0  0  3d7p      -4s7f
1446    FQ 1E1425       -82.3     0.    -117.6 FIXEDHF     0.700  0       0.0  0
1447    FR 2D1425        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0  3d7p      -4s8f
1448    FR 1E1425       -71.3     0.    -101.9 FIXEDHF     0.700  0       0.0  0
1449    FS 2D1425         6.9     0.       9.8 FIXEDHF     0.700  0       0.0  0  3d7p      -4s9f
1450    FS 1E1425       -62.4     0.     -89.1 FIXEDHF     0.700  0       0.0  0
1451    FT 2D1425         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0  3d7p      -4s10f
1452    FT 1E1425       -54.9     0.     -78.5 FIXEDHF     0.700  0       0.0  0
1453    FU 2D1425         1.9     0.       2.7 FIXEDHF     0.700  0       0.0  0  3d7p      -4s11f
1454    FU 1E1425       -48.9     0.     -69.8 FIXEDHF     0.700  0       0.0  0
1455    FV 2D1425         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0  3d7p      -4s12f
1456    FV 1E1425       -43.8     0.     -62.5 FIXEDHF     0.700  0       0.0  0
1457    FW 2D1425        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d7p      -4s13f
1458    FW 1E1425       -39.5     0.     -56.4 FIXEDHF     0.700  0       0.0  0
1459    FX 2D1425        -0.8     0.      -1.1 FIXEDHF     0.700  0       0.0  0  3d7p      -4s14f
1460    FX 1E1425       -35.8     0.     -51.2 FIXEDHF     0.700  0       0.0  0
1461    FY 2D1415       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0  3d7p      -3d4f
1462    FY 4D1415        16.4     0.      23.5 FIXEDHF     0.700  0       0.0  0
1463    FY 1E1415        60.6     0.      86.6 FIXEDHF     0.700  0       0.0  0
1464    FY 3E1415        34.9     0.      49.9 FIXEDHF     0.700  0       0.0  0
1465    FZ 2D1415       -12.9     0.     -18.5 FIXEDHF     0.700  0       0.0  0  3d7p      -3d5f
1466    FZ 4D1415        17.2     0.      24.6 FIXEDHF     0.700  0       0.0  0
1467    FZ 1E1415        55.1     0.      78.7 FIXEDHF     0.700  0       0.0  0
1468    FZ 3E1415        32.3     0.      46.2 FIXEDHF     0.700  0       0.0  0
1469    Fa 2D1415       -22.2     0.     -31.7 FIXEDHF     0.700  0       0.0  0  3d7p      -3d6f
1470    Fa 4D1415        15.7     0.      22.5 FIXEDHF     0.700  0       0.0  0
1471    Fa 1E1415        46.8     0.      66.8 FIXEDHF     0.700  0       0.0  0
1472    Fa 3E1415        27.8     0.      39.7 FIXEDHF     0.700  0       0.0  0
1473    Fb 2D1415       -15.6     0.     -22.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d7f
1474    Fb 4D1415        14.1     0.      20.1 FIXEDHF     0.700  0       0.0  0
1475    Fb 1E1415        39.5     0.      56.5 FIXEDHF     0.700  0       0.0  0
1476    Fb 3E1415        23.7     0.      33.8 FIXEDHF     0.700  0       0.0  0
1477    Fc 2D1415       -10.7     0.     -15.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d8f
1478    Fc 4D1415        12.5     0.      17.8 FIXEDHF     0.700  0       0.0  0
1479    Fc 1E1415        33.7     0.      48.2 FIXEDHF     0.700  0       0.0  0
1480    Fc 3E1415        20.3     0.      29.0 FIXEDHF     0.700  0       0.0  0
1481    Fd 2D1415        -7.5     0.     -10.7 FIXEDHF     0.700  0       0.0  0  3d7p      -3d9f
1482    Fd 4D1415        11.1     0.      15.8 FIXEDHF     0.700  0       0.0  0
1483    Fd 1E1415        29.2     0.      41.7 FIXEDHF     0.700  0       0.0  0
1484    Fd 3E1415        17.6     0.      25.1 FIXEDHF     0.700  0       0.0  0
1485    Fe 2D1415        -5.4     0.      -7.7 FIXEDHF     0.700  0       0.0  0  3d7p      -3d10f
1486    Fe 4D1415         9.8     0.      14.0 FIXEDHF     0.700  0       0.0  0
1487    Fe 1E1415        25.5     0.      36.4 FIXEDHF     0.700  0       0.0  0
1488    Fe 3E1415        15.4     0.      22.0 FIXEDHF     0.700  0       0.0  0
1489    Ff 2D1415        -3.9     0.      -5.6 FIXEDHF     0.700  0       0.0  0  3d7p      -3d11f
1490    Ff 4D1415         8.8     0.      12.6 FIXEDHF     0.700  0       0.0  0
1491    Ff 1E1415        22.5     0.      32.1 FIXEDHF     0.700  0       0.0  0
1492    Ff 3E1415        13.6     0.      19.4 FIXEDHF     0.700  0       0.0  0
1493    Fg 2D1415        -2.9     0.      -4.1 FIXEDHF     0.700  0       0.0  0  3d7p      -3d12f
1494    Fg 4D1415         7.9     0.      11.3 FIXEDHF     0.700  0       0.0  0
1495    Fg 1E1415        20.0     0.      28.6 FIXEDHF     0.700  0       0.0  0
1496    Fg 3E1415        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
1497    Fh 2D1415        -2.2     0.      -3.1 FIXEDHF     0.700  0       0.0  0  3d7p      -3d13f
1498    Fh 4D1415         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
1499    Fh 1E1415        18.0     0.      25.7 FIXEDHF     0.700  0       0.0  0
1500    Fh 3E1415        10.9     0.      15.6 FIXEDHF     0.700  0       0.0  0
1501    Fi 2D1415        -1.6     0.      -2.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d14f
1502    Fi 4D1415         6.6     0.       9.4 FIXEDHF     0.700  0       0.0  0
1503    Fi 1E1415        16.2     0.      23.2 FIXEDHF     0.700  0       0.0  0
1504    Fi 3E1415         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0
1505    Fn 4D1416        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d6h
1506    Fn 3E1416         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
1507    Fo 4D1416        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d7h
1508    Fo 3E1416         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
1509    Fp 4D1416        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d8h
1510    Fp 3E1416         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
1511    Fq 4D1416        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d7p      -3d9h
1512    Fq 3E1416         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
1513    Fv 1D1438       520.0     0.     742.8 FIXEDHF     0.700  0       0.0  0  3d7p      -4p4d
1514    Fv 3D1438       198.0     0.     282.8 FIXEDHF     0.700  0       0.0  0
1515    Fv 0E1438       796.6     0.    1138.0 FIXEDHF     0.700  0       0.0  0
1516    Fv 2E1438       260.4     0.     372.0 FIXEDHF     0.700  0       0.0  0
1517    Fw 1D1438       359.0     0.     512.9 FIXEDHF     0.700  0       0.0  0  3d7p      -4p5d
1518    Fw 3D1438        76.4     0.     109.2 FIXEDHF     0.700  0       0.0  0
1519    Fw 0E1438       476.7     0.     681.0 FIXEDHF     0.700  0       0.0  0
1520    Fw 2E1438       128.1     0.     183.0 FIXEDHF     0.700  0       0.0  0
1521    Fx 1D1438       312.1     0.     445.8 FIXEDHF     0.700  0       0.0  0  3d7p      -4p6d
1522    Fx 3D1438        29.9     0.      42.7 FIXEDHF     0.700  0       0.0  0
1523    Fx 0E1438       324.9     0.     464.2 FIXEDHF     0.700  0       0.0  0
1524    Fx 2E1438        76.9     0.     109.8 FIXEDHF     0.700  0       0.0  0
1525    Fy 1D1438        36.9     0.      52.7 FIXEDHF     0.700  0       0.0  0  3d7p      -4p7d
1526    Fy 3D1438         8.5     0.      12.2 FIXEDHF     0.700  0       0.0  0
1527    Fy 0E1438       239.3     0.     341.9 FIXEDHF     0.700  0       0.0  0
1528    Fy 2E1438        51.9     0.      74.1 FIXEDHF     0.700  0       0.0  0
1529    Fz 1D1438       -13.4     0.     -19.2 FIXEDHF     0.700  0       0.0  0  3d7p      -4p8d
1530    Fz 3D1438        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
1531    Fz 0E1438       185.8     0.     265.4 FIXEDHF     0.700  0       0.0  0
1532    Fz 2E1438        37.9     0.      54.1 FIXEDHF     0.700  0       0.0  0
1533    GH 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d9p
1534    GH 2D1414       161.3     0.     230.5 FIXEDHF     0.700  0       0.0  0
1535    GH 1E1414        80.1     0.     114.4 FIXEDHF     0.700  0       0.0  0
1536    GH 3E1414        66.0     0.      94.3 FIXEDHF     0.700  0       0.0  0
1537    GI 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d10p
1538    GI 2D1414       130.8     0.     186.9 FIXEDHF     0.700  0       0.0  0
1539    GI 1E1414        65.3     0.      93.3 FIXEDHF     0.700  0       0.0  0
1540    GI 3E1414        53.9     0.      77.0 FIXEDHF     0.700  0       0.0  0
1541    GJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d11p
1542    GJ 2D1414       109.0     0.     155.7 FIXEDHF     0.700  0       0.0  0
1543    GJ 1E1414        54.5     0.      77.9 FIXEDHF     0.700  0       0.0  0
1544    GJ 3E1414        45.1     0.      64.5 FIXEDHF     0.700  0       0.0  0
1545    GK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d12p
1546    GK 2D1414        92.6     0.     132.3 FIXEDHF     0.700  0       0.0  0
1547    GK 1E1414        46.5     0.      66.4 FIXEDHF     0.700  0       0.0  0
1548    GK 3E1414        38.5     0.      55.0 FIXEDHF     0.700  0       0.0  0
1549    GL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d13p
1550    GL 2D1414        80.0     0.     114.3 FIXEDHF     0.700  0       0.0  0
1551    GL 1E1414        40.2     0.      57.4 FIXEDHF     0.700  0       0.0  0
1552    GL 3E1414        33.3     0.      47.6 FIXEDHF     0.700  0       0.0  0
1553    GM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d14p
1554    GM 2D1414        70.1     0.     100.1 FIXEDHF     0.700  0       0.0  0
1555    GM 1E1414        35.2     0.      50.3 FIXEDHF     0.700  0       0.0  0
1556    GM 3E1414        29.2     0.      41.7 FIXEDHF     0.700  0       0.0  0
1557    GN 2D1425        16.2     0.      23.1 FIXEDHF     0.700  0       0.0  0  3d8p      -4s4f
1558    GN 1E1425       -84.5     0.    -120.7 FIXEDHF     0.700  0       0.0  0
1559    GO 2D1425        12.9     0.      18.5 FIXEDHF     0.700  0       0.0  0  3d8p      -4s5f
1560    GO 1E1425       -80.4     0.    -114.9 FIXEDHF     0.700  0       0.0  0
1561    GP 2D1425        10.5     0.      15.0 FIXEDHF     0.700  0       0.0  0  3d8p      -4s6f
1562    GP 1E1425       -70.3     0.    -100.5 FIXEDHF     0.700  0       0.0  0
1563    GQ 2D1425        13.9     0.      19.9 FIXEDHF     0.700  0       0.0  0  3d8p      -4s7f
1564    GQ 1E1425       -60.8     0.     -86.9 FIXEDHF     0.700  0       0.0  0
1565    GR 2D1425        10.4     0.      14.8 FIXEDHF     0.700  0       0.0  0  3d8p      -4s8f
1566    GR 1E1425       -52.7     0.     -75.3 FIXEDHF     0.700  0       0.0  0
1567    GS 2D1425         7.3     0.      10.5 FIXEDHF     0.700  0       0.0  0  3d8p      -4s9f
1568    GS 1E1425       -46.1     0.     -65.8 FIXEDHF     0.700  0       0.0  0
1569    GT 2D1425         5.2     0.       7.4 FIXEDHF     0.700  0       0.0  0  3d8p      -4s10f
1570    GT 1E1425       -40.6     0.     -58.0 FIXEDHF     0.700  0       0.0  0
1571    GU 2D1425         3.7     0.       5.3 FIXEDHF     0.700  0       0.0  0  3d8p      -4s11f
1572    GU 1E1425       -36.1     0.     -51.6 FIXEDHF     0.700  0       0.0  0
1573    GV 2D1425         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0  3d8p      -4s12f
1574    GV 1E1425       -32.3     0.     -46.2 FIXEDHF     0.700  0       0.0  0
1575    GW 2D1425         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0  3d8p      -4s13f
1576    GW 1E1425       -29.2     0.     -41.7 FIXEDHF     0.700  0       0.0  0
1577    GX 2D1425         1.3     0.       1.8 FIXEDHF     0.700  0       0.0  0  3d8p      -4s14f
1578    GX 1E1425       -26.5     0.     -37.8 FIXEDHF     0.700  0       0.0  0
1579    GY 2D1415        -9.4     0.     -13.5 FIXEDHF     0.700  0       0.0  0  3d8p      -3d4f
1580    GY 4D1415        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0
1581    GY 1E1415        44.8     0.      64.0 FIXEDHF     0.700  0       0.0  0
1582    GY 3E1415        25.8     0.      36.8 FIXEDHF     0.700  0       0.0  0
1583    GZ 2D1415        -8.6     0.     -12.3 FIXEDHF     0.700  0       0.0  0  3d8p      -3d5f
1584    GZ 4D1415        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
1585    GZ 1E1415        40.7     0.      58.2 FIXEDHF     0.700  0       0.0  0
1586    GZ 3E1415        23.9     0.      34.1 FIXEDHF     0.700  0       0.0  0
1587    Ga 2D1415        -7.8     0.     -11.1 FIXEDHF     0.700  0       0.0  0  3d8p      -3d6f
1588    Ga 4D1415        11.2     0.      16.0 FIXEDHF     0.700  0       0.0  0
1589    Ga 1E1415        34.6     0.      49.4 FIXEDHF     0.700  0       0.0  0
1590    Ga 3E1415        20.5     0.      29.3 FIXEDHF     0.700  0       0.0  0
1591    Gb 2D1415       -11.0     0.     -15.7 FIXEDHF     0.700  0       0.0  0  3d8p      -3d7f
1592    Gb 4D1415         9.9     0.      14.2 FIXEDHF     0.700  0       0.0  0
1593    Gb 1E1415        29.3     0.      41.8 FIXEDHF     0.700  0       0.0  0
1594    Gb 3E1415        17.5     0.      25.0 FIXEDHF     0.700  0       0.0  0
1595    Gc 2D1415        -8.8     0.     -12.6 FIXEDHF     0.700  0       0.0  0  3d8p      -3d8f
1596    Gc 4D1415         8.8     0.      12.6 FIXEDHF     0.700  0       0.0  0
1597    Gc 1E1415        25.0     0.      35.7 FIXEDHF     0.700  0       0.0  0
1598    Gc 3E1415        15.0     0.      21.4 FIXEDHF     0.700  0       0.0  0
1599    Gd 2D1415        -6.8     0.      -9.7 FIXEDHF     0.700  0       0.0  0  3d8p      -3d9f
1600    Gd 4D1415         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0
1601    Gd 1E1415        21.6     0.      30.9 FIXEDHF     0.700  0       0.0  0
1602    Gd 3E1415        13.0     0.      18.6 FIXEDHF     0.700  0       0.0  0
1603    Ge 2D1415        -5.3     0.      -7.6 FIXEDHF     0.700  0       0.0  0  3d8p      -3d10f
1604    Ge 4D1415         6.9     0.       9.9 FIXEDHF     0.700  0       0.0  0
1605    Ge 1E1415        18.9     0.      27.0 FIXEDHF     0.700  0       0.0  0
1606    Ge 3E1415        11.4     0.      16.3 FIXEDHF     0.700  0       0.0  0
1607    Gf 2D1415        -4.2     0.      -6.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d11f
1608    Gf 4D1415         6.2     0.       8.9 FIXEDHF     0.700  0       0.0  0
1609    Gf 1E1415        16.7     0.      23.8 FIXEDHF     0.700  0       0.0  0
1610    Gf 3E1415        10.1     0.      14.4 FIXEDHF     0.700  0       0.0  0
1611    Gg 2D1415        -3.4     0.      -4.8 FIXEDHF     0.700  0       0.0  0  3d8p      -3d12f
1612    Gg 4D1415         5.6     0.       8.0 FIXEDHF     0.700  0       0.0  0
1613    Gg 1E1415        14.8     0.      21.2 FIXEDHF     0.700  0       0.0  0
1614    Gg 3E1415         9.0     0.      12.8 FIXEDHF     0.700  0       0.0  0
1615    Gh 2D1415        -2.8     0.      -4.0 FIXEDHF     0.700  0       0.0  0  3d8p      -3d13f
1616    Gh 4D1415         5.1     0.       7.3 FIXEDHF     0.700  0       0.0  0
1617    Gh 1E1415        13.3     0.      19.0 FIXEDHF     0.700  0       0.0  0
1618    Gh 3E1415         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0
1619    Gi 2D1415        -2.3     0.      -3.3 FIXEDHF     0.700  0       0.0  0  3d8p      -3d14f
1620    Gi 4D1415         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0
1621    Gi 1E1415        12.0     0.      17.2 FIXEDHF     0.700  0       0.0  0
1622    Gi 3E1415         7.3     0.      10.4 FIXEDHF     0.700  0       0.0  0
1623    Gn 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d8p      -3d6h
1624    Gn 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1625    Go 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d8p      -3d7h
1626    Go 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1627    Gp 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d8p      -3d8h
1628    Gp 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1629    Gq 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d8p      -3d9h
1630    Gq 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1631    Gv 1D1438       388.2     0.     554.6 FIXEDHF     0.700  0       0.0  0  3d8p      -4p4d
1632    Gv 3D1438       157.1     0.     224.4 FIXEDHF     0.700  0       0.0  0
1633    Gv 0E1438       592.8     0.     846.9 FIXEDHF     0.700  0       0.0  0
1634    Gv 2E1438       202.2     0.     288.8 FIXEDHF     0.700  0       0.0  0
1635    Gw 1D1438       261.6     0.     373.7 FIXEDHF     0.700  0       0.0  0  3d8p      -4p5d
1636    Gw 3D1438        65.5     0.      93.5 FIXEDHF     0.700  0       0.0  0
1637    Gw 0E1438       355.9     0.     508.4 FIXEDHF     0.700  0       0.0  0
1638    Gw 2E1438       101.2     0.     144.6 FIXEDHF     0.700  0       0.0  0
1639    Gx 1D1438       192.5     0.     275.0 FIXEDHF     0.700  0       0.0  0  3d8p      -4p6d
1640    Gx 3D1438        29.5     0.      42.1 FIXEDHF     0.700  0       0.0  0
1641    Gx 0E1438       242.9     0.     347.0 FIXEDHF     0.700  0       0.0  0
1642    Gx 2E1438        61.5     0.      87.8 FIXEDHF     0.700  0       0.0  0
1643    Gy 1D1438       174.4     0.     249.2 FIXEDHF     0.700  0       0.0  0  3d8p      -4p7d
1644    Gy 3D1438        13.6     0.      19.4 FIXEDHF     0.700  0       0.0  0
1645    Gy 0E1438       179.1     0.     255.8 FIXEDHF     0.700  0       0.0  0
1646    Gy 2E1438        41.9     0.      59.8 FIXEDHF     0.700  0       0.0  0
1647    Gz 1D1438        37.8     0.      54.0 FIXEDHF     0.700  0       0.0  0  3d8p      -4p8d
1648    Gz 3D1438         5.5     0.       7.8 FIXEDHF     0.700  0       0.0  0
1649    Gz 0E1438       139.0     0.     198.6 FIXEDHF     0.700  0       0.0  0
1650    Gz 2E1438        30.7     0.      43.9 FIXEDHF     0.700  0       0.0  0
1651    HI 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d10p
1652    HI 2D1414       105.0     0.     150.0 FIXEDHF     0.700  0       0.0  0
1653    HI 1E1414        51.5     0.      73.6 FIXEDHF     0.700  0       0.0  0
1654    HI 3E1414        42.7     0.      61.0 FIXEDHF     0.700  0       0.0  0
1655    HJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d11p
1656    HJ 2D1414        87.4     0.     124.9 FIXEDHF     0.700  0       0.0  0
1657    HJ 1E1414        43.0     0.      61.5 FIXEDHF     0.700  0       0.0  0
1658    HJ 3E1414        35.7     0.      51.0 FIXEDHF     0.700  0       0.0  0
1659    HK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d12p
1660    HK 2D1414        74.3     0.     106.2 FIXEDHF     0.700  0       0.0  0
1661    HK 1E1414        36.7     0.      52.4 FIXEDHF     0.700  0       0.0  0
1662    HK 3E1414        30.4     0.      43.5 FIXEDHF     0.700  0       0.0  0
1663    HL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d13p
1664    HL 2D1414        64.2     0.      91.7 FIXEDHF     0.700  0       0.0  0
1665    HL 1E1414        31.7     0.      45.3 FIXEDHF     0.700  0       0.0  0
1666    HL 3E1414        26.4     0.      37.7 FIXEDHF     0.700  0       0.0  0
1667    HM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d14p
1668    HM 2D1414        56.2     0.      80.3 FIXEDHF     0.700  0       0.0  0
1669    HM 1E1414        27.8     0.      39.7 FIXEDHF     0.700  0       0.0  0
1670    HM 3E1414        23.1     0.      33.0 FIXEDHF     0.700  0       0.0  0
1671    HN 2D1425        12.7     0.      18.2 FIXEDHF     0.700  0       0.0  0  3d9p      -4s4f
1672    HN 1E1425       -65.7     0.     -93.8 FIXEDHF     0.700  0       0.0  0
1673    HO 2D1425         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0  3d9p      -4s5f
1674    HO 1E1425       -62.6     0.     -89.4 FIXEDHF     0.700  0       0.0  0
1675    HP 2D1425         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0  3d9p      -4s6f
1676    HP 1E1425       -54.8     0.     -78.3 FIXEDHF     0.700  0       0.0  0
1677    HQ 2D1425         6.2     0.       8.8 FIXEDHF     0.700  0       0.0  0  3d9p      -4s7f
1678    HQ 1E1425       -47.4     0.     -67.7 FIXEDHF     0.700  0       0.0  0
1679    HR 2D1425         7.5     0.      10.7 FIXEDHF     0.700  0       0.0  0  3d9p      -4s8f
1680    HR 1E1425       -41.1     0.     -58.7 FIXEDHF     0.700  0       0.0  0
1681    HS 2D1425         6.0     0.       8.6 FIXEDHF     0.700  0       0.0  0  3d9p      -4s9f
1682    HS 1E1425       -35.9     0.     -51.3 FIXEDHF     0.700  0       0.0  0
1683    HT 2D1425         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0  3d9p      -4s10f
1684    HT 1E1425       -31.6     0.     -45.2 FIXEDHF     0.700  0       0.0  0
1685    HU 2D1425         3.6     0.       5.1 FIXEDHF     0.700  0       0.0  0  3d9p      -4s11f
1686    HU 1E1425       -28.1     0.     -40.2 FIXEDHF     0.700  0       0.0  0
1687    HV 2D1425         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0  3d9p      -4s12f
1688    HV 1E1425       -25.2     0.     -36.0 FIXEDHF     0.700  0       0.0  0
1689    HW 2D1425         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0  3d9p      -4s13f
1690    HW 1E1425       -22.8     0.     -32.5 FIXEDHF     0.700  0       0.0  0
1691    HX 2D1425         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0  3d9p      -4s14f
1692    HX 1E1425       -20.6     0.     -29.5 FIXEDHF     0.700  0       0.0  0
1693    HY 2D1415        -7.3     0.     -10.5 FIXEDHF     0.700  0       0.0  0  3d9p      -3d4f
1694    HY 4D1415         8.7     0.      12.4 FIXEDHF     0.700  0       0.0  0
1695    HY 1E1415        34.9     0.      49.8 FIXEDHF     0.700  0       0.0  0
1696    HY 3E1415        20.0     0.      28.6 FIXEDHF     0.700  0       0.0  0
1697    HZ 2D1415        -6.4     0.      -9.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d5f
1698    HZ 4D1415         9.2     0.      13.1 FIXEDHF     0.700  0       0.0  0
1699    HZ 1E1415        31.7     0.      45.3 FIXEDHF     0.700  0       0.0  0
1700    HZ 3E1415        18.6     0.      26.6 FIXEDHF     0.700  0       0.0  0
1701    Ha 2D1415        -5.5     0.      -7.9 FIXEDHF     0.700  0       0.0  0  3d9p      -3d6f
1702    Ha 4D1415         8.5     0.      12.1 FIXEDHF     0.700  0       0.0  0
1703    Ha 1E1415        26.9     0.      38.5 FIXEDHF     0.700  0       0.0  0
1704    Ha 3E1415        16.0     0.      22.8 FIXEDHF     0.700  0       0.0  0
1705    Hb 2D1415        -4.9     0.      -7.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d7f
1706    Hb 4D1415         7.6     0.      10.8 FIXEDHF     0.700  0       0.0  0
1707    Hb 1E1415        22.8     0.      32.6 FIXEDHF     0.700  0       0.0  0
1708    Hb 3E1415        13.6     0.      19.4 FIXEDHF     0.700  0       0.0  0
1709    Hc 2D1415        -6.2     0.      -8.8 FIXEDHF     0.700  0       0.0  0  3d9p      -3d8f
1710    Hc 4D1415         6.6     0.       9.5 FIXEDHF     0.700  0       0.0  0
1711    Hc 1E1415        19.5     0.      27.9 FIXEDHF     0.700  0       0.0  0
1712    Hc 3E1415        11.7     0.      16.7 FIXEDHF     0.700  0       0.0  0
1713    Hd 2D1415        -5.3     0.      -7.5 FIXEDHF     0.700  0       0.0  0  3d9p      -3d9f
1714    Hd 4D1415         5.9     0.       8.4 FIXEDHF     0.700  0       0.0  0
1715    Hd 1E1415        16.9     0.      24.1 FIXEDHF     0.700  0       0.0  0
1716    Hd 3E1415        10.1     0.      14.5 FIXEDHF     0.700  0       0.0  0
1717    He 2D1415        -4.3     0.      -6.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d10f
1718    He 4D1415         5.3     0.       7.5 FIXEDHF     0.700  0       0.0  0
1719    He 1E1415        14.7     0.      21.0 FIXEDHF     0.700  0       0.0  0
1720    He 3E1415         8.9     0.      12.7 FIXEDHF     0.700  0       0.0  0
1721    Hf 2D1415        -3.6     0.      -5.1 FIXEDHF     0.700  0       0.0  0  3d9p      -3d11f
1722    Hf 4D1415         4.8     0.       6.8 FIXEDHF     0.700  0       0.0  0
1723    Hf 1E1415        13.0     0.      18.6 FIXEDHF     0.700  0       0.0  0
1724    Hf 3E1415         7.8     0.      11.2 FIXEDHF     0.700  0       0.0  0
1725    Hg 2D1415        -3.0     0.      -4.3 FIXEDHF     0.700  0       0.0  0  3d9p      -3d12f
1726    Hg 4D1415         4.3     0.       6.1 FIXEDHF     0.700  0       0.0  0
1727    Hg 1E1415        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0
1728    Hg 3E1415         7.0     0.      10.0 FIXEDHF     0.700  0       0.0  0
1729    Hh 2D1415        -2.5     0.      -3.6 FIXEDHF     0.700  0       0.0  0  3d9p      -3d13f
1730    Hh 4D1415         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
1731    Hh 1E1415        10.4     0.      14.9 FIXEDHF     0.700  0       0.0  0
1732    Hh 3E1415         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
1733    Hi 2D1415        -2.1     0.      -3.0 FIXEDHF     0.700  0       0.0  0  3d9p      -3d14f
1734    Hi 4D1415         3.5     0.       5.0 FIXEDHF     0.700  0       0.0  0
1735    Hi 1E1415         9.4     0.      13.4 FIXEDHF     0.700  0       0.0  0
1736    Hi 3E1415         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0
1737    Hn 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d6h
1738    Hn 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1739    Ho 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d7h
1740    Ho 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1741    Hp 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d8h
1742    Hp 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1743    Hq 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d9p      -3d9h
1744    Hq 3E1416         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
1745    Hv 1D1438       305.8     0.     436.8 FIXEDHF     0.700  0       0.0  0  3d9p      -4p4d
1746    Hv 3D1438       128.0     0.     182.9 FIXEDHF     0.700  0       0.0  0
1747    Hv 0E1438       463.7     0.     662.5 FIXEDHF     0.700  0       0.0  0
1748    Hv 2E1438       162.5     0.     232.1 FIXEDHF     0.700  0       0.0  0
1749    Hw 1D1438       204.7     0.     292.4 FIXEDHF     0.700  0       0.0  0  3d9p      -4p5d
1750    Hw 3D1438        55.6     0.      79.4 FIXEDHF     0.700  0       0.0  0
1751    Hw 0E1438       278.9     0.     398.5 FIXEDHF     0.700  0       0.0  0
1752    Hw 2E1438        82.2     0.     117.4 FIXEDHF     0.700  0       0.0  0
1753    Hx 1D1438       146.7     0.     209.6 FIXEDHF     0.700  0       0.0  0  3d9p      -4p6d
1754    Hx 3D1438        26.6     0.      38.0 FIXEDHF     0.700  0       0.0  0
1755    Hx 0E1438       190.5     0.     272.2 FIXEDHF     0.700  0       0.0  0
1756    Hx 2E1438        50.3     0.      71.8 FIXEDHF     0.700  0       0.0  0
1757    Hy 1D1438       114.2     0.     163.2 FIXEDHF     0.700  0       0.0  0  3d9p      -4p7d
1758    Hy 3D1438        13.6     0.      19.4 FIXEDHF     0.700  0       0.0  0
1759    Hy 0E1438       140.5     0.     200.7 FIXEDHF     0.700  0       0.0  0
1760    Hy 2E1438        34.4     0.      49.1 FIXEDHF     0.700  0       0.0  0
1761    Hz 1D1438       106.8     0.     152.6 FIXEDHF     0.700  0       0.0  0  3d9p      -4p8d
1762    Hz 3D1438         7.1     0.      10.2 FIXEDHF     0.700  0       0.0  0
1763    Hz 0E1438       109.1     0.     155.9 FIXEDHF     0.700  0       0.0  0
1764    Hz 2E1438        25.3     0.      36.2 FIXEDHF     0.700  0       0.0  0
1765    IJ 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10p     -3d11p
1766    IJ 2D1414        72.1     0.     103.0 FIXEDHF     0.700  0       0.0  0
1767    IJ 1E1414        35.1     0.      50.1 FIXEDHF     0.700  0       0.0  0
1768    IJ 3E1414        29.2     0.      41.7 FIXEDHF     0.700  0       0.0  0
1769    IK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10p     -3d12p
1770    IK 2D1414        61.2     0.      87.5 FIXEDHF     0.700  0       0.0  0
1771    IK 1E1414        29.9     0.      42.7 FIXEDHF     0.700  0       0.0  0
1772    IK 3E1414        24.8     0.      35.5 FIXEDHF     0.700  0       0.0  0
1773    IL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10p     -3d13p
1774    IL 2D1414        52.9     0.      75.6 FIXEDHF     0.700  0       0.0  0
1775    IL 1E1414        25.9     0.      37.0 FIXEDHF     0.700  0       0.0  0
1776    IL 3E1414        21.6     0.      30.8 FIXEDHF     0.700  0       0.0  0
1777    IM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10p     -3d14p
1778    IM 2D1414        46.3     0.      66.2 FIXEDHF     0.700  0       0.0  0
1779    IM 1E1414        22.7     0.      32.4 FIXEDHF     0.700  0       0.0  0
1780    IM 3E1414        18.9     0.      27.0 FIXEDHF     0.700  0       0.0  0
1781    IN 2D1425        10.5     0.      15.0 FIXEDHF     0.700  0       0.0  0  3d10p     -4s4f
1782    IN 1E1425       -53.0     0.     -75.7 FIXEDHF     0.700  0       0.0  0
1783    IO 2D1425         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0  3d10p     -4s5f
1784    IO 1E1425       -50.5     0.     -72.2 FIXEDHF     0.700  0       0.0  0
1785    IP 2D1425         6.1     0.       8.7 FIXEDHF     0.700  0       0.0  0  3d10p     -4s6f
1786    IP 1E1425       -44.2     0.     -63.2 FIXEDHF     0.700  0       0.0  0
1787    IQ 2D1425         4.8     0.       6.8 FIXEDHF     0.700  0       0.0  0  3d10p     -4s7f
1788    IQ 1E1425       -38.3     0.     -54.7 FIXEDHF     0.700  0       0.0  0
1789    IR 2D1425         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0  3d10p     -4s8f
1790    IR 1E1425       -33.2     0.     -47.4 FIXEDHF     0.700  0       0.0  0
1791    IS 2D1425         4.4     0.       6.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4s9f
1792    IS 1E1425       -29.0     0.     -41.5 FIXEDHF     0.700  0       0.0  0
1793    IT 2D1425         3.7     0.       5.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4s10f
1794    IT 1E1425       -25.5     0.     -36.5 FIXEDHF     0.700  0       0.0  0
1795    IU 2D1425         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4s11f
1796    IU 1E1425       -22.8     0.     -32.5 FIXEDHF     0.700  0       0.0  0
1797    IV 2D1425         2.4     0.       3.4 FIXEDHF     0.700  0       0.0  0  3d10p     -4s12f
1798    IV 1E1425       -20.4     0.     -29.1 FIXEDHF     0.700  0       0.0  0
1799    IW 2D1425         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0  3d10p     -4s13f
1800    IW 1E1425       -18.4     0.     -26.3 FIXEDHF     0.700  0       0.0  0
1801    IX 2D1425         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4s14f
1802    IX 1E1425       -16.7     0.     -23.8 FIXEDHF     0.700  0       0.0  0
1803    IY 2D1415        -6.0     0.      -8.6 FIXEDHF     0.700  0       0.0  0  3d10p     -3d4f
1804    IY 4D1415         6.9     0.       9.8 FIXEDHF     0.700  0       0.0  0
1805    IY 1E1415        28.2     0.      40.3 FIXEDHF     0.700  0       0.0  0
1806    IY 3E1415        16.2     0.      23.1 FIXEDHF     0.700  0       0.0  0
1807    IZ 2D1415        -5.2     0.      -7.4 FIXEDHF     0.700  0       0.0  0  3d10p     -3d5f
1808    IZ 4D1415         7.3     0.      10.4 FIXEDHF     0.700  0       0.0  0
1809    IZ 1E1415        25.7     0.      36.7 FIXEDHF     0.700  0       0.0  0
1810    IZ 3E1415        15.0     0.      21.5 FIXEDHF     0.700  0       0.0  0
1811    Ia 2D1415        -4.3     0.      -6.2 FIXEDHF     0.700  0       0.0  0  3d10p     -3d6f
1812    Ia 4D1415         6.7     0.       9.6 FIXEDHF     0.700  0       0.0  0
1813    Ia 1E1415        21.8     0.      31.2 FIXEDHF     0.700  0       0.0  0
1814    Ia 3E1415        12.9     0.      18.4 FIXEDHF     0.700  0       0.0  0
1815    Ib 2D1415        -3.7     0.      -5.3 FIXEDHF     0.700  0       0.0  0  3d10p     -3d7f
1816    Ib 4D1415         5.9     0.       8.5 FIXEDHF     0.700  0       0.0  0
1817    Ib 1E1415        18.5     0.      26.4 FIXEDHF     0.700  0       0.0  0
1818    Ib 3E1415        11.0     0.      15.7 FIXEDHF     0.700  0       0.0  0
1819    Ic 2D1415        -3.3     0.      -4.7 FIXEDHF     0.700  0       0.0  0  3d10p     -3d8f
1820    Ic 4D1415         5.3     0.       7.6 FIXEDHF     0.700  0       0.0  0
1821    Ic 1E1415        15.7     0.      22.5 FIXEDHF     0.700  0       0.0  0
1822    Ic 3E1415         9.4     0.      13.5 FIXEDHF     0.700  0       0.0  0
1823    Id 2D1415        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0  3d10p     -3d9f
1824    Id 4D1415         4.7     0.       6.7 FIXEDHF     0.700  0       0.0  0
1825    Id 1E1415        13.6     0.      19.5 FIXEDHF     0.700  0       0.0  0
1826    Id 3E1415         8.2     0.      11.7 FIXEDHF     0.700  0       0.0  0
1827    Ie 2D1415        -3.4     0.      -4.8 FIXEDHF     0.700  0       0.0  0  3d10p     -3d10f
1828    Ie 4D1415         4.2     0.       6.0 FIXEDHF     0.700  0       0.0  0
1829    Ie 1E1415        11.9     0.      17.0 FIXEDHF     0.700  0       0.0  0
1830    Ie 3E1415         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
1831    If 2D1415        -2.9     0.      -4.1 FIXEDHF     0.700  0       0.0  0  3d10p     -3d11f
1832    If 4D1415         3.7     0.       5.3 FIXEDHF     0.700  0       0.0  0
1833    If 1E1415        10.5     0.      15.0 FIXEDHF     0.700  0       0.0  0
1834    If 3E1415         6.4     0.       9.1 FIXEDHF     0.700  0       0.0  0
1835    Ig 2D1415        -2.4     0.      -3.5 FIXEDHF     0.700  0       0.0  0  3d10p     -3d12f
1836    Ig 4D1415         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
1837    Ig 1E1415         9.4     0.      13.4 FIXEDHF     0.700  0       0.0  0
1838    Ig 3E1415         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0
1839    Ih 2D1415        -2.1     0.      -3.0 FIXEDHF     0.700  0       0.0  0  3d10p     -3d13f
1840    Ih 4D1415         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
1841    Ih 1E1415         8.4     0.      12.0 FIXEDHF     0.700  0       0.0  0
1842    Ih 3E1415         5.1     0.       7.3 FIXEDHF     0.700  0       0.0  0
1843    Ii 2D1415        -1.8     0.      -2.6 FIXEDHF     0.700  0       0.0  0  3d10p     -3d14f
1844    Ii 4D1415         2.8     0.       4.0 FIXEDHF     0.700  0       0.0  0
1845    Ii 1E1415         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0
1846    Ii 3E1415         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0
1847    In 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d10p     -3d6h
1848    In 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1849    Io 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d10p     -3d7h
1850    Io 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1851    Ip 4D1416        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d10p     -3d8h
1852    Ip 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1853    Iq 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d10p     -3d9h
1854    Iq 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1855    Iv 1D1438       249.4     0.     356.3 FIXEDHF     0.700  0       0.0  0  3d10p     -4p4d
1856    Iv 3D1438       106.8     0.     152.5 FIXEDHF     0.700  0       0.0  0
1857    Iv 0E1438       375.7     0.     536.7 FIXEDHF     0.700  0       0.0  0
1858    Iv 2E1438       134.1     0.     191.6 FIXEDHF     0.700  0       0.0  0
1859    Iw 1D1438       166.7     0.     238.1 FIXEDHF     0.700  0       0.0  0  3d10p     -4p5d
1860    Iw 3D1438        47.5     0.      67.9 FIXEDHF     0.700  0       0.0  0
1861    Iw 0E1438       226.3     0.     323.3 FIXEDHF     0.700  0       0.0  0
1862    Iw 2E1438        68.3     0.      97.6 FIXEDHF     0.700  0       0.0  0
1863    Ix 1D1438       118.4     0.     169.2 FIXEDHF     0.700  0       0.0  0  3d10p     -4p6d
1864    Ix 3D1438        23.6     0.      33.7 FIXEDHF     0.700  0       0.0  0
1865    Ix 0E1438       154.7     0.     221.0 FIXEDHF     0.700  0       0.0  0
1866    Ix 2E1438        42.0     0.      60.0 FIXEDHF     0.700  0       0.0  0
1867    Iy 1D1438        89.9     0.     128.4 FIXEDHF     0.700  0       0.0  0  3d10p     -4p7d
1868    Iy 3D1438        12.7     0.      18.1 FIXEDHF     0.700  0       0.0  0
1869    Iy 0E1438       114.1     0.     163.0 FIXEDHF     0.700  0       0.0  0
1870    Iy 2E1438        28.8     0.      41.2 FIXEDHF     0.700  0       0.0  0
1871    Iz 1D1438        73.1     0.     104.5 FIXEDHF     0.700  0       0.0  0  3d10p     -4p8d
1872    Iz 3D1438         7.1     0.      10.2 FIXEDHF     0.700  0       0.0  0
1873    Iz 0E1438        88.6     0.     126.6 FIXEDHF     0.700  0       0.0  0
1874    Iz 2E1438        21.3     0.      30.4 FIXEDHF     0.700  0       0.0  0
1875    JK 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11p     -3d12p
1876    JK 2D1414        51.6     0.      73.7 FIXEDHF     0.700  0       0.0  0
1877    JK 1E1414        25.0     0.      35.7 FIXEDHF     0.700  0       0.0  0
1878    JK 3E1414        20.9     0.      29.8 FIXEDHF     0.700  0       0.0  0
1879    JL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11p     -3d13p
1880    JL 2D1414        44.6     0.      63.7 FIXEDHF     0.700  0       0.0  0
1881    JL 1E1414        21.6     0.      30.9 FIXEDHF     0.700  0       0.0  0
1882    JL 3E1414        18.1     0.      25.8 FIXEDHF     0.700  0       0.0  0
1883    JM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11p     -3d14p
1884    JM 2D1414        39.1     0.      55.8 FIXEDHF     0.700  0       0.0  0
1885    JM 1E1414        19.0     0.      27.1 FIXEDHF     0.700  0       0.0  0
1886    JM 3E1414        15.8     0.      22.6 FIXEDHF     0.700  0       0.0  0
1887    JN 2D1425         8.9     0.      12.7 FIXEDHF     0.700  0       0.0  0  3d11p     -4s4f
1888    JN 1E1425       -44.0     0.     -62.8 FIXEDHF     0.700  0       0.0  0
1889    JO 2D1425         6.8     0.       9.7 FIXEDHF     0.700  0       0.0  0  3d11p     -4s5f
1890    JO 1E1425       -41.9     0.     -59.9 FIXEDHF     0.700  0       0.0  0
1891    JP 2D1425         5.0     0.       7.2 FIXEDHF     0.700  0       0.0  0  3d11p     -4s6f
1892    JP 1E1425       -36.8     0.     -52.5 FIXEDHF     0.700  0       0.0  0
1893    JQ 2D1425         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0  3d11p     -4s7f
1894    JQ 1E1425       -31.8     0.     -45.4 FIXEDHF     0.700  0       0.0  0
1895    JR 2D1425         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0  3d11p     -4s8f
1896    JR 1E1425       -27.6     0.     -39.4 FIXEDHF     0.700  0       0.0  0
1897    JS 2D1425         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0  3d11p     -4s9f
1898    JS 1E1425       -24.1     0.     -34.4 FIXEDHF     0.700  0       0.0  0
1899    JT 2D1425         2.8     0.       4.0 FIXEDHF     0.700  0       0.0  0  3d11p     -4s10f
1900    JT 1E1425       -21.2     0.     -30.3 FIXEDHF     0.700  0       0.0  0
1901    JU 2D1425         2.4     0.       3.4 FIXEDHF     0.700  0       0.0  0  3d11p     -4s11f
1902    JU 1E1425       -18.9     0.     -27.0 FIXEDHF     0.700  0       0.0  0
1903    JV 2D1425         2.0     0.       2.9 FIXEDHF     0.700  0       0.0  0  3d11p     -4s12f
1904    JV 1E1425       -16.9     0.     -24.2 FIXEDHF     0.700  0       0.0  0
1905    JW 2D1425         1.7     0.       2.4 FIXEDHF     0.700  0       0.0  0  3d11p     -4s13f
1906    JW 1E1425       -15.3     0.     -21.8 FIXEDHF     0.700  0       0.0  0
1907    JX 2D1425         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0  3d11p     -4s14f
1908    JX 1E1425       -13.9     0.     -19.8 FIXEDHF     0.700  0       0.0  0
1909    JY 2D1415        -5.1     0.      -7.3 FIXEDHF     0.700  0       0.0  0  3d11p     -3d4f
1910    JY 4D1415         5.5     0.       7.9 FIXEDHF     0.700  0       0.0  0
1911    JY 1E1415        23.4     0.      33.4 FIXEDHF     0.700  0       0.0  0
1912    JY 3E1415        13.4     0.      19.1 FIXEDHF     0.700  0       0.0  0
1913    JZ 2D1415        -4.3     0.      -6.2 FIXEDHF     0.700  0       0.0  0  3d11p     -3d5f
1914    JZ 4D1415         5.9     0.       8.4 FIXEDHF     0.700  0       0.0  0
1915    JZ 1E1415        21.3     0.      30.5 FIXEDHF     0.700  0       0.0  0
1916    JZ 3E1415        12.5     0.      17.8 FIXEDHF     0.700  0       0.0  0
1917    Ja 2D1415        -3.6     0.      -5.1 FIXEDHF     0.700  0       0.0  0  3d11p     -3d6f
1918    Ja 4D1415         5.5     0.       7.8 FIXEDHF     0.700  0       0.0  0
1919    Ja 1E1415        18.1     0.      25.9 FIXEDHF     0.700  0       0.0  0
1920    Ja 3E1415        10.7     0.      15.3 FIXEDHF     0.700  0       0.0  0
1921    Jb 2D1415        -3.0     0.      -4.3 FIXEDHF     0.700  0       0.0  0  3d11p     -3d7f
1922    Jb 4D1415         4.9     0.       7.0 FIXEDHF     0.700  0       0.0  0
1923    Jb 1E1415        15.3     0.      21.9 FIXEDHF     0.700  0       0.0  0
1924    Jb 3E1415         9.1     0.      13.0 FIXEDHF     0.700  0       0.0  0
1925    Jc 2D1415        -2.6     0.      -3.7 FIXEDHF     0.700  0       0.0  0  3d11p     -3d8f
1926    Jc 4D1415         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
1927    Jc 1E1415        13.1     0.      18.7 FIXEDHF     0.700  0       0.0  0
1928    Jc 3E1415         7.8     0.      11.2 FIXEDHF     0.700  0       0.0  0
1929    Jd 2D1415        -2.3     0.      -3.3 FIXEDHF     0.700  0       0.0  0  3d11p     -3d9f
1930    Jd 4D1415         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
1931    Jd 1E1415        11.3     0.      16.2 FIXEDHF     0.700  0       0.0  0
1932    Jd 3E1415         6.8     0.       9.7 FIXEDHF     0.700  0       0.0  0
1933    Je 2D1415        -2.5     0.      -3.6 FIXEDHF     0.700  0       0.0  0  3d11p     -3d10f
1934    Je 4D1415         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0
1935    Je 1E1415         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0
1936    Je 3E1415         5.9     0.       8.5 FIXEDHF     0.700  0       0.0  0
1937    Jf 2D1415        -2.2     0.      -3.2 FIXEDHF     0.700  0       0.0  0  3d11p     -3d11f
1938    Jf 4D1415         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
1939    Jf 1E1415         8.8     0.      12.5 FIXEDHF     0.700  0       0.0  0
1940    Jf 3E1415         5.3     0.       7.5 FIXEDHF     0.700  0       0.0  0
1941    Jg 2D1415        -2.0     0.      -2.8 FIXEDHF     0.700  0       0.0  0  3d11p     -3d12f
1942    Jg 4D1415         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0
1943    Jg 1E1415         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0
1944    Jg 3E1415         4.7     0.       6.7 FIXEDHF     0.700  0       0.0  0
1945    Jh 2D1415        -1.8     0.      -2.5 FIXEDHF     0.700  0       0.0  0  3d11p     -3d13f
1946    Jh 4D1415         2.5     0.       3.6 FIXEDHF     0.700  0       0.0  0
1947    Jh 1E1415         7.0     0.      10.0 FIXEDHF     0.700  0       0.0  0
1948    Jh 3E1415         4.3     0.       6.1 FIXEDHF     0.700  0       0.0  0
1949    Ji 2D1415        -1.5     0.      -2.2 FIXEDHF     0.700  0       0.0  0  3d11p     -3d14f
1950    Ji 4D1415         2.3     0.       3.3 FIXEDHF     0.700  0       0.0  0
1951    Ji 1E1415         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
1952    Ji 3E1415         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
1953    Jn 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11p     -3d6h
1954    Jn 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1955    Jo 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11p     -3d7h
1956    Jo 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1957    Jp 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11p     -3d8h
1958    Jp 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1959    Jq 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11p     -3d9h
1960    Jq 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
1961    Jv 1D1438       208.7     0.     298.2 FIXEDHF     0.700  0       0.0  0  3d11p     -4p4d
1962    Jv 3D1438        90.7     0.     129.6 FIXEDHF     0.700  0       0.0  0
1963    Jv 0E1438       312.4     0.     446.3 FIXEDHF     0.700  0       0.0  0
1964    Jv 2E1438       113.1     0.     161.6 FIXEDHF     0.700  0       0.0  0
1965    Jw 1D1438       139.5     0.     199.3 FIXEDHF     0.700  0       0.0  0  3d11p     -4p5d
1966    Jw 3D1438        41.2     0.      58.8 FIXEDHF     0.700  0       0.0  0
1967    Jw 0E1438       188.4     0.     269.1 FIXEDHF     0.700  0       0.0  0
1968    Jw 2E1438        57.9     0.      82.7 FIXEDHF     0.700  0       0.0  0
1969    Jx 1D1438        98.8     0.     141.2 FIXEDHF     0.700  0       0.0  0  3d11p     -4p6d
1970    Jx 3D1438        20.9     0.      29.8 FIXEDHF     0.700  0       0.0  0
1971    Jx 0E1438       128.8     0.     184.0 FIXEDHF     0.700  0       0.0  0
1972    Jx 2E1438        35.7     0.      51.0 FIXEDHF     0.700  0       0.0  0
1973    Jy 1D1438        74.3     0.     106.1 FIXEDHF     0.700  0       0.0  0  3d11p     -4p7d
1974    Jy 3D1438        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0
1975    Jy 0E1438        95.1     0.     135.8 FIXEDHF     0.700  0       0.0  0
1976    Jy 2E1438        24.6     0.      35.1 FIXEDHF     0.700  0       0.0  0
1977    Jz 1D1438        58.9     0.      84.2 FIXEDHF     0.700  0       0.0  0  3d11p     -4p8d
1978    Jz 3D1438         6.8     0.       9.7 FIXEDHF     0.700  0       0.0  0
1979    Jz 0E1438        73.8     0.     105.5 FIXEDHF     0.700  0       0.0  0
1980    Jz 2E1438        18.2     0.      26.0 FIXEDHF     0.700  0       0.0  0
1981    KL 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d12p     -3d13p
1982    KL 2D1414        38.2     0.      54.6 FIXEDHF     0.700  0       0.0  0
1983    KL 1E1414        18.4     0.      26.3 FIXEDHF     0.700  0       0.0  0
1984    KL 3E1414        15.4     0.      22.0 FIXEDHF     0.700  0       0.0  0
1985    KM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d12p     -3d14p
1986    KM 2D1414        33.5     0.      47.8 FIXEDHF     0.700  0       0.0  0
1987    KM 1E1414        16.1     0.      23.0 FIXEDHF     0.700  0       0.0  0
1988    KM 3E1414        13.5     0.      19.3 FIXEDHF     0.700  0       0.0  0
1989    KN 2D1425         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0  3d12p     -4s4f
1990    KN 1E1425       -37.2     0.     -53.2 FIXEDHF     0.700  0       0.0  0
1991    KO 2D1425         5.9     0.       8.4 FIXEDHF     0.700  0       0.0  0  3d12p     -4s5f
1992    KO 1E1425       -35.5     0.     -50.7 FIXEDHF     0.700  0       0.0  0
1993    KP 2D1425         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0  3d12p     -4s6f
1994    KP 1E1425       -31.1     0.     -44.5 FIXEDHF     0.700  0       0.0  0
1995    KQ 2D1425         3.3     0.       4.7 FIXEDHF     0.700  0       0.0  0  3d12p     -4s7f
1996    KQ 1E1425       -26.9     0.     -38.5 FIXEDHF     0.700  0       0.0  0
1997    KR 2D1425         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0  3d12p     -4s8f
1998    KR 1E1425       -23.4     0.     -33.4 FIXEDHF     0.700  0       0.0  0
1999    KS 2D1425         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0  3d12p     -4s9f
2000    KS 1E1425       -20.4     0.     -29.2 FIXEDHF     0.700  0       0.0  0
2001    KT 2D1425         1.8     0.       2.5 FIXEDHF     0.700  0       0.0  0  3d12p     -4s10f
2002    KT 1E1425       -18.0     0.     -25.7 FIXEDHF     0.700  0       0.0  0
2003    KU 2D1425         1.9     0.       2.7 FIXEDHF     0.700  0       0.0  0  3d12p     -4s11f
2004    KU 1E1425       -16.0     0.     -22.9 FIXEDHF     0.700  0       0.0  0
2005    KV 2D1425         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0  3d12p     -4s12f
2006    KV 1E1425       -14.3     0.     -20.5 FIXEDHF     0.700  0       0.0  0
2007    KW 2D1425         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0  3d12p     -4s13f
2008    KW 1E1425       -12.9     0.     -18.5 FIXEDHF     0.700  0       0.0  0
2009    KX 2D1425         1.2     0.       1.7 FIXEDHF     0.700  0       0.0  0  3d12p     -4s14f
2010    KX 1E1425       -11.8     0.     -16.8 FIXEDHF     0.700  0       0.0  0
2011    KY 2D1415        -4.4     0.      -6.3 FIXEDHF     0.700  0       0.0  0  3d12p     -3d4f
2012    KY 4D1415         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0
2013    KY 1E1415        19.8     0.      28.3 FIXEDHF     0.700  0       0.0  0
2014    KY 3E1415        11.3     0.      16.2 FIXEDHF     0.700  0       0.0  0
2015    KZ 2D1415        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0  3d12p     -3d5f
2016    KZ 4D1415         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0
2017    KZ 1E1415        18.1     0.      25.8 FIXEDHF     0.700  0       0.0  0
2018    KZ 3E1415        10.6     0.      15.1 FIXEDHF     0.700  0       0.0  0
2019    Ka 2D1415        -3.1     0.      -4.4 FIXEDHF     0.700  0       0.0  0  3d12p     -3d6f
2020    Ka 4D1415         4.5     0.       6.5 FIXEDHF     0.700  0       0.0  0
2021    Ka 1E1415        15.3     0.      21.9 FIXEDHF     0.700  0       0.0  0
2022    Ka 3E1415         9.1     0.      13.0 FIXEDHF     0.700  0       0.0  0
2023    Kb 2D1415        -2.5     0.      -3.6 FIXEDHF     0.700  0       0.0  0  3d12p     -3d7f
2024    Kb 4D1415         4.1     0.       5.8 FIXEDHF     0.700  0       0.0  0
2025    Kb 1E1415        13.0     0.      18.6 FIXEDHF     0.700  0       0.0  0
2026    Kb 3E1415         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0
2027    Kc 2D1415        -2.2     0.      -3.1 FIXEDHF     0.700  0       0.0  0  3d12p     -3d8f
2028    Kc 4D1415         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
2029    Kc 1E1415        11.1     0.      15.9 FIXEDHF     0.700  0       0.0  0
2030    Kc 3E1415         6.6     0.       9.5 FIXEDHF     0.700  0       0.0  0
2031    Kd 2D1415        -1.9     0.      -2.7 FIXEDHF     0.700  0       0.0  0  3d12p     -3d9f
2032    Kd 4D1415         3.2     0.       4.6 FIXEDHF     0.700  0       0.0  0
2033    Kd 1E1415         9.6     0.      13.7 FIXEDHF     0.700  0       0.0  0
2034    Kd 3E1415         5.7     0.       8.2 FIXEDHF     0.700  0       0.0  0
2035    Ke 2D1415        -1.7     0.      -2.4 FIXEDHF     0.700  0       0.0  0  3d12p     -3d10f
2036    Ke 4D1415         2.9     0.       4.1 FIXEDHF     0.700  0       0.0  0
2037    Ke 1E1415         8.4     0.      12.0 FIXEDHF     0.700  0       0.0  0
2038    Ke 3E1415         5.0     0.       7.2 FIXEDHF     0.700  0       0.0  0
2039    Kf 2D1415        -1.8     0.      -2.5 FIXEDHF     0.700  0       0.0  0  3d12p     -3d11f
2040    Kf 4D1415         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0
2041    Kf 1E1415         7.4     0.      10.6 FIXEDHF     0.700  0       0.0  0
2042    Kf 3E1415         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0
2043    Kg 2D1415        -1.6     0.      -2.3 FIXEDHF     0.700  0       0.0  0  3d12p     -3d12f
2044    Kg 4D1415         2.3     0.       3.3 FIXEDHF     0.700  0       0.0  0
2045    Kg 1E1415         6.6     0.       9.4 FIXEDHF     0.700  0       0.0  0
2046    Kg 3E1415         4.0     0.       5.7 FIXEDHF     0.700  0       0.0  0
2047    Kh 2D1415        -1.4     0.      -2.0 FIXEDHF     0.700  0       0.0  0  3d12p     -3d13f
2048    Kh 4D1415         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0
2049    Kh 1E1415         5.9     0.       8.5 FIXEDHF     0.700  0       0.0  0
2050    Kh 3E1415         3.6     0.       5.1 FIXEDHF     0.700  0       0.0  0
2051    Ki 2D1415        -1.3     0.      -1.8 FIXEDHF     0.700  0       0.0  0  3d12p     -3d14f
2052    Ki 4D1415         1.9     0.       2.7 FIXEDHF     0.700  0       0.0  0
2053    Ki 1E1415         5.4     0.       7.7 FIXEDHF     0.700  0       0.0  0
2054    Ki 3E1415         3.2     0.       4.6 FIXEDHF     0.700  0       0.0  0
2055    Kn 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12p     -3d6h
2056    Kn 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2057    Ko 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12p     -3d7h
2058    Ko 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2059    Kp 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12p     -3d8h
2060    Kp 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2061    Kq 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12p     -3d9h
2062    Kq 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2063    Kv 1D1438       178.2     0.     254.6 FIXEDHF     0.700  0       0.0  0  3d12p     -4p4d
2064    Kv 3D1438        78.3     0.     111.8 FIXEDHF     0.700  0       0.0  0
2065    Kv 0E1438       265.2     0.     378.8 FIXEDHF     0.700  0       0.0  0
2066    Kv 2E1438        97.0     0.     138.6 FIXEDHF     0.700  0       0.0  0
2067    Kw 1D1438       119.2     0.     170.3 FIXEDHF     0.700  0       0.0  0  3d12p     -4p5d
2068    Kw 3D1438        35.9     0.      51.3 FIXEDHF     0.700  0       0.0  0
2069    Kw 0E1438       160.0     0.     228.6 FIXEDHF     0.700  0       0.0  0
2070    Kw 2E1438        49.8     0.      71.2 FIXEDHF     0.700  0       0.0  0
2071    Kx 1D1438        84.3     0.     120.4 FIXEDHF     0.700  0       0.0  0  3d12p     -4p6d
2072    Kx 3D1438        18.5     0.      26.5 FIXEDHF     0.700  0       0.0  0
2073    Kx 0E1438       109.4     0.     156.3 FIXEDHF     0.700  0       0.0  0
2074    Kx 2E1438        30.8     0.      44.0 FIXEDHF     0.700  0       0.0  0
2075    Ky 1D1438        63.1     0.      90.1 FIXEDHF     0.700  0       0.0  0  3d12p     -4p7d
2076    Ky 3D1438        10.4     0.      14.9 FIXEDHF     0.700  0       0.0  0
2077    Ky 0E1438        80.8     0.     115.4 FIXEDHF     0.700  0       0.0  0
2078    Ky 2E1438        21.3     0.      30.4 FIXEDHF     0.700  0       0.0  0
2079    Kz 1D1438        49.6     0.      70.9 FIXEDHF     0.700  0       0.0  0  3d12p     -4p8d
2080    Kz 3D1438         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
2081    Kz 0E1438        62.7     0.      89.6 FIXEDHF     0.700  0       0.0  0
2082    Kz 2E1438        15.7     0.      22.5 FIXEDHF     0.700  0       0.0  0
2083    LM 0D1414         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d13p     -3d14p
2084    LM 2D1414        29.0     0.      41.5 FIXEDHF     0.700  0       0.0  0
2085    LM 1E1414        13.9     0.      19.9 FIXEDHF     0.700  0       0.0  0
2086    LM 3E1414        11.7     0.      16.7 FIXEDHF     0.700  0       0.0  0
2087    LN 2D1425         6.7     0.       9.6 FIXEDHF     0.700  0       0.0  0  3d13p     -4s4f
2088    LN 1E1425       -32.1     0.     -45.8 FIXEDHF     0.700  0       0.0  0
2089    LO 2D1425         5.2     0.       7.4 FIXEDHF     0.700  0       0.0  0  3d13p     -4s5f
2090    LO 1E1425       -30.6     0.     -43.7 FIXEDHF     0.700  0       0.0  0
2091    LP 2D1425         3.8     0.       5.4 FIXEDHF     0.700  0       0.0  0  3d13p     -4s6f
2092    LP 1E1425       -26.8     0.     -38.3 FIXEDHF     0.700  0       0.0  0
2093    LQ 2D1425         2.9     0.       4.1 FIXEDHF     0.700  0       0.0  0  3d13p     -4s7f
2094    LQ 1E1425       -23.2     0.     -33.1 FIXEDHF     0.700  0       0.0  0
2095    LR 2D1425         2.2     0.       3.2 FIXEDHF     0.700  0       0.0  0  3d13p     -4s8f
2096    LR 1E1425       -20.2     0.     -28.8 FIXEDHF     0.700  0       0.0  0
2097    LS 2D1425         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0  3d13p     -4s9f
2098    LS 1E1425       -17.6     0.     -25.1 FIXEDHF     0.700  0       0.0  0
2099    LT 2D1425         1.5     0.       2.2 FIXEDHF     0.700  0       0.0  0  3d13p     -4s10f
2100    LT 1E1425       -15.5     0.     -22.2 FIXEDHF     0.700  0       0.0  0
2101    LU 2D1425         1.3     0.       1.8 FIXEDHF     0.700  0       0.0  0  3d13p     -4s11f
2102    LU 1E1425       -13.8     0.     -19.7 FIXEDHF     0.700  0       0.0  0
2103    LV 2D1425         1.3     0.       1.9 FIXEDHF     0.700  0       0.0  0  3d13p     -4s12f
2104    LV 1E1425       -12.4     0.     -17.7 FIXEDHF     0.700  0       0.0  0
2105    LW 2D1425         1.2     0.       1.7 FIXEDHF     0.700  0       0.0  0  3d13p     -4s13f
2106    LW 1E1425       -11.1     0.     -15.9 FIXEDHF     0.700  0       0.0  0
2107    LX 2D1425         1.1     0.       1.5 FIXEDHF     0.700  0       0.0  0  3d13p     -4s14f
2108    LX 1E1425       -10.1     0.     -14.5 FIXEDHF     0.700  0       0.0  0
2109    LY 2D1415        -3.8     0.      -5.5 FIXEDHF     0.700  0       0.0  0  3d13p     -3d4f
2110    LY 4D1415         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
2111    LY 1E1415        17.1     0.      24.4 FIXEDHF     0.700  0       0.0  0
2112    LY 3E1415         9.8     0.      14.0 FIXEDHF     0.700  0       0.0  0
2113    LZ 2D1415        -3.3     0.      -4.7 FIXEDHF     0.700  0       0.0  0  3d13p     -3d5f
2114    LZ 4D1415         4.2     0.       6.0 FIXEDHF     0.700  0       0.0  0
2115    LZ 1E1415        15.6     0.      22.3 FIXEDHF     0.700  0       0.0  0
2116    LZ 3E1415         9.1     0.      13.0 FIXEDHF     0.700  0       0.0  0
2117    La 2D1415        -2.7     0.      -3.8 FIXEDHF     0.700  0       0.0  0  3d13p     -3d6f
2118    La 4D1415         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
2119    La 1E1415        13.2     0.      18.9 FIXEDHF     0.700  0       0.0  0
2120    La 3E1415         7.8     0.      11.2 FIXEDHF     0.700  0       0.0  0
2121    Lb 2D1415        -2.2     0.      -3.2 FIXEDHF     0.700  0       0.0  0  3d13p     -3d7f
2122    Lb 4D1415         3.5     0.       5.0 FIXEDHF     0.700  0       0.0  0
2123    Lb 1E1415        11.2     0.      16.0 FIXEDHF     0.700  0       0.0  0
2124    Lb 3E1415         6.6     0.       9.5 FIXEDHF     0.700  0       0.0  0
2125    Lc 2D1415        -1.9     0.      -2.7 FIXEDHF     0.700  0       0.0  0  3d13p     -3d8f
2126    Lc 4D1415         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
2127    Lc 1E1415         9.6     0.      13.7 FIXEDHF     0.700  0       0.0  0
2128    Lc 3E1415         5.7     0.       8.2 FIXEDHF     0.700  0       0.0  0
2129    Ld 2D1415        -1.6     0.      -2.3 FIXEDHF     0.700  0       0.0  0  3d13p     -3d9f
2130    Ld 4D1415         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0
2131    Ld 1E1415         8.3     0.      11.8 FIXEDHF     0.700  0       0.0  0
2132    Ld 3E1415         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0
2133    Le 2D1415        -1.4     0.      -2.0 FIXEDHF     0.700  0       0.0  0  3d13p     -3d10f
2134    Le 4D1415         2.4     0.       3.5 FIXEDHF     0.700  0       0.0  0
2135    Le 1E1415         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
2136    Le 3E1415         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
2137    Lf 2D1415        -1.3     0.      -1.8 FIXEDHF     0.700  0       0.0  0  3d13p     -3d11f
2138    Lf 4D1415         2.2     0.       3.1 FIXEDHF     0.700  0       0.0  0
2139    Lf 1E1415         6.4     0.       9.1 FIXEDHF     0.700  0       0.0  0
2140    Lf 3E1415         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
2141    Lg 2D1415        -1.3     0.      -1.8 FIXEDHF     0.700  0       0.0  0  3d13p     -3d12f
2142    Lg 4D1415         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0
2143    Lg 1E1415         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0
2144    Lg 3E1415         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0
2145    Lh 2D1415        -1.1     0.      -1.6 FIXEDHF     0.700  0       0.0  0  3d13p     -3d13f
2146    Lh 4D1415         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0
2147    Lh 1E1415         5.1     0.       7.3 FIXEDHF     0.700  0       0.0  0
2148    Lh 3E1415         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
2149    Li 2D1415        -1.1     0.      -1.5 FIXEDHF     0.700  0       0.0  0  3d13p     -3d14f
2150    Li 4D1415         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0
2151    Li 1E1415         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0
2152    Li 3E1415         2.8     0.       4.0 FIXEDHF     0.700  0       0.0  0
2153    Ln 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13p     -3d6h
2154    Ln 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2155    Lo 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13p     -3d7h
2156    Lo 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2157    Lp 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13p     -3d8h
2158    Lp 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2159    Lq 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13p     -3d9h
2160    Lq 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2161    Lv 1D1438       154.6     0.     220.8 FIXEDHF     0.700  0       0.0  0  3d13p     -4p4d
2162    Lv 3D1438        68.5     0.      97.8 FIXEDHF     0.700  0       0.0  0
2163    Lv 0E1438       228.7     0.     326.7 FIXEDHF     0.700  0       0.0  0
2164    Lv 2E1438        84.4     0.     120.6 FIXEDHF     0.700  0       0.0  0
2165    Lw 1D1438       103.5     0.     147.8 FIXEDHF     0.700  0       0.0  0  3d13p     -4p5d
2166    Lw 3D1438        31.7     0.      45.3 FIXEDHF     0.700  0       0.0  0
2167    Lw 0E1438       138.1     0.     197.3 FIXEDHF     0.700  0       0.0  0
2168    Lw 2E1438        43.5     0.      62.2 FIXEDHF     0.700  0       0.0  0
2169    Lx 1D1438        73.1     0.     104.5 FIXEDHF     0.700  0       0.0  0  3d13p     -4p6d
2170    Lx 3D1438        16.6     0.      23.7 FIXEDHF     0.700  0       0.0  0
2171    Lx 0E1438        94.5     0.     135.0 FIXEDHF     0.700  0       0.0  0
2172    Lx 2E1438        26.9     0.      38.5 FIXEDHF     0.700  0       0.0  0
2173    Ly 1D1438        54.6     0.      78.0 FIXEDHF     0.700  0       0.0  0  3d13p     -4p7d
2174    Ly 3D1438         9.4     0.      13.5 FIXEDHF     0.700  0       0.0  0
2175    Ly 0E1438        69.7     0.      99.6 FIXEDHF     0.700  0       0.0  0
2176    Ly 2E1438        18.6     0.      26.6 FIXEDHF     0.700  0       0.0  0
2177    Lz 1D1438        42.8     0.      61.1 FIXEDHF     0.700  0       0.0  0  3d13p     -4p8d
2178    Lz 3D1438         5.8     0.       8.3 FIXEDHF     0.700  0       0.0  0
2179    Lz 0E1438        54.2     0.      77.4 FIXEDHF     0.700  0       0.0  0
2180    Lz 2E1438        13.8     0.      19.7 FIXEDHF     0.700  0       0.0  0
2181    MN 2D1425         5.9     0.       8.5 FIXEDHF     0.700  0       0.0  0  3d14p     -4s4f
2182    MN 1E1425       -28.0     0.     -40.0 FIXEDHF     0.700  0       0.0  0
2183    MO 2D1425         4.6     0.       6.6 FIXEDHF     0.700  0       0.0  0  3d14p     -4s5f
2184    MO 1E1425       -26.7     0.     -38.2 FIXEDHF     0.700  0       0.0  0
2185    MP 2D1425         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0  3d14p     -4s6f
2186    MP 1E1425       -23.4     0.     -33.5 FIXEDHF     0.700  0       0.0  0
2187    MQ 2D1425         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0  3d14p     -4s7f
2188    MQ 1E1425       -20.2     0.     -28.9 FIXEDHF     0.700  0       0.0  0
2189    MR 2D1425         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0  3d14p     -4s8f
2190    MR 1E1425       -17.6     0.     -25.1 FIXEDHF     0.700  0       0.0  0
2191    MS 2D1425         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0  3d14p     -4s9f
2192    MS 1E1425       -15.4     0.     -22.0 FIXEDHF     0.700  0       0.0  0
2193    MT 2D1425         1.3     0.       1.9 FIXEDHF     0.700  0       0.0  0  3d14p     -4s10f
2194    MT 1E1425       -13.6     0.     -19.4 FIXEDHF     0.700  0       0.0  0
2195    MU 2D1425         1.1     0.       1.6 FIXEDHF     0.700  0       0.0  0  3d14p     -4s11f
2196    MU 1E1425       -12.0     0.     -17.2 FIXEDHF     0.700  0       0.0  0
2197    MV 2D1425         1.0     0.       1.4 FIXEDHF     0.700  0       0.0  0  3d14p     -4s12f
2198    MV 1E1425       -10.8     0.     -15.4 FIXEDHF     0.700  0       0.0  0
2199    MW 2D1425         1.0     0.       1.4 FIXEDHF     0.700  0       0.0  0  3d14p     -4s13f
2200    MW 1E1425        -9.7     0.     -13.9 FIXEDHF     0.700  0       0.0  0
2201    MX 2D1425         0.8     0.       1.2 FIXEDHF     0.700  0       0.0  0  3d14p     -4s14f
2202    MX 1E1425        -8.8     0.     -12.6 FIXEDHF     0.700  0       0.0  0
2203    MY 2D1415        -3.4     0.      -4.9 FIXEDHF     0.700  0       0.0  0  3d14p     -3d4f
2204    MY 4D1415         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
2205    MY 1E1415        14.9     0.      21.3 FIXEDHF     0.700  0       0.0  0
2206    MY 3E1415         8.5     0.      12.2 FIXEDHF     0.700  0       0.0  0
2207    MZ 2D1415        -2.9     0.      -4.2 FIXEDHF     0.700  0       0.0  0  3d14p     -3d5f
2208    MZ 4D1415         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
2209    MZ 1E1415        13.6     0.      19.4 FIXEDHF     0.700  0       0.0  0
2210    MZ 3E1415         7.9     0.      11.3 FIXEDHF     0.700  0       0.0  0
2211    Ma 2D1415        -2.4     0.      -3.4 FIXEDHF     0.700  0       0.0  0  3d14p     -3d6f
2212    Ma 4D1415         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
2213    Ma 1E1415        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0
2214    Ma 3E1415         6.9     0.       9.8 FIXEDHF     0.700  0       0.0  0
2215    Mb 2D1415        -2.0     0.      -2.8 FIXEDHF     0.700  0       0.0  0  3d14p     -3d7f
2216    Mb 4D1415         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
2217    Mb 1E1415         9.8     0.      14.0 FIXEDHF     0.700  0       0.0  0
2218    Mb 3E1415         5.8     0.       8.3 FIXEDHF     0.700  0       0.0  0
2219    Mc 2D1415        -1.6     0.      -2.3 FIXEDHF     0.700  0       0.0  0  3d14p     -3d8f
2220    Mc 4D1415         2.7     0.       3.8 FIXEDHF     0.700  0       0.0  0
2221    Mc 1E1415         8.4     0.      12.0 FIXEDHF     0.700  0       0.0  0
2222    Mc 3E1415         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0
2223    Md 2D1415        -1.4     0.      -2.0 FIXEDHF     0.700  0       0.0  0  3d14p     -3d9f
2224    Md 4D1415         2.4     0.       3.4 FIXEDHF     0.700  0       0.0  0
2225    Md 1E1415         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
2226    Md 3E1415         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
2227    Me 2D1415        -1.2     0.      -1.7 FIXEDHF     0.700  0       0.0  0  3d14p     -3d10f
2228    Me 4D1415         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0
2229    Me 1E1415         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
2230    Me 3E1415         3.8     0.       5.4 FIXEDHF     0.700  0       0.0  0
2231    Mf 2D1415        -1.1     0.      -1.5 FIXEDHF     0.700  0       0.0  0  3d14p     -3d11f
2232    Mf 4D1415         1.9     0.       2.7 FIXEDHF     0.700  0       0.0  0
2233    Mf 1E1415         5.6     0.       8.0 FIXEDHF     0.700  0       0.0  0
2234    Mf 3E1415         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
2235    Mg 2D1415        -1.0     0.      -1.4 FIXEDHF     0.700  0       0.0  0  3d14p     -3d12f
2236    Mg 4D1415         1.7     0.       2.4 FIXEDHF     0.700  0       0.0  0
2237    Mg 1E1415         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0
2238    Mg 3E1415         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
2239    Mh 2D1415        -1.0     0.      -1.4 FIXEDHF     0.700  0       0.0  0  3d14p     -3d13f
2240    Mh 4D1415         1.5     0.       2.2 FIXEDHF     0.700  0       0.0  0
2241    Mh 1E1415         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0
2242    Mh 3E1415         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0
2243    Mi 2D1415        -0.9     0.      -1.3 FIXEDHF     0.700  0       0.0  0  3d14p     -3d14f
2244    Mi 4D1415         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0
2245    Mi 1E1415         4.1     0.       5.8 FIXEDHF     0.700  0       0.0  0
2246    Mi 3E1415         2.4     0.       3.5 FIXEDHF     0.700  0       0.0  0
2247    Mn 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14p     -3d6h
2248    Mn 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2249    Mo 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14p     -3d7h
2250    Mo 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2251    Mp 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14p     -3d8h
2252    Mp 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2253    Mq 4D1416        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14p     -3d9h
2254    Mq 3E1416         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
2255    Mv 1D1438       135.7     0.     193.9 FIXEDHF     0.700  0       0.0  0  3d14p     -4p4d
2256    Mv 3D1438        60.5     0.      86.4 FIXEDHF     0.700  0       0.0  0
2257    Mv 0E1438       199.8     0.     285.5 FIXEDHF     0.700  0       0.0  0
2258    Mv 2E1438        74.3     0.     106.1 FIXEDHF     0.700  0       0.0  0
2259    Mw 1D1438        90.9     0.     129.9 FIXEDHF     0.700  0       0.0  0  3d14p     -4p5d
2260    Mw 3D1438        28.3     0.      40.4 FIXEDHF     0.700  0       0.0  0
2261    Mw 0E1438       120.7     0.     172.5 FIXEDHF     0.700  0       0.0  0
2262    Mw 2E1438        38.4     0.      54.8 FIXEDHF     0.700  0       0.0  0
2263    Mx 1D1438        64.3     0.      91.8 FIXEDHF     0.700  0       0.0  0  3d14p     -4p6d
2264    Mx 3D1438        14.9     0.      21.3 FIXEDHF     0.700  0       0.0  0
2265    Mx 0E1438        82.7     0.     118.1 FIXEDHF     0.700  0       0.0  0
2266    Mx 2E1438        23.8     0.      34.0 FIXEDHF     0.700  0       0.0  0
2267    My 1D1438        47.9     0.      68.5 FIXEDHF     0.700  0       0.0  0  3d14p     -4p7d
2268    My 3D1438         8.6     0.      12.3 FIXEDHF     0.700  0       0.0  0
2269    My 0E1438        61.0     0.      87.1 FIXEDHF     0.700  0       0.0  0
2270    My 2E1438        16.4     0.      23.5 FIXEDHF     0.700  0       0.0  0
2271    Mz 1D1438        37.4     0.      53.5 FIXEDHF     0.700  0       0.0  0  3d14p     -4p8d
2272    Mz 3D1438         5.3     0.       7.6 FIXEDHF     0.700  0       0.0  0
2273    Mz 0E1438        47.4     0.      67.7 FIXEDHF     0.700  0       0.0  0
2274    Mz 2E1438        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
2275    NO 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s5f
2276    NO 3E2525        74.3     0.     106.1 FIXEDHF     0.700  0       0.0  0
2277    NP 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s6f
2278    NP 3E2525        63.6     0.      90.8 FIXEDHF     0.700  0       0.0  0
2279    NQ 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s7f
2280    NQ 3E2525        54.1     0.      77.3 FIXEDHF     0.700  0       0.0  0
2281    NR 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s8f
2282    NR 3E2525        46.5     0.      66.4 FIXEDHF     0.700  0       0.0  0
2283    NS 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s9f
2284    NS 3E2525        40.3     0.      57.6 FIXEDHF     0.700  0       0.0  0
2285    NT 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s10f
2286    NT 3E2525        35.3     0.      50.5 FIXEDHF     0.700  0       0.0  0
2287    NU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s11f
2288    NU 3E2525        31.3     0.      44.7 FIXEDHF     0.700  0       0.0  0
2289    NV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s12f
2290    NV 3E2525        27.9     0.      39.9 FIXEDHF     0.700  0       0.0  0
2291    NW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s13f
2292    NW 3E2525        25.1     0.      35.9 FIXEDHF     0.700  0       0.0  0
2293    NX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s4f      -4s14f
2294    NX 3E2525        22.8     0.      32.5 FIXEDHF     0.700  0       0.0  0
2295    NY 2D2515      -542.2     0.    -774.6 FIXEDHF     0.700  0       0.0  0  4s4f      -3d4f
2296    NY 3E2515       -43.0     0.     -61.5 FIXEDHF     0.700  0       0.0  0
2297    NZ 2D2515      -316.3     0.    -451.9 FIXEDHF     0.700  0       0.0  0  4s4f      -3d5f
2298    NZ 3E2515       -38.1     0.     -54.5 FIXEDHF     0.700  0       0.0  0
2299    Na 2D2515      -223.0     0.    -318.6 FIXEDHF     0.700  0       0.0  0  4s4f      -3d6f
2300    Na 3E2515       -31.9     0.     -45.6 FIXEDHF     0.700  0       0.0  0
2301    Nb 2D2515      -170.1     0.    -243.0 FIXEDHF     0.700  0       0.0  0  4s4f      -3d7f
2302    Nb 3E2515       -26.7     0.     -38.2 FIXEDHF     0.700  0       0.0  0
2303    Nc 2D2515      -135.9     0.    -194.2 FIXEDHF     0.700  0       0.0  0  4s4f      -3d8f
2304    Nc 3E2515       -22.7     0.     -32.4 FIXEDHF     0.700  0       0.0  0
2305    Nd 2D2515      -112.2     0.    -160.3 FIXEDHF     0.700  0       0.0  0  4s4f      -3d9f
2306    Nd 3E2515       -19.5     0.     -27.8 FIXEDHF     0.700  0       0.0  0
2307    Ne 2D2515       -94.8     0.    -135.5 FIXEDHF     0.700  0       0.0  0  4s4f      -3d10f
2308    Ne 3E2515       -16.9     0.     -24.2 FIXEDHF     0.700  0       0.0  0
2309    Nf 2D2515       -81.6     0.    -116.6 FIXEDHF     0.700  0       0.0  0  4s4f      -3d11f
2310    Nf 3E2515       -14.9     0.     -21.3 FIXEDHF     0.700  0       0.0  0
2311    Ng 2D2515       -71.3     0.    -101.8 FIXEDHF     0.700  0       0.0  0  4s4f      -3d12f
2312    Ng 3E2515       -13.3     0.     -19.0 FIXEDHF     0.700  0       0.0  0
2313    Nh 2D2515       -62.9     0.     -89.9 FIXEDHF     0.700  0       0.0  0  4s4f      -3d13f
2314    Nh 3E2515       -11.9     0.     -17.0 FIXEDHF     0.700  0       0.0  0
2315    Ni 2D2515       -56.2     0.     -80.3 FIXEDHF     0.700  0       0.0  0  4s4f      -3d14f
2316    Ni 3E2515       -10.7     0.     -15.3 FIXEDHF     0.700  0       0.0  0
2317    Nn 2D2516       -64.0     0.     -91.4 FIXEDHF     0.700  0       0.0  0  4s4f      -3d6h
2318    Nn 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2319    No 2D2516       -62.2     0.     -88.9 FIXEDHF     0.700  0       0.0  0  4s4f      -3d7h
2320    No 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2321    Np 2D2516       -55.5     0.     -79.3 FIXEDHF     0.700  0       0.0  0  4s4f      -3d8h
2322    Np 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2323    Nq 2D2516       -48.8     0.     -69.7 FIXEDHF     0.700  0       0.0  0  4s4f      -3d9h
2324    Nq 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2325    Nv 1D2538      3212.2     0.    4588.8 FIXEDHF     0.700  0       0.0  0  4s4f      -4p4d
2326    Nv 2E2538       213.2     0.     304.6 FIXEDHF     0.700  0       0.0  0
2327    Nw 1D2538       198.2     0.     283.1 FIXEDHF     0.700  0       0.0  0  4s4f      -4p5d
2328    Nw 2E2538       181.1     0.     258.7 FIXEDHF     0.700  0       0.0  0
2329    Nx 1D2538       152.1     0.     217.3 FIXEDHF     0.700  0       0.0  0  4s4f      -4p6d
2330    Nx 2E2538       141.3     0.     201.9 FIXEDHF     0.700  0       0.0  0
2331    Ny 1D2538        98.3     0.     140.4 FIXEDHF     0.700  0       0.0  0  4s4f      -4p7d
2332    Ny 2E2538       111.6     0.     159.5 FIXEDHF     0.700  0       0.0  0
2333    Nz 1D2538        67.5     0.      96.5 FIXEDHF     0.700  0       0.0  0  4s4f      -4p8d
2334    Nz 2E2538        90.3     0.     129.0 FIXEDHF     0.700  0       0.0  0
2335    OP 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s6f
2336    OP 3E2525        58.5     0.      83.6 FIXEDHF     0.700  0       0.0  0
2337    OQ 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s7f
2338    OQ 3E2525        49.9     0.      71.3 FIXEDHF     0.700  0       0.0  0
2339    OR 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s8f
2340    OR 3E2525        42.9     0.      61.3 FIXEDHF     0.700  0       0.0  0
2341    OS 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s9f
2342    OS 3E2525        37.2     0.      53.2 FIXEDHF     0.700  0       0.0  0
2343    OT 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s10f
2344    OT 3E2525        32.6     0.      46.6 FIXEDHF     0.700  0       0.0  0
2345    OU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s11f
2346    OU 3E2525        28.9     0.      41.3 FIXEDHF     0.700  0       0.0  0
2347    OV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s12f
2348    OV 3E2525        25.8     0.      36.9 FIXEDHF     0.700  0       0.0  0
2349    OW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s13f
2350    OW 3E2525        23.2     0.      33.2 FIXEDHF     0.700  0       0.0  0
2351    OX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4s14f
2352    OX 3E2525        21.0     0.      30.0 FIXEDHF     0.700  0       0.0  0
2353    OY 2D2515      -317.2     0.    -453.1 FIXEDHF     0.700  0       0.0  0  4s5f      -3d4f
2354    OY 3E2515       -39.5     0.     -56.4 FIXEDHF     0.700  0       0.0  0
2355    OZ 2D2515      -282.3     0.    -403.3 FIXEDHF     0.700  0       0.0  0  4s5f      -3d5f
2356    OZ 3E2515       -35.1     0.     -50.1 FIXEDHF     0.700  0       0.0  0
2357    Oa 2D2515      -198.9     0.    -284.2 FIXEDHF     0.700  0       0.0  0  4s5f      -3d6f
2358    Oa 3E2515       -29.4     0.     -42.0 FIXEDHF     0.700  0       0.0  0
2359    Ob 2D2515      -152.6     0.    -218.0 FIXEDHF     0.700  0       0.0  0  4s5f      -3d7f
2360    Ob 3E2515       -24.6     0.     -35.2 FIXEDHF     0.700  0       0.0  0
2361    Oc 2D2515      -122.4     0.    -174.9 FIXEDHF     0.700  0       0.0  0  4s5f      -3d8f
2362    Oc 3E2515       -20.9     0.     -29.9 FIXEDHF     0.700  0       0.0  0
2363    Od 2D2515      -101.4     0.    -144.8 FIXEDHF     0.700  0       0.0  0  4s5f      -3d9f
2364    Od 3E2515       -18.0     0.     -25.7 FIXEDHF     0.700  0       0.0  0
2365    Oe 2D2515       -85.8     0.    -122.6 FIXEDHF     0.700  0       0.0  0  4s5f      -3d10f
2366    Oe 3E2515       -15.7     0.     -22.4 FIXEDHF     0.700  0       0.0  0
2367    Of 2D2515       -74.0     0.    -105.7 FIXEDHF     0.700  0       0.0  0  4s5f      -3d11f
2368    Of 3E2515       -13.8     0.     -19.7 FIXEDHF     0.700  0       0.0  0
2369    Og 2D2515       -64.7     0.     -92.4 FIXEDHF     0.700  0       0.0  0  4s5f      -3d12f
2370    Og 3E2515       -12.3     0.     -17.5 FIXEDHF     0.700  0       0.0  0
2371    Oh 2D2515       -57.2     0.     -81.7 FIXEDHF     0.700  0       0.0  0  4s5f      -3d13f
2372    Oh 3E2515       -11.0     0.     -15.7 FIXEDHF     0.700  0       0.0  0
2373    Oi 2D2515       -51.1     0.     -73.0 FIXEDHF     0.700  0       0.0  0  4s5f      -3d14f
2374    Oi 3E2515        -9.9     0.     -14.2 FIXEDHF     0.700  0       0.0  0
2375    On 2D2516        15.7     0.      22.5 FIXEDHF     0.700  0       0.0  0  4s5f      -3d6h
2376    On 5E2516        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
2377    Oo 2D2516        -1.5     0.      -2.1 FIXEDHF     0.700  0       0.0  0  4s5f      -3d7h
2378    Oo 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2379    Op 2D2516        -7.8     0.     -11.1 FIXEDHF     0.700  0       0.0  0  4s5f      -3d8h
2380    Op 5E2516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
2381    Oq 2D2516        -9.9     0.     -14.2 FIXEDHF     0.700  0       0.0  0  4s5f      -3d9h
2382    Oq 5E2516        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
2383    Ov 1D2538      2025.6     0.    2893.7 FIXEDHF     0.700  0       0.0  0  4s5f      -4p4d
2384    Ov 2E2538       181.2     0.     258.9 FIXEDHF     0.700  0       0.0  0
2385    Ow 1D2538      1168.7     0.    1669.6 FIXEDHF     0.700  0       0.0  0  4s5f      -4p5d
2386    Ow 2E2538       158.3     0.     226.1 FIXEDHF     0.700  0       0.0  0
2387    Ox 1D2538       116.6     0.     166.6 FIXEDHF     0.700  0       0.0  0  4s5f      -4p6d
2388    Ox 2E2538       124.6     0.     178.0 FIXEDHF     0.700  0       0.0  0
2389    Oy 1D2538       107.8     0.     154.0 FIXEDHF     0.700  0       0.0  0  4s5f      -4p7d
2390    Oy 2E2538        98.8     0.     141.2 FIXEDHF     0.700  0       0.0  0
2391    Oz 1D2538        78.1     0.     111.6 FIXEDHF     0.700  0       0.0  0  4s5f      -4p8d
2392    Oz 2E2538        80.1     0.     114.5 FIXEDHF     0.700  0       0.0  0
2393    PQ 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s7f
2394    PQ 3E2525        42.8     0.      61.2 FIXEDHF     0.700  0       0.0  0
2395    PR 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s8f
2396    PR 3E2525        36.8     0.      52.6 FIXEDHF     0.700  0       0.0  0
2397    PS 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s9f
2398    PS 3E2525        32.0     0.      45.7 FIXEDHF     0.700  0       0.0  0
2399    PT 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s10f
2400    PT 3E2525        28.1     0.      40.1 FIXEDHF     0.700  0       0.0  0
2401    PU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s11f
2402    PU 3E2525        24.8     0.      35.5 FIXEDHF     0.700  0       0.0  0
2403    PV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s12f
2404    PV 3E2525        22.2     0.      31.7 FIXEDHF     0.700  0       0.0  0
2405    PW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s13f
2406    PW 3E2525        19.9     0.      28.5 FIXEDHF     0.700  0       0.0  0
2407    PX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4s14f
2408    PX 3E2525        18.1     0.      25.8 FIXEDHF     0.700  0       0.0  0
2409    PY 2D2515      -224.3     0.    -320.4 FIXEDHF     0.700  0       0.0  0  4s6f      -3d4f
2410    PY 3E2515       -33.8     0.     -48.3 FIXEDHF     0.700  0       0.0  0
2411    PZ 2D2515      -198.9     0.    -284.1 FIXEDHF     0.700  0       0.0  0  4s6f      -3d5f
2412    PZ 3E2515       -30.1     0.     -43.0 FIXEDHF     0.700  0       0.0  0
2413    Pa 2D2515      -166.2     0.    -237.4 FIXEDHF     0.700  0       0.0  0  4s6f      -3d6f
2414    Pa 3E2515       -25.2     0.     -36.0 FIXEDHF     0.700  0       0.0  0
2415    Pb 2D2515      -127.3     0.    -181.9 FIXEDHF     0.700  0       0.0  0  4s6f      -3d7f
2416    Pb 3E2515       -21.1     0.     -30.2 FIXEDHF     0.700  0       0.0  0
2417    Pc 2D2515      -102.5     0.    -146.4 FIXEDHF     0.700  0       0.0  0  4s6f      -3d8f
2418    Pc 3E2515       -18.0     0.     -25.7 FIXEDHF     0.700  0       0.0  0
2419    Pd 2D2515       -85.0     0.    -121.4 FIXEDHF     0.700  0       0.0  0  4s6f      -3d9f
2420    Pd 3E2515       -15.5     0.     -22.1 FIXEDHF     0.700  0       0.0  0
2421    Pe 2D2515       -72.1     0.    -103.0 FIXEDHF     0.700  0       0.0  0  4s6f      -3d10f
2422    Pe 3E2515       -13.4     0.     -19.2 FIXEDHF     0.700  0       0.0  0
2423    Pf 2D2515       -62.2     0.     -88.9 FIXEDHF     0.700  0       0.0  0  4s6f      -3d11f
2424    Pf 3E2515       -11.8     0.     -16.9 FIXEDHF     0.700  0       0.0  0
2425    Pg 2D2515       -54.5     0.     -77.8 FIXEDHF     0.700  0       0.0  0  4s6f      -3d12f
2426    Pg 3E2515       -10.6     0.     -15.1 FIXEDHF     0.700  0       0.0  0
2427    Ph 2D2515       -48.2     0.     -68.8 FIXEDHF     0.700  0       0.0  0  4s6f      -3d13f
2428    Ph 3E2515        -9.4     0.     -13.5 FIXEDHF     0.700  0       0.0  0
2429    Pi 2D2515       -43.0     0.     -61.5 FIXEDHF     0.700  0       0.0  0  4s6f      -3d14f
2430    Pi 3E2515        -8.5     0.     -12.2 FIXEDHF     0.700  0       0.0  0
2431    Pn 2D2516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  4s6f      -3d6h
2432    Pn 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2433    Po 2D2516         7.3     0.      10.4 FIXEDHF     0.700  0       0.0  0  4s6f      -3d7h
2434    Po 5E2516        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
2435    Pp 2D2516         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0  4s6f      -3d8h
2436    Pp 5E2516        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
2437    Pq 2D2516         0.9     0.       1.3 FIXEDHF     0.700  0       0.0  0  4s6f      -3d9h
2438    Pq 5E2516        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
2439    Pv 1D2538      1439.1     0.    2055.8 FIXEDHF     0.700  0       0.0  0  4s6f      -4p4d
2440    Pv 2E2538       148.0     0.     211.5 FIXEDHF     0.700  0       0.0  0
2441    Pw 1D2538       946.8     0.    1352.6 FIXEDHF     0.700  0       0.0  0  4s6f      -4p5d
2442    Pw 2E2538       131.6     0.     188.0 FIXEDHF     0.700  0       0.0  0
2443    Px 1D2538       518.9     0.     741.3 FIXEDHF     0.700  0       0.0  0  4s6f      -4p6d
2444    Px 2E2538       104.2     0.     148.8 FIXEDHF     0.700  0       0.0  0
2445    Py 1D2538        70.4     0.     100.6 FIXEDHF     0.700  0       0.0  0  4s6f      -4p7d
2446    Py 2E2538        82.9     0.     118.4 FIXEDHF     0.700  0       0.0  0
2447    Pz 1D2538        72.8     0.     104.0 FIXEDHF     0.700  0       0.0  0  4s6f      -4p8d
2448    Pz 2E2538        67.3     0.      96.1 FIXEDHF     0.700  0       0.0  0
2449    QR 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s8f
2450    QR 3E2525        31.4     0.      44.9 FIXEDHF     0.700  0       0.0  0
2451    QS 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s9f
2452    QS 3E2525        27.3     0.      39.0 FIXEDHF     0.700  0       0.0  0
2453    QT 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s10f
2454    QT 3E2525        23.9     0.      34.2 FIXEDHF     0.700  0       0.0  0
2455    QU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s11f
2456    QU 3E2525        21.2     0.      30.3 FIXEDHF     0.700  0       0.0  0
2457    QV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s12f
2458    QV 3E2525        19.0     0.      27.1 FIXEDHF     0.700  0       0.0  0
2459    QW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s13f
2460    QW 3E2525        17.1     0.      24.4 FIXEDHF     0.700  0       0.0  0
2461    QX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -4s14f
2462    QX 3E2525        15.5     0.      22.1 FIXEDHF     0.700  0       0.0  0
2463    QY 2D2515      -171.4     0.    -244.9 FIXEDHF     0.700  0       0.0  0  4s7f      -3d4f
2464    QY 3E2515       -28.8     0.     -41.2 FIXEDHF     0.700  0       0.0  0
2465    QZ 2D2515      -152.7     0.    -218.1 FIXEDHF     0.700  0       0.0  0  4s7f      -3d5f
2466    QZ 3E2515       -25.7     0.     -36.7 FIXEDHF     0.700  0       0.0  0
2467    Qa 2D2515      -127.1     0.    -181.6 FIXEDHF     0.700  0       0.0  0  4s7f      -3d6f
2468    Qa 3E2515       -21.6     0.     -30.8 FIXEDHF     0.700  0       0.0  0
2469    Qb 2D2515      -106.3     0.    -151.8 FIXEDHF     0.700  0       0.0  0  4s7f      -3d7f
2470    Qb 3E2515       -18.1     0.     -25.8 FIXEDHF     0.700  0       0.0  0
2471    Qc 2D2515       -85.4     0.    -122.0 FIXEDHF     0.700  0       0.0  0  4s7f      -3d8f
2472    Qc 3E2515       -15.3     0.     -21.9 FIXEDHF     0.700  0       0.0  0
2473    Qd 2D2515       -71.0     0.    -101.4 FIXEDHF     0.700  0       0.0  0  4s7f      -3d9f
2474    Qd 3E2515       -13.2     0.     -18.9 FIXEDHF     0.700  0       0.0  0
2475    Qe 2D2515       -60.3     0.     -86.1 FIXEDHF     0.700  0       0.0  0  4s7f      -3d10f
2476    Qe 3E2515       -11.5     0.     -16.4 FIXEDHF     0.700  0       0.0  0
2477    Qf 2D2515       -52.1     0.     -74.4 FIXEDHF     0.700  0       0.0  0  4s7f      -3d11f
2478    Qf 3E2515       -10.1     0.     -14.5 FIXEDHF     0.700  0       0.0  0
2479    Qg 2D2515       -45.6     0.     -65.1 FIXEDHF     0.700  0       0.0  0  4s7f      -3d12f
2480    Qg 3E2515        -9.0     0.     -12.9 FIXEDHF     0.700  0       0.0  0
2481    Qh 2D2515       -40.4     0.     -57.7 FIXEDHF     0.700  0       0.0  0  4s7f      -3d13f
2482    Qh 3E2515        -8.0     0.     -11.5 FIXEDHF     0.700  0       0.0  0
2483    Qi 2D2515       -36.1     0.     -51.6 FIXEDHF     0.700  0       0.0  0  4s7f      -3d14f
2484    Qi 3E2515        -7.3     0.     -10.4 FIXEDHF     0.700  0       0.0  0
2485    Qn 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7f      -3d6h
2486    Qn 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2487    Qo 2D2516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  4s7f      -3d7h
2488    Qo 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2489    Qp 2D2516         3.5     0.       5.0 FIXEDHF     0.700  0       0.0  0  4s7f      -3d8h
2490    Qp 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2491    Qq 2D2516         2.7     0.       3.8 FIXEDHF     0.700  0       0.0  0  4s7f      -3d9h
2492    Qq 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2493    Qv 1D2538      1095.6     0.    1565.1 FIXEDHF     0.700  0       0.0  0  4s7f      -4p4d
2494    Qv 2E2538       122.3     0.     174.7 FIXEDHF     0.700  0       0.0  0
2495    Qw 1D2538       761.3     0.    1087.5 FIXEDHF     0.700  0       0.0  0  4s7f      -4p5d
2496    Qw 2E2538       110.0     0.     157.1 FIXEDHF     0.700  0       0.0  0
2497    Qx 1D2538       470.2     0.     671.7 FIXEDHF     0.700  0       0.0  0  4s7f      -4p6d
2498    Qx 2E2538        87.4     0.     124.8 FIXEDHF     0.700  0       0.0  0
2499    Qy 1D2538       264.9     0.     378.4 FIXEDHF     0.700  0       0.0  0  4s7f      -4p7d
2500    Qy 2E2538        69.6     0.      99.5 FIXEDHF     0.700  0       0.0  0
2501    Qz 1D2538        45.3     0.      64.7 FIXEDHF     0.700  0       0.0  0  4s7f      -4p8d
2502    Qz 2E2538        56.6     0.      80.8 FIXEDHF     0.700  0       0.0  0
2503    RS 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s9f
2504    RS 3E2525        23.4     0.      33.5 FIXEDHF     0.700  0       0.0  0
2505    RT 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s10f
2506    RT 3E2525        20.6     0.      29.4 FIXEDHF     0.700  0       0.0  0
2507    RU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s11f
2508    RU 3E2525        18.3     0.      26.1 FIXEDHF     0.700  0       0.0  0
2509    RV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s12f
2510    RV 3E2525        16.3     0.      23.3 FIXEDHF     0.700  0       0.0  0
2511    RW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s13f
2512    RW 3E2525        14.7     0.      21.0 FIXEDHF     0.700  0       0.0  0
2513    RX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4s14f
2514    RX 3E2525        13.3     0.      19.0 FIXEDHF     0.700  0       0.0  0
2515    RY 2D2515      -137.2     0.    -196.0 FIXEDHF     0.700  0       0.0  0  4s8f      -3d4f
2516    RY 3E2515       -24.8     0.     -35.4 FIXEDHF     0.700  0       0.0  0
2517    RZ 2D2515      -122.7     0.    -175.3 FIXEDHF     0.700  0       0.0  0  4s8f      -3d5f
2518    RZ 3E2515       -22.0     0.     -31.5 FIXEDHF     0.700  0       0.0  0
2519    Ra 2D2515      -102.3     0.    -146.1 FIXEDHF     0.700  0       0.0  0  4s8f      -3d6f
2520    Ra 3E2515       -18.5     0.     -26.4 FIXEDHF     0.700  0       0.0  0
2521    Rb 2D2515       -85.3     0.    -121.8 FIXEDHF     0.700  0       0.0  0  4s8f      -3d7f
2522    Rb 3E2515       -15.5     0.     -22.2 FIXEDHF     0.700  0       0.0  0
2523    Rc 2D2515       -72.2     0.    -103.1 FIXEDHF     0.700  0       0.0  0  4s8f      -3d8f
2524    Rc 3E2515       -13.2     0.     -18.9 FIXEDHF     0.700  0       0.0  0
2525    Rd 2D2515       -59.8     0.     -85.5 FIXEDHF     0.700  0       0.0  0  4s8f      -3d9f
2526    Rd 3E2515       -11.3     0.     -16.2 FIXEDHF     0.700  0       0.0  0
2527    Re 2D2515       -50.9     0.     -72.7 FIXEDHF     0.700  0       0.0  0  4s8f      -3d10f
2528    Re 3E2515        -9.9     0.     -14.1 FIXEDHF     0.700  0       0.0  0
2529    Rf 2D2515       -44.0     0.     -62.8 FIXEDHF     0.700  0       0.0  0  4s8f      -3d11f
2530    Rf 3E2515        -8.7     0.     -12.4 FIXEDHF     0.700  0       0.0  0
2531    Rg 2D2515       -38.6     0.     -55.1 FIXEDHF     0.700  0       0.0  0  4s8f      -3d12f
2532    Rg 3E2515        -7.8     0.     -11.1 FIXEDHF     0.700  0       0.0  0
2533    Rh 2D2515       -34.2     0.     -48.8 FIXEDHF     0.700  0       0.0  0  4s8f      -3d13f
2534    Rh 3E2515        -6.9     0.      -9.9 FIXEDHF     0.700  0       0.0  0
2535    Ri 2D2515       -30.6     0.     -43.7 FIXEDHF     0.700  0       0.0  0  4s8f      -3d14f
2536    Ri 3E2515        -6.2     0.      -8.9 FIXEDHF     0.700  0       0.0  0
2537    Rn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s8f      -3d6h
2538    Rn 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2539    Ro 2D2516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  4s8f      -3d7h
2540    Ro 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2541    Rp 2D2516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  4s8f      -3d8h
2542    Rp 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2543    Rq 2D2516         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0  4s8f      -3d9h
2544    Rq 5E2516        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
2545    Rv 1D2538       872.5     0.    1246.4 FIXEDHF     0.700  0       0.0  0  4s8f      -4p4d
2546    Rv 2E2538       102.8     0.     146.8 FIXEDHF     0.700  0       0.0  0
2547    Rw 1D2538       625.2     0.     893.2 FIXEDHF     0.700  0       0.0  0  4s8f      -4p5d
2548    Rw 2E2538        93.2     0.     133.1 FIXEDHF     0.700  0       0.0  0
2549    Rx 1D2538       405.3     0.     579.0 FIXEDHF     0.700  0       0.0  0  4s8f      -4p6d
2550    Rx 2E2538        74.2     0.     106.0 FIXEDHF     0.700  0       0.0  0
2551    Ry 1D2538       255.6     0.     365.1 FIXEDHF     0.700  0       0.0  0  4s8f      -4p7d
2552    Ry 2E2538        59.2     0.      84.6 FIXEDHF     0.700  0       0.0  0
2553    Rz 1D2538       149.9     0.     214.2 FIXEDHF     0.700  0       0.0  0  4s8f      -4p8d
2554    Rz 2E2538        48.2     0.      68.8 FIXEDHF     0.700  0       0.0  0
2555    ST 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -4s10f
2556    ST 3E2525        17.9     0.      25.6 FIXEDHF     0.700  0       0.0  0
2557    SU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -4s11f
2558    SU 3E2525        15.8     0.      22.6 FIXEDHF     0.700  0       0.0  0
2559    SV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -4s12f
2560    SV 3E2525        14.1     0.      20.2 FIXEDHF     0.700  0       0.0  0
2561    SW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -4s13f
2562    SW 3E2525        12.7     0.      18.2 FIXEDHF     0.700  0       0.0  0
2563    SX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -4s14f
2564    SX 3E2525        11.5     0.      16.5 FIXEDHF     0.700  0       0.0  0
2565    SY 2D2515      -113.3     0.    -161.9 FIXEDHF     0.700  0       0.0  0  4s9f      -3d4f
2566    SY 3E2515       -21.5     0.     -30.7 FIXEDHF     0.700  0       0.0  0
2567    SZ 2D2515      -101.6     0.    -145.2 FIXEDHF     0.700  0       0.0  0  4s9f      -3d5f
2568    SZ 3E2515       -19.2     0.     -27.4 FIXEDHF     0.700  0       0.0  0
2569    Sa 2D2515       -84.9     0.    -121.3 FIXEDHF     0.700  0       0.0  0  4s9f      -3d6f
2570    Sa 3E2515       -16.1     0.     -23.0 FIXEDHF     0.700  0       0.0  0
2571    Sb 2D2515       -70.8     0.    -101.1 FIXEDHF     0.700  0       0.0  0  4s9f      -3d7f
2572    Sb 3E2515       -13.5     0.     -19.3 FIXEDHF     0.700  0       0.0  0
2573    Sc 2D2515       -59.7     0.     -85.3 FIXEDHF     0.700  0       0.0  0  4s9f      -3d8f
2574    Sc 3E2515       -11.5     0.     -16.4 FIXEDHF     0.700  0       0.0  0
2575    Sd 2D2515       -51.2     0.     -73.2 FIXEDHF     0.700  0       0.0  0  4s9f      -3d9f
2576    Sd 3E2515        -9.9     0.     -14.1 FIXEDHF     0.700  0       0.0  0
2577    Se 2D2515       -43.5     0.     -62.2 FIXEDHF     0.700  0       0.0  0  4s9f      -3d10f
2578    Se 3E2515        -8.6     0.     -12.3 FIXEDHF     0.700  0       0.0  0
2579    Sf 2D2515       -37.7     0.     -53.8 FIXEDHF     0.700  0       0.0  0  4s9f      -3d11f
2580    Sf 3E2515        -7.6     0.     -10.8 FIXEDHF     0.700  0       0.0  0
2581    Sg 2D2515       -33.0     0.     -47.2 FIXEDHF     0.700  0       0.0  0  4s9f      -3d12f
2582    Sg 3E2515        -6.7     0.      -9.6 FIXEDHF     0.700  0       0.0  0
2583    Sh 2D2515       -29.3     0.     -41.8 FIXEDHF     0.700  0       0.0  0  4s9f      -3d13f
2584    Sh 3E2515        -6.0     0.      -8.6 FIXEDHF     0.700  0       0.0  0
2585    Si 2D2515       -26.2     0.     -37.4 FIXEDHF     0.700  0       0.0  0  4s9f      -3d14f
2586    Si 3E2515        -5.5     0.      -7.8 FIXEDHF     0.700  0       0.0  0
2587    Sn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s9f      -3d6h
2588    Sn 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2589    So 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9f      -3d7h
2590    So 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2591    Sp 2D2516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  4s9f      -3d8h
2592    Sp 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2593    Sq 2D2516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  4s9f      -3d9h
2594    Sq 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2595    Sv 1D2538       717.3     0.    1024.7 FIXEDHF     0.700  0       0.0  0  4s9f      -4p4d
2596    Sv 2E2538        87.7     0.     125.3 FIXEDHF     0.700  0       0.0  0
2597    Sw 1D2538       524.5     0.     749.3 FIXEDHF     0.700  0       0.0  0  4s9f      -4p5d
2598    Sw 2E2538        80.0     0.     114.3 FIXEDHF     0.700  0       0.0  0
2599    Sx 1D2538       349.2     0.     498.8 FIXEDHF     0.700  0       0.0  0  4s9f      -4p6d
2600    Sx 2E2538        63.8     0.      91.2 FIXEDHF     0.700  0       0.0  0
2601    Sy 1D2538       230.4     0.     329.1 FIXEDHF     0.700  0       0.0  0  4s9f      -4p7d
2602    Sy 2E2538        51.0     0.      72.8 FIXEDHF     0.700  0       0.0  0
2603    Sz 1D2538       150.4     0.     214.8 FIXEDHF     0.700  0       0.0  0  4s9f      -4p8d
2604    Sz 2E2538        41.5     0.      59.3 FIXEDHF     0.700  0       0.0  0
2605    TU 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10f     -4s11f
2606    TU 3E2525        13.9     0.      19.9 FIXEDHF     0.700  0       0.0  0
2607    TV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10f     -4s12f
2608    TV 3E2525        12.5     0.      17.8 FIXEDHF     0.700  0       0.0  0
2609    TW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10f     -4s13f
2610    TW 3E2525        11.2     0.      16.0 FIXEDHF     0.700  0       0.0  0
2611    TX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10f     -4s14f
2612    TX 3E2525        10.1     0.      14.5 FIXEDHF     0.700  0       0.0  0
2613    TY 2D2515       -95.8     0.    -136.9 FIXEDHF     0.700  0       0.0  0  4s10f     -3d4f
2614    TY 3E2515       -18.8     0.     -26.9 FIXEDHF     0.700  0       0.0  0
2615    TZ 2D2515       -86.1     0.    -123.0 FIXEDHF     0.700  0       0.0  0  4s10f     -3d5f
2616    TZ 3E2515       -16.8     0.     -24.0 FIXEDHF     0.700  0       0.0  0
2617    Ta 2D2515       -72.0     0.    -102.9 FIXEDHF     0.700  0       0.0  0  4s10f     -3d6f
2618    Ta 3E2515       -14.1     0.     -20.1 FIXEDHF     0.700  0       0.0  0
2619    Tb 2D2515       -60.1     0.     -85.9 FIXEDHF     0.700  0       0.0  0  4s10f     -3d7f
2620    Tb 3E2515       -11.8     0.     -16.9 FIXEDHF     0.700  0       0.0  0
2621    Tc 2D2515       -50.8     0.     -72.5 FIXEDHF     0.700  0       0.0  0  4s10f     -3d8f
2622    Tc 3E2515       -10.1     0.     -14.4 FIXEDHF     0.700  0       0.0  0
2623    Td 2D2515       -43.4     0.     -62.0 FIXEDHF     0.700  0       0.0  0  4s10f     -3d9f
2624    Td 3E2515        -8.7     0.     -12.4 FIXEDHF     0.700  0       0.0  0
2625    Te 2D2515       -37.7     0.     -53.9 FIXEDHF     0.700  0       0.0  0  4s10f     -3d10f
2626    Te 3E2515        -7.6     0.     -10.8 FIXEDHF     0.700  0       0.0  0
2627    Tf 2D2515       -32.6     0.     -46.6 FIXEDHF     0.700  0       0.0  0  4s10f     -3d11f
2628    Tf 3E2515        -6.6     0.      -9.5 FIXEDHF     0.700  0       0.0  0
2629    Tg 2D2515       -28.6     0.     -40.8 FIXEDHF     0.700  0       0.0  0  4s10f     -3d12f
2630    Tg 3E2515        -5.9     0.      -8.4 FIXEDHF     0.700  0       0.0  0
2631    Th 2D2515       -25.3     0.     -36.2 FIXEDHF     0.700  0       0.0  0  4s10f     -3d13f
2632    Th 3E2515        -5.3     0.      -7.6 FIXEDHF     0.700  0       0.0  0
2633    Ti 2D2515       -22.7     0.     -32.4 FIXEDHF     0.700  0       0.0  0  4s10f     -3d14f
2634    Ti 3E2515        -4.8     0.      -6.8 FIXEDHF     0.700  0       0.0  0
2635    Tn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s10f     -3d6h
2636    Tn 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2637    To 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s10f     -3d7h
2638    To 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2639    Tp 2D2516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  4s10f     -3d8h
2640    Tp 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2641    Tq 2D2516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  4s10f     -3d9h
2642    Tq 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2643    Tv 1D2538       603.9     0.     862.7 FIXEDHF     0.700  0       0.0  0  4s10f     -4p4d
2644    Tv 2E2538        75.9     0.     108.5 FIXEDHF     0.700  0       0.0  0
2645    Tw 1D2538       448.0     0.     640.0 FIXEDHF     0.700  0       0.0  0  4s10f     -4p5d
2646    Tw 2E2538        69.6     0.      99.5 FIXEDHF     0.700  0       0.0  0
2647    Tx 1D2538       303.3     0.     433.3 FIXEDHF     0.700  0       0.0  0  4s10f     -4p6d
2648    Tx 2E2538        55.6     0.      79.5 FIXEDHF     0.700  0       0.0  0
2649    Ty 1D2538       205.2     0.     293.1 FIXEDHF     0.700  0       0.0  0  4s10f     -4p7d
2650    Ty 2E2538        44.4     0.      63.5 FIXEDHF     0.700  0       0.0  0
2651    Tz 1D2538       139.8     0.     199.7 FIXEDHF     0.700  0       0.0  0  4s10f     -4p8d
2652    Tz 2E2538        36.2     0.      51.7 FIXEDHF     0.700  0       0.0  0
2653    UV 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11f     -4s12f
2654    UV 3E2525        11.0     0.      15.7 FIXEDHF     0.700  0       0.0  0
2655    UW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11f     -4s13f
2656    UW 3E2525         9.9     0.      14.2 FIXEDHF     0.700  0       0.0  0
2657    UX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11f     -4s14f
2658    UX 3E2525         9.0     0.      12.8 FIXEDHF     0.700  0       0.0  0
2659    UY 2D2515       -82.5     0.    -117.8 FIXEDHF     0.700  0       0.0  0  4s11f     -3d4f
2660    UY 3E2515       -16.7     0.     -23.8 FIXEDHF     0.700  0       0.0  0
2661    UZ 2D2515       -74.2     0.    -106.0 FIXEDHF     0.700  0       0.0  0  4s11f     -3d5f
2662    UZ 3E2515       -14.9     0.     -21.3 FIXEDHF     0.700  0       0.0  0
2663    Ua 2D2515       -62.2     0.     -88.8 FIXEDHF     0.700  0       0.0  0  4s11f     -3d6f
2664    Ua 3E2515       -12.5     0.     -17.8 FIXEDHF     0.700  0       0.0  0
2665    Ub 2D2515       -51.9     0.     -74.2 FIXEDHF     0.700  0       0.0  0  4s11f     -3d7f
2666    Ub 3E2515       -10.5     0.     -15.0 FIXEDHF     0.700  0       0.0  0
2667    Uc 2D2515       -43.9     0.     -62.7 FIXEDHF     0.700  0       0.0  0  4s11f     -3d8f
2668    Uc 3E2515        -8.9     0.     -12.7 FIXEDHF     0.700  0       0.0  0
2669    Ud 2D2515       -37.5     0.     -53.6 FIXEDHF     0.700  0       0.0  0  4s11f     -3d9f
2670    Ud 3E2515        -7.7     0.     -11.0 FIXEDHF     0.700  0       0.0  0
2671    Ue 2D2515       -32.5     0.     -46.5 FIXEDHF     0.700  0       0.0  0  4s11f     -3d10f
2672    Ue 3E2515        -6.6     0.      -9.5 FIXEDHF     0.700  0       0.0  0
2673    Uf 2D2515       -28.6     0.     -40.8 FIXEDHF     0.700  0       0.0  0  4s11f     -3d11f
2674    Uf 3E2515        -5.9     0.      -8.4 FIXEDHF     0.700  0       0.0  0
2675    Ug 2D2515       -25.1     0.     -35.8 FIXEDHF     0.700  0       0.0  0  4s11f     -3d12f
2676    Ug 3E2515        -5.3     0.      -7.5 FIXEDHF     0.700  0       0.0  0
2677    Uh 2D2515       -22.3     0.     -31.8 FIXEDHF     0.700  0       0.0  0  4s11f     -3d13f
2678    Uh 3E2515        -4.7     0.      -6.7 FIXEDHF     0.700  0       0.0  0
2679    Ui 2D2515       -19.9     0.     -28.4 FIXEDHF     0.700  0       0.0  0  4s11f     -3d14f
2680    Ui 3E2515        -4.3     0.      -6.1 FIXEDHF     0.700  0       0.0  0
2681    Un 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s11f     -3d6h
2682    Un 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2683    Uo 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11f     -3d7h
2684    Uo 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2685    Up 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s11f     -3d8h
2686    Up 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2687    Uq 2D2516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  4s11f     -3d9h
2688    Uq 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2689    Uv 1D2538       517.9     0.     739.8 FIXEDHF     0.700  0       0.0  0  4s11f     -4p4d
2690    Uv 2E2538        66.6     0.      95.1 FIXEDHF     0.700  0       0.0  0
2691    Uw 1D2538       388.4     0.     554.9 FIXEDHF     0.700  0       0.0  0  4s11f     -4p5d
2692    Uw 2E2538        61.2     0.      87.5 FIXEDHF     0.700  0       0.0  0
2693    Ux 1D2538       266.1     0.     380.1 FIXEDHF     0.700  0       0.0  0  4s11f     -4p6d
2694    Ux 2E2538        49.0     0.      70.0 FIXEDHF     0.700  0       0.0  0
2695    Uy 1D2538       182.8     0.     261.2 FIXEDHF     0.700  0       0.0  0  4s11f     -4p7d
2696    Uy 2E2538        39.2     0.      56.0 FIXEDHF     0.700  0       0.0  0
2697    Uz 1D2538       127.6     0.     182.3 FIXEDHF     0.700  0       0.0  0  4s11f     -4p8d
2698    Uz 2E2538        31.9     0.      45.6 FIXEDHF     0.700  0       0.0  0
2699    VW 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12f     -4s13f
2700    VW 3E2525         8.8     0.      12.6 FIXEDHF     0.700  0       0.0  0
2701    VX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12f     -4s14f
2702    VX 3E2525         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0
2703    VY 2D2515       -72.0     0.    -102.9 FIXEDHF     0.700  0       0.0  0  4s12f     -3d4f
2704    VY 3E2515       -14.9     0.     -21.3 FIXEDHF     0.700  0       0.0  0
2705    VZ 2D2515       -64.9     0.     -92.7 FIXEDHF     0.700  0       0.0  0  4s12f     -3d5f
2706    VZ 3E2515       -13.3     0.     -19.0 FIXEDHF     0.700  0       0.0  0
2707    Va 2D2515       -54.4     0.     -77.7 FIXEDHF     0.700  0       0.0  0  4s12f     -3d6f
2708    Va 3E2515       -11.1     0.     -15.9 FIXEDHF     0.700  0       0.0  0
2709    Vb 2D2515       -45.5     0.     -65.0 FIXEDHF     0.700  0       0.0  0  4s12f     -3d7f
2710    Vb 3E2515        -9.4     0.     -13.4 FIXEDHF     0.700  0       0.0  0
2711    Vc 2D2515       -38.4     0.     -54.9 FIXEDHF     0.700  0       0.0  0  4s12f     -3d8f
2712    Vc 3E2515        -8.0     0.     -11.4 FIXEDHF     0.700  0       0.0  0
2713    Vd 2D2515       -32.9     0.     -47.0 FIXEDHF     0.700  0       0.0  0  4s12f     -3d9f
2714    Vd 3E2515        -6.9     0.      -9.8 FIXEDHF     0.700  0       0.0  0
2715    Ve 2D2515       -28.6     0.     -40.8 FIXEDHF     0.700  0       0.0  0  4s12f     -3d10f
2716    Ve 3E2515        -5.9     0.      -8.5 FIXEDHF     0.700  0       0.0  0
2717    Vf 2D2515       -25.0     0.     -35.7 FIXEDHF     0.700  0       0.0  0  4s12f     -3d11f
2718    Vf 3E2515        -5.3     0.      -7.5 FIXEDHF     0.700  0       0.0  0
2719    Vg 2D2515       -22.2     0.     -31.7 FIXEDHF     0.700  0       0.0  0  4s12f     -3d12f
2720    Vg 3E2515        -4.7     0.      -6.7 FIXEDHF     0.700  0       0.0  0
2721    Vh 2D2515       -19.7     0.     -28.1 FIXEDHF     0.700  0       0.0  0  4s12f     -3d13f
2722    Vh 3E2515        -4.2     0.      -6.0 FIXEDHF     0.700  0       0.0  0
2723    Vi 2D2515       -17.6     0.     -25.2 FIXEDHF     0.700  0       0.0  0  4s12f     -3d14f
2724    Vi 3E2515        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0
2725    Vn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s12f     -3d6h
2726    Vn 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2727    Vo 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12f     -3d7h
2728    Vo 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2729    Vp 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s12f     -3d8h
2730    Vp 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2731    Vq 2D2516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  4s12f     -3d9h
2732    Vq 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2733    Vv 1D2538       450.7     0.     643.8 FIXEDHF     0.700  0       0.0  0  4s12f     -4p4d
2734    Vv 2E2538        58.9     0.      84.2 FIXEDHF     0.700  0       0.0  0
2735    Vw 1D2538       341.0     0.     487.1 FIXEDHF     0.700  0       0.0  0  4s12f     -4p5d
2736    Vw 2E2538        54.4     0.      77.7 FIXEDHF     0.700  0       0.0  0
2737    Vx 1D2538       235.6     0.     336.6 FIXEDHF     0.700  0       0.0  0  4s12f     -4p6d
2738    Vx 2E2538        43.6     0.      62.3 FIXEDHF     0.700  0       0.0  0
2739    Vy 1D2538       163.7     0.     233.9 FIXEDHF     0.700  0       0.0  0  4s12f     -4p7d
2740    Vy 2E2538        34.9     0.      49.8 FIXEDHF     0.700  0       0.0  0
2741    Vz 1D2538       115.9     0.     165.6 FIXEDHF     0.700  0       0.0  0  4s12f     -4p8d
2742    Vz 2E2538        28.4     0.      40.6 FIXEDHF     0.700  0       0.0  0
2743    WX 0D2525         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s13f     -4s14f
2744    WX 3E2525         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
2745    WY 2D2515       -63.6     0.     -90.9 FIXEDHF     0.700  0       0.0  0  4s13f     -3d4f
2746    WY 3E2515       -13.4     0.     -19.1 FIXEDHF     0.700  0       0.0  0
2747    WZ 2D2515       -57.4     0.     -82.0 FIXEDHF     0.700  0       0.0  0  4s13f     -3d5f
2748    WZ 3E2515       -12.0     0.     -17.1 FIXEDHF     0.700  0       0.0  0
2749    Wa 2D2515       -48.2     0.     -68.8 FIXEDHF     0.700  0       0.0  0  4s13f     -3d6f
2750    Wa 3E2515       -10.0     0.     -14.3 FIXEDHF     0.700  0       0.0  0
2751    Wb 2D2515       -40.3     0.     -57.5 FIXEDHF     0.700  0       0.0  0  4s13f     -3d7f
2752    Wb 3E2515        -8.5     0.     -12.1 FIXEDHF     0.700  0       0.0  0
2753    Wc 2D2515       -34.0     0.     -48.6 FIXEDHF     0.700  0       0.0  0  4s13f     -3d8f
2754    Wc 3E2515        -7.1     0.     -10.2 FIXEDHF     0.700  0       0.0  0
2755    Wd 2D2515       -29.2     0.     -41.7 FIXEDHF     0.700  0       0.0  0  4s13f     -3d9f
2756    Wd 3E2515        -6.2     0.      -8.8 FIXEDHF     0.700  0       0.0  0
2757    We 2D2515       -25.3     0.     -36.1 FIXEDHF     0.700  0       0.0  0  4s13f     -3d10f
2758    We 3E2515        -5.4     0.      -7.7 FIXEDHF     0.700  0       0.0  0
2759    Wf 2D2515       -22.2     0.     -31.7 FIXEDHF     0.700  0       0.0  0  4s13f     -3d11f
2760    Wf 3E2515        -4.8     0.      -6.8 FIXEDHF     0.700  0       0.0  0
2761    Wg 2D2515       -19.7     0.     -28.1 FIXEDHF     0.700  0       0.0  0  4s13f     -3d12f
2762    Wg 3E2515        -4.2     0.      -6.0 FIXEDHF     0.700  0       0.0  0
2763    Wh 2D2515       -17.6     0.     -25.1 FIXEDHF     0.700  0       0.0  0  4s13f     -3d13f
2764    Wh 3E2515        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0
2765    Wi 2D2515       -15.7     0.     -22.5 FIXEDHF     0.700  0       0.0  0  4s13f     -3d14f
2766    Wi 3E2515        -3.4     0.      -4.9 FIXEDHF     0.700  0       0.0  0
2767    Wn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s13f     -3d6h
2768    Wn 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2769    Wo 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s13f     -3d7h
2770    Wo 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2771    Wp 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s13f     -3d8h
2772    Wp 5E2516        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
2773    Wq 2D2516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  4s13f     -3d9h
2774    Wq 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2775    Wv 1D2538       397.0     0.     567.1 FIXEDHF     0.700  0       0.0  0  4s13f     -4p4d
2776    Wv 2E2538        52.6     0.      75.2 FIXEDHF     0.700  0       0.0  0
2777    Ww 1D2538       302.5     0.     432.1 FIXEDHF     0.700  0       0.0  0  4s13f     -4p5d
2778    Ww 2E2538        48.8     0.      69.7 FIXEDHF     0.700  0       0.0  0
2779    Wx 1D2538       210.5     0.     300.7 FIXEDHF     0.700  0       0.0  0  4s13f     -4p6d
2780    Wx 2E2538        39.1     0.      55.8 FIXEDHF     0.700  0       0.0  0
2781    Wy 1D2538       147.4     0.     210.6 FIXEDHF     0.700  0       0.0  0  4s13f     -4p7d
2782    Wy 2E2538        31.3     0.      44.7 FIXEDHF     0.700  0       0.0  0
2783    Wz 1D2538       105.5     0.     150.7 FIXEDHF     0.700  0       0.0  0  4s13f     -4p8d
2784    Wz 2E2538        25.5     0.      36.4 FIXEDHF     0.700  0       0.0  0
2785    XY 2D2515       -56.7     0.     -81.0 FIXEDHF     0.700  0       0.0  0  4s14f     -3d4f
2786    XY 3E2515       -12.1     0.     -17.3 FIXEDHF     0.700  0       0.0  0
2787    XZ 2D2515       -51.2     0.     -73.2 FIXEDHF     0.700  0       0.0  0  4s14f     -3d5f
2788    XZ 3E2515       -10.8     0.     -15.5 FIXEDHF     0.700  0       0.0  0
2789    Xa 2D2515       -43.0     0.     -61.5 FIXEDHF     0.700  0       0.0  0  4s14f     -3d6f
2790    Xa 3E2515        -9.1     0.     -13.0 FIXEDHF     0.700  0       0.0  0
2791    Xb 2D2515       -36.0     0.     -51.4 FIXEDHF     0.700  0       0.0  0  4s14f     -3d7f
2792    Xb 3E2515        -7.6     0.     -10.9 FIXEDHF     0.700  0       0.0  0
2793    Xc 2D2515       -30.4     0.     -43.5 FIXEDHF     0.700  0       0.0  0  4s14f     -3d8f
2794    Xc 3E2515        -6.5     0.      -9.3 FIXEDHF     0.700  0       0.0  0
2795    Xd 2D2515       -26.1     0.     -37.3 FIXEDHF     0.700  0       0.0  0  4s14f     -3d9f
2796    Xd 3E2515        -5.6     0.      -8.0 FIXEDHF     0.700  0       0.0  0
2797    Xe 2D2515       -22.6     0.     -32.3 FIXEDHF     0.700  0       0.0  0  4s14f     -3d10f
2798    Xe 3E2515        -4.8     0.      -6.9 FIXEDHF     0.700  0       0.0  0
2799    Xf 2D2515       -19.8     0.     -28.3 FIXEDHF     0.700  0       0.0  0  4s14f     -3d11f
2800    Xf 3E2515        -4.3     0.      -6.1 FIXEDHF     0.700  0       0.0  0
2801    Xg 2D2515       -17.6     0.     -25.1 FIXEDHF     0.700  0       0.0  0  4s14f     -3d12f
2802    Xg 3E2515        -3.8     0.      -5.4 FIXEDHF     0.700  0       0.0  0
2803    Xh 2D2515       -15.7     0.     -22.4 FIXEDHF     0.700  0       0.0  0  4s14f     -3d13f
2804    Xh 3E2515        -3.4     0.      -4.9 FIXEDHF     0.700  0       0.0  0
2805    Xi 2D2515       -14.1     0.     -20.2 FIXEDHF     0.700  0       0.0  0  4s14f     -3d14f
2806    Xi 3E2515        -3.1     0.      -4.4 FIXEDHF     0.700  0       0.0  0
2807    Xn 2D2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  4s14f     -3d6h
2808    Xn 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2809    Xo 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s14f     -3d7h
2810    Xo 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2811    Xp 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s14f     -3d8h
2812    Xp 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2813    Xq 2D2516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s14f     -3d9h
2814    Xq 5E2516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0
2815    Xv 1D2538       353.3     0.     504.7 FIXEDHF     0.700  0       0.0  0  4s14f     -4p4d
2816    Xv 2E2538        47.5     0.      67.8 FIXEDHF     0.700  0       0.0  0
2817    Xw 1D2538       270.7     0.     386.7 FIXEDHF     0.700  0       0.0  0  4s14f     -4p5d
2818    Xw 2E2538        44.0     0.      62.9 FIXEDHF     0.700  0       0.0  0
2819    Xx 1D2538       189.4     0.     270.6 FIXEDHF     0.700  0       0.0  0  4s14f     -4p6d
2820    Xx 2E2538        35.3     0.      50.4 FIXEDHF     0.700  0       0.0  0
2821    Xy 1D2538       133.5     0.     190.7 FIXEDHF     0.700  0       0.0  0  4s14f     -4p7d
2822    Xy 2E2538        28.2     0.      40.3 FIXEDHF     0.700  0       0.0  0
2823    Xz 1D2538        96.3     0.     137.5 FIXEDHF     0.700  0       0.0  0  4s14f     -4p8d
2824    Xz 2E2538        23.0     0.      32.9 FIXEDHF     0.700  0       0.0  0
2825    YZ 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d5f
2826    YZ 2D1515       233.4     0.     333.4 FIXEDHF     0.700  0       0.0  0
2827    YZ 4D1515        52.4     0.      74.8 FIXEDHF     0.700  0       0.0  0
2828    YZ 1E1515        34.9     0.      49.9 FIXEDHF     0.700  0       0.0  0
2829    YZ 3E1515        20.3     0.      29.0 FIXEDHF     0.700  0       0.0  0
2830    YZ 5E1515        14.0     0.      20.0 FIXEDHF     0.700  0       0.0  0
2831    Ya 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d6f
2832    Ya 2D1515       164.3     0.     234.7 FIXEDHF     0.700  0       0.0  0
2833    Ya 4D1515        40.8     0.      58.3 FIXEDHF     0.700  0       0.0  0
2834    Ya 1E1515        29.2     0.      41.7 FIXEDHF     0.700  0       0.0  0
2835    Ya 3E1515        17.0     0.      24.3 FIXEDHF     0.700  0       0.0  0
2836    Ya 5E1515        11.8     0.      16.8 FIXEDHF     0.700  0       0.0  0
2837    Yb 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d7f
2838    Yb 2D1515       125.2     0.     178.9 FIXEDHF     0.700  0       0.0  0
2839    Yb 4D1515        32.8     0.      46.8 FIXEDHF     0.700  0       0.0  0
2840    Yb 1E1515        24.5     0.      35.0 FIXEDHF     0.700  0       0.0  0
2841    Yb 3E1515        14.3     0.      20.4 FIXEDHF     0.700  0       0.0  0
2842    Yb 5E1515         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0
2843    Yc 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d8f
2844    Yc 2D1515       100.0     0.     142.9 FIXEDHF     0.700  0       0.0  0
2845    Yc 4D1515        27.1     0.      38.7 FIXEDHF     0.700  0       0.0  0
2846    Yc 1E1515        20.8     0.      29.7 FIXEDHF     0.700  0       0.0  0
2847    Yc 3E1515        12.1     0.      17.3 FIXEDHF     0.700  0       0.0  0
2848    Yc 5E1515         8.3     0.      11.9 FIXEDHF     0.700  0       0.0  0
2849    Yd 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d9f
2850    Yd 2D1515        82.6     0.     118.0 FIXEDHF     0.700  0       0.0  0
2851    Yd 4D1515        22.8     0.      32.6 FIXEDHF     0.700  0       0.0  0
2852    Yd 1E1515        17.8     0.      25.5 FIXEDHF     0.700  0       0.0  0
2853    Yd 3E1515        10.4     0.      14.9 FIXEDHF     0.700  0       0.0  0
2854    Yd 5E1515         7.2     0.      10.3 FIXEDHF     0.700  0       0.0  0
2855    Ye 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d10f
2856    Ye 2D1515        69.8     0.      99.7 FIXEDHF     0.700  0       0.0  0
2857    Ye 4D1515        19.6     0.      28.0 FIXEDHF     0.700  0       0.0  0
2858    Ye 1E1515        15.5     0.      22.2 FIXEDHF     0.700  0       0.0  0
2859    Ye 3E1515         9.0     0.      12.9 FIXEDHF     0.700  0       0.0  0
2860    Ye 5E1515         6.2     0.       8.9 FIXEDHF     0.700  0       0.0  0
2861    Yf 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d11f
2862    Yf 2D1515        60.1     0.      85.8 FIXEDHF     0.700  0       0.0  0
2863    Yf 4D1515        17.1     0.      24.4 FIXEDHF     0.700  0       0.0  0
2864    Yf 1E1515        13.7     0.      19.6 FIXEDHF     0.700  0       0.0  0
2865    Yf 3E1515         8.0     0.      11.4 FIXEDHF     0.700  0       0.0  0
2866    Yf 5E1515         5.5     0.       7.8 FIXEDHF     0.700  0       0.0  0
2867    Yg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d12f
2868    Yg 2D1515        52.4     0.      74.9 FIXEDHF     0.700  0       0.0  0
2869    Yg 4D1515        15.0     0.      21.5 FIXEDHF     0.700  0       0.0  0
2870    Yg 1E1515        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
2871    Yg 3E1515         7.1     0.      10.1 FIXEDHF     0.700  0       0.0  0
2872    Yg 5E1515         4.9     0.       7.0 FIXEDHF     0.700  0       0.0  0
2873    Yh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d13f
2874    Yh 2D1515        46.3     0.      66.2 FIXEDHF     0.700  0       0.0  0
2875    Yh 4D1515        13.4     0.      19.1 FIXEDHF     0.700  0       0.0  0
2876    Yh 1E1515        10.9     0.      15.6 FIXEDHF     0.700  0       0.0  0
2877    Yh 3E1515         6.4     0.       9.1 FIXEDHF     0.700  0       0.0  0
2878    Yh 5E1515         4.4     0.       6.3 FIXEDHF     0.700  0       0.0  0
2879    Yi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d14f
2880    Yi 2D1515        41.3     0.      59.0 FIXEDHF     0.700  0       0.0  0
2881    Yi 4D1515        12.0     0.      17.2 FIXEDHF     0.700  0       0.0  0
2882    Yi 1E1515         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0
2883    Yi 3E1515         5.7     0.       8.2 FIXEDHF     0.700  0       0.0  0
2884    Yi 5E1515         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
2885    Yj 2D1526       -64.0     0.     -91.5 FIXEDHF     0.700  0       0.0  0  3d4f      -4s6h
2886    Yj 3E1526        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
2887    Yk 2D1526       -62.2     0.     -88.9 FIXEDHF     0.700  0       0.0  0  3d4f      -4s7h
2888    Yk 3E1526        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
2889    Yl 2D1526       -55.5     0.     -79.3 FIXEDHF     0.700  0       0.0  0  3d4f      -4s8h
2890    Yl 3E1526        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
2891    Ym 2D1526       -48.8     0.     -69.7 FIXEDHF     0.700  0       0.0  0  3d4f      -4s9h
2892    Ym 3E1526        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
2893    Yn 2D1516        47.9     0.      68.4 FIXEDHF     0.700  0       0.0  0  3d4f      -3d6h
2894    Yn 4D1516         3.3     0.       4.7 FIXEDHF     0.700  0       0.0  0
2895    Yn 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
2896    Yn 5E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
2897    Yo 2D1516        46.5     0.      66.4 FIXEDHF     0.700  0       0.0  0  3d4f      -3d7h
2898    Yo 4D1516         3.5     0.       5.0 FIXEDHF     0.700  0       0.0  0
2899    Yo 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
2900    Yo 5E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
2901    Yp 2D1516        41.4     0.      59.2 FIXEDHF     0.700  0       0.0  0  3d4f      -3d8h
2902    Yp 4D1516         3.3     0.       4.7 FIXEDHF     0.700  0       0.0  0
2903    Yp 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
2904    Yp 5E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
2905    Yq 2D1516        36.4     0.      52.0 FIXEDHF     0.700  0       0.0  0  3d4f      -3d9h
2906    Yq 4D1516         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
2907    Yq 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
2908    Yq 5E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
2909    Yt 4D1517         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d4f      -3d8k
2910    Yt 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
2911    Yu 4D1517         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d4f      -3d9k
2912    Yu 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
2913    Yv 1D1538     -1868.3     0.   -2669.0 FIXEDHF     0.700  0       0.0  0  3d4f      -4p4d
2914    Yv 3D1538      -422.4     0.    -603.5 FIXEDHF     0.700  0       0.0  0
2915    Yv 2E1538       -57.7     0.     -82.5 FIXEDHF     0.700  0       0.0  0
2916    Yv 4E1538       -75.2     0.    -107.4 FIXEDHF     0.700  0       0.0  0
2917    Yw 1D1538      -100.9     0.    -144.2 FIXEDHF     0.700  0       0.0  0  3d4f      -4p5d
2918    Yw 3D1538      -181.9     0.    -259.8 FIXEDHF     0.700  0       0.0  0
2919    Yw 2E1538       -60.2     0.     -86.0 FIXEDHF     0.700  0       0.0  0
2920    Yw 4E1538       -61.9     0.     -88.5 FIXEDHF     0.700  0       0.0  0
2921    Yx 1D1538       -80.2     0.    -114.6 FIXEDHF     0.700  0       0.0  0  3d4f      -4p6d
2922    Yx 3D1538      -113.7     0.    -162.4 FIXEDHF     0.700  0       0.0  0
2923    Yx 2E1538       -49.5     0.     -70.7 FIXEDHF     0.700  0       0.0  0
2924    Yx 4E1538       -47.9     0.     -68.4 FIXEDHF     0.700  0       0.0  0
2925    Yy 1D1538       -51.2     0.     -73.1 FIXEDHF     0.700  0       0.0  0  3d4f      -4p7d
2926    Yy 3D1538       -79.7     0.    -113.8 FIXEDHF     0.700  0       0.0  0
2927    Yy 2E1538       -40.0     0.     -57.1 FIXEDHF     0.700  0       0.0  0
2928    Yy 4E1538       -37.7     0.     -53.8 FIXEDHF     0.700  0       0.0  0
2929    Yz 1D1538       -34.6     0.     -49.5 FIXEDHF     0.700  0       0.0  0  3d4f      -4p8d
2930    Yz 3D1538       -59.7     0.     -85.3 FIXEDHF     0.700  0       0.0  0
2931    Yz 2E1538       -32.8     0.     -46.8 FIXEDHF     0.700  0       0.0  0
2932    Yz 4E1538       -30.3     0.     -43.3 FIXEDHF     0.700  0       0.0  0
2933    Za 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d6f
2934    Za 2D1515       144.8     0.     206.9 FIXEDHF     0.700  0       0.0  0
2935    Za 4D1515        34.2     0.      48.8 FIXEDHF     0.700  0       0.0  0
2936    Za 1E1515        26.0     0.      37.1 FIXEDHF     0.700  0       0.0  0
2937    Za 3E1515        15.1     0.      21.6 FIXEDHF     0.700  0       0.0  0
2938    Za 5E1515        10.4     0.      14.9 FIXEDHF     0.700  0       0.0  0
2939    Zb 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d7f
2940    Zb 2D1515       110.8     0.     158.3 FIXEDHF     0.700  0       0.0  0
2941    Zb 4D1515        27.7     0.      39.6 FIXEDHF     0.700  0       0.0  0
2942    Zb 1E1515        21.8     0.      31.1 FIXEDHF     0.700  0       0.0  0
2943    Zb 3E1515        12.7     0.      18.1 FIXEDHF     0.700  0       0.0  0
2944    Zb 5E1515         8.8     0.      12.5 FIXEDHF     0.700  0       0.0  0
2945    Zc 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d8f
2946    Zc 2D1515        88.8     0.     126.9 FIXEDHF     0.700  0       0.0  0
2947    Zc 4D1515        23.0     0.      32.9 FIXEDHF     0.700  0       0.0  0
2948    Zc 1E1515        18.5     0.      26.4 FIXEDHF     0.700  0       0.0  0
2949    Zc 3E1515        10.8     0.      15.4 FIXEDHF     0.700  0       0.0  0
2950    Zc 5E1515         7.4     0.      10.6 FIXEDHF     0.700  0       0.0  0
2951    Zd 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d9f
2952    Zd 2D1515        73.4     0.     104.9 FIXEDHF     0.700  0       0.0  0
2953    Zd 4D1515        19.5     0.      27.8 FIXEDHF     0.700  0       0.0  0
2954    Zd 1E1515        15.9     0.      22.7 FIXEDHF     0.700  0       0.0  0
2955    Zd 3E1515         9.3     0.      13.3 FIXEDHF     0.700  0       0.0  0
2956    Zd 5E1515         6.4     0.       9.1 FIXEDHF     0.700  0       0.0  0
2957    Ze 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d10f
2958    Ze 2D1515        62.2     0.      88.8 FIXEDHF     0.700  0       0.0  0
2959    Ze 4D1515        16.8     0.      24.0 FIXEDHF     0.700  0       0.0  0
2960    Ze 1E1515        13.9     0.      19.8 FIXEDHF     0.700  0       0.0  0
2961    Ze 3E1515         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0
2962    Ze 5E1515         5.6     0.       8.0 FIXEDHF     0.700  0       0.0  0
2963    Zf 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d11f
2964    Zf 2D1515        53.5     0.      76.5 FIXEDHF     0.700  0       0.0  0
2965    Zf 4D1515        14.6     0.      20.9 FIXEDHF     0.700  0       0.0  0
2966    Zf 1E1515        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
2967    Zf 3E1515         7.1     0.      10.2 FIXEDHF     0.700  0       0.0  0
2968    Zf 5E1515         4.9     0.       7.0 FIXEDHF     0.700  0       0.0  0
2969    Zg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d12f
2970    Zg 2D1515        46.8     0.      66.9 FIXEDHF     0.700  0       0.0  0
2971    Zg 4D1515        12.9     0.      18.4 FIXEDHF     0.700  0       0.0  0
2972    Zg 1E1515        10.8     0.      15.5 FIXEDHF     0.700  0       0.0  0
2973    Zg 3E1515         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
2974    Zg 5E1515         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
2975    Zh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d13f
2976    Zh 2D1515        41.4     0.      59.1 FIXEDHF     0.700  0       0.0  0
2977    Zh 4D1515        11.5     0.      16.4 FIXEDHF     0.700  0       0.0  0
2978    Zh 1E1515         9.7     0.      13.9 FIXEDHF     0.700  0       0.0  0
2979    Zh 3E1515         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0
2980    Zh 5E1515         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
2981    Zi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d5f      -3d14f
2982    Zi 2D1515        37.0     0.      52.8 FIXEDHF     0.700  0       0.0  0
2983    Zi 4D1515        10.4     0.      14.8 FIXEDHF     0.700  0       0.0  0
2984    Zi 1E1515         8.8     0.      12.5 FIXEDHF     0.700  0       0.0  0
2985    Zi 3E1515         5.1     0.       7.3 FIXEDHF     0.700  0       0.0  0
2986    Zi 5E1515         3.5     0.       5.0 FIXEDHF     0.700  0       0.0  0
2987    Zj 2D1526        15.3     0.      21.8 FIXEDHF     0.700  0       0.0  0  3d5f      -4s6h
2988    Zj 3E1526        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0
2989    Zk 2D1526        -2.0     0.      -2.9 FIXEDHF     0.700  0       0.0  0  3d5f      -4s7h
2990    Zk 3E1526        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
2991    Zl 2D1526        -8.3     0.     -11.9 FIXEDHF     0.700  0       0.0  0  3d5f      -4s8h
2992    Zl 3E1526        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0
2993    Zm 2D1526       -10.4     0.     -14.8 FIXEDHF     0.700  0       0.0  0  3d5f      -4s9h
2994    Zm 3E1526        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0
2995    Zn 2D1516       -11.4     0.     -16.3 FIXEDHF     0.700  0       0.0  0  3d5f      -3d6h
2996    Zn 4D1516         1.1     0.       1.6 FIXEDHF     0.700  0       0.0  0
2997    Zn 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
2998    Zn 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
2999    Zo 2D1516         1.5     0.       2.2 FIXEDHF     0.700  0       0.0  0  3d5f      -3d7h
3000    Zo 4D1516         1.5     0.       2.1 FIXEDHF     0.700  0       0.0  0
3001    Zo 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3002    Zo 5E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3003    Zp 2D1516         6.2     0.       8.9 FIXEDHF     0.700  0       0.0  0  3d5f      -3d8h
3004    Zp 4D1516         1.5     0.       2.2 FIXEDHF     0.700  0       0.0  0
3005    Zp 3E1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3006    Zp 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3007    Zq 2D1516         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0  3d5f      -3d9h
3008    Zq 4D1516         1.5     0.       2.1 FIXEDHF     0.700  0       0.0  0
3009    Zq 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3010    Zq 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3011    Zt 4D1517        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d5f      -3d8k
3012    Zt 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3013    Zu 4D1517        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d5f      -3d9k
3014    Zu 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3015    Zv 1D1538     -1171.9     0.   -1674.1 FIXEDHF     0.700  0       0.0  0  3d5f      -4p4d
3016    Zv 3D1538      -317.8     0.    -454.0 FIXEDHF     0.700  0       0.0  0
3017    Zv 2E1538       -44.2     0.     -63.2 FIXEDHF     0.700  0       0.0  0
3018    Zv 4E1538       -62.2     0.     -88.9 FIXEDHF     0.700  0       0.0  0
3019    Zw 1D1538      -661.9     0.    -945.6 FIXEDHF     0.700  0       0.0  0  3d5f      -4p5d
3020    Zw 3D1538      -178.4     0.    -254.9 FIXEDHF     0.700  0       0.0  0
3021    Zw 2E1538       -49.5     0.     -70.7 FIXEDHF     0.700  0       0.0  0
3022    Zw 4E1538       -52.8     0.     -75.4 FIXEDHF     0.700  0       0.0  0
3023    Zx 1D1538       -49.9     0.     -71.3 FIXEDHF     0.700  0       0.0  0  3d5f      -4p6d
3024    Zx 3D1538      -106.9     0.    -152.7 FIXEDHF     0.700  0       0.0  0
3025    Zx 2E1538       -41.3     0.     -59.0 FIXEDHF     0.700  0       0.0  0
3026    Zx 4E1538       -41.2     0.     -58.8 FIXEDHF     0.700  0       0.0  0
3027    Zy 1D1538       -51.4     0.     -73.5 FIXEDHF     0.700  0       0.0  0  3d5f      -4p7d
3028    Zy 3D1538       -75.0     0.    -107.2 FIXEDHF     0.700  0       0.0  0
3029    Zy 2E1538       -33.7     0.     -48.1 FIXEDHF     0.700  0       0.0  0
3030    Zy 4E1538       -32.5     0.     -46.4 FIXEDHF     0.700  0       0.0  0
3031    Zz 1D1538       -37.0     0.     -52.9 FIXEDHF     0.700  0       0.0  0  3d5f      -4p8d
3032    Zz 3D1538       -56.4     0.     -80.6 FIXEDHF     0.700  0       0.0  0
3033    Zz 2E1538       -27.6     0.     -39.5 FIXEDHF     0.700  0       0.0  0
3034    Zz 4E1538       -26.3     0.     -37.5 FIXEDHF     0.700  0       0.0  0
3035    ab 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d7f
3036    ab 2D1515        91.8     0.     131.2 FIXEDHF     0.700  0       0.0  0
3037    ab 4D1515        22.5     0.      32.1 FIXEDHF     0.700  0       0.0  0
3038    ab 1E1515        18.3     0.      26.1 FIXEDHF     0.700  0       0.0  0
3039    ab 3E1515        10.6     0.      15.2 FIXEDHF     0.700  0       0.0  0
3040    ab 5E1515         7.3     0.      10.5 FIXEDHF     0.700  0       0.0  0
3041    ac 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d8f
3042    ac 2D1515        73.7     0.     105.3 FIXEDHF     0.700  0       0.0  0
3043    ac 4D1515        18.7     0.      26.7 FIXEDHF     0.700  0       0.0  0
3044    ac 1E1515        15.5     0.      22.1 FIXEDHF     0.700  0       0.0  0
3045    ac 3E1515         9.0     0.      12.9 FIXEDHF     0.700  0       0.0  0
3046    ac 5E1515         6.2     0.       8.9 FIXEDHF     0.700  0       0.0  0
3047    ad 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d9f
3048    ad 2D1515        61.0     0.      87.2 FIXEDHF     0.700  0       0.0  0
3049    ad 4D1515        15.9     0.      22.7 FIXEDHF     0.700  0       0.0  0
3050    ad 1E1515        13.3     0.      19.0 FIXEDHF     0.700  0       0.0  0
3051    ad 3E1515         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0
3052    ad 5E1515         5.4     0.       7.7 FIXEDHF     0.700  0       0.0  0
3053    ae 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d10f
3054    ae 2D1515        51.7     0.      73.9 FIXEDHF     0.700  0       0.0  0
3055    ae 4D1515        13.6     0.      19.5 FIXEDHF     0.700  0       0.0  0
3056    ae 1E1515        11.6     0.      16.6 FIXEDHF     0.700  0       0.0  0
3057    ae 3E1515         6.8     0.       9.7 FIXEDHF     0.700  0       0.0  0
3058    ae 5E1515         4.7     0.       6.7 FIXEDHF     0.700  0       0.0  0
3059    af 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d11f
3060    af 2D1515        44.6     0.      63.7 FIXEDHF     0.700  0       0.0  0
3061    af 4D1515        12.0     0.      17.1 FIXEDHF     0.700  0       0.0  0
3062    af 1E1515        10.2     0.      14.6 FIXEDHF     0.700  0       0.0  0
3063    af 3E1515         5.9     0.       8.5 FIXEDHF     0.700  0       0.0  0
3064    af 5E1515         4.1     0.       5.9 FIXEDHF     0.700  0       0.0  0
3065    ag 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d12f
3066    ag 2D1515        39.0     0.      55.7 FIXEDHF     0.700  0       0.0  0
3067    ag 4D1515        10.6     0.      15.1 FIXEDHF     0.700  0       0.0  0
3068    ag 1E1515         9.1     0.      13.0 FIXEDHF     0.700  0       0.0  0
3069    ag 3E1515         5.3     0.       7.6 FIXEDHF     0.700  0       0.0  0
3070    ag 5E1515         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
3071    ah 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d13f
3072    ah 2D1515        34.5     0.      49.3 FIXEDHF     0.700  0       0.0  0
3073    ah 4D1515         9.4     0.      13.4 FIXEDHF     0.700  0       0.0  0
3074    ah 1E1515         8.1     0.      11.6 FIXEDHF     0.700  0       0.0  0
3075    ah 3E1515         4.8     0.       6.8 FIXEDHF     0.700  0       0.0  0
3076    ah 5E1515         3.3     0.       4.7 FIXEDHF     0.700  0       0.0  0
3077    ai 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d14f
3078    ai 2D1515        30.8     0.      44.0 FIXEDHF     0.700  0       0.0  0
3079    ai 4D1515         8.5     0.      12.1 FIXEDHF     0.700  0       0.0  0
3080    ai 1E1515         7.3     0.      10.5 FIXEDHF     0.700  0       0.0  0
3081    ai 3E1515         4.3     0.       6.1 FIXEDHF     0.700  0       0.0  0
3082    ai 5E1515         2.9     0.       4.2 FIXEDHF     0.700  0       0.0  0
3083    aj 2D1526         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d6f      -4s6h
3084    aj 3E1526        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
3085    ak 2D1526         6.9     0.       9.9 FIXEDHF     0.700  0       0.0  0  3d6f      -4s7h
3086    ak 3E1526        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
3087    al 2D1526         2.9     0.       4.2 FIXEDHF     0.700  0       0.0  0  3d6f      -4s8h
3088    al 3E1526        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
3089    am 2D1526         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0  3d6f      -4s9h
3090    am 3E1526        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0
3091    an 2D1516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d6f      -3d6h
3092    an 4D1516         0.8     0.       1.1 FIXEDHF     0.700  0       0.0  0
3093    an 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3094    an 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3095    ao 2D1516        -5.2     0.      -7.4 FIXEDHF     0.700  0       0.0  0  3d6f      -3d7h
3096    ao 4D1516         0.9     0.       1.3 FIXEDHF     0.700  0       0.0  0
3097    ao 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3098    ao 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3099    ap 2D1516        -2.2     0.      -3.2 FIXEDHF     0.700  0       0.0  0  3d6f      -3d8h
3100    ap 4D1516         1.0     0.       1.4 FIXEDHF     0.700  0       0.0  0
3101    ap 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3102    ap 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3103    aq 2D1516        -0.3     0.      -0.5 FIXEDHF     0.700  0       0.0  0  3d6f      -3d9h
3104    aq 4D1516         0.9     0.       1.3 FIXEDHF     0.700  0       0.0  0
3105    aq 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3106    aq 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3107    at 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d8k
3108    at 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3109    au 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6f      -3d9k
3110    au 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3111    av 1D1538      -830.9     0.   -1187.0 FIXEDHF     0.700  0       0.0  0  3d6f      -4p4d
3112    av 3D1538      -243.9     0.    -348.5 FIXEDHF     0.700  0       0.0  0
3113    av 2E1538       -33.6     0.     -48.0 FIXEDHF     0.700  0       0.0  0
3114    av 4E1538       -49.9     0.     -71.3 FIXEDHF     0.700  0       0.0  0
3115    aw 1D1538      -533.5     0.    -762.2 FIXEDHF     0.700  0       0.0  0  3d6f      -4p5d
3116    aw 3D1538      -147.6     0.    -210.9 FIXEDHF     0.700  0       0.0  0
3117    aw 2E1538       -39.5     0.     -56.4 FIXEDHF     0.700  0       0.0  0
3118    aw 4E1538       -43.0     0.     -61.5 FIXEDHF     0.700  0       0.0  0
3119    ax 1D1538      -282.5     0.    -403.6 FIXEDHF     0.700  0       0.0  0  3d6f      -4p6d
3120    ax 3D1538       -94.0     0.    -134.3 FIXEDHF     0.700  0       0.0  0
3121    ax 2E1538       -33.3     0.     -47.6 FIXEDHF     0.700  0       0.0  0
3122    ax 4E1538       -33.7     0.     -48.2 FIXEDHF     0.700  0       0.0  0
3123    ay 1D1538       -24.9     0.     -35.6 FIXEDHF     0.700  0       0.0  0  3d6f      -4p7d
3124    ay 3D1538       -64.9     0.     -92.7 FIXEDHF     0.700  0       0.0  0
3125    ay 2E1538       -27.2     0.     -38.9 FIXEDHF     0.700  0       0.0  0
3126    ay 4E1538       -26.7     0.     -38.2 FIXEDHF     0.700  0       0.0  0
3127    az 1D1538       -31.6     0.     -45.2 FIXEDHF     0.700  0       0.0  0  3d6f      -4p8d
3128    az 3D1538       -48.8     0.     -69.7 FIXEDHF     0.700  0       0.0  0
3129    az 2E1538       -22.5     0.     -32.1 FIXEDHF     0.700  0       0.0  0
3130    az 4E1538       -21.6     0.     -30.9 FIXEDHF     0.700  0       0.0  0
3131    bc 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d8f
3132    bc 2D1515        61.2     0.      87.4 FIXEDHF     0.700  0       0.0  0
3133    bc 4D1515        15.4     0.      22.0 FIXEDHF     0.700  0       0.0  0
3134    bc 1E1515        13.0     0.      18.6 FIXEDHF     0.700  0       0.0  0
3135    bc 3E1515         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0
3136    bc 5E1515         5.3     0.       7.5 FIXEDHF     0.700  0       0.0  0
3137    bd 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d9f
3138    bd 2D1515        50.8     0.      72.5 FIXEDHF     0.700  0       0.0  0
3139    bd 4D1515        13.1     0.      18.7 FIXEDHF     0.700  0       0.0  0
3140    bd 1E1515        11.2     0.      16.0 FIXEDHF     0.700  0       0.0  0
3141    bd 3E1515         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0
3142    bd 5E1515         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0
3143    be 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d10f
3144    be 2D1515        43.0     0.      61.4 FIXEDHF     0.700  0       0.0  0
3145    be 4D1515        11.3     0.      16.1 FIXEDHF     0.700  0       0.0  0
3146    be 1E1515         9.7     0.      13.9 FIXEDHF     0.700  0       0.0  0
3147    be 3E1515         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0
3148    be 5E1515         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
3149    bf 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d11f
3150    bf 2D1515        37.1     0.      53.0 FIXEDHF     0.700  0       0.0  0
3151    bf 4D1515         9.9     0.      14.1 FIXEDHF     0.700  0       0.0  0
3152    bf 1E1515         8.6     0.      12.3 FIXEDHF     0.700  0       0.0  0
3153    bf 3E1515         5.0     0.       7.2 FIXEDHF     0.700  0       0.0  0
3154    bf 5E1515         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0
3155    bg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d12f
3156    bg 2D1515        32.5     0.      46.4 FIXEDHF     0.700  0       0.0  0
3157    bg 4D1515         8.7     0.      12.4 FIXEDHF     0.700  0       0.0  0
3158    bg 1E1515         7.6     0.      10.9 FIXEDHF     0.700  0       0.0  0
3159    bg 3E1515         4.5     0.       6.4 FIXEDHF     0.700  0       0.0  0
3160    bg 5E1515         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
3161    bh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d13f
3162    bh 2D1515        28.8     0.      41.1 FIXEDHF     0.700  0       0.0  0
3163    bh 4D1515         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0
3164    bh 1E1515         6.9     0.       9.8 FIXEDHF     0.700  0       0.0  0
3165    bh 3E1515         4.0     0.       5.7 FIXEDHF     0.700  0       0.0  0
3166    bh 5E1515         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0
3167    bi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d14f
3168    bi 2D1515        25.7     0.      36.7 FIXEDHF     0.700  0       0.0  0
3169    bi 4D1515         7.0     0.      10.0 FIXEDHF     0.700  0       0.0  0
3170    bi 1E1515         6.2     0.       8.8 FIXEDHF     0.700  0       0.0  0
3171    bi 3E1515         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
3172    bi 5E1515         2.5     0.       3.6 FIXEDHF     0.700  0       0.0  0
3173    bj 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d7f      -4s6h
3174    bj 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3175    bk 2D1526         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d7f      -4s7h
3176    bk 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3177    bl 2D1526         3.2     0.       4.6 FIXEDHF     0.700  0       0.0  0  3d7f      -4s8h
3178    bl 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3179    bm 2D1526         2.3     0.       3.3 FIXEDHF     0.700  0       0.0  0  3d7f      -4s9h
3180    bm 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3181    bn 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d7f      -3d6h
3182    bn 4D1516         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
3183    bn 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3184    bn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3185    bo 2D1516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d7f      -3d7h
3186    bo 4D1516         0.7     0.       1.0 FIXEDHF     0.700  0       0.0  0
3187    bo 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3188    bo 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3189    bp 2D1516        -2.4     0.      -3.5 FIXEDHF     0.700  0       0.0  0  3d7f      -3d8h
3190    bp 4D1516         0.7     0.       1.0 FIXEDHF     0.700  0       0.0  0
3191    bp 3E1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3192    bp 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3193    bq 2D1516        -1.8     0.      -2.5 FIXEDHF     0.700  0       0.0  0  3d7f      -3d9h
3194    bq 4D1516         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0
3195    bq 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3196    bq 5E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3197    bt 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d8k
3198    bt 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3199    bu 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7f      -3d9k
3200    bu 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3201    bv 1D1538      -632.4     0.    -903.4 FIXEDHF     0.700  0       0.0  0  3d7f      -4p4d
3202    bv 3D1538      -194.0     0.    -277.2 FIXEDHF     0.700  0       0.0  0
3203    bv 2E1538       -26.4     0.     -37.7 FIXEDHF     0.700  0       0.0  0
3204    bv 4E1538       -40.7     0.     -58.1 FIXEDHF     0.700  0       0.0  0
3205    bw 1D1538      -427.3     0.    -610.5 FIXEDHF     0.700  0       0.0  0  3d7f      -4p5d
3206    bw 3D1538      -121.7     0.    -173.9 FIXEDHF     0.700  0       0.0  0
3207    bw 2E1538       -32.1     0.     -45.8 FIXEDHF     0.700  0       0.0  0
3208    bw 4E1538       -35.4     0.     -50.6 FIXEDHF     0.700  0       0.0  0
3209    bx 1D1538      -256.2     0.    -366.0 FIXEDHF     0.700  0       0.0  0  3d7f      -4p6d
3210    bx 3D1538       -79.6     0.    -113.7 FIXEDHF     0.700  0       0.0  0
3211    bx 2E1538       -27.2     0.     -38.9 FIXEDHF     0.700  0       0.0  0
3212    bx 4E1538       -27.9     0.     -39.8 FIXEDHF     0.700  0       0.0  0
3213    by 1D1538      -137.6     0.    -196.6 FIXEDHF     0.700  0       0.0  0  3d7f      -4p7d
3214    by 3D1538       -55.9     0.     -79.9 FIXEDHF     0.700  0       0.0  0
3215    by 2E1538       -22.3     0.     -31.9 FIXEDHF     0.700  0       0.0  0
3216    by 4E1538       -22.1     0.     -31.6 FIXEDHF     0.700  0       0.0  0
3217    bz 1D1538       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0  3d7f      -4p8d
3218    bz 3D1538       -41.7     0.     -59.6 FIXEDHF     0.700  0       0.0  0
3219    bz 2E1538       -18.5     0.     -26.4 FIXEDHF     0.700  0       0.0  0
3220    bz 4E1538       -17.9     0.     -25.6 FIXEDHF     0.700  0       0.0  0
3221    cd 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d9f
3222    cd 2D1515        42.7     0.      61.0 FIXEDHF     0.700  0       0.0  0
3223    cd 4D1515        10.9     0.      15.6 FIXEDHF     0.700  0       0.0  0
3224    cd 1E1515         9.5     0.      13.6 FIXEDHF     0.700  0       0.0  0
3225    cd 3E1515         5.5     0.       7.9 FIXEDHF     0.700  0       0.0  0
3226    cd 5E1515         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
3227    ce 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d10f
3228    ce 2D1515        36.2     0.      51.7 FIXEDHF     0.700  0       0.0  0
3229    ce 4D1515         9.4     0.      13.5 FIXEDHF     0.700  0       0.0  0
3230    ce 1E1515         8.3     0.      11.8 FIXEDHF     0.700  0       0.0  0
3231    ce 3E1515         4.8     0.       6.9 FIXEDHF     0.700  0       0.0  0
3232    ce 5E1515         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
3233    cf 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d11f
3234    cf 2D1515        31.2     0.      44.6 FIXEDHF     0.700  0       0.0  0
3235    cf 4D1515         8.3     0.      11.8 FIXEDHF     0.700  0       0.0  0
3236    cf 1E1515         7.3     0.      10.4 FIXEDHF     0.700  0       0.0  0
3237    cf 3E1515         4.3     0.       6.1 FIXEDHF     0.700  0       0.0  0
3238    cf 5E1515         2.9     0.       4.2 FIXEDHF     0.700  0       0.0  0
3239    cg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d12f
3240    cg 2D1515        27.4     0.      39.1 FIXEDHF     0.700  0       0.0  0
3241    cg 4D1515         7.3     0.      10.4 FIXEDHF     0.700  0       0.0  0
3242    cg 1E1515         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0
3243    cg 3E1515         3.8     0.       5.4 FIXEDHF     0.700  0       0.0  0
3244    cg 5E1515         2.6     0.       3.7 FIXEDHF     0.700  0       0.0  0
3245    ch 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d13f
3246    ch 2D1515        24.2     0.      34.6 FIXEDHF     0.700  0       0.0  0
3247    ch 4D1515         6.5     0.       9.3 FIXEDHF     0.700  0       0.0  0
3248    ch 1E1515         5.8     0.       8.3 FIXEDHF     0.700  0       0.0  0
3249    ch 3E1515         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
3250    ch 5E1515         2.3     0.       3.3 FIXEDHF     0.700  0       0.0  0
3251    ci 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d14f
3252    ci 2D1515        21.6     0.      30.9 FIXEDHF     0.700  0       0.0  0
3253    ci 4D1515         5.9     0.       8.4 FIXEDHF     0.700  0       0.0  0
3254    ci 1E1515         5.3     0.       7.5 FIXEDHF     0.700  0       0.0  0
3255    ci 3E1515         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
3256    ci 5E1515         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0
3257    cj 2D1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d8f      -4s6h
3258    cj 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3259    ck 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d8f      -4s7h
3260    ck 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3261    cl 2D1526         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d8f      -4s8h
3262    cl 3E1526        -0.3     0.      -0.4 FIXEDHF     0.700  0       0.0  0
3263    cm 2D1526         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0  3d8f      -4s9h
3264    cm 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3265    cn 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d8f      -3d6h
3266    cn 4D1516         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3267    cn 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3268    cn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3269    co 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d8f      -3d7h
3270    co 4D1516         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
3271    co 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3272    co 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3273    cp 2D1516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d8f      -3d8h
3274    cp 4D1516         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
3275    cp 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3276    cp 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3277    cq 2D1516        -1.3     0.      -1.8 FIXEDHF     0.700  0       0.0  0  3d8f      -3d9h
3278    cq 4D1516         0.5     0.       0.7 FIXEDHF     0.700  0       0.0  0
3279    cq 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3280    cq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3281    ct 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d8k
3282    ct 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3283    cu 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8f      -3d9k
3284    cu 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3285    cv 1D1538      -503.9     0.    -719.8 FIXEDHF     0.700  0       0.0  0  3d8f      -4p4d
3286    cv 3D1538      -158.9     0.    -227.0 FIXEDHF     0.700  0       0.0  0
3287    cv 2E1538       -21.3     0.     -30.5 FIXEDHF     0.700  0       0.0  0
3288    cv 4E1538       -33.8     0.     -48.3 FIXEDHF     0.700  0       0.0  0
3289    cw 1D1538      -350.0     0.    -500.0 FIXEDHF     0.700  0       0.0  0  3d8f      -4p5d
3290    cw 3D1538      -101.8     0.    -145.5 FIXEDHF     0.700  0       0.0  0
3291    cw 2E1538       -26.6     0.     -38.0 FIXEDHF     0.700  0       0.0  0
3292    cw 4E1538       -29.7     0.     -42.4 FIXEDHF     0.700  0       0.0  0
3293    cx 1D1538      -220.4     0.    -314.8 FIXEDHF     0.700  0       0.0  0  3d8f      -4p6d
3294    cx 3D1538       -67.5     0.     -96.5 FIXEDHF     0.700  0       0.0  0
3295    cx 2E1538       -22.8     0.     -32.5 FIXEDHF     0.700  0       0.0  0
3296    cx 4E1538       -23.4     0.     -33.5 FIXEDHF     0.700  0       0.0  0
3297    cy 1D1538      -134.0     0.    -191.5 FIXEDHF     0.700  0       0.0  0  3d8f      -4p7d
3298    cy 3D1538       -47.9     0.     -68.5 FIXEDHF     0.700  0       0.0  0
3299    cy 2E1538       -18.7     0.     -26.7 FIXEDHF     0.700  0       0.0  0
3300    cy 4E1538       -18.6     0.     -26.6 FIXEDHF     0.700  0       0.0  0
3301    cz 1D1538       -74.0     0.    -105.7 FIXEDHF     0.700  0       0.0  0  3d8f      -4p8d
3302    cz 3D1538       -36.0     0.     -51.5 FIXEDHF     0.700  0       0.0  0
3303    cz 2E1538       -15.4     0.     -22.0 FIXEDHF     0.700  0       0.0  0
3304    cz 4E1538       -15.1     0.     -21.6 FIXEDHF     0.700  0       0.0  0
3305    de 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d10f
3306    de 2D1515        30.9     0.      44.1 FIXEDHF     0.700  0       0.0  0
3307    de 4D1515         8.0     0.      11.5 FIXEDHF     0.700  0       0.0  0
3308    de 1E1515         7.1     0.      10.2 FIXEDHF     0.700  0       0.0  0
3309    de 3E1515         4.1     0.       5.9 FIXEDHF     0.700  0       0.0  0
3310    de 5E1515         2.9     0.       4.1 FIXEDHF     0.700  0       0.0  0
3311    df 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d11f
3312    df 2D1515        26.7     0.      38.1 FIXEDHF     0.700  0       0.0  0
3313    df 4D1515         7.1     0.      10.1 FIXEDHF     0.700  0       0.0  0
3314    df 1E1515         6.3     0.       9.0 FIXEDHF     0.700  0       0.0  0
3315    df 3E1515         3.6     0.       5.2 FIXEDHF     0.700  0       0.0  0
3316    df 5E1515         2.5     0.       3.6 FIXEDHF     0.700  0       0.0  0
3317    dg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d12f
3318    dg 2D1515        23.4     0.      33.4 FIXEDHF     0.700  0       0.0  0
3319    dg 4D1515         6.2     0.       8.9 FIXEDHF     0.700  0       0.0  0
3320    dg 1E1515         5.6     0.       8.0 FIXEDHF     0.700  0       0.0  0
3321    dg 3E1515         3.3     0.       4.7 FIXEDHF     0.700  0       0.0  0
3322    dg 5E1515         2.2     0.       3.2 FIXEDHF     0.700  0       0.0  0
3323    dh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d13f
3324    dh 2D1515        20.6     0.      29.5 FIXEDHF     0.700  0       0.0  0
3325    dh 4D1515         5.5     0.       7.9 FIXEDHF     0.700  0       0.0  0
3326    dh 1E1515         5.0     0.       7.2 FIXEDHF     0.700  0       0.0  0
3327    dh 3E1515         2.9     0.       4.2 FIXEDHF     0.700  0       0.0  0
3328    dh 5E1515         2.0     0.       2.9 FIXEDHF     0.700  0       0.0  0
3329    di 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d14f
3330    di 2D1515        18.5     0.      26.4 FIXEDHF     0.700  0       0.0  0
3331    di 4D1515         5.0     0.       7.1 FIXEDHF     0.700  0       0.0  0
3332    di 1E1515         4.5     0.       6.5 FIXEDHF     0.700  0       0.0  0
3333    di 3E1515         2.7     0.       3.8 FIXEDHF     0.700  0       0.0  0
3334    di 5E1515         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0
3335    dj 2D1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d9f      -4s6h
3336    dj 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3337    dk 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d9f      -4s7h
3338    dk 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3339    dl 2D1526         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -4s8h
3340    dl 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3341    dm 2D1526         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d9f      -4s9h
3342    dm 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3343    dn 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d9f      -3d6h
3344    dn 4D1516         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
3345    dn 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3346    dn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3347    do 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d9f      -3d7h
3348    do 4D1516         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3349    do 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3350    do 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3351    dp 2D1516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d8h
3352    dp 4D1516         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3353    dp 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3354    dp 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3355    dq 2D1516        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d9f      -3d9h
3356    dq 4D1516         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3357    dq 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3358    dq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3359    dt 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d8k
3360    dt 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3361    du 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9f      -3d9k
3362    du 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3363    dv 1D1538      -414.6     0.    -592.3 FIXEDHF     0.700  0       0.0  0  3d9f      -4p4d
3364    dv 3D1538      -133.2     0.    -190.3 FIXEDHF     0.700  0       0.0  0
3365    dv 2E1538       -17.6     0.     -25.2 FIXEDHF     0.700  0       0.0  0
3366    dv 4E1538       -28.6     0.     -40.8 FIXEDHF     0.700  0       0.0  0
3367    dw 1D1538      -293.0     0.    -418.6 FIXEDHF     0.700  0       0.0  0  3d9f      -4p5d
3368    dw 3D1538       -86.6     0.    -123.7 FIXEDHF     0.700  0       0.0  0
3369    dw 2E1538       -22.5     0.     -32.1 FIXEDHF     0.700  0       0.0  0
3370    dw 4E1538       -25.3     0.     -36.1 FIXEDHF     0.700  0       0.0  0
3371    dx 1D1538      -189.3     0.    -270.5 FIXEDHF     0.700  0       0.0  0  3d9f      -4p6d
3372    dx 3D1538       -58.0     0.     -82.8 FIXEDHF     0.700  0       0.0  0
3373    dx 2E1538       -19.3     0.     -27.5 FIXEDHF     0.700  0       0.0  0
3374    dx 4E1538       -20.0     0.     -28.6 FIXEDHF     0.700  0       0.0  0
3375    dy 1D1538      -121.0     0.    -172.8 FIXEDHF     0.700  0       0.0  0  3d9f      -4p7d
3376    dy 3D1538       -41.4     0.     -59.1 FIXEDHF     0.700  0       0.0  0
3377    dy 2E1538       -15.9     0.     -22.7 FIXEDHF     0.700  0       0.0  0
3378    dy 4E1538       -15.9     0.     -22.7 FIXEDHF     0.700  0       0.0  0
3379    dz 1D1538       -75.7     0.    -108.1 FIXEDHF     0.700  0       0.0  0  3d9f      -4p8d
3380    dz 3D1538       -31.2     0.     -44.6 FIXEDHF     0.700  0       0.0  0
3381    dz 2E1538       -13.1     0.     -18.7 FIXEDHF     0.700  0       0.0  0
3382    dz 4E1538       -12.9     0.     -18.4 FIXEDHF     0.700  0       0.0  0
3383    ef 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d11f
3384    ef 2D1515        23.1     0.      33.0 FIXEDHF     0.700  0       0.0  0
3385    ef 4D1515         6.1     0.       8.7 FIXEDHF     0.700  0       0.0  0
3386    ef 1E1515         5.5     0.       7.8 FIXEDHF     0.700  0       0.0  0
3387    ef 3E1515         3.2     0.       4.6 FIXEDHF     0.700  0       0.0  0
3388    ef 5E1515         2.2     0.       3.2 FIXEDHF     0.700  0       0.0  0
3389    eg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d12f
3390    eg 2D1515        20.2     0.      28.9 FIXEDHF     0.700  0       0.0  0
3391    eg 4D1515         5.4     0.       7.7 FIXEDHF     0.700  0       0.0  0
3392    eg 1E1515         4.8     0.       6.9 FIXEDHF     0.700  0       0.0  0
3393    eg 3E1515         2.9     0.       4.1 FIXEDHF     0.700  0       0.0  0
3394    eg 5E1515         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0
3395    eh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d13f
3396    eh 2D1515        17.9     0.      25.6 FIXEDHF     0.700  0       0.0  0
3397    eh 4D1515         4.8     0.       6.8 FIXEDHF     0.700  0       0.0  0
3398    eh 1E1515         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
3399    eh 3E1515         2.5     0.       3.6 FIXEDHF     0.700  0       0.0  0
3400    eh 5E1515         1.8     0.       2.5 FIXEDHF     0.700  0       0.0  0
3401    ei 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d14f
3402    ei 2D1515        16.0     0.      22.9 FIXEDHF     0.700  0       0.0  0
3403    ei 4D1515         4.3     0.       6.2 FIXEDHF     0.700  0       0.0  0
3404    ei 1E1515         3.9     0.       5.6 FIXEDHF     0.700  0       0.0  0
3405    ei 3E1515         2.3     0.       3.3 FIXEDHF     0.700  0       0.0  0
3406    ei 5E1515         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0
3407    ej 2D1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0  3d10f     -4s6h
3408    ej 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3409    ek 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d10f     -4s7h
3410    ek 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3411    el 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d10f     -4s8h
3412    el 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3413    em 2D1526         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -4s9h
3414    em 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3415    en 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d10f     -3d6h
3416    en 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3417    en 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3418    en 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3419    eo 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d10f     -3d7h
3420    eo 4D1516         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
3421    eo 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3422    eo 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3423    ep 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d10f     -3d8h
3424    ep 4D1516         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
3425    ep 3E1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3426    ep 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3427    eq 2D1516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d9h
3428    eq 4D1516         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0
3429    eq 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3430    eq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3431    et 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d8k
3432    et 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3433    eu 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d10f     -3d9k
3434    eu 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3435    ev 1D1538      -349.4     0.    -499.1 FIXEDHF     0.700  0       0.0  0  3d10f     -4p4d
3436    ev 3D1538      -113.8     0.    -162.6 FIXEDHF     0.700  0       0.0  0
3437    ev 2E1538       -14.9     0.     -21.3 FIXEDHF     0.700  0       0.0  0
3438    ev 4E1538       -24.6     0.     -35.1 FIXEDHF     0.700  0       0.0  0
3439    ew 1D1538      -249.9     0.    -357.0 FIXEDHF     0.700  0       0.0  0  3d10f     -4p5d
3440    ew 3D1538       -74.8     0.    -106.8 FIXEDHF     0.700  0       0.0  0
3441    ew 2E1538       -19.3     0.     -27.6 FIXEDHF     0.700  0       0.0  0
3442    ew 4E1538       -21.8     0.     -31.2 FIXEDHF     0.700  0       0.0  0
3443    ex 1D1538      -164.1     0.    -234.5 FIXEDHF     0.700  0       0.0  0  3d10f     -4p6d
3444    ex 3D1538       -50.3     0.     -71.9 FIXEDHF     0.700  0       0.0  0
3445    ex 2E1538       -16.6     0.     -23.7 FIXEDHF     0.700  0       0.0  0
3446    ex 4E1538       -17.3     0.     -24.7 FIXEDHF     0.700  0       0.0  0
3447    ey 1D1538      -107.7     0.    -153.8 FIXEDHF     0.700  0       0.0  0  3d10f     -4p7d
3448    ey 3D1538       -36.0     0.     -51.5 FIXEDHF     0.700  0       0.0  0
3449    ey 2E1538       -13.6     0.     -19.5 FIXEDHF     0.700  0       0.0  0
3450    ey 4E1538       -13.8     0.     -19.7 FIXEDHF     0.700  0       0.0  0
3451    ez 1D1538       -70.8     0.    -101.1 FIXEDHF     0.700  0       0.0  0  3d10f     -4p8d
3452    ez 3D1538       -27.3     0.     -39.0 FIXEDHF     0.700  0       0.0  0
3453    ez 2E1538       -11.3     0.     -16.2 FIXEDHF     0.700  0       0.0  0
3454    ez 4E1538       -11.2     0.     -16.0 FIXEDHF     0.700  0       0.0  0
3455    fg 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11f     -3d12f
3456    fg 2D1515        17.7     0.      25.3 FIXEDHF     0.700  0       0.0  0
3457    fg 4D1515         4.7     0.       6.7 FIXEDHF     0.700  0       0.0  0
3458    fg 1E1515         4.3     0.       6.1 FIXEDHF     0.700  0       0.0  0
3459    fg 3E1515         2.5     0.       3.6 FIXEDHF     0.700  0       0.0  0
3460    fg 5E1515         1.8     0.       2.5 FIXEDHF     0.700  0       0.0  0
3461    fh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11f     -3d13f
3462    fh 2D1515        15.7     0.      22.4 FIXEDHF     0.700  0       0.0  0
3463    fh 4D1515         4.2     0.       6.0 FIXEDHF     0.700  0       0.0  0
3464    fh 1E1515         3.8     0.       5.5 FIXEDHF     0.700  0       0.0  0
3465    fh 3E1515         2.2     0.       3.2 FIXEDHF     0.700  0       0.0  0
3466    fh 5E1515         1.5     0.       2.2 FIXEDHF     0.700  0       0.0  0
3467    fi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11f     -3d14f
3468    fi 2D1515        14.0     0.      20.0 FIXEDHF     0.700  0       0.0  0
3469    fi 4D1515         3.8     0.       5.4 FIXEDHF     0.700  0       0.0  0
3470    fi 1E1515         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0
3471    fi 3E1515         2.0     0.       2.9 FIXEDHF     0.700  0       0.0  0
3472    fi 5E1515         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0
3473    fj 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d11f     -4s6h
3474    fj 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3475    fk 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d11f     -4s7h
3476    fk 3E1526        -0.2     0.      -0.3 FIXEDHF     0.700  0       0.0  0
3477    fl 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11f     -4s8h
3478    fl 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3479    fm 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d11f     -4s9h
3480    fm 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3481    fn 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d11f     -3d6h
3482    fn 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3483    fn 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3484    fn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3485    fo 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d11f     -3d7h
3486    fo 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3487    fo 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3488    fo 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3489    fp 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d11f     -3d8h
3490    fp 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3491    fp 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3492    fp 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3493    fq 2D1516         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11f     -3d9h
3494    fq 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3495    fq 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3496    fq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3497    ft 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11f     -3d8k
3498    ft 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3499    fu 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d11f     -3d9k
3500    fu 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3501    fv 1D1538      -299.9     0.    -428.5 FIXEDHF     0.700  0       0.0  0  3d11f     -4p4d
3502    fv 3D1538       -98.7     0.    -141.0 FIXEDHF     0.700  0       0.0  0
3503    fv 2E1538       -12.8     0.     -18.3 FIXEDHF     0.700  0       0.0  0
3504    fv 4E1538       -21.4     0.     -30.6 FIXEDHF     0.700  0       0.0  0
3505    fw 1D1538      -216.4     0.    -309.2 FIXEDHF     0.700  0       0.0  0  3d11f     -4p5d
3506    fw 3D1538       -65.3     0.     -93.3 FIXEDHF     0.700  0       0.0  0
3507    fw 2E1538       -16.8     0.     -24.0 FIXEDHF     0.700  0       0.0  0
3508    fw 4E1538       -19.1     0.     -27.3 FIXEDHF     0.700  0       0.0  0
3509    fx 1D1538      -143.8     0.    -205.4 FIXEDHF     0.700  0       0.0  0  3d11f     -4p6d
3510    fx 3D1538       -44.2     0.     -63.1 FIXEDHF     0.700  0       0.0  0
3511    fx 2E1538       -14.5     0.     -20.7 FIXEDHF     0.700  0       0.0  0
3512    fx 4E1538       -15.2     0.     -21.7 FIXEDHF     0.700  0       0.0  0
3513    fy 1D1538       -95.8     0.    -136.9 FIXEDHF     0.700  0       0.0  0  3d11f     -4p7d
3514    fy 3D1538       -31.8     0.     -45.4 FIXEDHF     0.700  0       0.0  0
3515    fy 2E1538       -12.0     0.     -17.1 FIXEDHF     0.700  0       0.0  0
3516    fy 4E1538       -12.0     0.     -17.2 FIXEDHF     0.700  0       0.0  0
3517    fz 1D1538       -64.7     0.     -92.4 FIXEDHF     0.700  0       0.0  0  3d11f     -4p8d
3518    fz 3D1538       -24.1     0.     -34.4 FIXEDHF     0.700  0       0.0  0
3519    fz 2E1538        -9.9     0.     -14.1 FIXEDHF     0.700  0       0.0  0
3520    fz 4E1538        -9.8     0.     -14.0 FIXEDHF     0.700  0       0.0  0
3521    gh 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d12f     -3d13f
3522    gh 2D1515        13.9     0.      19.8 FIXEDHF     0.700  0       0.0  0
3523    gh 4D1515         3.7     0.       5.3 FIXEDHF     0.700  0       0.0  0
3524    gh 1E1515         3.4     0.       4.9 FIXEDHF     0.700  0       0.0  0
3525    gh 3E1515         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0
3526    gh 5E1515         1.4     0.       2.0 FIXEDHF     0.700  0       0.0  0
3527    gi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d12f     -3d14f
3528    gi 2D1515        12.4     0.      17.7 FIXEDHF     0.700  0       0.0  0
3529    gi 4D1515         3.4     0.       4.8 FIXEDHF     0.700  0       0.0  0
3530    gi 1E1515         3.1     0.       4.4 FIXEDHF     0.700  0       0.0  0
3531    gi 3E1515         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0
3532    gi 5E1515         1.3     0.       1.8 FIXEDHF     0.700  0       0.0  0
3533    gj 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d12f     -4s6h
3534    gj 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3535    gk 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d12f     -4s7h
3536    gk 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3537    gl 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12f     -4s8h
3538    gl 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3539    gm 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d12f     -4s9h
3540    gm 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3541    gn 2D1516         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d12f     -3d6h
3542    gn 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3543    gn 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3544    gn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3545    go 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d12f     -3d7h
3546    go 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3547    go 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3548    go 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3549    gp 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d12f     -3d8h
3550    gp 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3551    gp 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3552    gp 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3553    gq 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d12f     -3d9h
3554    gq 4D1516         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0
3555    gq 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3556    gq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3557    gt 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d12f     -3d8k
3558    gt 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3559    gu 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d12f     -3d9k
3560    gu 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3561    gv 1D1538      -261.4     0.    -373.4 FIXEDHF     0.700  0       0.0  0  3d12f     -4p4d
3562    gv 3D1538       -86.7     0.    -123.8 FIXEDHF     0.700  0       0.0  0
3563    gv 2E1538       -11.2     0.     -16.0 FIXEDHF     0.700  0       0.0  0
3564    gv 4E1538       -18.9     0.     -27.0 FIXEDHF     0.700  0       0.0  0
3565    gw 1D1538      -189.8     0.    -271.2 FIXEDHF     0.700  0       0.0  0  3d12f     -4p5d
3566    gw 3D1538       -57.7     0.     -82.4 FIXEDHF     0.700  0       0.0  0
3567    gw 2E1538       -14.8     0.     -21.1 FIXEDHF     0.700  0       0.0  0
3568    gw 4E1538       -16.9     0.     -24.2 FIXEDHF     0.700  0       0.0  0
3569    gx 1D1538      -127.1     0.    -181.6 FIXEDHF     0.700  0       0.0  0  3d12f     -4p6d
3570    gx 3D1538       -39.1     0.     -55.9 FIXEDHF     0.700  0       0.0  0
3571    gx 2E1538       -12.8     0.     -18.3 FIXEDHF     0.700  0       0.0  0
3572    gx 4E1538       -13.4     0.     -19.2 FIXEDHF     0.700  0       0.0  0
3573    gy 1D1538       -85.7     0.    -122.4 FIXEDHF     0.700  0       0.0  0  3d12f     -4p7d
3574    gy 3D1538       -28.2     0.     -40.3 FIXEDHF     0.700  0       0.0  0
3575    gy 2E1538       -10.6     0.     -15.1 FIXEDHF     0.700  0       0.0  0
3576    gy 4E1538       -10.7     0.     -15.3 FIXEDHF     0.700  0       0.0  0
3577    gz 1D1538       -58.8     0.     -84.0 FIXEDHF     0.700  0       0.0  0  3d12f     -4p8d
3578    gz 3D1538       -21.4     0.     -30.6 FIXEDHF     0.700  0       0.0  0
3579    gz 2E1538        -8.8     0.     -12.5 FIXEDHF     0.700  0       0.0  0
3580    gz 4E1538        -8.7     0.     -12.4 FIXEDHF     0.700  0       0.0  0
3581    hi 0D1515         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d13f     -3d14f
3582    hi 2D1515        11.1     0.      15.8 FIXEDHF     0.700  0       0.0  0
3583    hi 4D1515         3.0     0.       4.3 FIXEDHF     0.700  0       0.0  0
3584    hi 1E1515         2.8     0.       4.0 FIXEDHF     0.700  0       0.0  0
3585    hi 3E1515         1.6     0.       2.3 FIXEDHF     0.700  0       0.0  0
3586    hi 5E1515         1.1     0.       1.6 FIXEDHF     0.700  0       0.0  0
3587    hj 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d13f     -4s6h
3588    hj 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3589    hk 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d13f     -4s7h
3590    hk 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3591    hl 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -4s8h
3592    hl 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3593    hm 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -4s9h
3594    hm 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3595    hn 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -3d6h
3596    hn 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3597    hn 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3598    hn 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3599    ho 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -3d7h
3600    ho 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3601    ho 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3602    ho 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3603    hp 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -3d8h
3604    hp 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3605    hp 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3606    hp 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3607    hq 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d13f     -3d9h
3608    hq 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3609    hq 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3610    hq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3611    ht 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d13f     -3d8k
3612    ht 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3613    hu 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d13f     -3d9k
3614    hu 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3615    hv 1D1538      -230.5     0.    -329.3 FIXEDHF     0.700  0       0.0  0  3d13f     -4p4d
3616    hv 3D1538       -76.9     0.    -109.8 FIXEDHF     0.700  0       0.0  0
3617    hv 2E1538        -9.9     0.     -14.1 FIXEDHF     0.700  0       0.0  0
3618    hv 4E1538       -16.8     0.     -24.0 FIXEDHF     0.700  0       0.0  0
3619    hw 1D1538      -168.3     0.    -240.5 FIXEDHF     0.700  0       0.0  0  3d13f     -4p5d
3620    hw 3D1538       -51.4     0.     -73.4 FIXEDHF     0.700  0       0.0  0
3621    hw 2E1538       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0
3622    hw 4E1538       -15.1     0.     -21.6 FIXEDHF     0.700  0       0.0  0
3623    hx 1D1538      -113.4     0.    -162.0 FIXEDHF     0.700  0       0.0  0  3d13f     -4p6d
3624    hx 3D1538       -35.0     0.     -50.0 FIXEDHF     0.700  0       0.0  0
3625    hx 2E1538       -11.4     0.     -16.3 FIXEDHF     0.700  0       0.0  0
3626    hx 4E1538       -12.0     0.     -17.1 FIXEDHF     0.700  0       0.0  0
3627    hy 1D1538       -77.1     0.    -110.1 FIXEDHF     0.700  0       0.0  0  3d13f     -4p7d
3628    hy 3D1538       -25.3     0.     -36.1 FIXEDHF     0.700  0       0.0  0
3629    hy 2E1538        -9.4     0.     -13.4 FIXEDHF     0.700  0       0.0  0
3630    hy 4E1538        -9.5     0.     -13.6 FIXEDHF     0.700  0       0.0  0
3631    hz 1D1538       -53.5     0.     -76.4 FIXEDHF     0.700  0       0.0  0  3d13f     -4p8d
3632    hz 3D1538       -19.3     0.     -27.5 FIXEDHF     0.700  0       0.0  0
3633    hz 2E1538        -7.8     0.     -11.1 FIXEDHF     0.700  0       0.0  0
3634    hz 4E1538        -7.8     0.     -11.1 FIXEDHF     0.700  0       0.0  0
3635    ij 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d14f     -4s6h
3636    ij 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3637    ik 2D1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0  3d14f     -4s7h
3638    ik 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3639    il 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -4s8h
3640    il 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3641    im 2D1526        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -4s9h
3642    im 3E1526        -0.1     0.      -0.2 FIXEDHF     0.700  0       0.0  0
3643    in 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -3d6h
3644    in 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3645    in 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3646    in 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3647    io 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -3d7h
3648    io 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3649    io 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3650    io 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3651    ip 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -3d8h
3652    ip 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3653    ip 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3654    ip 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3655    iq 2D1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0  3d14f     -3d9h
3656    iq 4D1516         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0
3657    iq 3E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3658    iq 5E1516         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3659    it 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d14f     -3d8k
3660    it 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3661    iu 4D1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d14f     -3d9k
3662    iu 5E1517         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3663    iv 1D1538      -205.4     0.    -293.4 FIXEDHF     0.700  0       0.0  0  3d14f     -4p4d
3664    iv 3D1538       -68.9     0.     -98.4 FIXEDHF     0.700  0       0.0  0
3665    iv 2E1538        -8.8     0.     -12.5 FIXEDHF     0.700  0       0.0  0
3666    iv 4E1538       -15.1     0.     -21.6 FIXEDHF     0.700  0       0.0  0
3667    iw 1D1538      -150.6     0.    -215.1 FIXEDHF     0.700  0       0.0  0  3d14f     -4p5d
3668    iw 3D1538       -46.2     0.     -66.0 FIXEDHF     0.700  0       0.0  0
3669    iw 2E1538       -11.8     0.     -16.9 FIXEDHF     0.700  0       0.0  0
3670    iw 4E1538       -13.6     0.     -19.4 FIXEDHF     0.700  0       0.0  0
3671    ix 1D1538      -101.9     0.    -145.6 FIXEDHF     0.700  0       0.0  0  3d14f     -4p6d
3672    ix 3D1538       -31.5     0.     -45.0 FIXEDHF     0.700  0       0.0  0
3673    ix 2E1538       -10.2     0.     -14.6 FIXEDHF     0.700  0       0.0  0
3674    ix 4E1538       -10.8     0.     -15.4 FIXEDHF     0.700  0       0.0  0
3675    iy 1D1538       -69.6     0.     -99.5 FIXEDHF     0.700  0       0.0  0  3d14f     -4p7d
3676    iy 3D1538       -22.8     0.     -32.6 FIXEDHF     0.700  0       0.0  0
3677    iy 2E1538        -8.5     0.     -12.1 FIXEDHF     0.700  0       0.0  0
3678    iy 4E1538        -8.6     0.     -12.3 FIXEDHF     0.700  0       0.0  0
3679    iz 1D1538       -48.7     0.     -69.6 FIXEDHF     0.700  0       0.0  0  3d14f     -4p8d
3680    iz 3D1538       -17.4     0.     -24.8 FIXEDHF     0.700  0       0.0  0
3681    iz 2E1538        -7.0     0.     -10.0 FIXEDHF     0.700  0       0.0  0
3682    iz 4E1538        -7.0     0.     -10.0 FIXEDHF     0.700  0       0.0  0
3683    jk 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6h      -4s7h
3684    jk 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3685    jl 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6h      -4s8h
3686    jl 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3687    jm 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s6h      -4s9h
3688    jm 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3689    jn 2D2616       -40.7     0.     -58.2 FIXEDHF     0.700  0       0.0  0  4s6h      -3d6h
3690    jn 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3691    jo 2D2616       -23.2     0.     -33.2 FIXEDHF     0.700  0       0.0  0  4s6h      -3d7h
3692    jo 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3693    jp 2D2616       -16.3     0.     -23.3 FIXEDHF     0.700  0       0.0  0  4s6h      -3d8h
3694    jp 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3695    jq 2D2616       -12.5     0.     -17.9 FIXEDHF     0.700  0       0.0  0  4s6h      -3d9h
3696    jq 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3697    jt 2D2617        -9.2     0.     -13.2 FIXEDHF     0.700  0       0.0  0  4s6h      -3d8k
3698    jt 7E2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3699    ju 2D2617        -9.2     0.     -13.1 FIXEDHF     0.700  0       0.0  0  4s6h      -3d9k
3700    ju 7E2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3701    kl 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7h      -4s8h
3702    kl 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3703    km 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s7h      -4s9h
3704    km 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3705    kn 2D2616       -23.2     0.     -33.2 FIXEDHF     0.700  0       0.0  0  4s7h      -3d6h
3706    kn 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3707    ko 2D2616       -25.6     0.     -36.6 FIXEDHF     0.700  0       0.0  0  4s7h      -3d7h
3708    ko 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3709    kp 2D2616       -17.9     0.     -25.6 FIXEDHF     0.700  0       0.0  0  4s7h      -3d8h
3710    kp 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3711    kq 2D2616       -13.8     0.     -19.7 FIXEDHF     0.700  0       0.0  0  4s7h      -3d9h
3712    kq 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3713    kt 2D2617         2.0     0.       2.9 FIXEDHF     0.700  0       0.0  0  4s7h      -3d8k
3714    kt 7E2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3715    ku 2D2617        -1.5     0.      -2.1 FIXEDHF     0.700  0       0.0  0  4s7h      -3d9k
3716    ku 7E2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3717    lm 0D2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8h      -4s9h
3718    lm 5E2626         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3719    ln 2D2616       -16.3     0.     -23.3 FIXEDHF     0.700  0       0.0  0  4s8h      -3d6h
3720    ln 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3721    lo 2D2616       -17.9     0.     -25.6 FIXEDHF     0.700  0       0.0  0  4s8h      -3d7h
3722    lo 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3723    lp 2D2616       -17.1     0.     -24.5 FIXEDHF     0.700  0       0.0  0  4s8h      -3d8h
3724    lp 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3725    lq 2D2616       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0  4s8h      -3d9h
3726    lq 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3727    lt 2D2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8h      -3d8k
3728    lt 7E2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3729    lu 2D2617         1.2     0.       1.7 FIXEDHF     0.700  0       0.0  0  4s8h      -3d9k
3730    lu 7E2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3731    mn 2D2616       -12.5     0.     -17.9 FIXEDHF     0.700  0       0.0  0  4s9h      -3d6h
3732    mn 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3733    mo 2D2616       -13.8     0.     -19.7 FIXEDHF     0.700  0       0.0  0  4s9h      -3d7h
3734    mo 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3735    mp 2D2616       -13.2     0.     -18.8 FIXEDHF     0.700  0       0.0  0  4s9h      -3d8h
3736    mp 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3737    mq 2D2616       -12.0     0.     -17.2 FIXEDHF     0.700  0       0.0  0  4s9h      -3d9h
3738    mq 5E2616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3739    mt 2D2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9h      -3d8k
3740    mt 7E2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3741    mu 2D2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s9h      -3d9k
3742    mu 7E2617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3743    no 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6h      -3d7h
3744    no 2D1616        17.4     0.      24.8 FIXEDHF     0.700  0       0.0  0
3745    no 4D1616         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0
3746    no 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3747    no 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3748    no 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3749    np 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6h      -3d8h
3750    np 2D1616        12.2     0.      17.4 FIXEDHF     0.700  0       0.0  0
3751    np 4D1616         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
3752    np 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3753    np 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3754    np 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3755    nq 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d6h      -3d9h
3756    nq 2D1616         9.3     0.      13.3 FIXEDHF     0.700  0       0.0  0
3757    nq 4D1616         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3758    nq 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3759    nq 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3760    nq 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3761    nr 2D1627        -9.2     0.     -13.2 FIXEDHF     0.700  0       0.0  0  3d6h      -4s8k
3762    nr 5E1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3763    ns 2D1627        -9.2     0.     -13.1 FIXEDHF     0.700  0       0.0  0  3d6h      -4s9k
3764    ns 5E1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3765    nt 2D1617         6.9     0.       9.8 FIXEDHF     0.700  0       0.0  0  3d6h      -3d8k
3766    nt 4D1617         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3767    nt 5E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3768    nt 7E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3769    nu 2D1617         6.9     0.       9.8 FIXEDHF     0.700  0       0.0  0  3d6h      -3d9k
3770    nu 4D1617         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0
3771    nu 5E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3772    nu 7E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3773    nv 3D1638       -19.9     0.     -28.5 FIXEDHF     0.700  0       0.0  0  3d6h      -4p4d
3774    nv 4E1638        -1.6     0.      -2.3 FIXEDHF     0.700  0       0.0  0
3775    nw 3D1638         7.8     0.      11.1 FIXEDHF     0.700  0       0.0  0  3d6h      -4p5d
3776    nw 4E1638        -1.1     0.      -1.5 FIXEDHF     0.700  0       0.0  0
3777    nx 3D1638        -0.1     0.      -0.1 FIXEDHF     0.700  0       0.0  0  3d6h      -4p6d
3778    nx 4E1638        -0.7     0.      -1.0 FIXEDHF     0.700  0       0.0  0
3779    ny 3D1638         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0  3d6h      -4p7d
3780    ny 4E1638        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
3781    nz 3D1638         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  3d6h      -4p8d
3782    nz 4E1638        -0.4     0.      -0.6 FIXEDHF     0.700  0       0.0  0
3783    op 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7h      -3d8h
3784    op 2D1616        13.4     0.      19.1 FIXEDHF     0.700  0       0.0  0
3785    op 4D1616         0.6     0.       0.8 FIXEDHF     0.700  0       0.0  0
3786    op 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3787    op 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3788    op 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3789    oq 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d7h      -3d9h
3790    oq 2D1616        10.3     0.      14.7 FIXEDHF     0.700  0       0.0  0
3791    oq 4D1616         0.5     0.       0.7 FIXEDHF     0.700  0       0.0  0
3792    oq 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3793    oq 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3794    oq 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3795    or 2D1627         2.0     0.       2.9 FIXEDHF     0.700  0       0.0  0  3d7h      -4s8k
3796    or 5E1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3797    os 2D1627        -1.5     0.      -2.1 FIXEDHF     0.700  0       0.0  0  3d7h      -4s9k
3798    os 5E1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3799    ot 2D1617        -1.5     0.      -2.2 FIXEDHF     0.700  0       0.0  0  3d7h      -3d8k
3800    ot 4D1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3801    ot 5E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3802    ot 7E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3803    ou 2D1617         1.1     0.       1.6 FIXEDHF     0.700  0       0.0  0  3d7h      -3d9k
3804    ou 4D1617         0.1     0.       0.1 FIXEDHF     0.700  0       0.0  0
3805    ou 5E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3806    ou 7E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3807    ov 3D1638       -21.6     0.     -30.9 FIXEDHF     0.700  0       0.0  0  3d7h      -4p4d
3808    ov 4E1638        -1.8     0.      -2.6 FIXEDHF     0.700  0       0.0  0
3809    ow 3D1638         5.7     0.       8.1 FIXEDHF     0.700  0       0.0  0  3d7h      -4p5d
3810    ow 4E1638        -1.2     0.      -1.7 FIXEDHF     0.700  0       0.0  0
3811    ox 3D1638         1.8     0.       2.6 FIXEDHF     0.700  0       0.0  0  3d7h      -4p6d
3812    ox 4E1638        -0.8     0.      -1.2 FIXEDHF     0.700  0       0.0  0
3813    oy 3D1638         0.1     0.       0.2 FIXEDHF     0.700  0       0.0  0  3d7h      -4p7d
3814    oy 4E1638        -0.6     0.      -0.9 FIXEDHF     0.700  0       0.0  0
3815    oz 3D1638         0.3     0.       0.4 FIXEDHF     0.700  0       0.0  0  3d7h      -4p8d
3816    oz 4E1638        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
3817    pq 0D1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8h      -3d9h
3818    pq 2D1616         9.8     0.      14.0 FIXEDHF     0.700  0       0.0  0
3819    pq 4D1616         0.4     0.       0.6 FIXEDHF     0.700  0       0.0  0
3820    pq 3E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3821    pq 5E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3822    pq 7E1616         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3823    pr 2D1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8h      -4s8k
3824    pr 5E1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3825    ps 2D1627         1.2     0.       1.7 FIXEDHF     0.700  0       0.0  0  3d8h      -4s9k
3826    ps 5E1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3827    pt 2D1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8h      -3d8k
3828    pt 4D1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3829    pt 5E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3830    pt 7E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3831    pu 2D1617        -0.9     0.      -1.3 FIXEDHF     0.700  0       0.0  0  3d8h      -3d9k
3832    pu 4D1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3833    pu 5E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3834    pu 7E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3835    pv 3D1638       -20.6     0.     -29.4 FIXEDHF     0.700  0       0.0  0  3d8h      -4p4d
3836    pv 4E1638        -1.8     0.      -2.6 FIXEDHF     0.700  0       0.0  0
3837    pw 3D1638         4.0     0.       5.7 FIXEDHF     0.700  0       0.0  0  3d8h      -4p5d
3838    pw 4E1638        -1.2     0.      -1.7 FIXEDHF     0.700  0       0.0  0
3839    px 3D1638         2.1     0.       3.0 FIXEDHF     0.700  0       0.0  0  3d8h      -4p6d
3840    px 4E1638        -0.8     0.      -1.2 FIXEDHF     0.700  0       0.0  0
3841    py 3D1638         0.6     0.       0.9 FIXEDHF     0.700  0       0.0  0  3d8h      -4p7d
3842    py 4E1638        -0.6     0.      -0.9 FIXEDHF     0.700  0       0.0  0
3843    pz 3D1638         0.2     0.       0.3 FIXEDHF     0.700  0       0.0  0  3d8h      -4p8d
3844    pz 4E1638        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
3845    qr 2D1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9h      -4s8k
3846    qr 5E1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3847    qs 2D1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9h      -4s9k
3848    qs 5E1627         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3849    qt 2D1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9h      -3d8k
3850    qt 4D1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3851    qt 5E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3852    qt 7E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3853    qu 2D1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d9h      -3d9k
3854    qu 4D1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3855    qu 5E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3856    qu 7E1617         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3857    qv 3D1638       -18.9     0.     -27.0 FIXEDHF     0.700  0       0.0  0  3d9h      -4p4d
3858    qv 4E1638        -1.7     0.      -2.4 FIXEDHF     0.700  0       0.0  0
3859    qw 3D1638         2.9     0.       4.1 FIXEDHF     0.700  0       0.0  0  3d9h      -4p5d
3860    qw 4E1638        -1.1     0.      -1.6 FIXEDHF     0.700  0       0.0  0
3861    qx 3D1638         2.0     0.       2.8 FIXEDHF     0.700  0       0.0  0  3d9h      -4p6d
3862    qx 4E1638        -0.8     0.      -1.1 FIXEDHF     0.700  0       0.0  0
3863    qy 3D1638         0.8     0.       1.1 FIXEDHF     0.700  0       0.0  0  3d9h      -4p7d
3864    qy 4E1638        -0.6     0.      -0.8 FIXEDHF     0.700  0       0.0  0
3865    qz 3D1638         0.3     0.       0.5 FIXEDHF     0.700  0       0.0  0  3d9h      -4p8d
3866    qz 4E1638        -0.5     0.      -0.7 FIXEDHF     0.700  0       0.0  0
3867    rs 0D2727         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4s8k      -4s9k
3868    rs 7E2727         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3869    rt 2D2717        -6.7     0.      -9.6 FIXEDHF     0.700  0       0.0  0  4s8k      -3d8k
3870    rt 7E2717         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3871    ru 2D2717        -3.7     0.      -5.3 FIXEDHF     0.700  0       0.0  0  4s8k      -3d9k
3872    ru 7E2717         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3873    st 2D2717        -3.7     0.      -5.3 FIXEDHF     0.700  0       0.0  0  4s9k      -3d8k
3874    st 7E2717         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3875    su 2D2717        -4.8     0.      -6.8 FIXEDHF     0.700  0       0.0  0  4s9k      -3d9k
3876    su 7E2717         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3877    tu 0D1717         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  3d8k      -3d9k
3878    tu 2D1717         2.7     0.       3.9 FIXEDHF     0.700  0       0.0  0
3879    tu 4D1717         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3880    tu 5E1717         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3881    tu 7E1717         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3882    tu 9E1717         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0
3883    vw 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p4d      -4p5d
3884    vw 2D3838      1780.3     0.    2543.3 FIXEDHF     0.700  0       0.0  0
3885    vw 1E3838       850.4     0.    1214.9 FIXEDHF     0.700  0       0.0  0
3886    vw 3E3838       660.0     0.     942.9 FIXEDHF     0.700  0       0.0  0
3887    vx 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p4d      -4p6d
3888    vx 2D3838      1102.4     0.    1574.8 FIXEDHF     0.700  0       0.0  0
3889    vx 1E3838       602.4     0.     860.6 FIXEDHF     0.700  0       0.0  0
3890    vx 3E3838       465.6     0.     665.2 FIXEDHF     0.700  0       0.0  0
3891    vy 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p4d      -4p7d
3892    vy 2D3838       765.9     0.    1094.2 FIXEDHF     0.700  0       0.0  0
3893    vy 1E3838       451.8     0.     645.4 FIXEDHF     0.700  0       0.0  0
3894    vy 3E3838       348.2     0.     497.4 FIXEDHF     0.700  0       0.0  0
3895    vz 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p4d      -4p8d
3896    vz 2D3838       570.9     0.     815.6 FIXEDHF     0.700  0       0.0  0
3897    vz 1E3838       353.8     0.     505.5 FIXEDHF     0.700  0       0.0  0
3898    vz 3E3838       272.1     0.     388.7 FIXEDHF     0.700  0       0.0  0
3899    wx 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p5d      -4p6d
3900    wx 2D3838       925.6     0.    1322.3 FIXEDHF     0.700  0       0.0  0
3901    wx 1E3838       442.0     0.     631.4 FIXEDHF     0.700  0       0.0  0
3902    wx 3E3838       338.1     0.     483.0 FIXEDHF     0.700  0       0.0  0
3903    wy 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p5d      -4p7d
3904    wy 2D3838       655.3     0.     936.2 FIXEDHF     0.700  0       0.0  0
3905    wy 1E3838       336.6     0.     480.8 FIXEDHF     0.700  0       0.0  0
3906    wy 3E3838       256.9     0.     367.0 FIXEDHF     0.700  0       0.0  0
3907    wz 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p5d      -4p8d
3908    wz 2D3838       495.5     0.     707.8 FIXEDHF     0.700  0       0.0  0
3909    wz 1E3838       266.1     0.     380.2 FIXEDHF     0.700  0       0.0  0
3910    wz 3E3838       202.8     0.     289.7 FIXEDHF     0.700  0       0.0  0
3911    xy 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p6d      -4p7d
3912    xy 2D3838       516.7     0.     738.2 FIXEDHF     0.700  0       0.0  0
3913    xy 1E3838       249.4     0.     356.3 FIXEDHF     0.700  0       0.0  0
3914    xy 3E3838       189.9     0.     271.3 FIXEDHF     0.700  0       0.0  0
3915    xz 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p6d      -4p8d
3916    xz 2D3838       393.3     0.     561.8 FIXEDHF     0.700  0       0.0  0
3917    xz 1E3838       197.9     0.     282.7 FIXEDHF     0.700  0       0.0  0
3918    xz 3E3838       150.6     0.     215.1 FIXEDHF     0.700  0       0.0  0
3919    yz 0D3838         0.0     0.       0.0 FIXEDHF     0.700  0       0.0  0  4p7d      -4p8d
3920    yz 2D3838       312.9     0.     447.0 FIXEDHF     0.700  0       0.0  0
3921    yz 1E3838       152.3     0.     217.6 FIXEDHF     0.700  0       0.0  0
3922    yz 3E3838       115.8     0.     165.4 FIXEDHF     0.700  0       0.0  0
