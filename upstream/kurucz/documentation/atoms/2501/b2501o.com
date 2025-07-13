$SET def 2501
$SET VERIFY=NOIMAGE
$ASSIGN B2501O.PUN FOR007
$ASSIGN POOLQ:H2501O.HAM FOR001
$ASSIGN B2501O.EIG FOR003
$ASSIGN EAV2501O.DAT FOR066
$ASSIGN POOLG:B2501O15 FOR015
$ASSIGN POOLG:B2501O16 FOR016
$RUN CRAY:LEAST3007
1Kramida, A. and Sansonetti, J.E. 2013.  ApJ Supp 205,14,5pp.
2Sugar, J, and Corliss, C. 1985. J.Phys.Chem.Ref.Data 14, Supp 2.
3after
4Iglesias, L. and Velasco, R. 1964.  Pub. Inst. Opt. Madrid No. 23
5 FC Fiorella Castelli personal communication
6
7 ignore  1.0     92060.89 ?            3d5(b2F)4p u3D           b2F)4p u3D
8
9
    0    0    0    0        .3       1.9
    2  .6         50  100  140  160  130  100   70   50   30   10   10   10   10   10   10
  25.01
d5 4p     d5 5p     d5 6p     d5 7p     d5 8p     d5 9p     d5 10p    d4 4s4p
d4 4s5p   d4 4s6p   d4 4s7p   d4 4s8p   d4 4s9p   d4 4s10p  d3s2 4p   d5 4f
d5 5f     d5 6f     d5 7f     d5 8f     d5 9f     d5 10f    d4 4s4f   d4 4s5f
d4 4s6f   d4 4s7f   d4 4s8f   d4 4s9f   d4 4s10f  d5 6h     d5 7h     d5 8h
d5 9h     d4 4s6h   d4 4s7h   d4 4s8h   d4 4s9h   d5 8k     d5 9k     d4 4s8k
d4 4s9k
  -1.
0  0.0     66625.296             3d5(4P)4p z5D            (4P)4p z5D
0  0.0     69319.33              3d5(4P)4p z3P            (4P)4p z3P
0  0.0     72322.49              3d5(4D)4p y5D            (4D)4p y5D
0  0.0     75563.538             3d5(4D)4p y3P            (4D)4p y3P
0  0.0     81713.05              3d5(a2D)4p x3P           a2D)4p x3P
1  0.0                           3d4(5D)4s4p(3P) 7F       5Dsp3P 7F
0  0.0     82839.51              3d5(4F)4p x5D            (4F)4p x5D
0  0.0     93056.4               3d4(5D)4s4p(3P) w5P      5Dsp3P w3P
0  0.0     93719.67              3d5(2S)4p 3P             (2S)4p 3P
   0.0     94747.9  ?            3d4(5D)4s4p(3P) w5D      5Dsp3P w5D
   0.0     98424.00              3d5(6S)4f 7F   FC        (6S)4f 7F
1  0.0                           3d5(2S)4p 3P             (2S)4p 3P
1  0.0                           3d4(3P)4s4p(3P) 5D       3Psp3P 5D
1  0.0                           3d5(6S)5f 7F             (6S)5f 7F
1  0.0    109168.8               3d4(b3F)4s4p(3P) v5D     3Fsp3P v5D
1  0.0    109958.6               3d4(5D)4s4p(_P) u5D      5Dsp_P u5D
1  0.0                           3d4(3P)4s4p(_P) 3P       3Psp_P 3P
1  0.0                           3d4(3P)4s4p(_P) 1S       3Psp_P 1S
   0.0    113840.8               3d5(6S)6f 7F   FC        (6S)6f 7F
1  0.0                           3d5(4P)5d 5D             (4P)5d 5D
1  0.0                           3d5(4P)5d 3P             (4P)5d 3P
1  0.0                           3d4(3D)4s4p(_P) 5D       3Dsp_P 5D
1  0.0                           3d5(6S)7f 7F             (6S)7f 7F
1  0.0                           3d4(1S)4s4p(_P) 3P       1Ssp_P 3P
1  0.0                           3d5(4D)5d 5D             (4D)5d 5D
1  0.0                           3d5(4D)5d 3P             (4D)5d 3P
   0.0    119197.6               3d5(6S)8f 7F   FC        (6S)8f 7F
1  0.0                           3d5(2P)4p 1S             (2P)4p 1S
1  0.0                           3d5(6S)9f 7F             (6S)9f 7F
1  0.0                           3d4(3D)4s4p(_P) 3P       3Dsp_P 3P
1  0.0                           3d5(6S)10f 7F            (6S)10f 7F
1  0.0                           3d4(3D)4s4p(_P) 3P       3Dsp_P 3P
1  0.0                           3d5(4G)4f 3P             (4G)4f 3P
1  0.0                           3d5(4G)4f 5D             (4G)4f 5D
1  0.0
1  0.0
0 -1.0
0  1.0     43557.175   2.493     3d5(6S)4p z5P            (6S)4p z5P
0  1.0     66645.116   1.36      3d5(4P)4p z5D            (4P)4p z5D
0  1.0     66894.130   1.50      3d5(4G)4p z5F            (4G)4p z5F
0  1.0     68496.694   2.41      3d5(4P)4p y5P            (4P)4p y5P
0  1.0     69216.059   1.474     3d5(4P)4p z3P            (4P)4p z3P
0  1.0     70150.76    0.00      3d5(4D)4p y5F            (4D)4p y5F
0  1.0     71078.501   0.478     3d5(4P)4p z3D            (4P)4p z3D
0  1.0     71264.39    2.477     3d5(4D)4p x5P            (4D)4p x5P
0  1.0     72321.02    1.52      3d5(4D)4p y5D            (4D)4p y5D
   1.0     73385.525   0.530     3d5(4D)4p y3D            (4D)4p y3D
0  1.0     73911.57    1.986     3d5(4P)4p z3S            (4P)4p z3S
0  1.0     75719.955   1.490     3d5(4D)4p y3P            (4D)4p y3P
0  1.0     81322.46              3d5(a2D)4p x3P           a2D)4p x3P
0  1.0     81732.02    0.44      3d5(2D)4p x3D            (2D)4p x3D
1  1.0                           3d4(5D)4s4p(3P) 7F       5Dsp3P 7F
0  1.0     82236.90              3d5(4F)4p x5F            (4F)4p x5F
1  1.0     82939.04    0.51      3d5(a2F)4p w3D           a2F)4p w3D
1  1.0     82774.81              3d5(4F)4p x5D            (4F)4p x5D
0  1.0     84268.21    0.96      3d5(a2D)4p z1P           a2D)4p z1P
1  1.0                           3d4(5D)4s4p(3P) 7D       5Dsp3P 7D
0  1.0     86208.54    0.58      3d5(4F)4p v3D            (4F)4p v3D
   1.0     86961.122             3d4(5D)4s4p(3P) w5P      5Dsp3P w5P
   1.0     88839.90              3d5(6S)5p v5P            (6S)5p v5P
0  1.0     90460.09              3d4(5D)4s4p(3P) w5F      5Dsp3P w5F
1  1.0                           3d5(b2F)4p u3D           b2F)4p u3D
0  1.0     93365.8               3d4(5D)4s4p(3P) w3P      5Dsp3P w3P
0  1.0     93868.50              3d5(2S)4p 3P             (2S)4p 3P
0  1.0     94795.5               3d4(5D)4s4p(3P) w5D      5Dsp3P w5D
1  1.0     95080.71              3d5(2S)4p y1P            (2S)4p y1P
   1.0     98423.93              3d5(6S)4f 7F   FC        (6S)4f 7F
0  1.0     98461.977             3d5(6S)4f 5F             (6S)4f 5F
1  1.0                           3d5(2D)4p 3D             (2D)4p 3D
0  1.0    100927.9  ?            3d4(5D)4s4p(3P) t3D      5Dsp3P t3D
   1.0    101807.469             3d5(2D)4p 3P   FC        (2D)4p 3P
1  1.0                           3d5(2D)4p 1P             (2D)4p 1P
1  1.0                           3d5(6S)6p 5P             (6S)6p 5P
1  1.0                           3d4(3P)4s4p(3P) 5D       3Psp3P 5D
0  1.0    106265.7               3d4(b3F)4s4p(3P) v5F     3Fsp3P v5F
0  1.0    106479.3               3d4(b3F)4s4p(3P) u5P     3Fsp3P u5P
1  1.0                           3d5(6S)5f 7F             (6S)5f 7F
0  1.0    108435.83              3d5(6S)5f 5F             (6S)5f 5F
   1.0    108727.0               3d4(5D)4s4p(1P) t5P      5Dsp1P t5P
0  1.0    108994.4               3d4(b3F)4s4p(1P) u5F     3Fsp1P u5F
1  1.0    109235.44              3d4(b3F)4s4p(3P) v5D     3Fsp3P v5D
0  1.0    110671.6               3d4(a3P)4s4p(3P) y3S     3Psp3P y3S
1  1.0    109994.87              3d4(5D)4s4p(1P) u5D      5Dsp1P u5D
0  1.0    111017.4               3d4(3G)4s4p(3P) t5F      3Gsp3P t5F
   1.0    111162.4               3d5(6S)7p s5P            (6S)7p s5P
1  1.0                           3d4(3P)4s4p(_P) 3P       3Psp_P 3P
1  1.0                           3d4(3F)4s4p(_P) 3D       3Fsp_P 3D
0  1.0    112274.2  ?            3d4(3P)4s4p(_P) s3D      3Psp_P s3D
0  1.0    113646.24              3d5(4G)5p s5F            (4G)5p s5F
   1.0    113840.7               3d5(6S)6f 7F   FC        (6S)6f 7F
0  1.0    114023.64              3d5(6S)6f 5F             (6S)6f 5F
1  1.0                           3d4(3P)4s4p(_P) 1P       3Psp_P 1P
1  1.0                           3d5(4P)5p 5D             (4P)5p 5D
1  1.0                           3d5(6S)8p s5P            (6S)8p s5P
1  1.0                           3d5(4P)5p 5P             (4P)5p 5P
1  1.0                           3d5(4P)5p 3P             (4P)5p 3P
1  1.0                           3d5(4P)5p 3D             (4P)5p 3D
1  1.0                           3d4(3D)4s4p(_P) 5D       3Dsp_P 5D
1  1.0                           3d5(4P)5p 3S             (4P)5p 3S
1  1.0                           3d4(3D)4s4p(_P) 5P       3Dsp_P 5P
0  1.0    117165.4               3d4(3D)4s4p(3P) r5F      3Dsp3P r5F
1  1.0                           3d5(6S)7f 7F             (6S)7f 7F
0  1.0    117136.2               3d5(6S)7f 5F             (6S)7f 5F
1  1.0                           3d5(4D)5p 5F             (4D)5p 5F
1  1.0                           3d5(6S)9p s5P            (6S)9p s5P
1  1.0                           3d5(2P)4p 3P             (2P)4p 3P
1  1.0                           3d5(4D)5p 5D             (4D)5p 5D
1  1.0                           3d5(4D)5p 5P             (4D)5p 5P
1  1.0                           3d5(4D)5p 3D             (4D)5p 3D
1  1.0                           3d5(4D)5p 3P             (4D)5p 3P
   1.0    119197.791             3d5(6S)8f 7F   FC        (6S)8f 7F
0  1.0    119251.5               3d5(6S)8f 5F             (6S)8f 5F
1  1.0                           3d5(6S)10p 5P            (6S)10p 5P
1  1.0                           3d5(6S)9f 7F             (6S)9f 7F
1  1.0                           3d5(2P)4p 3D             (2P)4p 3D
1  1.0                           3d5(6S)9f 5F             (6S)9f 5F
1  1.0                           3d4(1S)4s4p(_P) 3P       1Ssp_P 3P
1  1.0                           3d5(6S)10f 7F            (6S)10f 7F
1  1.0                           3d5(6S)10f 5F            (6S)10f 5F
1  1.0                           3d5(2P)4p 3S             (2P)4p 3S
1  1.0                           3d4(3D)4s4p(_P) 3D       3Dsp_P 3D
1  1.0                           3d5(2P)4p 1P             (2P)4p 1P
1  1.0                           3d4(3D)4s4p(_P) 3P       3Dsp_P 3P
1  1.0                           3d4(1D)4s4p(_P) 3D       1Dsp_P 3D
1  1.0                           3d4(3D)4s4p(_P) 1P       3Dsp_P 1P
1  1.0                           3d5(4G)4f 5F             (4G)4f 5F
1  1.0                           3d5(4G)4f 3P             (4G)4f 3P
1  1.0                           3d5(4G)4f 3D             (4G)4f 3D
1  1.0                           3d5(4G)4f 5D             (4G)4f 5D
1  1.0                           3d5(4G)4f 5P             (4G)4f 5P
0 -1.0
0  2.0     38366.232   2.315     3d5(6S)4p z7P            (6S)4p z7P
0  2.0     43484.664   1.833     3d5(6S)4p z5P            (6S)4p z5P
0  2.0     64456.72              3d5(4G)4p z5G            (4G)4p z5G
0  2.0     66676.833   1.312     3d5(4P)4p z5D            (4P)4p z5D
0  2.0     66929.517   1.645     3d5(4P)4p z5S            (4P)4p z5S
0  2.0     66901.494   1.48      3d5(4G)4p z5F            (4G)4p z5F
0  2.0     67766.817   0.657     3d5(4G)4p z3F            (4G)4p z3F
0  2.0     68417.697   1.80      3d5(4P)4p y5P            (4P)4p y5P
0  2.0     69044.91    1.540     3d5(4P)4p z3P            (4P)4p z3P
0  2.0     70231.468   1.013     3d5(4D)4p y5F            (4D)4p y5F
0  2.0     70940.568   1.143     3d5(4P)4p z3D            (4P)4p z3D
0  2.0     71323.60    1.805     3d5(4D)4p x5P            (4D)4p x5P
0  2.0     72307.23              3d5(4D)4p y5D            (4D)4p y5D
0  2.0     73396.334             3d5(4D)4p y3D            (4D)4p y3D
0  2.0     73785.58    0.746     3d5(4D)4p y3F            (4D)4p y3F
0  2.0     75919.107   1.50      3d5(4D)4p y3P            (4D)4p y3P
0  2.0     78913.180   0.938     3d5(a2D)4p z1D           a2D)4p z1D
0  2.0     79458.45    0.734     3d5(a2D)4p x3F           a2D)4p x3F
0  2.0     81147.76    1.372     3d5(a2D)4p x3P           a2D)4p x3P
1  2.0     82193.11              3d5(4F)4p y5G            (4F)4p y5G
0  2.0     81812.98    0.90      3d5(2D)4p x3D            (2D)4p x3D
1  2.0                           3d4(5D)4s4p(3P) 7F       5Dsp3P 7F
0  2.0     82054.42    1.18      3d5(4F)4p x5F            (4F)4p x5F
0  2.0     82735.27              3d5(4F)4p x5D            (4F)4p x5D
1  2.0     83070.92    1.21      3d5(a2F)4p w3D           a2F)4p w3D
1  2.0     82917.79    0.70      3d5(a2F)4p w3F           a2F)4p w3F
0  2.0     83255.99              3d4(5D)4s4p(3P) y7P      5Dsp3P y7P
0  2.0     85368.07    1.03      3d5(a2F)4p y1D           a2F)4p y1D
0  2.0     85895.477             3d5(6S)5p x7P            (6S)5p x7P
1  2.0                           3d4(5D)4s4p(3P) 7D       5Dsp3P 7D
0  2.0     85989.20    0.77      3d5(4F)4p 3F             (4F)4p 3F
0  2.0     86190.26              3d5(4F)4p v3D            (4F)4p v3D
   2.0     86936.981             3d5(6S)5p v5P            (6S)5p v5P
0  2.0     87858.48              3d5(a2G)4p u3F           a2G)4p u3F
   2.0     89079.43              3d4(5D)4s4p(3P) w5P      5Dsp3P w5P
0  2.0     89519.42              3d5(b2F)4p t3F           b2F)4p t3F
0  2.0     90596.81    1.02      3d5(b2F)4p x1D           b2F)4p x1D
0  2.0     90582.55    1.01      3d4(5D)4s4p(3P) w5F      5Dsp3P w5F
   2.0     92039.94    1.17      3d5(b2F)4p u3D           b2F)4p u3D
0  2.0     93921.19              3d4(5D)4s4p(3P) w3P      5Dsp3P w3P
0  2.0     94230.94              3d5(2S)4p 3P   FC        (2S)4p 3P   was 94230.9
0  2.0     94887.04              3d4(5D)4s4p(3P) w5D      5Dsp3P w5D
0  2.0     96613.93              3d4(5D)4s4p(3P) s3F      5Dsp3P s3F
0  2.0     98423.858             3d5(6S)4f 7F   FC        (6S)4f 7F
0  2.0     98462.563             3d5(6S)4f 5F             (6S)4f 5F
   2.0    100320.586             3d5(b2D)4p 3F   FC       b2D)4p 3F
1  2.0                           3d5(b2D)4p 3D            b2D)4p 3D
0  2.0    101084.2               3d4(5D)4s4p(3P) t3D      5Dsp3P t3D
1  2.0                           3d5(b2D)4p 3P            b2D)4p 3P
1  2.0                           3d5(6S)6p 7P             (6S)6p 7P
1  2.0                           3d5(6S)6p 5P             (6S)6p 5P
0  2.0    103600.14              3d5(b2D)4p w1D           b2D)4p w1D
1  2.0                           3d4(3P)4s4p(3P) 5D       3Psp3P 5D
1  2.0                           3d4(b3F)4s4p(3P) 5G      3Fsp3P 5G
0  2.0    106374.25              3d4(b3F)4s4p(3P) v5F     3Fsp3P v5F
0  2.0    106749.9               3d4(b3F)4s4p(3P) u5P     3Fsp3P u5P
1  2.0                           3d5(2G)4p 3F             (2G)4p 3F
0  2.0    108485.9               3d4(3H)4s4p(3P) x5G      3Hsp3P x5G
0  2.0    108410.35              3d5(6S)5f 7F             (6S)5f 7F
0  2.0    108437.42              3d5(6S)5f 5F             (6S)5f 5F
0  2.0    108975.3               3d4(5D)4s4p(1P) t5P      5Dsp1P t5P
0  2.0    109046.2               3d4(b3F)4s4p(1P) 5F      3Fsp1P u5F
   2.0    109704.74              3d4(a3P)4s4p(3P) 5S      3Psp3P y5S
1  2.0    109343.9               3d4(b3F)4s4p(3P) 5D      3Fsp3P v5D
1  2.0    109899.8               r3F                      r3F
1  2.0    110068.93              3d4(5D)4s4p(1P) u5D      5Dsp1P u5D
0  2.0    111060.8               3d4(3G)4s4p(3P) t5F      3Gsp3P t5F
   2.0    111178.72              3d5(6S)7p s5P            (6S)7p s5P
1  2.0                           3d4(3P)4s4p(_P) 3P       3Psp_P 3P
1  2.0                           3d4(3F)4s4p(_P) 3D       3Fsp_P 3D
   2.0    112424.4               3d5(4G)5p w5G            (4G)5p w5G
   2.0    112563.30              3d5(4G)5p q3F            (4G)5p q3F
   2.0    112717.7               3d4(3P)4s4p(_P) s3D      3Psp_P s3D
   2.0    113093.0               3d4(3G)4s4p(_P) v5G      3Gsp_P v5G
1  2.0                           3d5(4G)5p 3F             (4G)5p 3F
0  2.0    113645.746             3d5(4G)5p s5F            (4G)5p s5F
   2.0    113840.6               3d5(6S)6f 7F   FC        (6S)6f 7F
1  2.0                           3d5(6S)6h 7H             (6S)6h 7H
0  2.0    114024.99              3d5(6S)6f 5F             (6S)6f 5F
1  2.0                           3d4(3F)4s4p(_P) 1D       3Fsp_P 1D
1  2.0                           3d5(4P)5p 5S             (4P)5p 5S
1  2.0                           3d5(4P)5p 5D             (4P)5p 5D
1  2.0                           3d4(3G)4s4p(_P) 3F       3Gsp_P 3F
1  2.0                           3d5(6S)7p 7P             (6S)7p 7P
1  2.0                           3d5(4P)5p 5P             (4P)5p 5P
1  2.0                           3d5(6S)7p 5P             (6S)7p 5P
1  2.0                           3d5(4P)5p 3P             (4P)5p 3P
1  2.0                           3d5(4P)5p 3D             (4P)5p 3D
1  2.0                           3d4(3D)4s4p(_P) 5D       3Dsp_P 5D
1  2.0                           3d4(3P)4s4p(_P) 1D       3Psp_P 1D
1  2.0                           3d4(3D)4s4p(_P) 5P       3Dsp_P 5P
   2.0    117113.1               3d5(6S)7f 7F             (6S)7f 7F
0  2.0    117139.2               3d5(6S)7f 5F             (6S)7f 5F
1  2.0                           3d5(6S)7h 7H             (6S)7h 7H
1  2.0    117230.1               3d4(3D)4s4p(3P) r5F      3Dsp3P r5F  oscillating with 7H
1  2.0                           3d5(6S)9p 7P             (6S)9p 7P
1  2.0                           3d5(4P)5p 5F             (4P)5p 5F
1  2.0                           3d5(6S)9p 5P             (6S)9p 5P
1  2.0                           3d5(4D)5p 5D             (4D)5p 5D
1  2.0                           3d5(2P)4p 3P             (2P)4p 3P
1  2.0                           3d5(4D)5p 5P             (4D)5p 5P
1  2.0                           3d5(4D)5p 3D             (4D)5p 3D
1  2.0                           3d5(4D)5p 3F             (4D)5p 3F
   2.0    119197.791             3d5(6S)8f 7F   FC        (6S)8f 7F
0  2.0    119251.5               3d5(6S)8f 5F             (6S)8f 5F
0  2.0    119282.49              3d5(6S)8h 7H             (6S)8h 7H
1  2.0                           3d5(4D)5p 3P             (4D)5p 3P
1  2.0                           3d5(6S)10p 7P            (6S)10p 7P
1  2.0                           3d4(1G)4s4p(_P) 3F       1Gsp_P 3F
1  2.0                           3d5(6S)10p 5P            (6S)10p 5P
1  2.0                           3d5(2P)4p 3D             (2P)4p 3D
1  2.0                           3d5(6S)9f 7F             (6S)9f 7F
1  2.0                           3d5(6S)9f 5F             (6S)9f 5F
0  2.0    120722.08              3d5(6S)9h 7H             (6S)9h 7H
1  2.0                           3d4(3D)4s4p(_P) 3P       3Dsp_P 3P
1  2.0                           3d5(2P)4p 1D             (2P)4p 1D
1  2.0                           3d5(6S)10f 7F            (6S)10f 7F
1  2.0                           3d5(6S)10f 5F            (6S)10f 5F
1  2.0                           3d4(3D)4s4p(_P) 3F       3Dsp_P 3F
1  2.0                           3d4(3D)4s4p(_P) 3D       3Dsp_P 3D
1  2.0                           3d4(1S)4s4p(_P) 3P       1Ssp_P 3P
1  2.0                           3d4(1D)4s4p(_P) 3D       1Dsp_P 3D
1  2.0                           3d5(4G)4f 5G             (4G)4f 5G
1  2.0                           3d5(4G)4f 5F             (4G)4f 5F
1  2.0                           3d5(4G)4f 3F             (4G)4f 3F
1  2.0                           3d5(4G)4f 3P             (4G)4f 3P
1  2.0                           3d5(4G)4f 3D             (4G)4f 3D
1  2.0                           3d5(4G)4f 5D             (4G)4f 5D
1  2.0                           3d4(1D)4s4p(_P) 3F       1Dsp_P 3F
1  2.0                           3d5(4G)4f 5P             (4G)4f 5P
1  2.0
0 -1.0
0  3.0     38543.122   1.923     3d5(6S)4p z7P            (6S)4p z7P
0  3.0     43370.537   1.658     3d5(6S)4p z5P            (6S)4p z5P
0  3.0     64473.421             3d5(4G)4p z5G            (4G)4p z5G
0  3.0     65483.12              3d5(4G)4p z5H            (4G)4p z5H
0  3.0     66686.739   1.309     3d5(4G)4p z5F            (4G)4p z5F
0  3.0     67009.217   1.44      3d5(4P)4p z5D            (4P)4p z5D
0  3.0     67812.087   1.080     3d5(4G)4p z3F            (4G)4p z3F
0  3.0     68284.664   1.655     3d5(4P)4p y5P            (4P)4p y5P
0  3.0     70342.936   1.22      3d5(4D)4p y5F            (4D)4p y5F
0  3.0     70518.06    0.754     3d5(4G)4p z3G            (4G)4p z3G
0  3.0     70745.387   1.36      3d5(4P)4p z3D            (4P)4p z3D
0  3.0     71390.488   1.644     3d5(4D)4p x5P            (4D)4p x5P
0  3.0     72247.73    1.455     3d5(4D)4p y5D            (4D)4p y5D
0  3.0     73395.444   1.21      3d5(4D)4p y3D            (4D)4p y3D
0  3.0     73781.117   1.09      3d5(4D)4p y3F            (4D)4p y3F
0  3.0     79512.76    1.075     3d5(a2D)4p x3F           a2D)4p x3F
0  3.0     81220.63    0.92      3d5(a2D)4p z1F           a2D)4p z1F
0  3.0     81659.67    1.32      3d5(2D)4p x3D            (2D)4p x3D
0  3.0     81780.73    0.92      3d5(4F)4p y5G            (4F)4p y5G
   3.0     82051.65    1.24      3d5(4F)4p x5F            (4F)4p x5F
   3.0     82303.415             3d4(5D)4s4p(3P) 7F   FC  5Dsp3P 7F
   3.0     82387.62    0.90      3d5(2F)4p y3G            (2F)4p y3G
0  3.0     82419.50    1.33      3d5(a2F)4p w3D           a2F)4p w3D
0  3.0     82712.57    1.46      3d5(4F)4p x5D            (4F)4p x5D
0  3.0     82936.09    1.12      3d5(a2F)4p w3F           a2F)4p w3F
0  3.0     83375.80              3d4(5D)4s4p(3P) y7P      5Dsp3P y7P
0  3.0     83933.83    0.76      3d5(4F)4p x3G            (4F)4p x3G
0  3.0     85734.65    0.75      3d5(2H)4p w3G            (2H)4p w3G
   3.0     85960.622             3d5(6S)5p x7P            (6S)5p x7P
   3.0     85952.69    1.06      3d5(4F)4p 3F             (4F)4p 3F
1  3.0                           3d4(5D)4s4p(3P) 7D       5Dsp3P 7D
0  3.0     86061.80              3d5(a2F)4p y1F           a2F)4p y1F
0  3.0     86302.62    1.15      3d5(4F)4p v3D            (4F)4p v3D
   3.0     86897.831             3d4(5D)4s4p(3P) w5P      5Dsp3P w5P
0  3.0     87717.66    1.06      3d5(a2G)4p u3F           a2G)4p u3F
0  3.0     89126.09    0.78      3d5(a2G)4p 3G            a2G)4p 3G
   3.0     89429.38              3d5(6S)5p v5P            (6S)5p v5P
0  3.0     89572.06    1.14     ?3d5(b2F)4p t3F           b2F)4p t3F
0  3.0     89950.37              3d5(a2G)4p x1F           a2G)4p x1F
   3.0     90786.0               3d4(5D)4s4p(3P) w5F      5Dsp3P w5F
   3.0     91018.27    0.71      3d5(b2F)4p u3G           b2F)4p u3G
   3.0     92083.09              3d5(b2F)4p u3D           b2F)4p u3D
0  3.0     94182.24    1.00      3d5(b2F)4p w1F           b2F)4p w1F
0  3.0     94989.77              3d4(5D)4s4p(3P) w5D      5Dsp3P w5D
0  3.0     96800.19              3d4(5D)4s4p(3P) s3F      5Dsp3P s3F
0  3.0     98423.773             3d5(6S)4f 7F             (6S)4f 7F
0  3.0     98463.366             3d5(6S)4f 5F             (6S)4f 5F
1  3.0                           3d5(b2D)4p 3F            (2D)4p 3F
1  3.0                           3d5(b2D)4p 3D            (2D)4p 3D
0  3.0    101312.9               3d4(5D)4s4p(3P) t3D      5Dsp3P t3D
0  3.0    101588.32    1.04      3d5(b2D)4p 1F            b2D)4p 1F
1  3.0                           3d5(6S)6p 7P             (6S)6p 7P
1  3.0                           3d5(6S)6p 5P             (6S)6p 5P
1  3.0                           3d4(3H)4s4p(_P) 5H       3Hsp_P 5H
1  3.0                           3d4(3P)4s4p(_P) 5D       3Psp_P 5D
1  3.0                           3d4(b3F)4s4p(3P) 5G      3Fsp3P 5G
0  3.0    106526.6               3d4(b3F)4s4p(3P) v5F     3Fsp3P v5F
0  3.0    107173.3               3d4(b3F)4s4p(3P) u5P     3Fsp3P u5P
1  3.0                           3d5(2G)5p 3G             (2G)4p 3G
1  3.0                           3d5(2G)5p 3F             (2G)4p 3F
0  3.0    108503.5               3d4(3H)4s4p(3P) x5G      3Hsp3P x5G
0  3.0    108410.31              3d5(6S)5f 7F             (6S)5f 7F
0  3.0    108439.04              3d5(6S)5f 5F             (6S)5f 5F
0  3.0    109123.13              3d4(b3F)4s4p(1P) u5F     3Fsp1P u5F
0  3.0    109379.4               3d4(5D)4s4p(1P) t5P      5Dsp1P t5P
1  3.0    109476.6               3d4(b3F)4s4p(3P) v5D     3Fsp3P v5D
1  3.0                           3d4(3H)4s4p(_P) 3G       3Hsp_P 3G
1  3.0    110018.4               r3F                      r3F
0  3.0    110548.0               3d4(3G)4s4p(3P) y5H      3Gsp3P y5H
1  3.0                           3d5(6S)7p 7P             (6S)7p 7P
0  3.0    111115.9               3d4(3G)4s4p(3P) t5F      3Gsp3P t5F
   3.0    111213.2               3d5(6S)7p s5P            (6S)7p s5P
1  3.0    110205.6               3d4(5D)4s4p(_P) u5D      5Dsp_P u5D
1  3.0
0  3.0    112452.9               3d5(4G)5p w5G            (4G)5p w5G
1  3.0                           3d5(4G)5p 5H             (4G)5p 5H
   3.0    112673.82              3d5(4G)5p q3F            (4G)5p q3F
   3.0    113110.3               3d4(3G)4s4p_P v5G        3Gsp_P v5G
   3.0    113251.6               3d4(3P)4s4p_P s3D        3Psp_P s3D
1  3.0                           3d5(4G)5p 3F             (4G)5p 3F
0  3.0    113642.31              3d5(4G)5p s5F            (4G)5p s5F
0  3.0    113520.2               3d5(4G)5p t3G            (4G)5p t3G
0  3.0    113773.6               3d4(b3F)4s4p(3P) 3G      3Fsp3P s3G
0  3.0    113840.528             3d5(6S)6f 7F             (6S)6f 7F
1  3.0                           3d5(6S)6h 5H             (6S)6h 5H
1  3.0                           3d5(6S)6h 7H             (6S)6h 7H
0  3.0    114026.45              3d5(6S)6f 5F             (6S)6f 5F
1  3.0                           3d5(4P)5p 5D             (4P)5p 5D
1  3.0                           3d5(6S)8p 7P             (6S)8p 7P
1  3.0                           3d4(3G)4s4p(_P) 3F       3Gsp_P 3F
1  3.0                           3d5(4P)5p 5P             (4P)5p 5P
1  3.0                           3d5(6S)8p 5P             (6S)8p 5P
1  3.0                           3d4(3F)4s4p(_P) 1F       3Fsp_P 1F
1  3.0                           3d5(4P)5p 3D             (4P)5p 3D
1  3.0                           3d4(3D)4s4p(_P) 5D       3Dsp_P 5D
1  3.0                           3d4(3D)4s4p(_P) 5P       3Dsp_P 5P
0  3.0    117113.23              3d5(6S)7f 7F             (6S)7f 7F
0  3.0    117139.5               3d5(6S)7f 5F             (6S)7f 5F
1  3.0                           3d5(6S)7h 5H             (6S)7h 5H
1  3.0                           3d5(6S)7h 7H             (6S)7h 7H
0  3.0    117314.24              3d4(3D)4s4p(3P) r5F      3Dsp3P r5F
1  3.0                           3d5(6S)9p 7P             (6S)9p 7P
1  3.0                           3d5(6S)9p 5P             (6S)9p 5P
1  3.0                           3d5(4D)5p 5F             (4D)5p 5F
1  3.0                           3d4(3G)4s4p(_P) 3G       3Gsp_P 3G
1  3.0                           3d5(4D)5p 5D             (4D)5p 5D
1  3.0                           3d4(3G)4s4p(_P) 1F       3Gsp_P 1F
1  3.0                           3d5(4D)5p 3D             (4D)5p 3D
1  3.0                           3d5(4D)5p 5P             (4D)5p 5P
1  3.0                           3d4(1G)4s4p(_P) 3F       1Gsp_P 3F
   3.0    119197.791             3d5(6S)8f 7F   FC        (6S)8f 7F
0  3.0    119251.5               3d5(6S)8f 5F             (6S)8f 5F
   3.0    119282.49              3d5(6S)8h 5H             (6S)8h 5H
0  3.0    119282.49              3d5(6S)8h 7H             (6S)8h 7H
1  3.0                           3d5(4D)5p 3F             (4D)5p 3F
1  3.0                           3d5(6S)10p 7P            (6S)10p 7P
1  3.0                           3d5(6S)10p 5P            (6S)10p 5P
1  3.0                           3d5(6S)9f 7F             (6S)9f 7F
1  3.0                           3d5(6S)9f 5F             (6S)9f 5F
0  3.0    120722.08              3d5(6S)9h 5H             (6S)9h 5H
0  3.0    120722.08              3d5(6S)9h 7H             (6S)9h 7H
1  3.0                           3d5(2P)4p 3D             (2P)4p 3D
1  3.0                           3d4(1G)4s4p(_P) 3G       1Gsp_P 3G
1  3.0                           3d5(6S)10f 7F            (6S)10f 7F
1  3.0                           3d5(6S)10f 5F            (6S)10f 5F
1  3.0                           3d4(3D)4s4p(_P) 3F       3Dsp_P 3F
1  3.0                           3d4(3D)4s4p(_P) 3D       3Dsp_P 3D
1  3.0                           3d4(1D)4s4p(_P) 3D       1Dsp_P 3D
1  3.0                           3d4(3D)4s4p(_P) 1F       3Dsp_P 1F
1  3.0                           3d5(4G)4f 5H             (4G)4f 5H
1  3.0                           3d5(4G)4f 5G             (4G)4f 5G
1  3.0                           3d5(4G)4f 5F             (4G)4f 5F
1  3.0                           3d5(4G)4f 3G             (4G)4f 3G
1  3.0                           3d5(4G)4f 3D             (4G)4f 3D
1  3.0                           3d5(4G)4f 3F             (4G)4f 3F
1  3.0                           3d5(4G)4f 5D             (4G)4f 5D
1  3.0                           3d5(4G)4f 5P             (4G)4f 5P
1  3.0                           3d4(1D)4s4p(_P) 3F       1Dsp_P 3F
0 -1.0
0  4.0     38806.691   1.740     3d5(6S)4p z7P            (6S)4p z7P
0  4.0     64494.14    1.17      3d5(4G)4p z5G            (4G)4p z5G
0  4.0     65566.03              3d5(4G)4p z5H            (4G)4p z5H
0  4.0     66643.296   1.368     3d5(4G)4p z5F            (4G)4p z5F
0  4.0     67295.446   1.479     3d5(4P)4p z5D            (4P)4p z5D
0  4.0     67865.945   1.259     3d5(4G)4p z3F            (4G)4p z3F
0  4.0     67910.56    0.789     3d5(4G)4p z3H            (4G)4p z3H
0  4.0     70546.34    1.167     3d5(4G)4p z3G            (4G)4p z3G
0  4.0     70497.790   1.250     3d5(4D)4p y5F            (4D)4p y5F
0  4.0     72011.05    1.477     3d5(4D)4p y5D            (4D)4p y5D
0  4.0     73683.44    1.253     3d5(4D)4p y3F            (4D)4p y3F
0  4.0     79800.61    0.81      3d5(2I)4p y3H            (2I)4p y3H
0  4.0     79913.34    1.24      3d5(a2D)4p x3F           a2D)4p x3F
0  4.0     81279.77    1.010     3d5(a2F)4p z1G           a2F)4p z1G
   4.0     81863.01    1.20      3d5(4F)4p y5G            (4F)4p y5G
   4.0     82099.99              3d5(2F)4p y3G            (2F)4p y3G
   4.0     81993.85    1.25      3d5(4F)4p x5F            (4F)4p x5F
   4.0     82564.463             3d4(5D)4s4p(3P) 7F   FC  5Dsp3P 7F
0  4.0     82605.33    1.47      3d5(4F)4p x5D            (4F)4p x5D
0  4.0     82830.76    1.22      3d5(a2F)4p w3F           a2F)4p w3F
0  4.0     83529.52              3d4(5D)4s4p(3P) y7P      5Dsp3P y7P
0  4.0     83875.47    1.02      3d5(4F)4p x3G            (4F)4p x3G
0  4.0     84307.20    0.81      3d5(a2G)4p x3H           a2G)4p x3H
0  4.0     85673.81    1.051     3d5(2H)4p w3G            (2H)4p w3G
0  4.0     85759.41    1.15      3d5(a2G)4p 1G            a2G)4p 1G
0  4.0     86057.625             3d5(6S)5p x7P            (6S)5p x7P
1  4.0                           3d4(5D)4s4p(3P) 7D       5Dsp3P 7D
0  4.0     86449.30    1.092     3d5(4F)4p 3F             (4F)4p 3F
0  4.0     87580.34    1.23      3d5(a2G)4p u3F           a2G)4p u3F
0  4.0     87941.14    0.82      3d5(2H)4p w3H            (2H)4p w3H
0  4.0     89096.54    1.08      3d5(a2G)4p 3G            a2G)4p 3G
0  4.0     89465.38              3d5(b2F)4p x1G           b2F)4p x1G
0  4.0     89800.35              3d5(b2F)4p t3F           b2F)4p t3F
0  4.0     91037.79              3d4(5D)4s4p(3P) w5F      5Dsp3P w5F
0  4.0     91178.90              3d5(b2F)4p u3G           b2F)4p u3G
0  4.0     92516.68    1.01      3d5(2H)4p w1G            (2H)4p w1G
   4.0     95206.47              3d4(5D)4s4p(3P) w5D      5Dsp3P w5D
0  4.0     97049.64              3d4(5D)4s4p(3P) s3F      5Dsp3P s3F
0  4.0     98423.624             3d5(6S)4f 7F             (6S)4f 7F
0  4.0     98464.323             3d5(6S)4f 5F             (6S)4f 5F
   4.0    100725.176             3d5(2D)4p 3F   FC        (2D)4p 3F
1  4.0                           3d5(6S)6p 7P             (6S)6p 7P
1  4.0                           3d4(3H)4s4p(3P) 5H       3Hsp3P 5H
1  4.0                           3d4(3H)4s4p(3P) 5I       3Hsp3P 5I
1  4.0                           3d4(3P)4s4p(3P) 5D       3Psp3P 5D
1  4.0                           3d4(3F)4s4p(3P) 5G       3Fsp3P 5G
0  4.0    106708.09              3d4(b3F)4s4p(3P) v5F     3Fsp3P v5F
1  4.0                           3d5(2G)4p 3H             (2G)4p 3H
1  4.0                           3d5(2G)4p 3F             (2G)4p 3F
1  4.0                           3d5(2G)4p 3G             (2G)4p 3G
0  4.0    108524.8               3d4(3H)4s4p(3P) x5G      3Hsp3P x5G
0  4.0    108410.18              3d5(6S)5f 7F             (6S)5f 7F
0  4.0    108441.49              3d5(6S)5f 5F             (6S)5f 5F
0  4.0    109473.92              3d5(b2G)4p v1G           b2G)4p v1G
0  4.0    109221.8               3d4(b3F)4s4p(1P) u5F     3Fsp1P u5F
1  4.0    109608.4               3d4(b3F)4s4p(3P) v5D     3Fsp3P v5D
1  4.0    110141.56              r3F                      r3F
0  4.0    110602.3               3d4(3G)4s4p(3P) y5H      3Gsp3P y5H
1  4.0                           3d5(6S)7p 7P             (6S)7p 7P
0  4.0    111159.3               3d4(3G)4s4p(3P) t5F      3Gsp3P t5F
1  4.0                           3d4(3H)4s4p(_P) 1G       3Hsp_P 1G
1  4.0    110429.23              3d4(5D)4s4p(_P) 5D       5Dsp_P 5D
   4.0    111720.0               3d4(3H)4s4p(3P) u3H      3Hsp3P u3H
0  4.0    112463.3               3d5(4G)5p w5G            (4G)5p w5G
1  4.0                           3d5(4G)5p 5H             (4G)5p 5H
   4.0    112879.8               3d5(4G)5p q3F            (4G)5p q3F
1  4.0                           3d4(3G)4s4p(_P) v5G      3Gsp_P v5G
   4.0    113181.6               3d5(4G)5p 3H             (4G)5p 3H
1  4.0                           3d5(4G)5p 3F             (4G)5p 3F
0  4.0    113647.79              3d5(4G)5p s5F            (4G)5p s5F
0  4.0    113560.3               3d5(4G)5p t3G            (4G)5p t3G
0  4.0    113840.40              3d5(6S)6f 7F             (6S)6f 7F
1  4.0                           3d5(6S)6h 5H             (6S)6h 5H
1  4.0                           3d5(6S)6h 7H             (6S)6h 7H
0  4.0    114028.11              3d5(6S)6f 5F             (6S)6f 5F
0  4.0    113926.3               3d4(b3F)4s4p(3P) s3G     3Fsp3P s3G
1  4.0                           3d4(3G)4s4p(_P) 3H       3Gsp_P 3H
1  4.0                           3d5(4P)5p 5D             (4P)5p 5D
1  4.0                           3d5(6S)8p 7P             (6S)8p 7P
1  4.0                           3d4(3G)4s4p(_P) 3F       3Gsp_P 3F
1  4.0                           3d4(3D)4s4p(_P) 5D       3Dsp_P 5D
0  4.0    117113.23              3d5(6S)7f 7F             (6S)7f 7F
0  4.0    117137.8               3d5(6S)7f 5F             (6S)7f 5F
1  4.0                           3d5(6S)7h 5H             (6S)7h 5H
1  4.0                           3d5(6S)7h 7H             (6S)7h 7H
0  4.0    117398.7               3d4(3D)4s4p(3P) r5F      3Dsp3P r5F
1  4.0                           3d4(3F)4s4p(_P) 1G       3Fsp_P 1G
1  4.0                           3d5(6S)9p 7P             (6S)9p 7P
1  4.0                           3d5(4D)5p 5F             (4D)5p 5F
1  4.0                           3d4(3G)4s4p(_P) 3G       3Gsp_P 3G
1  4.0                           3d5(4D)5p 5D             (4D)5p 5D
1  4.0                           3d5(4D)5p 3F             (4D)5p 3F
1  4.0                           3d4(1G)4s4p(_P) 3H       1Gsp_P 3H
   4.0    119197.791             3d5(6S)8f 7F   FC        (6S)8f 7F
0  4.0    119255.76              3d5(6S)8f 5F             (6S)8f 5F
0  4.0    119282.49              3d5(6S)8h 5H             (6S)8h 5H
0  4.0    119282.49              3d5(6S)8h 7H             (6S)8h 7H
1  4.0                           3d5(6S)8k 7K             (6S)8k 7K
1  4.0                           3d4(1G)4s4p(_P) 3F       1Gsp_P 3F
1  4.0                           3d5(6S)10p 7P            (6S)10p 7P
1  4.0                           3d5(6S)9f 7F             (6S)9f 7F
1  4.0                           3d5(6S)9f 5F             (6S)9f 5F
0  4.0    120722.08              3d5(6S)9h 5H             (6S)9h 5H
0  4.0    120722.08              3d5(6S)9h 7H             (6S)9h 7H
1  4.0                           3d5(6S)9k 7K             (6S)9k 7K
1  4.0                           3d4(3G)4s4p(_P) 1G       3Gsp_P 1G
1  4.0                           3d4(1G)4s4p(_P) 3G       1Gsp_P 3G
1  4.0                           3d5(6S)10f 7F            (6S)10f 7F
1  4.0                           3d5(6S)10f 5F            (6S)10f 5F
1  4.0                           3d4(1I)4s4p(_P) 3H       1Isp_P 3H
1  4.0                           3d4(3D)4s4p(_P) 3F       3Dsp_P 3F
1  4.0                           3d5(2I)5p 3H             (2I)5p 3H
1  4.0                           3d5(4G)4f 5I             (4G)4f 5I
1  4.0                           3d5(4G)4f 5H             (4G)4f 5H
1  4.0                           3d5(4G)4f 5G             (4G)4f 5G
1  4.0                           3d5(4G)4f 5F             (4G)4f 5F
1  4.0                           3d5(4G)4f 3H             (4G)4f 3H
1  4.0                           3d5(4G)4f 3G             (4G)4f 3G
1  4.0                           3d5(4G)4f 3F             (4G)4f 3F
1  4.0                           3d5(4G)4f 5D             (4G)4f 5D
0 -1.0
0  5.0     64518.89    1.269     3d5(4G)4p z5G            (4G)4p z5G
0  5.0     65658.65              3d5(4G)4p z5H            (4G)4p z5H
0  5.0     66542.539   1.395     3d5(4G)4p z5F            (4G)4p z5F
0  5.0     67846.24    1.028     3d5(4G)4p z3H            (4G)4p z3H
0  5.0     70527.61    1.199     3d5(4G)4p z3G            (4G)4p z3G
0  5.0     70657.595   1.38      3d5(4D)4p y5F            (4D)4p y5F
0  5.0     78085.26    0.83      3d5(2I)4p z3I            (2I)4p z3I
0  5.0     79112.62    1.011     3d5(2I)4p z1H            (2I)4p z1H
0  5.0     79739.95    1.03      3d5(2I)4p y3H            (2I)4p y3H
   5.0     81886.37              3d5(4F)4p x5F            (4F)4p x5F
0  5.0     82117.22    1.28      3d5(4F)4p y5G            (4F)4p y5G
   5.0     82232.10    1.29      3d5(2F)4p y3G            (2F)4p y3G
1  5.0                           3d4(5D)4s4p(3P) 7F       5Dsp3P 7F
0  5.0     83912.42    1.20      3d5(4F)4p x3G            (4F)4p x3G
0  5.0     84428.19    1.03      3d5(a2G)4p x3H           a2G)4p x3H
0  5.0     85447.76    0.82      3d5(2H)4p y3I            (2H)4p y3I
0  5.0     85543.34    1.19      3d5(2H)4p w3G            (2H)4p w3G
1  5.0                           3d4(5D)4s4p(3P) 7D       5Dsp3P 7D
0  5.0     87995.51    1.03      3d5(2H)4p w3H            (2H)4p w3H
0  5.0     88772.35              3d5(a2G)4p 3G            a2G)4p 3G
0  5.0     89062.69    1.14      3d5(a2G)4p 1H            a2G)4p 1H
0  5.0     89760.29    1.02      3d5(2H)4p x1H            (2H)4p x1H
0  5.0     91302.06    1.24      3d5(b2F)4p u3G           b2F)4p u3G
0  5.0     91384.98              3d4(5D)4s4p(3P) w5F      5Dsp3P w5F
0  5.0     98423.424             3d5(6S)4f 7F             (6S)4f 7F
0  5.0     98465.345             3d5(6S)4f 5F             (6S)4f 5F
1  5.0                           3d4(3H)4s4p(3P) 5H       3Hsp3P 5H
1  5.0                           3d4(3H)4s4p(3P) 5I       3Hsp3P 5I
1  5.0                           3d4(b3F)4s4p(3P) 5G      3Fsp3P 5G
1  5.0                           3d5(2G)4p 3H             (2G)4p 3H
0  5.0    106894.2               3d4(b3F)4s4p(3P) v5F     3Fsp3P v5F
1  5.0                           3d5(2G)4p 3G             (2G)4p 3G
0  5.0    108409.99              3d5(6S)5f 7F             (6S)5f 7F
0  5.0    108551.2               3d4(3H)4s4p(3P) x5G      3Hsp3P x5G
0  5.0    108443.15              3d5(6S)5f 5F             (6S)5f 5F
   5.0    108920.25              3d5(2G)4p 1H             (2G)4p 1H
   5.0    109327.45              3d4(b3F)4s4p(1P) u5F     3Fsp1P u5F
1  5.0                           3d4(3H)4s4p(3P) 3G       3Hsp3P 3G
0  5.0    110691.9               3d4(3G)4s4p(3P) y5H      3Gsp3P y5H
0  5.0    111083.54              3d4(3H)4s4p(3P) x3I      3Hsp3P x3I
0  5.0    111160.62              3d4(3G)4s4p(3P) t5F      3Gsp3P t5F
0  5.0    111854.39              3d4(3H)4s4p(3P) u3H      3Hsp3P u3H
0  5.0    112468.8               3d5(4G)5p w5G            (4G)5p w5G
1  5.0                           3d5(4G)5p 5H             (4G)5p 5H
   5.0    113251.0               3d4(3G)4s4p(3P) v5G      4Gsp3P v5G
1  5.0                           3d5(4G)5p 3H             (4G)5p 3H
0  5.0    113515.0               3d5(4G)5p t3G            (4G)5p t3G
0  5.0    113658.67              3d5(4G)5p s5F            (4G)5p s5F
0  5.0    113840.322             3d5(6S)6f 7F             (6S)6f 7F
1  5.0                           3d5(6S)6h 5H             (6S)6h 5H
1  5.0                           3d5(6S)6h 7H             (6S)6h 7H
0  5.0    114026.99              3d5(6S)6f 5F             (6S)6f 5F
0  5.0    114090.7               3d4(b3F)4s4p(3P) s3G     3Fsp3P s3G
1  5.0                           3d4(3G)4s4p(_P) 3H       3Gsp_P 3H
1  5.0                           3d4(3H)4s4p(_P) 1H       3Hsp_P 1H
0  5.0    117113.15              3d5(6S)7f 7F             (6S)7f 7F
0  5.0    117148.4               3d5(6S)7f 5F             (6S)7f 5F
1  5.0                           3d5(6S)7h 5H             (6S)7h 5H
1  5.0                           3d5(6S)7h 7H             (6S)7h 7H
0  5.0    117483.44              3d4(3D)4s4p(3P) r5F      3Dsp3P 5F
1  5.0                           3d4(3G)4s4p(_P) 1H       3Gsp_P 1H
1  5.0                           3d5(4D)5p 5F             (4D)5p 5F
1  5.0                           3d4(1I)4s4p(_P) 3I       1Isp_P 3I
1  5.0                           3d4(3G)4s4p(_P) 3G       3Gsp_P 3G
1  5.0                           3d4(1G)4s4p(_P) 3H       1Gsp_P 3H
   5.0    119197.791             3d5(6S)8f 7F   FC        (6S)8f 7F
0  5.0    119252.80              3d5(6S)8f 5F             (6S)8f 5F
0  5.0    119282.49              3d5(6S)8h 5H             (6S)8h 5H
0  5.0    119282.49              3d5(6S)8h 7H             (6S)8h 7H
1  5.0                           3d5(6S)8k 7K             (6S)8k 7K
1  5.0                           3d5(6S)8k 5K             (6S)8k 5K
1  5.0                           3d5(6S)9f 7F             (6S)9f 7F
1  5.0                           3d5(6S)9f 5F             (6S)9f 5F
   5.0    120722.08              3d5(6S)9h 5H             (6S)9h 5H
0  5.0    120722.08              3d5(6S)9h 7H             (6S)9h 7H
1  5.0                           3d5(6S)9k 7K             (6S)9k 7K
1  5.0                           3d5(6S)9k 5K             (6S)9k 5K
1  5.0                           3d4(1G)4s4p(_P) 3G       1Gsp_P 3G
1  5.0                           3d5(6S)10f 7F            (6S)10f 7F
1  5.0                           3d5(6S)10f 5F            (6S)10f 5F
1  5.0                           3d4(1G)4s4p(_P) 3H       1Gsp_P 3H
1  5.0                           3d5(2I)5p 3H             (2I)5p 3H
1  5.0                           3d5(2I)5p 3I             (2I)5p 3I
1  5.0                           3d5(4G)4f 5K             (4G)4f 5K
1  5.0                           3d5(4G)4f 5I             (4G)4f 5I
1  5.0                           3d5(4G)4f 5H             (4G)4f 5H
1  5.0                           3d5(4G)4f 5G             (4G)4f 5G
1  5.0                           3d5(4G)4f 3I             (4G)4f 3I
1  5.0                           3d5(4G)4f 5F             (4G)4f 5F
1  5.0                           3d5(4G)4f 3H             (4G)4f 3H
1  5.0                           3d5(4G)4f 3G             (4G)4f 3G
1  5.0
0 -1.0
0  6.0     64550.04    1.331     3d5(4G)4p z5G            (4G)4p z5G
0  6.0     65754.82    1.23      3d5(4G)4p z5H            (4G)4p z5H
0  6.0     67744.44    1.160     3d5(4G)4p z3H            (4G)4p z3H
0  6.0     77842.13    0.909     3d5(2I)4p z3K            (2I)4p z3K
0  6.0     78340.74    1.014     3d5(2I)4p z3I            (2I)4p z3I
0  6.0     79592.42    1.16      3d5(2I)4p y3H            (2I)4p y3H
0  6.0     81802.746   1.00      3d5(2I)4p z1I   FC       (2I)4p z1I
0  6.0     82142.46    1.36      3d5(4F)4p y5G            (4F)4p y5G
1  6.0                           3d4(5D)4s4p(3P) 7F       5Dsp3P 7F
0  6.0     84643.94    1.15      3d5(a2G)4p x3H           a2G)4p x3H
0  6.0     85636.17    1.05      3d5(2H)4p y3I            (2H)4p y3I
0  6.0     86869.44    1.02      3d5(2H)4p y1I            (2H)4p y1I
0  6.0     88198.16    1.16      3d5(2H)4p w3H            (2H)4p w3H
0  6.0     98423.281             3d5(6S)4f 7F   FC        (6S)4f 7F
1  6.0                           3d4(3H)4s4p(3P) 5H       3Hsp3P 5H
1  6.0                           3d4(3H)4s4p(3P) 5I       3Hsp3P 5I
1  6.0                           3d4(3F)4s4p(3P) 5G       3Fsp3P 5G
1  6.0                           3d5(2G)4p 3H             (2G)4p 3H
0  6.0    108409.83              3d5(6S)5f 7F             (6S)5f 7F
   6.0    108587.6               3d4(3H)4s4p(3P) 5G       3Hsp3P 5G
0  6.0    110795.5               3d4(3G)4s4p(3P) y5H      3Gsp3P y5H
0  6.0    111339.2               3d4(3H)4s4p(3P) x3I      3Hsp3P x3I
0  6.0    112128.3               3d4(3H)4s4p(3P) u3H      3Hsp3P u3H
0  6.0    112472.1               3d5(4G)5p w5G            (4G)5p w5G
1  6.0                           3d5(4G)5p w5H            (4G)5p w5H
1  6.0                           3d5(4G)5p 3H             (4G)5p 3H
   6.0    113323.2               3d4(3G)4s4p(3P) v5G      3Gsp3P v5G
0  6.0    113840.14              3d5(6S)6f 7F             (6S)6f 7F
1  6.0                           3d5(6S)6h 5H             (6S)6h 5H
1  6.0                           3d5(6S)6h 7H             (6S)6h 7H
1  6.0                           3d4(3H)4s4p(_P) 1I       3Hsp3P 1I
1  6.0                           3d4(3G)4s4p(_P) 3H       3Gsp3P 3H
0  6.0    117113.08              3d5(6S)7f 7F             (6S)7f 7F
1  6.0                           3d5(6S)7h 5H             (6S)7h 5H
1  6.0                           3d5(6S)7h 7H             (6S)7h 7H
1  6.0                           3d4(1I)4s4p(_P) 3I       1Isp3P 3I
1  6.0                           3d4(1G)4s4p(_P) 3H       1Gsp3P 3H
1  6.0                           3d4(1I)4s4p(_P) 3K       1Isp3P 3K
   6.0    119197.791             3d5(6S)8f 7F   FC        (6S)8f 7F
0  6.0    119282.49              3d5(6S)8h 5H             (6S)8h 5H
0  6.0    119282.49              3d5(6S)8h 7H             (6S)8h 7H
1  6.0                           3d5(6S)8k 7K             (6S)8k 7K
1  6.0                           3d5(6S)8k 5K             (6S)8k 5K
1  6.0                           3d5(6S)9f 7F             (6S)9f 7F
0  6.0    120722.08              3d5(6S)9h 5H             (6S)9h 5H
0  6.0    120722.08              3d5(6S)9h 7H             (6S)9h 7H
1  6.0                           3d5(6S)9k 7K             (6S)9k 7K
1  6.0                           3d5(6S)9k 5K             (6S)9k 5K
1  6.0                           3d5(6S)10f 7F            (6S)10f 7F
1  6.0                           3d4(1I)4s4p(_P) 3H       1Isp3P 3H
1  6.0                           3d5(2I)5p 3H             (2I)5p 3H
1  6.0                           3d5(2I)5p 3I             (2I)5p 3I
1  6.0                           3d5(2I)5p 3K             (2I)5p 3K
1  6.0                           3d5(4G)4f 5K             (4G)4f 5K
   6.0    125257.344             3d5(4G)4f 5I   FC        (4G)4f 5I
1  6.0                           3d5(4G)4f 3K             (4G)4f 3K
1  6.0                           3d5(4G)4f 5H             (4G)4f 5H
1  6.0                           3d5(4G)4f 5G             (4G)4f 5G
1  6.0                           3d5(4G)4f 3I             (4G)4f 3I
1  6.0                           3d5(4G)4f 3H             (4G)4f 3H
1  6.0                           3d5(2I)5p 1I             (2I)5p 1I
0 -1.0
0  7.0     65847.03    1.31      3d5(4G)4p z5H            (4G)4p z5H
0  7.0     77945.75    1.050     3d5(2I)4p z3K            (2I)4p z3K
0  7.0     78475.47    1.13      3d5(2I)4p z3I            (2I)4p z3I
0  7.0     79147.22    1.003     3d5(2I)4p z1K            (2I)4p z1K
0  7.0     85811.53    1.12      3d5(2H)4p y3I            (2H)4p y3I
1  7.0                           3d4(3H)4s4p(3P) 5H       3Hsp3P 5H
1  7.0                           3d4(3H)4s4p(3P) 5I       3Hsp3P 5I
0  7.0    110926.5               3d4(3G)4s4p(3P) y5H      3Gsp3P y5H
0  7.0    111816.5               3d4(3H)4s4p(3P) x3I      3Hsp3P x3I
1  7.0                           3d5(4G)5p 5H             (4G)5p 5H
1  7.0                           3d5(6S)6h 7H             (6S)6h 7H
1  7.0                           3d5(6S)6h 5H             (6S)6h 5H
1  7.0                           3d5(6S)7h 5H             (6S)7h 5H
1  7.0                           3d5(6S)7h 7H             (6S)7h 7H
1  7.0                           3d4(1I)4s4p(3P) 3I       1Isp3P 3I
1  7.0                           3d4(1I)4s4p(3P) 3K       1Isp3P 3K
0  7.0    119282.49              3d5(6S)8h 5H             (6S)8h 5H
0  7.0    119282.49              3d5(6S)8h 7H             (6S)8h 7H
1  7.0                           3d5(6S)8k 5K             (6S)8k 5K
1  7.0                           3d5(6S)8k 7K             (6S)8k 7K
0  7.0    120722.08              3d5(6S)9h 5H             (6S)9h 5H
0  7.0    120722.08              3d5(6S)9h 7H             (6S)9h 7H
1  7.0                           3d5(6S)9k 5K             (6S)9k 5K
1  7.0                           3d5(6S)9k 7K             (6S)9k 7K
1  7.0                           3d5(2I)5p 3I             (2I)5p 3I
1  7.0                           3d5(2I)5p 3K             (2I)5p 3K
1  7.0                           3d5(2I)5p 1K             (2I)5p 1K
1  7.0                           3d5(4G)4f 5K             (4G)4f 5K
1  7.0                           3d5(4G)4f 5I             (4G)4f 5I
   7.0    125218.64              3d5(4G)4f 5H   FC        (4G)4f 5H
1  7.0                           3d5(4G)4f 3K             (4G)4f 3K
1  7.0                           3d5(4G)4f 3I             (4G)4f 3I
1  7.0
0 -1.0
1  8.0     77820.28    1.14      3d5(2I)4p z3K            (2I)4p z3K
1  8.0                           3d4(3H)4s4p(3P) 5I       3Hsp3P 5I
1  8.0                           3d5(6S)8h 7H             (6S)6h 7H
1  8.0                           3d5(6S)7h 7H             (6S)7h 7H
0  8.0    119282.3               3d5(6S)8h 7H             (6S)8h 7H
1  8.0                           3d5(6S)8k 7K             (6S)8k 7K
1  8.0                           3d5(6S)8k 5K             (6S)8k 5K
1  8.0                           3d4(1I)4s4p(3P) 3K       1Isp3P 3K
0  8.0    120721.9               3d5(6S)9h 7H             (6S)9h 7H
1  8.0                           3d5(6S)9k 7K             (6S)9k 7K
1  8.0                           3d5(6S)9k 5K             (6S)9k 5K
1  8.0                           3d5(2I)5p 3K             (2I)5p 3K
1  8.0                           3d5(4G)4f 5I             (4G)4f 5I
1  8.0                           3d5(4G)4f 5K             (4G)4f 5K
1  8.0                           3d5(4G)4f 3K             (4G)4f 3K
0 -1.0
1  9.0                           3d5(6S)9k 7K             (6S)8k 7K
1  9.0                           3d5(6S)8k 5K             (6S)8k 5K
1  9.0                           3d5(6S)9k 7K             (6S)9k 7K
1  9.0                           3d5(6S)9k 5K             (6S)9k 5K
   9.0    125243.338             3d5(4G)4f 5K   FC        (4G)4f 5K
0 -1.0
0 -1.0
  -1.
  -1
  -1
  -1
 2787      83.6   32      LEAST SQUARES
   1    1  EAV        84773.8     2.   35786.6             1.000  0   48300.0  0             d5 4p     
   2    1  F2(11)     66046.6     6.   81685.5             0.800  0       0.0  0                       
   3    1  F4(11)     40329.2    15.   50657.3             0.800  0       0.0  0                       
   4    1  ALPHA         13.0     3.       0.0             1.000  0       0.0  0                       
   5    1  BETA        1012.2     0.       0.0 FIXED       1.000  0       0.0  0                       
   6    1  t(d 5)        -6.7     3.       0.0             1.000  0       0.0  0                       
   7    1  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
   8    1  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
   9    1  ZETA 1       317.8     0.     324.6 FIXED       1.000  0       0.0  0                       
  10    1  ZETA 3       373.1     0.     393.5 FIXED       1.000  0       0.0  0                       
  11    1  F2(13)     12651.3    74.   15083.6             0.800  0       0.0  0                       
  12    1  G1(13)      5242.1    25.    6256.7             0.800  0       0.0  0                       
  13    1  G3(13)      2957.8    47.    5235.4             0.800  0       0.0  0                       
  14    2  EAV       130359.8    21.   82124.1             1.000  0   48300.0  0             d5 5p     
  15    2  F2(11)     66579.3     0.   82707.2 FIXEDHF     0.805  0       0.0  0                       
  16    2  F4(11)     40866.9     0.   51340.3 FIXEDHF     0.796  0       0.0  0                       
  17    2  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  18    2  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  19    2  t(d 5)        -6.6     0.       0.0 FIXED       1.000  0       0.0  0                       
  20    2  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  21    2  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  22    2  ZETA 1       321.3     0.     328.2 FIXEDHF     0.979  0       0.0  0                       
  23    2  ZETA 4       112.5     0.     118.7 FIXEDHF     0.948  0       0.0  0                       
  24    2  F2(14)      3274.9     0.    3988.9 FIXEDHF     0.821  0       0.0  0                       
  25    2  G1(14)      1134.9    59.    1479.1             0.800  0       0.0  0                       
  26    2  G3(14)       797.9     0.    1329.8 FIXEDHF     0.600  0       0.0  0                       
  27    3  EAV       147026.7     0.   98726.7 FIXEDHF     1.000  0   48300.0  0             d5 6p     
  28    3  F2(11)     66737.4     0.   82903.6 FIXEDHF     0.805  0       0.0  0                       
  29    3  F4(11)     40971.6     0.   51471.9 FIXEDHF     0.796  0       0.0  0                       
  30    3  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  31    3  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  32    3  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
  33    3  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  34    3  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  35    3  ZETA 1       322.1     0.     329.0 FIXEDHF     0.979  0       0.0  0                       
  36    3  ZETA 4        49.4     0.      52.1 FIXEDHF     0.948  0       0.0  0                       
  37    3  F2(14)      1324.5     0.    1655.6 FIXEDHF     0.800  0       0.0  0                       
  38    3  G1(14)       486.0     0.     607.5 FIXEDHF     0.800  0       0.0  0                       
  39    3  G3(14)       334.0     0.     556.7 FIXEDHF     0.600  0       0.0  0                       
  40    4  EAV       155058.7    42.  106738.1             1.000  0   48300.0  0             d5 7p     
  41    4  F2(11)     66791.9     0.   82971.3 FIXEDHF     0.805  0       0.0  0                       
  42    4  F4(11)     41007.6     0.   51517.1 FIXEDHF     0.796  0       0.0  0                       
  43    4  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  44    4  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  45    4  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
  46    4  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  47    4  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  48    4  ZETA 1       322.4     0.     329.3 FIXEDHF     0.979  0       0.0  0                       
  49    4  ZETA 4        26.1     0.      27.5 FIXEDHF     0.948  0       0.0  0                       
  50    4  F2(14)       680.5     0.     850.6 FIXEDHF     0.800  0       0.0  0                       
  51    4  G1(14)       249.5     0.     311.9 FIXEDHF     0.800  0       0.0  0                       
  52    4  G3(14)       173.0     0.     288.3 FIXEDHF     0.600  0       0.0  0                       
  53    5  EAV       159534.8     0.  111234.8 FIXEDHF     1.000  0   48300.0  0             d5 8p     
  54    5  F2(11)     66816.0     0.   83001.3 FIXEDHF     0.805  0       0.0  0                       
  55    5  F4(11)     41023.6     0.   51537.2 FIXEDHF     0.796  0       0.0  0                       
  56    5  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  57    5  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  58    5  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
  59    5  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  60    5  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  61    5  ZETA 1       322.5     0.     329.4 FIXEDHF     0.979  0       0.0  0                       
  62    5  ZETA 4        15.5     0.      16.3 FIXEDHF     0.948  0       0.0  0                       
  63    5  F2(14)       396.9     0.     496.1 FIXEDHF     0.800  0       0.0  0                       
  64    5  G1(14)       145.6     0.     182.0 FIXEDHF     0.800  0       0.0  0                       
  65    5  G3(14)       101.4     0.     169.0 FIXEDHF     0.600  0       0.0  0                       
  66    6  EAV       162313.4     0.  114013.4 FIXEDHF     1.000  0   48300.0  0             d5 9p     
  67    6  F2(11)     66828.4     0.   83016.6 FIXEDHF     0.805  0       0.0  0                       
  68    6  F4(11)     41031.8     0.   51547.5 FIXEDHF     0.796  0       0.0  0                       
  69    6  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  70    6  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  71    6  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
  72    6  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  73    6  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  74    6  ZETA 1       322.6     0.     329.5 FIXEDHF     0.979  0       0.0  0                       
  75    6  ZETA 4        10.0     0.      10.5 FIXEDHF     0.948  0       0.0  0                       
  76    6  F2(14)       267.7     0.     314.9 FIXEDHF     0.850  0       0.0  0                       
  77    6  G1(14)        98.3     0.     115.6 FIXEDHF     0.850  0       0.0  0                       
  78    6  G3(14)        64.6     0.     107.7 FIXEDHF     0.600  0       0.0  0                       
  79    7  EAV       164151.0     0.  115851.0 FIXEDHF     1.000  0   48300.0  0             d5 10p    
  80    7  F2(11)     66835.4     0.   83025.4 FIXEDHF     0.805  0       0.0  0                       
  81    7  F4(11)     41036.4     0.   51553.3 FIXEDHF     0.796  0       0.0  0                       
  82    7  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  83    7  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  84    7  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
  85    7  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  86    7  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  87    7  ZETA 1       322.6     0.     329.5 FIXEDHF     0.979  0       0.0  0                       
  88    7  ZETA 4         6.7     0.       7.1 FIXEDHF     0.948  0       0.0  0                       
  89    7  F2(14)       170.1     0.     212.6 FIXEDHF     0.800  0       0.0  0                       
  90    7  G1(14)        62.5     0.      78.1 FIXEDHF     0.800  0       0.0  0                       
  91    7  G3(14)        43.7     0.      72.9 FIXEDHF     0.600  0       0.0  0                       
  92    8  EAV       123199.6     8.   68267.3             1.000  0   55000.0  0             d4 4s4p   
  93    8  F2(11)     71011.8    36.   89264.1             0.800  0       0.0  0                       
  94    8  F4(11)     46611.5   112.   55693.8             0.800  0       0.0  0                       
  95    8  ALPHA         71.1     9.       0.0             1.000  0       0.0  0                       
  96    8  BETA          -6.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  97    8  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  98    8  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
  99    8  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 100    8  ZETA 1       338.4    18.     366.5             1.000  0       0.0  0                       
 101    8  ZETA 3       558.7    57.     501.4             1.000  0       0.0  0                       
 102    8  F2(13)     15373.9    82.   16847.8             0.800  0       0.0  0                       
 103    8  G2(12)      8810.3    67.   10506.2             0.800  0       0.0  0                       
 104    8  G1(13)      5130.7    45.    6423.4             0.800  0       0.0  0                       
 105    8  G3(13)      2708.3   161.    5612.9             0.800  0       0.0  0                       
 106    8  G1(23)     29764.0   129.   42629.7             0.800  0       0.0  0                       
 107    9  EAV       180002.8     0.  125002.8 FIXEDHF     1.000  0   55000.0  0             d4 4s5p   
 108    9  F2(11)     71492.6     0.   90041.0 FIXEDHF     0.794  0       0.0  0                       
 109    9  F4(11)     46828.4     0.   56216.6 FIXEDHF     0.833  0       0.0  0                       
 110    9  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 111    9  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 112    9  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 113    9  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 114    9  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 115    9  ZETA 1       369.8     0.     369.8 FIXEDHF     1.000  0       0.0  0                       
 116    9  ZETA 4       122.8     0.     122.8 FIXEDHF     1.000  0       0.0  0                       
 117    9  F2(14)      3579.9     0.    3804.4 FIXEDHF     0.941  0       0.0  0                       
 118    9  G2(12)      9312.4     0.   11329.0 FIXEDHF     0.822  0       0.0  0                       
 119    9  G1(14)      1130.5     0.    1296.4 FIXEDHF     0.872  0       0.0  0                       
 120    9  G3(14)       719.6     0.    1199.3 FIXEDHF     0.600  0       0.0  0                       
 121    9  G1(24)      3140.4     0.    4486.3 FIXEDHF     0.700  0       0.0  0                       
 122    A  EAV       198338.2     0.  143338.2 FIXEDHF     1.000  0   55000.0  0             d4 4s6p   
 123    A  F2(11)     71597.3     0.   90172.9 FIXEDHF     0.794  0       0.0  0                       
 124    A  F4(11)     46902.4     0.   56305.4 FIXEDHF     0.833  0       0.0  0                       
 125    A  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 126    A  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 127    A  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 128    A  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 129    A  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 130    A  ZETA 1       336.0     0.     370.4 FIXEDHF     0.907  0       0.0  0                       
 131    A  ZETA 4        53.7     0.      53.7 FIXEDHF     1.000  0       0.0  0                       
 132    A  F2(14)      1261.1     0.    1576.4 FIXEDHF     0.800  0       0.0  0                       
 133    A  G2(12)      9119.6     0.   11399.5 FIXEDHF     0.800  0       0.0  0                       
 134    A  G1(14)       431.8     0.     539.8 FIXEDHF     0.800  0       0.0  0                       
 135    A  G3(14)       405.1     0.     506.4 FIXEDHF     0.800  0       0.0  0                       
 136    A  G1(24)      1294.6     0.    1618.2 FIXEDHF     0.800  0       0.0  0                       
 137    B  EAV       206867.6     0.  151867.6 FIXEDHF     1.000  0   55000.0  0             d4 4s7p   
 138    B  F2(11)     71634.0     0.   90219.1 FIXEDHF     0.794  0       0.0  0                       
 139    B  F4(11)     46928.3     0.   56336.5 FIXEDHF     0.833  0       0.0  0                       
 140    B  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 141    B  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 142    B  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 143    B  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 144    B  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 145    B  ZETA 1       370.6     0.     370.6 FIXEDHF     1.000  0       0.0  0                       
 146    B  ZETA 4        28.5     0.      28.5 FIXEDHF     1.000  0       0.0  0                       
 147    B  F2(14)       649.7     0.     812.1 FIXEDHF     0.800  0       0.0  0                       
 148    B  G2(12)      9138.5     0.   11423.1 FIXEDHF     0.800  0       0.0  0                       
 149    B  G1(14)       223.9     0.     279.9 FIXEDHF     0.800  0       0.0  0                       
 150    B  G3(14)       211.4     0.     264.3 FIXEDHF     0.800  0       0.0  0                       
 151    B  G1(24)       630.8     0.     788.5 FIXEDHF     0.800  0       0.0  0                       
 152    C  EAV       211585.1     0.  156585.1 FIXEDHF     1.000  0   55000.0  0             d4 4s8p   
 153    C  F2(11)     71650.6     0.   90240.0 FIXEDHF     0.794  0       0.0  0                       
 154    C  F4(11)     46940.0     0.   56350.6 FIXEDHF     0.833  0       0.0  0                       
 155    C  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 156    C  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 157    C  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 158    C  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 159    C  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 160    C  ZETA 1       370.7     0.     370.7 FIXEDHF     1.000  0       0.0  0                       
 161    C  ZETA 4        16.9     0.      16.9 FIXEDHF     1.000  0       0.0  0                       
 162    C  F2(14)       379.6     0.     474.5 FIXEDHF     0.800  0       0.0  0                       
 163    C  G2(12)      9146.3     0.   11432.9 FIXEDHF     0.800  0       0.0  0                       
 164    C  G1(14)       131.5     0.     164.4 FIXEDHF     0.800  0       0.0  0                       
 165    C  G3(14)       124.6     0.     155.7 FIXEDHF     0.800  0       0.0  0                       
 166    C  G1(24)       358.1     0.     447.6 FIXEDHF     0.800  0       0.0  0                       
 167    D  EAV       214474.7     0.  159474.7 FIXEDHF     1.000  0   55000.0  0             d4 4s9p   
 168    D  F2(11)     71659.1     0.   90250.8 FIXEDHF     0.794  0       0.0  0                       
 169    D  F4(11)     46946.1     0.   56357.9 FIXEDHF     0.833  0       0.0  0                       
 170    D  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 171    D  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 172    D  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 173    D  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 174    D  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 175    D  ZETA 1       370.8     0.     370.8 FIXEDHF     1.000  0       0.0  0                       
 176    D  ZETA 4        10.9     0.      10.9 FIXEDHF     1.000  0       0.0  0                       
 177    D  F2(14)       241.3     0.     301.6 FIXEDHF     0.800  0       0.0  0                       
 178    D  G2(12)      9150.0     0.   11437.5 FIXEDHF     0.800  0       0.0  0                       
 179    D  G1(14)        83.8     0.     104.8 FIXEDHF     0.800  0       0.0  0                       
 180    D  G3(14)        79.6     0.      99.5 FIXEDHF     0.800  0       0.0  0                       
 181    D  G1(24)       223.8     0.     279.7 FIXEDHF     0.800  0       0.0  0                       
 182    E  EAV       216374.7     0.  161374.7 FIXEDHF     1.000  0   55000.0  0             d4 4s10p  
 183    E  F2(11)     71664.1     0.   90257.0 FIXEDHF     0.794  0       0.0  0                       
 184    E  F4(11)     46949.6     0.   56362.1 FIXEDHF     0.833  0       0.0  0                       
 185    E  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 186    E  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 187    E  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 188    E  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 189    E  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 190    E  ZETA 1       370.8     0.     370.8 FIXEDHF     1.000  0       0.0  0                       
 191    E  ZETA 4         7.4     0.       7.4 FIXEDHF     1.000  0       0.0  0                       
 192    E  F2(14)       163.0     0.     203.8 FIXEDHF     0.800  0       0.0  0                       
 193    E  G2(12)      9152.0     0.   11440.0 FIXEDHF     0.800  0       0.0  0                       
 194    E  G1(14)        56.8     0.      71.0 FIXEDHF     0.800  0       0.0  0                       
 195    E  G3(14)        54.0     0.      67.5 FIXEDHF     0.800  0       0.0  0                       
 196    E  G1(24)       149.5     0.     186.9 FIXEDHF     0.800  0       0.0  0                       
 197    F  EAV       204071.1     0.  143051.1 FIXEDHF     1.000  0   61020.0  0             d3s2 4p   
 198    F  F2(11)     77188.5     0.   96485.6 FIXEDHF     0.800  0       0.0  0                       
 199    F  F4(11)     48417.8     0.   60522.2 FIXEDHF     0.800  0       0.0  0                       
 200    F  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 201    F  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 202    F  t(d 3)        -6.6     0.       0.0 FIXED       1.000  0       0.0  0                       
 203    F  t1(d 3)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 204    F  t2(d 3)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 205    F  ZETA 1       411.2     0.     411.2 FIXEDHF     1.000  0       0.0  0                       
 206    F  ZETA 3       614.0     0.     614.0 FIXEDHF     1.000  0       0.0  0                       
 207    F  F2(13)     14813.9     0.   18517.4 FIXEDHF     0.800  0       0.0  0                       
 208    F  G1(13)      5303.5     0.    6629.4 FIXEDHF     0.800  0       0.0  0                       
 209    F  G3(13)      4784.6     0.    5980.7 FIXEDHF     0.800  0       0.0  0                       
 210    G  EAV       142725.2    22.   94213.3             1.000  0   48300.0  0             d5 4f     
 211    G  F2(11)     66836.4     0.   83026.6 FIXEDHF     0.805  0       0.0  0                       
 212    G  F4(11)     41037.1     0.   51554.1 FIXEDHF     0.796  0       0.0  0                       
 213    G  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 214    G  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 215    G  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 216    G  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 217    G  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 218    G  ZETA 1       322.6     0.     329.5 FIXEDHF     0.979  0       0.0  0                       
 219    G  ZETA 5         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
 220    G  F2(15)       873.0     0.    1091.2 FIXEDHF     0.800  0       0.0  0                       
 221    G  F4(15)       141.3     0.     176.6 FIXEDHF     0.800  0       0.0  0                       
 222    G  G1(15)       149.1    91.     106.3             0.800  0       0.0  0                       
 223    G  G3(15)        42.3     0.      60.4 FIXEDHF     0.700  0       0.0  0                       
 224    G  G5(15)        20.6     0.      41.3 FIXEDHF     0.500  0       0.0  0                       
 225    H  EAV       152752.9    28.  104310.9             1.000  0   48300.0  0             d5 5f     
 226    H  F2(11)     66839.2     0.   83030.1 FIXEDHF     0.805  0       0.0  0                       
 227    H  F4(11)     41039.0     0.   51556.5 FIXEDHF     0.796  0       0.0  0                       
 228    H  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 229    H  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 230    H  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 231    H  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 232    H  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 233    H  ZETA 1       322.6     0.     329.5 FIXEDHF     0.979  0       0.0  0                       
 234    H  ZETA 5         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
 235    H  F2(15)       461.8     0.     577.3 FIXEDHF     0.800  0       0.0  0                       
 236    H  F4(15)        92.9     0.     116.1 FIXEDHF     0.800  0       0.0  0                       
 237    H  G1(15)        70.2     0.      87.8 FIXEDHF     0.800  0       0.0  0                       
 238    H  G3(15)        40.1     0.      50.1 FIXEDHF     0.800  0       0.0  0                       
 239    H  G5(15)        27.4     0.      34.3 FIXEDHF     0.800  0       0.0  0                       
 240    I  EAV       158167.9    27.  109791.0             1.000  0   48300.0  0             d5 6f     
 241    I  F2(11)     66842.5     0.   83034.2 FIXEDHF     0.805  0       0.0  0                       
 242    I  F4(11)     41041.2     0.   51559.3 FIXEDHF     0.796  0       0.0  0                       
 243    I  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 244    I  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 245    I  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 246    I  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 247    I  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 248    I  ZETA 1       322.6     0.     329.5 FIXEDHF     0.979  0       0.0  0                       
 249    I  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 250    I  F2(15)       273.7     0.     342.1 FIXEDHF     0.800  0       0.0  0                       
 251    I  F4(15)        60.8     0.      76.0 FIXEDHF     0.800  0       0.0  0                       
 252    I  G1(15)        50.3     0.      62.9 FIXEDHF     0.800  0       0.0  0                       
 253    I  G3(15)        28.8     0.      36.0 FIXEDHF     0.800  0       0.0  0                       
 254    I  G5(15)        19.7     0.      24.6 FIXEDHF     0.800  0       0.0  0                       
 255    J  EAV       161419.9    27.  113088.0             1.000  0   48300.0  0             d5 7f     
 256    J  F2(11)     66844.9     0.   83037.1 FIXEDHF     0.805  0       0.0  0                       
 257    J  F4(11)     41042.6     0.   51561.1 FIXEDHF     0.796  0       0.0  0                       
 258    J  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 259    J  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 260    J  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 261    J  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 262    J  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 263    J  ZETA 1       322.6     0.     329.5 FIXEDHF     0.979  0       0.0  0                       
 264    J  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 265    J  F2(15)       175.3     0.     219.1 FIXEDHF     0.800  0       0.0  0                       
 266    J  F4(15)        41.2     0.      51.5 FIXEDHF     0.800  0       0.0  0                       
 267    J  G1(15)        35.8     0.      44.7 FIXEDHF     0.800  0       0.0  0                       
 268    J  G3(15)        20.5     0.      25.6 FIXEDHF     0.800  0       0.0  0                       
 269    J  G5(15)        14.0     0.      17.5 FIXEDHF     0.800  0       0.0  0                       
 270    K  EAV       163519.5    24.  115223.5             1.000  0   48300.0  0             d5 8f     
 271    K  F2(11)     66846.3     0.   83038.9 FIXEDHF     0.805  0       0.0  0                       
 272    K  F4(11)     41043.7     0.   51562.4 FIXEDHF     0.796  0       0.0  0                       
 273    K  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 274    K  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 275    K  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 276    K  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 277    K  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 278    K  ZETA 1       322.7     0.     329.6 FIXEDHF     0.979  0       0.0  0                       
 279    K  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 280    K  F2(15)       118.9     0.     148.6 FIXEDHF     0.800  0       0.0  0                       
 281    K  F4(15)        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0                       
 282    K  G1(15)        25.8     0.      32.3 FIXEDHF     0.800  0       0.0  0                       
 283    K  G3(15)        14.8     0.      18.5 FIXEDHF     0.800  0       0.0  0                       
 284    K  G5(15)        10.2     0.      12.7 FIXEDHF     0.800  0       0.0  0                       
 285    L  EAV       164985.0     0.  116685.0 FIXEDHF     1.000  0   48300.0  0             d5 9f     
 286    L  F2(11)     66847.4     0.   83040.2 FIXEDHF     0.805  0       0.0  0                       
 287    L  F4(11)     41044.3     0.   51563.2 FIXEDHF     0.796  0       0.0  0                       
 288    L  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 289    L  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 290    L  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 291    L  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 292    L  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 293    L  ZETA 1       322.7     0.     329.6 FIXEDHF     0.979  0       0.0  0                       
 294    L  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 295    L  F2(15)        84.3     0.     105.4 FIXEDHF     0.800  0       0.0  0                       
 296    L  F4(15)        21.0     0.      26.3 FIXEDHF     0.800  0       0.0  0                       
 297    L  G1(15)        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0                       
 298    L  G3(15)        11.0     0.      13.7 FIXEDHF     0.800  0       0.0  0                       
 299    L  G5(15)         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0                       
 300    M  EAV       166028.6     0.  117728.6 FIXEDHF     1.000  0   48300.0  0             d5 10f    
 301    M  F2(11)     66848.0     0.   83041.0 FIXEDHF     0.805  0       0.0  0                       
 302    M  F4(11)     41044.8     0.   51563.8 FIXEDHF     0.796  0       0.0  0                       
 303    M  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 304    M  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 305    M  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 306    M  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 307    M  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 308    M  ZETA 1       322.7     0.     329.6 FIXEDHF     0.979  0       0.0  0                       
 309    M  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 310    M  F2(15)        61.9     0.      77.4 FIXEDHF     0.800  0       0.0  0                       
 311    M  F4(15)        15.7     0.      19.6 FIXEDHF     0.800  0       0.0  0                       
 312    M  G1(15)        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0                       
 313    M  G3(15)         8.3     0.      10.4 FIXEDHF     0.800  0       0.0  0                       
 314    M  G5(15)         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0                       
 315    N  EAV       194171.4     0.  139171.4 FIXEDHF     1.000  0   55000.0  0             d4 4s4f   
 316    N  F2(11)     71673.8     0.   90269.3 FIXEDHF     0.794  0       0.0  0                       
 317    N  F4(11)     46956.5     0.   56370.3 FIXEDHF     0.833  0       0.0  0                       
 318    N  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 319    N  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 320    N  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 321    N  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 322    N  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 323    N  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 324    N  ZETA 5         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
 325    N  F2(15)       822.6     0.    1028.2 FIXEDHF     0.800  0       0.0  0                       
 326    N  F4(15)       126.0     0.     157.5 FIXEDHF     0.800  0       0.0  0                       
 327    N  G2(12)      9103.0     0.   11378.7 FIXEDHF     0.800  0       0.0  0                       
 328    N  G1(15)        76.0     0.      95.0 FIXEDHF     0.800  0       0.0  0                       
 329    N  G3(15)        43.1     0.      53.9 FIXEDHF     0.800  0       0.0  0                       
 330    N  G5(15)        29.4     0.      36.8 FIXEDHF     0.800  0       0.0  0                       
 331    N  G3(25)       874.2     0.    1092.7 FIXEDHF     0.800  0       0.0  0                       
 332    O  EAV       204644.1     0.  149644.1 FIXEDHF     1.000  0   55000.0  0             d4 4s5f   
 333    O  F2(11)     71671.7     0.   90266.6 FIXEDHF     0.794  0       0.0  0                       
 334    O  F4(11)     46955.0     0.   56368.5 FIXEDHF     0.833  0       0.0  0                       
 335    O  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 336    O  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 337    O  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 338    O  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 339    O  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 340    O  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 341    O  ZETA 5         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0                       
 342    O  F2(15)       467.4     0.     584.2 FIXEDHF     0.800  0       0.0  0                       
 343    O  F4(15)        92.7     0.     115.9 FIXEDHF     0.800  0       0.0  0                       
 344    O  G2(12)      9121.6     0.   11402.0 FIXEDHF     0.800  0       0.0  0                       
 345    O  G1(15)        70.6     0.      88.3 FIXEDHF     0.800  0       0.0  0                       
 346    O  G3(15)        40.2     0.      50.3 FIXEDHF     0.800  0       0.0  0                       
 347    O  G5(15)        27.5     0.      34.4 FIXEDHF     0.800  0       0.0  0                       
 348    O  G3(25)       670.8     0.     838.5 FIXEDHF     0.800  0       0.0  0                       
 349    P  EAV       210270.3     0.  155270.3 FIXEDHF     1.000  0   55000.0  0             d4 4s6f   
 350    P  F2(11)     71671.5     0.   90266.4 FIXEDHF     0.794  0       0.0  0                       
 351    P  F4(11)     46954.8     0.   56368.3 FIXEDHF     0.833  0       0.0  0                       
 352    P  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 353    P  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 354    P  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 355    P  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 356    P  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 357    P  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 358    P  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 359    P  F2(15)       287.0     0.     358.8 FIXEDHF     0.800  0       0.0  0                       
 360    P  F4(15)        63.8     0.      79.8 FIXEDHF     0.800  0       0.0  0                       
 361    P  G2(12)      9135.8     0.   11419.8 FIXEDHF     0.800  0       0.0  0                       
 362    P  G1(15)        53.3     0.      66.6 FIXEDHF     0.800  0       0.0  0                       
 363    P  G3(15)        30.4     0.      38.0 FIXEDHF     0.800  0       0.0  0                       
 364    P  G5(15)        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0                       
 365    P  G3(25)       458.4     0.     573.0 FIXEDHF     0.800  0       0.0  0                       
 366    Q  EAV       213637.2     0.  158637.2 FIXEDHF     1.000  0   55000.0  0             d4 4s7f   
 367    Q  F2(11)     71672.0     0.   90267.0 FIXEDHF     0.794  0       0.0  0                       
 368    Q  F4(11)     46955.1     0.   56368.7 FIXEDHF     0.833  0       0.0  0                       
 369    Q  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 370    Q  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 371    Q  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 372    Q  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 373    Q  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 374    Q  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 375    Q  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 376    Q  F2(15)       187.0     0.     233.7 FIXEDHF     0.800  0       0.0  0                       
 377    Q  F4(15)        44.2     0.      55.3 FIXEDHF     0.800  0       0.0  0                       
 378    Q  G2(12)      9143.8     0.   11429.7 FIXEDHF     0.800  0       0.0  0                       
 379    Q  G1(15)        38.6     0.      48.3 FIXEDHF     0.800  0       0.0  0                       
 380    Q  G3(15)        22.1     0.      27.6 FIXEDHF     0.800  0       0.0  0                       
 381    Q  G5(15)        15.1     0.      18.9 FIXEDHF     0.800  0       0.0  0                       
 382    Q  G3(25)       314.2     0.     392.7 FIXEDHF     0.800  0       0.0  0                       
 383    R  EAV       215809.4     0.  160809.4 FIXEDHF     1.000  0   55000.0  0             d4 4s8f   
 384    R  F2(11)     71672.5     0.   90267.6 FIXEDHF     0.794  0       0.0  0                       
 385    R  F4(11)     46955.5     0.   56369.2 FIXEDHF     0.833  0       0.0  0                       
 386    R  ALPHA         95.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 387    R  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 388    R  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 389    R  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 390    R  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 391    R  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 392    R  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 393    R  F2(15)       127.7     0.     159.6 FIXEDHF     0.800  0       0.0  0                       
 394    R  F4(15)        31.4     0.      39.2 FIXEDHF     0.800  0       0.0  0                       
 395    R  G2(12)      9148.0     0.   11435.0 FIXEDHF     0.800  0       0.0  0                       
 396    R  G1(15)        28.2     0.      35.3 FIXEDHF     0.800  0       0.0  0                       
 397    R  G3(15)        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0                       
 398    R  G5(15)        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
 399    R  G3(25)       220.8     0.     276.0 FIXEDHF     0.800  0       0.0  0                       
 400    S  EAV       217292.2     0.  162292.2 FIXEDHF     1.000  0   55000.0  0             d4 4s9f   
 401    S  F2(11)     71673.0     0.   90268.2 FIXEDHF     0.794  0       0.0  0                       
 402    S  F4(11)     46955.9     0.   56369.6 FIXEDHF     0.833  0       0.0  0                       
 403    S  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 404    S  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 405    S  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 406    S  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 407    S  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 408    S  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 409    S  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 410    S  F2(15)        90.7     0.     113.4 FIXEDHF     0.800  0       0.0  0                       
 411    S  F4(15)        22.9     0.      28.6 FIXEDHF     0.800  0       0.0  0                       
 412    S  G2(12)      9150.5     0.   11438.1 FIXEDHF     0.800  0       0.0  0                       
 413    S  G1(15)        21.0     0.      26.2 FIXEDHF     0.800  0       0.0  0                       
 414    S  G3(15)        12.0     0.      15.0 FIXEDHF     0.800  0       0.0  0                       
 415    S  G5(15)         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0                       
 416    S  G3(25)       159.7     0.     199.6 FIXEDHF     0.800  0       0.0  0                       
 417    T  EAV       218348.8     0.  163348.8 FIXEDHF     1.000  0   55000.0  0             d4 4s10f  
 418    T  F2(11)     71673.3     0.   90268.7 FIXEDHF     0.794  0       0.0  0                       
 419    T  F4(11)     46956.1     0.   56369.9 FIXEDHF     0.833  0       0.0  0                       
 420    T  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 421    T  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 422    T  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 423    T  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 424    T  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 425    T  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 426    T  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 427    T  F2(15)        66.6     0.      83.2 FIXEDHF     0.800  0       0.0  0                       
 428    T  F4(15)        17.0     0.      21.3 FIXEDHF     0.800  0       0.0  0                       
 429    T  G2(12)      9152.0     0.   11440.0 FIXEDHF     0.800  0       0.0  0                       
 430    T  G1(15)        15.8     0.      19.8 FIXEDHF     0.800  0       0.0  0                       
 431    T  G3(15)         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0                       
 432    T  G5(15)         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0                       
 433    T  G3(25)       118.6     0.     148.3 FIXEDHF     0.800  0       0.0  0                       
 434    U  EAV       158259.9     0.  109959.9 FIXEDHF     1.000  0   48300.0  0             d5 6h     
 435    U  F2(11)     66850.1     0.   83043.6 FIXEDHF     0.805  0       0.0  0                       
 436    U  F4(11)     41046.1     0.   51565.5 FIXEDHF     0.796  0       0.0  0                       
 437    U  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 438    U  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 439    U  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 440    U  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 441    U  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 442    U  ZETA 1       329.6     0.     329.6 FIXEDHF     1.000  0       0.0  0                       
 443    U  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 444    U  F2(16)        63.8     0.      79.8 FIXEDHF     0.800  0       0.0  0                       
 445    U  F4(16)         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
 446    U  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 447    U  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 448    U  G7(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 449    V  EAV       161494.6     0.  113194.6 FIXEDHF     1.000  0   48300.0  0             d5 7h     
 450    V  F2(11)     66850.1     0.   83043.6 FIXEDHF     0.805  0       0.0  0                       
 451    V  F4(11)     41046.1     0.   51565.5 FIXEDHF     0.796  0       0.0  0                       
 452    V  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 453    V  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 454    V  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 455    V  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 456    V  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 457    V  ZETA 1       322.7     0.     329.6 FIXEDHF     0.979  0       0.0  0                       
 458    V  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 459    V  F2(16)        40.2     0.      50.3 FIXEDHF     0.800  0       0.0  0                       
 460    V  F4(16)         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
 461    V  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 462    V  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 463    V  G7(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 464    W  EAV       163587.0    24.  115294.8             1.000  0   48300.0  0             d5 8h     
 465    W  F2(11)     66850.1     0.   83043.6 FIXEDHF     0.805  0       0.0  0                       
 466    W  F4(11)     41046.1     0.   51565.5 FIXEDHF     0.796  0       0.0  0                       
 467    W  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 468    W  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 469    W  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 470    W  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 471    W  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 472    W  ZETA 1       322.7     0.     329.6 FIXEDHF     0.979  0       0.0  0                       
 473    W  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 474    W  F2(16)        27.0     0.      33.7 FIXEDHF     0.800  0       0.0  0                       
 475    W  F4(16)         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
 476    W  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 477    W  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 478    W  G7(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 479    X  EAV       165026.6    24.  116734.8             1.000  0   48300.0  0             d5 9h     
 480    X  F2(11)     66850.1     0.   83043.6 FIXEDHF     0.805  0       0.0  0                       
 481    X  F4(11)     41046.1     0.   51565.5 FIXEDHF     0.796  0       0.0  0                       
 482    X  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 483    X  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 484    X  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 485    X  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 486    X  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 487    X  ZETA 1       322.7     0.     329.6 FIXEDHF     0.979  0       0.0  0                       
 488    X  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 489    X  F2(16)        18.9     0.      23.6 FIXEDHF     0.800  0       0.0  0                       
 490    X  F4(16)         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
 491    X  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 492    X  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 493    X  G7(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 494    Y  EAV       210602.3     0.  155602.3 FIXEDHF     1.000  0   55000.0  0             d4 4s6h   
 495    Y  F2(11)     71674.6     0.   90270.3 FIXEDHF     0.794  0       0.0  0                       
 496    Y  F4(11)     46957.0     0.   56371.0 FIXEDHF     0.833  0       0.0  0                       
 497    Y  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 498    Y  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 499    Y  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 500    Y  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 501    Y  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 502    Y  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 503    Y  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 504    Y  F2(16)        54.4     0.      68.0 FIXEDHF     0.800  0       0.0  0                       
 505    Y  F4(16)         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
 506    Y  G2(12)      9155.8     0.   11444.7 FIXEDHF     0.800  0       0.0  0                       
 507    Y  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 508    Y  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 509    Y  G7(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 510    Y  G5(26)         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
 511    Z  EAV       213837.1     0.  158837.1 FIXEDHF     1.000  0   55000.0  0             d4 4s7h   
 512    Z  F2(11)     71674.6     0.   90270.3 FIXEDHF     0.794  0       0.0  0                       
 513    Z  F4(11)     46957.0     0.   56371.0 FIXEDHF     0.833  0       0.0  0                       
 514    Z  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 515    Z  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 516    Z  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 517    Z  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 518    Z  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 519    Z  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 520    Z  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 521    Z  F2(16)        34.2     0.      42.8 FIXEDHF     0.800  0       0.0  0                       
 522    Z  F4(16)         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
 523    Z  G2(12)      9155.7     0.   11444.6 FIXEDHF     0.800  0       0.0  0                       
 524    Z  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 525    Z  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 526    Z  G7(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 527    Z  G5(26)         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
 528    a  EAV       215939.0     0.  160939.0 FIXEDHF     1.000  0   55000.0  0             d4 4s8h   
 529    a  F2(11)     71674.6     0.   90270.3 FIXEDHF     0.794  0       0.0  0                       
 530    a  F4(11)     46957.0     0.   56371.0 FIXEDHF     0.833  0       0.0  0                       
 531    a  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 532    a  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 533    a  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 534    a  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 535    a  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 536    a  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 537    a  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 538    a  F2(16)        23.0     0.      28.7 FIXEDHF     0.800  0       0.0  0                       
 539    a  F4(16)         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
 540    a  G2(12)      9155.7     0.   11444.6 FIXEDHF     0.800  0       0.0  0                       
 541    a  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 542    a  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 543    a  G7(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 544    a  G5(26)         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
 545    b  EAV       217380.8     0.  162380.8 FIXEDHF     1.000  0   55000.0  0             d4 4s9h   
 546    b  F2(11)     71674.6     0.   90270.3 FIXEDHF     0.794  0       0.0  0                       
 547    b  F4(11)     46957.0     0.   56371.0 FIXEDHF     0.833  0       0.0  0                       
 548    b  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 549    b  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 550    b  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 551    b  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 552    b  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 553    b  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 554    b  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 555    b  F2(16)        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0                       
 556    b  F4(16)         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
 557    b  G2(12)      9155.8     0.   11444.7 FIXEDHF     0.800  0       0.0  0                       
 558    b  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 559    b  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 560    b  G7(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 561    b  G5(26)         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
 562    c  EAV       163597.8     0.  115297.8 FIXEDHF     1.000  0   48300.0  0             d5 8k     
 563    c  F2(11)     66850.1     0.   83043.6 FIXEDHF     0.805  0       0.0  0                       
 564    c  F4(11)     41046.1     0.   51565.5 FIXEDHF     0.796  0       0.0  0                       
 565    c  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 566    c  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 567    c  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 568    c  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 569    c  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 570    c  ZETA 1       322.7     0.     329.6 FIXEDHF     0.979  0       0.0  0                       
 571    c  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 572    c  F2(17)        10.6     0.      13.2 FIXEDHF     0.800  0       0.0  0                       
 573    c  F4(17)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 574    c  G5(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 575    c  G7(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 576    c  G9(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 577    d  EAV       165037.1     0.  116737.1 FIXEDHF     1.000  0   48300.0  0             d5 9k     
 578    d  F2(11)     66850.1     0.   83043.6 FIXEDHF     0.805  0       0.0  0                       
 579    d  F4(11)     41046.1     0.   51565.5 FIXEDHF     0.796  0       0.0  0                       
 580    d  ALPHA         14.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 581    d  BETA        1020.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 582    d  t(d 5)        -6.7     0.       0.0 FIXED       1.000  0       0.0  0                       
 583    d  t1(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 584    d  t2(d 5)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 585    d  ZETA 1       322.7     0.     329.6 FIXEDHF     0.979  0       0.0  0                       
 586    d  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 587    d  F2(17)         7.4     0.       9.3 FIXEDHF     0.800  0       0.0  0                       
 588    d  F4(17)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 589    d  G5(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 590    d  G7(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 591    d  G9(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 592    e  EAV       215949.8     0.  160949.8 FIXEDHF     1.000  0   55000.0  0             d4 4s8k   
 593    e  F2(11)     71674.6     0.   90270.3 FIXEDHF     0.794  0       0.0  0                       
 594    e  F4(11)     46957.0     0.   56371.0 FIXEDHF     0.833  0       0.0  0                       
 595    e  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 596    e  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 597    e  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 598    e  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 599    e  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 600    e  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 601    e  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 602    e  F2(17)         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0                       
 603    e  F4(17)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 604    e  G2(12)      9155.8     0.   11444.7 FIXEDHF     0.800  0       0.0  0                       
 605    e  G5(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 606    e  G7(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 607    e  G9(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 608    e  G7(27)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 609    f  EAV       217389.2     0.  162389.2 FIXEDHF     1.000  0   55000.0  0             d4 4s9k   
 610    f  F2(11)     71674.6     0.   90270.3 FIXEDHF     0.794  0       0.0  0                       
 611    f  F4(11)     46957.0     0.   56371.0 FIXEDHF     0.833  0       0.0  0                       
 612    f  ALPHA         72.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 613    f  BETA           0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 614    f  t(d 4)         0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 615    f  t1(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 616    f  t2(d 4)        0.0     0.       0.0 FIXED       1.000  0       0.0  0                       
 617    f  ZETA 1       370.9     0.     370.9 FIXEDHF     1.000  0       0.0  0                       
 618    f  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 619    f  F2(17)         6.3     0.       7.9 FIXEDHF     0.800  0       0.0  0                       
 620    f  F4(17)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 621    f  G2(12)      9155.8     0.   11444.7 FIXEDHF     0.800  0       0.0  0                       
 622    f  G5(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 623    f  G7(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 624    f  G9(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 625    f  G7(27)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 626    12 0D1314       248.6     0.     310.8 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 5p     
 627    12 2D1314      4929.4     0.    6161.8 FIXEDHF     0.800  0       0.0  0                       
 628    12 1E1314      2384.2     0.    2980.3 FIXEDHF     0.800  0       0.0  0                       
 629    12 3E1314      2074.9     0.    2593.6 FIXEDHF     0.800  0       0.0  0                       
 630    13 0D1314       158.2     0.     197.8 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 6p     
 631    13 2D1314      2999.6     0.    3749.5 FIXEDHF     0.800  0       0.0  0                       
 632    13 1E1314      1509.6     0.    1887.0 FIXEDHF     0.800  0       0.0  0                       
 633    13 3E1314      1327.5     0.    1659.4 FIXEDHF     0.800  0       0.0  0                       
 634    14 0D1314       112.9     0.     141.1 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 7p     
 635    14 2D1314      2098.5     0.    2623.1 FIXEDHF     0.800  0       0.0  0                       
 636    14 1E1314      1074.9     0.    1343.6 FIXEDHF     0.800  0       0.0  0                       
 637    14 3E1314       949.5     0.    1186.9 FIXEDHF     0.800  0       0.0  0                       
 638    15 0D1314        86.0     0.     107.5 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 8p     
 639    15 2D1314      1581.8     0.    1977.3 FIXEDHF     0.800  0       0.0  0                       
 640    15 1E1314       818.2     0.    1022.7 FIXEDHF     0.800  0       0.0  0                       
 641    15 3E1314       724.5     0.     905.6 FIXEDHF     0.800  0       0.0  0                       
 642    16 0D1314        68.5     0.      85.6 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 9p     
 643    16 2D1314      1250.4     0.    1563.0 FIXEDHF     0.800  0       0.0  0                       
 644    16 1E1314       650.6     0.     813.3 FIXEDHF     0.800  0       0.0  0                       
 645    16 3E1314       577.0     0.     721.2 FIXEDHF     0.800  0       0.0  0                       
 646    17 0D1314        56.2     0.      70.3 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 10p    
 647    17 2D1314      1021.8     0.    1277.3 FIXEDHF     0.800  0       0.0  0                       
 648    17 1E1314       533.8     0.     667.3 FIXEDHF     0.800  0       0.0  0                       
 649    17 3E1314       473.8     0.     592.3 FIXEDHF     0.800  0       0.0  0                       
 650    18 2D1112     -1364.0     0.   -1705.0 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s4p   
 651    18 2D1323     -6805.1   427.  -12711.1             0.800  0       0.0  0                       
 652    18 1E1323    -10730.3   226.  -12506.1             0.800  0       0.0  0                       
 653    19 2D1324     -2539.0     0.   -3173.7 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s5p   
 654    19 1E1324     -3670.6     0.   -4588.3 FIXEDHF     0.800  0       0.0  0                       
 655    1A 2D1324     -1377.5     0.   -1721.9 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s6p   
 656    1A 1E1324     -2222.4     0.   -2778.0 FIXEDHF     0.800  0       0.0  0                       
 657    1B 2D1324      -913.5     0.   -1141.9 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s7p   
 658    1B 1E1324     -1553.3     0.   -1941.6 FIXEDHF     0.800  0       0.0  0                       
 659    1C 2D1324      -668.2     0.    -835.2 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s8p   
 660    1C 1E1324     -1170.6     0.   -1463.3 FIXEDHF     0.800  0       0.0  0                       
 661    1D 2D1324      -518.4     0.    -648.0 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s9p   
 662    1D 1E1324      -925.3     0.   -1156.6 FIXEDHF     0.800  0       0.0  0                       
 663    1E 2D1324      -418.4     0.    -523.0 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s10p  
 664    1E 1E1324      -756.2     0.    -945.2 FIXEDHF     0.800  0       0.0  0                       
 665    1F 2D1122     11267.8     0.   14084.8 FIXEDHF     0.800  0       0.0  0  d5 4p     -d3s2 4p   
 666    1G 2D1315      1741.4     0.    2176.8 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 4f     
 667    1G 4D1315       546.5     0.     683.1 FIXEDHF     0.800  0       0.0  0                       
 668    1G 1E1315       459.9     0.     574.9 FIXEDHF     0.800  0       0.0  0                       
 669    1G 3E1315       315.7     0.     394.6 FIXEDHF     0.800  0       0.0  0                       
 670    1H 2D1315      1478.3     0.    1847.9 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 5f     
 671    1H 4D1315       487.0     0.     608.8 FIXEDHF     0.800  0       0.0  0                       
 672    1H 1E1315       413.7     0.     517.1 FIXEDHF     0.800  0       0.0  0                       
 673    1H 3E1315       287.7     0.     359.6 FIXEDHF     0.800  0       0.0  0                       
 674    1I 2D1315      1207.8     0.    1509.7 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 6f     
 675    1I 4D1315       407.8     0.     509.8 FIXEDHF     0.800  0       0.0  0                       
 676    1I 1E1315       348.0     0.     435.0 FIXEDHF     0.800  0       0.0  0                       
 677    1I 3E1315       243.7     0.     304.6 FIXEDHF     0.800  0       0.0  0                       
 678    1J 2D1315       996.5     0.    1245.6 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 7f     
 679    1J 4D1315       341.4     0.     426.8 FIXEDHF     0.800  0       0.0  0                       
 680    1J 1E1315       292.2     0.     365.2 FIXEDHF     0.800  0       0.0  0                       
 681    1J 3E1315       205.4     0.     256.7 FIXEDHF     0.800  0       0.0  0                       
 682    1K 2D1315       835.8     0.    1044.7 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 8f     
 683    1K 4D1315       289.0     0.     361.3 FIXEDHF     0.800  0       0.0  0                       
 684    1K 1E1315       247.8     0.     309.7 FIXEDHF     0.800  0       0.0  0                       
 685    1K 3E1315       174.6     0.     218.3 FIXEDHF     0.800  0       0.0  0                       
 686    1L 2D1315       712.2     0.     890.2 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 9f     
 687    1L 4D1315       247.9     0.     309.9 FIXEDHF     0.800  0       0.0  0                       
 688    1L 1E1315       212.8     0.     266.0 FIXEDHF     0.800  0       0.0  0                       
 689    1L 3E1315       150.2     0.     187.8 FIXEDHF     0.800  0       0.0  0                       
 690    1M 2D1315       615.4     0.     769.2 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 10f    
 691    1M 4D1315       215.2     0.     269.0 FIXEDHF     0.800  0       0.0  0                       
 692    1M 1E1315       184.9     0.     231.1 FIXEDHF     0.800  0       0.0  0                       
 693    1M 3E1315       130.7     0.     163.4 FIXEDHF     0.800  0       0.0  0                       
 694    1N 2D1325     -2416.6     0.   -3020.8 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s4f   
 695    1N 1E1325     -1938.3     0.   -2422.9 FIXEDHF     0.800  0       0.0  0                       
 696    1O 2D1325     -2089.4     0.   -2611.7 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s5f   
 697    1O 1E1325     -1818.8     0.   -2273.5 FIXEDHF     0.800  0       0.0  0                       
 698    1P 2D1325     -1713.9     0.   -2142.4 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s6f   
 699    1P 1E1325     -1556.6     0.   -1945.8 FIXEDHF     0.800  0       0.0  0                       
 700    1Q 2D1325     -1411.6     0.   -1764.5 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s7f   
 701    1Q 1E1325     -1315.0     0.   -1643.8 FIXEDHF     0.800  0       0.0  0                       
 702    1R 2D1325     -1179.0     0.   -1473.8 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s8f   
 703    1R 1E1325     -1116.8     0.   -1396.0 FIXEDHF     0.800  0       0.0  0                       
 704    1S 2D1325      -999.8     0.   -1249.8 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s9f   
 705    1S 1E1325      -958.1     0.   -1197.6 FIXEDHF     0.800  0       0.0  0                       
 706    1T 2D1325      -859.9     0.   -1074.9 FIXEDHF     0.800  0       0.0  0  d5 4p     -d4 4s10f  
 707    1T 1E1325      -830.9     0.   -1038.6 FIXEDHF     0.800  0       0.0  0                       
 708    1U 4D1316         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 6h     
 709    1U 3E1316         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0                       
 710    1V 4D1316         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 7h     
 711    1V 3E1316         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
 712    1W 4D1316         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 8h     
 713    1W 3E1316         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0                       
 714    1X 4D1316         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0  d5 4p     -d5 9h     
 715    1X 3E1316         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0                       
 716    23 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 6p     
 717    23 2D1414      1882.1     0.    2352.6 FIXEDHF     0.800  0       0.0  0                       
 718    23 1E1414       757.2     0.     946.5 FIXEDHF     0.800  0       0.0  0                       
 719    23 3E1414       687.4     0.     859.2 FIXEDHF     0.800  0       0.0  0                       
 720    24 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 7p     
 721    24 2D1414      1310.3     0.    1637.9 FIXEDHF     0.800  0       0.0  0                       
 722    24 1E1414       541.8     0.     677.2 FIXEDHF     0.800  0       0.0  0                       
 723    24 3E1414       493.8     0.     617.3 FIXEDHF     0.800  0       0.0  0                       
 724    25 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 8p     
 725    25 2D1414       986.2     0.    1232.7 FIXEDHF     0.800  0       0.0  0                       
 726    25 1E1414       413.4     0.     516.7 FIXEDHF     0.800  0       0.0  0                       
 727    25 3E1414       377.7     0.     472.1 FIXEDHF     0.800  0       0.0  0                       
 728    26 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 9p     
 729    26 2D1414       779.0     0.     973.8 FIXEDHF     0.800  0       0.0  0                       
 730    26 1E1414       329.2     0.     411.5 FIXEDHF     0.800  0       0.0  0                       
 731    26 3E1414       301.2     0.     376.5 FIXEDHF     0.800  0       0.0  0                       
 732    27 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 10p    
 733    27 2D1414       636.5     0.     795.6 FIXEDHF     0.800  0       0.0  0                       
 734    27 1E1414       270.4     0.     338.0 FIXEDHF     0.800  0       0.0  0                       
 735    27 3E1414       247.6     0.     309.5 FIXEDHF     0.800  0       0.0  0                       
 736    28 2D1423     -3429.1     0.   -4286.4 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s4p   
 737    28 1E1423     -3436.6     0.   -4295.8 FIXEDHF     0.800  0       0.0  0                       
 738    29 2D1112     -1172.7     0.   -1465.9 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s5p   
 739    29 2D1424     -2392.5     0.   -2990.6 FIXEDHF     0.800  0       0.0  0                       
 740    29 1E1424     -1434.0     0.   -1792.5 FIXEDHF     0.800  0       0.0  0                       
 741    2A 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s6p   
 742    2A 2D1424     -1189.3     0.   -1486.6 FIXEDHF     0.800  0       0.0  0                       
 743    2A 1E1424      -891.5     0.   -1114.4 FIXEDHF     0.800  0       0.0  0                       
 744    2B 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s7p   
 745    2B 2D1424      -780.2     0.    -975.3 FIXEDHF     0.800  0       0.0  0                       
 746    2B 1E1424      -630.1     0.    -787.6 FIXEDHF     0.800  0       0.0  0                       
 747    2C 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s8p   
 748    2C 2D1424      -569.0     0.    -711.2 FIXEDHF     0.800  0       0.0  0                       
 749    2C 1E1424      -477.6     0.    -597.0 FIXEDHF     0.800  0       0.0  0                       
 750    2D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s9p   
 751    2D 2D1424      -440.9     0.    -551.1 FIXEDHF     0.800  0       0.0  0                       
 752    2D 1E1424      -378.9     0.    -473.6 FIXEDHF     0.800  0       0.0  0                       
 753    2E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s10p  
 754    2E 2D1424      -355.6     0.    -444.5 FIXEDHF     0.800  0       0.0  0                       
 755    2E 1E1424      -310.3     0.    -387.9 FIXEDHF     0.800  0       0.0  0                       
 756    2G 2D1415      -114.8     0.    -143.5 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 4f     
 757    2G 4D1415       143.7     0.     179.6 FIXEDHF     0.800  0       0.0  0                       
 758    2G 1E1415       195.4     0.     244.2 FIXEDHF     0.800  0       0.0  0                       
 759    2G 3E1415       139.1     0.     173.9 FIXEDHF     0.800  0       0.0  0                       
 760    2H 2D1415       156.2     0.     195.3 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 5f     
 761    2H 4D1415       150.2     0.     187.8 FIXEDHF     0.800  0       0.0  0                       
 762    2H 1E1415       177.7     0.     222.1 FIXEDHF     0.800  0       0.0  0                       
 763    2H 3E1415       128.4     0.     160.5 FIXEDHF     0.800  0       0.0  0                       
 764    2I 2D1415       205.0     0.     256.3 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 6f     
 765    2I 4D1415       134.2     0.     167.7 FIXEDHF     0.800  0       0.0  0                       
 766    2I 1E1415       150.3     0.     187.9 FIXEDHF     0.800  0       0.0  0                       
 767    2I 3E1415       109.4     0.     136.8 FIXEDHF     0.800  0       0.0  0                       
 768    2J 2D1415       201.8     0.     252.3 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 7f     
 769    2J 4D1415       116.2     0.     145.3 FIXEDHF     0.800  0       0.0  0                       
 770    2J 1E1415       126.6     0.     158.3 FIXEDHF     0.800  0       0.0  0                       
 771    2J 3E1415        92.6     0.     115.8 FIXEDHF     0.800  0       0.0  0                       
 772    2K 2D1415       185.6     0.     232.0 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 8f     
 773    2K 4D1415       100.5     0.     125.6 FIXEDHF     0.800  0       0.0  0                       
 774    2K 1E1415       107.6     0.     134.5 FIXEDHF     0.800  0       0.0  0                       
 775    2K 3E1415        79.0     0.      98.7 FIXEDHF     0.800  0       0.0  0                       
 776    2L 2D1415       167.3     0.     209.1 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 9f     
 777    2L 4D1415        87.4     0.     109.2 FIXEDHF     0.800  0       0.0  0                       
 778    2L 1E1415        92.6     0.     115.7 FIXEDHF     0.800  0       0.0  0                       
 779    2L 3E1415        68.1     0.      85.1 FIXEDHF     0.800  0       0.0  0                       
 780    2M 2D1415       150.1     0.     187.6 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 10f    
 781    2M 4D1415        76.6     0.      95.7 FIXEDHF     0.800  0       0.0  0                       
 782    2M 1E1415        80.6     0.     100.7 FIXEDHF     0.800  0       0.0  0                       
 783    2M 3E1415        59.3     0.      74.1 FIXEDHF     0.800  0       0.0  0                       
 784    2N 2D1425       244.2     0.     305.3 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s4f   
 785    2N 1E1425      -681.3     0.    -851.6 FIXEDHF     0.800  0       0.0  0                       
 786    2O 2D1425      -182.6     0.    -228.2 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s5f   
 787    2O 1E1425      -653.1     0.    -816.4 FIXEDHF     0.800  0       0.0  0                       
 788    2P 2D1425      -272.6     0.    -340.8 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s6f   
 789    2P 1E1425      -565.2     0.    -706.5 FIXEDHF     0.800  0       0.0  0                       
 790    2Q 2D1425      -277.0     0.    -346.3 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s7f   
 791    2Q 1E1425      -480.6     0.    -600.7 FIXEDHF     0.800  0       0.0  0                       
 792    2R 2D1425      -257.8     0.    -322.3 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s8f   
 793    2R 1E1425      -409.8     0.    -512.3 FIXEDHF     0.800  0       0.0  0                       
 794    2S 2D1425      -233.4     0.    -291.8 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s9f   
 795    2S 1E1425      -352.6     0.    -440.7 FIXEDHF     0.800  0       0.0  0                       
 796    2T 2D1425      -209.8     0.    -262.2 FIXEDHF     0.800  0       0.0  0  d5 5p     -d4 4s10f  
 797    2T 1E1425      -306.3     0.    -382.9 FIXEDHF     0.800  0       0.0  0                       
 798    2U 4D1416        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 6h     
 799    2U 3E1416         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
 800    2V 4D1416        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 7h     
 801    2V 3E1416         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
 802    2W 4D1416        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 8h     
 803    2W 3E1416         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
 804    2X 4D1416        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0  d5 5p     -d5 9h     
 805    2X 3E1416         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
 806    34 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 7p     
 807    34 2D1414       909.0     0.    1136.2 FIXEDHF     0.800  0       0.0  0                       
 808    34 1E1414       348.2     0.     435.2 FIXEDHF     0.800  0       0.0  0                       
 809    34 3E1414       320.4     0.     400.5 FIXEDHF     0.800  0       0.0  0                       
 810    35 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 8p     
 811    35 2D1414       682.6     0.     853.2 FIXEDHF     0.800  0       0.0  0                       
 812    35 1E1414       265.8     0.     332.3 FIXEDHF     0.800  0       0.0  0                       
 813    35 3E1414       245.2     0.     306.5 FIXEDHF     0.800  0       0.0  0                       
 814    36 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 9p     
 815    36 2D1414       538.8     0.     673.5 FIXEDHF     0.800  0       0.0  0                       
 816    36 1E1414       211.8     0.     264.8 FIXEDHF     0.800  0       0.0  0                       
 817    36 3E1414       195.7     0.     244.6 FIXEDHF     0.800  0       0.0  0                       
 818    37 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 10p    
 819    37 2D1414       440.0     0.     550.0 FIXEDHF     0.800  0       0.0  0                       
 820    37 1E1414       174.0     0.     217.5 FIXEDHF     0.800  0       0.0  0                       
 821    37 3E1414       160.9     0.     201.1 FIXEDHF     0.800  0       0.0  0                       
 822    38 2D1423     -1933.1     0.   -2416.4 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s4p   
 823    38 1E1423     -1940.8     0.   -2426.0 FIXEDHF     0.800  0       0.0  0                       
 824    39 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s5p   
 825    39 2D1424     -1327.3     0.   -1659.1 FIXEDHF     0.800  0       0.0  0                       
 826    39 1E1424      -840.8     0.   -1051.0 FIXEDHF     0.800  0       0.0  0                       
 827    3A 2D1112     -1125.1     0.   -1406.4 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s6p   
 828    3A 2D1424      -956.2     0.   -1195.2 FIXEDHF     0.800  0       0.0  0                       
 829    3A 1E1424      -526.8     0.    -658.5 FIXEDHF     0.800  0       0.0  0                       
 830    3B 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s7p   
 831    3B 2D1424      -600.6     0.    -750.8 FIXEDHF     0.800  0       0.0  0                       
 832    3B 1E1424      -373.6     0.    -467.0 FIXEDHF     0.800  0       0.0  0                       
 833    3C 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s8p   
 834    3C 2D1424      -435.0     0.    -543.7 FIXEDHF     0.800  0       0.0  0                       
 835    3C 1E1424      -283.7     0.    -354.6 FIXEDHF     0.800  0       0.0  0                       
 836    3D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s9p   
 837    3D 2D1424      -336.2     0.    -420.3 FIXEDHF     0.800  0       0.0  0                       
 838    3D 1E1424      -225.3     0.    -281.6 FIXEDHF     0.800  0       0.0  0                       
 839    3E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s10p  
 840    3E 2D1424      -270.9     0.    -338.6 FIXEDHF     0.800  0       0.0  0                       
 841    3E 1E1424      -184.6     0.    -230.8 FIXEDHF     0.800  0       0.0  0                       
 842    3G 2D1415        31.8     0.      39.7 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 4f     
 843    3G 4D1415        83.3     0.     104.1 FIXEDHF     0.800  0       0.0  0                       
 844    3G 1E1415       119.8     0.     149.7 FIXEDHF     0.800  0       0.0  0                       
 845    3G 3E1415        86.0     0.     107.5 FIXEDHF     0.800  0       0.0  0                       
 846    3H 2D1415       -10.3     0.     -12.9 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 5f     
 847    3H 4D1415        82.9     0.     103.6 FIXEDHF     0.800  0       0.0  0                       
 848    3H 1E1415       109.2     0.     136.5 FIXEDHF     0.800  0       0.0  0                       
 849    3H 3E1415        79.7     0.      99.6 FIXEDHF     0.800  0       0.0  0                       
 850    3I 2D1415        39.2     0.      49.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 6f     
 851    3I 4D1415        74.3     0.      92.9 FIXEDHF     0.800  0       0.0  0                       
 852    3I 1E1415        92.6     0.     115.7 FIXEDHF     0.800  0       0.0  0                       
 853    3I 3E1415        68.1     0.      85.1 FIXEDHF     0.800  0       0.0  0                       
 854    3J 2D1415        55.5     0.      69.4 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 7f     
 855    3J 4D1415        64.7     0.      80.9 FIXEDHF     0.800  0       0.0  0                       
 856    3J 1E1415        78.0     0.      97.5 FIXEDHF     0.800  0       0.0  0                       
 857    3J 3E1415        57.7     0.      72.1 FIXEDHF     0.800  0       0.0  0                       
 858    3K 2D1415        58.8     0.      73.5 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 8f     
 859    3K 4D1415        56.2     0.      70.2 FIXEDHF     0.800  0       0.0  0                       
 860    3K 1E1415        66.3     0.      82.9 FIXEDHF     0.800  0       0.0  0                       
 861    3K 3E1415        49.2     0.      61.5 FIXEDHF     0.800  0       0.0  0                       
 862    3L 2D1415        57.1     0.      71.4 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 9f     
 863    3L 4D1415        49.0     0.      61.3 FIXEDHF     0.800  0       0.0  0                       
 864    3L 1E1415        57.1     0.      71.4 FIXEDHF     0.800  0       0.0  0                       
 865    3L 3E1415        42.4     0.      53.0 FIXEDHF     0.800  0       0.0  0                       
 866    3M 2D1415        53.7     0.      67.1 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 10f    
 867    3M 4D1415        43.0     0.      53.8 FIXEDHF     0.800  0       0.0  0                       
 868    3M 1E1415        49.7     0.      62.1 FIXEDHF     0.800  0       0.0  0                       
 869    3M 3E1415        37.0     0.      46.2 FIXEDHF     0.800  0       0.0  0                       
 870    3N 2D1425        16.8     0.      21.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s4f   
 871    3N 1E1425      -390.6     0.    -488.2 FIXEDHF     0.800  0       0.0  0                       
 872    3O 2D1425        56.7     0.      70.9 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s5f   
 873    3O 1E1425      -376.6     0.    -470.7 FIXEDHF     0.800  0       0.0  0                       
 874    3P 2D1425       -31.8     0.     -39.8 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s6f   
 875    3P 1E1425      -326.9     0.    -408.6 FIXEDHF     0.800  0       0.0  0                       
 876    3Q 2D1425       -64.2     0.     -80.3 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s7f   
 877    3Q 1E1425      -278.5     0.    -348.1 FIXEDHF     0.800  0       0.0  0                       
 878    3R 2D1425       -73.7     0.     -92.1 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s8f   
 879    3R 1E1425      -237.7     0.    -297.1 FIXEDHF     0.800  0       0.0  0                       
 880    3S 2D1425       -73.9     0.     -92.4 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s9f   
 881    3S 1E1425      -204.6     0.    -255.8 FIXEDHF     0.800  0       0.0  0                       
 882    3T 2D1425       -70.6     0.     -88.3 FIXEDHF     0.800  0       0.0  0  d5 6p     -d4 4s10f  
 883    3T 1E1425      -177.9     0.    -222.4 FIXEDHF     0.800  0       0.0  0                       
 884    3U 4D1416         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 6h     
 885    3U 3E1416         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
 886    3V 4D1416        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 7h     
 887    3V 3E1416         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
 888    3W 4D1416        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 8h     
 889    3W 3E1416         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
 890    3X 4D1416        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d5 6p     -d5 9h     
 891    3X 3E1416         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
 892    45 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 8p     
 893    45 2D1414       507.0     0.     633.8 FIXEDHF     0.800  0       0.0  0                       
 894    45 1E1414       190.6     0.     238.3 FIXEDHF     0.800  0       0.0  0                       
 895    45 3E1414       176.6     0.     220.7 FIXEDHF     0.800  0       0.0  0                       
 896    46 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 9p     
 897    46 2D1414       399.8     0.     499.7 FIXEDHF     0.800  0       0.0  0                       
 898    46 1E1414       151.9     0.     189.9 FIXEDHF     0.800  0       0.0  0                       
 899    46 3E1414       141.0     0.     176.2 FIXEDHF     0.800  0       0.0  0                       
 900    47 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 10p    
 901    47 2D1414       326.3     0.     407.9 FIXEDHF     0.800  0       0.0  0                       
 902    47 1E1414       124.8     0.     156.0 FIXEDHF     0.800  0       0.0  0                       
 903    47 3E1414       115.9     0.     144.9 FIXEDHF     0.800  0       0.0  0                       
 904    48 2D1423     -1301.3     0.   -1626.6 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s4p   
 905    48 1E1423     -1307.4     0.   -1634.2 FIXEDHF     0.800  0       0.0  0                       
 906    49 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s5p   
 907    49 2D1424      -898.6     0.   -1123.2 FIXEDHF     0.800  0       0.0  0                       
 908    49 1E1424      -576.3     0.    -720.4 FIXEDHF     0.800  0       0.0  0                       
 909    4A 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s6p   
 910    4A 2D1424      -639.0     0.    -798.7 FIXEDHF     0.800  0       0.0  0                       
 911    4A 1E1424      -362.4     0.    -453.0 FIXEDHF     0.800  0       0.0  0                       
 912    4B 2D1112     -1108.3     0.   -1385.4 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s7p   
 913    4B 2D1424      -481.4     0.    -601.7 FIXEDHF     0.800  0       0.0  0                       
 914    4B 1E1424      -257.4     0.    -321.8 FIXEDHF     0.800  0       0.0  0                       
 915    4C 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s8p   
 916    4C 2D1424      -340.2     0.    -425.2 FIXEDHF     0.800  0       0.0  0                       
 917    4C 1E1424      -195.7     0.    -244.6 FIXEDHF     0.800  0       0.0  0                       
 918    4D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s9p   
 919    4D 2D1424      -261.8     0.    -327.2 FIXEDHF     0.800  0       0.0  0                       
 920    4D 1E1424      -155.4     0.    -194.3 FIXEDHF     0.800  0       0.0  0                       
 921    4E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s10p  
 922    4E 2D1424      -210.6     0.    -263.2 FIXEDHF     0.800  0       0.0  0                       
 923    4E 1E1424      -127.4     0.    -159.3 FIXEDHF     0.800  0       0.0  0                       
 924    4G 2D1415        27.3     0.      34.1 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 4f     
 925    4G 4D1415        56.7     0.      70.9 FIXEDHF     0.800  0       0.0  0                       
 926    4G 1E1415        84.1     0.     105.1 FIXEDHF     0.800  0       0.0  0                       
 927    4G 3E1415        60.6     0.      75.7 FIXEDHF     0.800  0       0.0  0                       
 928    4H 2D1415        28.2     0.      35.2 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 5f     
 929    4H 4D1415        56.5     0.      70.6 FIXEDHF     0.800  0       0.0  0                       
 930    4H 1E1415        76.7     0.      95.9 FIXEDHF     0.800  0       0.0  0                       
 931    4H 3E1415        56.2     0.      70.2 FIXEDHF     0.800  0       0.0  0                       
 932    4I 2D1415         9.8     0.      12.2 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 6f     
 933    4I 4D1415        50.2     0.      62.7 FIXEDHF     0.800  0       0.0  0                       
 934    4I 1E1415        65.0     0.      81.3 FIXEDHF     0.800  0       0.0  0                       
 935    4I 3E1415        48.0     0.      60.0 FIXEDHF     0.800  0       0.0  0                       
 936    4J 2D1415        20.3     0.      25.4 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 7f     
 937    4J 4D1415        43.7     0.      54.6 FIXEDHF     0.800  0       0.0  0                       
 938    4J 1E1415        54.9     0.      68.6 FIXEDHF     0.800  0       0.0  0                       
 939    4J 3E1415        40.7     0.      50.9 FIXEDHF     0.800  0       0.0  0                       
 940    4K 2D1415        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 8f     
 941    4K 4D1415        37.9     0.      47.4 FIXEDHF     0.800  0       0.0  0                       
 942    4K 1E1415        46.6     0.      58.3 FIXEDHF     0.800  0       0.0  0                       
 943    4K 3E1415        34.7     0.      43.4 FIXEDHF     0.800  0       0.0  0                       
 944    4L 2D1415        25.7     0.      32.1 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 9f     
 945    4L 4D1415        33.0     0.      41.3 FIXEDHF     0.800  0       0.0  0                       
 946    4L 1E1415        40.2     0.      50.2 FIXEDHF     0.800  0       0.0  0                       
 947    4L 3E1415        30.0     0.      37.5 FIXEDHF     0.800  0       0.0  0                       
 948    4M 2D1415        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 10f    
 949    4M 4D1415        29.0     0.      36.3 FIXEDHF     0.800  0       0.0  0                       
 950    4M 1E1415        35.0     0.      43.7 FIXEDHF     0.800  0       0.0  0                       
 951    4M 3E1415        26.2     0.      32.7 FIXEDHF     0.800  0       0.0  0                       
 952    4N 2D1425         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s4f   
 953    4N 1E1425      -265.4     0.    -331.7 FIXEDHF     0.800  0       0.0  0                       
 954    4O 2D1425        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s5f   
 955    4O 1E1425      -256.5     0.    -320.6 FIXEDHF     0.800  0       0.0  0                       
 956    4P 2D1425        10.6     0.      13.3 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s6f   
 957    4P 1E1425      -223.0     0.    -278.7 FIXEDHF     0.800  0       0.0  0                       
 958    4Q 2D1425       -12.9     0.     -16.1 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s7f   
 959    4Q 1E1425      -190.1     0.    -237.6 FIXEDHF     0.800  0       0.0  0                       
 960    4R 2D1425       -23.8     0.     -29.8 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s8f   
 961    4R 1E1425      -162.3     0.    -202.9 FIXEDHF     0.800  0       0.0  0                       
 962    4S 2D1425       -28.1     0.     -35.1 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s9f   
 963    4S 1E1425      -139.8     0.    -174.8 FIXEDHF     0.800  0       0.0  0                       
 964    4T 2D1425       -29.0     0.     -36.3 FIXEDHF     0.800  0       0.0  0  d5 7p     -d4 4s10f  
 965    4T 1E1425      -121.6     0.    -152.0 FIXEDHF     0.800  0       0.0  0                       
 966    4U 4D1416        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 6h     
 967    4U 3E1416         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
 968    4V 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 7h     
 969    4V 3E1416         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
 970    4W 4D1416        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 8h     
 971    4W 3E1416         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
 972    4X 4D1416        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d5 7p     -d5 9h     
 973    4X 3E1416         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
 974    56 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 9p     
 975    56 2D1414       311.4     0.     389.3 FIXEDHF     0.800  0       0.0  0                       
 976    56 1E1414       116.1     0.     145.1 FIXEDHF     0.800  0       0.0  0                       
 977    56 3E1414       107.9     0.     134.9 FIXEDHF     0.800  0       0.0  0                       
 978    57 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 10p    
 979    57 2D1414       254.0     0.     317.5 FIXEDHF     0.800  0       0.0  0                       
 980    57 1E1414        95.4     0.     119.2 FIXEDHF     0.800  0       0.0  0                       
 981    57 3E1414        88.8     0.     111.0 FIXEDHF     0.800  0       0.0  0                       
 982    58 2D1423      -959.3     0.   -1199.1 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s4p   
 983    58 1E1423      -964.2     0.   -1205.2 FIXEDHF     0.800  0       0.0  0                       
 984    59 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s5p   
 985    59 2D1424      -665.8     0.    -832.2 FIXEDHF     0.800  0       0.0  0                       
 986    59 1E1424      -429.2     0.    -536.5 FIXEDHF     0.800  0       0.0  0                       
 987    5A 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s6p   
 988    5A 2D1424      -473.4     0.    -591.8 FIXEDHF     0.800  0       0.0  0                       
 989    5A 1E1424      -270.5     0.    -338.1 FIXEDHF     0.800  0       0.0  0                       
 990    5B 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s7p   
 991    5B 2D1424      -354.0     0.    -442.5 FIXEDHF     0.800  0       0.0  0                       
 992    5B 1E1424      -192.3     0.    -240.4 FIXEDHF     0.800  0       0.0  0                       
 993    5C 2D1112     -1100.7     0.   -1375.9 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s8p   
 994    5C 2D1424      -277.2     0.    -346.5 FIXEDHF     0.800  0       0.0  0                       
 995    5C 1E1424      -146.2     0.    -182.8 FIXEDHF     0.800  0       0.0  0                       
 996    5D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s9p   
 997    5D 2D1424      -210.2     0.    -262.7 FIXEDHF     0.800  0       0.0  0                       
 998    5D 1E1424      -116.2     0.    -145.3 FIXEDHF     0.800  0       0.0  0                       
 999    5E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s10p  
1000    5E 2D1424      -168.6     0.    -210.7 FIXEDHF     0.800  0       0.0  0                       
1001    5E 1E1424       -95.3     0.    -119.1 FIXEDHF     0.800  0       0.0  0                       
1002    5G 2D1415        21.8     0.      27.3 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 4f     
1003    5G 4D1415        42.1     0.      52.6 FIXEDHF     0.800  0       0.0  0                       
1004    5G 1E1415        63.4     0.      79.3 FIXEDHF     0.800  0       0.0  0                       
1005    5G 3E1415        45.8     0.      57.3 FIXEDHF     0.800  0       0.0  0                       
1006    5H 2D1415        23.9     0.      29.9 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 5f     
1007    5H 4D1415        41.9     0.      52.4 FIXEDHF     0.800  0       0.0  0                       
1008    5H 1E1415        58.0     0.      72.5 FIXEDHF     0.800  0       0.0  0                       
1009    5H 3E1415        42.6     0.      53.2 FIXEDHF     0.800  0       0.0  0                       
1010    5I 2D1415        21.1     0.      26.4 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 6f     
1011    5I 4D1415        37.3     0.      46.6 FIXEDHF     0.800  0       0.0  0                       
1012    5I 1E1415        49.2     0.      61.5 FIXEDHF     0.800  0       0.0  0                       
1013    5I 3E1415        36.4     0.      45.5 FIXEDHF     0.800  0       0.0  0                       
1014    5J 2D1415        11.9     0.      14.9 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 7f     
1015    5J 4D1415        32.3     0.      40.4 FIXEDHF     0.800  0       0.0  0                       
1016    5J 1E1415        41.5     0.      51.9 FIXEDHF     0.800  0       0.0  0                       
1017    5J 3E1415        30.9     0.      38.6 FIXEDHF     0.800  0       0.0  0                       
1018    5K 2D1415        13.8     0.      17.3 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 8f     
1019    5K 4D1415        28.1     0.      35.1 FIXEDHF     0.800  0       0.0  0                       
1020    5K 1E1415        35.3     0.      44.1 FIXEDHF     0.800  0       0.0  0                       
1021    5K 3E1415        26.3     0.      32.9 FIXEDHF     0.800  0       0.0  0                       
1022    5L 2D1415        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 9f     
1023    5L 4D1415        24.5     0.      30.6 FIXEDHF     0.800  0       0.0  0                       
1024    5L 1E1415        30.4     0.      38.0 FIXEDHF     0.800  0       0.0  0                       
1025    5L 3E1415        22.7     0.      28.4 FIXEDHF     0.800  0       0.0  0                       
1026    5M 2D1415        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 10f    
1027    5M 4D1415        21.5     0.      26.9 FIXEDHF     0.800  0       0.0  0                       
1028    5M 1E1415        26.5     0.      33.1 FIXEDHF     0.800  0       0.0  0                       
1029    5M 3E1415        19.8     0.      24.8 FIXEDHF     0.800  0       0.0  0                       
1030    5N 2D1425         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s4f   
1031    5N 1E1425      -196.7     0.    -245.9 FIXEDHF     0.800  0       0.0  0                       
1032    5O 2D1425        -6.0     0.      -7.5 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s5f   
1033    5O 1E1425      -190.4     0.    -238.0 FIXEDHF     0.800  0       0.0  0                       
1034    5P 2D1425        -8.9     0.     -11.1 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s6f   
1035    5P 1E1425      -165.7     0.    -207.1 FIXEDHF     0.800  0       0.0  0                       
1036    5Q 2D1425        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s7f   
1037    5Q 1E1425      -141.3     0.    -176.6 FIXEDHF     0.800  0       0.0  0                       
1038    5R 2D1425        -8.6     0.     -10.8 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s8f   
1039    5R 1E1425      -120.7     0.    -150.9 FIXEDHF     0.800  0       0.0  0                       
1040    5S 2D1425       -12.4     0.     -15.5 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s9f   
1041    5S 1E1425      -104.0     0.    -130.0 FIXEDHF     0.800  0       0.0  0                       
1042    5T 2D1425       -14.1     0.     -17.6 FIXEDHF     0.800  0       0.0  0  d5 8p     -d4 4s10f  
1043    5T 1E1425       -90.5     0.    -113.1 FIXEDHF     0.800  0       0.0  0                       
1044    5U 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 6h     
1045    5U 3E1416         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1046    5V 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 7h     
1047    5V 3E1416         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1048    5W 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 8h     
1049    5W 3E1416         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1050    5X 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 8p     -d5 9h     
1051    5X 3E1416         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1052    67 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 10p    
1053    67 2D1414       204.9     0.     256.1 FIXEDHF     0.800  0       0.0  0                       
1054    67 1E1414        76.0     0.      95.0 FIXEDHF     0.800  0       0.0  0                       
1055    67 3E1414        70.9     0.      88.6 FIXEDHF     0.800  0       0.0  0                       
1056    68 2D1423      -747.6     0.    -934.5 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s4p   
1057    68 1E1423      -751.6     0.    -939.5 FIXEDHF     0.800  0       0.0  0                       
1058    69 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s5p   
1059    69 2D1424      -520.8     0.    -651.0 FIXEDHF     0.800  0       0.0  0                       
1060    69 1E1424      -336.7     0.    -420.9 FIXEDHF     0.800  0       0.0  0                       
1061    6A 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s6p   
1062    6A 2D1424      -370.7     0.    -463.4 FIXEDHF     0.800  0       0.0  0                       
1063    6A 1E1424      -212.4     0.    -265.5 FIXEDHF     0.800  0       0.0  0                       
1064    6B 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s7p   
1065    6B 2D1424      -277.2     0.    -346.5 FIXEDHF     0.800  0       0.0  0                       
1066    6B 1E1424      -151.1     0.    -188.9 FIXEDHF     0.800  0       0.0  0                       
1067    6C 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s8p   
1068    6C 2D1424      -216.1     0.    -270.1 FIXEDHF     0.800  0       0.0  0                       
1069    6C 1E1424      -115.0     0.    -143.7 FIXEDHF     0.800  0       0.0  0                       
1070    6D 2D1112     -1096.8     0.   -1371.0 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s9p   
1071    6D 2D1424      -174.6     0.    -218.2 FIXEDHF     0.800  0       0.0  0                       
1072    6D 1E1424       -91.4     0.    -114.2 FIXEDHF     0.800  0       0.0  0                       
1073    6E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s10p  
1074    6E 2D1424      -138.6     0.    -173.3 FIXEDHF     0.800  0       0.0  0                       
1075    6E 1E1424       -75.0     0.     -93.7 FIXEDHF     0.800  0       0.0  0                       
1076    6G 2D1415        17.7     0.      22.1 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 4f     
1077    6G 4D1415        33.0     0.      41.2 FIXEDHF     0.800  0       0.0  0                       
1078    6G 1E1415        50.2     0.      62.8 FIXEDHF     0.800  0       0.0  0                       
1079    6G 3E1415        36.3     0.      45.4 FIXEDHF     0.800  0       0.0  0                       
1080    6H 2D1415        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 5f     
1081    6H 4D1415        32.9     0.      41.1 FIXEDHF     0.800  0       0.0  0                       
1082    6H 1E1415        45.9     0.      57.4 FIXEDHF     0.800  0       0.0  0                       
1083    6H 3E1415        33.7     0.      42.1 FIXEDHF     0.800  0       0.0  0                       
1084    6I 2D1415        18.1     0.      22.6 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 6f     
1085    6I 4D1415        29.2     0.      36.5 FIXEDHF     0.800  0       0.0  0                       
1086    6I 1E1415        39.0     0.      48.7 FIXEDHF     0.800  0       0.0  0                       
1087    6I 3E1415        28.9     0.      36.1 FIXEDHF     0.800  0       0.0  0                       
1088    6J 2D1415        15.5     0.      19.4 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 7f     
1089    6J 4D1415        25.4     0.      31.7 FIXEDHF     0.800  0       0.0  0                       
1090    6J 1E1415        32.9     0.      41.1 FIXEDHF     0.800  0       0.0  0                       
1091    6J 3E1415        24.5     0.      30.6 FIXEDHF     0.800  0       0.0  0                       
1092    6K 2D1415        10.4     0.      13.0 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 8f     
1093    6K 4D1415        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0                       
1094    6K 1E1415        28.0     0.      35.0 FIXEDHF     0.800  0       0.0  0                       
1095    6K 3E1415        20.9     0.      26.1 FIXEDHF     0.800  0       0.0  0                       
1096    6L 2D1415        10.3     0.      12.9 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 9f     
1097    6L 4D1415        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0                       
1098    6L 1E1415        24.1     0.      30.1 FIXEDHF     0.800  0       0.0  0                       
1099    6L 3E1415        18.0     0.      22.5 FIXEDHF     0.800  0       0.0  0                       
1100    6M 2D1415        10.1     0.      12.6 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 10f    
1101    6M 4D1415        16.8     0.      21.0 FIXEDHF     0.800  0       0.0  0                       
1102    6M 1E1415        21.0     0.      26.2 FIXEDHF     0.800  0       0.0  0                       
1103    6M 3E1415        15.7     0.      19.6 FIXEDHF     0.800  0       0.0  0                       
1104    6N 2D1425         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s4f   
1105    6N 1E1425      -153.8     0.    -192.3 FIXEDHF     0.800  0       0.0  0                       
1106    6O 2D1425        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s5f   
1107    6O 1E1425      -149.1     0.    -186.4 FIXEDHF     0.800  0       0.0  0                       
1108    6P 2D1425        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s6f   
1109    6P 1E1425      -129.8     0.    -162.2 FIXEDHF     0.800  0       0.0  0                       
1110    6Q 2D1425        -8.5     0.     -10.6 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s7f   
1111    6Q 1E1425      -110.7     0.    -138.4 FIXEDHF     0.800  0       0.0  0                       
1112    6R 2D1425        -4.4     0.      -5.5 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s8f   
1113    6R 1E1425       -94.6     0.    -118.3 FIXEDHF     0.800  0       0.0  0                       
1114    6S 2D1425        -6.6     0.      -8.3 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s9f   
1115    6S 1E1425       -81.5     0.    -101.9 FIXEDHF     0.800  0       0.0  0                       
1116    6T 2D1425        -7.9     0.      -9.9 FIXEDHF     0.800  0       0.0  0  d5 9p     -d4 4s10f  
1117    6T 1E1425       -70.9     0.     -88.6 FIXEDHF     0.800  0       0.0  0                       
1118    6U 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 6h     
1119    6U 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1120    6V 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 7h     
1121    6V 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1122    6W 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 8h     
1123    6W 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1124    6X 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 9p     -d5 9h     
1125    6X 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1126    78 2D1423      -605.1     0.    -756.4 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s4p   
1127    78 1E1423      -608.5     0.    -760.6 FIXEDHF     0.800  0       0.0  0                       
1128    79 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s5p   
1129    79 2D1424      -422.7     0.    -528.4 FIXEDHF     0.800  0       0.0  0                       
1130    79 1E1424      -273.7     0.    -342.1 FIXEDHF     0.800  0       0.0  0                       
1131    7A 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s6p   
1132    7A 2D1424      -301.2     0.    -376.5 FIXEDHF     0.800  0       0.0  0                       
1133    7A 1E1424      -172.8     0.    -216.0 FIXEDHF     0.800  0       0.0  0                       
1134    7B 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s7p   
1135    7B 2D1424      -225.3     0.    -281.6 FIXEDHF     0.800  0       0.0  0                       
1136    7B 1E1424      -123.0     0.    -153.7 FIXEDHF     0.800  0       0.0  0                       
1137    7C 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s8p   
1138    7C 2D1424      -175.6     0.    -219.5 FIXEDHF     0.800  0       0.0  0                       
1139    7C 1E1424       -93.6     0.    -117.0 FIXEDHF     0.800  0       0.0  0                       
1140    7D 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s9p   
1141    7D 2D1424      -141.4     0.    -176.8 FIXEDHF     0.800  0       0.0  0                       
1142    7D 1E1424       -74.4     0.     -93.0 FIXEDHF     0.800  0       0.0  0                       
1143    7E 2D1112     -1094.6     0.   -1368.2 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s10p  
1144    7E 2D1424      -117.2     0.    -146.5 FIXEDHF     0.800  0       0.0  0                       
1145    7E 1E1424       -61.0     0.     -76.3 FIXEDHF     0.800  0       0.0  0                       
1146    7G 2D1415        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 4f     
1147    7G 4D1415        26.7     0.      33.4 FIXEDHF     0.800  0       0.0  0                       
1148    7G 1E1415        41.0     0.      51.3 FIXEDHF     0.800  0       0.0  0                       
1149    7G 3E1415        29.7     0.      37.1 FIXEDHF     0.800  0       0.0  0                       
1150    7H 2D1415        16.5     0.      20.6 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 5f     
1151    7H 4D1415        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0                       
1152    7H 1E1415        37.5     0.      46.9 FIXEDHF     0.800  0       0.0  0                       
1153    7H 3E1415        27.6     0.      34.5 FIXEDHF     0.800  0       0.0  0                       
1154    7I 2D1415        15.3     0.      19.1 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 6f     
1155    7I 4D1415        23.7     0.      29.6 FIXEDHF     0.800  0       0.0  0                       
1156    7I 1E1415        31.8     0.      39.8 FIXEDHF     0.800  0       0.0  0                       
1157    7I 3E1415        23.6     0.      29.5 FIXEDHF     0.800  0       0.0  0                       
1158    7J 2D1415        13.4     0.      16.8 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 7f     
1159    7J 4D1415        20.6     0.      25.7 FIXEDHF     0.800  0       0.0  0                       
1160    7J 1E1415        26.9     0.      33.6 FIXEDHF     0.800  0       0.0  0                       
1161    7J 3E1415        20.0     0.      25.0 FIXEDHF     0.800  0       0.0  0                       
1162    7K 2D1415        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 8f     
1163    7K 4D1415        17.8     0.      22.3 FIXEDHF     0.800  0       0.0  0                       
1164    7K 1E1415        22.9     0.      28.6 FIXEDHF     0.800  0       0.0  0                       
1165    7K 3E1415        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0                       
1166    7L 2D1415         8.5     0.      10.6 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 9f     
1167    7L 4D1415        15.5     0.      19.4 FIXEDHF     0.800  0       0.0  0                       
1168    7L 1E1415        19.7     0.      24.6 FIXEDHF     0.800  0       0.0  0                       
1169    7L 3E1415        14.8     0.      18.5 FIXEDHF     0.800  0       0.0  0                       
1170    7M 2D1415         7.9     0.       9.9 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 10f    
1171    7M 4D1415        13.7     0.      17.1 FIXEDHF     0.800  0       0.0  0                       
1172    7M 1E1415        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0                       
1173    7M 3E1415        12.9     0.      16.1 FIXEDHF     0.800  0       0.0  0                       
1174    7N 2D1425         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s4f   
1175    7N 1E1425      -124.9     0.    -156.1 FIXEDHF     0.800  0       0.0  0                       
1176    7O 2D1425        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s5f   
1177    7O 1E1425      -121.0     0.    -151.3 FIXEDHF     0.800  0       0.0  0                       
1178    7P 2D1425        -7.2     0.      -9.0 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s6f   
1179    7P 1E1425      -105.4     0.    -131.7 FIXEDHF     0.800  0       0.0  0                       
1180    7Q 2D1425        -7.7     0.      -9.6 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s7f   
1181    7Q 1E1425       -89.9     0.    -112.4 FIXEDHF     0.800  0       0.0  0                       
1182    7R 2D1425        -7.1     0.      -8.9 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s8f   
1183    7R 1E1425       -76.9     0.     -96.1 FIXEDHF     0.800  0       0.0  0                       
1184    7S 2D1425        -4.6     0.      -5.8 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s9f   
1185    7S 1E1425       -66.2     0.     -82.8 FIXEDHF     0.800  0       0.0  0                       
1186    7T 2D1425        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0  d5 10p    -d4 4s10f  
1187    7T 1E1425       -57.6     0.     -72.0 FIXEDHF     0.800  0       0.0  0                       
1188    7U 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 6h     
1189    7U 3E1416         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1190    7V 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 7h     
1191    7V 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1192    7W 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 8h     
1193    7W 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1194    7X 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d5 10p    -d5 9h     
1195    7X 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1196    89 0D1314       240.0     0.     300.0 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s5p   
1197    89 2D1314      5064.2     0.    6330.2 FIXEDHF     0.800  0       0.0  0                       
1198    89 1E1314      2274.6     0.    2843.3 FIXEDHF     0.800  0       0.0  0                       
1199    89 3E1314      2049.5     0.    2561.9 FIXEDHF     0.800  0       0.0  0                       
1200    89 0D2324      1616.6     0.    2020.8 FIXEDHF     0.800  0       0.0  0                       
1201    89 1E2324      9452.4     0.   11815.5 FIXEDHF     0.800  0       0.0  0                       
1202    8A 0D1314       154.2     0.     192.7 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s6p   
1203    8A 2D1314      3122.0     0.    3902.5 FIXEDHF     0.800  0       0.0  0                       
1204    8A 1E1314      1455.9     0.    1819.9 FIXEDHF     0.800  0       0.0  0                       
1205    8A 3E1314      1321.6     0.    1652.0 FIXEDHF     0.800  0       0.0  0                       
1206    8A 0D2324       908.2     0.    1135.3 FIXEDHF     0.800  0       0.0  0                       
1207    8A 1E2324      5260.3     0.    6575.4 FIXEDHF     0.800  0       0.0  0                       
1208    8B 0D1314       110.7     0.     138.4 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s7p   
1209    8B 2D1314      2203.0     0.    2753.7 FIXEDHF     0.800  0       0.0  0                       
1210    8B 1E1314      1044.2     0.    1305.2 FIXEDHF     0.800  0       0.0  0                       
1211    8B 3E1314       950.9     0.    1188.6 FIXEDHF     0.800  0       0.0  0                       
1212    8B 0D2324       612.6     0.     765.8 FIXEDHF     0.800  0       0.0  0                       
1213    8B 1E2324      3534.2     0.    4417.8 FIXEDHF     0.800  0       0.0  0                       
1214    8C 0D1314        84.7     0.     105.9 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s8p   
1215    8C 2D1314      1669.4     0.    2086.8 FIXEDHF     0.800  0       0.0  0                       
1216    8C 1E1314       798.2     0.     997.8 FIXEDHF     0.800  0       0.0  0                       
1217    8C 3E1314       728.2     0.     910.2 FIXEDHF     0.800  0       0.0  0                       
1218    8C 0D2324       452.6     0.     565.7 FIXEDHF     0.800  0       0.0  0                       
1219    8C 1E2324      2605.3     0.    3256.6 FIXEDHF     0.800  0       0.0  0                       
1220    8D 0D1314        67.6     0.      84.5 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s9p   
1221    8D 2D1314      1324.2     0.    1655.3 FIXEDHF     0.800  0       0.0  0                       
1222    8D 1E1314       636.6     0.     795.7 FIXEDHF     0.800  0       0.0  0                       
1223    8D 3E1314       581.3     0.     726.6 FIXEDHF     0.800  0       0.0  0                       
1224    8D 0D2324       353.3     0.     441.6 FIXEDHF     0.800  0       0.0  0                       
1225    8D 1E2324      2031.4     0.    2539.2 FIXEDHF     0.800  0       0.0  0                       
1226    8E 0D1314        55.6     0.      69.5 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s10p  
1227    8E 2D1314      1084.8     0.    1356.0 FIXEDHF     0.800  0       0.0  0                       
1228    8E 1E1314       523.3     0.     654.1 FIXEDHF     0.800  0       0.0  0                       
1229    8E 3E1314       478.2     0.     597.7 FIXEDHF     0.800  0       0.0  0                       
1230    8E 0D2324       286.3     0.     357.9 FIXEDHF     0.800  0       0.0  0                       
1231    8E 1E2324      1645.0     0.    2056.3 FIXEDHF     0.800  0       0.0  0                       
1232    8F 2D1112       857.8     0.    1072.2 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d3s2 4p   
1233    8F 2D1323     -9921.4     0.  -12401.7 FIXEDHF     0.800  0       0.0  0                       
1234    8F 1E1323     -9533.8     0.  -11917.2 FIXEDHF     0.800  0       0.0  0                       
1235    8G 2D2315     -2010.6     0.   -2513.3 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d5 4f     
1236    8G 3E2315     -1120.8     0.   -1401.0 FIXEDHF     0.800  0       0.0  0                       
1237    8H 2D2315     -1711.0     0.   -2138.7 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d5 5f     
1238    8H 3E2315      -993.1     0.   -1241.4 FIXEDHF     0.800  0       0.0  0                       
1239    8I 2D2315     -1398.5     0.   -1748.1 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d5 6f     
1240    8I 3E2315      -828.6     0.   -1035.8 FIXEDHF     0.800  0       0.0  0                       
1241    8J 2D2315     -1153.8     0.   -1442.3 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d5 7f     
1242    8J 3E2315      -692.1     0.    -865.1 FIXEDHF     0.800  0       0.0  0                       
1243    8K 2D2315      -967.7     0.   -1209.6 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d5 8f     
1244    8K 3E2315      -585.0     0.    -731.2 FIXEDHF     0.800  0       0.0  0                       
1245    8L 2D2315      -824.4     0.   -1030.5 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d5 9f     
1246    8L 3E2315      -501.1     0.    -626.4 FIXEDHF     0.800  0       0.0  0                       
1247    8M 2D2315      -712.3     0.    -890.4 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d5 10f    
1248    8M 3E2315      -434.7     0.    -543.4 FIXEDHF     0.800  0       0.0  0                       
1249    8N 2D1315      1712.7     0.    2140.9 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s4f   
1250    8N 4D1315       525.4     0.     656.8 FIXEDHF     0.800  0       0.0  0                       
1251    8N 1E1315       372.4     0.     465.5 FIXEDHF     0.800  0       0.0  0                       
1252    8N 3E1315       273.4     0.     341.8 FIXEDHF     0.800  0       0.0  0                       
1253    8O 2D1315      1537.5     0.    1921.9 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s5f   
1254    8O 4D1315       494.0     0.     617.5 FIXEDHF     0.800  0       0.0  0                       
1255    8O 1E1315       353.4     0.     441.7 FIXEDHF     0.800  0       0.0  0                       
1256    8O 3E1315       262.6     0.     328.2 FIXEDHF     0.800  0       0.0  0                       
1257    8P 2D1315      1286.5     0.    1608.1 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s6f   
1258    8P 4D1315       423.2     0.     529.0 FIXEDHF     0.800  0       0.0  0                       
1259    8P 1E1315       304.1     0.     380.1 FIXEDHF     0.800  0       0.0  0                       
1260    8P 3E1315       227.4     0.     284.2 FIXEDHF     0.800  0       0.0  0                       
1261    8Q 2D1315      1072.2     0.    1340.3 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s7f   
1262    8Q 4D1315       357.6     0.     447.0 FIXEDHF     0.800  0       0.0  0                       
1263    8Q 1E1315       257.7     0.     322.1 FIXEDHF     0.800  0       0.0  0                       
1264    8Q 3E1315       193.4     0.     241.7 FIXEDHF     0.800  0       0.0  0                       
1265    8R 2D1315       902.6     0.    1128.3 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s8f   
1266    8R 4D1315       303.8     0.     379.8 FIXEDHF     0.800  0       0.0  0                       
1267    8R 1E1315       219.3     0.     274.1 FIXEDHF     0.800  0       0.0  0                       
1268    8R 3E1315       165.0     0.     206.2 FIXEDHF     0.800  0       0.0  0                       
1269    8S 2D1315       769.7     0.     962.1 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s9f   
1270    8S 4D1315       260.6     0.     325.8 FIXEDHF     0.800  0       0.0  0                       
1271    8S 1E1315       188.4     0.     235.5 FIXEDHF     0.800  0       0.0  0                       
1272    8S 3E1315       141.9     0.     177.4 FIXEDHF     0.800  0       0.0  0                       
1273    8T 2D1315       664.6     0.     830.7 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s10f  
1274    8T 4D1315       226.1     0.     282.6 FIXEDHF     0.800  0       0.0  0                       
1275    8T 1E1315       163.5     0.     204.4 FIXEDHF     0.800  0       0.0  0                       
1276    8T 3E1315       123.4     0.     154.2 FIXEDHF     0.800  0       0.0  0                       
1277    8Y 4D1316         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s6h   
1278    8Y 3E1316         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0                       
1279    8Z 4D1316         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s7h   
1280    8Z 3E1316         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
1281    8a 4D1316         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s8h   
1282    8a 3E1316         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
1283    8b 4D1316         5.4     0.       6.8 FIXEDHF     0.800  0       0.0  0  d4 4s4p   -d4 4s9h   
1284    8b 3E1316         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
1285    9A 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s6p   
1286    9A 2D1414      1793.1     0.    2241.4 FIXEDHF     0.800  0       0.0  0                       
1287    9A 1E1414       668.6     0.     835.7 FIXEDHF     0.800  0       0.0  0                       
1288    9A 3E1414       622.9     0.     778.6 FIXEDHF     0.800  0       0.0  0                       
1289    9A 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1290    9A 1E2424      2139.0     0.    2673.8 FIXEDHF     0.800  0       0.0  0                       
1291    9B 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s7p   
1292    9B 2D1414      1253.1     0.    1566.4 FIXEDHF     0.800  0       0.0  0                       
1293    9B 1E1414       481.0     0.     601.3 FIXEDHF     0.800  0       0.0  0                       
1294    9B 3E1414       449.5     0.     561.9 FIXEDHF     0.800  0       0.0  0                       
1295    9B 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1296    9B 1E2424      1480.8     0.    1851.0 FIXEDHF     0.800  0       0.0  0                       
1297    9C 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s8p   
1298    9C 2D1414       945.7     0.    1182.1 FIXEDHF     0.800  0       0.0  0                       
1299    9C 1E1414       368.3     0.     460.4 FIXEDHF     0.800  0       0.0  0                       
1300    9C 3E1414       344.8     0.     431.0 FIXEDHF     0.800  0       0.0  0                       
1301    9C 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1302    9C 1E2424      1109.4     0.    1386.7 FIXEDHF     0.800  0       0.0  0                       
1303    9D 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s9p   
1304    9D 2D1414       748.3     0.     935.4 FIXEDHF     0.800  0       0.0  0                       
1305    9D 1E1414       294.0     0.     367.5 FIXEDHF     0.800  0       0.0  0                       
1306    9D 3E1414       275.5     0.     344.4 FIXEDHF     0.800  0       0.0  0                       
1307    9D 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1308    9D 1E2424       873.5     0.    1091.9 FIXEDHF     0.800  0       0.0  0                       
1309    9E 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s10p  
1310    9E 2D1414       612.1     0.     765.1 FIXEDHF     0.800  0       0.0  0                       
1311    9E 1E1414       241.8     0.     302.3 FIXEDHF     0.800  0       0.0  0                       
1312    9E 3E1414       226.8     0.     283.5 FIXEDHF     0.800  0       0.0  0                       
1313    9E 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1314    9E 1E2424       711.9     0.     889.9 FIXEDHF     0.800  0       0.0  0                       
1315    9F 2D1423     -3003.5     0.   -3754.4 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d3s2 4p   
1316    9F 1E1423     -2845.8     0.   -3557.2 FIXEDHF     0.800  0       0.0  0                       
1317    9G 2D2415       520.1     0.     650.1 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d5 4f     
1318    9G 3E2415      -372.1     0.    -465.1 FIXEDHF     0.800  0       0.0  0                       
1319    9H 2D2415       105.6     0.     132.0 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d5 5f     
1320    9H 3E2415      -338.6     0.    -423.2 FIXEDHF     0.800  0       0.0  0                       
1321    9I 2D2415       -20.0     0.     -25.0 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d5 6f     
1322    9I 3E2415      -286.5     0.    -358.1 FIXEDHF     0.800  0       0.0  0                       
1323    9J 2D2415       -62.0     0.     -77.5 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d5 7f     
1324    9J 3E2415      -241.4     0.    -301.7 FIXEDHF     0.800  0       0.0  0                       
1325    9K 2D2415       -75.0     0.     -93.7 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d5 8f     
1326    9K 3E2415      -205.1     0.    -256.4 FIXEDHF     0.800  0       0.0  0                       
1327    9L 2D2415       -76.8     0.     -96.0 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d5 9f     
1328    9L 3E2415      -176.4     0.    -220.5 FIXEDHF     0.800  0       0.0  0                       
1329    9M 2D2415       -74.2     0.     -92.7 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d5 10f    
1330    9M 3E2415      -153.5     0.    -191.9 FIXEDHF     0.800  0       0.0  0                       
1331    9N 2D1415      -149.6     0.    -187.0 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s4f   
1332    9N 4D1415       129.6     0.     162.0 FIXEDHF     0.800  0       0.0  0                       
1333    9N 1E1415       148.6     0.     185.7 FIXEDHF     0.800  0       0.0  0                       
1334    9N 3E1415       113.8     0.     142.3 FIXEDHF     0.800  0       0.0  0                       
1335    9O 2D1415       121.0     0.     151.3 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s5f   
1336    9O 4D1415       142.1     0.     177.6 FIXEDHF     0.800  0       0.0  0                       
1337    9O 1E1415       142.2     0.     177.7 FIXEDHF     0.800  0       0.0  0                       
1338    9O 3E1415       110.4     0.     138.0 FIXEDHF     0.800  0       0.0  0                       
1339    9P 2D1415       183.8     0.     229.8 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s6f   
1340    9P 4D1415       129.7     0.     162.1 FIXEDHF     0.800  0       0.0  0                       
1341    9P 1E1415       122.9     0.     153.6 FIXEDHF     0.800  0       0.0  0                       
1342    9P 3E1415        96.1     0.     120.1 FIXEDHF     0.800  0       0.0  0                       
1343    9Q 2D1415       189.0     0.     236.3 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s7f   
1344    9Q 4D1415       113.3     0.     141.6 FIXEDHF     0.800  0       0.0  0                       
1345    9Q 1E1415       104.4     0.     130.5 FIXEDHF     0.800  0       0.0  0                       
1346    9Q 3E1415        82.0     0.     102.5 FIXEDHF     0.800  0       0.0  0                       
1347    9R 2D1415       177.3     0.     221.6 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s8f   
1348    9R 4D1415        98.2     0.     122.8 FIXEDHF     0.800  0       0.0  0                       
1349    9R 1E1415        89.0     0.     111.3 FIXEDHF     0.800  0       0.0  0                       
1350    9R 3E1415        70.1     0.      87.6 FIXEDHF     0.800  0       0.0  0                       
1351    9S 2D1415       161.4     0.     201.7 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s9f   
1352    9S 4D1415        85.4     0.     106.8 FIXEDHF     0.800  0       0.0  0                       
1353    9S 1E1415        76.6     0.      95.7 FIXEDHF     0.800  0       0.0  0                       
1354    9S 3E1415        60.4     0.      75.5 FIXEDHF     0.800  0       0.0  0                       
1355    9T 2D1415       145.5     0.     181.9 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s10f  
1356    9T 4D1415        74.8     0.      93.5 FIXEDHF     0.800  0       0.0  0                       
1357    9T 1E1415        66.5     0.      83.1 FIXEDHF     0.800  0       0.0  0                       
1358    9T 3E1415        52.5     0.      65.6 FIXEDHF     0.800  0       0.0  0                       
1359    9Y 4D1416        -3.0     0.      -3.7 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s6h   
1360    9Y 3E1416         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1361    9Z 4D1416        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s7h   
1362    9Z 3E1416         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1363    9a 4D1416        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s8h   
1364    9a 3E1416         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1365    9b 4D1416        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0  d4 4s5p   -d4 4s9h   
1366    9b 3E1416         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1367    AB 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s7p   
1368    AB 2D1414       867.4     0.    1084.2 FIXEDHF     0.800  0       0.0  0                       
1369    AB 1E1414       310.9     0.     388.6 FIXEDHF     0.800  0       0.0  0                       
1370    AB 3E1414       292.6     0.     365.8 FIXEDHF     0.800  0       0.0  0                       
1371    AB 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1372    AB 1E2424       902.2     0.    1127.8 FIXEDHF     0.800  0       0.0  0                       
1373    AC 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s8p   
1374    AC 2D1414       652.6     0.     815.8 FIXEDHF     0.800  0       0.0  0                       
1375    AC 1E1414       238.2     0.     297.7 FIXEDHF     0.800  0       0.0  0                       
1376    AC 3E1414       224.6     0.     280.7 FIXEDHF     0.800  0       0.0  0                       
1377    AC 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1378    AC 1E2424       678.4     0.     848.0 FIXEDHF     0.800  0       0.0  0                       
1379    AD 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s9p   
1380    AD 2D1414       515.8     0.     644.8 FIXEDHF     0.800  0       0.0  0                       
1381    AD 1E1414       190.2     0.     237.7 FIXEDHF     0.800  0       0.0  0                       
1382    AD 3E1414       179.5     0.     224.4 FIXEDHF     0.800  0       0.0  0                       
1383    AD 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1384    AD 1E2424       535.4     0.     669.2 FIXEDHF     0.800  0       0.0  0                       
1385    AE 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s10p  
1386    AE 2D1414       421.7     0.     527.1 FIXEDHF     0.800  0       0.0  0                       
1387    AE 1E1414       156.5     0.     195.6 FIXEDHF     0.800  0       0.0  0                       
1388    AE 3E1414       147.8     0.     184.7 FIXEDHF     0.800  0       0.0  0                       
1389    AE 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1390    AE 1E2424       437.0     0.     546.3 FIXEDHF     0.800  0       0.0  0                       
1391    AF 2D1423     -1717.5     0.   -2146.9 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d3s2 4p   
1392    AF 1E1423     -1616.1     0.   -2020.1 FIXEDHF     0.800  0       0.0  0                       
1393    AG 2D2415       113.0     0.     141.2 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d5 4f     
1394    AG 3E2415      -218.3     0.    -272.9 FIXEDHF     0.800  0       0.0  0                       
1395    AH 2D2415       182.3     0.     227.9 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d5 5f     
1396    AH 3E2415      -199.9     0.    -249.9 FIXEDHF     0.800  0       0.0  0                       
1397    AI 2D2415        95.9     0.     119.9 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d5 6f     
1398    AI 3E2415      -169.8     0.    -212.2 FIXEDHF     0.800  0       0.0  0                       
1399    AJ 2D2415        51.4     0.      64.2 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d5 7f     
1400    AJ 3E2415      -143.3     0.    -179.1 FIXEDHF     0.800  0       0.0  0                       
1401    AK 2D2415        27.9     0.      34.9 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d5 8f     
1402    AK 3E2415      -122.0     0.    -152.5 FIXEDHF     0.800  0       0.0  0                       
1403    AL 2D2415        15.0     0.      18.8 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d5 9f     
1404    AL 3E2415      -105.0     0.    -131.3 FIXEDHF     0.800  0       0.0  0                       
1405    AM 2D2415         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d5 10f    
1406    AM 3E2415       -91.4     0.    -114.3 FIXEDHF     0.800  0       0.0  0                       
1407    AN 2D1415        30.6     0.      38.2 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s4f   
1408    AN 4D1415        78.4     0.      98.0 FIXEDHF     0.800  0       0.0  0                       
1409    AN 1E1415        92.7     0.     115.9 FIXEDHF     0.800  0       0.0  0                       
1410    AN 3E1415        71.8     0.      89.7 FIXEDHF     0.800  0       0.0  0                       
1411    AO 2D1415        -6.9     0.      -8.6 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s5f   
1412    AO 4D1415        81.8     0.     102.2 FIXEDHF     0.800  0       0.0  0                       
1413    AO 1E1415        89.0     0.     111.2 FIXEDHF     0.800  0       0.0  0                       
1414    AO 3E1415        69.8     0.      87.2 FIXEDHF     0.800  0       0.0  0                       
1415    AP 2D1415        40.2     0.      50.2 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s6f   
1416    AP 4D1415        74.5     0.      93.1 FIXEDHF     0.800  0       0.0  0                       
1417    AP 1E1415        77.0     0.      96.2 FIXEDHF     0.800  0       0.0  0                       
1418    AP 3E1415        60.8     0.      76.0 FIXEDHF     0.800  0       0.0  0                       
1419    AQ 2D1415        56.9     0.      71.1 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s7f   
1420    AQ 4D1415        65.3     0.      81.6 FIXEDHF     0.800  0       0.0  0                       
1421    AQ 1E1415        65.4     0.      81.8 FIXEDHF     0.800  0       0.0  0                       
1422    AQ 3E1415        51.9     0.      64.9 FIXEDHF     0.800  0       0.0  0                       
1423    AR 2D1415        60.6     0.      75.7 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s8f   
1424    AR 4D1415        56.7     0.      70.9 FIXEDHF     0.800  0       0.0  0                       
1425    AR 1E1415        55.8     0.      69.8 FIXEDHF     0.800  0       0.0  0                       
1426    AR 3E1415        44.4     0.      55.5 FIXEDHF     0.800  0       0.0  0                       
1427    AS 2D1415        58.9     0.      73.6 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s9f   
1428    AS 4D1415        49.4     0.      61.8 FIXEDHF     0.800  0       0.0  0                       
1429    AS 1E1415        48.0     0.      60.0 FIXEDHF     0.800  0       0.0  0                       
1430    AS 3E1415        38.2     0.      47.8 FIXEDHF     0.800  0       0.0  0                       
1431    AT 2D1415        55.4     0.      69.2 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s10f  
1432    AT 4D1415        43.4     0.      54.2 FIXEDHF     0.800  0       0.0  0                       
1433    AT 1E1415        41.8     0.      52.2 FIXEDHF     0.800  0       0.0  0                       
1434    AT 3E1415        33.3     0.      41.6 FIXEDHF     0.800  0       0.0  0                       
1435    AY 4D1416         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s6h   
1436    AY 3E1416         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1437    AZ 4D1416        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s7h   
1438    AZ 3E1416         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1439    Aa 4D1416        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s8h   
1440    Aa 3E1416         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1441    Ab 4D1416        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d4 4s6p   -d4 4s9h   
1442    Ab 3E1416         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1443    BC 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s8p   
1444    BC 2D1414       485.0     0.     606.2 FIXEDHF     0.800  0       0.0  0                       
1445    BC 1E1414       171.6     0.     214.5 FIXEDHF     0.800  0       0.0  0                       
1446    BC 3E1414       162.3     0.     202.9 FIXEDHF     0.800  0       0.0  0                       
1447    BC 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1448    BC 1E2424       475.0     0.     593.8 FIXEDHF     0.800  0       0.0  0                       
1449    BD 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s9p   
1450    BD 2D1414       382.8     0.     478.5 FIXEDHF     0.800  0       0.0  0                       
1451    BD 1E1414       137.0     0.     171.3 FIXEDHF     0.800  0       0.0  0                       
1452    BD 3E1414       129.8     0.     162.2 FIXEDHF     0.800  0       0.0  0                       
1453    BD 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1454    BD 1E2424       375.3     0.     469.1 FIXEDHF     0.800  0       0.0  0                       
1455    BE 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s10p  
1456    BE 2D1414       312.8     0.     391.0 FIXEDHF     0.800  0       0.0  0                       
1457    BE 1E1414       112.7     0.     140.9 FIXEDHF     0.800  0       0.0  0                       
1458    BE 3E1414       106.8     0.     133.5 FIXEDHF     0.800  0       0.0  0                       
1459    BE 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1460    BE 1E2424       306.5     0.     383.1 FIXEDHF     0.800  0       0.0  0                       
1461    BF 2D1423     -1168.3     0.   -1460.4 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d3s2 4p   
1462    BF 1E1423     -1095.6     0.   -1369.5 FIXEDHF     0.800  0       0.0  0                       
1463    BG 2D2415        67.0     0.      83.7 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d5 4f     
1464    BG 3E2415      -150.2     0.    -187.8 FIXEDHF     0.800  0       0.0  0                       
1465    BH 2D2415        62.2     0.      77.8 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d5 5f     
1466    BH 3E2415      -138.0     0.    -172.5 FIXEDHF     0.800  0       0.0  0                       
1467    BI 2D2415        80.2     0.     100.2 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d5 6f     
1468    BI 3E2415      -117.4     0.    -146.7 FIXEDHF     0.800  0       0.0  0                       
1469    BJ 2D2415        54.9     0.      68.6 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d5 7f     
1470    BJ 3E2415       -99.2     0.    -124.0 FIXEDHF     0.800  0       0.0  0                       
1471    BK 2D2415        37.9     0.      47.4 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d5 8f     
1472    BK 3E2415       -84.5     0.    -105.6 FIXEDHF     0.800  0       0.0  0                       
1473    BL 2D2415        27.0     0.      33.8 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d5 9f     
1474    BL 3E2415       -72.7     0.     -90.9 FIXEDHF     0.800  0       0.0  0                       
1475    BM 2D2415        20.0     0.      25.0 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d5 10f    
1476    BM 3E2415       -63.4     0.     -79.2 FIXEDHF     0.800  0       0.0  0                       
1477    BN 2D1415        29.2     0.      36.5 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s4f   
1478    BN 4D1415        54.6     0.      68.2 FIXEDHF     0.800  0       0.0  0                       
1479    BN 1E1415        65.8     0.      82.3 FIXEDHF     0.800  0       0.0  0                       
1480    BN 3E1415        51.1     0.      63.9 FIXEDHF     0.800  0       0.0  0                       
1481    BO 2D1415        33.6     0.      42.0 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s5f   
1482    BO 4D1415        56.9     0.      71.1 FIXEDHF     0.800  0       0.0  0                       
1483    BO 1E1415        63.1     0.      78.9 FIXEDHF     0.800  0       0.0  0                       
1484    BO 3E1415        49.8     0.      62.2 FIXEDHF     0.800  0       0.0  0                       
1485    BP 2D1415        16.5     0.      20.6 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s6f   
1486    BP 4D1415        51.4     0.      64.2 FIXEDHF     0.800  0       0.0  0                       
1487    BP 1E1415        54.6     0.      68.3 FIXEDHF     0.800  0       0.0  0                       
1488    BP 3E1415        43.4     0.      54.2 FIXEDHF     0.800  0       0.0  0                       
1489    BQ 2D1415        25.4     0.      31.8 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s7f   
1490    BQ 4D1415        45.0     0.      56.2 FIXEDHF     0.800  0       0.0  0                       
1491    BQ 1E1415        46.5     0.      58.1 FIXEDHF     0.800  0       0.0  0                       
1492    BQ 3E1415        37.0     0.      46.3 FIXEDHF     0.800  0       0.0  0                       
1493    BR 2D1415        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s8f   
1494    BR 4D1415        39.0     0.      48.8 FIXEDHF     0.800  0       0.0  0                       
1495    BR 1E1415        39.7     0.      49.6 FIXEDHF     0.800  0       0.0  0                       
1496    BR 3E1415        31.7     0.      39.6 FIXEDHF     0.800  0       0.0  0                       
1497    BS 2D1415        29.4     0.      36.7 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s9f   
1498    BS 4D1415        34.0     0.      42.5 FIXEDHF     0.800  0       0.0  0                       
1499    BS 1E1415        34.2     0.      42.7 FIXEDHF     0.800  0       0.0  0                       
1500    BS 3E1415        27.4     0.      34.2 FIXEDHF     0.800  0       0.0  0                       
1501    BT 2D1415        28.3     0.      35.4 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s10f  
1502    BT 4D1415        29.8     0.      37.3 FIXEDHF     0.800  0       0.0  0                       
1503    BT 1E1415        29.7     0.      37.1 FIXEDHF     0.800  0       0.0  0                       
1504    BT 3E1415        23.8     0.      29.7 FIXEDHF     0.800  0       0.0  0                       
1505    BY 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s6h   
1506    BY 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1507    BZ 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s7h   
1508    BZ 3E1416         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1509    Ba 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s8h   
1510    Ba 3E1416         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1511    Bb 4D1416        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d4 4s7p   -d4 4s9h   
1512    Bb 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1513    CD 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s9p   
1514    CD 2D1414       298.3     0.     372.9 FIXEDHF     0.800  0       0.0  0                       
1515    CD 1E1414       105.0     0.     131.3 FIXEDHF     0.800  0       0.0  0                       
1516    CD 3E1414        99.6     0.     124.5 FIXEDHF     0.800  0       0.0  0                       
1517    CD 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1518    CD 1E2424       283.0     0.     353.8 FIXEDHF     0.800  0       0.0  0                       
1519    CE 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s10p  
1520    CE 2D1414       243.5     0.     304.4 FIXEDHF     0.800  0       0.0  0                       
1521    CE 1E1414        86.4     0.     108.0 FIXEDHF     0.800  0       0.0  0                       
1522    CE 3E1414        82.0     0.     102.5 FIXEDHF     0.800  0       0.0  0                       
1523    CE 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1524    CE 1E2424       231.3     0.     289.1 FIXEDHF     0.800  0       0.0  0                       
1525    CF 2D1423      -867.1     0.   -1083.9 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d3s2 4p   
1526    CF 1E1423      -811.7     0.   -1014.6 FIXEDHF     0.800  0       0.0  0                       
1527    CG 2D2415        46.5     0.      58.1 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d5 4f     
1528    CG 3E2415      -112.2     0.    -140.3 FIXEDHF     0.800  0       0.0  0                       
1529    CH 2D2415        41.1     0.      51.4 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d5 5f     
1530    CH 3E2415      -103.3     0.    -129.1 FIXEDHF     0.800  0       0.0  0                       
1531    CI 2D2415        35.9     0.      44.9 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d5 6f     
1532    CI 3E2415       -87.9     0.    -109.9 FIXEDHF     0.800  0       0.0  0                       
1533    CJ 2D2415        41.4     0.      51.8 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d5 7f     
1534    CJ 3E2415       -74.3     0.     -92.9 FIXEDHF     0.800  0       0.0  0                       
1535    CK 2D2415        32.0     0.      40.0 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d5 8f     
1536    CK 3E2415       -63.3     0.     -79.1 FIXEDHF     0.800  0       0.0  0                       
1537    CL 2D2415        24.6     0.      30.7 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d5 9f     
1538    CL 3E2415       -54.6     0.     -68.2 FIXEDHF     0.800  0       0.0  0                       
1539    CM 2D2415        19.3     0.      24.1 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d5 10f    
1540    CM 3E2415       -47.5     0.     -59.4 FIXEDHF     0.800  0       0.0  0                       
1541    CN 2D1415        24.6     0.      30.7 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s4f   
1542    CN 4D1415        41.0     0.      51.2 FIXEDHF     0.800  0       0.0  0                       
1543    CN 1E1415        50.0     0.      62.5 FIXEDHF     0.800  0       0.0  0                       
1544    CN 3E1415        39.0     0.      48.7 FIXEDHF     0.800  0       0.0  0                       
1545    CO 2D1415        29.0     0.      36.3 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s5f   
1546    CO 4D1415        42.7     0.      53.4 FIXEDHF     0.800  0       0.0  0                       
1547    CO 1E1415        48.0     0.      60.0 FIXEDHF     0.800  0       0.0  0                       
1548    CO 3E1415        37.9     0.      47.4 FIXEDHF     0.800  0       0.0  0                       
1549    CP 2D1415        26.7     0.      33.4 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s6f   
1550    CP 4D1415        38.6     0.      48.2 FIXEDHF     0.800  0       0.0  0                       
1551    CP 1E1415        41.6     0.      52.0 FIXEDHF     0.800  0       0.0  0                       
1552    CP 3E1415        33.0     0.      41.3 FIXEDHF     0.800  0       0.0  0                       
1553    CQ 2D1415        17.6     0.      22.0 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s7f   
1554    CQ 4D1415        33.7     0.      42.1 FIXEDHF     0.800  0       0.0  0                       
1555    CQ 1E1415        35.4     0.      44.2 FIXEDHF     0.800  0       0.0  0                       
1556    CQ 3E1415        28.2     0.      35.3 FIXEDHF     0.800  0       0.0  0                       
1557    CR 2D1415        18.5     0.      23.1 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s8f   
1558    CR 4D1415        29.2     0.      36.5 FIXEDHF     0.800  0       0.0  0                       
1559    CR 1E1415        30.2     0.      37.7 FIXEDHF     0.800  0       0.0  0                       
1560    CR 3E1415        24.2     0.      30.2 FIXEDHF     0.800  0       0.0  0                       
1561    CS 2D1415        18.6     0.      23.2 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s9f   
1562    CS 4D1415        25.4     0.      31.8 FIXEDHF     0.800  0       0.0  0                       
1563    CS 1E1415        26.0     0.      32.5 FIXEDHF     0.800  0       0.0  0                       
1564    CS 3E1415        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0                       
1565    CT 2D1415        17.9     0.      22.4 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s10f  
1566    CT 4D1415        22.3     0.      27.9 FIXEDHF     0.800  0       0.0  0                       
1567    CT 1E1415        22.6     0.      28.2 FIXEDHF     0.800  0       0.0  0                       
1568    CT 3E1415        18.2     0.      22.7 FIXEDHF     0.800  0       0.0  0                       
1569    CY 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s6h   
1570    CY 3E1416         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1571    CZ 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s7h   
1572    CZ 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1573    Ca 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s8h   
1574    Ca 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1575    Cb 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s8p   -d4 4s9h   
1576    Cb 3E1416         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1577    DE 0D1414         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s10p  
1578    DE 2D1414       196.5     0.     245.6 FIXEDHF     0.800  0       0.0  0                       
1579    DE 1E1414        69.0     0.      86.3 FIXEDHF     0.800  0       0.0  0                       
1580    DE 3E1414        65.6     0.      82.0 FIXEDHF     0.800  0       0.0  0                       
1581    DE 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1582    DE 1E2424       182.9     0.     228.6 FIXEDHF     0.800  0       0.0  0                       
1583    DF 2D1423      -679.0     0.    -848.7 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d3s2 4p   
1584    DF 1E1423      -634.8     0.    -793.5 FIXEDHF     0.800  0       0.0  0                       
1585    DG 2D2415        35.0     0.      43.8 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d5 4f     
1586    DG 3E2415       -88.2     0.    -110.3 FIXEDHF     0.800  0       0.0  0                       
1587    DH 2D2415        30.2     0.      37.8 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d5 5f     
1588    DH 3E2415       -81.3     0.    -101.6 FIXEDHF     0.800  0       0.0  0                       
1589    DI 2D2415        25.5     0.      31.9 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d5 6f     
1590    DI 3E2415       -69.2     0.     -86.5 FIXEDHF     0.800  0       0.0  0                       
1591    DJ 2D2415        22.2     0.      27.7 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d5 7f     
1592    DJ 3E2415       -58.6     0.     -73.2 FIXEDHF     0.800  0       0.0  0                       
1593    DK 2D2415        24.0     0.      30.0 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d5 8f     
1594    DK 3E2415       -49.8     0.     -62.3 FIXEDHF     0.800  0       0.0  0                       
1595    DL 2D2415        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d5 9f     
1596    DL 3E2415       -43.0     0.     -53.7 FIXEDHF     0.800  0       0.0  0                       
1597    DM 2D2415        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d5 10f    
1598    DM 3E2415       -37.4     0.     -46.8 FIXEDHF     0.800  0       0.0  0                       
1599    DN 2D1415        20.6     0.      25.7 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s4f   
1600    DN 4D1415        32.4     0.      40.5 FIXEDHF     0.800  0       0.0  0                       
1601    DN 1E1415        39.8     0.      49.7 FIXEDHF     0.800  0       0.0  0                       
1602    DN 3E1415        31.0     0.      38.7 FIXEDHF     0.800  0       0.0  0                       
1603    DO 2D1415        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s5f   
1604    DO 4D1415        33.7     0.      42.1 FIXEDHF     0.800  0       0.0  0                       
1605    DO 1E1415        38.2     0.      47.7 FIXEDHF     0.800  0       0.0  0                       
1606    DO 3E1415        30.2     0.      37.7 FIXEDHF     0.800  0       0.0  0                       
1607    DP 2D1415        22.9     0.      28.6 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s6f   
1608    DP 4D1415        30.4     0.      38.0 FIXEDHF     0.800  0       0.0  0                       
1609    DP 1E1415        33.0     0.      41.3 FIXEDHF     0.800  0       0.0  0                       
1610    DP 3E1415        26.3     0.      32.9 FIXEDHF     0.800  0       0.0  0                       
1611    DQ 2D1415        20.0     0.      25.0 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s7f   
1612    DQ 4D1415        26.6     0.      33.2 FIXEDHF     0.800  0       0.0  0                       
1613    DQ 1E1415        28.2     0.      35.2 FIXEDHF     0.800  0       0.0  0                       
1614    DQ 3E1415        22.5     0.      28.1 FIXEDHF     0.800  0       0.0  0                       
1615    DR 2D1415        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s8f   
1616    DR 4D1415        23.0     0.      28.8 FIXEDHF     0.800  0       0.0  0                       
1617    DR 1E1415        24.0     0.      30.0 FIXEDHF     0.800  0       0.0  0                       
1618    DR 3E1415        19.3     0.      24.1 FIXEDHF     0.800  0       0.0  0                       
1619    DS 2D1415        13.8     0.      17.3 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s9f   
1620    DS 4D1415        20.0     0.      25.0 FIXEDHF     0.800  0       0.0  0                       
1621    DS 1E1415        20.6     0.      25.8 FIXEDHF     0.800  0       0.0  0                       
1622    DS 3E1415        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0                       
1623    DT 2D1415        13.1     0.      16.4 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s10f  
1624    DT 4D1415        17.6     0.      22.0 FIXEDHF     0.800  0       0.0  0                       
1625    DT 1E1415        17.9     0.      22.4 FIXEDHF     0.800  0       0.0  0                       
1626    DT 3E1415        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0                       
1627    DY 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s6h   
1628    DY 3E1416         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1629    DZ 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s7h   
1630    DZ 3E1416         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1631    Da 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s8h   
1632    Da 3E1416         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1633    Db 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s9p   -d4 4s9h   
1634    Db 3E1416         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1635    EF 2D1423      -551.4     0.    -689.2 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d3s2 4p   
1636    EF 1E1423      -515.1     0.    -643.9 FIXEDHF     0.800  0       0.0  0                       
1637    EG 2D2415        27.8     0.      34.7 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d5 4f     
1638    EG 3E2415       -71.8     0.     -89.8 FIXEDHF     0.800  0       0.0  0                       
1639    EH 2D2415        23.7     0.      29.6 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d5 5f     
1640    EH 3E2415       -66.2     0.     -82.8 FIXEDHF     0.800  0       0.0  0                       
1641    EI 2D2415        19.6     0.      24.5 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d5 6f     
1642    EI 3E2415       -56.4     0.     -70.5 FIXEDHF     0.800  0       0.0  0                       
1643    EJ 2D2415        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d5 7f     
1644    EJ 3E2415       -47.7     0.     -59.6 FIXEDHF     0.800  0       0.0  0                       
1645    EK 2D2415        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d5 8f     
1646    EK 3E2415       -40.6     0.     -50.8 FIXEDHF     0.800  0       0.0  0                       
1647    EL 2D2415        15.0     0.      18.8 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d5 9f     
1648    EL 3E2415       -35.0     0.     -43.8 FIXEDHF     0.800  0       0.0  0                       
1649    EM 2D2415        12.9     0.      16.1 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d5 10f    
1650    EM 3E2415       -30.6     0.     -38.2 FIXEDHF     0.800  0       0.0  0                       
1651    EN 2D1415        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s4f   
1652    EN 4D1415        26.4     0.      33.0 FIXEDHF     0.800  0       0.0  0                       
1653    EN 1E1415        32.6     0.      40.7 FIXEDHF     0.800  0       0.0  0                       
1654    EN 3E1415        25.4     0.      31.8 FIXEDHF     0.800  0       0.0  0                       
1655    EO 2D1415        20.6     0.      25.7 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s5f   
1656    EO 4D1415        27.5     0.      34.4 FIXEDHF     0.800  0       0.0  0                       
1657    EO 1E1415        31.3     0.      39.1 FIXEDHF     0.800  0       0.0  0                       
1658    EO 3E1415        24.8     0.      31.0 FIXEDHF     0.800  0       0.0  0                       
1659    EP 2D1415        19.5     0.      24.4 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s6f   
1660    EP 4D1415        24.8     0.      31.0 FIXEDHF     0.800  0       0.0  0                       
1661    EP 1E1415        27.1     0.      33.9 FIXEDHF     0.800  0       0.0  0                       
1662    EP 3E1415        21.6     0.      27.0 FIXEDHF     0.800  0       0.0  0                       
1663    EQ 2D1415        17.3     0.      21.6 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s7f   
1664    EQ 4D1415        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
1665    EQ 1E1415        23.1     0.      28.9 FIXEDHF     0.800  0       0.0  0                       
1666    EQ 3E1415        18.5     0.      23.1 FIXEDHF     0.800  0       0.0  0                       
1667    ER 2D1415        14.9     0.      18.6 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s8f   
1668    ER 4D1415        18.8     0.      23.5 FIXEDHF     0.800  0       0.0  0                       
1669    ER 1E1415        19.7     0.      24.6 FIXEDHF     0.800  0       0.0  0                       
1670    ER 3E1415        15.8     0.      19.8 FIXEDHF     0.800  0       0.0  0                       
1671    ES 2D1415        11.6     0.      14.5 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s9f   
1672    ES 4D1415        16.3     0.      20.4 FIXEDHF     0.800  0       0.0  0                       
1673    ES 1E1415        17.0     0.      21.2 FIXEDHF     0.800  0       0.0  0                       
1674    ES 3E1415        13.6     0.      17.0 FIXEDHF     0.800  0       0.0  0                       
1675    ET 2D1415        10.6     0.      13.2 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s10f  
1676    ET 4D1415        14.3     0.      17.9 FIXEDHF     0.800  0       0.0  0                       
1677    ET 1E1415        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0                       
1678    ET 3E1415        11.8     0.      14.8 FIXEDHF     0.800  0       0.0  0                       
1679    EY 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s6h   
1680    EY 3E1416         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1681    EZ 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s7h   
1682    EZ 3E1416         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1683    Ea 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s8h   
1684    Ea 3E1416         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1685    Eb 4D1416        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s10p  -d4 4s9h   
1686    Eb 3E1416         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1687    FN 2D2315     -1863.3     0.   -2329.1 FIXEDHF     0.800  0       0.0  0  d3s2 4p   -d4 4s4f   
1688    FN 3E2315     -1081.3     0.   -1351.6 FIXEDHF     0.800  0       0.0  0                       
1689    FO 2D2315     -1674.0     0.   -2092.5 FIXEDHF     0.800  0       0.0  0  d3s2 4p   -d4 4s5f   
1690    FO 3E2315     -1007.3     0.   -1259.1 FIXEDHF     0.800  0       0.0  0                       
1691    FP 2D2315     -1400.4     0.   -1750.5 FIXEDHF     0.800  0       0.0  0  d3s2 4p   -d4 4s6f   
1692    FP 3E2315      -858.5     0.   -1073.1 FIXEDHF     0.800  0       0.0  0                       
1693    FQ 2D2315     -1166.9     0.   -1458.6 FIXEDHF     0.800  0       0.0  0  d3s2 4p   -d4 4s7f   
1694    FQ 3E2315      -723.3     0.    -904.1 FIXEDHF     0.800  0       0.0  0                       
1695    FR 2D2315      -982.1     0.   -1227.6 FIXEDHF     0.800  0       0.0  0  d3s2 4p   -d4 4s8f   
1696    FR 3E2315      -613.1     0.    -766.4 FIXEDHF     0.800  0       0.0  0                       
1697    FS 2D2315      -837.3     0.   -1046.6 FIXEDHF     0.800  0       0.0  0  d3s2 4p   -d4 4s9f   
1698    FS 3E2315      -525.3     0.    -656.6 FIXEDHF     0.800  0       0.0  0                       
1699    FT 2D2315      -722.8     0.    -903.5 FIXEDHF     0.800  0       0.0  0  d3s2 4p   -d4 4s10f  
1700    FT 3E2315      -455.1     0.    -568.9 FIXEDHF     0.800  0       0.0  0                       
1701    GH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 5f     
1702    GH 2D1515       516.9     0.     646.1 FIXEDHF     0.800  0       0.0  0                       
1703    GH 4D1515       110.3     0.     137.9 FIXEDHF     0.800  0       0.0  0                       
1704    GH 1E1515        77.2     0.      96.5 FIXEDHF     0.800  0       0.0  0                       
1705    GH 3E1515        44.0     0.      55.0 FIXEDHF     0.800  0       0.0  0                       
1706    GH 5E1515        30.1     0.      37.6 FIXEDHF     0.800  0       0.0  0                       
1707    GI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 6f     
1708    GI 2D1515       367.1     0.     458.9 FIXEDHF     0.800  0       0.0  0                       
1709    GI 4D1515        87.0     0.     108.7 FIXEDHF     0.800  0       0.0  0                       
1710    GI 1E1515        65.3     0.      81.6 FIXEDHF     0.800  0       0.0  0                       
1711    GI 3E1515        37.2     0.      46.5 FIXEDHF     0.800  0       0.0  0                       
1712    GI 5E1515        25.4     0.      31.8 FIXEDHF     0.800  0       0.0  0                       
1713    GJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 7f     
1714    GJ 2D1515       281.0     0.     351.3 FIXEDHF     0.800  0       0.0  0                       
1715    GJ 4D1515        70.3     0.      87.9 FIXEDHF     0.800  0       0.0  0                       
1716    GJ 1E1515        55.0     0.      68.7 FIXEDHF     0.800  0       0.0  0                       
1717    GJ 3E1515        31.4     0.      39.2 FIXEDHF     0.800  0       0.0  0                       
1718    GJ 5E1515        21.4     0.      26.8 FIXEDHF     0.800  0       0.0  0                       
1719    GK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 8f     
1720    GK 2D1515       225.0     0.     281.3 FIXEDHF     0.800  0       0.0  0                       
1721    GK 4D1515        58.3     0.      72.9 FIXEDHF     0.800  0       0.0  0                       
1722    GK 1E1515        46.7     0.      58.4 FIXEDHF     0.800  0       0.0  0                       
1723    GK 3E1515        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0                       
1724    GK 5E1515        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0                       
1725    GL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 9f     
1726    GL 2D1515       185.9     0.     232.4 FIXEDHF     0.800  0       0.0  0                       
1727    GL 4D1515        49.3     0.      61.6 FIXEDHF     0.800  0       0.0  0                       
1728    GL 1E1515        40.2     0.      50.2 FIXEDHF     0.800  0       0.0  0                       
1729    GL 3E1515        22.9     0.      28.6 FIXEDHF     0.800  0       0.0  0                       
1730    GL 5E1515        15.7     0.      19.6 FIXEDHF     0.800  0       0.0  0                       
1731    GM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 10f    
1732    GM 2D1515       157.2     0.     196.5 FIXEDHF     0.800  0       0.0  0                       
1733    GM 4D1515        42.3     0.      52.9 FIXEDHF     0.800  0       0.0  0                       
1734    GM 1E1515        35.0     0.      43.7 FIXEDHF     0.800  0       0.0  0                       
1735    GM 3E1515        19.9     0.      24.9 FIXEDHF     0.800  0       0.0  0                       
1736    GM 5E1515        13.6     0.      17.0 FIXEDHF     0.800  0       0.0  0                       
1737    GN 2D1112     -1088.8     0.   -1361.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s4f   
1738    GN 2D1525     -1220.6     0.   -1525.8 FIXEDHF     0.800  0       0.0  0                       
1739    GN 3E1525      -187.2     0.    -234.0 FIXEDHF     0.800  0       0.0  0                       
1740    GO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s5f   
1741    GO 2D1525      -713.4     0.    -891.7 FIXEDHF     0.800  0       0.0  0                       
1742    GO 3E1525      -171.8     0.    -214.7 FIXEDHF     0.800  0       0.0  0                       
1743    GP 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s6f   
1744    GP 2D1525      -498.9     0.    -623.6 FIXEDHF     0.800  0       0.0  0                       
1745    GP 3E1525      -145.1     0.    -181.4 FIXEDHF     0.800  0       0.0  0                       
1746    GQ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s7f   
1747    GQ 2D1525      -376.2     0.    -470.2 FIXEDHF     0.800  0       0.0  0                       
1748    GQ 3E1525      -121.7     0.    -152.1 FIXEDHF     0.800  0       0.0  0                       
1749    GR 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s8f   
1750    GR 2D1525      -297.3     0.    -371.6 FIXEDHF     0.800  0       0.0  0                       
1751    GR 3E1525      -102.9     0.    -128.6 FIXEDHF     0.800  0       0.0  0                       
1752    GS 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s9f   
1753    GS 2D1525      -242.7     0.    -303.4 FIXEDHF     0.800  0       0.0  0                       
1754    GS 3E1525       -87.9     0.    -109.9 FIXEDHF     0.800  0       0.0  0                       
1755    GT 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s10f  
1756    GT 2D1525      -203.1     0.    -253.9 FIXEDHF     0.800  0       0.0  0                       
1757    GT 3E1525       -76.1     0.     -95.1 FIXEDHF     0.800  0       0.0  0                       
1758    GU 2D1516       100.3     0.     125.4 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 6h     
1759    GU 4D1516         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0                       
1760    GU 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1761    GU 5E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1762    GV 2D1516        97.6     0.     122.0 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 7h     
1763    GV 4D1516         6.6     0.       8.3 FIXEDHF     0.800  0       0.0  0                       
1764    GV 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1765    GV 5E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1766    GW 2D1516        87.1     0.     108.9 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 8h     
1767    GW 4D1516         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0                       
1768    GW 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1769    GW 5E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1770    GX 2D1516        76.6     0.      95.7 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 9h     
1771    GX 4D1516         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0                       
1772    GX 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1773    GX 5E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1774    GY 2D1526      -140.2     0.    -175.2 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s6h   
1775    GY 3E1526        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
1776    GZ 2D1526      -136.4     0.    -170.5 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s7h   
1777    GZ 3E1526        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
1778    Ga 2D1526      -121.8     0.    -152.3 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s8h   
1779    Ga 3E1526        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
1780    Gb 2D1526      -107.1     0.    -133.9 FIXEDHF     0.800  0       0.0  0  d5 4f     -d4 4s9h   
1781    Gb 3E1526        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1782    Gc 4D1517         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 8k     
1783    Gc 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1784    Gd 4D1517         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  d5 4f     -d5 9k     
1785    Gd 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1786    HI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 6f     
1787    HI 2D1515       327.5     0.     409.4 FIXEDHF     0.800  0       0.0  0                       
1788    HI 4D1515        74.6     0.      93.2 FIXEDHF     0.800  0       0.0  0                       
1789    HI 1E1515        59.4     0.      74.3 FIXEDHF     0.800  0       0.0  0                       
1790    HI 3E1515        33.9     0.      42.4 FIXEDHF     0.800  0       0.0  0                       
1791    HI 5E1515        23.2     0.      29.0 FIXEDHF     0.800  0       0.0  0                       
1792    HJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 7f     
1793    HJ 2D1515       252.1     0.     315.1 FIXEDHF     0.800  0       0.0  0                       
1794    HJ 4D1515        60.9     0.      76.1 FIXEDHF     0.800  0       0.0  0                       
1795    HJ 1E1515        50.1     0.      62.6 FIXEDHF     0.800  0       0.0  0                       
1796    HJ 3E1515        28.6     0.      35.8 FIXEDHF     0.800  0       0.0  0                       
1797    HJ 5E1515        19.6     0.      24.5 FIXEDHF     0.800  0       0.0  0                       
1798    HK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 8f     
1799    HK 2D1515       202.6     0.     253.3 FIXEDHF     0.800  0       0.0  0                       
1800    HK 4D1515        50.7     0.      63.4 FIXEDHF     0.800  0       0.0  0                       
1801    HK 1E1515        42.6     0.      53.2 FIXEDHF     0.800  0       0.0  0                       
1802    HK 3E1515        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0                       
1803    HK 5E1515        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0                       
1804    HL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 9f     
1805    HL 2D1515       167.8     0.     209.8 FIXEDHF     0.800  0       0.0  0                       
1806    HL 4D1515        43.0     0.      53.8 FIXEDHF     0.800  0       0.0  0                       
1807    HL 1E1515        36.6     0.      45.8 FIXEDHF     0.800  0       0.0  0                       
1808    HL 3E1515        21.0     0.      26.2 FIXEDHF     0.800  0       0.0  0                       
1809    HL 5E1515        14.3     0.      17.9 FIXEDHF     0.800  0       0.0  0                       
1810    HM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 10f    
1811    HM 2D1515       142.2     0.     177.7 FIXEDHF     0.800  0       0.0  0                       
1812    HM 4D1515        37.0     0.      46.3 FIXEDHF     0.800  0       0.0  0                       
1813    HM 1E1515        31.8     0.      39.8 FIXEDHF     0.800  0       0.0  0                       
1814    HM 3E1515        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0                       
1815    HM 5E1515        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0                       
1816    HN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s4f   
1817    HN 2D1525      -722.5     0.    -903.1 FIXEDHF     0.800  0       0.0  0                       
1818    HN 3E1525      -163.2     0.    -204.0 FIXEDHF     0.800  0       0.0  0                       
1819    HO 2D1112     -1089.8     0.   -1362.3 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s5f   
1820    HO 2D1525      -646.6     0.    -808.3 FIXEDHF     0.800  0       0.0  0                       
1821    HO 3E1525      -150.3     0.    -187.9 FIXEDHF     0.800  0       0.0  0                       
1822    HP 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s6f   
1823    HP 2D1525      -451.4     0.    -564.2 FIXEDHF     0.800  0       0.0  0                       
1824    HP 3E1525      -127.4     0.    -159.2 FIXEDHF     0.800  0       0.0  0                       
1825    HQ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s7f   
1826    HQ 2D1525      -342.6     0.    -428.2 FIXEDHF     0.800  0       0.0  0                       
1827    HQ 3E1525      -107.0     0.    -133.7 FIXEDHF     0.800  0       0.0  0                       
1828    HR 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s8f   
1829    HR 2D1525      -272.0     0.    -340.0 FIXEDHF     0.800  0       0.0  0                       
1830    HR 3E1525       -90.5     0.    -113.1 FIXEDHF     0.800  0       0.0  0                       
1831    HS 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s9f   
1832    HS 2D1525      -223.0     0.    -278.7 FIXEDHF     0.800  0       0.0  0                       
1833    HS 3E1525       -77.4     0.     -96.7 FIXEDHF     0.800  0       0.0  0                       
1834    HT 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s10f  
1835    HT 2D1525      -187.1     0.    -233.9 FIXEDHF     0.800  0       0.0  0                       
1836    HT 3E1525       -67.0     0.     -83.7 FIXEDHF     0.800  0       0.0  0                       
1837    HU 2D1516       -24.5     0.     -30.6 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 6h     
1838    HU 4D1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0                       
1839    HU 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1840    HU 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1841    HV 2D1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 7h     
1842    HV 4D1516         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0                       
1843    HV 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1844    HV 5E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1845    HW 2D1516        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 8h     
1846    HW 4D1516         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0                       
1847    HW 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1848    HW 5E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1849    HX 2D1516        15.8     0.      19.8 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 9h     
1850    HX 4D1516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0                       
1851    HX 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1852    HX 5E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1853    HY 2D1526        34.4     0.      43.0 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s6h   
1854    HY 3E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1855    HZ 2D1526        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s7h   
1856    HZ 3E1526        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1857    Ha 2D1526       -17.4     0.     -21.7 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s8h   
1858    Ha 3E1526        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1859    Hb 2D1526       -22.1     0.     -27.6 FIXEDHF     0.800  0       0.0  0  d5 5f     -d4 4s9h   
1860    Hb 3E1526        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
1861    Hc 4D1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 8k     
1862    Hc 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1863    Hd 4D1517        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 5f     -d5 9k     
1864    Hd 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1865    IJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d5 7f     
1866    IJ 2D1515       210.0     0.     262.5 FIXEDHF     0.800  0       0.0  0                       
1867    IJ 4D1515        49.9     0.      62.4 FIXEDHF     0.800  0       0.0  0                       
1868    IJ 1E1515        42.4     0.      53.0 FIXEDHF     0.800  0       0.0  0                       
1869    IJ 3E1515        24.2     0.      30.3 FIXEDHF     0.800  0       0.0  0                       
1870    IJ 5E1515        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0                       
1871    IK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d5 8f     
1872    IK 2D1515       169.2     0.     211.5 FIXEDHF     0.800  0       0.0  0                       
1873    IK 4D1515        41.8     0.      52.2 FIXEDHF     0.800  0       0.0  0                       
1874    IK 1E1515        36.1     0.      45.1 FIXEDHF     0.800  0       0.0  0                       
1875    IK 3E1515        20.6     0.      25.8 FIXEDHF     0.800  0       0.0  0                       
1876    IK 5E1515        14.2     0.      17.7 FIXEDHF     0.800  0       0.0  0                       
1877    IL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d5 9f     
1878    IL 2D1515       140.4     0.     175.5 FIXEDHF     0.800  0       0.0  0                       
1879    IL 4D1515        35.4     0.      44.3 FIXEDHF     0.800  0       0.0  0                       
1880    IL 1E1515        31.0     0.      38.8 FIXEDHF     0.800  0       0.0  0                       
1881    IL 3E1515        17.8     0.      22.2 FIXEDHF     0.800  0       0.0  0                       
1882    IL 5E1515        12.2     0.      15.2 FIXEDHF     0.800  0       0.0  0                       
1883    IM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d5 10f    
1884    IM 2D1515       119.1     0.     148.9 FIXEDHF     0.800  0       0.0  0                       
1885    IM 4D1515        30.6     0.      38.2 FIXEDHF     0.800  0       0.0  0                       
1886    IM 1E1515        27.0     0.      33.7 FIXEDHF     0.800  0       0.0  0                       
1887    IM 3E1515        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0                       
1888    IM 5E1515        10.6     0.      13.2 FIXEDHF     0.800  0       0.0  0                       
1889    IN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s4f   
1890    IN 2D1525      -511.3     0.    -639.1 FIXEDHF     0.800  0       0.0  0                       
1891    IN 3E1525      -135.0     0.    -168.7 FIXEDHF     0.800  0       0.0  0                       
1892    IO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s5f   
1893    IO 2D1525      -461.0     0.    -576.3 FIXEDHF     0.800  0       0.0  0                       
1894    IO 3E1525      -124.6     0.    -155.8 FIXEDHF     0.800  0       0.0  0                       
1895    IP 2D1112     -1090.2     0.   -1362.8 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s6f   
1896    IP 2D1525      -381.8     0.    -477.2 FIXEDHF     0.800  0       0.0  0                       
1897    IP 3E1525      -105.7     0.    -132.1 FIXEDHF     0.800  0       0.0  0                       
1898    IQ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s7f   
1899    IQ 2D1525      -288.5     0.    -360.6 FIXEDHF     0.800  0       0.0  0                       
1900    IQ 3E1525       -88.8     0.    -111.0 FIXEDHF     0.800  0       0.0  0                       
1901    IR 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s8f   
1902    IR 2D1525      -229.6     0.    -287.0 FIXEDHF     0.800  0       0.0  0                       
1903    IR 3E1525       -75.1     0.     -93.9 FIXEDHF     0.800  0       0.0  0                       
1904    IS 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s9f   
1905    IS 2D1525      -188.6     0.    -235.7 FIXEDHF     0.800  0       0.0  0                       
1906    IS 3E1525       -64.3     0.     -80.4 FIXEDHF     0.800  0       0.0  0                       
1907    IT 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s10f  
1908    IT 2D1525      -158.6     0.    -198.2 FIXEDHF     0.800  0       0.0  0                       
1909    IT 3E1525       -55.7     0.     -69.6 FIXEDHF     0.800  0       0.0  0                       
1910    IU 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d5 6f     -d5 6h     
1911    IU 4D1516         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
1912    IU 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1913    IU 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1914    IV 2D1516       -11.2     0.     -14.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d5 7h     
1915    IV 4D1516         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0                       
1916    IV 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1917    IV 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1918    IW 2D1516        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0  d5 6f     -d5 8h     
1919    IW 4D1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
1920    IW 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1921    IW 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1922    IX 2D1516        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0  d5 6f     -d5 9h     
1923    IX 4D1516         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0                       
1924    IX 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1925    IX 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1926    IY 2D1526         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s6h   
1927    IY 3E1526        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
1928    IZ 2D1526        15.8     0.      19.7 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s7h   
1929    IZ 3E1526        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
1930    Ia 2D1526         7.2     0.       9.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s8h   
1931    Ia 3E1526        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
1932    Ib 2D1526         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d4 4s9h   
1933    Ib 3E1526        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
1934    Ic 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d5 8k     
1935    Ic 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1936    Id 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6f     -d5 9k     
1937    Id 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1938    JK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d5 8f     
1939    JK 2D1515       140.9     0.     176.1 FIXEDHF     0.800  0       0.0  0                       
1940    JK 4D1515        34.5     0.      43.1 FIXEDHF     0.800  0       0.0  0                       
1941    JK 1E1515        30.4     0.      38.0 FIXEDHF     0.800  0       0.0  0                       
1942    JK 3E1515        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0                       
1943    JK 5E1515        11.9     0.      14.9 FIXEDHF     0.800  0       0.0  0                       
1944    JL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d5 9f     
1945    JL 2D1515       117.0     0.     146.3 FIXEDHF     0.800  0       0.0  0                       
1946    JL 4D1515        29.4     0.      36.7 FIXEDHF     0.800  0       0.0  0                       
1947    JL 1E1515        26.2     0.      32.7 FIXEDHF     0.800  0       0.0  0                       
1948    JL 3E1515        15.0     0.      18.7 FIXEDHF     0.800  0       0.0  0                       
1949    JL 5E1515        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0                       
1950    JM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d5 10f    
1951    JM 2D1515        99.4     0.     124.2 FIXEDHF     0.800  0       0.0  0                       
1952    JM 4D1515        25.4     0.      31.7 FIXEDHF     0.800  0       0.0  0                       
1953    JM 1E1515        22.8     0.      28.5 FIXEDHF     0.800  0       0.0  0                       
1954    JM 3E1515        13.0     0.      16.3 FIXEDHF     0.800  0       0.0  0                       
1955    JM 5E1515         9.0     0.      11.2 FIXEDHF     0.800  0       0.0  0                       
1956    JN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s4f   
1957    JN 2D1525      -390.2     0.    -487.8 FIXEDHF     0.800  0       0.0  0                       
1958    JN 3E1525      -112.1     0.    -140.1 FIXEDHF     0.800  0       0.0  0                       
1959    JO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s5f   
1960    JO 2D1525      -355.0     0.    -443.7 FIXEDHF     0.800  0       0.0  0                       
1961    JO 3E1525      -103.7     0.    -129.6 FIXEDHF     0.800  0       0.0  0                       
1962    JP 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s6f   
1963    JP 2D1525      -294.7     0.    -368.4 FIXEDHF     0.800  0       0.0  0                       
1964    JP 3E1525       -88.0     0.    -110.0 FIXEDHF     0.800  0       0.0  0                       
1965    JQ 2D1112     -1090.2     0.   -1362.8 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s7f   
1966    JQ 2D1525      -243.1     0.    -303.9 FIXEDHF     0.800  0       0.0  0                       
1967    JQ 3E1525       -73.9     0.     -92.4 FIXEDHF     0.800  0       0.0  0                       
1968    JR 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s8f   
1969    JR 2D1525      -192.7     0.    -240.9 FIXEDHF     0.800  0       0.0  0                       
1970    JR 3E1525       -62.6     0.     -78.2 FIXEDHF     0.800  0       0.0  0                       
1971    JS 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s9f   
1972    JS 2D1525      -158.4     0.    -198.0 FIXEDHF     0.800  0       0.0  0                       
1973    JS 3E1525       -53.6     0.     -67.0 FIXEDHF     0.800  0       0.0  0                       
1974    JT 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s10f  
1975    JT 2D1525      -133.3     0.    -166.6 FIXEDHF     0.800  0       0.0  0                       
1976    JT 3E1525       -46.4     0.     -58.0 FIXEDHF     0.800  0       0.0  0                       
1977    JU 2D1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d5 7f     -d5 6h     
1978    JU 4D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1979    JU 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1980    JU 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
1981    JV 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d5 7f     -d5 7h     
1982    JV 4D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
1983    JV 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1984    JV 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1985    JW 2D1516        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0  d5 7f     -d5 8h     
1986    JW 4D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
1987    JW 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1988    JW 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1989    JX 2D1516        -3.9     0.      -4.9 FIXEDHF     0.800  0       0.0  0  d5 7f     -d5 9h     
1990    JX 4D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
1991    JX 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1992    JX 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1993    JY 2D1526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s6h   
1994    JY 3E1526        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1995    JZ 2D1526         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s7h   
1996    JZ 3E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1997    Ja 2D1526         7.4     0.       9.3 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s8h   
1998    Ja 3E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1999    Jb 2D1526         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  d5 7f     -d4 4s9h   
2000    Jb 3E1526        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2001    Jc 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d5 8k     
2002    Jc 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2003    Jd 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7f     -d5 9k     
2004    Jd 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2005    KL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d5 9f     
2006    KL 2D1515        98.6     0.     123.2 FIXEDHF     0.800  0       0.0  0                       
2007    KL 4D1515        24.6     0.      30.8 FIXEDHF     0.800  0       0.0  0                       
2008    KL 1E1515        22.2     0.      27.8 FIXEDHF     0.800  0       0.0  0                       
2009    KL 3E1515        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0                       
2010    KL 5E1515         8.7     0.      10.9 FIXEDHF     0.800  0       0.0  0                       
2011    KM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d5 10f    
2012    KM 2D1515        83.8     0.     104.7 FIXEDHF     0.800  0       0.0  0                       
2013    KM 4D1515        21.3     0.      26.6 FIXEDHF     0.800  0       0.0  0                       
2014    KM 1E1515        19.4     0.      24.2 FIXEDHF     0.800  0       0.0  0                       
2015    KM 3E1515        11.1     0.      13.9 FIXEDHF     0.800  0       0.0  0                       
2016    KM 5E1515         7.6     0.       9.5 FIXEDHF     0.800  0       0.0  0                       
2017    KN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s4f   
2018    KN 2D1525      -311.9     0.    -389.9 FIXEDHF     0.800  0       0.0  0                       
2019    KN 3E1525       -94.4     0.    -118.0 FIXEDHF     0.800  0       0.0  0                       
2020    KO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s5f   
2021    KO 2D1525      -285.3     0.    -356.6 FIXEDHF     0.800  0       0.0  0                       
2022    KO 3E1525       -87.4     0.    -109.2 FIXEDHF     0.800  0       0.0  0                       
2023    KP 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s6f   
2024    KP 2D1525      -237.9     0.    -297.4 FIXEDHF     0.800  0       0.0  0                       
2025    KP 3E1525       -74.2     0.     -92.7 FIXEDHF     0.800  0       0.0  0                       
2026    KQ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s7f   
2027    KQ 2D1525      -196.4     0.    -245.5 FIXEDHF     0.800  0       0.0  0                       
2028    KQ 3E1525       -62.4     0.     -78.0 FIXEDHF     0.800  0       0.0  0                       
2029    KR 2D1112     -1090.2     0.   -1362.8 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s8f   
2030    KR 2D1525      -163.9     0.    -204.9 FIXEDHF     0.800  0       0.0  0                       
2031    KR 3E1525       -52.8     0.     -66.0 FIXEDHF     0.800  0       0.0  0                       
2032    KS 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s9f   
2033    KS 2D1525      -134.2     0.    -167.8 FIXEDHF     0.800  0       0.0  0                       
2034    KS 3E1525       -45.2     0.     -56.5 FIXEDHF     0.800  0       0.0  0                       
2035    KT 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s10f  
2036    KT 2D1525      -113.0     0.    -141.3 FIXEDHF     0.800  0       0.0  0                       
2037    KT 3E1525       -39.1     0.     -48.9 FIXEDHF     0.800  0       0.0  0                       
2038    KU 2D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  d5 8f     -d5 6h     
2039    KU 4D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2040    KU 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2041    KU 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2042    KV 2D1516         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d5 7h     
2043    KV 4D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
2044    KV 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2045    KV 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2046    KW 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d5 8f     -d5 8h     
2047    KW 4D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
2048    KW 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2049    KW 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2050    KX 2D1516        -2.7     0.      -3.4 FIXEDHF     0.800  0       0.0  0  d5 8f     -d5 9h     
2051    KX 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
2052    KX 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2053    KX 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2054    KY 2D1526        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s6h   
2055    KY 3E1526        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2056    KZ 2D1526         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s7h   
2057    KZ 3E1526        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2058    Ka 2D1526         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s8h   
2059    Ka 3E1526        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2060    Kb 2D1526         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0  d5 8f     -d4 4s9h   
2061    Kb 3E1526        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
2062    Kc 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d5 8k     
2063    Kc 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2064    Kd 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8f     -d5 9k     
2065    Kd 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2066    LM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9f     -d5 10f    
2067    LM 2D1515        71.5     0.      89.4 FIXEDHF     0.800  0       0.0  0                       
2068    LM 4D1515        18.2     0.      22.7 FIXEDHF     0.800  0       0.0  0                       
2069    LM 1E1515        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0                       
2070    LM 3E1515         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0                       
2071    LM 5E1515         6.6     0.       8.2 FIXEDHF     0.800  0       0.0  0                       
2072    LN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s4f   
2073    LN 2D1525      -257.3     0.    -321.6 FIXEDHF     0.800  0       0.0  0                       
2074    LN 3E1525       -80.6     0.    -100.8 FIXEDHF     0.800  0       0.0  0                       
2075    LO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s5f   
2076    LO 2D1525      -236.2     0.    -295.3 FIXEDHF     0.800  0       0.0  0                       
2077    LO 3E1525       -74.7     0.     -93.4 FIXEDHF     0.800  0       0.0  0                       
2078    LP 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s6f   
2079    LP 2D1525      -197.6     0.    -247.0 FIXEDHF     0.800  0       0.0  0                       
2080    LP 3E1525       -63.4     0.     -79.3 FIXEDHF     0.800  0       0.0  0                       
2081    LQ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s7f   
2082    LQ 2D1525      -163.5     0.    -204.4 FIXEDHF     0.800  0       0.0  0                       
2083    LQ 3E1525       -53.4     0.     -66.7 FIXEDHF     0.800  0       0.0  0                       
2084    LR 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s8f   
2085    LR 2D1525      -136.5     0.    -170.6 FIXEDHF     0.800  0       0.0  0                       
2086    LR 3E1525       -45.2     0.     -56.5 FIXEDHF     0.800  0       0.0  0                       
2087    LS 2D1112     -1090.2     0.   -1362.7 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s9f   
2088    LS 2D1525      -115.5     0.    -144.4 FIXEDHF     0.800  0       0.0  0                       
2089    LS 3E1525       -38.6     0.     -48.3 FIXEDHF     0.800  0       0.0  0                       
2090    LT 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s10f  
2091    LT 2D1525       -97.0     0.    -121.2 FIXEDHF     0.800  0       0.0  0                       
2092    LT 3E1525       -33.5     0.     -41.9 FIXEDHF     0.800  0       0.0  0                       
2093    LU 2D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  d5 9f     -d5 6h     
2094    LU 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2095    LU 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2096    LU 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2097    LV 2D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d5 9f     -d5 7h     
2098    LV 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2099    LV 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2100    LV 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2101    LW 2D1516        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d5 9f     -d5 8h     
2102    LW 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2103    LW 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2104    LW 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2105    LX 2D1516        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 9f     -d5 9h     
2106    LX 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2107    LX 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2108    LX 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2109    LY 2D1526        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s6h   
2110    LY 3E1526        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2111    LZ 2D1526        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s7h   
2112    LZ 3E1526        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2113    La 2D1526         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s8h   
2114    La 3E1526        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2115    Lb 2D1526         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0  d5 9f     -d4 4s9h   
2116    Lb 3E1526        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2117    Lc 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9f     -d5 8k     
2118    Lc 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2119    Ld 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9f     -d5 9k     
2120    Ld 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2121    MN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s4f   
2122    MN 2D1525      -217.2     0.    -271.5 FIXEDHF     0.800  0       0.0  0                       
2123    MN 3E1525       -69.8     0.     -87.3 FIXEDHF     0.800  0       0.0  0                       
2124    MO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s5f   
2125    MO 2D1525      -200.0     0.    -250.0 FIXEDHF     0.800  0       0.0  0                       
2126    MO 3E1525       -64.7     0.     -80.9 FIXEDHF     0.800  0       0.0  0                       
2127    MP 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s6f   
2128    MP 2D1525      -167.7     0.    -209.6 FIXEDHF     0.800  0       0.0  0                       
2129    MP 3E1525       -55.0     0.     -68.7 FIXEDHF     0.800  0       0.0  0                       
2130    MQ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s7f   
2131    MQ 2D1525      -139.0     0.    -173.8 FIXEDHF     0.800  0       0.0  0                       
2132    MQ 3E1525       -46.2     0.     -57.8 FIXEDHF     0.800  0       0.0  0                       
2133    MR 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s8f   
2134    MR 2D1525      -116.2     0.    -145.2 FIXEDHF     0.800  0       0.0  0                       
2135    MR 3E1525       -39.2     0.     -49.0 FIXEDHF     0.800  0       0.0  0                       
2136    MS 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s9f   
2137    MS 2D1525       -98.3     0.    -122.9 FIXEDHF     0.800  0       0.0  0                       
2138    MS 3E1525       -33.5     0.     -41.9 FIXEDHF     0.800  0       0.0  0                       
2139    MT 2D1112     -1090.1     0.   -1362.6 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s10f  
2140    MT 2D1525       -84.4     0.    -105.5 FIXEDHF     0.800  0       0.0  0                       
2141    MT 3E1525       -29.0     0.     -36.3 FIXEDHF     0.800  0       0.0  0                       
2142    MU 2D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  d5 10f    -d5 6h     
2143    MU 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2144    MU 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2145    MU 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2146    MV 2D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d5 10f    -d5 7h     
2147    MV 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2148    MV 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2149    MV 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2150    MW 2D1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d5 10f    -d5 8h     
2151    MW 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2152    MW 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2153    MW 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2154    MX 2D1516        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d5 10f    -d5 9h     
2155    MX 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2156    MX 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2157    MX 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2158    MY 2D1526        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s6h   
2159    MY 3E1526        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2160    MZ 2D1526        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s7h   
2161    MZ 3E1526        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2162    Ma 2D1526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s8h   
2163    Ma 3E1526        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2164    Mb 2D1526         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d5 10f    -d4 4s9h   
2165    Mb 3E1526        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2166    Mc 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10f    -d5 8k     
2167    Mc 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2168    Md 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 10f    -d5 9k     
2169    Md 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2170    NO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s5f   
2171    NO 2D1515       509.8     0.     637.3 FIXEDHF     0.800  0       0.0  0                       
2172    NO 4D1515       104.4     0.     130.5 FIXEDHF     0.800  0       0.0  0                       
2173    NO 1E1515        73.2     0.      91.5 FIXEDHF     0.800  0       0.0  0                       
2174    NO 3E1515        41.6     0.      52.0 FIXEDHF     0.800  0       0.0  0                       
2175    NO 5E1515        28.4     0.      35.5 FIXEDHF     0.800  0       0.0  0                       
2176    NO 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2177    NO 3E2525       762.6     0.     953.3 FIXEDHF     0.800  0       0.0  0                       
2178    NP 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s6f   
2179    NP 2D1515       367.8     0.     459.7 FIXEDHF     0.800  0       0.0  0                       
2180    NP 4D1515        84.5     0.     105.6 FIXEDHF     0.800  0       0.0  0                       
2181    NP 1E1515        63.5     0.      79.4 FIXEDHF     0.800  0       0.0  0                       
2182    NP 3E1515        36.2     0.      45.2 FIXEDHF     0.800  0       0.0  0                       
2183    NP 5E1515        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0                       
2184    NP 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2185    NP 3E2525       627.0     0.     783.8 FIXEDHF     0.800  0       0.0  0                       
2186    NQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s7f   
2187    NQ 2D1515       282.8     0.     353.5 FIXEDHF     0.800  0       0.0  0                       
2188    NQ 4D1515        69.1     0.      86.4 FIXEDHF     0.800  0       0.0  0                       
2189    NQ 1E1515        54.1     0.      67.6 FIXEDHF     0.800  0       0.0  0                       
2190    NQ 3E1515        30.8     0.      38.5 FIXEDHF     0.800  0       0.0  0                       
2191    NQ 5E1515        21.0     0.      26.3 FIXEDHF     0.800  0       0.0  0                       
2192    NQ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2193    NQ 3E2525       516.9     0.     646.1 FIXEDHF     0.800  0       0.0  0                       
2194    NR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s8f   
2195    NR 2D1515       226.4     0.     283.0 FIXEDHF     0.800  0       0.0  0                       
2196    NR 4D1515        57.5     0.      71.9 FIXEDHF     0.800  0       0.0  0                       
2197    NR 1E1515        46.2     0.      57.7 FIXEDHF     0.800  0       0.0  0                       
2198    NR 3E1515        26.2     0.      32.8 FIXEDHF     0.800  0       0.0  0                       
2199    NR 5E1515        18.0     0.      22.5 FIXEDHF     0.800  0       0.0  0                       
2200    NR 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2201    NR 3E2525       431.9     0.     539.9 FIXEDHF     0.800  0       0.0  0                       
2202    NS 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s9f   
2203    NS 2D1515       186.6     0.     233.3 FIXEDHF     0.800  0       0.0  0                       
2204    NS 4D1515        48.7     0.      60.9 FIXEDHF     0.800  0       0.0  0                       
2205    NS 1E1515        39.8     0.      49.7 FIXEDHF     0.800  0       0.0  0                       
2206    NS 3E1515        22.6     0.      28.3 FIXEDHF     0.800  0       0.0  0                       
2207    NS 5E1515        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0                       
2208    NS 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2209    NS 3E2525       366.4     0.     458.0 FIXEDHF     0.800  0       0.0  0                       
2210    NT 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s10f  
2211    NT 2D1515       157.3     0.     196.6 FIXEDHF     0.800  0       0.0  0                       
2212    NT 4D1515        41.8     0.      52.3 FIXEDHF     0.800  0       0.0  0                       
2213    NT 1E1515        34.6     0.      43.2 FIXEDHF     0.800  0       0.0  0                       
2214    NT 3E1515        19.7     0.      24.6 FIXEDHF     0.800  0       0.0  0                       
2215    NT 5E1515        13.4     0.      16.8 FIXEDHF     0.800  0       0.0  0                       
2216    NT 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2217    NT 3E2525       315.1     0.     393.9 FIXEDHF     0.800  0       0.0  0                       
2218    NU 2D2516      -139.2     0.    -174.0 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d5 6h     
2219    NU 5E2516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
2220    NV 2D2516      -135.8     0.    -169.8 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d5 7h     
2221    NV 5E2516        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
2222    NW 2D2516      -121.5     0.    -151.9 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d5 8h     
2223    NW 5E2516        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
2224    NX 2D2516      -106.9     0.    -133.6 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d5 9h     
2225    NX 5E2516        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0                       
2226    NY 2D1516        85.3     0.     106.6 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s6h   
2227    NY 4D1516         4.5     0.       5.6 FIXEDHF     0.800  0       0.0  0                       
2228    NY 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2229    NY 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2230    NZ 2D1516        83.4     0.     104.2 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s7h   
2231    NZ 4D1516         4.8     0.       6.0 FIXEDHF     0.800  0       0.0  0                       
2232    NZ 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2233    NZ 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2234    Na 2D1516        74.6     0.      93.3 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s8h   
2235    Na 4D1516         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0                       
2236    Na 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2237    Na 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2238    Nb 2D1516        65.8     0.      82.2 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s9h   
2239    Nb 4D1516         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0                       
2240    Nb 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2241    Nb 5E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2242    Ne 4D1517         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s8k   
2243    Ne 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2244    Nf 4D1517         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d4 4s4f   -d4 4s9k   
2245    Nf 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2246    OP 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s6f   
2247    OP 2D1515       339.9     0.     424.9 FIXEDHF     0.800  0       0.0  0                       
2248    OP 4D1515        76.4     0.      95.5 FIXEDHF     0.800  0       0.0  0                       
2249    OP 1E1515        61.4     0.      76.7 FIXEDHF     0.800  0       0.0  0                       
2250    OP 3E1515        35.0     0.      43.7 FIXEDHF     0.800  0       0.0  0                       
2251    OP 5E1515        23.9     0.      29.9 FIXEDHF     0.800  0       0.0  0                       
2252    OP 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2253    OP 3E2525       553.8     0.     692.3 FIXEDHF     0.800  0       0.0  0                       
2254    OQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s7f   
2255    OQ 2D1515       263.8     0.     329.8 FIXEDHF     0.800  0       0.0  0                       
2256    OQ 4D1515        63.1     0.      78.9 FIXEDHF     0.800  0       0.0  0                       
2257    OQ 1E1515        52.2     0.      65.3 FIXEDHF     0.800  0       0.0  0                       
2258    OQ 3E1515        29.8     0.      37.3 FIXEDHF     0.800  0       0.0  0                       
2259    OQ 5E1515        20.4     0.      25.5 FIXEDHF     0.800  0       0.0  0                       
2260    OQ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2261    OQ 3E2525       457.7     0.     572.1 FIXEDHF     0.800  0       0.0  0                       
2262    OR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s8f   
2263    OR 2D1515       212.6     0.     265.8 FIXEDHF     0.800  0       0.0  0                       
2264    OR 4D1515        52.8     0.      66.0 FIXEDHF     0.800  0       0.0  0                       
2265    OR 1E1515        44.6     0.      55.8 FIXEDHF     0.800  0       0.0  0                       
2266    OR 3E1515        25.4     0.      31.8 FIXEDHF     0.800  0       0.0  0                       
2267    OR 5E1515        17.4     0.      21.8 FIXEDHF     0.800  0       0.0  0                       
2268    OR 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2269    OR 3E2525       383.1     0.     478.9 FIXEDHF     0.800  0       0.0  0                       
2270    OS 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s9f   
2271    OS 2D1515       176.1     0.     220.1 FIXEDHF     0.800  0       0.0  0                       
2272    OS 4D1515        44.9     0.      56.1 FIXEDHF     0.800  0       0.0  0                       
2273    OS 1E1515        38.4     0.      48.0 FIXEDHF     0.800  0       0.0  0                       
2274    OS 3E1515        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0                       
2275    OS 5E1515        15.0     0.      18.8 FIXEDHF     0.800  0       0.0  0                       
2276    OS 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2277    OS 3E2525       325.4     0.     406.7 FIXEDHF     0.800  0       0.0  0                       
2278    OT 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s10f  
2279    OT 2D1515       148.9     0.     186.1 FIXEDHF     0.800  0       0.0  0                       
2280    OT 4D1515        38.6     0.      48.3 FIXEDHF     0.800  0       0.0  0                       
2281    OT 1E1515        33.4     0.      41.8 FIXEDHF     0.800  0       0.0  0                       
2282    OT 3E1515        19.0     0.      23.8 FIXEDHF     0.800  0       0.0  0                       
2283    OT 5E1515        13.0     0.      16.3 FIXEDHF     0.800  0       0.0  0                       
2284    OT 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2285    OT 3E2525       280.1     0.     350.1 FIXEDHF     0.800  0       0.0  0                       
2286    OU 2D2516        38.0     0.      47.5 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d5 6h     
2287    OU 5E2516        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
2288    OV 2D2516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d5 7h     
2289    OV 5E2516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
2290    OW 2D2516       -13.6     0.     -17.0 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d5 8h     
2291    OW 5E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2292    OX 2D2516       -18.9     0.     -23.6 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d5 9h     
2293    OX 5E2516        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
2294    OY 2D1516       -22.9     0.     -28.6 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s6h   
2295    OY 4D1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
2296    OY 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2297    OY 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2298    OZ 2D1516         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s7h   
2299    OZ 4D1516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
2300    OZ 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2301    OZ 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2302    Oa 2D1516         8.8     0.      11.0 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s8h   
2303    Oa 4D1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0                       
2304    Oa 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2305    Oa 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2306    Ob 2D1516        12.0     0.      15.0 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s9h   
2307    Ob 4D1516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
2308    Ob 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2309    Ob 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2310    Oe 4D1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s8k   
2311    Oe 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2312    Of 4D1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s5f   -d4 4s9k   
2313    Of 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2314    PQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d4 4s7f   
2315    PQ 2D1515       223.2     0.     279.0 FIXEDHF     0.800  0       0.0  0                       
2316    PQ 4D1515        53.0     0.      66.3 FIXEDHF     0.800  0       0.0  0                       
2317    PQ 1E1515        45.4     0.      56.7 FIXEDHF     0.800  0       0.0  0                       
2318    PQ 3E1515        25.9     0.      32.4 FIXEDHF     0.800  0       0.0  0                       
2319    PQ 5E1515        17.8     0.      22.2 FIXEDHF     0.800  0       0.0  0                       
2320    PQ 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2321    PQ 3E2525       379.4     0.     474.2 FIXEDHF     0.800  0       0.0  0                       
2322    PR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d4 4s8f   
2323    PR 2D1515       180.6     0.     225.8 FIXEDHF     0.800  0       0.0  0                       
2324    PR 4D1515        44.6     0.      55.7 FIXEDHF     0.800  0       0.0  0                       
2325    PR 1E1515        38.8     0.      48.5 FIXEDHF     0.800  0       0.0  0                       
2326    PR 3E1515        22.2     0.      27.7 FIXEDHF     0.800  0       0.0  0                       
2327    PR 5E1515        15.2     0.      19.0 FIXEDHF     0.800  0       0.0  0                       
2328    PR 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2329    PR 3E2525       317.8     0.     397.2 FIXEDHF     0.800  0       0.0  0                       
2330    PS 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d4 4s9f   
2331    PS 2D1515       150.0     0.     187.5 FIXEDHF     0.800  0       0.0  0                       
2332    PS 4D1515        37.9     0.      47.4 FIXEDHF     0.800  0       0.0  0                       
2333    PS 1E1515        33.4     0.      41.7 FIXEDHF     0.800  0       0.0  0                       
2334    PS 3E1515        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0                       
2335    PS 5E1515        13.0     0.      16.3 FIXEDHF     0.800  0       0.0  0                       
2336    PS 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2337    PS 3E2525       270.1     0.     337.6 FIXEDHF     0.800  0       0.0  0                       
2338    PT 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d4 4s10f  
2339    PT 2D1515       127.1     0.     158.9 FIXEDHF     0.800  0       0.0  0                       
2340    PT 4D1515        32.6     0.      40.8 FIXEDHF     0.800  0       0.0  0                       
2341    PT 1E1515        29.0     0.      36.3 FIXEDHF     0.800  0       0.0  0                       
2342    PT 3E1515        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0                       
2343    PT 5E1515        11.4     0.      14.2 FIXEDHF     0.800  0       0.0  0                       
2344    PT 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2345    PT 3E2525       232.6     0.     290.7 FIXEDHF     0.800  0       0.0  0                       
2346    PU 2D2516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d5 6h     
2347    PU 5E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2348    PV 2D2516        18.2     0.      22.7 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d5 7h     
2349    PV 5E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2350    PW 2D2516        10.3     0.      12.9 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d5 8h     
2351    PW 5E2516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
2352    PX 2D2516         4.7     0.       5.9 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d5 9h     
2353    PX 5E2516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
2354    PY 2D1516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d4 4s6h   
2355    PY 4D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
2356    PY 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2357    PY 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2358    PZ 2D1516       -10.7     0.     -13.4 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d4 4s7h   
2359    PZ 4D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
2360    PZ 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2361    PZ 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2362    Pa 2D1516        -5.9     0.      -7.4 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d4 4s8h   
2363    Pa 4D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
2364    Pa 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2365    Pa 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2366    Pb 2D1516        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d4 4s9h   
2367    Pb 4D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
2368    Pb 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2369    Pb 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2370    Pe 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d4 4s8k   
2371    Pe 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2372    Pf 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6f   -d4 4s9k   
2373    Pf 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2374    QR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d4 4s8f   
2375    QR 2D1515       151.2     0.     189.0 FIXEDHF     0.800  0       0.0  0                       
2376    QR 4D1515        37.2     0.      46.5 FIXEDHF     0.800  0       0.0  0                       
2377    QR 1E1515        33.0     0.      41.3 FIXEDHF     0.800  0       0.0  0                       
2378    QR 3E1515        18.9     0.      23.6 FIXEDHF     0.800  0       0.0  0                       
2379    QR 5E1515        13.0     0.      16.2 FIXEDHF     0.800  0       0.0  0                       
2380    QR 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2381    QR 3E2525       263.4     0.     329.2 FIXEDHF     0.800  0       0.0  0                       
2382    QS 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d4 4s9f   
2383    QS 2D1515       125.8     0.     157.3 FIXEDHF     0.800  0       0.0  0                       
2384    QS 4D1515        31.8     0.      39.7 FIXEDHF     0.800  0       0.0  0                       
2385    QS 1E1515        28.5     0.      35.6 FIXEDHF     0.800  0       0.0  0                       
2386    QS 3E1515        16.3     0.      20.4 FIXEDHF     0.800  0       0.0  0                       
2387    QS 5E1515        11.1     0.      13.9 FIXEDHF     0.800  0       0.0  0                       
2388    QS 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2389    QS 3E2525       223.8     0.     279.8 FIXEDHF     0.800  0       0.0  0                       
2390    QT 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d4 4s10f  
2391    QT 2D1515       106.8     0.     133.5 FIXEDHF     0.800  0       0.0  0                       
2392    QT 4D1515        27.4     0.      34.2 FIXEDHF     0.800  0       0.0  0                       
2393    QT 1E1515        24.7     0.      30.9 FIXEDHF     0.800  0       0.0  0                       
2394    QT 3E1515        14.2     0.      17.7 FIXEDHF     0.800  0       0.0  0                       
2395    QT 5E1515         9.7     0.      12.1 FIXEDHF     0.800  0       0.0  0                       
2396    QT 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2397    QT 3E2525       192.9     0.     241.1 FIXEDHF     0.800  0       0.0  0                       
2398    QU 2D2516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d5 6h     
2399    QU 5E2516        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
2400    QV 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d5 7h     
2401    QV 5E2516        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
2402    QW 2D2516         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d5 8h     
2403    QW 5E2516        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
2404    QX 2D2516         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d5 9h     
2405    QX 5E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2406    QY 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d4 4s6h   
2407    QY 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2408    QY 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2409    QY 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2410    QZ 2D1516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d4 4s7h   
2411    QZ 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
2412    QZ 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2413    QZ 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2414    Qa 2D1516        -5.2     0.      -6.5 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d4 4s8h   
2415    Qa 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
2416    Qa 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2417    Qa 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2418    Qb 2D1516        -4.2     0.      -5.3 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d4 4s9h   
2419    Qb 4D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2420    Qb 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2421    Qb 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2422    Qe 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d4 4s8k   
2423    Qe 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2424    Qf 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s7f   -d4 4s9k   
2425    Qf 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2426    RS 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d4 4s9f   
2427    RS 2D1515       106.2     0.     132.7 FIXEDHF     0.800  0       0.0  0                       
2428    RS 4D1515        26.8     0.      33.5 FIXEDHF     0.800  0       0.0  0                       
2429    RS 1E1515        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0                       
2430    RS 3E1515        13.9     0.      17.4 FIXEDHF     0.800  0       0.0  0                       
2431    RS 5E1515         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0                       
2432    RS 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2433    RS 3E2525       187.8     0.     234.7 FIXEDHF     0.800  0       0.0  0                       
2434    RT 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d4 4s10f  
2435    RT 2D1515        90.2     0.     112.8 FIXEDHF     0.800  0       0.0  0                       
2436    RT 4D1515        23.1     0.      28.9 FIXEDHF     0.800  0       0.0  0                       
2437    RT 1E1515        21.1     0.      26.4 FIXEDHF     0.800  0       0.0  0                       
2438    RT 3E1515        12.1     0.      15.1 FIXEDHF     0.800  0       0.0  0                       
2439    RT 5E1515         8.3     0.      10.4 FIXEDHF     0.800  0       0.0  0                       
2440    RT 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2441    RT 3E2525       161.8     0.     202.2 FIXEDHF     0.800  0       0.0  0                       
2442    RU 2D2516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d5 6h     
2443    RU 5E2516        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2444    RV 2D2516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d5 7h     
2445    RV 5E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2446    RW 2D2516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d5 8h     
2447    RW 5E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2448    RX 2D2516         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d5 9h     
2449    RX 5E2516        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2450    RY 2D1516        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d4 4s6h   
2451    RY 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2452    RY 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2453    RY 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2454    RZ 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d4 4s7h   
2455    RZ 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2456    RZ 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2457    RZ 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2458    Ra 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d4 4s8h   
2459    Ra 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2460    Ra 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2461    Ra 5E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2462    Rb 2D1516        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d4 4s9h   
2463    Rb 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2464    Rb 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2465    Rb 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2466    Re 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d4 4s8k   
2467    Re 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2468    Rf 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s8f   -d4 4s9k   
2469    Rf 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2470    ST 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d4 4s10f  
2471    ST 2D1515        77.0     0.      96.3 FIXEDHF     0.800  0       0.0  0                       
2472    ST 4D1515        19.8     0.      24.7 FIXEDHF     0.800  0       0.0  0                       
2473    ST 1E1515        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0                       
2474    ST 3E1515        10.4     0.      13.0 FIXEDHF     0.800  0       0.0  0                       
2475    ST 5E1515         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0                       
2476    ST 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2477    ST 3E2525       137.6     0.     172.0 FIXEDHF     0.800  0       0.0  0                       
2478    SU 2D2516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d5 6h     
2479    SU 5E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2480    SV 2D2516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d5 7h     
2481    SV 5E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2482    SW 2D2516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d5 8h     
2483    SW 5E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2484    SX 2D2516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d5 9h     
2485    SX 5E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2486    SY 2D1516        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d4 4s6h   
2487    SY 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2488    SY 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2489    SY 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2490    SZ 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d4 4s7h   
2491    SZ 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2492    SZ 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2493    SZ 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2494    Sa 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d4 4s8h   
2495    Sa 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2496    Sa 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2497    Sa 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2498    Sb 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d4 4s9h   
2499    Sb 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2500    Sb 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2501    Sb 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2502    Se 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d4 4s8k   
2503    Se 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2504    Sf 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s9f   -d4 4s9k   
2505    Sf 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2506    TU 2D2516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d4 4s10f  -d5 6h     
2507    TU 5E2516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2508    TV 2D2516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d4 4s10f  -d5 7h     
2509    TV 5E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2510    TW 2D2516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d4 4s10f  -d5 8h     
2511    TW 5E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2512    TX 2D2516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d4 4s10f  -d5 9h     
2513    TX 5E2516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2514    TY 2D1516        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s10f  -d4 4s6h   
2515    TY 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2516    TY 3E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2517    TY 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2518    TZ 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d4 4s10f  -d4 4s7h   
2519    TZ 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2520    TZ 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2521    TZ 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2522    Ta 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d4 4s10f  -d4 4s8h   
2523    Ta 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2524    Ta 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2525    Ta 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2526    Tb 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d4 4s10f  -d4 4s9h   
2527    Tb 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2528    Tb 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2529    Tb 5E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2530    Te 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s10f  -d4 4s8k   
2531    Te 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2532    Tf 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s10f  -d4 4s9k   
2533    Tf 5E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2534    UV 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6h     -d5 7h     
2535    UV 2D1616        36.4     0.      45.5 FIXEDHF     0.800  0       0.0  0                       
2536    UV 4D1616         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
2537    UV 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2538    UV 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2539    UV 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2540    UW 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6h     -d5 8h     
2541    UW 2D1616        25.6     0.      32.0 FIXEDHF     0.800  0       0.0  0                       
2542    UW 4D1616         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
2543    UW 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2544    UW 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2545    UW 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2546    UX 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6h     -d5 9h     
2547    UX 2D1616        19.6     0.      24.5 FIXEDHF     0.800  0       0.0  0                       
2548    UX 4D1616         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2549    UX 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2550    UX 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2551    UX 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2552    UY 2D1112     -1089.8     0.   -1362.3 FIXEDHF     0.800  0       0.0  0  d5 6h     -d4 4s6h   
2553    UY 2D1626       -89.2     0.    -111.5 FIXEDHF     0.800  0       0.0  0                       
2554    UY 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2555    UZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6h     -d4 4s7h   
2556    UZ 2D1626       -50.9     0.     -63.6 FIXEDHF     0.800  0       0.0  0                       
2557    UZ 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2558    Ua 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6h     -d4 4s8h   
2559    Ua 2D1626       -35.8     0.     -44.7 FIXEDHF     0.800  0       0.0  0                       
2560    Ua 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2561    Ub 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 6h     -d4 4s9h   
2562    Ub 2D1626       -27.4     0.     -34.2 FIXEDHF     0.800  0       0.0  0                       
2563    Ub 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2564    Uc 2D1617        14.5     0.      18.1 FIXEDHF     0.800  0       0.0  0  d5 6h     -d5 8k     
2565    Uc 4D1617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2566    Uc 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2567    Uc 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2568    Ud 2D1617        14.4     0.      18.0 FIXEDHF     0.800  0       0.0  0  d5 6h     -d5 9k     
2569    Ud 4D1617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2570    Ud 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2571    Ud 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2572    Ue 2D1627       -20.2     0.     -25.3 FIXEDHF     0.800  0       0.0  0  d5 6h     -d4 4s8k   
2573    Ue 5E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2574    Uf 2D1627       -20.1     0.     -25.1 FIXEDHF     0.800  0       0.0  0  d5 6h     -d4 4s9k   
2575    Uf 5E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2576    VW 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7h     -d5 8h     
2577    VW 2D1616        28.1     0.      35.1 FIXEDHF     0.800  0       0.0  0                       
2578    VW 4D1616         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
2579    VW 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2580    VW 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2581    VW 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2582    VX 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7h     -d5 9h     
2583    VX 2D1616        21.6     0.      27.0 FIXEDHF     0.800  0       0.0  0                       
2584    VX 4D1616         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2585    VX 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2586    VX 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2587    VX 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2588    VY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7h     -d4 4s6h   
2589    VY 2D1626       -50.8     0.     -63.5 FIXEDHF     0.800  0       0.0  0                       
2590    VY 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2591    VZ 2D1112     -1089.8     0.   -1362.3 FIXEDHF     0.800  0       0.0  0  d5 7h     -d4 4s7h   
2592    VZ 2D1626       -56.2     0.     -70.2 FIXEDHF     0.800  0       0.0  0                       
2593    VZ 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2594    Va 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7h     -d4 4s8h   
2595    Va 2D1626       -39.3     0.     -49.1 FIXEDHF     0.800  0       0.0  0                       
2596    Va 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2597    Vb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 7h     -d4 4s9h   
2598    Vb 2D1626       -30.2     0.     -37.8 FIXEDHF     0.800  0       0.0  0                       
2599    Vb 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2600    Vc 2D1617        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0  d5 7h     -d5 8k     
2601    Vc 4D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2602    Vc 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2603    Vc 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2604    Vd 2D1617         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  d5 7h     -d5 9k     
2605    Vd 4D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2606    Vd 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2607    Vd 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2608    Ve 2D1627         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0  d5 7h     -d4 4s8k   
2609    Ve 5E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2610    Vf 2D1627        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0  d5 7h     -d4 4s9k   
2611    Vf 5E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2612    WX 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8h     -d5 9h     
2613    WX 2D1616        20.6     0.      25.7 FIXEDHF     0.800  0       0.0  0                       
2614    WX 4D1616         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2615    WX 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2616    WX 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2617    WX 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2618    WY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8h     -d4 4s6h   
2619    WY 2D1626       -35.8     0.     -44.7 FIXEDHF     0.800  0       0.0  0                       
2620    WY 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2621    WZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8h     -d4 4s7h   
2622    WZ 2D1626       -39.3     0.     -49.1 FIXEDHF     0.800  0       0.0  0                       
2623    WZ 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2624    Wa 2D1112     -1089.8     0.   -1362.3 FIXEDHF     0.800  0       0.0  0  d5 8h     -d4 4s8h   
2625    Wa 2D1626       -37.6     0.     -47.0 FIXEDHF     0.800  0       0.0  0                       
2626    Wa 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2627    Wb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8h     -d4 4s9h   
2628    Wb 2D1626       -28.8     0.     -36.0 FIXEDHF     0.800  0       0.0  0                       
2629    Wb 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2630    Wc 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8h     -d5 8k     
2631    Wc 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2632    Wc 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2633    Wc 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2634    Wd 2D1617        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0  d5 8h     -d5 9k     
2635    Wd 4D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2636    Wd 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2637    Wd 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2638    We 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8h     -d4 4s8k   
2639    We 5E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2640    Wf 2D1627         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d5 8h     -d4 4s9k   
2641    Wf 5E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2642    XY 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9h     -d4 4s6h   
2643    XY 2D1626       -27.4     0.     -34.2 FIXEDHF     0.800  0       0.0  0                       
2644    XY 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2645    XZ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9h     -d4 4s7h   
2646    XZ 2D1626       -30.2     0.     -37.8 FIXEDHF     0.800  0       0.0  0                       
2647    XZ 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2648    Xa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9h     -d4 4s8h   
2649    Xa 2D1626       -28.8     0.     -36.0 FIXEDHF     0.800  0       0.0  0                       
2650    Xa 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2651    Xb 2D1112     -1089.8     0.   -1362.3 FIXEDHF     0.800  0       0.0  0  d5 9h     -d4 4s9h   
2652    Xb 2D1626       -26.4     0.     -33.0 FIXEDHF     0.800  0       0.0  0                       
2653    Xb 5E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2654    Xc 2D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d5 9h     -d5 8k     
2655    Xc 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2656    Xc 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2657    Xc 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2658    Xd 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9h     -d5 9k     
2659    Xd 4D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2660    Xd 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2661    Xd 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2662    Xe 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d5 9h     -d4 4s8k   
2663    Xe 5E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2664    Xf 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9h     -d4 4s9k   
2665    Xf 5E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2666    YZ 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6h   -d4 4s7h   
2667    YZ 2D1616        31.0     0.      38.8 FIXEDHF     0.800  0       0.0  0                       
2668    YZ 4D1616         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2669    YZ 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2670    YZ 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2671    YZ 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2672    YZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2673    YZ 5E2626         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2674    Ya 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6h   -d4 4s8h   
2675    Ya 2D1616        21.8     0.      27.3 FIXEDHF     0.800  0       0.0  0                       
2676    Ya 4D1616         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2677    Ya 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2678    Ya 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2679    Ya 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2680    Ya 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2681    Ya 5E2626         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2682    Yb 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s6h   -d4 4s9h   
2683    Yb 2D1616        16.7     0.      20.9 FIXEDHF     0.800  0       0.0  0                       
2684    Yb 4D1616         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2685    Yb 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2686    Yb 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2687    Yb 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2688    Yb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2689    Yb 5E2626         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2690    Yc 2D2617       -20.2     0.     -25.3 FIXEDHF     0.800  0       0.0  0  d4 4s6h   -d5 8k     
2691    Yc 7E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2692    Yd 2D2617       -20.1     0.     -25.1 FIXEDHF     0.800  0       0.0  0  d4 4s6h   -d5 9k     
2693    Yd 7E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2694    Ye 2D1617        12.3     0.      15.4 FIXEDHF     0.800  0       0.0  0  d4 4s6h   -d4 4s8k   
2695    Ye 4D1617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2696    Ye 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2697    Ye 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2698    Yf 2D1617        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0  d4 4s6h   -d4 4s9k   
2699    Yf 4D1617         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2700    Yf 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2701    Yf 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2702    Za 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s7h   -d4 4s8h   
2703    Za 2D1616        24.0     0.      30.0 FIXEDHF     0.800  0       0.0  0                       
2704    Za 4D1616         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2705    Za 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2706    Za 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2707    Za 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2708    Za 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2709    Za 5E2626         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2710    Zb 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s7h   -d4 4s9h   
2711    Zb 2D1616        18.5     0.      23.1 FIXEDHF     0.800  0       0.0  0                       
2712    Zb 4D1616         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2713    Zb 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2714    Zb 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2715    Zb 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2716    Zb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2717    Zb 5E2626         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2718    Zc 2D2617         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0  d4 4s7h   -d5 8k     
2719    Zc 7E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2720    Zd 2D2617        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0  d4 4s7h   -d5 9k     
2721    Zd 7E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2722    Ze 2D1617        -2.7     0.      -3.4 FIXEDHF     0.800  0       0.0  0  d4 4s7h   -d4 4s8k   
2723    Ze 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2724    Ze 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2725    Ze 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2726    Zf 2D1617         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0  d4 4s7h   -d4 4s9k   
2727    Zf 4D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2728    Zf 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2729    Zf 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2730    ab 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s8h   -d4 4s9h   
2731    ab 2D1616        17.6     0.      22.0 FIXEDHF     0.800  0       0.0  0                       
2732    ab 4D1616         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2733    ab 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2734    ab 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2735    ab 7E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2736    ab 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2737    ab 5E2626         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2738    ac 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s8h   -d5 8k     
2739    ac 7E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2740    ad 2D2617         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d4 4s8h   -d5 9k     
2741    ad 7E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2742    ae 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s8h   -d4 4s8k   
2743    ae 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2744    ae 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2745    ae 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2746    af 2D1617        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0  d4 4s8h   -d4 4s9k   
2747    af 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2748    af 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2749    af 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2750    bc 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d4 4s9h   -d5 8k     
2751    bc 7E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2752    bd 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s9h   -d5 9k     
2753    bd 7E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2754    be 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s9h   -d4 4s8k   
2755    be 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2756    be 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2757    be 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2758    bf 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s9h   -d4 4s9k   
2759    bf 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2760    bf 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2761    bf 7E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2762    cd 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8k     -d5 9k     
2763    cd 2D1717         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0                       
2764    cd 4D1717         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2765    cd 5E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2766    cd 7E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2767    cd 9E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2768    ce 2D1112     -1089.8     0.   -1362.3 FIXEDHF     0.800  0       0.0  0  d5 8k     -d4 4s8k   
2769    ce 2D1727       -14.8     0.     -18.5 FIXEDHF     0.800  0       0.0  0                       
2770    ce 7E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2771    cf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 8k     -d4 4s9k   
2772    cf 2D1727        -8.1     0.     -10.1 FIXEDHF     0.800  0       0.0  0                       
2773    cf 7E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2774    de 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d5 9k     -d4 4s8k   
2775    de 2D1727        -8.1     0.     -10.1 FIXEDHF     0.800  0       0.0  0                       
2776    de 7E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2777    df 2D1112     -1089.8     0.   -1362.3 FIXEDHF     0.800  0       0.0  0  d5 9k     -d4 4s9k   
2778    df 2D1727       -10.4     0.     -13.0 FIXEDHF     0.800  0       0.0  0                       
2779    df 7E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2780    ef 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d4 4s8k   -d4 4s9k   
2781    ef 2D1717         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0                       
2782    ef 4D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2783    ef 5E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2784    ef 7E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2785    ef 9E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2786    ef 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2787    ef 7E2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
