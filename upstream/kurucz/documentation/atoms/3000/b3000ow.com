$SET def 3000
$SET VERIFY=NOIMAGE
$ASSIGN B3000OW.PUN FOR007
$ASSIGN H3000OW.HAM FOR001
$ASSIGN B3000OW.EIG FOR003
$ASSIGN EAV3000OW.DAT FOR066
$ASSIGN POOLG:B3000O15 FOR015
$ASSIGN POOLG:B3000O16 FOR016
$RUN CRAY:LEAST3007
1 Gullberg, D. and Litzen, U. 2000.  Physica Scripta 61, 652-656,
2 Sugar, J. and Musgrove, A. 1995.  J. Phys. Chem. Ref. Data 24, 1803-1872.
3
4
5
6
7
8
9
    0    0    0    0        .3       1.5
    2  1.         60  150  170  140   90   30   30   20   10   10   10    0
  30.00
4s4p      4s5p      4s6p      4s7p      4s8p      4s9p      4s10p     4s11p
4s12p     4s13p     4s14p     4s15p     5s5p      5s6p      5s7p      d9s2 4p
d9s2 5p   d9s2 6p   d9s2 7p   d9s2 8p   d9s2 9p   d9s2 10p  d9s2 11p  d9s2 12p
d9s2 13p  d9s2 14p  d9s2 15p  4s4f      4s5f      4s6f      4s7f      4s8f
4s9f      4s10f     4s11f     4s12f     4s13f     4s14f     d9s2 4f   d9s2 5f
d9s2 6f   d9s2 7f   d9s2 8f   d9s2 9f   d9s2 10f  d9s2 11f  d9s2 12f  d9s2 13f
d9s2 14f  4p5s      4p6s      4p7s      4p8s      4p9s      4p4d      4p5d
4p6d      4p7d      4p8d      4p9d      d9 4s4p5s
  -1.
   0.      32311.319             4s4p 3P                  4s4p 3P
   0.      61247.904             4s5p 3P                  4s5p 3P
   0.      68070.89              4s6p 3P                  4s6p 3P
   0.      70977.17              4s7p 3P                  4s7p 3P
   0.      72495.82              4s8p 3P                  4s8p 3P
1  0.                            4s9p 3P                  4s9p 3P
1  0.                            4s10p 3P                 4s10p 3P
1  0.                            4s11p 3P                 4s11p 3P
1  0.                            4s12p 3P                 4s12p 3P
1  0.                            4s13p 3P                 4s13p 3P
1  0.                            4s14p 3P                 4s14p 3P
1  0.                            4s15p 3P                 4s15p 3P
1  0.                            3d9.4s2.4p 3P            s2.4p 3P
1  0.                            4p5s 3P                  4p5s 3P
1  0.                            4p4d 3P                  4p4d 3P
1  0.                            4p6s 3P                  4p6s 3P
1  0.                            4p5d 3P                  4p5d 3P
1  0.                            4p7s 3P                  4p7s 3P
1  0.                            4p6d 3P                  4p6d 3P
1  0.                            4p8s 3P                  4p8s 3P
1  0.                            4p7d 3P                  4p7d 3P
1  0.                            4p9s 3P                  4p9s 3P
1  0.                            4p8d 3P                  4p8d 3P
1  0.                            4p9d 3P                  4p9d 3P
1  0.                            3d9.4s2.5p 3P            s2.5p 3P
1  0.                            3d9.4s2.4f 3P            s2.4f 3P
1  0.                            3d9.4s2.6p 3P            s2.6p 3P
1  0.                            3d9.4s2.5f 3P            s2.5f 3P
1  0.                            3d9.4s2.6f 3P            s2.6f 3P
1  0.                            3d9.4s2.7f 3P            s2.7f 3P
1  0.                            3d9.4s2.7p 3P            s2.7p 3P
1  0.                            3d9.4s2.8f 3P            s2.8f 3P
1  0.                            3d9.4s2.9f 3P            s2.9f 3P
1  0.                            3d9.4s2.10f 3P           s2.10f 3P
1  0.                            3d9.4s2.11f 3P           s2.11f 3P
1  0.                            3d9.4s2.12f 3P           s2.12f 3P
1  0.                            3d9.4s2.8p 3P            s2.8p 3P
1  0.                            3d9.4s2.13f 3P           s2.13f 3P
1  0.                            3d9.4s2.14f 3P           s2.14f 3P
1  0.                            3d9.4s2.9p 3P            s2.9p 3P
1  0.                            3d9.4s2.10p 3P           s2.10p 3P
1  0.                            3d9.4s2.11p 3P           s2.11p 3P
1  0.                            3d9.4s2.12p 3P           s2.12p 3P
1  0.                            3d9.4s2.13p 3P           s2.13p 3P
1  0.                            3d9.4s2.14p 3P           s2.14p 3P
1  0.                            3d9.4s2.15p 3P           s2.15p 3P
1  0.                            5s5p 3P                  5s5p 3P
1  0.                            5s6p 3P                  5s6p 3P
1  0.                            3d9.4s4p(3D)5s 3P2       4s4p5s 3P2
1  0.                            5s7p 3P                  5s7p 3P
1  0.                            3d9.4s4p(3D)5s 5D        4s4p5s 5D
1  0.                            3d9.4s4p(1D)5s 3P        4s4p5s 3P
1  0.                            3d9.4s4p(3D)5s 3P1       4s4p5s 3P1
   1.      32501.399     1.496   4s4p 3P                  4s4p 3P
   1.      46745.413             4s4p 1P                  4s4p 1P
   1.      61274.455             4s5p 3P                  4s5p 3P
   1.      62910.45              4s5p 1P                  4s5p 1P
   1.      68080.70              4s6p 3P                  4s6p 3P
   1.      68607.26              4s6p 1P                  4s6p 1P
   1.      70982.00              4s7p 3P                  4s7p 3P
   1.      71219.02              4s7p 1P                  4s7p 1P
   1.      72498.58              4s8p 3P                  4s8p 3P
   1.      72626.32              4s8p 1P                  4s8p 1P
   1.      73392.30              4s9p 3P                  4s9p 3P
   1.      73469.37              4s9p 1P                  4s9p 1P
   1.      73964.33              4s10p 3P                 4s10p 3P
   1.      74013.87              4s10p 1P                 4s10p 1P
   1.      74351.85              4s11p 3P                 4s11p 3P
   1.      74385.80              4s11p 1P                 4s11p 1P
   1.      74626.80              4s12p 3P                 4s12p 3P
   1.      74650.87              4s12p 1P                 4s12p 1P
1  1.                            4s13p 3P                 4s13p 3P
   1.      74846.54              4s13p 1P                 4s13p 1P
1  1.                            4s14p 3P                 4s14p 3P
   1.      74994.99              4s14p 1P                 4s14p 1P
1  1.                            4s15p 3P                 4s15p 3P
   1.      75110.31              4s15p 1P                 4s15p 1P
   1.      90227.                3d9.4s2.4p 3P            s2.4p 3P
   1.      95209.                3d9.4s2.4p 3D            s2.4p 3D
   1.      95792.                3d9.4s2.4p 1P            s2.4p 1P
   1.     101945.                4p5s 3P                  4p5s 3P
1  1.     103001.                4p5s 1P                  4p5s 1P
1  1.                            4p4d 3D                  4p4d 3D
1  1.                            4p4d 3P                  4p4d 3P
   1.     113167.                4p4d 1P                  4p4d 1P
   1.     113949.                4p6s 3P                  4p6s 3P
   1.     114978.                4p6s 1P                  4p6s 1P
   1.     117130.                4p5d 3D                  4p5d 3D
1  1.                            4p5d 3P                  4p5d 3P
   1.     118151.                4p7s 3P                  4p7s 3P
   1.     118437.                4p5d 1P                  4p5d 1P
   1.     119188.                4p7s 1P                  4p7s 1P
   1.     119777.                4p6d 3D                  4p6d 3D
   1.     120301.                4p8s 3P                  4p8s 3P
1  1.                            4p6d 3P                  4p6d 3P
   1.     120745.                4p6d 1P                  4p6d 1P
   1.     121112.                4p7d 3D                  4p7d 3D
   1.     121275.                4p9s 1P                  4p9s 1P
   1.     121480.                4p8s 3P                  4p8s 3P
1  1.                            4p8d 3D                  4p8d 3D
1  1.                            4p7d 3P                  4p7d 3P
1  1.                            4p7d 1P                  4p7d 1P
   1.     122374.                4p9s 1P                  4p9s 1P
   1.     122530.                4p9d 3D                  4p9d 3D
1  1.                            4p9d 3P                  4p9d 3P
1  1.                            4p8d 1P                  4p8d 1P
1  1.                            4p8d 3P                  4p8d 3P
   1.     123470.                3d9.4s2.5p 1P            s2.5p 1P
1  1.                            4p9d 1P                  4p9d 1P
   1.     125934.                3d9.4s2.5p 3P            s2.5p 3P
   1.     126263.                3d9.4s2.5p 3D            s2.5p 3D
   1.     130632.                3d9.4s2.6p 1P            s2.6p 1P
   1.     131540.5               3d9.4s2.4f 3P            s2.4f 3P
   1.     131546.2               3d9.4s2.4f 3D            s2.4f 3D
   1.     133209.8               3d9.4s2.6p 3P            s2.6p 3P
   1.     133336.7               3d9.4s2.6p 3D            s2.6p 3D
   1.     133624.4               3d9.4s2.7p 1P            s2.7p 1P
   1.     134050.7               3d9.4s2.5f 3P            s2.5f 3P
   1.     134050.7               3d9.4s2.5f 3D            s2.5f 3D
   1.     134263.0               3d9.4s2.4f 1P            s2.4f 1P
   1.     135167.5               3d9.4s2.8p 1P            s2.8p 1P
   1.     135409.2               3d9.4s2.6f 3P            s2.6f 3P
   1.     135413.0               3d9.4s2.6f 3D            s2.6f 3D
   1.     136076.8               3d9.4s2.9p 1P            s2.9p 1P
1  1.                            3d9.4s2.7f 3P            s2.7f 3P
   1.     136231.6               3d9.4s2.7f 3D            s2.7f 3D
   1.     136274.6               3d9.4s2.7p 3P            s2.7p 3P
   1.     136333.7               3d9.4s2.7p 3D            s2.7p 3D
   1.     136666.6               3d9.4s2.10p 1P           s2.10p 1P
   1.     136763.7               3d9.4s2.5f 1P            s2.5f 1P
1  1.                            3d9.4s2.8f 3P            s2.8f 3P
   1.     136771.1               3d9.4s2.8f 3D            s2.8f 3F
   1.     137059.6               3d9.4s2.11p 1P           s2.11p 1P
1  1.                            3d9.4s2.9f 3P            s2.9f 3P
   1.     137128.2               3d9.4s2.9f 3D            s2.9f 3D
   1.     137338.9               3d9.4s2.12p 1P           s2.12p 1P
1  1.                            3d9.4s2.10f 3P           s2.10f 3D
   1.     137388.2               3d9.4s2.10f 3D           s2.10f 3D
   1.     137543.2               3d9.4s2.13p 1P           s2.13p 1P
1  1.                            3d9.4s2.11f 3P           s2.11f 3P
   1.     137580.5               3d9.4s2.11f 3D           s2.11f 3D
   1.     137698.0               3d9.4s2.14p 1P           s2.14p 1P
1  1.                            3d9.4s2.12f 3P           s2.12f 3P
   1.     137726.0               3d9.4s2.12f 3D           s2.12f 3D
   1.     137816.3               3d9.4s2.15p 1P           s2.15p 1P
1  1.                            3d9.4s2.13f 3P           s2.13f 3P
1  1.                            3d9.4s2.13f 3D           s2.13f 3D
   1.     137860.2               3d9.4s2.8p 3P            s2.8p 3P
   1.     137891.0               3d9.4s2.8p 3D            s2.8p 3D
1  1.                            3d9.4s2.14f 3P           s2.14f 3P
1  1.                            3d9.4s2.14f 3D           s2.14f 3D
   1.     138132.8               3d9.4s2.6f 1P            s2.6f 1P
   1.     138787.2               3d9.4s2.9p 3P            s2.9p 3P
   1.     138806.1               3d9.4s2.9p 3D            s2.9p 3D
   1.     138955.7               3d9.4s2.7f 1P            s2.7f 1P
   1.     139375.3               3d9.4s2.10p 3P           s2.10p 3P
   1.     139388.7               3d9.4s2.10p 3D           s2.10p 3D
   1.     139486.1               3d9.4s2.8f 1P            s2.8f 1P
   1.     139774.4               3d9.4s2.11p 3P           s2.11p 3P
   1.     139782.4               3d9.4s2.11p 3D           s2.11p 3D
   1.     139850.1               3d9.4s2.9f 1P            s2.9f 1P
   1.     140057.5               3d9.4s2.12p 3P           s2.12p 3P
   1.     140062.1               3d9.4s2.12p 3D           s2.12p 3D
   1.     140111.0               3d9.4s2.10f 1P           s2.10f 1P
   1.     140264.4               3d9.4s2.13p 3P           s2.13p 3P
   1.     140264.4               3d9.4s2.13p 3D           s2.13p 3D
   1.     140305.6               3d9.4s2.11f 1P           s2.11f 1P
   1.     140420.3               3d9.4s2.14p 3P           s2.14p 3P
   1.     140420.3               3d9.4s2.14p 3D           s2.14p 3D
   1.     140449.8               3d9.4s2.12f 1P           s2.12f 1P
   1.     140541.8               3d9.4s2.15p 3P           s2.15p 3P
   1.     140541.8               3d9.4s2.15p 3D           s2.15p 3D
   1.     140564.1               3d9.4s2.13f 1P           s2.13f 1P
   1.     140654.6               3d9.4s2.14f 1P           s2.14f 1P
1  1.                            5s5p 3P                  5s5p 3P
1  1.                            5s5p 1P                  5s5p 1P
1  1.                            5s6p 3P                  5s6p 3P
1  1.                            3d9.4s4p(3D)5s 5P        4s4p5s 5P
1  1.                            5s6p 1P                  5s6p 1P
1  1.                            3d9.4s4p(3D)5s 5F        4s4p5s 5F
1  1.                            3d9.4s4p(3D)5s 3P2       4s4p5s 3P2
1  1.                            5s7p 3P                  5s7p 3P
1  1.                            5s7p 1P                  5s7p 1P
1  1.                            3d9.4s4p(3D)5s 5D        4s4p5s 5D
1  1.                            3d9.4s4p(1D)5s 3D        4s4p5s 3D
1  1.                            3d9.4s4p(1D)5s 3P        4s4p5s 3P
1  1.                            3d9.4s4p(3D)5s 3D2       4s4p5s 3D2
   1.     166418.                3d9.4s4p(1D)5s 1P        4s4p5s 1P
1  1.                            3d9.4s4p(3D)5s 1P1       4s4p5s 1P1
1  1.                            3d9.4s4p(3D)5s 3P1       4s4p5s 3P1
1  1.                            3d9.4s4p(3D)5s 3D1       4s4p5s 3D1
   2.      32890.327     1.505   4s4p 3P                  4s4p 3P
   2.      61330.891             4s5p 3P                  4s5p 3P
   2.      68101.81              4s6p 3P                  4s6p 3P
   2.      68833.79              4s4f 3F                  4s4f 3F
   2.      70992.19              4s7p 3P                  4s7p 3P
   2.      71335.6               4s5f 3F                  4s5f 3F
   2.      72504.23              4s8p 3P                  4s8p 3P
   2.      72690.8               4s6f 3F                  4s6f 3F
   2.      73395.88              4s9p 3P                  4s9p 3P
   2.      73499.5               4s7f 3F                  4s7f 3F
1  2.                            4s10p 3P                 4s10p 3P
1  2.                            4s8f 3F                  4s8f 3F
1  2.                            4s11p 3P                 4s11p 3P
1  2.                            4s9f 3F                  4s9f 3F
1  2.                            4s12p 3P                 4s12p 3P
1  2.                            4s10f 3F                 4s10f 3F
1  2.                            4s13p 3P                 4s13p 3P
1  2.                            4s11f 3F                 4s11f 3F
1  2.                            4s14p 3P                 4s14p 3P
1  2.                            4s12f 3F                 4s12f 3F
1  2.                            4s15p 3P                 4s15p 3P
1  2.                            4s13f 3F                 4s13f 3F
1  2.                            4s14f 3F                 4s14f 3F
1  2.                            3d9.4s2.4p 3P            s2.4p 3P
1  2.                            3d9.4s2.4p 3F            s2.4p 3F
1  2.                            3d9.4s2.4p 1D            s2.4p 1D
1  2.                            3d9.4s2.4p 3D            s2.4p 3D
1  2.                            4p5s 3P                  4p5s 3P
1  2.                            4p4d 1D                  4p4d 1D
1  2.                            4p4d 3F                  4p4d 3F
1  2.                            4p4d 3D                  4p4d 3D
1  2.                            4p4d 3P                  4p4d 3P
1  2.                            4p6s 3P                  4p6s 3P
1  2.                            4p5d 3F                  4p5d 3F
1  2.                            4p5d 3D                  4p5d 3D
1  2.                            4p5d 1D                  4p5d 1D
1  2.                            4p5d 3P                  4p5d 3P
1  2.                            4p7s 3P                  4p7s 3P
1  2.                            4p6d 3F                  4p6d 3F
1  2.                            4p6d 3D                  4p6d 3D
1  2.                            4p6d 1D                  4p6d 1D
1  2.                            4p6d 3P                  4p6d 3P
1  2.                            4p7d 3F                  4p7d 3F
1  2.                            4p7d 3D                  4p7d 3D
1  2.                            4p8s 3P                  4p8s 3P
1  2.                            4p8d 3F                  4p8d 3F
1  2.                            4p8d 3D                  4p8d 3D
1  2.                            4p7d 1D                  4p7d 1D
1  2.                            4p7d 3P                  4p7d 3P
1  2.                            4p9d 3F                  4p9d 3F
1  2.                            4p9d 3D                  4p9d 3D
1  2.                            4p9s 3P                  4p9s 3P
1  2.                            4p8d 1D                  4p8d 1D
1  2.                            4p8d 3P                  4p8d 3P
1  2.                            3d9.4s2.5p 3P            s2.5p 3P
1  2.                            4p9d 1D                  4p9d 1D
1  2.                            4p9d 3P                  4p9d 3P
1  2.                            3d9.4s2.5p 1D            s2.5p 1D
1  2.                            3d9.4s2.5p 3F            s2.5p 3F
1  2.                            3d9.4s2.5p 3D            s2.5p 3D
1  2.                            3d9.4s2.6p 3P            s2.6p 3P
1  2.                            3d9.4s2.6p 1D            s2.6p 1D
1  2.                            3d9.4s2.4f 3D            s2.4f 3D
1  2.                            3d9.4s2.4f 1D            s2.4f 1D
1  2.                            3d9.4s2.6p 3F            s2.6p 3F
1  2.                            3d9.4s2.6p 3D            s2.6p 3D
1  2.                            3d9.4s2.7p 3P            s2.7p 3P
1  2.                            3d9.4s2.7p 1D            s2.7p 1D
1  2.                            3d9.4s2.5f 3D            s2.5f 3D
1  2.                            3d9.4s2.5f 1D            s2.5f 1D
1  2.                            3d9.4s2.4f 3P            s2.4f 3P
1  2.                            3d9.4s2.4f 3F            s2.4f 3F
1  2.                            3d9.4s2.8p 3P            s2.8p 3P
1  2.                            3d9.4s2.8p 1D            s2.8p 1D
1  2.                            3d9.4s2.6f 3D            s2.6f 3D
1  2.                            3d9.4s2.6f 1D            s2.6f 1D
1  2.                            3d9.4s2.9p 3P            s2.9p 3P
1  2.                            3d9.4s2.9p 1D            s2.9p 1D
1  2.                            3d9.4s2.7f 3D            s2.7f 3D
1  2.                            3d9.4s2.7f 1D            s2.7f 1D
1  2.                            3d9.4s2.7p 3F            s2.7p 3F
1  2.                            3d9.4s2.7p 3D            s2.7p 3D
1  2.                            3d9.4s2.10p 3P           s2.10p 3P
1  2.                            3d9.4s2.10p 1D           s2.10p 1D
1  2.                            3d9.4s2.5f 3P            s2.5f 3P
1  2.                            3d9.4s2.5f 3F            s2.5f 3F
1  2.                            3d9.4s2.8f 3D            s2.8f 3D
1  2.                            3d9.4s2.8f 1D            s2.8f 1D
1  2.                            3d9.4s2.11p 3P           s2.11p 3P
1  2.                            3d9.4s2.11p 1D           s2.11p 1D
1  2.                            3d9.4s2.9f 3D            s2.9f 3D
1  2.                            3d9.4s2.9f 1D            s2.9f 1D
1  2.                            3d9.4s2.12p 3P           s2.12p 3P
1  2.                            3d9.4s2.12p 1D           s2.12p 1D
1  2.                            3d0.4s2.10f 3D           s2.10f 3D
1  2.                            3d9.4s2.10f 1D           s2.10f 1D
1  2.                            3d9.4s2.13p 3P           s2.13p 3P
1  2.                            3d9.4s2.13p 1D           s2.13p 1D
1  2.                            3d0.4s2.11f 3D           s2.11f 3D
1  2.                            3d9.4s2.11f 1D           s2.11f 1D
1  2.                            3d9.4s2.14p 3P           s2.14p 3P
1  2.                            3d9.4s2.14p 1D           s2.14p 1D
1  2.                            3d0.4s2.12f 3D           s2.12f 3D
1  2.                            3d9.4s2.12f 1D           s2.12f 1D
1  2.                            3d9.4s2.15p 3P           s2.15p 3P
1  2.                            3d9.4s2.15p 1D           s2.15p 1D
1  2.                            3d0.4s2.13f 3D           s2.13f 3D
1  2.                            3d9.4s2.13f 1D           s2.13f 1D
1  2.                            3d9.4s2.8p 3F            s2.8p 3F
1  2.                            3d9.4s2.8p 3D            s2.8p 3D
1  2.                            3d0.4s2.14f 3D           s2.14f 3D
1  2.                            3d9.4s2.14f 1D           s2.14f 1D
1  2.                            3d9.4s2.6f 3P            s2.6f 3P
1  2.                            3d9.4s2.6f 3F            s2.6f 3F
1  2.                            3d9.4s2.9p 3F            s2.9p 3F
1  2.                            3d9.4s2.9p 3D            s2.9p 3D
1  2.                            3d9.4s2.7f 3P            s2.7f 3P
1  2.                            3d9.4s2.7f 3F            s2.7f 3F
1  2.                            3d9.4s2.10p 3F           s2.10p 3F
1  2.                            3d9.4s2.10p 3D           s2.10p 3D
1  2.                            3d9.4s2.8f 3P            s2.8f 3P
1  2.                            3d9.4s2.8f 3F            s2.8f 3F
1  2.                            3d9.4s2.11p 3F           s2.11p 3F
1  2.                            3d9.4s2.11p 3D           s2.11p 3D
1  2.                            3d9.4s2.9f 3P            s2.9f 3P
1  2.                            3d9.4s2.9f 3F            s2.9f 3F
1  2.                            3d9.4s2.12p 3F           s2.12p 3F
1  2.                            3d9.4s2.12p 3D           s2.12p 3D
1  2.                            3d9.4s2.10f 3P           s2.10f 3P
1  2.                            3d9.4s2.10f 3F           s2.10f 3F
1  2.                            3d9.4s2.13p 3F           s2.13p 3F
1  2.                            3d9.4s2.13p 3D           s2.13p 3D
1  2.                            3d9.4s2.11f 3P           s2.11f 3P
1  2.                            3d9.4s2.11f 3F           s2.11f 3F
1  2.                            3d9.4s2.14p 3F           s2.14p 3F
1  2.                            3d9.4s2.14p 3D           s2.14p 3D
1  2.                            3d9.4s2.12f 3P           s2.12f 3P
1  2.                            3d9.4s2.12f 3F           s2.12f 3F
1  2.                            3d9.4s2.15p 3F           s2.15p 3F
1  2.                            3d9.4s2.15p 3D           s2.15p 3D
1  2.                            3d9.4s2.13f 3P           s2.13f 3P
1  2.                            3d9.4s2.13f 3F           s2.13f 3F
1  2.                            3d9.4s2.14f 3P           s2.14f 3P
1  2.                            3d9.4s2.14f 3F           s2.14f 3F
1  2.                            5s5p 3P                  5s5p 3P
1  2.                            3d9.4s4p(3D)5s 5P        4s4p5s 5P
1  2.                            5s6p 3P                  5s6p 3P
1  2.                            3d9.4s4p(3D)5s 5F        4s4p5s 5F
1  2.                            3d9.4s4p(3D)5s 3P2       4s4p5s 3P2
1  2.                            3d9.4s4p(1D)5s 3F        4s4p5s 3F
1  2.                            5s7p 3P                  5s7p 3P
1  2.                            3d9.4s4p(3D)5s 5D        4s4p5s 5D
1  2.                            3d9.4s4p(3D)5s 3F2       4s4p5s 3F2
1  2.                            3d9.4s4p(1D)5s 3D        4s4p5s 3D
1  2.                            3d9.4s4p(1D)5s 3P        4s4p5s 3P
1  2.                            3d9.4s4p(3D)5s 3D2       4s4p5s 3D2
1  2.                            3d9.4s4p(1D)5s 1D        4s4p5s 1D
1  2.                            3d9.4s4p(3D)5s 3P1       4s4p5s 3P1
1  2.                            3d9.4s4p(3D)5s 3F1       4s4p5s 3F1
1  2.                            3d9.4s4p(3D)5s 1D1       4s4p5s 1D1
1  2.                            3d9.4s4p(3D)5s 3D1       4s4p5s 3D1
   3.      68833.93              4s4f 3F                  4s4f 3F
   3.      68834.65              4s4f 1F                  4s4f 1F
   3.      71335.6               4s5f 3F                  4s5f 3F
   3.      71336.15              4s5f 1F                  4s5f 1F
   3.      72690.8               4s6f 3F                  4s6f 3F
1  3.                            4s6f 1F                  4s6f 1F                           
   3.      73499.5               4s7f 3F                  4s7f 3F
1  3.                            4s7f 1F                  4s7f 1F
1  3.                            4s8f 3F                  4s8f 3F
1  3.                            4s8f 1F                  4s8f 1F
1  3.                            4s9f 3F                  4s9f 3F
1  3.                            4s9f 1F                  4s9f 1F
1  3.                            4s10f 3F                 4s10f 3F
1  3.                            4s10f 1F                 4s10f 1F
1  3.                            4s11f 3F                 4s11f 3F
1  3.                            4s11f 1F                 4s11f 1F
1  3.                            4s12f 3F                 4s12f 3F
1  3.                            4s12f 1F                 4s12f 1F
1  3.                            4s13f 3F                 4s13f 3F
1  3.                            4s13f 1F                 4s13f 1F
1  3.                            4s14f 3F                 4s14f 3F
1  3.                            4s14f 1F                 4s14f 1F
1  3.                            3d9.4s2.4p 3F            s2.4p 3F
1  3.                            3d9.4s2.4p 1F            s2.4p 1F
1  3.                            3d9.4s2.4p 3D            s2.4p 3D
1  3.                            4p4d 3F                  4p4d 3F
1  3.                            4p4d 3D                  4p4d 3D
1  3.                            4p4d 1F                  4p4d 1F
1  3.                            4p5d 3F                  4p5d 3F
1  3.                            4p5d 3D                  4p5d 3D
1  3.                            4p5d 1F                  4p5d 1F
1  3.                            4p6d 3F                  4p6d 3F
1  3.                            4p6d 3D                  4p6d 3D
1  3.                            4p6d 1F                  4p6d 1F
1  3.                            4p7d 3F                  4p7d 3F
1  3.                            4p8d 3F                  4p8d 3F
1  3.                            4p7d 3D                  4p7d 3D
1  3.                            4p7d 1F                  4p7d 1F
1  3.                            4p9d 3F                  4p9d 3F
1  3.                            4p8d 3D                  4p8d 3D
1  3.                            4p8d 1F                  4p8d 1F
1  3.                            3d9.4s2.5p 1F            s2.5p 1F
1  3.                            4p9d 3D                  4p9d 3D
1  3.                            3d9.4s2.5p 3D            s2.5p 3D
1  3.                            4p9d 1F                  4p9d 1F
1  3.                            3d9.4s2.5p 3F            s2.5p 3F
1  3.                            3d9.4s2.6p 1F            s2.6p 1F
1  3.                            3d9.4s2.6p 3D            s2.6p 3D
1  3.                            3d9.4s2.4f 3D            s2.4f 3D
1  3.                            3d9.4s2.4f 1F            s2.4f 1F
1  3.                            3d9.4s2.6p 3F            s2.6p 3F
1  3.                            3d9.4s2.7p 1F            s2.7p 1F
1  3.                            3d9.4s2.7p 3D            s2.7p 3D
1  3.                            3d9.4s2.5f 3D            s2.5f 3D
1  3.                            3d9.4s2.5f 1F            s2.5f 1F
1  3.                            3d9.4s2.4f 3F            s2.4f 3F
1  3.                            3d9.4s2.4f 3G            s2.4f 3G
1  3.                            3d9.4s2.8p 1F            s2.8p 1F
1  3.                            3d9.4s2.8p 3D            s2.8p 3D
1  3.                            3d9.4s2.6f 3D            s2.6f 3D
1  3.                            3d9.4s2.6f 1F            s2.6f 1F
1  3.                            3d9.4s2.9p 1F            s2.9p 1F
1  3.                            3d9.4s2.9p 3D            s2.9p 3D
1  3.                            3d9.4s2.7f 3D            s2.7f 3D
1  3.                            3d9.4s2.7f 1F            s2.7f 1F
1  3.                            3d9.4s2.7p 3F            s2.7p 3F
1  3.                            3d9.4s2.10p 1F           s2.10p 1F
1  3.                            3d9.4s2.10p 3D           s2.10p 3D
1  3.                            3d9.4s2.5f 3F            s2.5f 3F
1  3.                            3d9.4s2.5f 3G            s2.5f 3G
1  3.                            3d9.4s2.8f 3D            s2.8f 3D
1  3.                            3d9.4s2.8f 1F            s2.8f 1F
1  3.                            3d9.4s2.11p 1F           s2.11p 1F
1  3.                            3d9.4s2.11p 3D           s2.11p 3D
1  3.                            3d9.4s2.9f 3D            s2.9f 3D
1  3.                            3d9.4s2.9f 1F            s2.9f 1F
1  3.                            3d9.4s2.12p 1F           s2.12p 1F
1  3.                            3d9.4s2.12p 3D           s2.12p 3D
1  3.                            3d9.4s2.10f 3D           s2.10f 3D
1  3.                            3d9.4s2.10f 1F           s2.10f 1F
1  3.                            3d9.4s2.13p 1F           s2.13p 1F
1  3.                            3d9.4s2.13p 3D           s2.13p 3D
1  3.                            3d9.4s2.11f 3D           s2.11f 3D
1  3.                            3d9.4s2.11f 1F           s2.11f 1F
1  3.                            3d9.4s2.14p 1F           s2.14p 1F
1  3.                            3d9.4s2.14p 3D           s2.14p 3D
1  3.                            3d9.4s2.12f 3D           s2.12f 3D
1  3.                            3d9.4s2.12f 1F           s2.12f 1F
1  3.                            3d9.4s2.15p 1F           s2.15p 1F
1  3.                            3d9.4s2.15p 3D           s2.15p 3D
1  3.                            3d9.4s2.13f 3D           s2.13f 3D
1  3.                            3d9.4s2.13f 1F           s2.13f 1F
1  3.                            3d9.4s2.8p 3F            s2.8p 3F
1  3.                            3d9.4s2.14f 3D           s2.14f 3D
1  3.                            3d9.4s2.14f 1F           s2.14f 1F
1  3.                            3d9.4s2.6f 3F            s2.6f 3F
1  3.                            3d9.4s2.6f 3G            s2.6f 3G
1  3.                            3d9.4s2.9p 3F            s2.9p 3F
1  3.                            3d9.4s2.7f 3F            s2.7f 3F
1  3.                            3d9.4s2.7f 3G            s2.7f 3G
1  3.                            3d9.4s2.10p 3F           s2.10p 3F
1  3.                            3d9.4s2.8f 3F            s2.8f 3F
1  3.                            3d9.4s2.8f 3G            s2.8f 3G
1  3.                            3d9.4s2.11p 3F           s2.11p 3F
1  3.                            3d9.4s2.9f 3F            s2.9f 3F
1  3.                            3d9.4s2.9f 3G            s2.9f 3G
1  3.                            3d9.4s2.12p 3F           s2.12p 3F
1  3.                            3d9.4s2.10f 3F           s2.10f 3F
1  3.                            3d9.4s2.10f 3G           s2.10f 3G
1  3.                            3d9.4s2.13p 3F           s2.13p 3F
1  3.                            3d9.4s2.11f 3F           s2.11f 3F
1  3.                            3d9.4s2.11f 3G           s2.11f 3G
1  3.                            3d9.4s2.14p 3F           s2.14p 3F
1  3.                            3d9.4s2.12f 3F           s2.12f 3F
1  3.                            3d9.4s2.12f 3G           s2.12f 3G
1  3.                            3d9.4s2.15p 3F           s2.15p 3F
1  3.                            3d9.4s2.13f 3F           s2.13f 3F
1  3.                            3d9.4s2.13f 3G           s2.13f 3G
1  3.                            3d9.4s2.14f 3F           s2.14f 3F
1  3.                            3d9.4s2.14f 3G           s2.14f 3G
1  3.                            3d9.4s4p(3D)5s 5P        4s4p5s 5P
1  3.                            3d9.4s4p(3D)5s 5F        4s4p5s 5F
1  3.                            3d9.4s4p(3D)5s 3F2       4s4p5s 3F2
1  3.                            3d9.4s4p(3D)5s 5D        4s4p5s 5D
1  3.                            3d9.4s4p(1D)5s 3F        4s4p5s 3F
1  3.                            3d9.4s4p(3D)5s 3D2       4s4p5s 3D2
1  3.                            3d9.4s4p(1D)5s 3D        4s4p5s 3D
1  3.                            3d9.4s4p(1D)5s 1F        4s4p5s 1F
1  3.                            3d9.4s4p(3D)5s 1F1       4s4p5s 1F1
1  3.                            3d9.4s4p(3D)5s 3F1       4s4p5s 3F1
1  3.                            3d9.4s4p(3D)5s 3D1       4s4p5s 3D1
   4.      68834.03              4s4f 3F                  4s4f 3F
   4.      71335.6               4s5f 3F                  4s5f 3F
   4.      72690.8               4s6f 3F                  4s6f 3F
   4.      73499.5               4s7f 3F                  4s7f 3F
1  4.                            4s8f 3F                  4s8f 3F
1  4.                            4s9f 3F                  4s9f 3F
1  4.                            4s10f 3F                 4s10f 3F
1  4.                            4s11f 3F                 4s11f 3F
1  4.                            4s12f 3F                 4s12f 3F
1  4.                            4s13f 3F                 4s13f 3F
1  4.                            4s14f 3F                 4s14f 3F
1  4.                            3d9.4s2.4p 3F            s2.4p 3F
1  4.                            4p4d 3F                  4d4d 3F
1  4.                            4p5d 3F                  4d5d 3F
1  4.                            4p6d 3F                  4d6d 3F
1  4.                            4p7d 3F                  4d7d 3F
1  4.                            4p8d 3F                  4d8d 3F
1  4.                            3d9.4s2.5p 3F            s2.5p 3F
1  4.                            4p9d 3F                  4d9d 3F
1  4.                            3d9.4s2.6p 3F            s2.6p 3F
1  4.                            3d9.4s2.4f 3F            s2.4f 3F
1  4.                            3d9.4s2.4f 1G            s2.4f 1G
1  4.                            3d9.4s2.7p 3F            s2.7p 3F
1  4.                            3d9.4s2.5f 3F            s2.5f 3F
1  4.                            3d9.4s2.5f 1G            s2.5f 1G
1  4.                            3d9.4s2.4f 3H            s2.4f 3H
1  4.                            3d9.4s2.4f 3G            s2.4f 3G
1  4.                            3d9.4s2.8p 3F            s2.8p 3F
1  4.                            3d9.4s2.6f 3F            s2.6f 3F
1  4.                            3d9.4s2.6f 1G            s2.6f 1G
1  4.                            3d9.4s2.9p 3F            s2.9p 3F
1  4.                            3d9.4s2.7f 3F            s2.7f 3F
1  4.                            3d9.4s2.7f 1G            s2.7f 1G
1  4.                            3d9.4s2.10p 3F           s2.10p 3F
1  4.                            3d9.4s2.5f 3H            s2.5f 3H
1  4.                            3d9.4s2.5f 3G            s2.5f 3G
1  4.                            3d9.4s2.8f 3F            s2.8f 3F
1  4.                            3d9.4s2.8f 1G            s2.8f 1G
1  4.                            3d9.4s2.11p 3F           s2.11p 3F
1  4.                            3d9.4s2.9f 3F            s2.9f 3F
1  4.                            3d9.4s2.9f 1G            s2.9f 1G
1  4.                            3d9.4s2.12p 3F           s2.12p 3F
1  4.                            3d9.4s2.10f 3F           s2.10f 3F
1  4.                            3d9.4s2.10f 1G           s2.10f 1G
1  4.                            3d9.4s2.12p 3F           s2.12p 3F
1  4.                            3d9.4s2.11f 3F           s2.11f 3F
1  4.                            3d9.4s2.11f 1G           s2.11f 1G
1  4.                            3d9.4s2.13p 3F           s2.13p 3F
1  4.                            3d9.4s2.12f 3F           s2.12f 3F
1  4.                            3d9.4s2.12f 1G           s2.12f 1G
1  4.                            3d9.4s2.14p 3F           s2.14p 3F
1  4.                            3d9.4s2.13f 3F           s2.13f 3F
1  4.                            3d9.4s2.13f 1G           s2.13f 1G
1  4.                            3d9.4s2.14f 3F           s2.14f 3F
1  4.                            3d9.4s2.14f 1G           s2.14f 1G
1  4.                            3d9.4s2.6f 3H            s2.6f 3H
1  4.                            3d9.4s2.6f 3G            s2.6f 3G
1  4.                            3d9.4s2.7f 3H            s2.7f 3H
1  4.                            3d9.4s2.7f 3G            s2.7f 3G
1  4.                            3d9.4s2.8f 3H            s2.8f 3H
1  4.                            3d9.4s2.8f 3G            s2.8f 3G
1  4.                            3d9.4s2.9f 3H            s2.9f 3H
1  4.                            3d9.4s2.9f 3G            s2.9f 3G
1  4.                            3d9.4s2.10f 3H           s2.10f 3H
1  4.                            3d9.4s2.10f 3G           s2.10f 3G
1  4.                            3d9.4s2.11f 3H           s2.11f 3H
1  4.                            3d9.4s2.11f 3G           s2.11f 3G
1  4.                            3d9.4s2.12f 3H           s2.12f 3H
1  4.                            3d9.4s2.12f 3G           s2.12f 3G
1  4.                            3d9.4s2.13f 3H           s2.13f 3H
1  4.                            3d9.4s2.13f 3G           s2.13f 3G
1  4.                            3d9.4s2.14f 3H           s2.14f 3H
1  4.                            3d9.4s2.14f 3G           s2.14f 3G
1  4.                            3d9.4s4p5s 5F            4s4p5s 5F
1  4.                            3d9.4s4p5s 5D            4s4p5s 5D
1  4.                            3d9.4s4p5s 3F2           4s4p5s 3F2
1  4.                            3d9.4s4p5s 3F            4s4p5s 3F
1  4.                            3d9.4s4p5s 3F1           4s4p5s 3F1
1  5.                            3d9.4s2.4f 1H            s2.4f 1H
1  5.                            3d9.4s2.4f 3G            s2.4f 3G
1  5.                            3d9.4s2.5f 1H            s2.5f 1H
1  5.                            3d9.4s2.5f 3G            s2.5f 3G
1  5.                            3d9.4s2.4f 3H            s2.4f 3H
1  5.                            3d9.4s2.6f 1H            s2.6f 1H
1  5.                            3d9.4s2.6f 3G            s2.6f 3G
1  5.                            3d9.4s2.7f 1H            s2.7f 1H
1  5.                            3d9.4s2.7f 3G            s2.7f 3G
1  5.                            3d9.4s2.5f 3H            s2.5f 3H
1  5.                            3d9.4s2.8f 1H            s2.8f 1H
1  5.                            3d9.4s2.8f 3G            s2.8f 3G
1  5.                            3d9.4s2.9f 1H            s2.9f 1H
1  5.                            3d9.4s2.9f 3G            s2.9f 3G
1  5.                            3d9.4s2.10f 1H           s2.10f 1H
1  5.                            3d9.4s2.10f 3G           s2.10f 3G
1  5.                            3d9.4s2.11f 1H           s2.11f 1H
1  5.                            3d9.4s2.11f 3G           s2.11f 3G
1  5.                            3d9.4s2.12f 1H           s2.12f 1H
1  5.                            3d9.4s2.12f 3G           s2.12f 3G
1  5.                            3d9.4s2.13f 1H           s2.13f 1H
1  5.                            3d9.4s2.13f 3G           s2.13f 3G
1  5.                            3d9.4s2.14f 1H           s2.14f 1H
1  5.                            3d9.4s2.14f 3G           s2.14f 3G
1  5.                            3d9.4s2.6f 3H            s2.6f 3H
1  5.                            3d9.4s2.7f 3H            s2.7f 3H
1  5.                            3d9.4s2.8f 3H            s2.8f 3H
1  5.                            3d9.4s2.9f 3H            s2.9f 3H
1  5.                            3d9.4s2.10f 3H           s2.10f 3H
1  5.                            3d9.4s2.11f 3H           s2.11f 3H
1  5.                            3d9.4s2.12f 3H           s2.12f 3H
1  5.                            3d9.4s2.13f 3H           s2.13f 3H
1  5.                            3d9.4s2.14f 3H           s2.14f 3H
1  5.                            3d9.4s4p5s 5F            4s4p5s 5F
1  6.                            3d9.4s2.4f 3H            s2.4f 3H
1  6.                            3d9.4s2.5f 3H            s2.5f 3H
1  6.                            3d9.4s2.6f 3H            s2.6f 3H
1  6.                            3d9.4s2.7f 3H            s2.7f 3H
1  6.                            3d9.4s2.8f 3H            s2.8f 3H
1  6.                            3d9.4s2.9f 3H            s2.9f 3H
1  6.                            3d9.4s2.10f 3H           s2.10f 3H
1  6.                            3d9.4s2.11f 3H           s2.11f 3H
1  6.                            3d9.4s2.12f 3H           s2.12f 3H
1  6.                            3d9.4s2.13f 3H           s2.13f 3H
1  6.                            3d9.4s2.14f 3H           s2.14f 3H
 3746      37.8   67      LEAST SQUARES
   1    1  EAV        37371.2    19.   29509.3             1.000  0    6900.0  0             4s4p      
   2    1  ZETA 3       392.5    34.     371.2             1.000  0       0.0  0                       
   3    1  G1(23)     25159.5    73.   33147.5             0.800  0       0.0  0                       
   4    2  EAV        61711.5    19.   54874.1             1.000  0    6900.0  0             4s5p      
   5    2  ZETA 5        55.8    34.      65.6             1.000  0       0.0  0                       
   6    2  G1(25)      2123.6    74.    3616.7             0.800  0       0.0  0                       
   7    3  EAV        68215.1    19.   61376.1             1.000  0    6900.0  0             4s6p      
   8    3  ZETA 5        21.0    34.      25.1             1.000  0       0.0  0                       
   9    3  G1(25)       699.8    72.    1234.7             0.800  0       0.0  0                       
  10    4  EAV        71041.7    19.   64185.9             1.000  0    6900.0  0             4s7p      
  11    4  ZETA 5        10.3    34.      12.4             1.000  0       0.0  0                       
  12    4  G1(25)       320.4    71.     576.5             0.800  0       0.0  0                       
  13    5  EAV        72530.2    19.   65665.0             1.000  0    6900.0  0             4s8p      
  14    5  ZETA 5         5.8    34.       7.0             1.000  0       0.0  0                       
  15    5  G1(25)       173.5    71.     316.9             0.800  0       0.0  0                       
  16    6  EAV        73411.0    22.   66540.9             1.000  0    6900.0  0             4s9p      
  17    6  ZETA 5         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
  18    6  G1(25)       103.9    72.     193.2             0.800  0       0.0  0                       
  19    7  EAV        73975.9    27.   67102.6             1.000  0    6900.0  0             4s10p     
  20    7  ZETA 5         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
  21    7  G1(25)        65.4    82.     126.6             0.800  0       0.0  0                       
  22    8  EAV        74359.5    27.   67484.0             1.000  0    6900.0  0             4s11p     
  23    8  ZETA 5         2.0     0.       2.0 FIXEDHF     1.000  0       0.0  0                       
  24    8  G1(25)        43.2    83.      87.5             0.800  0       0.0  0                       
  25    9  EAV        74631.8    27.   67755.0             1.000  0    6900.0  0             4s12p     
  26    9  ZETA 5         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
  27    9  G1(25)        29.4    83.      63.0             0.800  0       0.0  0                       
  28    A  EAV        74832.8    40.   67954.4             1.000  0    6900.0  0             4s13p     
  29    A  ZETA 5         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
  30    A  G1(25)        18.8     0.      46.9 FIXEDHF     0.400  0       0.0  0                       
  31    B  EAV        74983.1    40.   68105.6             1.000  0    6900.0  0             4s14p     
  32    B  ZETA 5         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
  33    B  G1(25)        14.3     0.      35.8 FIXEDHF     0.400  0       0.0  0                       
  34    C  EAV        75097.9    39.   68222.9             1.000  0    6900.0  0             4s15p     
  35    C  ZETA 5         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
  36    C  G1(25)        11.2     0.      28.0 FIXEDHF     0.400  0       0.0  0                       
  37    D  EAV       144127.8     0.  134127.8 FIXEDHF     1.000  0   10000.0  0             5s5p      
  38    D  ZETA 5       134.6     0.     134.6 FIXEDHF     1.000  0       0.0  0                       
  39    D  G1(45)     10623.8     0.   13279.8 FIXEDHF     0.800  0       0.0  0                       
  40    E  EAV       155793.7     0.  145793.7 FIXEDHF     1.000  0   10000.0  0             5s6p      
  41    E  ZETA 5        36.1     0.      36.1 FIXEDHF     1.000  0       0.0  0                       
  42    E  G1(45)      1473.5     0.    1841.9 FIXEDHF     0.800  0       0.0  0                       
  43    F  EAV       159564.1     0.  149564.1 FIXEDHF     1.000  0   10000.0  0             5s7p      
  44    F  ZETA 5        16.3     0.      16.3 FIXEDHF     1.000  0       0.0  0                       
  45    F  G1(45)       562.7     0.     703.4 FIXEDHF     0.800  0       0.0  0                       
  46    G  EAV        92493.2    22.   75237.7             1.000  0   15000.0  0             d9s2 4p   
  47    G  ZETA 1      1083.1     0.    1083.1 FIXEDHF     1.000  0       0.0  0                       
  48    G  ZETA 3       545.8     0.     545.8 FIXEDHF     1.000  0       0.0  0                       
  49    G  F2(13)     12341.9   142.   12071.9             0.800  0       0.0  0                       
  50    G  G1(13)      3645.5    49.    4217.1             0.800  0       0.0  0                       
  51    G  G3(13)      2845.9     0.    3557.4 FIXEDHF     0.800  0       0.0  0                       
  52    H  EAV       124590.2    22.  109381.1             1.000  0   15000.0  0             d9s2 5p   
  53    H  ZETA 1      1084.7     0.    1084.7 FIXEDHF     1.000  0       0.0  0                       
  54    H  ZETA 5        71.0     0.      71.0 FIXEDHF     1.000  0       0.0  0                       
  55    H  F2(15)      1385.1   139.    1506.3             0.800  0       0.0  0                       
  56    H  G1(15)       402.5     0.     503.1 FIXEDHF     0.800  0       0.0  0                       
  57    H  G3(15)       348.6     0.     435.8 FIXEDHF     0.800  0       0.0  0                       
  58    I  EAV       131700.2    22.  116613.8             1.000  0   15000.0  0             d9s2 6p   
  59    I  ZETA 1      1085.0     0.    1085.0 FIXEDHF     1.000  0       0.0  0                       
  60    I  ZETA 5        26.9     0.      26.9 FIXEDHF     1.000  0       0.0  0                       
  61    I  F2(15)       439.8     0.     549.8 FIXEDHF     0.800  0       0.0  0                       
  62    I  G1(15)       149.8     0.     187.3 FIXEDHF     0.800  0       0.0  0                       
  63    I  G3(15)       130.6     0.     163.2 FIXEDHF     0.800  0       0.0  0                       
  64    J  EAV       134695.9    22.  119634.2             1.000  0   15000.0  0             d9s2 7p   
  65    J  ZETA 1      1085.0     0.    1085.0 FIXEDHF     1.000  0       0.0  0                       
  66    J  ZETA 5        13.2     0.      13.2 FIXEDHF     1.000  0       0.0  0                       
  67    J  F2(15)       211.5     0.     264.4 FIXEDHF     0.800  0       0.0  0                       
  68    J  G1(15)        72.8     0.      91.0 FIXEDHF     0.800  0       0.0  0                       
  69    J  G3(15)        63.6     0.      79.5 FIXEDHF     0.800  0       0.0  0                       
  70    K  EAV       136256.0    22.  121198.6             1.000  0   15000.0  0             d9s2 8p   
  71    K  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  72    K  ZETA 5         7.4     0.       7.4 FIXEDHF     1.000  0       0.0  0                       
  73    K  F2(15)       118.2     0.     147.8 FIXEDHF     0.800  0       0.0  0                       
  74    K  G1(15)        40.9     0.      51.1 FIXEDHF     0.800  0       0.0  0                       
  75    K  G3(15)        35.8     0.      44.7 FIXEDHF     0.800  0       0.0  0                       
  76    L  EAV       137172.7    22.  122115.9             1.000  0   15000.0  0             d9s2 9p   
  77    L  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  78    L  ZETA 5         4.6     0.       4.6 FIXEDHF     1.000  0       0.0  0                       
  79    L  F2(15)        72.8     0.      91.0 FIXEDHF     0.800  0       0.0  0                       
  80    L  G1(15)        25.3     0.      31.6 FIXEDHF     0.800  0       0.0  0                       
  81    L  G3(15)        22.2     0.      27.7 FIXEDHF     0.800  0       0.0  0                       
  82    M  EAV       137756.3    22.  122699.3             1.000  0       0.0  0             d9s2 10p  
  83    M  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  84    M  ZETA 5         3.1     0.       3.1 FIXEDHF     1.000  0       0.0  0                       
  85    M  F2(15)        48.1     0.      60.1 FIXEDHF     0.800  0       0.0  0                       
  86    M  G1(15)        16.7     0.      20.9 FIXEDHF     0.800  0       0.0  0                       
  87    M  G3(15)        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0                       
  88    N  EAV       138150.9    22.  123094.3             1.000  0       0.0  0             d9s2 11p  
  89    N  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  90    N  ZETA 5         2.1     0.       2.1 FIXEDHF     1.000  0       0.0  0                       
  91    N  F2(15)        33.4     0.      41.8 FIXEDHF     0.800  0       0.0  0                       
  92    N  G1(15)        11.7     0.      14.6 FIXEDHF     0.800  0       0.0  0                       
  93    N  G3(15)        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0                       
  94    O  EAV       138431.1    22.  123373.2             1.000  0   15000.0  0             d9s2 12p  
  95    O  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  96    O  ZETA 5         1.5     0.       1.5 FIXEDHF     1.000  0       0.0  0                       
  97    O  F2(15)        24.2     0.      30.2 FIXEDHF     0.800  0       0.0  0                       
  98    O  G1(15)         8.5     0.      10.6 FIXEDHF     0.800  0       0.0  0                       
  99    O  G3(15)         7.4     0.       9.3 FIXEDHF     0.800  0       0.0  0                       
 100    P  EAV       138635.2    22.  123578.6             1.000  0   15000.0  0             d9s2 13p  
 101    P  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 102    P  ZETA 5         1.2     0.       1.2 FIXEDHF     1.000  0       0.0  0                       
 103    P  F2(15)        18.0     0.      22.5 FIXEDHF     0.800  0       0.0  0                       
 104    P  G1(15)         6.3     0.       7.9 FIXEDHF     0.800  0       0.0  0                       
 105    P  G3(15)         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0                       
 106    Q  EAV       138790.5    22.  123733.1             1.000  0   15000.0  0             d9s2 14p  
 107    Q  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 108    Q  ZETA 5         0.9     0.       0.9 FIXEDHF     1.000  0       0.0  0                       
 109    Q  F2(15)        13.8     0.      17.3 FIXEDHF     0.800  0       0.0  0                       
 110    Q  G1(15)         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0                       
 111    Q  G3(15)         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0                       
 112    R  EAV       138911.3    22.  123853.0             1.000  0       0.0  0             d9s2 15p  
 113    R  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 114    R  ZETA 5         0.7     0.       0.7 FIXEDHF     1.000  0       0.0  0                       
 115    R  F2(15)        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0                       
 116    R  G1(15)         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
 117    R  G3(15)         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
 118    S  EAV        68858.9    19.   61956.1             1.000  0    6900.0  0             4s4f      
 119    S  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 120    S  G3(26)        11.3     0.      14.1 FIXEDHF     0.800  0       0.0  0                       
 121    T  EAV        71350.2    19.   64449.7             1.000  0    6900.0  0             4s5f      
 122    T  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 123    T  G3(26)         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0                       
 124    U  EAV        72699.8    22.   65808.4             1.000  0    6900.0  0             4s6f      
 125    U  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 126    U  G3(26)         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0                       
 127    V  EAV        73505.4    22.   66627.9             1.000  0    6900.0  0             4s7f      
 128    V  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 129    V  G3(26)         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0                       
 130    W  EAV        74059.2     0.   67159.2 FIXEDHF     1.000  0    6900.0  0             4s8f      
 131    W  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 132    W  G3(26)         3.6     0.       4.5 FIXEDHF     0.800  0       0.0  0                       
 133    X  EAV        74423.0     0.   67523.0 FIXEDHF     1.000  0    6900.0  0             4s9f      
 134    X  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 135    X  G3(26)         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
 136    Y  EAV        74683.1     0.   67783.1 FIXEDHF     1.000  0    6900.0  0             4s10f     
 137    Y  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 138    Y  G3(26)         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
 139    Z  EAV        74875.5     0.   67975.5 FIXEDHF     1.000  0    6900.0  0             4s11f     
 140    Z  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 141    Z  G3(26)         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
 142    a  EAV        75021.6     0.   68121.6 FIXEDHF     1.000  0    6900.0  0             4s12f     
 143    a  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 144    a  G3(26)         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
 145    b  EAV        75135.3     0.   68235.3 FIXEDHF     1.000  0    6900.0  0             4s13f     
 146    b  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 147    b  G3(26)         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
 148    c  EAV        75225.5     0.   68325.5 FIXEDHF     1.000  0    6900.0  0             4s14f     
 149    c  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 150    c  G3(26)         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
 151    d  EAV       132641.9    22.  117594.2             1.000  0       0.0  0             d9s2 4f   
 152    d  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 153    d  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 154    d  F2(16)        66.0   512.      73.1             0.800  0       0.0  0                       
 155    d  F4(16)         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
 156    d  G1(16)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
 157    d  G3(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 158    d  G5(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 159    e  EAV       135141.0    22.  120087.6             1.000  0       0.0  0             d9s2 5f   
 160    e  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 161    e  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 162    e  F2(16)        30.5     0.      38.1 FIXEDHF     0.800  0       0.0  0                       
 163    e  F4(16)         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
 164    e  G1(16)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
 165    e  G3(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 166    e  G5(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 167    f  EAV       136502.1    22.  121446.7             1.000  0       0.0  0             d9s2 6f   
 168    f  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 169    f  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 170    f  F2(16)        17.9     0.      22.4 FIXEDHF     0.800  0       0.0  0                       
 171    f  F4(16)         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
 172    f  G1(16)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
 173    f  G3(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 174    f  G5(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 175    g  EAV       137323.9    27.  122266.6             1.000  0       0.0  0             d9s2 7f   
 176    g  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 177    g  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 178    g  F2(16)        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0                       
 179    g  F4(16)         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
 180    g  G1(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 181    g  G3(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 182    g  G5(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 183    h  EAV       137858.3    27.  122798.3             1.000  0       0.0  0             d9s2 8f   
 184    h  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 185    h  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 186    h  F2(16)         7.8     0.       9.7 FIXEDHF     0.800  0       0.0  0                       
 187    h  F4(16)         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
 188    h  G1(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 189    h  G3(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 190    h  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 191    i  EAV       138218.6    27.  123162.4             1.000  0       0.0  0             d9s2 9f   
 192    i  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 193    i  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 194    i  F2(16)         5.4     0.       6.8 FIXEDHF     0.800  0       0.0  0                       
 195    i  F4(16)         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
 196    i  G1(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 197    i  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 198    i  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 199    j  EAV       138478.8    27.  123422.6             1.000  0       0.0  0             d9s2 10f  
 200    j  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 201    j  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 202    j  F2(16)         4.0     0.       5.0 FIXEDHF     0.800  0       0.0  0                       
 203    j  F4(16)         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
 204    j  G1(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 205    j  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 206    j  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 207    k  EAV       138672.2    27.  123615.0             1.000  0       0.0  0             d9s2 11f  
 208    k  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 209    k  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 210    k  F2(16)         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
 211    k  F4(16)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
 212    k  G1(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 213    k  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 214    k  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 215    l  EAV       138816.9    27.  123761.2             1.000  0       0.0  0             d9s2 12f  
 216    l  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 217    l  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 218    l  F2(16)         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
 219    l  F4(16)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
 220    l  G1(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 221    l  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 222    l  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 223    m  EAV       138936.7    38.  123875.0             1.000  0       0.0  0             d9s2 13f  
 224    m  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 225    m  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 226    m  F2(16)         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
 227    m  F4(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 228    m  G1(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 229    m  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 230    m  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 231    n  EAV       139027.2    38.  123875.0             1.000  0   15000.0  0             d9s2 14f  
 232    n  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 233    n  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 234    n  F2(16)         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
 235    n  F4(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 236    n  G1(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 237    n  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 238    n  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 239    o  EAV       103240.7    38.   92975.0             1.000  0   10000.0  0             4p5s      
 240    o  ZETA 3       643.2     0.     643.2 FIXEDHF     1.000  0       0.0  0                       
 241    o  G1(34)      2505.8     0.    3132.3 FIXEDHF     0.800  0       0.0  0                       
 242    p  EAV       114449.6    31.  105315.4             1.000  0    9100.0  0             4p6s      
 243    p  ZETA 3       675.1     0.     675.1 FIXEDHF     1.000  0       0.0  0                       
 244    p  G1(37)       625.8     0.     782.2 FIXEDHF     0.800  0       0.0  0                       
 245    q  EAV       118816.8    31.  109635.4             1.000  0    9100.0  0             4p7s      
 246    q  ZETA 3       681.5     0.     681.5 FIXEDHF     1.000  0       0.0  0                       
 247    q  G1(37)       259.2     0.     324.0 FIXEDHF     0.800  0       0.0  0                       
 248    r  EAV       120996.7    34.  111707.1             1.000  0    9100.0  0             4p8s      
 249    r  ZETA 3       683.6     0.     683.6 FIXEDHF     1.000  0       0.0  0                       
 250    r  G1(37)       132.7     0.     165.9 FIXEDHF     0.800  0       0.0  0                       
 251    s  EAV       122026.5    37.  112864.1             1.000  0    9100.0  0             4p9s      
 252    s  ZETA 3       684.5     0.     684.5 FIXEDHF     1.000  0       0.0  0                       
 253    s  G1(37)        77.1     0.      96.4 FIXEDHF     0.800  0       0.0  0                       
 254    t  EAV       111256.3    59.  101182.1             1.000  0    9100.0  0             4p4d      
 255    t  ZETA 3       663.5     0.     663.5 FIXEDHF     1.000  0       0.0  0                       
 256    t  ZETA 8         4.7     0.       4.7 FIXEDHF     1.000  0       0.0  0                       
 257    t  F2(38)      5258.5     0.    6573.1 FIXEDHF     0.800  0       0.0  0                       
 258    t  G1(38)      3720.6     0.    4650.7 FIXEDHF     0.800  0       0.0  0                       
 259    t  G3(38)      2207.3     0.    2759.1 FIXEDHF     0.800  0       0.0  0                       
 260    u  EAV       117438.3    34.  108004.8             1.000  0    9100.0  0             4p5d      
 261    u  ZETA 3       677.0     0.     677.0 FIXEDHF     1.000  0       0.0  0                       
 262    u  ZETA 8         2.7     0.       2.7 FIXEDHF     1.000  0       0.0  0                       
 263    u  F2(38)      2045.0     0.    2556.3 FIXEDHF     0.800  0       0.0  0                       
 264    u  G1(38)      1679.8     0.    2099.8 FIXEDHF     0.800  0       0.0  0                       
 265    u  G3(38)      1018.0     0.    1272.5 FIXEDHF     0.800  0       0.0  0                       
 266    v  EAV       120139.1    42.  110887.1             1.000  0    9100.0  0             4p6d      
 267    v  ZETA 3       681.7     0.     681.7 FIXEDHF     1.000  0       0.0  0                       
 268    v  ZETA 8         1.5     0.       1.5 FIXEDHF     1.000  0       0.0  0                       
 269    v  F2(38)       983.5     0.    1229.4 FIXEDHF     0.800  0       0.0  0                       
 270    v  G1(38)       848.6     0.    1060.7 FIXEDHF     0.800  0       0.0  0                       
 271    v  G3(38)       519.4     0.     649.2 FIXEDHF     0.800  0       0.0  0                       
 272    w  EAV       121497.0    62.  112392.8             1.000  0    9100.0  0             4p7d      
 273    w  ZETA 3       683.5     0.     683.5 FIXEDHF     1.000  0       0.0  0                       
 274    w  ZETA 8         0.9     0.       0.9 FIXEDHF     1.000  0       0.0  0                       
 275    w  F2(38)       542.6     0.     678.2 FIXEDHF     0.800  0       0.0  0                       
 276    w  G1(38)       478.0     0.     597.5 FIXEDHF     0.800  0       0.0  0                       
 277    w  G3(38)       294.2     0.     367.8 FIXEDHF     0.800  0       0.0  0                       
 278    x  EAV       122380.8     0.  113280.8 FIXEDHF     1.000  0    9100.0  0             4p8d      
 279    x  ZETA 3       684.4     0.     684.4 FIXEDHF     1.000  0       0.0  0                       
 280    x  ZETA 8         0.6     0.       0.6 FIXEDHF     1.000  0       0.0  0                       
 281    x  F2(38)       329.4     0.     411.8 FIXEDHF     0.800  0       0.0  0                       
 282    x  G1(38)       293.3     0.     366.6 FIXEDHF     0.800  0       0.0  0                       
 283    x  G3(38)       181.2     0.     226.5 FIXEDHF     0.800  0       0.0  0                       
 284    y  EAV       122948.3     0.  113848.3 FIXEDHF     1.000  0    9100.0  0             4p9d      
 285    y  ZETA 3       684.8     0.     684.8 FIXEDHF     1.000  0       0.0  0                       
 286    y  ZETA 8         0.4     0.       0.4 FIXEDHF     1.000  0       0.0  0                       
 287    y  F2(38)       214.6     0.     268.2 FIXEDHF     0.800  0       0.0  0                       
 288    y  G1(38)       192.1     0.     240.1 FIXEDHF     0.800  0       0.0  0                       
 289    y  G3(38)       119.0     0.     148.8 FIXEDHF     0.800  0       0.0  0                       
 290    z  EAV       166415.0    38.  144443.1             1.000  0       0.0  0             d9 4s4p5s 
 291    z  ZETA 1      1088.1     0.    1088.1 FIXEDHF     1.000  0       0.0  0                       
 292    z  ZETA 3       833.9     0.     833.9 FIXEDHF     1.000  0       0.0  0                       
 293    z  F2(13)     13029.4     0.   16286.8 FIXEDHF     0.800  0       0.0  0                       
 294    z  G2(12)      8665.1     0.   10831.4 FIXEDHF     0.800  0       0.0  0                       
 295    z  G1(13)      4809.6     0.    6012.0 FIXEDHF     0.800  0       0.0  0                       
 296    z  G3(13)      4126.6     0.    5158.2 FIXEDHF     0.800  0       0.0  0                       
 297    z  G2(14)       699.4     0.     874.2 FIXEDHF     0.800  0       0.0  0                       
 298    z  G1(23)     37809.0     0.   47261.3 FIXEDHF     0.800  0       0.0  0                       
 299    z  G0(24)      1803.3     0.    2254.1 FIXEDHF     0.800  0       0.0  0                       
 300    z  G1(34)      2245.9     0.    2807.4 FIXEDHF     0.800  0       0.0  0                       
 301    12 0D2325      1397.5     0.    1746.9 FIXEDHF     0.800  0       0.0  0  4s4p      -4s5p      
 302    12 1E2325      8261.5     0.   10326.9 FIXEDHF     0.800  0       0.0  0                       
 303    13 0D2325       800.5     0.    1000.6 FIXEDHF     0.800  0       0.0  0  4s4p      -4s6p      
 304    13 1E2325      4710.9     0.    5888.6 FIXEDHF     0.800  0       0.0  0                       
 305    14 0D2325       541.7     0.     677.1 FIXEDHF     0.800  0       0.0  0  4s4p      -4s7p      
 306    14 1E2325      3181.7     0.    3977.1 FIXEDHF     0.800  0       0.0  0                       
 307    15 0D2325       399.4     0.     499.3 FIXEDHF     0.800  0       0.0  0  4s4p      -4s8p      
 308    15 1E2325      2343.6     0.    2929.5 FIXEDHF     0.800  0       0.0  0                       
 309    16 0D2325       310.7     0.     388.4 FIXEDHF     0.800  0       0.0  0  4s4p      -4s9p      
 310    16 1E2325      1822.2     0.    2277.8 FIXEDHF     0.800  0       0.0  0                       
 311    17 0D2325       250.9     0.     313.6 FIXEDHF     0.800  0       0.0  0  4s4p      -4s10p     
 312    17 1E2325      1470.7     0.    1838.4 FIXEDHF     0.800  0       0.0  0                       
 313    18 0D2325       208.2     0.     260.3 FIXEDHF     0.800  0       0.0  0  4s4p      -4s11p     
 314    18 1E2325      1220.1     0.    1525.1 FIXEDHF     0.800  0       0.0  0                       
 315    19 0D2325       176.5     0.     220.6 FIXEDHF     0.800  0       0.0  0  4s4p      -4s12p     
 316    19 1E2325      1033.8     0.    1292.2 FIXEDHF     0.800  0       0.0  0                       
 317    1A 0D2325       152.1     0.     190.1 FIXEDHF     0.800  0       0.0  0  4s4p      -4s13p     
 318    1A 1E2325       890.7     0.    1113.4 FIXEDHF     0.800  0       0.0  0                       
 319    1B 0D2325       132.9     0.     166.1 FIXEDHF     0.800  0       0.0  0  4s4p      -4s14p     
 320    1B 1E2325       778.1     0.     972.6 FIXEDHF     0.800  0       0.0  0                       
 321    1C 0D2325       117.4     0.     146.7 FIXEDHF     0.800  0       0.0  0  4s4p      -4s15p     
 322    1C 1E2325       687.4     0.     859.3 FIXEDHF     0.800  0       0.0  0                       
 323    1D 0D2345      1503.7     0.    1879.6 FIXEDHF     0.800  0       0.0  0  4s4p      -5s5p      
 324    1D 1E2345       528.0     0.     660.0 FIXEDHF     0.800  0       0.0  0                       
 325    1E 0D2345       747.4     0.     934.3 FIXEDHF     0.800  0       0.0  0  4s4p      -5s6p      
 326    1E 1E2345       369.0     0.     461.3 FIXEDHF     0.800  0       0.0  0                       
 327    1F 0D2345       486.9     0.     608.6 FIXEDHF     0.800  0       0.0  0  4s4p      -5s7p      
 328    1F 1E2345       279.4     0.     349.3 FIXEDHF     0.800  0       0.0  0                       
 329    1G 2D1112       600.6     0.     750.7 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 4p   
 330    1G 2D1323     -7616.3     0.   -9520.4 FIXEDHF     0.800  0       0.0  0                       
 331    1G 1E1323     -7467.1     0.   -9333.9 FIXEDHF     0.800  0       0.0  0                       
 332    1H 2D1325     -1910.1     0.   -2387.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 5p   
 333    1H 1E1325     -2352.5     0.   -2940.6 FIXEDHF     0.800  0       0.0  0                       
 334    1I 2D1325     -1086.1     0.   -1357.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 6p   
 335    1I 1E1325     -1404.0     0.   -1755.0 FIXEDHF     0.800  0       0.0  0                       
 336    1J 2D1325      -734.1     0.    -917.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 7p   
 337    1J 1E1325      -969.1     0.   -1211.4 FIXEDHF     0.800  0       0.0  0                       
 338    1K 2D1325      -541.3     0.    -676.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 8p   
 339    1K 1E1325      -722.8     0.    -903.5 FIXEDHF     0.800  0       0.0  0                       
 340    1L 2D1325      -421.3     0.    -526.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 9p   
 341    1L 1E1325      -566.5     0.    -708.1 FIXEDHF     0.800  0       0.0  0                       
 342    1M 2D1325      -340.4     0.    -425.5 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 10p  
 343    1M 1E1325      -459.8     0.    -574.8 FIXEDHF     0.800  0       0.0  0                       
 344    1N 2D1325      -282.6     0.    -353.3 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 11p  
 345    1N 1E1325      -383.0     0.    -478.8 FIXEDHF     0.800  0       0.0  0                       
 346    1O 2D1325      -239.6     0.    -299.5 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 12p  
 347    1O 1E1325      -325.6     0.    -407.0 FIXEDHF     0.800  0       0.0  0                       
 348    1P 2D1325      -206.6     0.    -258.3 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 13p  
 349    1P 1E1325      -281.3     0.    -351.6 FIXEDHF     0.800  0       0.0  0                       
 350    1Q 2D1325      -180.6     0.    -225.8 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 14p  
 351    1Q 1E1325      -246.2     0.    -307.8 FIXEDHF     0.800  0       0.0  0                       
 352    1R 2D1325      -159.7     0.    -199.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 15p  
 353    1R 1E1325      -217.9     0.    -272.4 FIXEDHF     0.800  0       0.0  0                       
 354    1d 2D1326      -214.0     0.    -267.5 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 4f   
 355    1d 1E1326       -92.5     0.    -115.6 FIXEDHF     0.800  0       0.0  0                       
 356    1e 2D1326      -195.7     0.    -244.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 5f   
 357    1e 1E1326       -89.2     0.    -111.5 FIXEDHF     0.800  0       0.0  0                       
 358    1f 2D1326      -166.5     0.    -208.1 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 6f   
 359    1f 1E1326       -78.0     0.     -97.5 FIXEDHF     0.800  0       0.0  0                       
 360    1g 2D1326      -140.9     0.    -176.1 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 7f   
 361    1g 1E1326       -67.1     0.     -83.9 FIXEDHF     0.800  0       0.0  0                       
 362    1h 2D1326      -120.2     0.    -150.3 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 8f   
 363    1h 1E1326       -58.0     0.     -72.5 FIXEDHF     0.800  0       0.0  0                       
 364    1i 2D1326      -103.8     0.    -129.7 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 9f   
 365    1i 1E1326       -50.4     0.     -63.0 FIXEDHF     0.800  0       0.0  0                       
 366    1j 2D1326       -90.6     0.    -113.2 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 10f  
 367    1j 1E1326       -44.2     0.     -55.3 FIXEDHF     0.800  0       0.0  0                       
 368    1k 2D1326       -79.8     0.     -99.8 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 11f  
 369    1k 1E1326       -39.2     0.     -49.0 FIXEDHF     0.800  0       0.0  0                       
 370    1l 2D1326       -71.0     0.     -88.8 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 12f  
 371    1l 1E1326       -35.0     0.     -43.8 FIXEDHF     0.800  0       0.0  0                       
 372    1m 2D1326       -63.7     0.     -79.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 13f  
 373    1m 1E1326       -31.5     0.     -39.4 FIXEDHF     0.800  0       0.0  0                       
 374    1n 2D1326       -57.5     0.     -71.9 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 14f  
 375    1n 1E1326       -28.6     0.     -35.7 FIXEDHF     0.800  0       0.0  0                       
 376    1o 1D2334     -2616.9     0.   -3271.1 FIXEDHF     0.800  0       0.0  0  4s4p      -4p5s      
 377    1o 0E2334      -204.6     0.    -255.8 FIXEDHF     0.800  0       0.0  0                       
 378    1p 1D2337     -1136.7     0.   -1420.9 FIXEDHF     0.800  0       0.0  0  4s4p      -4p6s      
 379    1p 0E2337       -83.2     0.    -104.0 FIXEDHF     0.800  0       0.0  0                       
 380    1q 1D2337      -703.6     0.    -879.5 FIXEDHF     0.800  0       0.0  0  4s4p      -4p7s      
 381    1q 0E2337       -52.9     0.     -66.1 FIXEDHF     0.800  0       0.0  0                       
 382    1r 1D2337      -494.9     0.    -618.6 FIXEDHF     0.800  0       0.0  0  4s4p      -4p8s      
 383    1r 0E2337       -38.0     0.     -47.5 FIXEDHF     0.800  0       0.0  0                       
 384    1s 1D2337      -373.4     0.    -466.8 FIXEDHF     0.800  0       0.0  0  4s4p      -4p9s      
 385    1s 0E2337       -29.0     0.     -36.3 FIXEDHF     0.800  0       0.0  0                       
 386    1t 1D2338     10640.4     0.   13300.5 FIXEDHF     0.800  0       0.0  0  4s4p      -4p4d      
 387    1t 2E2338      5487.1     0.    6858.9 FIXEDHF     0.800  0       0.0  0                       
 388    1u 1D2338      7098.9     0.    8873.6 FIXEDHF     0.800  0       0.0  0  4s4p      -4p5d      
 389    1u 2E2338      3990.3     0.    4987.9 FIXEDHF     0.800  0       0.0  0                       
 390    1v 1D2338      5005.0     0.    6256.2 FIXEDHF     0.800  0       0.0  0  4s4p      -4p6d      
 391    1v 2E2338      2928.6     0.    3660.7 FIXEDHF     0.800  0       0.0  0                       
 392    1w 1D2338      3734.9     0.    4668.6 FIXEDHF     0.800  0       0.0  0  4s4p      -4p7d      
 393    1w 2E2338      2235.5     0.    2794.4 FIXEDHF     0.800  0       0.0  0                       
 394    1x 1D2338      2913.7     0.    3642.1 FIXEDHF     0.800  0       0.0  0  4s4p      -4p8d      
 395    1x 2E2338      1769.1     0.    2211.4 FIXEDHF     0.800  0       0.0  0                       
 396    1y 1D2338      2351.0     0.    2938.8 FIXEDHF     0.800  0       0.0  0  4s4p      -4p9d      
 397    1y 2E2338      1441.5     0.    1801.9 FIXEDHF     0.800  0       0.0  0                       
 398    1z 2D1114       377.5     0.     471.9 FIXEDHF     0.800  0       0.0  0  4s4p      -d9 4s4p5s 
 399    1z 1D1334       557.5     0.     696.9 FIXEDHF     0.800  0       0.0  0                       
 400    1z 2E1334     -1773.1     0.   -2216.4 FIXEDHF     0.800  0       0.0  0                       
 401    23 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s6p      
 402    23 1E2525      1687.1     0.    2108.9 FIXEDHF     0.800  0       0.0  0                       
 403    24 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s7p      
 404    24 1E2525      1150.4     0.    1438.0 FIXEDHF     0.800  0       0.0  0                       
 405    25 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s8p      
 406    25 1E2525       851.8     0.    1064.8 FIXEDHF     0.800  0       0.0  0                       
 407    26 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s9p      
 408    26 1E2525       664.4     0.     830.5 FIXEDHF     0.800  0       0.0  0                       
 409    27 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s10p     
 410    27 1E2525       537.4     0.     671.8 FIXEDHF     0.800  0       0.0  0                       
 411    28 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s11p     
 412    28 1E2525       446.5     0.     558.1 FIXEDHF     0.800  0       0.0  0                       
 413    29 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s12p     
 414    29 1E2525       378.8     0.     473.5 FIXEDHF     0.800  0       0.0  0                       
 415    2A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s13p     
 416    2A 1E2525       326.6     0.     408.3 FIXEDHF     0.800  0       0.0  0                       
 417    2B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s14p     
 418    2B 1E2525       285.5     0.     356.9 FIXEDHF     0.800  0       0.0  0                       
 419    2C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s15p     
 420    2C 1E2525       252.4     0.     315.5 FIXEDHF     0.800  0       0.0  0                       
 421    2D 0D2545       217.3     0.     271.6 FIXEDHF     0.800  0       0.0  0  4s5p      -5s5p      
 422    2D 1E2545       786.2     0.     982.8 FIXEDHF     0.800  0       0.0  0                       
 423    2E 0D2545       312.3     0.     390.4 FIXEDHF     0.800  0       0.0  0  4s5p      -5s6p      
 424    2E 1E2545       358.6     0.     448.3 FIXEDHF     0.800  0       0.0  0                       
 425    2F 0D2545       204.3     0.     255.4 FIXEDHF     0.800  0       0.0  0  4s5p      -5s7p      
 426    2F 1E2545       227.8     0.     284.8 FIXEDHF     0.800  0       0.0  0                       
 427    2G 2D1523     -2472.9     0.   -3091.1 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 4p   
 428    2G 1E1523     -2516.2     0.   -3145.3 FIXEDHF     0.800  0       0.0  0                       
 429    2H 2D1112       689.1     0.     861.4 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 5p   
 430    2H 2D1525     -1070.7     0.   -1338.4 FIXEDHF     0.800  0       0.0  0                       
 431    2H 1E1525      -829.0     0.   -1036.2 FIXEDHF     0.800  0       0.0  0                       
 432    2I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 6p   
 433    2I 2D1525      -569.4     0.    -711.8 FIXEDHF     0.800  0       0.0  0                       
 434    2I 1E1525      -497.5     0.    -621.9 FIXEDHF     0.800  0       0.0  0                       
 435    2J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 7p   
 436    2J 2D1525      -380.1     0.    -475.1 FIXEDHF     0.800  0       0.0  0                       
 437    2J 1E1525      -344.2     0.    -430.2 FIXEDHF     0.800  0       0.0  0                       
 438    2K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 8p   
 439    2K 2D1525      -278.9     0.    -348.6 FIXEDHF     0.800  0       0.0  0                       
 440    2K 1E1525      -257.0     0.    -321.2 FIXEDHF     0.800  0       0.0  0                       
 441    2L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 9p   
 442    2L 2D1525      -216.5     0.    -270.6 FIXEDHF     0.800  0       0.0  0                       
 443    2L 1E1525      -201.5     0.    -251.9 FIXEDHF     0.800  0       0.0  0                       
 444    2M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 10p  
 445    2M 2D1525      -174.6     0.    -218.3 FIXEDHF     0.800  0       0.0  0                       
 446    2M 1E1525      -163.7     0.    -204.6 FIXEDHF     0.800  0       0.0  0                       
 447    2N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 11p  
 448    2N 2D1525      -144.9     0.    -181.1 FIXEDHF     0.800  0       0.0  0                       
 449    2N 1E1525      -136.4     0.    -170.5 FIXEDHF     0.800  0       0.0  0                       
 450    2O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 12p  
 451    2O 2D1525      -122.7     0.    -153.4 FIXEDHF     0.800  0       0.0  0                       
 452    2O 1E1525      -115.9     0.    -144.9 FIXEDHF     0.800  0       0.0  0                       
 453    2P 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 13p  
 454    2P 2D1525      -105.8     0.    -132.2 FIXEDHF     0.800  0       0.0  0                       
 455    2P 1E1525      -100.2     0.    -125.2 FIXEDHF     0.800  0       0.0  0                       
 456    2Q 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 14p  
 457    2Q 2D1525       -92.4     0.    -115.5 FIXEDHF     0.800  0       0.0  0                       
 458    2Q 1E1525       -87.7     0.    -109.6 FIXEDHF     0.800  0       0.0  0                       
 459    2R 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 15p  
 460    2R 2D1525       -81.7     0.    -102.1 FIXEDHF     0.800  0       0.0  0                       
 461    2R 1E1525       -77.6     0.     -97.0 FIXEDHF     0.800  0       0.0  0                       
 462    2d 2D1526       102.6     0.     128.2 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 4f   
 463    2d 1E1526       -29.8     0.     -37.3 FIXEDHF     0.800  0       0.0  0                       
 464    2e 2D1526        64.2     0.      80.2 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 5f   
 465    2e 1E1526       -28.9     0.     -36.1 FIXEDHF     0.800  0       0.0  0                       
 466    2f 2D1526        43.5     0.      54.4 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 6f   
 467    2f 1E1526       -25.4     0.     -31.7 FIXEDHF     0.800  0       0.0  0                       
 468    2g 2D1526        31.7     0.      39.6 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 7f   
 469    2g 1E1526       -21.8     0.     -27.3 FIXEDHF     0.800  0       0.0  0                       
 470    2h 2D1526        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 8f   
 471    2h 1E1526       -18.9     0.     -23.6 FIXEDHF     0.800  0       0.0  0                       
 472    2i 2D1526        19.4     0.      24.2 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 9f   
 473    2i 1E1526       -16.4     0.     -20.5 FIXEDHF     0.800  0       0.0  0                       
 474    2j 2D1526        15.9     0.      19.9 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 10f  
 475    2j 1E1526       -14.4     0.     -18.0 FIXEDHF     0.800  0       0.0  0                       
 476    2k 2D1526        13.4     0.      16.7 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 11f  
 477    2k 1E1526       -12.8     0.     -16.0 FIXEDHF     0.800  0       0.0  0                       
 478    2l 2D1526        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 12f  
 479    2l 1E1526       -11.4     0.     -14.3 FIXEDHF     0.800  0       0.0  0                       
 480    2m 2D1526         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 13f  
 481    2m 1E1526       -10.2     0.     -12.8 FIXEDHF     0.800  0       0.0  0                       
 482    2n 2D1526         8.7     0.      10.9 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 14f  
 483    2n 1E1526        -9.3     0.     -11.6 FIXEDHF     0.800  0       0.0  0                       
 484    2o 1D2534      5731.7     0.    7164.6 FIXEDHF     0.800  0       0.0  0  4s5p      -4p5s      
 485    2o 0E2534      1817.0     0.    2271.2 FIXEDHF     0.800  0       0.0  0                       
 486    2p 1D2537       166.8     0.     208.5 FIXEDHF     0.800  0       0.0  0  4s5p      -4p6s      
 487    2p 0E2537       954.2     0.    1192.8 FIXEDHF     0.800  0       0.0  0                       
 488    2q 1D2537        85.0     0.     106.3 FIXEDHF     0.800  0       0.0  0  4s5p      -4p7s      
 489    2q 0E2537       612.0     0.     765.0 FIXEDHF     0.800  0       0.0  0                       
 490    2r 1D2537        44.2     0.      55.3 FIXEDHF     0.800  0       0.0  0  4s5p      -4p8s      
 491    2r 0E2537       436.1     0.     545.1 FIXEDHF     0.800  0       0.0  0                       
 492    2s 1D2537        25.4     0.      31.7 FIXEDHF     0.800  0       0.0  0  4s5p      -4p9s      
 493    2s 0E2537       331.4     0.     414.3 FIXEDHF     0.800  0       0.0  0                       
 494    2t 1D2538     -2356.6     0.   -2945.7 FIXEDHF     0.800  0       0.0  0  4s5p      -4p4d      
 495    2t 2E2538      1199.8     0.    1499.7 FIXEDHF     0.800  0       0.0  0                       
 496    2u 1D2538       879.1     0.    1098.9 FIXEDHF     0.800  0       0.0  0  4s5p      -4p5d      
 497    2u 2E2538       925.7     0.    1157.1 FIXEDHF     0.800  0       0.0  0                       
 498    2v 1D2538      1014.1     0.    1267.6 FIXEDHF     0.800  0       0.0  0  4s5p      -4p6d      
 499    2v 2E2538       696.8     0.     871.0 FIXEDHF     0.800  0       0.0  0                       
 500    2w 1D2538       891.1     0.    1113.9 FIXEDHF     0.800  0       0.0  0  4s5p      -4p7d      
 501    2w 2E2538       539.1     0.     673.9 FIXEDHF     0.800  0       0.0  0                       
 502    2x 1D2538       755.6     0.     944.5 FIXEDHF     0.800  0       0.0  0  4s5p      -4p8d      
 503    2x 2E2538       430.2     0.     537.7 FIXEDHF     0.800  0       0.0  0                       
 504    2y 1D2538       641.5     0.     801.9 FIXEDHF     0.800  0       0.0  0  4s5p      -4p9d      
 505    2y 2E2538       352.5     0.     440.6 FIXEDHF     0.800  0       0.0  0                       
 506    2z 1D1534     -1291.3     0.   -1614.1 FIXEDHF     0.800  0       0.0  0  4s5p      -d9 4s4p5s 
 507    2z 2E1534      -671.9     0.    -839.9 FIXEDHF     0.800  0       0.0  0                       
 508    34 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s7p      
 509    34 1E2525       674.6     0.     843.3 FIXEDHF     0.800  0       0.0  0                       
 510    35 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s8p      
 511    35 1E2525       500.0     0.     625.0 FIXEDHF     0.800  0       0.0  0                       
 512    36 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s9p      
 513    36 1E2525       390.2     0.     487.8 FIXEDHF     0.800  0       0.0  0                       
 514    37 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s10p     
 515    37 1E2525       315.8     0.     394.7 FIXEDHF     0.800  0       0.0  0                       
 516    38 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s11p     
 517    38 1E2525       262.4     0.     328.0 FIXEDHF     0.800  0       0.0  0                       
 518    39 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s12p     
 519    39 1E2525       222.6     0.     278.3 FIXEDHF     0.800  0       0.0  0                       
 520    3A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s13p     
 521    3A 1E2525       192.1     0.     240.1 FIXEDHF     0.800  0       0.0  0                       
 522    3B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s14p     
 523    3B 1E2525       167.9     0.     209.9 FIXEDHF     0.800  0       0.0  0                       
 524    3C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s15p     
 525    3C 1E2525       148.4     0.     185.5 FIXEDHF     0.800  0       0.0  0                       
 526    3D 0D2545       354.5     0.     443.1 FIXEDHF     0.800  0       0.0  0  4s6p      -5s5p      
 527    3D 1E2545       538.2     0.     672.7 FIXEDHF     0.800  0       0.0  0                       
 528    3E 0D2545        62.6     0.      78.3 FIXEDHF     0.800  0       0.0  0  4s6p      -5s6p      
 529    3E 1E2545       248.3     0.     310.4 FIXEDHF     0.800  0       0.0  0                       
 530    3F 0D2545       124.8     0.     156.0 FIXEDHF     0.800  0       0.0  0  4s6p      -5s7p      
 531    3F 1E2545       157.2     0.     196.5 FIXEDHF     0.800  0       0.0  0                       
 532    3G 2D1523     -1429.7     0.   -1787.1 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 4p   
 533    3G 1E1523     -1465.0     0.   -1831.3 FIXEDHF     0.800  0       0.0  0                       
 534    3H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 5p   
 535    3H 2D1525      -606.2     0.    -757.8 FIXEDHF     0.800  0       0.0  0                       
 536    3H 1E1525      -487.7     0.    -609.6 FIXEDHF     0.800  0       0.0  0                       
 537    3I 2D1112       699.5     0.     874.4 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 6p   
 538    3I 2D1525      -382.6     0.    -478.3 FIXEDHF     0.800  0       0.0  0                       
 539    3I 1E1525      -293.1     0.    -366.4 FIXEDHF     0.800  0       0.0  0                       
 540    3J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 7p   
 541    3J 2D1525      -250.0     0.    -312.5 FIXEDHF     0.800  0       0.0  0                       
 542    3J 1E1525      -202.9     0.    -253.6 FIXEDHF     0.800  0       0.0  0                       
 543    3K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 8p   
 544    3K 2D1525      -182.7     0.    -228.4 FIXEDHF     0.800  0       0.0  0                       
 545    3K 1E1525      -151.5     0.    -189.4 FIXEDHF     0.800  0       0.0  0                       
 546    3L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 9p   
 547    3L 2D1525      -141.6     0.    -177.0 FIXEDHF     0.800  0       0.0  0                       
 548    3L 1E1525      -118.9     0.    -148.6 FIXEDHF     0.800  0       0.0  0                       
 549    3M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 10p  
 550    3M 2D1525      -114.2     0.    -142.7 FIXEDHF     0.800  0       0.0  0                       
 551    3M 1E1525       -96.6     0.    -120.7 FIXEDHF     0.800  0       0.0  0                       
 552    3N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 11p  
 553    3N 2D1525       -94.6     0.    -118.3 FIXEDHF     0.800  0       0.0  0                       
 554    3N 1E1525       -80.5     0.    -100.6 FIXEDHF     0.800  0       0.0  0                       
 555    3O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 12p  
 556    3O 2D1525       -80.2     0.    -100.2 FIXEDHF     0.800  0       0.0  0                       
 557    3O 1E1525       -68.4     0.     -85.5 FIXEDHF     0.800  0       0.0  0                       
 558    3P 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 13p  
 559    3P 2D1525       -69.1     0.     -86.4 FIXEDHF     0.800  0       0.0  0                       
 560    3P 1E1525       -59.1     0.     -73.9 FIXEDHF     0.800  0       0.0  0                       
 561    3Q 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 14p  
 562    3Q 2D1525       -60.3     0.     -75.4 FIXEDHF     0.800  0       0.0  0                       
 563    3Q 1E1525       -51.8     0.     -64.7 FIXEDHF     0.800  0       0.0  0                       
 564    3R 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 15p  
 565    3R 2D1525       -53.4     0.     -66.7 FIXEDHF     0.800  0       0.0  0                       
 566    3R 1E1525       -45.8     0.     -57.2 FIXEDHF     0.800  0       0.0  0                       
 567    3d 2D1526        11.8     0.      14.8 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 4f   
 568    3d 1E1526       -17.2     0.     -21.5 FIXEDHF     0.800  0       0.0  0                       
 569    3e 2D1526        27.8     0.      34.7 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 5f   
 570    3e 1E1526       -16.7     0.     -20.9 FIXEDHF     0.800  0       0.0  0                       
 571    3f 2D1526        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 6f   
 572    3f 1E1526       -14.6     0.     -18.3 FIXEDHF     0.800  0       0.0  0                       
 573    3g 2D1526        19.0     0.      23.7 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 7f   
 574    3g 1E1526       -12.6     0.     -15.8 FIXEDHF     0.800  0       0.0  0                       
 575    3h 2D1526        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 8f   
 576    3h 1E1526       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0                       
 577    3i 2D1526        12.9     0.      16.1 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 9f   
 578    3i 1E1526        -9.5     0.     -11.9 FIXEDHF     0.800  0       0.0  0                       
 579    3j 2D1526        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 10f  
 580    3j 1E1526        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0                       
 581    3k 2D1526         9.4     0.      11.7 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 11f  
 582    3k 1E1526        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
 583    3l 2D1526         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 12f  
 584    3l 1E1526        -6.6     0.      -8.3 FIXEDHF     0.800  0       0.0  0                       
 585    3m 2D1526         7.2     0.       9.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 13f  
 586    3m 1E1526        -5.9     0.      -7.4 FIXEDHF     0.800  0       0.0  0                       
 587    3n 2D1526         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 14f  
 588    3n 1E1526        -5.4     0.      -6.7 FIXEDHF     0.800  0       0.0  0                       
 589    3o 1D2534      3242.7     0.    4053.4 FIXEDHF     0.800  0       0.0  0  4s6p      -4p5s      
 590    3o 0E2534      1050.7     0.    1313.4 FIXEDHF     0.800  0       0.0  0                       
 591    3p 1D2537      1812.1     0.    2265.1 FIXEDHF     0.800  0       0.0  0  4s6p      -4p6s      
 592    3p 0E2537       556.2     0.     695.3 FIXEDHF     0.800  0       0.0  0                       
 593    3q 1D2537       202.5     0.     253.1 FIXEDHF     0.800  0       0.0  0  4s6p      -4p7s      
 594    3q 0E2537       357.6     0.     447.0 FIXEDHF     0.800  0       0.0  0                       
 595    3r 1D2537       129.9     0.     162.4 FIXEDHF     0.800  0       0.0  0  4s6p      -4p8s      
 596    3r 0E2537       255.1     0.     318.9 FIXEDHF     0.800  0       0.0  0                       
 597    3s 1D2537        88.6     0.     110.7 FIXEDHF     0.800  0       0.0  0  4s6p      -4p9s      
 598    3s 0E2537       193.9     0.     242.4 FIXEDHF     0.800  0       0.0  0                       
 599    3t 1D2538      -788.9     0.    -986.1 FIXEDHF     0.800  0       0.0  0  4s6p      -4p4d      
 600    3t 2E2538       620.0     0.     775.0 FIXEDHF     0.800  0       0.0  0                       
 601    3u 1D2538      -912.5     0.   -1140.6 FIXEDHF     0.800  0       0.0  0  4s6p      -4p5d      
 602    3u 2E2538       485.4     0.     606.8 FIXEDHF     0.800  0       0.0  0                       
 603    3v 1D2538       104.3     0.     130.4 FIXEDHF     0.800  0       0.0  0  4s6p      -4p6d      
 604    3v 2E2538       367.8     0.     459.7 FIXEDHF     0.800  0       0.0  0                       
 605    3w 1D2538       242.6     0.     303.3 FIXEDHF     0.800  0       0.0  0  4s6p      -4p7d      
 606    3w 2E2538       285.5     0.     356.9 FIXEDHF     0.800  0       0.0  0                       
 607    3x 1D2538       255.8     0.     319.7 FIXEDHF     0.800  0       0.0  0  4s6p      -4p8d      
 608    3x 2E2538       228.2     0.     285.3 FIXEDHF     0.800  0       0.0  0                       
 609    3y 1D2538       239.5     0.     299.4 FIXEDHF     0.800  0       0.0  0  4s6p      -4p9d      
 610    3y 2E2538       187.3     0.     234.1 FIXEDHF     0.800  0       0.0  0                       
 611    3z 1D1534      -759.4     0.    -949.2 FIXEDHF     0.800  0       0.0  0  4s6p      -d9 4s4p5s 
 612    3z 2E1534      -402.2     0.    -502.7 FIXEDHF     0.800  0       0.0  0                       
 613    45 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s8p      
 614    45 1E2525       341.9     0.     427.4 FIXEDHF     0.800  0       0.0  0                       
 615    46 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s9p      
 616    46 1E2525       266.9     0.     333.6 FIXEDHF     0.800  0       0.0  0                       
 617    47 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s10p     
 618    47 1E2525       216.0     0.     270.0 FIXEDHF     0.800  0       0.0  0                       
 619    48 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s11p     
 620    48 1E2525       179.5     0.     224.4 FIXEDHF     0.800  0       0.0  0                       
 621    49 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s12p     
 622    49 1E2525       152.3     0.     190.4 FIXEDHF     0.800  0       0.0  0                       
 623    4A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s13p     
 624    4A 1E2525       131.4     0.     164.3 FIXEDHF     0.800  0       0.0  0                       
 625    4B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s14p     
 626    4B 1E2525       114.9     0.     143.6 FIXEDHF     0.800  0       0.0  0                       
 627    4C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s15p     
 628    4C 1E2525       101.6     0.     127.0 FIXEDHF     0.800  0       0.0  0                       
 629    4D 0D2545       251.2     0.     314.0 FIXEDHF     0.800  0       0.0  0  4s7p      -5s5p      
 630    4D 1E2545       389.4     0.     486.8 FIXEDHF     0.800  0       0.0  0                       
 631    4E 0D2545       106.9     0.     133.6 FIXEDHF     0.800  0       0.0  0  4s7p      -5s6p      
 632    4E 1E2545       180.7     0.     225.9 FIXEDHF     0.800  0       0.0  0                       
 633    4F 0D2545        28.4     0.      35.5 FIXEDHF     0.800  0       0.0  0  4s7p      -5s7p      
 634    4F 1E2545       114.3     0.     142.9 FIXEDHF     0.800  0       0.0  0                       
 635    4G 2D1523      -972.0     0.   -1215.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 4p   
 636    4G 1E1523      -999.0     0.   -1248.7 FIXEDHF     0.800  0       0.0  0                       
 637    4H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 5p   
 638    4H 2D1525      -411.5     0.    -514.4 FIXEDHF     0.800  0       0.0  0                       
 639    4H 1E1525      -334.1     0.    -417.6 FIXEDHF     0.800  0       0.0  0                       
 640    4I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 6p   
 641    4I 2D1525      -258.2     0.    -322.7 FIXEDHF     0.800  0       0.0  0                       
 642    4I 1E1525      -200.9     0.    -251.1 FIXEDHF     0.800  0       0.0  0                       
 643    4J 2D1112       702.8     0.     878.5 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 7p   
 644    4J 2D1525      -181.8     0.    -227.3 FIXEDHF     0.800  0       0.0  0                       
 645    4J 1E1525      -139.0     0.    -173.8 FIXEDHF     0.800  0       0.0  0                       
 646    4K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 8p   
 647    4K 2D1525      -131.5     0.    -164.4 FIXEDHF     0.800  0       0.0  0                       
 648    4K 1E1525      -103.9     0.    -129.9 FIXEDHF     0.800  0       0.0  0                       
 649    4L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 9p   
 650    4L 2D1525      -101.8     0.    -127.2 FIXEDHF     0.800  0       0.0  0                       
 651    4L 1E1525       -81.5     0.    -101.9 FIXEDHF     0.800  0       0.0  0                       
 652    4M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 10p  
 653    4M 2D1525       -82.0     0.    -102.5 FIXEDHF     0.800  0       0.0  0                       
 654    4M 1E1525       -66.2     0.     -82.7 FIXEDHF     0.800  0       0.0  0                       
 655    4N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 11p  
 656    4N 2D1525       -67.9     0.     -84.9 FIXEDHF     0.800  0       0.0  0                       
 657    4N 1E1525       -55.1     0.     -68.9 FIXEDHF     0.800  0       0.0  0                       
 658    4O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 12p  
 659    4O 2D1525       -57.5     0.     -71.9 FIXEDHF     0.800  0       0.0  0                       
 660    4O 1E1525       -46.9     0.     -58.6 FIXEDHF     0.800  0       0.0  0                       
 661    4P 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 13p  
 662    4P 2D1525       -49.6     0.     -62.0 FIXEDHF     0.800  0       0.0  0                       
 663    4P 1E1525       -40.6     0.     -50.7 FIXEDHF     0.800  0       0.0  0                       
 664    4Q 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 14p  
 665    4Q 2D1525       -43.3     0.     -54.1 FIXEDHF     0.800  0       0.0  0                       
 666    4Q 1E1525       -35.4     0.     -44.3 FIXEDHF     0.800  0       0.0  0                       
 667    4R 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 15p  
 668    4R 2D1525       -38.2     0.     -47.8 FIXEDHF     0.800  0       0.0  0                       
 669    4R 1E1525       -31.4     0.     -39.3 FIXEDHF     0.800  0       0.0  0                       
 670    4d 2D1526         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 4f   
 671    4d 1E1526       -11.7     0.     -14.6 FIXEDHF     0.800  0       0.0  0                       
 672    4e 2D1526         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 5f   
 673    4e 1E1526       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0                       
 674    4f 2D1526        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 6f   
 675    4f 1E1526        -9.9     0.     -12.4 FIXEDHF     0.800  0       0.0  0                       
 676    4g 2D1526        10.1     0.      12.6 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 7f   
 677    4g 1E1526        -8.6     0.     -10.7 FIXEDHF     0.800  0       0.0  0                       
 678    4h 2D1526         8.8     0.      11.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 8f   
 679    4h 1E1526        -7.4     0.      -9.3 FIXEDHF     0.800  0       0.0  0                       
 680    4i 2D1526         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 9f   
 681    4i 1E1526        -6.5     0.      -8.1 FIXEDHF     0.800  0       0.0  0                       
 682    4j 2D1526         6.6     0.       8.2 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 10f  
 683    4j 1E1526        -5.7     0.      -7.1 FIXEDHF     0.800  0       0.0  0                       
 684    4k 2D1526         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 11f  
 685    4k 1E1526        -5.0     0.      -6.3 FIXEDHF     0.800  0       0.0  0                       
 686    4l 2D1526         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 12f  
 687    4l 1E1526        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0                       
 688    4m 2D1526         4.5     0.       5.6 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 13f  
 689    4m 1E1526        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
 690    4n 2D1526         4.0     0.       5.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 14f  
 691    4n 1E1526        -3.7     0.      -4.6 FIXEDHF     0.800  0       0.0  0                       
 692    4o 1D2534      2201.5     0.    2751.9 FIXEDHF     0.800  0       0.0  0  4s7p      -4p5s      
 693    4o 0E2534       713.0     0.     891.3 FIXEDHF     0.800  0       0.0  0                       
 694    4p 1D2537      1251.7     0.    1564.6 FIXEDHF     0.800  0       0.0  0  4s7p      -4p6s      
 695    4p 0E2537       378.6     0.     473.3 FIXEDHF     0.800  0       0.0  0                       
 696    4q 1D2537       764.7     0.     955.9 FIXEDHF     0.800  0       0.0  0  4s7p      -4p7s      
 697    4q 0E2537       243.7     0.     304.6 FIXEDHF     0.800  0       0.0  0                       
 698    4r 1D2537       142.2     0.     177.7 FIXEDHF     0.800  0       0.0  0  4s7p      -4p8s      
 699    4r 0E2537       173.9     0.     217.4 FIXEDHF     0.800  0       0.0  0                       
 700    4s 1D2537       100.6     0.     125.7 FIXEDHF     0.800  0       0.0  0  4s7p      -4p9s      
 701    4s 0E2537       132.3     0.     165.4 FIXEDHF     0.800  0       0.0  0                       
 702    4t 1D2538      -488.2     0.    -610.3 FIXEDHF     0.800  0       0.0  0  4s7p      -4p4d      
 703    4t 2E2538       399.6     0.     499.5 FIXEDHF     0.800  0       0.0  0                       
 704    4u 1D2538      -390.5     0.    -488.1 FIXEDHF     0.800  0       0.0  0  4s7p      -4p5d      
 705    4u 2E2538       315.0     0.     393.8 FIXEDHF     0.800  0       0.0  0                       
 706    4v 1D2538      -428.0     0.    -535.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4p6d      
 707    4v 2E2538       239.4     0.     299.2 FIXEDHF     0.800  0       0.0  0                       
 708    4w 1D2538       -18.0     0.     -22.5 FIXEDHF     0.800  0       0.0  0  4s7p      -4p7d      
 709    4w 2E2538       186.2     0.     232.7 FIXEDHF     0.800  0       0.0  0                       
 710    4x 1D2538        62.0     0.      77.5 FIXEDHF     0.800  0       0.0  0  4s7p      -4p8d      
 711    4x 2E2538       149.0     0.     186.2 FIXEDHF     0.800  0       0.0  0                       
 712    4y 1D2538        84.0     0.     105.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4p9d      
 713    4y 2E2538       122.3     0.     152.9 FIXEDHF     0.800  0       0.0  0                       
 714    4z 1D1534      -522.7     0.    -653.4 FIXEDHF     0.800  0       0.0  0  4s7p      -d9 4s4p5s 
 715    4z 2E1534      -277.5     0.    -346.9 FIXEDHF     0.800  0       0.0  0                       
 716    56 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s9p      
 717    56 1E2525       197.9     0.     247.4 FIXEDHF     0.800  0       0.0  0                       
 718    57 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s10p     
 719    57 1E2525       160.2     0.     200.3 FIXEDHF     0.800  0       0.0  0                       
 720    58 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s11p     
 721    58 1E2525       133.2     0.     166.5 FIXEDHF     0.800  0       0.0  0                       
 722    59 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s12p     
 723    59 1E2525       113.0     0.     141.3 FIXEDHF     0.800  0       0.0  0                       
 724    5A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s13p     
 725    5A 1E2525        97.5     0.     121.9 FIXEDHF     0.800  0       0.0  0                       
 726    5B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s14p     
 727    5B 1E2525        85.2     0.     106.5 FIXEDHF     0.800  0       0.0  0                       
 728    5C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s15p     
 729    5C 1E2525        75.4     0.      94.2 FIXEDHF     0.800  0       0.0  0                       
 730    5D 0D2545       189.1     0.     236.4 FIXEDHF     0.800  0       0.0  0  4s8p      -5s5p      
 731    5D 1E2545       297.3     0.     371.6 FIXEDHF     0.800  0       0.0  0                       
 732    5E 0D2545        83.4     0.     104.2 FIXEDHF     0.800  0       0.0  0  4s8p      -5s6p      
 733    5E 1E2545       138.3     0.     172.9 FIXEDHF     0.800  0       0.0  0                       
 734    5F 0D2545        47.6     0.      59.5 FIXEDHF     0.800  0       0.0  0  4s8p      -5s7p      
 735    5F 1E2545        87.4     0.     109.3 FIXEDHF     0.800  0       0.0  0                       
 736    5G 2D1523      -718.6     0.    -898.3 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 4p   
 737    5G 1E1523      -739.8     0.    -924.7 FIXEDHF     0.800  0       0.0  0                       
 738    5H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 5p   
 739    5H 2D1525      -304.3     0.    -380.4 FIXEDHF     0.800  0       0.0  0                       
 740    5H 1E1525      -248.0     0.    -310.0 FIXEDHF     0.800  0       0.0  0                       
 741    5I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 6p   
 742    5I 2D1525      -190.9     0.    -238.6 FIXEDHF     0.800  0       0.0  0                       
 743    5I 1E1525      -149.2     0.    -186.5 FIXEDHF     0.800  0       0.0  0                       
 744    5J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 7p   
 745    5J 2D1525      -134.1     0.    -167.6 FIXEDHF     0.800  0       0.0  0                       
 746    5J 1E1525      -103.3     0.    -129.1 FIXEDHF     0.800  0       0.0  0                       
 747    5K 2D1112       704.2     0.     880.2 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 8p   
 748    5K 2D1525      -101.0     0.    -126.2 FIXEDHF     0.800  0       0.0  0                       
 749    5K 1E1525       -77.1     0.     -96.4 FIXEDHF     0.800  0       0.0  0                       
 750    5L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 9p   
 751    5L 2D1525       -77.7     0.     -97.1 FIXEDHF     0.800  0       0.0  0                       
 752    5L 1E1525       -60.6     0.     -75.7 FIXEDHF     0.800  0       0.0  0                       
 753    5M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 10p  
 754    5M 2D1525       -62.5     0.     -78.1 FIXEDHF     0.800  0       0.0  0                       
 755    5M 1E1525       -49.2     0.     -61.5 FIXEDHF     0.800  0       0.0  0                       
 756    5N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 11p  
 757    5N 2D1525       -51.8     0.     -64.7 FIXEDHF     0.800  0       0.0  0                       
 758    5N 1E1525       -41.0     0.     -51.2 FIXEDHF     0.800  0       0.0  0                       
 759    5O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 12p  
 760    5O 2D1525       -43.8     0.     -54.8 FIXEDHF     0.800  0       0.0  0                       
 761    5O 1E1525       -34.8     0.     -43.5 FIXEDHF     0.800  0       0.0  0                       
 762    5P 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 13p  
 763    5P 2D1525       -37.8     0.     -47.2 FIXEDHF     0.800  0       0.0  0                       
 764    5P 1E1525       -30.1     0.     -37.6 FIXEDHF     0.800  0       0.0  0                       
 765    5Q 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 14p  
 766    5Q 2D1525       -33.0     0.     -41.2 FIXEDHF     0.800  0       0.0  0                       
 767    5Q 1E1525       -26.3     0.     -32.9 FIXEDHF     0.800  0       0.0  0                       
 768    5R 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 15p  
 769    5R 2D1525       -29.1     0.     -36.4 FIXEDHF     0.800  0       0.0  0                       
 770    5R 1E1525       -23.4     0.     -29.2 FIXEDHF     0.800  0       0.0  0                       
 771    5d 2D1526         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 4f   
 772    5d 1E1526        -8.6     0.     -10.8 FIXEDHF     0.800  0       0.0  0                       
 773    5e 2D1526         5.4     0.       6.8 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 5f   
 774    5e 1E1526        -8.4     0.     -10.5 FIXEDHF     0.800  0       0.0  0                       
 775    5f 2D1526         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 6f   
 776    5f 1E1526        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
 777    5g 2D1526         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 7f   
 778    5g 1E1526        -6.3     0.      -7.9 FIXEDHF     0.800  0       0.0  0                       
 779    5h 2D1526         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 8f   
 780    5h 1E1526        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0                       
 781    5i 2D1526         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 9f   
 782    5i 1E1526        -4.8     0.      -6.0 FIXEDHF     0.800  0       0.0  0                       
 783    5j 2D1526         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 10f  
 784    5j 1E1526        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0                       
 785    5k 2D1526         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 11f  
 786    5k 1E1526        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
 787    5l 2D1526         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 12f  
 788    5l 1E1526        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
 789    5m 2D1526         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 13f  
 790    5m 1E1526        -3.0     0.      -3.7 FIXEDHF     0.800  0       0.0  0                       
 791    5n 2D1526         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 14f  
 792    5n 1E1526        -2.7     0.      -3.4 FIXEDHF     0.800  0       0.0  0                       
 793    5o 1D2534      1629.6     0.    2037.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4p5s      
 794    5o 0E2534       526.4     0.     658.0 FIXEDHF     0.800  0       0.0  0                       
 795    5p 1D2537       935.8     0.    1169.8 FIXEDHF     0.800  0       0.0  0  4s8p      -4p6s      
 796    5p 0E2537       280.0     0.     350.0 FIXEDHF     0.800  0       0.0  0                       
 797    5q 1D2537       586.0     0.     732.5 FIXEDHF     0.800  0       0.0  0  4s8p      -4p7s      
 798    5q 0E2537       180.3     0.     225.4 FIXEDHF     0.800  0       0.0  0                       
 799    5r 1D2537       385.7     0.     482.1 FIXEDHF     0.800  0       0.0  0  4s8p      -4p8s      
 800    5r 0E2537       128.7     0.     160.9 FIXEDHF     0.800  0       0.0  0                       
 801    5s 1D2537        96.9     0.     121.1 FIXEDHF     0.800  0       0.0  0  4s8p      -4p9s      
 802    5s 0E2537        97.9     0.     122.4 FIXEDHF     0.800  0       0.0  0                       
 803    5t 1D2538      -349.7     0.    -437.1 FIXEDHF     0.800  0       0.0  0  4s8p      -4p4d      
 804    5t 2E2538       286.6     0.     358.2 FIXEDHF     0.800  0       0.0  0                       
 805    5u 1D2538      -262.3     0.    -327.9 FIXEDHF     0.800  0       0.0  0  4s8p      -4p5d      
 806    5u 2E2538       226.8     0.     283.5 FIXEDHF     0.800  0       0.0  0                       
 807    5v 1D2538      -209.9     0.    -262.4 FIXEDHF     0.800  0       0.0  0  4s8p      -4p6d      
 808    5v 2E2538       172.6     0.     215.8 FIXEDHF     0.800  0       0.0  0                       
 809    5w 1D2538      -231.1     0.    -288.9 FIXEDHF     0.800  0       0.0  0  4s8p      -4p7d      
 810    5w 2E2538       134.4     0.     168.0 FIXEDHF     0.800  0       0.0  0                       
 811    5x 1D2538       -36.4     0.     -45.5 FIXEDHF     0.800  0       0.0  0  4s8p      -4p8d      
 812    5x 2E2538       107.6     0.     134.5 FIXEDHF     0.800  0       0.0  0                       
 813    5y 1D2538         9.8     0.      12.3 FIXEDHF     0.800  0       0.0  0  4s8p      -4p9d      
 814    5y 2E2538        88.4     0.     110.5 FIXEDHF     0.800  0       0.0  0                       
 815    5z 1D1534      -389.6     0.    -487.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9 4s4p5s 
 816    5z 2E1534      -206.9     0.    -258.6 FIXEDHF     0.800  0       0.0  0                       
 817    67 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s10p     
 818    67 1E2525       125.1     0.     156.4 FIXEDHF     0.800  0       0.0  0                       
 819    68 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s11p     
 820    68 1E2525       104.0     0.     130.0 FIXEDHF     0.800  0       0.0  0                       
 821    69 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s12p     
 822    69 1E2525        88.2     0.     110.3 FIXEDHF     0.800  0       0.0  0                       
 823    6A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s13p     
 824    6A 1E2525        76.2     0.      95.2 FIXEDHF     0.800  0       0.0  0                       
 825    6B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s14p     
 826    6B 1E2525        66.6     0.      83.2 FIXEDHF     0.800  0       0.0  0                       
 827    6C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s15p     
 828    6C 1E2525        58.9     0.      73.6 FIXEDHF     0.800  0       0.0  0                       
 829    6D 0D2545       148.9     0.     186.1 FIXEDHF     0.800  0       0.0  0  4s9p      -5s5p      
 830    6D 1E2545       236.2     0.     295.2 FIXEDHF     0.800  0       0.0  0                       
 831    6E 0D2545        66.6     0.      83.2 FIXEDHF     0.800  0       0.0  0  4s9p      -5s6p      
 832    6E 1E2545       110.1     0.     137.6 FIXEDHF     0.800  0       0.0  0                       
 833    6F 0D2545        39.5     0.      49.4 FIXEDHF     0.800  0       0.0  0  4s9p      -5s7p      
 834    6F 1E2545        69.6     0.      87.0 FIXEDHF     0.800  0       0.0  0                       
 835    6G 2D1523      -560.1     0.    -700.1 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 4p   
 836    6G 1E1523      -577.1     0.    -721.4 FIXEDHF     0.800  0       0.0  0                       
 837    6H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 5p   
 838    6H 2D1525      -237.3     0.    -296.6 FIXEDHF     0.800  0       0.0  0                       
 839    6H 1E1525      -193.8     0.    -242.2 FIXEDHF     0.800  0       0.0  0                       
 840    6I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 6p   
 841    6I 2D1525      -148.9     0.    -186.1 FIXEDHF     0.800  0       0.0  0                       
 842    6I 1E1525      -116.6     0.    -145.7 FIXEDHF     0.800  0       0.0  0                       
 843    6J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 7p   
 844    6J 2D1525      -104.6     0.    -130.7 FIXEDHF     0.800  0       0.0  0                       
 845    6J 1E1525       -80.7     0.    -100.9 FIXEDHF     0.800  0       0.0  0                       
 846    6K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 8p   
 847    6K 2D1525       -78.6     0.     -98.3 FIXEDHF     0.800  0       0.0  0                       
 848    6K 1E1525       -60.3     0.     -75.4 FIXEDHF     0.800  0       0.0  0                       
 849    6L 2D1112       704.8     0.     881.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 9p   
 850    6L 2D1525       -61.9     0.     -77.4 FIXEDHF     0.800  0       0.0  0                       
 851    6L 1E1525       -47.3     0.     -59.1 FIXEDHF     0.800  0       0.0  0                       
 852    6M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 10p  
 853    6M 2D1525       -49.6     0.     -62.0 FIXEDHF     0.800  0       0.0  0                       
 854    6M 1E1525       -38.4     0.     -48.0 FIXEDHF     0.800  0       0.0  0                       
 855    6N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 11p  
 856    6N 2D1525       -41.1     0.     -51.4 FIXEDHF     0.800  0       0.0  0                       
 857    6N 1E1525       -32.0     0.     -40.0 FIXEDHF     0.800  0       0.0  0                       
 858    6O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 12p  
 859    6O 2D1525       -34.8     0.     -43.5 FIXEDHF     0.800  0       0.0  0                       
 860    6O 1E1525       -27.2     0.     -34.0 FIXEDHF     0.800  0       0.0  0                       
 861    6P 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 13p  
 862    6P 2D1525       -29.9     0.     -37.4 FIXEDHF     0.800  0       0.0  0                       
 863    6P 1E1525       -23.5     0.     -29.4 FIXEDHF     0.800  0       0.0  0                       
 864    6Q 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 14p  
 865    6Q 2D1525       -26.2     0.     -32.7 FIXEDHF     0.800  0       0.0  0                       
 866    6Q 1E1525       -20.6     0.     -25.8 FIXEDHF     0.800  0       0.0  0                       
 867    6R 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 15p  
 868    6R 2D1525       -23.1     0.     -28.9 FIXEDHF     0.800  0       0.0  0                       
 869    6R 1E1525       -18.2     0.     -22.8 FIXEDHF     0.800  0       0.0  0                       
 870    6d 2D1526         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 4f   
 871    6d 1E1526        -6.7     0.      -8.4 FIXEDHF     0.800  0       0.0  0                       
 872    6e 2D1526         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 5f   
 873    6e 1E1526        -6.6     0.      -8.2 FIXEDHF     0.800  0       0.0  0                       
 874    6f 2D1526         3.6     0.       4.5 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 6f   
 875    6f 1E1526        -5.8     0.      -7.2 FIXEDHF     0.800  0       0.0  0                       
 876    6g 2D1526         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 7f   
 877    6g 1E1526        -5.0     0.      -6.2 FIXEDHF     0.800  0       0.0  0                       
 878    6h 2D1526         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 8f   
 879    6h 1E1526        -4.2     0.      -5.3 FIXEDHF     0.800  0       0.0  0                       
 880    6i 2D1526         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 9f   
 881    6i 1E1526        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
 882    6j 2D1526         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 10f  
 883    6j 1E1526        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0                       
 884    6k 2D1526         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 11f  
 885    6k 1E1526        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
 886    6l 2D1526         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 12f  
 887    6l 1E1526        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
 888    6m 2D1526         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 13f  
 889    6m 1E1526        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
 890    6n 2D1526         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 14f  
 891    6n 1E1526        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
 892    6o 1D2534      1272.1     0.    1590.1 FIXEDHF     0.800  0       0.0  0  4s9p      -4p5s      
 893    6o 0E2534       409.8     0.     512.2 FIXEDHF     0.800  0       0.0  0                       
 894    6p 1D2537       734.8     0.     918.5 FIXEDHF     0.800  0       0.0  0  4s9p      -4p6s      
 895    6p 0E2537       218.2     0.     272.8 FIXEDHF     0.800  0       0.0  0                       
 896    6q 1D2537       465.8     0.     582.2 FIXEDHF     0.800  0       0.0  0  4s9p      -4p7s      
 897    6q 0E2537       140.6     0.     175.7 FIXEDHF     0.800  0       0.0  0                       
 898    6r 1D2537       314.6     0.     393.3 FIXEDHF     0.800  0       0.0  0  4s9p      -4p8s      
 899    6r 0E2537       100.4     0.     125.5 FIXEDHF     0.800  0       0.0  0                       
 900    6s 1D2537       219.1     0.     273.9 FIXEDHF     0.800  0       0.0  0  4s9p      -4p9s      
 901    6s 0E2537        76.3     0.      95.4 FIXEDHF     0.800  0       0.0  0                       
 902    6t 1D2538      -269.0     0.    -336.2 FIXEDHF     0.800  0       0.0  0  4s9p      -4p4d      
 903    6t 2E2538       219.0     0.     273.8 FIXEDHF     0.800  0       0.0  0                       
 904    6u 1D2538      -197.0     0.    -246.2 FIXEDHF     0.800  0       0.0  0  4s9p      -4p5d      
 905    6u 2E2538       173.8     0.     217.3 FIXEDHF     0.800  0       0.0  0                       
 906    6v 1D2538      -148.6     0.    -185.7 FIXEDHF     0.800  0       0.0  0  4s9p      -4p6d      
 907    6v 2E2538       132.5     0.     165.6 FIXEDHF     0.800  0       0.0  0                       
 908    6w 1D2538      -124.3     0.    -155.4 FIXEDHF     0.800  0       0.0  0  4s9p      -4p7d      
 909    6w 2E2538       103.1     0.     128.9 FIXEDHF     0.800  0       0.0  0                       
 910    6x 1D2538      -138.0     0.    -172.5 FIXEDHF     0.800  0       0.0  0  4s9p      -4p8d      
 911    6x 2E2538        82.6     0.     103.3 FIXEDHF     0.800  0       0.0  0                       
 912    6y 1D2538       -34.2     0.     -42.7 FIXEDHF     0.800  0       0.0  0  4s9p      -4p9d      
 913    6y 2E2538        67.8     0.      84.8 FIXEDHF     0.800  0       0.0  0                       
 914    6z 1D1534      -305.4     0.    -381.7 FIXEDHF     0.800  0       0.0  0  4s9p      -d9 4s4p5s 
 915    6z 2E1534      -162.1     0.    -202.6 FIXEDHF     0.800  0       0.0  0                       
 916    78 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s11p     
 917    78 1E2525        84.2     0.     105.2 FIXEDHF     0.800  0       0.0  0                       
 918    79 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s12p     
 919    79 1E2525        71.4     0.      89.3 FIXEDHF     0.800  0       0.0  0                       
 920    7A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s13p     
 921    7A 1E2525        61.6     0.      77.0 FIXEDHF     0.800  0       0.0  0                       
 922    7B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s14p     
 923    7B 1E2525        53.8     0.      67.3 FIXEDHF     0.800  0       0.0  0                       
 924    7C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s15p     
 925    7C 1E2525        47.6     0.      59.5 FIXEDHF     0.800  0       0.0  0                       
 926    7D 0D2545       121.1     0.     151.4 FIXEDHF     0.800  0       0.0  0  4s10p     -5s5p      
 927    7D 1E2545       193.4     0.     241.7 FIXEDHF     0.800  0       0.0  0                       
 928    7E 0D2545        54.6     0.      68.3 FIXEDHF     0.800  0       0.0  0  4s10p     -5s6p      
 929    7E 1E2545        90.2     0.     112.8 FIXEDHF     0.800  0       0.0  0                       
 930    7F 0D2545        32.9     0.      41.1 FIXEDHF     0.800  0       0.0  0  4s10p     -5s7p      
 931    7F 1E2545        57.0     0.      71.3 FIXEDHF     0.800  0       0.0  0                       
 932    7G 2D1523      -452.8     0.    -566.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 4p   
 933    7G 1E1523      -466.9     0.    -583.6 FIXEDHF     0.800  0       0.0  0                       
 934    7H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 5p   
 935    7H 2D1525      -191.9     0.    -239.9 FIXEDHF     0.800  0       0.0  0                       
 936    7H 1E1525      -156.9     0.    -196.1 FIXEDHF     0.800  0       0.0  0                       
 937    7I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 6p   
 938    7I 2D1525      -120.5     0.    -150.6 FIXEDHF     0.800  0       0.0  0                       
 939    7I 1E1525       -94.4     0.    -118.0 FIXEDHF     0.800  0       0.0  0                       
 940    7J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 7p   
 941    7J 2D1525       -84.6     0.    -105.8 FIXEDHF     0.800  0       0.0  0                       
 942    7J 1E1525       -65.4     0.     -81.7 FIXEDHF     0.800  0       0.0  0                       
 943    7K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 8p   
 944    7K 2D1525       -63.6     0.     -79.5 FIXEDHF     0.800  0       0.0  0                       
 945    7K 1E1525       -48.8     0.     -61.0 FIXEDHF     0.800  0       0.0  0                       
 946    7L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 9p   
 947    7L 2D1525       -50.1     0.     -62.6 FIXEDHF     0.800  0       0.0  0                       
 948    7L 1E1525       -38.3     0.     -47.9 FIXEDHF     0.800  0       0.0  0                       
 949    7M 2D1112       705.2     0.     881.5 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 10p  
 950    7M 2D1525       -40.7     0.     -50.9 FIXEDHF     0.800  0       0.0  0                       
 951    7M 1E1525       -31.1     0.     -38.9 FIXEDHF     0.800  0       0.0  0                       
 952    7N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 11p  
 953    7N 2D1525       -33.6     0.     -42.0 FIXEDHF     0.800  0       0.0  0                       
 954    7N 1E1525       -25.9     0.     -32.4 FIXEDHF     0.800  0       0.0  0                       
 955    7O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 12p  
 956    7O 2D1525       -28.5     0.     -35.6 FIXEDHF     0.800  0       0.0  0                       
 957    7O 1E1525       -22.1     0.     -27.6 FIXEDHF     0.800  0       0.0  0                       
 958    7P 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 13p  
 959    7P 2D1525       -24.5     0.     -30.6 FIXEDHF     0.800  0       0.0  0                       
 960    7P 1E1525       -19.0     0.     -23.8 FIXEDHF     0.800  0       0.0  0                       
 961    7Q 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 14p  
 962    7Q 2D1525       -21.4     0.     -26.8 FIXEDHF     0.800  0       0.0  0                       
 963    7Q 1E1525       -16.7     0.     -20.9 FIXEDHF     0.800  0       0.0  0                       
 964    7R 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 15p  
 965    7R 2D1525       -18.9     0.     -23.6 FIXEDHF     0.800  0       0.0  0                       
 966    7R 1E1525       -14.8     0.     -18.5 FIXEDHF     0.800  0       0.0  0                       
 967    7d 2D1526         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 4f   
 968    7d 1E1526        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0                       
 969    7e 2D1526         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 5f   
 970    7e 1E1526        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
 971    7f 2D1526         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 6f   
 972    7f 1E1526        -4.6     0.      -5.8 FIXEDHF     0.800  0       0.0  0                       
 973    7g 2D1526         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 7f   
 974    7g 1E1526        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
 975    7h 2D1526         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 8f   
 976    7h 1E1526        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0                       
 977    7i 2D1526         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 9f   
 978    7i 1E1526        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
 979    7j 2D1526         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 10f  
 980    7j 1E1526        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
 981    7k 2D1526         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 11f  
 982    7k 1E1526        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
 983    7l 2D1526         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 12f  
 984    7l 1E1526        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
 985    7m 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 13f  
 986    7m 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
 987    7n 2D1526         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 14f  
 988    7n 1E1526        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
 989    7o 1D2534      1030.0     0.    1287.5 FIXEDHF     0.800  0       0.0  0  4s10p     -4p5s      
 990    7o 0E2534       331.0     0.     413.7 FIXEDHF     0.800  0       0.0  0                       
 991    7p 1D2537       597.2     0.     746.5 FIXEDHF     0.800  0       0.0  0  4s10p     -4p6s      
 992    7p 0E2537       176.4     0.     220.5 FIXEDHF     0.800  0       0.0  0                       
 993    7q 1D2537       381.1     0.     476.4 FIXEDHF     0.800  0       0.0  0  4s10p     -4p7s      
 994    7q 0E2537       113.7     0.     142.1 FIXEDHF     0.800  0       0.0  0                       
 995    7r 1D2537       260.7     0.     325.9 FIXEDHF     0.800  0       0.0  0  4s10p     -4p8s      
 996    7r 0E2537        81.1     0.     101.4 FIXEDHF     0.800  0       0.0  0                       
 997    7s 1D2537       186.3     0.     232.9 FIXEDHF     0.800  0       0.0  0  4s10p     -4p9s      
 998    7s 0E2537        61.8     0.      77.2 FIXEDHF     0.800  0       0.0  0                       
 999    7t 1D2538      -216.2     0.    -270.3 FIXEDHF     0.800  0       0.0  0  4s10p     -4p4d      
1000    7t 2E2538       174.7     0.     218.4 FIXEDHF     0.800  0       0.0  0                       
1001    7u 1D2538      -156.6     0.    -195.7 FIXEDHF     0.800  0       0.0  0  4s10p     -4p5d      
1002    7u 2E2538       138.9     0.     173.6 FIXEDHF     0.800  0       0.0  0                       
1003    7v 1D2538      -115.3     0.    -144.1 FIXEDHF     0.800  0       0.0  0  4s10p     -4p6d      
1004    7v 2E2538       105.9     0.     132.4 FIXEDHF     0.800  0       0.0  0                       
1005    7w 1D2538       -91.4     0.    -114.2 FIXEDHF     0.800  0       0.0  0  4s10p     -4p7d      
1006    7w 2E2538        82.6     0.     103.2 FIXEDHF     0.800  0       0.0  0                       
1007    7x 1D2538       -79.4     0.     -99.3 FIXEDHF     0.800  0       0.0  0  4s10p     -4p8d      
1008    7x 2E2538        66.2     0.      82.7 FIXEDHF     0.800  0       0.0  0                       
1009    7y 1D2538       -88.6     0.    -110.8 FIXEDHF     0.800  0       0.0  0  4s10p     -4p9d      
1010    7y 2E2538        54.3     0.      67.9 FIXEDHF     0.800  0       0.0  0                       
1011    7z 1D1534      -247.9     0.    -309.9 FIXEDHF     0.800  0       0.0  0  4s10p     -d9 4s4p5s 
1012    7z 2E1534      -131.4     0.    -164.3 FIXEDHF     0.800  0       0.0  0                       
1013    89 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4s12p     
1014    89 1E2525        59.4     0.      74.2 FIXEDHF     0.800  0       0.0  0                       
1015    8A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4s13p     
1016    8A 1E2525        51.2     0.      64.0 FIXEDHF     0.800  0       0.0  0                       
1017    8B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4s14p     
1018    8B 1E2525        44.8     0.      56.0 FIXEDHF     0.800  0       0.0  0                       
1019    8C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4s15p     
1020    8C 1E2525        39.6     0.      49.5 FIXEDHF     0.800  0       0.0  0                       
1021    8D 0D2545       101.0     0.     126.2 FIXEDHF     0.800  0       0.0  0  4s11p     -5s5p      
1022    8D 1E2545       162.0     0.     202.5 FIXEDHF     0.800  0       0.0  0                       
1023    8E 0D2545        45.8     0.      57.2 FIXEDHF     0.800  0       0.0  0  4s11p     -5s6p      
1024    8E 1E2545        75.7     0.      94.6 FIXEDHF     0.800  0       0.0  0                       
1025    8F 0D2545        27.8     0.      34.8 FIXEDHF     0.800  0       0.0  0  4s11p     -5s7p      
1026    8F 1E2545        47.8     0.      59.8 FIXEDHF     0.800  0       0.0  0                       
1027    8G 2D1523      -376.1     0.    -470.1 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 4p   
1028    8G 1E1523      -388.0     0.    -485.0 FIXEDHF     0.800  0       0.0  0                       
1029    8H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 5p   
1030    8H 2D1525      -159.5     0.    -199.4 FIXEDHF     0.800  0       0.0  0                       
1031    8H 1E1525      -130.5     0.    -163.1 FIXEDHF     0.800  0       0.0  0                       
1032    8I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 6p   
1033    8I 2D1525      -100.2     0.    -125.2 FIXEDHF     0.800  0       0.0  0                       
1034    8I 1E1525       -78.6     0.     -98.2 FIXEDHF     0.800  0       0.0  0                       
1035    8J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 7p   
1036    8J 2D1525       -70.4     0.     -88.0 FIXEDHF     0.800  0       0.0  0                       
1037    8J 1E1525       -54.4     0.     -68.0 FIXEDHF     0.800  0       0.0  0                       
1038    8K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 8p   
1039    8K 2D1525       -52.9     0.     -66.1 FIXEDHF     0.800  0       0.0  0                       
1040    8K 1E1525       -40.6     0.     -50.8 FIXEDHF     0.800  0       0.0  0                       
1041    8L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 9p   
1042    8L 2D1525       -41.6     0.     -52.0 FIXEDHF     0.800  0       0.0  0                       
1043    8L 1E1525       -31.8     0.     -39.8 FIXEDHF     0.800  0       0.0  0                       
1044    8M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 10p  
1045    8M 2D1525       -33.8     0.     -42.3 FIXEDHF     0.800  0       0.0  0                       
1046    8M 1E1525       -25.9     0.     -32.4 FIXEDHF     0.800  0       0.0  0                       
1047    8N 2D1112       705.4     0.     881.8 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 11p  
1048    8N 2D1525       -28.2     0.     -35.3 FIXEDHF     0.800  0       0.0  0                       
1049    8N 1E1525       -21.6     0.     -27.0 FIXEDHF     0.800  0       0.0  0                       
1050    8O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 12p  
1051    8O 2D1525       -23.8     0.     -29.8 FIXEDHF     0.800  0       0.0  0                       
1052    8O 1E1525       -18.3     0.     -22.9 FIXEDHF     0.800  0       0.0  0                       
1053    8P 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 13p  
1054    8P 2D1525       -20.6     0.     -25.7 FIXEDHF     0.800  0       0.0  0                       
1055    8P 1E1525       -15.8     0.     -19.8 FIXEDHF     0.800  0       0.0  0                       
1056    8Q 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 14p  
1057    8Q 2D1525       -17.9     0.     -22.4 FIXEDHF     0.800  0       0.0  0                       
1058    8Q 1E1525       -13.9     0.     -17.4 FIXEDHF     0.800  0       0.0  0                       
1059    8R 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 15p  
1060    8R 2D1525       -15.8     0.     -19.8 FIXEDHF     0.800  0       0.0  0                       
1061    8R 1E1525       -12.3     0.     -15.4 FIXEDHF     0.800  0       0.0  0                       
1062    8d 2D1526         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 4f   
1063    8d 1E1526        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
1064    8e 2D1526         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 5f   
1065    8e 1E1526        -4.4     0.      -5.5 FIXEDHF     0.800  0       0.0  0                       
1066    8f 2D1526         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 6f   
1067    8f 1E1526        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
1068    8g 2D1526         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 7f   
1069    8g 1E1526        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1070    8h 2D1526         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 8f   
1071    8h 1E1526        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
1072    8i 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 9f   
1073    8i 1E1526        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1074    8j 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 10f  
1075    8j 1E1526        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1076    8k 2D1526         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 11f  
1077    8k 1E1526        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
1078    8l 2D1526         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 12f  
1079    8l 1E1526        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
1080    8m 2D1526         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 13f  
1081    8m 1E1526        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1082    8n 2D1526         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 14f  
1083    8n 1E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1084    8o 1D2534       856.6     0.    1070.8 FIXEDHF     0.800  0       0.0  0  4s11p     -4p5s      
1085    8o 0E2534       274.7     0.     343.4 FIXEDHF     0.800  0       0.0  0                       
1086    8p 1D2537       498.1     0.     622.6 FIXEDHF     0.800  0       0.0  0  4s11p     -4p6s      
1087    8p 0E2537       146.5     0.     183.1 FIXEDHF     0.800  0       0.0  0                       
1088    8q 1D2537       319.2     0.     399.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4p7s      
1089    8q 0E2537        94.4     0.     118.0 FIXEDHF     0.800  0       0.0  0                       
1090    8r 1D2537       219.9     0.     274.9 FIXEDHF     0.800  0       0.0  0  4s11p     -4p8s      
1091    8r 0E2537        67.4     0.      84.3 FIXEDHF     0.800  0       0.0  0                       
1092    8s 1D2537       159.1     0.     198.9 FIXEDHF     0.800  0       0.0  0  4s11p     -4p9s      
1093    8s 0E2537        51.3     0.      64.1 FIXEDHF     0.800  0       0.0  0                       
1094    8t 1D2538      -179.1     0.    -223.9 FIXEDHF     0.800  0       0.0  0  4s11p     -4p4d      
1095    8t 2E2538       143.7     0.     179.6 FIXEDHF     0.800  0       0.0  0                       
1096    8u 1D2538      -128.9     0.    -161.1 FIXEDHF     0.800  0       0.0  0  4s11p     -4p5d      
1097    8u 2E2538       114.4     0.     143.0 FIXEDHF     0.800  0       0.0  0                       
1098    8v 1D2538       -93.8     0.    -117.3 FIXEDHF     0.800  0       0.0  0  4s11p     -4p6d      
1099    8v 2E2538        87.3     0.     109.1 FIXEDHF     0.800  0       0.0  0                       
1100    8w 1D2538       -72.6     0.     -90.8 FIXEDHF     0.800  0       0.0  0  4s11p     -4p7d      
1101    8w 2E2538        68.0     0.      85.0 FIXEDHF     0.800  0       0.0  0                       
1102    8x 1D2538       -60.1     0.     -75.1 FIXEDHF     0.800  0       0.0  0  4s11p     -4p8d      
1103    8x 2E2538        54.6     0.      68.2 FIXEDHF     0.800  0       0.0  0                       
1104    8y 1D2538       -53.8     0.     -67.3 FIXEDHF     0.800  0       0.0  0  4s11p     -4p9d      
1105    8y 2E2538        44.8     0.      56.0 FIXEDHF     0.800  0       0.0  0                       
1106    8z 1D1534      -206.6     0.    -258.2 FIXEDHF     0.800  0       0.0  0  4s11p     -d9 4s4p5s 
1107    8z 2E1534      -109.4     0.    -136.8 FIXEDHF     0.800  0       0.0  0                       
1108    9A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -4s13p     
1109    9A 1E2525        43.4     0.      54.3 FIXEDHF     0.800  0       0.0  0                       
1110    9B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -4s14p     
1111    9B 1E2525        38.0     0.      47.5 FIXEDHF     0.800  0       0.0  0                       
1112    9C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -4s15p     
1113    9C 1E2525        33.6     0.      42.0 FIXEDHF     0.800  0       0.0  0                       
1114    9D 0D2545        85.9     0.     107.4 FIXEDHF     0.800  0       0.0  0  4s12p     -5s5p      
1115    9D 1E2545       138.3     0.     172.9 FIXEDHF     0.800  0       0.0  0                       
1116    9E 0D2545        39.0     0.      48.8 FIXEDHF     0.800  0       0.0  0  4s12p     -5s6p      
1117    9E 1E2545        64.6     0.      80.8 FIXEDHF     0.800  0       0.0  0                       
1118    9F 0D2545        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0  4s12p     -5s7p      
1119    9F 1E2545        40.9     0.      51.1 FIXEDHF     0.800  0       0.0  0                       
1120    9G 2D1523      -318.9     0.    -398.6 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 4p   
1121    9G 1E1523      -329.1     0.    -411.4 FIXEDHF     0.800  0       0.0  0                       
1122    9H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 5p   
1123    9H 2D1525      -135.4     0.    -169.2 FIXEDHF     0.800  0       0.0  0                       
1124    9H 1E1525      -110.7     0.    -138.4 FIXEDHF     0.800  0       0.0  0                       
1125    9I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 6p   
1126    9I 2D1525       -85.0     0.    -106.3 FIXEDHF     0.800  0       0.0  0                       
1127    9I 1E1525       -66.6     0.     -83.3 FIXEDHF     0.800  0       0.0  0                       
1128    9J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 7p   
1129    9J 2D1525       -59.8     0.     -74.7 FIXEDHF     0.800  0       0.0  0                       
1130    9J 1E1525       -46.2     0.     -57.7 FIXEDHF     0.800  0       0.0  0                       
1131    9K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 8p   
1132    9K 2D1525       -44.9     0.     -56.1 FIXEDHF     0.800  0       0.0  0                       
1133    9K 1E1525       -34.5     0.     -43.1 FIXEDHF     0.800  0       0.0  0                       
1134    9L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 9p   
1135    9L 2D1525       -35.4     0.     -44.2 FIXEDHF     0.800  0       0.0  0                       
1136    9L 1E1525       -27.0     0.     -33.8 FIXEDHF     0.800  0       0.0  0                       
1137    9M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 10p  
1138    9M 2D1525       -28.7     0.     -35.9 FIXEDHF     0.800  0       0.0  0                       
1139    9M 1E1525       -22.0     0.     -27.5 FIXEDHF     0.800  0       0.0  0                       
1140    9N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 11p  
1141    9N 2D1525       -24.0     0.     -30.0 FIXEDHF     0.800  0       0.0  0                       
1142    9N 1E1525       -18.3     0.     -22.9 FIXEDHF     0.800  0       0.0  0                       
1143    9O 2D1112       705.6     0.     882.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 12p  
1144    9O 2D1525       -20.4     0.     -25.5 FIXEDHF     0.800  0       0.0  0                       
1145    9O 1E1525       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
1146    9P 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 13p  
1147    9P 2D1525       -17.5     0.     -21.9 FIXEDHF     0.800  0       0.0  0                       
1148    9P 1E1525       -13.4     0.     -16.8 FIXEDHF     0.800  0       0.0  0                       
1149    9Q 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 14p  
1150    9Q 2D1525       -15.3     0.     -19.1 FIXEDHF     0.800  0       0.0  0                       
1151    9Q 1E1525       -11.8     0.     -14.7 FIXEDHF     0.800  0       0.0  0                       
1152    9R 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 15p  
1153    9R 2D1525       -13.5     0.     -16.9 FIXEDHF     0.800  0       0.0  0                       
1154    9R 1E1525       -10.4     0.     -13.0 FIXEDHF     0.800  0       0.0  0                       
1155    9d 2D1526         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 4f   
1156    9d 1E1526        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
1157    9e 2D1526         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 5f   
1158    9e 1E1526        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
1159    9f 2D1526         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 6f   
1160    9f 1E1526        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0                       
1161    9g 2D1526         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 7f   
1162    9g 1E1526        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
1163    9h 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 8f   
1164    9h 1E1526        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
1165    9i 2D1526         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 9f   
1166    9i 1E1526        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1167    9j 2D1526         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 10f  
1168    9j 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1169    9k 2D1526         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 11f  
1170    9k 1E1526        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
1171    9l 2D1526         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 12f  
1172    9l 1E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1173    9m 2D1526         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 13f  
1174    9m 1E1526        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1175    9n 2D1526         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 14f  
1176    9n 1E1526        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1177    9o 1D2534       727.4     0.     909.2 FIXEDHF     0.800  0       0.0  0  4s12p     -4p5s      
1178    9o 0E2534       232.8     0.     291.0 FIXEDHF     0.800  0       0.0  0                       
1179    9p 1D2537       423.8     0.     529.7 FIXEDHF     0.800  0       0.0  0  4s12p     -4p6s      
1180    9p 0E2537       124.2     0.     155.3 FIXEDHF     0.800  0       0.0  0                       
1181    9q 1D2537       272.4     0.     340.5 FIXEDHF     0.800  0       0.0  0  4s12p     -4p7s      
1182    9q 0E2537        80.1     0.     100.1 FIXEDHF     0.800  0       0.0  0                       
1183    9r 1D2537       188.5     0.     235.6 FIXEDHF     0.800  0       0.0  0  4s12p     -4p8s      
1184    9r 0E2537        57.2     0.      71.5 FIXEDHF     0.800  0       0.0  0                       
1185    9s 1D2537       137.4     0.     171.7 FIXEDHF     0.800  0       0.0  0  4s12p     -4p9s      
1186    9s 0E2537        43.5     0.      54.4 FIXEDHF     0.800  0       0.0  0                       
1187    9t 1D2538      -151.8     0.    -189.7 FIXEDHF     0.800  0       0.0  0  4s12p     -4p4d      
1188    9t 2E2538       121.0     0.     151.2 FIXEDHF     0.800  0       0.0  0                       
1189    9u 1D2538      -108.8     0.    -136.0 FIXEDHF     0.800  0       0.0  0  4s12p     -4p5d      
1190    9u 2E2538        96.4     0.     120.5 FIXEDHF     0.800  0       0.0  0                       
1191    9v 1D2538       -78.6     0.     -98.3 FIXEDHF     0.800  0       0.0  0  4s12p     -4p6d      
1192    9v 2E2538        73.6     0.      92.0 FIXEDHF     0.800  0       0.0  0                       
1193    9w 1D2538       -60.2     0.     -75.3 FIXEDHF     0.800  0       0.0  0  4s12p     -4p7d      
1194    9w 2E2538        57.4     0.      71.7 FIXEDHF     0.800  0       0.0  0                       
1195    9x 1D2538       -48.8     0.     -61.0 FIXEDHF     0.800  0       0.0  0  4s12p     -4p8d      
1196    9x 2E2538        46.0     0.      57.5 FIXEDHF     0.800  0       0.0  0                       
1197    9y 1D2538       -41.7     0.     -52.1 FIXEDHF     0.800  0       0.0  0  4s12p     -4p9d      
1198    9y 2E2538        37.8     0.      47.2 FIXEDHF     0.800  0       0.0  0                       
1199    9z 1D1534      -175.6     0.    -219.5 FIXEDHF     0.800  0       0.0  0  4s12p     -d9 4s4p5s 
1200    9z 2E1534       -93.0     0.    -116.2 FIXEDHF     0.800  0       0.0  0                       
1201    AB 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -4s14p     
1202    AB 1E2525        32.8     0.      41.0 FIXEDHF     0.800  0       0.0  0                       
1203    AC 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -4s15p     
1204    AC 1E2525        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0                       
1205    AD 0D2545        74.2     0.      92.8 FIXEDHF     0.800  0       0.0  0  4s13p     -5s5p      
1206    AD 1E2545       119.8     0.     149.8 FIXEDHF     0.800  0       0.0  0                       
1207    AE 0D2545        33.8     0.      42.3 FIXEDHF     0.800  0       0.0  0  4s13p     -5s6p      
1208    AE 1E2545        56.1     0.      70.1 FIXEDHF     0.800  0       0.0  0                       
1209    AF 0D2545        20.7     0.      25.9 FIXEDHF     0.800  0       0.0  0  4s13p     -5s7p      
1210    AF 1E2545        35.4     0.      44.3 FIXEDHF     0.800  0       0.0  0                       
1211    AG 2D1523      -275.0     0.    -343.7 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 4p   
1212    AG 1E1523      -283.8     0.    -354.8 FIXEDHF     0.800  0       0.0  0                       
1213    AH 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 5p   
1214    AH 2D1525      -116.7     0.    -145.9 FIXEDHF     0.800  0       0.0  0                       
1215    AH 1E1525       -95.6     0.    -119.5 FIXEDHF     0.800  0       0.0  0                       
1216    AI 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 6p   
1217    AI 2D1525       -73.4     0.     -91.7 FIXEDHF     0.800  0       0.0  0                       
1218    AI 1E1525       -57.5     0.     -71.9 FIXEDHF     0.800  0       0.0  0                       
1219    AJ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 7p   
1220    AJ 2D1525       -51.5     0.     -64.4 FIXEDHF     0.800  0       0.0  0                       
1221    AJ 1E1525       -39.8     0.     -49.8 FIXEDHF     0.800  0       0.0  0                       
1222    AK 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 8p   
1223    AK 2D1525       -38.8     0.     -48.5 FIXEDHF     0.800  0       0.0  0                       
1224    AK 1E1525       -29.8     0.     -37.2 FIXEDHF     0.800  0       0.0  0                       
1225    AL 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 9p   
1226    AL 2D1525       -30.5     0.     -38.1 FIXEDHF     0.800  0       0.0  0                       
1227    AL 1E1525       -23.4     0.     -29.2 FIXEDHF     0.800  0       0.0  0                       
1228    AM 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 10p  
1229    AM 2D1525       -24.8     0.     -31.0 FIXEDHF     0.800  0       0.0  0                       
1230    AM 1E1525       -19.0     0.     -23.7 FIXEDHF     0.800  0       0.0  0                       
1231    AN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 11p  
1232    AN 2D1525       -20.7     0.     -25.9 FIXEDHF     0.800  0       0.0  0                       
1233    AN 1E1525       -15.8     0.     -19.8 FIXEDHF     0.800  0       0.0  0                       
1234    AO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 12p  
1235    AO 2D1525       -17.6     0.     -22.0 FIXEDHF     0.800  0       0.0  0                       
1236    AO 1E1525       -13.4     0.     -16.8 FIXEDHF     0.800  0       0.0  0                       
1237    AP 2D1112       705.7     0.     882.1 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 13p  
1238    AP 2D1525       -15.2     0.     -19.0 FIXEDHF     0.800  0       0.0  0                       
1239    AP 1E1525       -11.6     0.     -14.5 FIXEDHF     0.800  0       0.0  0                       
1240    AQ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 14p  
1241    AQ 2D1525       -13.3     0.     -16.6 FIXEDHF     0.800  0       0.0  0                       
1242    AQ 1E1525       -10.2     0.     -12.7 FIXEDHF     0.800  0       0.0  0                       
1243    AR 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 15p  
1244    AR 2D1525       -11.7     0.     -14.6 FIXEDHF     0.800  0       0.0  0                       
1245    AR 1E1525        -9.0     0.     -11.3 FIXEDHF     0.800  0       0.0  0                       
1246    Ad 2D1526         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 4f   
1247    Ad 1E1526        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0                       
1248    Ae 2D1526         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 5f   
1249    Ae 1E1526        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0                       
1250    Af 2D1526         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 6f   
1251    Af 1E1526        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
1252    Ag 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 7f   
1253    Ag 1E1526        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
1254    Ah 2D1526         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 8f   
1255    Ah 1E1526        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
1256    Ai 2D1526         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 9f   
1257    Ai 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1258    Aj 2D1526         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 10f  
1259    Aj 1E1526        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1260    Ak 2D1526         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 11f  
1261    Ak 1E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1262    Al 2D1526         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 12f  
1263    Al 1E1526        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
1264    Am 2D1526         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 13f  
1265    Am 1E1526        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1266    An 2D1526         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 14f  
1267    An 1E1526        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1268    Ao 1D2534       627.8     0.     784.8 FIXEDHF     0.800  0       0.0  0  4s13p     -4p5s      
1269    Ao 0E2534       200.7     0.     250.9 FIXEDHF     0.800  0       0.0  0                       
1270    Ap 1D2537       366.3     0.     457.9 FIXEDHF     0.800  0       0.0  0  4s13p     -4p6s      
1271    Ap 0E2537       107.1     0.     133.9 FIXEDHF     0.800  0       0.0  0                       
1272    Aq 1D2537       236.0     0.     295.0 FIXEDHF     0.800  0       0.0  0  4s13p     -4p7s      
1273    Aq 0E2537        69.0     0.      86.3 FIXEDHF     0.800  0       0.0  0                       
1274    Ar 1D2537       163.8     0.     204.8 FIXEDHF     0.800  0       0.0  0  4s13p     -4p8s      
1275    Ar 0E2537        49.3     0.      61.6 FIXEDHF     0.800  0       0.0  0                       
1276    As 1D2537       119.8     0.     149.8 FIXEDHF     0.800  0       0.0  0  4s13p     -4p9s      
1277    As 0E2537        37.5     0.      46.9 FIXEDHF     0.800  0       0.0  0                       
1278    At 1D2538      -130.8     0.    -163.5 FIXEDHF     0.800  0       0.0  0  4s13p     -4p4d      
1279    At 2E2538       103.7     0.     129.6 FIXEDHF     0.800  0       0.0  0                       
1280    Au 1D2538       -93.6     0.    -117.0 FIXEDHF     0.800  0       0.0  0  4s13p     -4p5d      
1281    Au 2E2538        82.7     0.     103.4 FIXEDHF     0.800  0       0.0  0                       
1282    Av 1D2538       -67.4     0.     -84.2 FIXEDHF     0.800  0       0.0  0  4s13p     -4p6d      
1283    Av 2E2538        63.1     0.      78.9 FIXEDHF     0.800  0       0.0  0                       
1284    Aw 1D2538       -51.2     0.     -64.0 FIXEDHF     0.800  0       0.0  0  4s13p     -4p7d      
1285    Aw 2E2538        49.2     0.      61.5 FIXEDHF     0.800  0       0.0  0                       
1286    Ax 1D2538       -41.0     0.     -51.3 FIXEDHF     0.800  0       0.0  0  4s13p     -4p8d      
1287    Ax 2E2538        39.4     0.      49.3 FIXEDHF     0.800  0       0.0  0                       
1288    Ay 1D2538       -34.4     0.     -43.0 FIXEDHF     0.800  0       0.0  0  4s13p     -4p9d      
1289    Ay 2E2538        32.4     0.      40.5 FIXEDHF     0.800  0       0.0  0                       
1290    Az 1D1534      -151.8     0.    -189.7 FIXEDHF     0.800  0       0.0  0  4s13p     -d9 4s4p5s 
1291    Az 2E1534       -80.2     0.    -100.3 FIXEDHF     0.800  0       0.0  0                       
1292    BC 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -4s15p     
1293    BC 1E2525        25.4     0.      31.7 FIXEDHF     0.800  0       0.0  0                       
1294    BD 0D2545        65.0     0.      81.2 FIXEDHF     0.800  0       0.0  0  4s14p     -5s5p      
1295    BD 1E2545       105.2     0.     131.5 FIXEDHF     0.800  0       0.0  0                       
1296    BE 0D2545        29.7     0.      37.1 FIXEDHF     0.800  0       0.0  0  4s14p     -5s6p      
1297    BE 1E2545        49.2     0.      61.5 FIXEDHF     0.800  0       0.0  0                       
1298    BF 0D2545        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0  4s14p     -5s7p      
1299    BF 1E2545        31.0     0.      38.8 FIXEDHF     0.800  0       0.0  0                       
1300    BG 2D1523      -240.3     0.    -300.4 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 4p   
1301    BG 1E1523      -248.2     0.    -310.2 FIXEDHF     0.800  0       0.0  0                       
1302    BH 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 5p   
1303    BH 2D1525      -102.1     0.    -127.6 FIXEDHF     0.800  0       0.0  0                       
1304    BH 1E1525       -83.6     0.    -104.5 FIXEDHF     0.800  0       0.0  0                       
1305    BI 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 6p   
1306    BI 2D1525       -64.2     0.     -80.2 FIXEDHF     0.800  0       0.0  0                       
1307    BI 1E1525       -50.3     0.     -62.9 FIXEDHF     0.800  0       0.0  0                       
1308    BJ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 7p   
1309    BJ 2D1525       -45.1     0.     -56.4 FIXEDHF     0.800  0       0.0  0                       
1310    BJ 1E1525       -34.8     0.     -43.5 FIXEDHF     0.800  0       0.0  0                       
1311    BK 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 8p   
1312    BK 2D1525       -33.9     0.     -42.4 FIXEDHF     0.800  0       0.0  0                       
1313    BK 1E1525       -26.0     0.     -32.5 FIXEDHF     0.800  0       0.0  0                       
1314    BL 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 9p   
1315    BL 2D1525       -26.6     0.     -33.3 FIXEDHF     0.800  0       0.0  0                       
1316    BL 1E1525       -20.4     0.     -25.5 FIXEDHF     0.800  0       0.0  0                       
1317    BM 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 10p  
1318    BM 2D1525       -21.7     0.     -27.1 FIXEDHF     0.800  0       0.0  0                       
1319    BM 1E1525       -16.6     0.     -20.7 FIXEDHF     0.800  0       0.0  0                       
1320    BN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 11p  
1321    BN 2D1525       -18.1     0.     -22.6 FIXEDHF     0.800  0       0.0  0                       
1322    BN 1E1525       -13.8     0.     -17.3 FIXEDHF     0.800  0       0.0  0                       
1323    BO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 12p  
1324    BO 2D1525       -15.4     0.     -19.2 FIXEDHF     0.800  0       0.0  0                       
1325    BO 1E1525       -11.8     0.     -14.7 FIXEDHF     0.800  0       0.0  0                       
1326    BP 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 13p  
1327    BP 2D1525       -13.3     0.     -16.6 FIXEDHF     0.800  0       0.0  0                       
1328    BP 1E1525       -10.2     0.     -12.7 FIXEDHF     0.800  0       0.0  0                       
1329    BQ 2D1112       705.7     0.     882.1 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 14p  
1330    BQ 2D1525       -11.7     0.     -14.6 FIXEDHF     0.800  0       0.0  0                       
1331    BQ 1E1525        -8.9     0.     -11.1 FIXEDHF     0.800  0       0.0  0                       
1332    BR 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 15p  
1333    BR 2D1525       -10.3     0.     -12.9 FIXEDHF     0.800  0       0.0  0                       
1334    BR 1E1525        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
1335    Bd 2D1526         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 4f   
1336    Bd 1E1526        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
1337    Be 2D1526         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 5f   
1338    Be 1E1526        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
1339    Bf 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 6f   
1340    Bf 1E1526        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1341    Bg 2D1526         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 7f   
1342    Bg 1E1526        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1343    Bh 2D1526         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 8f   
1344    Bh 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1345    Bi 2D1526         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 9f   
1346    Bi 1E1526        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1347    Bj 2D1526         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 10f  
1348    Bj 1E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1349    Bk 2D1526         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 11f  
1350    Bk 1E1526        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1351    Bl 2D1526         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 12f  
1352    Bl 1E1526        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1353    Bm 2D1526         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 13f  
1354    Bm 1E1526        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1355    Bn 2D1526         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 14f  
1356    Bn 1E1526        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
1357    Bo 1D2534       549.2     0.     686.5 FIXEDHF     0.800  0       0.0  0  4s14p     -4p5s      
1358    Bo 0E2534       175.4     0.     219.2 FIXEDHF     0.800  0       0.0  0                       
1359    Bp 1D2537       320.9     0.     401.1 FIXEDHF     0.800  0       0.0  0  4s14p     -4p6s      
1360    Bp 0E2537        93.6     0.     117.0 FIXEDHF     0.800  0       0.0  0                       
1361    Bq 1D2537       207.0     0.     258.8 FIXEDHF     0.800  0       0.0  0  4s14p     -4p7s      
1362    Bq 0E2537        60.3     0.      75.4 FIXEDHF     0.800  0       0.0  0                       
1363    Br 1D2537       144.1     0.     180.1 FIXEDHF     0.800  0       0.0  0  4s14p     -4p8s      
1364    Br 0E2537        43.1     0.      53.9 FIXEDHF     0.800  0       0.0  0                       
1365    Bs 1D2537       105.7     0.     132.1 FIXEDHF     0.800  0       0.0  0  4s14p     -4p9s      
1366    Bs 0E2537        32.8     0.      41.0 FIXEDHF     0.800  0       0.0  0                       
1367    Bt 1D2538      -114.3     0.    -142.9 FIXEDHF     0.800  0       0.0  0  4s14p     -4p4d      
1368    Bt 2E2538        90.2     0.     112.8 FIXEDHF     0.800  0       0.0  0                       
1369    Bu 1D2538       -81.7     0.    -102.1 FIXEDHF     0.800  0       0.0  0  4s14p     -4p5d      
1370    Bu 2E2538        72.0     0.      90.0 FIXEDHF     0.800  0       0.0  0                       
1371    Bv 1D2538       -58.6     0.     -73.3 FIXEDHF     0.800  0       0.0  0  4s14p     -4p6d      
1372    Bv 2E2538        55.0     0.      68.8 FIXEDHF     0.800  0       0.0  0                       
1373    Bw 1D2538       -44.4     0.     -55.5 FIXEDHF     0.800  0       0.0  0  4s14p     -4p7d      
1374    Bw 2E2538        42.9     0.      53.6 FIXEDHF     0.800  0       0.0  0                       
1375    Bx 1D2538       -35.3     0.     -44.1 FIXEDHF     0.800  0       0.0  0  4s14p     -4p8d      
1376    Bx 2E2538        34.4     0.      43.0 FIXEDHF     0.800  0       0.0  0                       
1377    By 1D2538       -29.3     0.     -36.6 FIXEDHF     0.800  0       0.0  0  4s14p     -4p9d      
1378    By 2E2538        28.2     0.      35.3 FIXEDHF     0.800  0       0.0  0                       
1379    Bz 1D1534      -132.9     0.    -166.1 FIXEDHF     0.800  0       0.0  0  4s14p     -d9 4s4p5s 
1380    Bz 2E1534       -70.2     0.     -87.8 FIXEDHF     0.800  0       0.0  0                       
1381    CD 0D2545        57.5     0.      71.9 FIXEDHF     0.800  0       0.0  0  4s15p     -5s5p      
1382    CD 1E2545        93.3     0.     116.6 FIXEDHF     0.800  0       0.0  0                       
1383    CE 0D2545        26.3     0.      32.9 FIXEDHF     0.800  0       0.0  0  4s15p     -5s6p      
1384    CE 1E2545        43.6     0.      54.5 FIXEDHF     0.800  0       0.0  0                       
1385    CF 0D2545        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0  4s15p     -5s7p      
1386    CF 1E2545        27.6     0.      34.5 FIXEDHF     0.800  0       0.0  0                       
1387    CG 2D1523      -212.4     0.    -265.5 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 4p   
1388    CG 1E1523      -219.4     0.    -274.2 FIXEDHF     0.800  0       0.0  0                       
1389    CH 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 5p   
1390    CH 2D1525       -90.2     0.    -112.8 FIXEDHF     0.800  0       0.0  0                       
1391    CH 1E1525       -73.9     0.     -92.4 FIXEDHF     0.800  0       0.0  0                       
1392    CI 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 6p   
1393    CI 2D1525       -56.7     0.     -70.9 FIXEDHF     0.800  0       0.0  0                       
1394    CI 1E1525       -44.5     0.     -55.6 FIXEDHF     0.800  0       0.0  0                       
1395    CJ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 7p   
1396    CJ 2D1525       -39.8     0.     -49.8 FIXEDHF     0.800  0       0.0  0                       
1397    CJ 1E1525       -30.8     0.     -38.5 FIXEDHF     0.800  0       0.0  0                       
1398    CK 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 8p   
1399    CK 2D1525       -30.0     0.     -37.5 FIXEDHF     0.800  0       0.0  0                       
1400    CK 1E1525       -23.0     0.     -28.8 FIXEDHF     0.800  0       0.0  0                       
1401    CL 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 9p   
1402    CL 2D1525       -23.6     0.     -29.5 FIXEDHF     0.800  0       0.0  0                       
1403    CL 1E1525       -18.1     0.     -22.6 FIXEDHF     0.800  0       0.0  0                       
1404    CM 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 10p  
1405    CM 2D1525       -19.2     0.     -24.0 FIXEDHF     0.800  0       0.0  0                       
1406    CM 1E1525       -14.6     0.     -18.3 FIXEDHF     0.800  0       0.0  0                       
1407    CN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 11p  
1408    CN 2D1525       -16.0     0.     -20.0 FIXEDHF     0.800  0       0.0  0                       
1409    CN 1E1525       -12.2     0.     -15.3 FIXEDHF     0.800  0       0.0  0                       
1410    CO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 12p  
1411    CO 2D1525       -13.6     0.     -17.0 FIXEDHF     0.800  0       0.0  0                       
1412    CO 1E1525       -10.4     0.     -13.0 FIXEDHF     0.800  0       0.0  0                       
1413    CP 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 13p  
1414    CP 2D1525       -11.8     0.     -14.7 FIXEDHF     0.800  0       0.0  0                       
1415    CP 1E1525        -9.0     0.     -11.2 FIXEDHF     0.800  0       0.0  0                       
1416    CQ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 14p  
1417    CQ 2D1525       -10.3     0.     -12.9 FIXEDHF     0.800  0       0.0  0                       
1418    CQ 1E1525        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
1419    CR 2D1112       705.8     0.     882.2 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 15p  
1420    CR 2D1525        -9.1     0.     -11.4 FIXEDHF     0.800  0       0.0  0                       
1421    CR 1E1525        -7.0     0.      -8.7 FIXEDHF     0.800  0       0.0  0                       
1422    Cd 2D1526         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 4f   
1423    Cd 1E1526        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1424    Ce 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 5f   
1425    Ce 1E1526        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1426    Cf 2D1526         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 6f   
1427    Cf 1E1526        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1428    Cg 2D1526         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 7f   
1429    Cg 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1430    Ch 2D1526         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 8f   
1431    Ch 1E1526        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1432    Ci 2D1526         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 9f   
1433    Ci 1E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1434    Cj 2D1526         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 10f  
1435    Cj 1E1526        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1436    Ck 2D1526         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 11f  
1437    Ck 1E1526        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1438    Cl 2D1526         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 12f  
1439    Cl 1E1526        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
1440    Cm 2D1526         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 13f  
1441    Cm 1E1526        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
1442    Cn 2D1526         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 14f  
1443    Cn 1E1526        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
1444    Co 1D2534       485.8     0.     607.2 FIXEDHF     0.800  0       0.0  0  4s15p     -4p5s      
1445    Co 0E2534       154.9     0.     193.6 FIXEDHF     0.800  0       0.0  0                       
1446    Cp 1D2537       284.1     0.     355.1 FIXEDHF     0.800  0       0.0  0  4s15p     -4p6s      
1447    Cp 0E2537        82.7     0.     103.4 FIXEDHF     0.800  0       0.0  0                       
1448    Cq 1D2537       183.6     0.     229.5 FIXEDHF     0.800  0       0.0  0  4s15p     -4p7s      
1449    Cq 0E2537        53.4     0.      66.7 FIXEDHF     0.800  0       0.0  0                       
1450    Cr 1D2537       127.9     0.     159.9 FIXEDHF     0.800  0       0.0  0  4s15p     -4p8s      
1451    Cr 0E2537        38.1     0.      47.6 FIXEDHF     0.800  0       0.0  0                       
1452    Cs 1D2537        94.1     0.     117.6 FIXEDHF     0.800  0       0.0  0  4s15p     -4p9s      
1453    Cs 0E2537        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0                       
1454    Ct 1D2538      -101.1     0.    -126.4 FIXEDHF     0.800  0       0.0  0  4s15p     -4p4d      
1455    Ct 2E2538        79.4     0.      99.3 FIXEDHF     0.800  0       0.0  0                       
1456    Cu 1D2538       -72.2     0.     -90.2 FIXEDHF     0.800  0       0.0  0  4s15p     -4p5d      
1457    Cu 2E2538        63.4     0.      79.3 FIXEDHF     0.800  0       0.0  0                       
1458    Cv 1D2538       -51.8     0.     -64.7 FIXEDHF     0.800  0       0.0  0  4s15p     -4p6d      
1459    Cv 2E2538        48.5     0.      60.6 FIXEDHF     0.800  0       0.0  0                       
1460    Cw 1D2538       -39.0     0.     -48.8 FIXEDHF     0.800  0       0.0  0  4s15p     -4p7d      
1461    Cw 2E2538        37.8     0.      47.2 FIXEDHF     0.800  0       0.0  0                       
1462    Cx 1D2538       -30.9     0.     -38.6 FIXEDHF     0.800  0       0.0  0  4s15p     -4p8d      
1463    Cx 2E2538        30.3     0.      37.9 FIXEDHF     0.800  0       0.0  0                       
1464    Cy 1D2538       -25.4     0.     -31.8 FIXEDHF     0.800  0       0.0  0  4s15p     -4p9d      
1465    Cy 2E2538        24.9     0.      31.1 FIXEDHF     0.800  0       0.0  0                       
1466    Cz 1D1534      -117.6     0.    -147.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9 4s4p5s 
1467    Cz 2E1534       -62.2     0.     -77.7 FIXEDHF     0.800  0       0.0  0                       
1468    DE 0D4545         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  5s5p      -5s6p      
1469    DE 1E4545      3434.1     0.    4292.6 FIXEDHF     0.800  0       0.0  0                       
1470    DF 0D4545         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  5s5p      -5s7p      
1471    DF 1E4545      1958.7     0.    2448.4 FIXEDHF     0.800  0       0.0  0                       
1472    Do 1D4534     -4831.0     0.   -6038.7 FIXEDHF     0.800  0       0.0  0  5s5p      -4p5s      
1473    Do 0E4534      -677.0     0.    -846.2 FIXEDHF     0.800  0       0.0  0                       
1474    Dp 1D4537      -511.0     0.    -638.7 FIXEDHF     0.800  0       0.0  0  5s5p      -4p6s      
1475    Dp 0E4537       894.8     0.    1118.5 FIXEDHF     0.800  0       0.0  0                       
1476    Dq 1D4537      -153.4     0.    -191.7 FIXEDHF     0.800  0       0.0  0  5s5p      -4p7s      
1477    Dq 0E4537       575.4     0.     719.3 FIXEDHF     0.800  0       0.0  0                       
1478    Dr 1D4537       -57.5     0.     -71.9 FIXEDHF     0.800  0       0.0  0  5s5p      -4p8s      
1479    Dr 0E4537       408.6     0.     510.7 FIXEDHF     0.800  0       0.0  0                       
1480    Ds 1D4537       -22.2     0.     -27.7 FIXEDHF     0.800  0       0.0  0  5s5p      -4p9s      
1481    Ds 0E4537       309.4     0.     386.8 FIXEDHF     0.800  0       0.0  0                       
1482    Dt 1D4538      4284.6     0.    5355.7 FIXEDHF     0.800  0       0.0  0  5s5p      -4p4d      
1483    Dt 2E4538      1640.2     0.    2050.2 FIXEDHF     0.800  0       0.0  0                       
1484    Du 1D4538      1317.1     0.    1646.4 FIXEDHF     0.800  0       0.0  0  5s5p      -4p5d      
1485    Du 2E4538       699.3     0.     874.1 FIXEDHF     0.800  0       0.0  0                       
1486    Dv 1D4538       593.4     0.     741.7 FIXEDHF     0.800  0       0.0  0  5s5p      -4p6d      
1487    Dv 2E4538       384.9     0.     481.1 FIXEDHF     0.800  0       0.0  0                       
1488    Dw 1D4538       321.5     0.     401.9 FIXEDHF     0.800  0       0.0  0  5s5p      -4p7d      
1489    Dw 2E4538       245.2     0.     306.5 FIXEDHF     0.800  0       0.0  0                       
1490    Dx 1D4538       195.2     0.     244.0 FIXEDHF     0.800  0       0.0  0  5s5p      -4p8d      
1491    Dx 2E4538       171.4     0.     214.2 FIXEDHF     0.800  0       0.0  0                       
1492    Dy 1D4538       127.9     0.     159.9 FIXEDHF     0.800  0       0.0  0  5s5p      -4p9d      
1493    Dy 2E4538       127.5     0.     159.4 FIXEDHF     0.800  0       0.0  0                       
1494    Dz 2D1523     -3173.8     0.   -3967.3 FIXEDHF     0.800  0       0.0  0  5s5p      -d9 4s4p5s 
1495    Dz 1E1523     -3234.0     0.   -4042.5 FIXEDHF     0.800  0       0.0  0                       
1496    EF 0D4545         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  5s6p      -5s7p      
1497    EF 1E4545       903.0     0.    1128.7 FIXEDHF     0.800  0       0.0  0                       
1498    Eo 1D4534     -1458.6     0.   -1823.2 FIXEDHF     0.800  0       0.0  0  5s6p      -4p5s      
1499    Eo 0E4534      -234.2     0.    -292.8 FIXEDHF     0.800  0       0.0  0                       
1500    Ep 1D4537     -1689.6     0.   -2112.0 FIXEDHF     0.800  0       0.0  0  5s6p      -4p6s      
1501    Ep 0E4537       421.4     0.     526.7 FIXEDHF     0.800  0       0.0  0                       
1502    Eq 1D4537      -425.3     0.    -531.6 FIXEDHF     0.800  0       0.0  0  5s6p      -4p7s      
1503    Eq 0E4537       274.7     0.     343.4 FIXEDHF     0.800  0       0.0  0                       
1504    Er 1D4537      -229.9     0.    -287.4 FIXEDHF     0.800  0       0.0  0  5s6p      -4p8s      
1505    Er 0E4537       196.3     0.     245.4 FIXEDHF     0.800  0       0.0  0                       
1506    Es 1D4537      -149.0     0.    -186.3 FIXEDHF     0.800  0       0.0  0  5s6p      -4p9s      
1507    Es 0E4537       149.2     0.     186.5 FIXEDHF     0.800  0       0.0  0                       
1508    Et 1D4538       863.8     0.    1079.7 FIXEDHF     0.800  0       0.0  0  5s6p      -4p4d      
1509    Et 2E4538       817.6     0.    1022.0 FIXEDHF     0.800  0       0.0  0                       
1510    Eu 1D4538      1607.7     0.    2009.6 FIXEDHF     0.800  0       0.0  0  5s6p      -4p5d      
1511    Eu 2E4538       398.9     0.     498.6 FIXEDHF     0.800  0       0.0  0                       
1512    Ev 1D4538       771.9     0.     964.9 FIXEDHF     0.800  0       0.0  0  5s6p      -4p6d      
1513    Ev 2E4538       236.6     0.     295.8 FIXEDHF     0.800  0       0.0  0                       
1514    Ew 1D4538       468.2     0.     585.3 FIXEDHF     0.800  0       0.0  0  5s6p      -4p7d      
1515    Ew 2E4538       158.6     0.     198.2 FIXEDHF     0.800  0       0.0  0                       
1516    Ex 1D4538       318.9     0.     398.6 FIXEDHF     0.800  0       0.0  0  5s6p      -4p8d      
1517    Ex 2E4538       115.0     0.     143.8 FIXEDHF     0.800  0       0.0  0                       
1518    Ey 1D4538       233.6     0.     292.0 FIXEDHF     0.800  0       0.0  0  5s6p      -4p9d      
1519    Ey 2E4538        88.0     0.     110.0 FIXEDHF     0.800  0       0.0  0                       
1520    Ez 2D1523     -1550.4     0.   -1938.0 FIXEDHF     0.800  0       0.0  0  5s6p      -d9 4s4p5s 
1521    Ez 1E1523     -1583.0     0.   -1978.7 FIXEDHF     0.800  0       0.0  0                       
1522    Fo 1D4534      -813.6     0.   -1017.0 FIXEDHF     0.800  0       0.0  0  5s7p      -4p5s      
1523    Fo 0E4534      -138.0     0.    -172.5 FIXEDHF     0.800  0       0.0  0                       
1524    Fp 1D4537      -817.0     0.   -1021.3 FIXEDHF     0.800  0       0.0  0  5s7p      -4p6s      
1525    Fp 0E4537       259.1     0.     323.9 FIXEDHF     0.800  0       0.0  0                       
1526    Fq 1D4537      -774.0     0.    -967.5 FIXEDHF     0.800  0       0.0  0  5s7p      -4p7s      
1527    Fq 0E4537       169.7     0.     212.1 FIXEDHF     0.800  0       0.0  0                       
1528    Fr 1D4537      -275.0     0.    -343.8 FIXEDHF     0.800  0       0.0  0  5s7p      -4p8s      
1529    Fr 0E4537       121.5     0.     151.9 FIXEDHF     0.800  0       0.0  0                       
1530    Fs 1D4537      -173.3     0.    -216.6 FIXEDHF     0.800  0       0.0  0  5s7p      -4p9s      
1531    Fs 0E4537        92.5     0.     115.6 FIXEDHF     0.800  0       0.0  0                       
1532    Ft 1D4538       496.8     0.     621.0 FIXEDHF     0.800  0       0.0  0  5s7p      -4p4d      
1533    Ft 2E4538       548.2     0.     685.2 FIXEDHF     0.800  0       0.0  0                       
1534    Fu 1D4538       568.7     0.     710.9 FIXEDHF     0.800  0       0.0  0  5s7p      -4p5d      
1535    Fu 2E4538       277.0     0.     346.2 FIXEDHF     0.800  0       0.0  0                       
1536    Fv 1D4538       774.6     0.     968.3 FIXEDHF     0.800  0       0.0  0  5s7p      -4p6d      
1537    Fv 2E4538       167.4     0.     209.2 FIXEDHF     0.800  0       0.0  0                       
1538    Fw 1D4538       450.0     0.     562.5 FIXEDHF     0.800  0       0.0  0  5s7p      -4p7d      
1539    Fw 2E4538       113.5     0.     141.9 FIXEDHF     0.800  0       0.0  0                       
1540    Fx 1D4538       308.1     0.     385.1 FIXEDHF     0.800  0       0.0  0  5s7p      -4p8d      
1541    Fx 2E4538        83.0     0.     103.8 FIXEDHF     0.800  0       0.0  0                       
1542    Fy 1D4538       228.2     0.     285.2 FIXEDHF     0.800  0       0.0  0  5s7p      -4p9d      
1543    Fy 2E4538        63.9     0.      79.9 FIXEDHF     0.800  0       0.0  0                       
1544    Fz 2D1523     -1013.1     0.   -1266.4 FIXEDHF     0.800  0       0.0  0  5s7p      -d9 4s4p5s 
1545    Fz 1E1523     -1035.5     0.   -1294.4 FIXEDHF     0.800  0       0.0  0                       
1546    GH 0D1315       120.1     0.     150.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 5p   
1547    GH 2D1315      2959.0     0.    3698.8 FIXEDHF     0.800  0       0.0  0                       
1548    GH 1E1315      1161.8     0.    1452.2 FIXEDHF     0.800  0       0.0  0                       
1549    GH 3E1315       993.8     0.    1242.3 FIXEDHF     0.800  0       0.0  0                       
1550    GI 0D1315        73.3     0.      91.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 6p   
1551    GI 2D1315      1761.5     0.    2201.9 FIXEDHF     0.800  0       0.0  0                       
1552    GI 1E1315       707.8     0.     884.8 FIXEDHF     0.800  0       0.0  0                       
1553    GI 3E1315       607.4     0.     759.3 FIXEDHF     0.800  0       0.0  0                       
1554    GJ 0D1315        51.0     0.      63.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 7p   
1555    GJ 2D1315      1215.0     0.    1518.8 FIXEDHF     0.800  0       0.0  0                       
1556    GJ 1E1315       493.0     0.     616.3 FIXEDHF     0.800  0       0.0  0                       
1557    GJ 3E1315       423.7     0.     529.6 FIXEDHF     0.800  0       0.0  0                       
1558    GK 0D1315        38.3     0.      47.9 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 8p   
1559    GK 2D1315       905.9     0.    1132.4 FIXEDHF     0.800  0       0.0  0                       
1560    GK 1E1315       369.6     0.     462.0 FIXEDHF     0.800  0       0.0  0                       
1561    GK 3E1315       317.8     0.     397.2 FIXEDHF     0.800  0       0.0  0                       
1562    GL 0D1315        30.1     0.      37.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 9p   
1563    GL 2D1315       709.9     0.     887.4 FIXEDHF     0.800  0       0.0  0                       
1564    GL 1E1315       290.6     0.     363.2 FIXEDHF     0.800  0       0.0  0                       
1565    GL 3E1315       249.9     0.     312.4 FIXEDHF     0.800  0       0.0  0                       
1566    GM 0D1315        24.5     0.      30.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 10p  
1567    GM 2D1315       576.2     0.     720.2 FIXEDHF     0.800  0       0.0  0                       
1568    GM 1E1315       236.3     0.     295.4 FIXEDHF     0.800  0       0.0  0                       
1569    GM 3E1315       203.4     0.     254.2 FIXEDHF     0.800  0       0.0  0                       
1570    GN 0D1315        20.4     0.      25.5 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 11p  
1571    GN 2D1315       480.0     0.     600.0 FIXEDHF     0.800  0       0.0  0                       
1572    GN 1E1315       197.1     0.     246.4 FIXEDHF     0.800  0       0.0  0                       
1573    GN 3E1315       169.7     0.     212.1 FIXEDHF     0.800  0       0.0  0                       
1574    GO 0D1315        17.4     0.      21.7 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 12p  
1575    GO 2D1315       408.0     0.     510.0 FIXEDHF     0.800  0       0.0  0                       
1576    GO 1E1315       167.8     0.     209.7 FIXEDHF     0.800  0       0.0  0                       
1577    GO 3E1315       144.4     0.     180.5 FIXEDHF     0.800  0       0.0  0                       
1578    GP 0D1315        15.0     0.      18.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 13p  
1579    GP 2D1315       352.4     0.     440.5 FIXEDHF     0.800  0       0.0  0                       
1580    GP 1E1315       145.0     0.     181.3 FIXEDHF     0.800  0       0.0  0                       
1581    GP 3E1315       124.9     0.     156.1 FIXEDHF     0.800  0       0.0  0                       
1582    GQ 0D1315        13.2     0.      16.5 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 14p  
1583    GQ 2D1315       308.5     0.     385.6 FIXEDHF     0.800  0       0.0  0                       
1584    GQ 1E1315       127.0     0.     158.8 FIXEDHF     0.800  0       0.0  0                       
1585    GQ 3E1315       109.4     0.     136.7 FIXEDHF     0.800  0       0.0  0                       
1586    GR 0D1315        11.7     0.      14.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 15p  
1587    GR 2D1315       273.0     0.     341.3 FIXEDHF     0.800  0       0.0  0                       
1588    GR 1E1315       112.5     0.     140.6 FIXEDHF     0.800  0       0.0  0                       
1589    GR 3E1315        96.9     0.     121.1 FIXEDHF     0.800  0       0.0  0                       
1590    GS 2D2316      -185.5     0.    -231.9 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s4f      
1591    GS 3E2316       -71.0     0.     -88.8 FIXEDHF     0.800  0       0.0  0                       
1592    GT 2D2316      -170.1     0.    -212.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s5f      
1593    GT 3E2316       -67.0     0.     -83.8 FIXEDHF     0.800  0       0.0  0                       
1594    GU 2D2316      -144.8     0.    -181.0 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s6f      
1595    GU 3E2316       -58.0     0.     -72.5 FIXEDHF     0.800  0       0.0  0                       
1596    GV 2D2316      -122.6     0.    -153.2 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s7f      
1597    GV 3E2316       -49.6     0.     -62.0 FIXEDHF     0.800  0       0.0  0                       
1598    GW 2D2316      -104.6     0.    -130.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s8f      
1599    GW 3E2316       -42.6     0.     -53.3 FIXEDHF     0.800  0       0.0  0                       
1600    GX 2D2316       -90.3     0.    -112.9 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s9f      
1601    GX 3E2316       -37.0     0.     -46.2 FIXEDHF     0.800  0       0.0  0                       
1602    GY 2D2316       -78.8     0.     -98.5 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s10f     
1603    GY 3E2316       -32.4     0.     -40.5 FIXEDHF     0.800  0       0.0  0                       
1604    GZ 2D2316       -69.4     0.     -86.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s11f     
1605    GZ 3E2316       -28.6     0.     -35.8 FIXEDHF     0.800  0       0.0  0                       
1606    Ga 2D2316       -61.8     0.     -77.3 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s12f     
1607    Ga 3E2316       -25.5     0.     -31.9 FIXEDHF     0.800  0       0.0  0                       
1608    Gb 2D2316       -55.4     0.     -69.3 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s13f     
1609    Gb 3E2316       -23.0     0.     -28.7 FIXEDHF     0.800  0       0.0  0                       
1610    Gc 2D2316       -50.1     0.     -62.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s14f     
1611    Gc 3E2316       -20.7     0.     -25.9 FIXEDHF     0.800  0       0.0  0                       
1612    Gd 2D1316       127.9     0.     159.9 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 4f   
1613    Gd 4D1316        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0                       
1614    Gd 1E1316        16.1     0.      20.1 FIXEDHF     0.800  0       0.0  0                       
1615    Gd 3E1316        10.7     0.      13.4 FIXEDHF     0.800  0       0.0  0                       
1616    Ge 2D1316       119.3     0.     149.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 5f   
1617    Ge 4D1316        24.2     0.      30.3 FIXEDHF     0.800  0       0.0  0                       
1618    Ge 1E1316        15.7     0.      19.6 FIXEDHF     0.800  0       0.0  0                       
1619    Ge 3E1316        10.5     0.      13.1 FIXEDHF     0.800  0       0.0  0                       
1620    Gf 2D1316       102.5     0.     128.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 6f   
1621    Gf 4D1316        21.2     0.      26.5 FIXEDHF     0.800  0       0.0  0                       
1622    Gf 1E1316        13.8     0.      17.2 FIXEDHF     0.800  0       0.0  0                       
1623    Gf 3E1316         9.2     0.      11.5 FIXEDHF     0.800  0       0.0  0                       
1624    Gg 2D1316        87.3     0.     109.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 7f   
1625    Gg 4D1316        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0                       
1626    Gg 1E1316        11.9     0.      14.9 FIXEDHF     0.800  0       0.0  0                       
1627    Gg 3E1316         8.0     0.      10.0 FIXEDHF     0.800  0       0.0  0                       
1628    Gh 2D1316        74.9     0.      93.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 8f   
1629    Gh 4D1316        15.8     0.      19.7 FIXEDHF     0.800  0       0.0  0                       
1630    Gh 1E1316        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0                       
1631    Gh 3E1316         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0                       
1632    Gi 2D1316        64.8     0.      81.0 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 9f   
1633    Gi 4D1316        13.7     0.      17.1 FIXEDHF     0.800  0       0.0  0                       
1634    Gi 1E1316         9.0     0.      11.2 FIXEDHF     0.800  0       0.0  0                       
1635    Gi 3E1316         6.0     0.       7.5 FIXEDHF     0.800  0       0.0  0                       
1636    Gj 2D1316        56.6     0.      70.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 10f  
1637    Gj 4D1316        12.0     0.      15.0 FIXEDHF     0.800  0       0.0  0                       
1638    Gj 1E1316         7.8     0.       9.8 FIXEDHF     0.800  0       0.0  0                       
1639    Gj 3E1316         5.3     0.       6.6 FIXEDHF     0.800  0       0.0  0                       
1640    Gk 2D1316        50.1     0.      62.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 11f  
1641    Gk 4D1316        10.6     0.      13.3 FIXEDHF     0.800  0       0.0  0                       
1642    Gk 1E1316         7.0     0.       8.7 FIXEDHF     0.800  0       0.0  0                       
1643    Gk 3E1316         4.7     0.       5.9 FIXEDHF     0.800  0       0.0  0                       
1644    Gl 2D1316        44.6     0.      55.7 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 12f  
1645    Gl 4D1316         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0                       
1646    Gl 1E1316         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0                       
1647    Gl 3E1316         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0                       
1648    Gm 2D1316        40.0     0.      50.0 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 13f  
1649    Gm 4D1316         8.6     0.      10.7 FIXEDHF     0.800  0       0.0  0                       
1650    Gm 1E1316         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
1651    Gm 3E1316         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
1652    Gn 2D1316        36.2     0.      45.2 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 14f  
1653    Gn 4D1316         7.8     0.       9.7 FIXEDHF     0.800  0       0.0  0                       
1654    Gn 1E1316         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0                       
1655    Gn 3E1316         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
1656    Gt 2D2218     -1336.2     0.   -1670.3 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4p4d      
1657    Gu 2D2218     -1018.0     0.   -1272.5 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4p5d      
1658    Gv 2D2218      -765.5     0.    -956.9 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4p6d      
1659    Gw 2D2218      -592.6     0.    -740.7 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4p7d      
1660    Gx 2D2218      -473.0     0.    -591.3 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4p8d      
1661    Gy 2D2218      -387.8     0.    -484.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4p9d      
1662    Gz 0D1214       229.0     0.     286.2 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9 4s4p5s 
1663    Gz 2E1214      2286.1     0.    2857.6 FIXEDHF     0.800  0       0.0  0                       
1664    Gz 0D2224      2326.2     0.    2907.8 FIXEDHF     0.800  0       0.0  0                       
1665    Gz 1D2334     -1763.8     0.   -2204.7 FIXEDHF     0.800  0       0.0  0                       
1666    Gz 0E2334       -98.1     0.    -122.6 FIXEDHF     0.800  0       0.0  0                       
1667    HI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 6p   
1668    HI 2D1515       695.4     0.     869.2 FIXEDHF     0.800  0       0.0  0                       
1669    HI 1E1515       245.5     0.     306.9 FIXEDHF     0.800  0       0.0  0                       
1670    HI 3E1515       213.3     0.     266.6 FIXEDHF     0.800  0       0.0  0                       
1671    HJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 7p   
1672    HJ 2D1515       476.5     0.     595.6 FIXEDHF     0.800  0       0.0  0                       
1673    HJ 1E1515       171.1     0.     213.9 FIXEDHF     0.800  0       0.0  0                       
1674    HJ 3E1515       148.9     0.     186.1 FIXEDHF     0.800  0       0.0  0                       
1675    HK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 8p   
1676    HK 2D1515       354.3     0.     442.9 FIXEDHF     0.800  0       0.0  0                       
1677    HK 1E1515       128.3     0.     160.4 FIXEDHF     0.800  0       0.0  0                       
1678    HK 3E1515       111.7     0.     139.6 FIXEDHF     0.800  0       0.0  0                       
1679    HL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 9p   
1680    HL 2D1515       277.3     0.     346.6 FIXEDHF     0.800  0       0.0  0                       
1681    HL 1E1515       100.9     0.     126.1 FIXEDHF     0.800  0       0.0  0                       
1682    HL 3E1515        87.8     0.     109.8 FIXEDHF     0.800  0       0.0  0                       
1683    HM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 10p  
1684    HM 2D1515       224.8     0.     281.0 FIXEDHF     0.800  0       0.0  0                       
1685    HM 1E1515        82.1     0.     102.6 FIXEDHF     0.800  0       0.0  0                       
1686    HM 3E1515        71.4     0.      89.3 FIXEDHF     0.800  0       0.0  0                       
1687    HN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 11p  
1688    HN 2D1515       187.2     0.     234.0 FIXEDHF     0.800  0       0.0  0                       
1689    HN 1E1515        68.5     0.      85.6 FIXEDHF     0.800  0       0.0  0                       
1690    HN 3E1515        59.7     0.      74.6 FIXEDHF     0.800  0       0.0  0                       
1691    HO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 12p  
1692    HO 2D1515       159.0     0.     198.8 FIXEDHF     0.800  0       0.0  0                       
1693    HO 1E1515        58.2     0.      72.8 FIXEDHF     0.800  0       0.0  0                       
1694    HO 3E1515        50.8     0.      63.5 FIXEDHF     0.800  0       0.0  0                       
1695    HP 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 13p  
1696    HP 2D1515       137.4     0.     171.7 FIXEDHF     0.800  0       0.0  0                       
1697    HP 1E1515        50.4     0.      63.0 FIXEDHF     0.800  0       0.0  0                       
1698    HP 3E1515        43.9     0.      54.9 FIXEDHF     0.800  0       0.0  0                       
1699    HQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 14p  
1700    HQ 2D1515       120.2     0.     150.2 FIXEDHF     0.800  0       0.0  0                       
1701    HQ 1E1515        44.1     0.      55.1 FIXEDHF     0.800  0       0.0  0                       
1702    HQ 3E1515        38.5     0.      48.1 FIXEDHF     0.800  0       0.0  0                       
1703    HR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 15p  
1704    HR 2D1515       106.3     0.     132.9 FIXEDHF     0.800  0       0.0  0                       
1705    HR 1E1515        39.0     0.      48.8 FIXEDHF     0.800  0       0.0  0                       
1706    HR 3E1515        34.1     0.      42.6 FIXEDHF     0.800  0       0.0  0                       
1707    HS 2D2516       125.1     0.     156.4 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s4f      
1708    HS 3E2516       -19.5     0.     -24.4 FIXEDHF     0.800  0       0.0  0                       
1709    HT 2D2516        86.7     0.     108.4 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s5f      
1710    HT 3E2516       -18.6     0.     -23.2 FIXEDHF     0.800  0       0.0  0                       
1711    HU 2D2516        63.2     0.      79.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s6f      
1712    HU 3E2516       -16.1     0.     -20.1 FIXEDHF     0.800  0       0.0  0                       
1713    HV 2D2516        48.5     0.      60.6 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s7f      
1714    HV 3E2516       -13.8     0.     -17.3 FIXEDHF     0.800  0       0.0  0                       
1715    HW 2D2516        38.7     0.      48.4 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s8f      
1716    HW 3E2516       -11.9     0.     -14.9 FIXEDHF     0.800  0       0.0  0                       
1717    HX 2D2516        31.8     0.      39.8 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s9f      
1718    HX 3E2516       -10.3     0.     -12.9 FIXEDHF     0.800  0       0.0  0                       
1719    HY 2D2516        26.8     0.      33.5 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s10f     
1720    HY 3E2516        -9.0     0.     -11.3 FIXEDHF     0.800  0       0.0  0                       
1721    HZ 2D2516        23.0     0.      28.7 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s11f     
1722    HZ 3E2516        -8.0     0.     -10.0 FIXEDHF     0.800  0       0.0  0                       
1723    Ha 2D2516        19.9     0.      24.9 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s12f     
1724    Ha 3E2516        -7.1     0.      -8.9 FIXEDHF     0.800  0       0.0  0                       
1725    Hb 2D2516        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s13f     
1726    Hb 3E2516        -6.4     0.      -8.0 FIXEDHF     0.800  0       0.0  0                       
1727    Hc 2D2516        15.6     0.      19.5 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s14f     
1728    Hc 3E2516        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0                       
1729    Hd 2D1516       -66.6     0.     -83.3 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 4f   
1730    Hd 4D1516         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
1731    Hd 1E1516         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0                       
1732    Hd 3E1516         3.5     0.       4.4 FIXEDHF     0.800  0       0.0  0                       
1733    He 2D1516       -44.4     0.     -55.5 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 5f   
1734    He 4D1516         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0                       
1735    He 1E1516         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0                       
1736    He 3E1516         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
1737    Hf 2D1516       -31.4     0.     -39.3 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 6f   
1738    Hf 4D1516         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
1739    Hf 1E1516         4.5     0.       5.6 FIXEDHF     0.800  0       0.0  0                       
1740    Hf 3E1516         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
1741    Hg 2D1516       -23.6     0.     -29.5 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 7f   
1742    Hg 4D1516         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
1743    Hg 1E1516         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0                       
1744    Hg 3E1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
1745    Hh 2D1516       -18.5     0.     -23.1 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 8f   
1746    Hh 4D1516         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0                       
1747    Hh 1E1516         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
1748    Hh 3E1516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0                       
1749    Hi 2D1516       -15.0     0.     -18.8 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 9f   
1750    Hi 4D1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
1751    Hi 1E1516         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0                       
1752    Hi 3E1516         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
1753    Hj 2D1516       -12.5     0.     -15.6 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 10f  
1754    Hj 4D1516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
1755    Hj 1E1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0                       
1756    Hj 3E1516         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0                       
1757    Hk 2D1516       -10.6     0.     -13.3 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 11f  
1758    Hk 4D1516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
1759    Hk 1E1516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0                       
1760    Hk 3E1516         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
1761    Hl 2D1516        -9.1     0.     -11.4 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 12f  
1762    Hl 4D1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
1763    Hl 1E1516         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
1764    Hl 3E1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1765    Hm 2D1516        -8.0     0.     -10.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 13f  
1766    Hm 4D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
1767    Hm 1E1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
1768    Hm 3E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1769    Hn 2D1516        -7.1     0.      -8.9 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 14f  
1770    Hn 4D1516         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
1771    Hn 1E1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
1772    Hn 3E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1773    Hz 1D2534      6441.0     0.    8051.2 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9 4s4p5s 
1774    Hz 0E2534      1595.4     0.    1994.3 FIXEDHF     0.800  0       0.0  0                       
1775    IJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 7p   
1776    IJ 2D1515       299.0     0.     373.8 FIXEDHF     0.800  0       0.0  0                       
1777    IJ 1E1515       104.4     0.     130.5 FIXEDHF     0.800  0       0.0  0                       
1778    IJ 3E1515        91.1     0.     113.9 FIXEDHF     0.800  0       0.0  0                       
1779    IK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 8p   
1780    IK 2D1515       222.0     0.     277.5 FIXEDHF     0.800  0       0.0  0                       
1781    IK 1E1515        78.3     0.      97.9 FIXEDHF     0.800  0       0.0  0                       
1782    IK 3E1515        68.3     0.      85.4 FIXEDHF     0.800  0       0.0  0                       
1783    IL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 9p   
1784    IL 2D1515       173.7     0.     217.1 FIXEDHF     0.800  0       0.0  0                       
1785    IL 1E1515        61.5     0.      76.9 FIXEDHF     0.800  0       0.0  0                       
1786    IL 3E1515        53.8     0.      67.2 FIXEDHF     0.800  0       0.0  0                       
1787    IM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 10p  
1788    IM 2D1515       140.8     0.     176.0 FIXEDHF     0.800  0       0.0  0                       
1789    IM 1E1515        50.1     0.      62.6 FIXEDHF     0.800  0       0.0  0                       
1790    IM 3E1515        43.8     0.      54.7 FIXEDHF     0.800  0       0.0  0                       
1791    IN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 11p  
1792    IN 2D1515       117.2     0.     146.5 FIXEDHF     0.800  0       0.0  0                       
1793    IN 1E1515        41.8     0.      52.2 FIXEDHF     0.800  0       0.0  0                       
1794    IN 3E1515        36.5     0.      45.6 FIXEDHF     0.800  0       0.0  0                       
1795    IO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 12p  
1796    IO 2D1515        99.6     0.     124.5 FIXEDHF     0.800  0       0.0  0                       
1797    IO 1E1515        35.5     0.      44.4 FIXEDHF     0.800  0       0.0  0                       
1798    IO 3E1515        31.0     0.      38.8 FIXEDHF     0.800  0       0.0  0                       
1799    IP 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 13p  
1800    IP 2D1515        86.0     0.     107.5 FIXEDHF     0.800  0       0.0  0                       
1801    IP 1E1515        30.7     0.      38.4 FIXEDHF     0.800  0       0.0  0                       
1802    IP 3E1515        26.9     0.      33.6 FIXEDHF     0.800  0       0.0  0                       
1803    IQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 14p  
1804    IQ 2D1515        75.3     0.      94.1 FIXEDHF     0.800  0       0.0  0                       
1805    IQ 1E1515        27.0     0.      33.7 FIXEDHF     0.800  0       0.0  0                       
1806    IQ 3E1515        23.5     0.      29.4 FIXEDHF     0.800  0       0.0  0                       
1807    IR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 15p  
1808    IR 2D1515        66.6     0.      83.2 FIXEDHF     0.800  0       0.0  0                       
1809    IR 1E1515        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0                       
1810    IR 3E1515        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0                       
1811    IS 2D2516        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s4f      
1812    IS 3E2516       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0                       
1813    IT 2D2516        32.6     0.      40.8 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s5f      
1814    IT 3E2516       -10.8     0.     -13.5 FIXEDHF     0.800  0       0.0  0                       
1815    IU 2D2516        28.9     0.      36.1 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s6f      
1816    IU 3E2516        -9.4     0.     -11.7 FIXEDHF     0.800  0       0.0  0                       
1817    IV 2D2516        24.1     0.      30.1 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s7f      
1818    IV 3E2516        -8.1     0.     -10.1 FIXEDHF     0.800  0       0.0  0                       
1819    IW 2D2516        20.2     0.      25.2 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s8f      
1820    IW 3E2516        -7.0     0.      -8.7 FIXEDHF     0.800  0       0.0  0                       
1821    IX 2D2516        17.0     0.      21.3 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s9f      
1822    IX 3E2516        -6.0     0.      -7.5 FIXEDHF     0.800  0       0.0  0                       
1823    IY 2D2516        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s10f     
1824    IY 3E2516        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
1825    IZ 2D2516        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s11f     
1826    IZ 3E2516        -4.6     0.      -5.8 FIXEDHF     0.800  0       0.0  0                       
1827    Ia 2D2516        11.2     0.      14.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s12f     
1828    Ia 3E2516        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0                       
1829    Ib 2D2516         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s13f     
1830    Ib 3E2516        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
1831    Ic 2D2516         8.9     0.      11.1 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s14f     
1832    Ic 3E2516        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1833    Id 2D1516        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 4f   
1834    Id 4D1516         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
1835    Id 1E1516         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0                       
1836    Id 3E1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0                       
1837    Ie 2D1516       -15.5     0.     -19.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 5f   
1838    Ie 4D1516         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
1839    Ie 1E1516         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
1840    Ie 3E1516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
1841    If 2D1516       -13.8     0.     -17.2 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 6f   
1842    If 4D1516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0                       
1843    If 1E1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
1844    If 3E1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
1845    Ig 2D1516       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 7f   
1846    Ig 4D1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0                       
1847    Ig 1E1516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
1848    Ig 3E1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
1849    Ih 2D1516        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 8f   
1850    Ih 4D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
1851    Ih 1E1516         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
1852    Ih 3E1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1853    Ii 2D1516        -7.9     0.      -9.9 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 9f   
1854    Ii 4D1516         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
1855    Ii 1E1516         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0                       
1856    Ii 3E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1857    Ij 2D1516        -6.7     0.      -8.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 10f  
1858    Ij 4D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
1859    Ij 1E1516         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
1860    Ij 3E1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1861    Ik 2D1516        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 11f  
1862    Ik 4D1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1863    Ik 1E1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1864    Ik 3E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1865    Il 2D1516        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 12f  
1866    Il 4D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1867    Il 1E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1868    Il 3E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1869    Im 2D1516        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 13f  
1870    Im 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1871    Im 1E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1872    Im 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1873    In 2D1516        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 14f  
1874    In 4D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
1875    In 1E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1876    In 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1877    Iz 1D2534      3465.5     0.    4331.9 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9 4s4p5s 
1878    Iz 0E2534       931.5     0.    1164.4 FIXEDHF     0.800  0       0.0  0                       
1879    JK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 8p   
1880    JK 2D1515       156.5     0.     195.6 FIXEDHF     0.800  0       0.0  0                       
1881    JK 1E1515        54.6     0.      68.2 FIXEDHF     0.800  0       0.0  0                       
1882    JK 3E1515        47.7     0.      59.6 FIXEDHF     0.800  0       0.0  0                       
1883    JL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 9p   
1884    JL 2D1515       122.3     0.     152.9 FIXEDHF     0.800  0       0.0  0                       
1885    JL 1E1515        42.9     0.      53.6 FIXEDHF     0.800  0       0.0  0                       
1886    JL 3E1515        37.5     0.      46.9 FIXEDHF     0.800  0       0.0  0                       
1887    JM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 10p  
1888    JM 2D1515        99.1     0.     123.9 FIXEDHF     0.800  0       0.0  0                       
1889    JM 1E1515        34.9     0.      43.6 FIXEDHF     0.800  0       0.0  0                       
1890    JM 3E1515        30.6     0.      38.2 FIXEDHF     0.800  0       0.0  0                       
1891    JN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 11p  
1892    JN 2D1515        82.6     0.     103.2 FIXEDHF     0.800  0       0.0  0                       
1893    JN 1E1515        29.1     0.      36.4 FIXEDHF     0.800  0       0.0  0                       
1894    JN 3E1515        25.5     0.      31.9 FIXEDHF     0.800  0       0.0  0                       
1895    JO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 12p  
1896    JO 2D1515        70.1     0.      87.6 FIXEDHF     0.800  0       0.0  0                       
1897    JO 1E1515        24.8     0.      31.0 FIXEDHF     0.800  0       0.0  0                       
1898    JO 3E1515        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
1899    JP 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 13p  
1900    JP 2D1515        60.6     0.      75.7 FIXEDHF     0.800  0       0.0  0                       
1901    JP 1E1515        21.4     0.      26.8 FIXEDHF     0.800  0       0.0  0                       
1902    JP 3E1515        18.7     0.      23.4 FIXEDHF     0.800  0       0.0  0                       
1903    JQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 14p  
1904    JQ 2D1515        53.0     0.      66.2 FIXEDHF     0.800  0       0.0  0                       
1905    JQ 1E1515        18.8     0.      23.5 FIXEDHF     0.800  0       0.0  0                       
1906    JQ 3E1515        16.4     0.      20.5 FIXEDHF     0.800  0       0.0  0                       
1907    JR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 15p  
1908    JR 2D1515        46.9     0.      58.6 FIXEDHF     0.800  0       0.0  0                       
1909    JR 1E1515        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0                       
1910    JR 3E1515        14.6     0.      18.2 FIXEDHF     0.800  0       0.0  0                       
1911    JS 2D2516        10.6     0.      13.3 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s4f      
1912    JS 3E2516        -7.8     0.      -9.7 FIXEDHF     0.800  0       0.0  0                       
1913    JT 2D2516         9.4     0.      11.8 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s5f      
1914    JT 3E2516        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
1915    JU 2D2516        13.2     0.      16.5 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s6f      
1916    JU 3E2516        -6.4     0.      -8.0 FIXEDHF     0.800  0       0.0  0                       
1917    JV 2D2516        12.3     0.      15.4 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s7f      
1918    JV 3E2516        -5.5     0.      -6.9 FIXEDHF     0.800  0       0.0  0                       
1919    JW 2D2516        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s8f      
1920    JW 3E2516        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0                       
1921    JX 2D2516         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s9f      
1922    JX 3E2516        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0                       
1923    JY 2D2516         8.3     0.      10.4 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s10f     
1924    JY 3E2516        -3.6     0.      -4.5 FIXEDHF     0.800  0       0.0  0                       
1925    JZ 2D2516         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s11f     
1926    JZ 3E2516        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0                       
1927    Ja 2D2516         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s12f     
1928    Ja 3E2516        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
1929    Jb 2D2516         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s13f     
1930    Jb 3E2516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1931    Jc 2D2516         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s14f     
1932    Jc 3E2516        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
1933    Jd 2D1516        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 4f   
1934    Jd 4D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
1935    Jd 1E1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0                       
1936    Jd 3E1516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0                       
1937    Je 2D1516        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 5f   
1938    Je 4D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
1939    Je 1E1516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
1940    Je 3E1516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0                       
1941    Jf 2D1516        -5.6     0.      -7.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 6f   
1942    Jf 4D1516         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
1943    Jf 1E1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
1944    Jf 3E1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
1945    Jg 2D1516        -5.4     0.      -6.7 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 7f   
1946    Jg 4D1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1947    Jg 1E1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
1948    Jg 3E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1949    Jh 2D1516        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 8f   
1950    Jh 4D1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1951    Jh 1E1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1952    Jh 3E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1953    Ji 2D1516        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 9f   
1954    Ji 4D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1955    Ji 1E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1956    Ji 3E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1957    Jj 2D1516        -3.6     0.      -4.5 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 10f  
1958    Jj 4D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
1959    Jj 1E1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1960    Jj 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1961    Jk 2D1516        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 11f  
1962    Jk 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1963    Jk 1E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1964    Jk 3E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1965    Jl 2D1516        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 12f  
1966    Jl 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1967    Jl 1E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1968    Jl 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1969    Jm 2D1516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 13f  
1970    Jm 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1971    Jm 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1972    Jm 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1973    Jn 2D1516        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 14f  
1974    Jn 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1975    Jn 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1976    Jn 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1977    Jz 1D2534      2317.5     0.    2896.9 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9 4s4p5s 
1978    Jz 0E2534       636.0     0.     795.0 FIXEDHF     0.800  0       0.0  0                       
1979    KL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 9p   
1980    KL 2D1515        92.2     0.     115.3 FIXEDHF     0.800  0       0.0  0                       
1981    KL 1E1515        32.2     0.      40.2 FIXEDHF     0.800  0       0.0  0                       
1982    KL 3E1515        28.2     0.      35.2 FIXEDHF     0.800  0       0.0  0                       
1983    KM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 10p  
1984    KM 2D1515        74.7     0.      93.4 FIXEDHF     0.800  0       0.0  0                       
1985    KM 1E1515        26.2     0.      32.7 FIXEDHF     0.800  0       0.0  0                       
1986    KM 3E1515        22.9     0.      28.6 FIXEDHF     0.800  0       0.0  0                       
1987    KN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 11p  
1988    KN 2D1515        62.2     0.      77.7 FIXEDHF     0.800  0       0.0  0                       
1989    KN 1E1515        21.8     0.      27.3 FIXEDHF     0.800  0       0.0  0                       
1990    KN 3E1515        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0                       
1991    KO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 12p  
1992    KO 2D1515        52.8     0.      66.0 FIXEDHF     0.800  0       0.0  0                       
1993    KO 1E1515        18.6     0.      23.2 FIXEDHF     0.800  0       0.0  0                       
1994    KO 3E1515        16.2     0.      20.3 FIXEDHF     0.800  0       0.0  0                       
1995    KP 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 13p  
1996    KP 2D1515        45.6     0.      57.0 FIXEDHF     0.800  0       0.0  0                       
1997    KP 1E1515        16.1     0.      20.1 FIXEDHF     0.800  0       0.0  0                       
1998    KP 3E1515        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0                       
1999    KQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 14p  
2000    KQ 2D1515        39.9     0.      49.9 FIXEDHF     0.800  0       0.0  0                       
2001    KQ 1E1515        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0                       
2002    KQ 3E1515        12.3     0.      15.4 FIXEDHF     0.800  0       0.0  0                       
2003    KR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 15p  
2004    KR 2D1515        35.4     0.      44.2 FIXEDHF     0.800  0       0.0  0                       
2005    KR 1E1515        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0                       
2006    KR 3E1515        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0                       
2007    KS 2D2516         7.6     0.       9.5 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s4f      
2008    KS 3E2516        -5.8     0.      -7.2 FIXEDHF     0.800  0       0.0  0                       
2009    KT 2D2516         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s5f      
2010    KT 3E2516        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0                       
2011    KU 2D2516         6.0     0.       7.5 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s6f      
2012    KU 3E2516        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0                       
2013    KV 2D2516         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s7f      
2014    KV 3E2516        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
2015    KW 2D2516         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s8f      
2016    KW 3E2516        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0                       
2017    KX 2D2516         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s9f      
2018    KX 3E2516        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
2019    KY 2D2516         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s10f     
2020    KY 3E2516        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
2021    KZ 2D2516         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s11f     
2022    KZ 3E2516        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
2023    Ka 2D2516         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s12f     
2024    Ka 3E2516        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
2025    Kb 2D2516         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s13f     
2026    Kb 3E2516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
2027    Kc 2D2516         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s14f     
2028    Kc 3E2516        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
2029    Kd 2D1516        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 4f   
2030    Kd 4D1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
2031    Kd 1E1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
2032    Kd 3E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
2033    Ke 2D1516        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 5f   
2034    Ke 4D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
2035    Ke 1E1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
2036    Ke 3E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
2037    Kf 2D1516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 6f   
2038    Kf 4D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
2039    Kf 1E1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
2040    Kf 3E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
2041    Kg 2D1516        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 7f   
2042    Kg 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
2043    Kg 1E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
2044    Kg 3E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2045    Kh 2D1516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 8f   
2046    Kh 4D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2047    Kh 1E1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
2048    Kh 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2049    Ki 2D1516        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 9f   
2050    Ki 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2051    Ki 1E1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2052    Ki 3E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2053    Kj 2D1516        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 10f  
2054    Kj 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2055    Kj 1E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2056    Kj 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2057    Kk 2D1516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 11f  
2058    Kk 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2059    Kk 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2060    Kk 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2061    Kl 2D1516        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 12f  
2062    Kl 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2063    Kl 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2064    Kl 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2065    Km 2D1516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 13f  
2066    Km 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2067    Km 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2068    Km 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2069    Kn 2D1516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 14f  
2070    Kn 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2071    Kn 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2072    Kn 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2073    Kz 1D2534      1703.0     0.    2128.7 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9 4s4p5s 
2074    Kz 0E2534       471.4     0.     589.3 FIXEDHF     0.800  0       0.0  0                       
2075    LM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 10p  
2076    LM 2D1515        59.0     0.      73.7 FIXEDHF     0.800  0       0.0  0                       
2077    LM 1E1515        20.6     0.      25.7 FIXEDHF     0.800  0       0.0  0                       
2078    LM 3E1515        18.0     0.      22.5 FIXEDHF     0.800  0       0.0  0                       
2079    LN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 11p  
2080    LN 2D1515        49.0     0.      61.3 FIXEDHF     0.800  0       0.0  0                       
2081    LN 1E1515        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0                       
2082    LN 3E1515        15.0     0.      18.8 FIXEDHF     0.800  0       0.0  0                       
2083    LO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 12p  
2084    LO 2D1515        41.7     0.      52.1 FIXEDHF     0.800  0       0.0  0                       
2085    LO 1E1515        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0                       
2086    LO 3E1515        12.8     0.      16.0 FIXEDHF     0.800  0       0.0  0                       
2087    LP 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 13p  
2088    LP 2D1515        36.0     0.      45.0 FIXEDHF     0.800  0       0.0  0                       
2089    LP 1E1515        12.6     0.      15.8 FIXEDHF     0.800  0       0.0  0                       
2090    LP 3E1515        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
2091    LQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 14p  
2092    LQ 2D1515        31.4     0.      39.3 FIXEDHF     0.800  0       0.0  0                       
2093    LQ 1E1515        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
2094    LQ 3E1515         9.7     0.      12.1 FIXEDHF     0.800  0       0.0  0                       
2095    LR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 15p  
2096    LR 2D1515        27.8     0.      34.8 FIXEDHF     0.800  0       0.0  0                       
2097    LR 1E1515         9.8     0.      12.3 FIXEDHF     0.800  0       0.0  0                       
2098    LR 3E1515         8.6     0.      10.7 FIXEDHF     0.800  0       0.0  0                       
2099    LS 2D2516         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s4f      
2100    LS 3E2516        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0                       
2101    LT 2D2516         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s5f      
2102    LT 3E2516        -4.2     0.      -5.3 FIXEDHF     0.800  0       0.0  0                       
2103    LU 2D2516         4.8     0.       6.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s6f      
2104    LU 3E2516        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
2105    LV 2D2516         3.9     0.       4.9 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s7f      
2106    LV 3E2516        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0                       
2107    LW 2D2516         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s8f      
2108    LW 3E2516        -2.7     0.      -3.4 FIXEDHF     0.800  0       0.0  0                       
2109    LX 2D2516         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s9f      
2110    LX 3E2516        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
2111    LY 2D2516         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s10f     
2112    LY 3E2516        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
2113    LZ 2D2516         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s11f     
2114    LZ 3E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2115    La 2D2516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s12f     
2116    La 3E2516        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
2117    Lb 2D2516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s13f     
2118    Lb 3E2516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
2119    Lc 2D2516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s14f     
2120    Lc 3E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2121    Ld 2D1516        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 4f   
2122    Ld 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
2123    Ld 1E1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
2124    Ld 3E1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2125    Le 2D1516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 5f   
2126    Le 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
2127    Le 1E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
2128    Le 3E1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2129    Lf 2D1516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 6f   
2130    Lf 4D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2131    Lf 1E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
2132    Lf 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2133    Lg 2D1516        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 7f   
2134    Lg 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2135    Lg 1E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
2136    Lg 3E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2137    Lh 2D1516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 8f   
2138    Lh 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2139    Lh 1E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2140    Lh 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2141    Li 2D1516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 9f   
2142    Li 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2143    Li 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2144    Li 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2145    Lj 2D1516        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 10f  
2146    Lj 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2147    Lj 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2148    Lj 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2149    Lk 2D1516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 11f  
2150    Lk 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2151    Lk 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2152    Lk 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2153    Ll 2D1516        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 12f  
2154    Ll 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2155    Ll 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2156    Ll 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2157    Lm 2D1516        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 13f  
2158    Lm 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2159    Lm 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2160    Lm 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2161    Ln 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 14f  
2162    Ln 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2163    Ln 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2164    Ln 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2165    Lz 1D2534      1323.7     0.    1654.6 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9 4s4p5s 
2166    Lz 0E2534       368.0     0.     460.0 FIXEDHF     0.800  0       0.0  0                       
2167    MN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 11p  
2168    MN 2D1515        40.0     0.      50.0 FIXEDHF     0.800  0       0.0  0                       
2169    MN 1E1515        14.0     0.      17.5 FIXEDHF     0.800  0       0.0  0                       
2170    MN 3E1515        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0                       
2171    MO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 12p  
2172    MO 2D1515        33.9     0.      42.4 FIXEDHF     0.800  0       0.0  0                       
2173    MO 1E1515        11.9     0.      14.9 FIXEDHF     0.800  0       0.0  0                       
2174    MO 3E1515        10.4     0.      13.0 FIXEDHF     0.800  0       0.0  0                       
2175    MP 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 13p  
2176    MP 2D1515        29.3     0.      36.6 FIXEDHF     0.800  0       0.0  0                       
2177    MP 1E1515        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0                       
2178    MP 3E1515         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0                       
2179    MQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 14p  
2180    MQ 2D1515        25.7     0.      32.1 FIXEDHF     0.800  0       0.0  0                       
2181    MQ 1E1515         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0                       
2182    MQ 3E1515         7.9     0.       9.9 FIXEDHF     0.800  0       0.0  0                       
2183    MR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 15p  
2184    MR 2D1515        22.7     0.      28.4 FIXEDHF     0.800  0       0.0  0                       
2185    MR 1E1515         8.0     0.      10.0 FIXEDHF     0.800  0       0.0  0                       
2186    MR 3E1515         7.0     0.       8.7 FIXEDHF     0.800  0       0.0  0                       
2187    MS 2D2516         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s4f      
2188    MS 3E2516        -3.6     0.      -4.5 FIXEDHF     0.800  0       0.0  0                       
2189    MT 2D2516         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s5f      
2190    MT 3E2516        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0                       
2191    MU 2D2516         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s6f      
2192    MU 3E2516        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
2193    MV 2D2516         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s7f      
2194    MV 3E2516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
2195    MW 2D2516         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s8f      
2196    MW 3E2516        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
2197    MX 2D2516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s9f      
2198    MX 3E2516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
2199    MY 2D2516         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s10f     
2200    MY 3E2516        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
2201    MZ 2D2516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s11f     
2202    MZ 3E2516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
2203    Ma 2D2516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s12f     
2204    Ma 3E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2205    Mb 2D2516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s13f     
2206    Mb 3E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2207    Mc 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s14f     
2208    Mc 3E2516        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
2209    Md 2D1516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 4f   
2210    Md 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2211    Md 1E1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
2212    Md 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2213    Me 2D1516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 5f   
2214    Me 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2215    Me 1E1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
2216    Me 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2217    Mf 2D1516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 6f   
2218    Mf 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2219    Mf 1E1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2220    Mf 3E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2221    Mg 2D1516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 7f   
2222    Mg 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2223    Mg 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2224    Mg 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2225    Mh 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 8f   
2226    Mh 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2227    Mh 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2228    Mh 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2229    Mi 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 9f   
2230    Mi 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2231    Mi 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2232    Mi 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2233    Mj 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 10f  
2234    Mj 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2235    Mj 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2236    Mj 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2237    Mk 2D1516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 11f  
2238    Mk 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2239    Mk 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2240    Mk 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2241    Ml 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 12f  
2242    Ml 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2243    Ml 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2244    Ml 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2245    Mm 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 13f  
2246    Mm 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2247    Mm 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2248    Mm 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2249    Mn 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 14f  
2250    Mn 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2251    Mn 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2252    Mn 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2253    Mz 1D2534      1068.6     0.    1335.8 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9 4s4p5s 
2254    Mz 0E2534       297.9     0.     372.4 FIXEDHF     0.800  0       0.0  0                       
2255    NO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 12p  
2256    NO 2D1515        28.4     0.      35.5 FIXEDHF     0.800  0       0.0  0                       
2257    NO 1E1515         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0                       
2258    NO 3E1515         8.7     0.      10.9 FIXEDHF     0.800  0       0.0  0                       
2259    NP 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 13p  
2260    NP 2D1515        24.5     0.      30.6 FIXEDHF     0.800  0       0.0  0                       
2261    NP 1E1515         8.6     0.      10.7 FIXEDHF     0.800  0       0.0  0                       
2262    NP 3E1515         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0                       
2263    NQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 14p  
2264    NQ 2D1515        21.4     0.      26.8 FIXEDHF     0.800  0       0.0  0                       
2265    NQ 1E1515         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0                       
2266    NQ 3E1515         6.6     0.       8.2 FIXEDHF     0.800  0       0.0  0                       
2267    NR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 15p  
2268    NR 2D1515        19.0     0.      23.7 FIXEDHF     0.800  0       0.0  0                       
2269    NR 1E1515         6.6     0.       8.3 FIXEDHF     0.800  0       0.0  0                       
2270    NR 3E1515         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0                       
2271    NS 2D2516         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s4f      
2272    NS 3E2516        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
2273    NT 2D2516         3.6     0.       4.5 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s5f      
2274    NT 3E2516        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
2275    NU 2D2516         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s6f      
2276    NU 3E2516        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
2277    NV 2D2516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s7f      
2278    NV 3E2516        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
2279    NW 2D2516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s8f      
2280    NW 3E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2281    NX 2D2516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s9f      
2282    NX 3E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2283    NY 2D2516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s10f     
2284    NY 3E2516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
2285    NZ 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s11f     
2286    NZ 3E2516        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
2287    Na 2D2516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s12f     
2288    Na 3E2516        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
2289    Nb 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s13f     
2290    Nb 3E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2291    Nc 2D2516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s14f     
2292    Nc 3E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2293    Nd 2D1516        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 4f   
2294    Nd 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2295    Nd 1E1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2296    Nd 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2297    Ne 2D1516        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 5f   
2298    Ne 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2299    Ne 1E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
2300    Ne 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2301    Nf 2D1516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 6f   
2302    Nf 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2303    Nf 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2304    Nf 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2305    Ng 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 7f   
2306    Ng 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2307    Ng 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2308    Ng 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2309    Nh 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 8f   
2310    Nh 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2311    Nh 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2312    Nh 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2313    Ni 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 9f   
2314    Ni 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2315    Ni 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2316    Ni 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2317    Nj 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 10f  
2318    Nj 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2319    Nj 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2320    Nj 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2321    Nk 2D1516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 11f  
2322    Nk 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2323    Nk 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2324    Nk 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2325    Nl 2D1516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 12f  
2326    Nl 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2327    Nl 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2328    Nl 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2329    Nm 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 13f  
2330    Nm 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2331    Nm 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2332    Nm 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2333    Nn 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 14f  
2334    Nn 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2335    Nn 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2336    Nn 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2337    Nz 1D2534       887.0     0.    1108.8 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9 4s4p5s 
2338    Nz 0E2534       247.7     0.     309.6 FIXEDHF     0.800  0       0.0  0                       
2339    OP 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 13p  
2340    OP 2D1515        20.9     0.      26.1 FIXEDHF     0.800  0       0.0  0                       
2341    OP 1E1515         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0                       
2342    OP 3E1515         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
2343    OQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 14p  
2344    OQ 2D1515        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0                       
2345    OQ 1E1515         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
2346    OQ 3E1515         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
2347    OR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 15p  
2348    OR 2D1515        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0                       
2349    OR 1E1515         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0                       
2350    OR 3E1515         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0                       
2351    OS 2D2516         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s4f      
2352    OS 3E2516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
2353    OT 2D2516         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s5f      
2354    OT 3E2516        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
2355    OU 2D2516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s6f      
2356    OU 3E2516        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
2357    OV 2D2516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s7f      
2358    OV 3E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2359    OW 2D2516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s8f      
2360    OW 3E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2361    OX 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s9f      
2362    OX 3E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2363    OY 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s10f     
2364    OY 3E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2365    OZ 2D2516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s11f     
2366    OZ 3E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2367    Oa 2D2516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s12f     
2368    Oa 3E2516        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2369    Ob 2D2516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s13f     
2370    Ob 3E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2371    Oc 2D2516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s14f     
2372    Oc 3E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2373    Od 2D1516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 4f   
2374    Od 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2375    Od 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2376    Od 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2377    Oe 2D1516        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 5f   
2378    Oe 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2379    Oe 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2380    Oe 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2381    Of 2D1516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 6f   
2382    Of 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2383    Of 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2384    Of 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2385    Og 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 7f   
2386    Og 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2387    Og 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2388    Og 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2389    Oh 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 8f   
2390    Oh 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2391    Oh 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2392    Oh 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2393    Oi 2D1516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 9f   
2394    Oi 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2395    Oi 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2396    Oi 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2397    Oj 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 10f  
2398    Oj 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2399    Oj 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2400    Oj 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2401    Ok 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 11f  
2402    Ok 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2403    Ok 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2404    Ok 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2405    Ol 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 12f  
2406    Ol 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2407    Ol 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2408    Ol 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2409    Om 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 13f  
2410    Om 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2411    Om 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2412    Om 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2413    On 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 14f  
2414    On 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2415    On 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2416    On 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2417    Oz 1D2534       752.0     0.     940.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9 4s4p5s 
2418    Oz 0E2534       210.2     0.     262.8 FIXEDHF     0.800  0       0.0  0                       
2419    PQ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 14p  
2420    PQ 2D1515        15.8     0.      19.7 FIXEDHF     0.800  0       0.0  0                       
2421    PQ 1E1515         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0                       
2422    PQ 3E1515         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0                       
2423    PR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 15p  
2424    PR 2D1515        14.0     0.      17.5 FIXEDHF     0.800  0       0.0  0                       
2425    PR 1E1515         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0                       
2426    PR 3E1515         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
2427    PS 2D2516         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s4f      
2428    PS 3E2516        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
2429    PT 2D2516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s5f      
2430    PT 3E2516        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
2431    PU 2D2516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s6f      
2432    PU 3E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2433    PV 2D2516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s7f      
2434    PV 3E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2435    PW 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s8f      
2436    PW 3E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2437    PX 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s9f      
2438    PX 3E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2439    PY 2D2516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s10f     
2440    PY 3E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2441    PZ 2D2516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s11f     
2442    PZ 3E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2443    Pa 2D2516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s12f     
2444    Pa 3E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2445    Pb 2D2516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s13f     
2446    Pb 3E2516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2447    Pc 2D2516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s14f     
2448    Pc 3E2516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2449    Pd 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 4f   
2450    Pd 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2451    Pd 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2452    Pd 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2453    Pe 2D1516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 5f   
2454    Pe 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2455    Pe 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2456    Pe 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2457    Pf 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 6f   
2458    Pf 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2459    Pf 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2460    Pf 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2461    Pg 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 7f   
2462    Pg 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2463    Pg 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2464    Pg 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2465    Ph 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 8f   
2466    Ph 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2467    Ph 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2468    Ph 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2469    Pi 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 9f   
2470    Pi 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2471    Pi 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2472    Pi 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2473    Pj 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 10f  
2474    Pj 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2475    Pj 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2476    Pj 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2477    Pk 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 11f  
2478    Pk 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2479    Pk 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2480    Pk 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2481    Pl 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 12f  
2482    Pl 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2483    Pl 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2484    Pl 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2485    Pm 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 13f  
2486    Pm 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2487    Pm 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2488    Pm 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2489    Pn 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 14f  
2490    Pn 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2491    Pn 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2492    Pn 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2493    Pz 1D2534       648.3     0.     810.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9 4s4p5s 
2494    Pz 0E2534       181.4     0.     226.8 FIXEDHF     0.800  0       0.0  0                       
2495    QR 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 15p  
2496    QR 2D1515        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0                       
2497    QR 1E1515         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
2498    QR 3E1515         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
2499    QS 2D2516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s4f      
2500    QS 3E2516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
2501    QT 2D2516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s5f      
2502    QT 3E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2503    QU 2D2516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s6f      
2504    QU 3E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2505    QV 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s7f      
2506    QV 3E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2507    QW 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s8f      
2508    QW 3E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2509    QX 2D2516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s9f      
2510    QX 3E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2511    QY 2D2516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s10f     
2512    QY 3E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2513    QZ 2D2516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s11f     
2514    QZ 3E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2515    Qa 2D2516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s12f     
2516    Qa 3E2516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2517    Qb 2D2516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s13f     
2518    Qb 3E2516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2519    Qc 2D2516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s14f     
2520    Qc 3E2516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2521    Qd 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 4f   
2522    Qd 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2523    Qd 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2524    Qd 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2525    Qe 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 5f   
2526    Qe 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2527    Qe 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2528    Qe 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2529    Qf 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 6f   
2530    Qf 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2531    Qf 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2532    Qf 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2533    Qg 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 7f   
2534    Qg 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2535    Qg 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2536    Qg 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2537    Qh 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 8f   
2538    Qh 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2539    Qh 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2540    Qh 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2541    Qi 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 9f   
2542    Qi 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2543    Qi 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2544    Qi 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2545    Qj 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 10f  
2546    Qj 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2547    Qj 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2548    Qj 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2549    Qk 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 11f  
2550    Qk 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2551    Qk 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2552    Qk 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2553    Ql 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 12f  
2554    Ql 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2555    Ql 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2556    Ql 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2557    Qm 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 13f  
2558    Qm 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2559    Qm 1E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2560    Qm 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2561    Qn 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 14f  
2562    Qn 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2563    Qn 1E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2564    Qn 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2565    Qz 1D2534       566.6     0.     708.2 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9 4s4p5s 
2566    Qz 0E2534       158.7     0.     198.4 FIXEDHF     0.800  0       0.0  0                       
2567    RS 2D2516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s4f      
2568    RS 3E2516        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
2569    RT 2D2516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s5f      
2570    RT 3E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2571    RU 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s6f      
2572    RU 3E2516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
2573    RV 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s7f      
2574    RV 3E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2575    RW 2D2516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s8f      
2576    RW 3E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2577    RX 2D2516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s9f      
2578    RX 3E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2579    RY 2D2516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s10f     
2580    RY 3E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2581    RZ 2D2516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s11f     
2582    RZ 3E2516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2583    Ra 2D2516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s12f     
2584    Ra 3E2516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2585    Rb 2D2516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s13f     
2586    Rb 3E2516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2587    Rc 2D2516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s14f     
2588    Rc 3E2516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2589    Rd 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 4f   
2590    Rd 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2591    Rd 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2592    Rd 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2593    Re 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 5f   
2594    Re 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2595    Re 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2596    Re 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2597    Rf 2D1516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 6f   
2598    Rf 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2599    Rf 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2600    Rf 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2601    Rg 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 7f   
2602    Rg 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2603    Rg 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2604    Rg 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2605    Rh 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 8f   
2606    Rh 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2607    Rh 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2608    Rh 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2609    Ri 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 9f   
2610    Ri 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2611    Ri 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2612    Ri 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2613    Rj 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 10f  
2614    Rj 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2615    Rj 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2616    Rj 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2617    Rk 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 11f  
2618    Rk 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2619    Rk 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2620    Rk 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2621    Rl 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 12f  
2622    Rl 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2623    Rl 1E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2624    Rl 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2625    Rm 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 13f  
2626    Rm 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2627    Rm 1E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2628    Rm 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2629    Rn 2D1516        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 14f  
2630    Rn 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2631    Rn 1E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2632    Rn 3E1516         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2633    Rz 1D2534       500.7     0.     625.9 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9 4s4p5s 
2634    Rz 0E2534       140.3     0.     175.4 FIXEDHF     0.800  0       0.0  0                       
2635    ST 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s5f      
2636    ST 3E2626        10.3     0.      12.9 FIXEDHF     0.800  0       0.0  0                       
2637    SU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s6f      
2638    SU 3E2626         8.8     0.      11.0 FIXEDHF     0.800  0       0.0  0                       
2639    SV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s7f      
2640    SV 3E2626         7.4     0.       9.3 FIXEDHF     0.800  0       0.0  0                       
2641    SW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s8f      
2642    SW 3E2626         6.3     0.       7.9 FIXEDHF     0.800  0       0.0  0                       
2643    SX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s9f      
2644    SX 3E2626         5.4     0.       6.8 FIXEDHF     0.800  0       0.0  0                       
2645    SY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s10f     
2646    SY 3E2626         4.8     0.       6.0 FIXEDHF     0.800  0       0.0  0                       
2647    SZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s11f     
2648    SZ 3E2626         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0                       
2649    Sa 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s12f     
2650    Sa 3E2626         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
2651    Sb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s13f     
2652    Sb 3E2626         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
2653    Sc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s14f     
2654    Sc 3E2626         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
2655    Sd 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 4f   
2656    Sd 2D1626      -100.7     0.    -125.9 FIXEDHF     0.800  0       0.0  0                       
2657    Sd 3E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2658    Se 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 5f   
2659    Se 2D1626       -59.0     0.     -73.8 FIXEDHF     0.800  0       0.0  0                       
2660    Se 3E1626        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2661    Sf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 6f   
2662    Sf 2D1626       -41.8     0.     -52.2 FIXEDHF     0.800  0       0.0  0                       
2663    Sf 3E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2664    Sg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 7f   
2665    Sg 2D1626       -31.9     0.     -39.9 FIXEDHF     0.800  0       0.0  0                       
2666    Sg 3E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2667    Sh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 8f   
2668    Sh 2D1626       -25.6     0.     -32.0 FIXEDHF     0.800  0       0.0  0                       
2669    Sh 3E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2670    Si 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 9f   
2671    Si 2D1626       -21.1     0.     -26.4 FIXEDHF     0.800  0       0.0  0                       
2672    Si 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2673    Sj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 10f  
2674    Sj 2D1626       -17.8     0.     -22.3 FIXEDHF     0.800  0       0.0  0                       
2675    Sj 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2676    Sk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 11f  
2677    Sk 2D1626       -15.4     0.     -19.2 FIXEDHF     0.800  0       0.0  0                       
2678    Sk 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2679    Sl 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 12f  
2680    Sl 2D1626       -13.4     0.     -16.8 FIXEDHF     0.800  0       0.0  0                       
2681    Sl 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2682    Sm 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 13f  
2683    Sm 2D1626       -11.8     0.     -14.8 FIXEDHF     0.800  0       0.0  0                       
2684    Sm 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2685    Sn 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 14f  
2686    Sn 2D1626       -10.6     0.     -13.3 FIXEDHF     0.800  0       0.0  0                       
2687    Sn 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2688    St 1D2638      2741.0     0.    3426.2 FIXEDHF     0.800  0       0.0  0  4s4f      -4p4d      
2689    St 2E2638       227.3     0.     284.1 FIXEDHF     0.800  0       0.0  0                       
2690    Su 1D2638      -279.8     0.    -349.7 FIXEDHF     0.800  0       0.0  0  4s4f      -4p5d      
2691    Su 2E2638       155.3     0.     194.1 FIXEDHF     0.800  0       0.0  0                       
2692    Sv 1D2638       -42.0     0.     -52.5 FIXEDHF     0.800  0       0.0  0  4s4f      -4p6d      
2693    Sv 2E2638       111.0     0.     138.7 FIXEDHF     0.800  0       0.0  0                       
2694    Sw 1D2638       -26.0     0.     -32.5 FIXEDHF     0.800  0       0.0  0  4s4f      -4p7d      
2695    Sw 2E2638        83.5     0.     104.4 FIXEDHF     0.800  0       0.0  0                       
2696    Sx 1D2638       -21.4     0.     -26.8 FIXEDHF     0.800  0       0.0  0  4s4f      -4p8d      
2697    Sx 2E2638        65.5     0.      81.9 FIXEDHF     0.800  0       0.0  0                       
2698    Sy 1D2638       -18.9     0.     -23.6 FIXEDHF     0.800  0       0.0  0  4s4f      -4p9d      
2699    Sy 2E2638        53.1     0.      66.4 FIXEDHF     0.800  0       0.0  0                       
2700    Sz 3D1634        63.4     0.      79.3 FIXEDHF     0.800  0       0.0  0  4s4f      -d9 4s4p5s 
2701    Sz 2E1634       -24.0     0.     -30.0 FIXEDHF     0.800  0       0.0  0                       
2702    TU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s6f      
2703    TU 3E2626         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
2704    TV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s7f      
2705    TV 3E2626         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0                       
2706    TW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s8f      
2707    TW 3E2626         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0                       
2708    TX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s9f      
2709    TX 3E2626         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0                       
2710    TY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s10f     
2711    TY 3E2626         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0                       
2712    TZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s11f     
2713    TZ 3E2626         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0                       
2714    Ta 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s12f     
2715    Ta 3E2626         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
2716    Tb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s13f     
2717    Tb 3E2626         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
2718    Tc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s14f     
2719    Tc 3E2626         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0                       
2720    Td 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 4f   
2721    Td 2D1626       -59.0     0.     -73.8 FIXEDHF     0.800  0       0.0  0                       
2722    Td 3E1626        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2723    Te 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 5f   
2724    Te 2D1626       -52.2     0.     -65.3 FIXEDHF     0.800  0       0.0  0                       
2725    Te 3E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2726    Tf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 6f   
2727    Tf 2D1626       -36.8     0.     -46.0 FIXEDHF     0.800  0       0.0  0                       
2728    Tf 3E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2729    Tg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 7f   
2730    Tg 2D1626       -28.2     0.     -35.3 FIXEDHF     0.800  0       0.0  0                       
2731    Tg 3E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2732    Th 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 8f   
2733    Th 2D1626       -22.6     0.     -28.3 FIXEDHF     0.800  0       0.0  0                       
2734    Th 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2735    Ti 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 9f   
2736    Ti 2D1626       -18.8     0.     -23.5 FIXEDHF     0.800  0       0.0  0                       
2737    Ti 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2738    Tj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 10f  
2739    Tj 2D1626       -15.9     0.     -19.9 FIXEDHF     0.800  0       0.0  0                       
2740    Tj 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2741    Tk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 11f  
2742    Tk 2D1626       -13.7     0.     -17.1 FIXEDHF     0.800  0       0.0  0                       
2743    Tk 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2744    Tl 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 12f  
2745    Tl 2D1626       -12.0     0.     -15.0 FIXEDHF     0.800  0       0.0  0                       
2746    Tl 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2747    Tm 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 13f  
2748    Tm 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
2749    Tm 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2750    Tn 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 14f  
2751    Tn 2D1626        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
2752    Tn 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2753    Tt 1D2638      1974.5     0.    2468.1 FIXEDHF     0.800  0       0.0  0  4s5f      -4p4d      
2754    Tt 2E2638       205.2     0.     256.5 FIXEDHF     0.800  0       0.0  0                       
2755    Tu 1D2638       607.9     0.     759.9 FIXEDHF     0.800  0       0.0  0  4s5f      -4p5d      
2756    Tu 2E2638       140.8     0.     176.0 FIXEDHF     0.800  0       0.0  0                       
2757    Tv 1D2638      -202.1     0.    -252.6 FIXEDHF     0.800  0       0.0  0  4s5f      -4p6d      
2758    Tv 2E2638       100.8     0.     126.0 FIXEDHF     0.800  0       0.0  0                       
2759    Tw 1D2638       -47.8     0.     -59.8 FIXEDHF     0.800  0       0.0  0  4s5f      -4p7d      
2760    Tw 2E2638        75.9     0.      94.9 FIXEDHF     0.800  0       0.0  0                       
2761    Tx 1D2638       -29.8     0.     -37.2 FIXEDHF     0.800  0       0.0  0  4s5f      -4p8d      
2762    Tx 2E2638        59.6     0.      74.5 FIXEDHF     0.800  0       0.0  0                       
2763    Ty 1D2638       -23.0     0.     -28.8 FIXEDHF     0.800  0       0.0  0  4s5f      -4p9d      
2764    Ty 2E2638        48.3     0.      60.4 FIXEDHF     0.800  0       0.0  0                       
2765    Tz 3D1634        53.4     0.      66.7 FIXEDHF     0.800  0       0.0  0  4s5f      -d9 4s4p5s 
2766    Tz 2E1634       -22.7     0.     -28.4 FIXEDHF     0.800  0       0.0  0                       
2767    UV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s7f      
2768    UV 3E2626         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0                       
2769    UW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s8f      
2770    UW 3E2626         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0                       
2771    UX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s9f      
2772    UX 3E2626         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0                       
2773    UY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s10f     
2774    UY 3E2626         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
2775    UZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s11f     
2776    UZ 3E2626         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0                       
2777    Ua 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s12f     
2778    Ua 3E2626         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0                       
2779    Ub 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s13f     
2780    Ub 3E2626         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
2781    Uc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s14f     
2782    Uc 3E2626         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
2783    Ud 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 4f   
2784    Ud 2D1626       -41.7     0.     -52.1 FIXEDHF     0.800  0       0.0  0                       
2785    Ud 3E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2786    Ue 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 5f   
2787    Ue 2D1626       -36.8     0.     -46.0 FIXEDHF     0.800  0       0.0  0                       
2788    Ue 3E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2789    Uf 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 6f   
2790    Uf 2D1626       -30.6     0.     -38.2 FIXEDHF     0.800  0       0.0  0                       
2791    Uf 3E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2792    Ug 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 7f   
2793    Ug 2D1626       -23.4     0.     -29.2 FIXEDHF     0.800  0       0.0  0                       
2794    Ug 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2795    Uh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 8f   
2796    Uh 2D1626       -18.8     0.     -23.5 FIXEDHF     0.800  0       0.0  0                       
2797    Uh 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2798    Ui 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 9f   
2799    Ui 2D1626       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
2800    Ui 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2801    Uj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 10f  
2802    Uj 2D1626       -13.2     0.     -16.5 FIXEDHF     0.800  0       0.0  0                       
2803    Uj 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2804    Uk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 11f  
2805    Uk 2D1626       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0                       
2806    Uk 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2807    Ul 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 12f  
2808    Ul 2D1626        -9.9     0.     -12.4 FIXEDHF     0.800  0       0.0  0                       
2809    Ul 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2810    Um 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 13f  
2811    Um 2D1626        -8.8     0.     -11.0 FIXEDHF     0.800  0       0.0  0                       
2812    Um 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2813    Un 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 14f  
2814    Un 2D1626        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
2815    Un 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2816    Ut 1D2638      1496.2     0.    1870.3 FIXEDHF     0.800  0       0.0  0  4s6f      -4p4d      
2817    Ut 2E2638       173.1     0.     216.4 FIXEDHF     0.800  0       0.0  0                       
2818    Uu 1D2638       595.1     0.     743.9 FIXEDHF     0.800  0       0.0  0  4s6f      -4p5d      
2819    Uu 2E2638       119.0     0.     148.8 FIXEDHF     0.800  0       0.0  0                       
2820    Uv 1D2638       142.1     0.     177.6 FIXEDHF     0.800  0       0.0  0  4s6f      -4p6d      
2821    Uv 2E2638        85.3     0.     106.6 FIXEDHF     0.800  0       0.0  0                       
2822    Uw 1D2638      -136.9     0.    -171.1 FIXEDHF     0.800  0       0.0  0  4s6f      -4p7d      
2823    Uw 2E2638        64.3     0.      80.4 FIXEDHF     0.800  0       0.0  0                       
2824    Ux 1D2638       -42.2     0.     -52.7 FIXEDHF     0.800  0       0.0  0  4s6f      -4p8d      
2825    Ux 2E2638        50.5     0.      63.1 FIXEDHF     0.800  0       0.0  0                       
2826    Uy 1D2638       -27.5     0.     -34.4 FIXEDHF     0.800  0       0.0  0  4s6f      -4p9d      
2827    Uy 2E2638        41.0     0.      51.2 FIXEDHF     0.800  0       0.0  0                       
2828    Uz 3D1634        43.3     0.      54.1 FIXEDHF     0.800  0       0.0  0  4s6f      -d9 4s4p5s 
2829    Uz 2E1634       -19.7     0.     -24.6 FIXEDHF     0.800  0       0.0  0                       
2830    VW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s8f      
2831    VW 3E2626         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0                       
2832    VX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s9f      
2833    VX 3E2626         3.6     0.       4.5 FIXEDHF     0.800  0       0.0  0                       
2834    VY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s10f     
2835    VY 3E2626         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0                       
2836    VZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s11f     
2837    VZ 3E2626         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0                       
2838    Va 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s12f     
2839    Va 3E2626         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0                       
2840    Vb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s13f     
2841    Vb 3E2626         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0                       
2842    Vc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s14f     
2843    Vc 3E2626         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
2844    Vd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 4f   
2845    Vd 2D1626       -31.8     0.     -39.8 FIXEDHF     0.800  0       0.0  0                       
2846    Vd 3E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2847    Ve 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 5f   
2848    Ve 2D1626       -28.2     0.     -35.3 FIXEDHF     0.800  0       0.0  0                       
2849    Ve 3E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2850    Vf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 6f   
2851    Vf 2D1626       -23.4     0.     -29.2 FIXEDHF     0.800  0       0.0  0                       
2852    Vf 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2853    Vg 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 7f   
2854    Vg 2D1626       -19.4     0.     -24.3 FIXEDHF     0.800  0       0.0  0                       
2855    Vg 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2856    Vh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 8f   
2857    Vh 2D1626       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
2858    Vh 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2859    Vi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 9f   
2860    Vi 2D1626       -12.9     0.     -16.1 FIXEDHF     0.800  0       0.0  0                       
2861    Vi 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2862    Vj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 10f  
2863    Vj 2D1626       -11.0     0.     -13.7 FIXEDHF     0.800  0       0.0  0                       
2864    Vj 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2865    Vk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 11f  
2866    Vk 2D1626        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
2867    Vk 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2868    Vl 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 12f  
2869    Vl 2D1626        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0                       
2870    Vl 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2871    Vm 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 13f  
2872    Vm 2D1626        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
2873    Vm 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2874    Vn 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 14f  
2875    Vn 2D1626        -6.6     0.      -8.2 FIXEDHF     0.800  0       0.0  0                       
2876    Vn 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2877    Vt 1D2638      1183.8     0.    1479.8 FIXEDHF     0.800  0       0.0  0  4s7f      -4p4d      
2878    Vt 2E2638       145.7     0.     182.1 FIXEDHF     0.800  0       0.0  0                       
2879    Vu 1D2638       517.6     0.     647.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4p5d      
2880    Vu 2E2638       100.3     0.     125.4 FIXEDHF     0.800  0       0.0  0                       
2881    Vv 1D2638       185.9     0.     232.4 FIXEDHF     0.800  0       0.0  0  4s7f      -4p6d      
2882    Vv 2E2638        71.9     0.      89.9 FIXEDHF     0.800  0       0.0  0                       
2883    Vw 1D2638        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4p7d      
2884    Vw 2E2638        54.2     0.      67.8 FIXEDHF     0.800  0       0.0  0                       
2885    Vx 1D2638       -94.0     0.    -117.5 FIXEDHF     0.800  0       0.0  0  4s7f      -4p8d      
2886    Vx 2E2638        42.6     0.      53.3 FIXEDHF     0.800  0       0.0  0                       
2887    Vy 1D2638       -34.6     0.     -43.3 FIXEDHF     0.800  0       0.0  0  4s7f      -4p9d      
2888    Vy 2E2638        34.6     0.      43.2 FIXEDHF     0.800  0       0.0  0                       
2889    Vz 3D1634        35.5     0.      44.4 FIXEDHF     0.800  0       0.0  0  4s7f      -d9 4s4p5s 
2890    Vz 2E1634       -16.9     0.     -21.1 FIXEDHF     0.800  0       0.0  0                       
2891    WX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s9f      
2892    WX 3E2626         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0                       
2893    WY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s10f     
2894    WY 3E2626         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0                       
2895    WZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s11f     
2896    WZ 3E2626         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
2897    Wa 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s12f     
2898    Wa 3E2626         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
2899    Wb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s13f     
2900    Wb 3E2626         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0                       
2901    Wc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s14f     
2902    Wc 3E2626         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
2903    Wd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 4f   
2904    Wd 2D1626       -25.5     0.     -31.9 FIXEDHF     0.800  0       0.0  0                       
2905    Wd 3E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2906    We 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 5f   
2907    We 2D1626       -22.6     0.     -28.3 FIXEDHF     0.800  0       0.0  0                       
2908    We 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2909    Wf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 6f   
2910    Wf 2D1626       -18.8     0.     -23.5 FIXEDHF     0.800  0       0.0  0                       
2911    Wf 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2912    Wg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 7f   
2913    Wg 2D1626       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
2914    Wg 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2915    Wh 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 8f   
2916    Wh 2D1626       -13.1     0.     -16.4 FIXEDHF     0.800  0       0.0  0                       
2917    Wh 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2918    Wi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 9f   
2919    Wi 2D1626       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0                       
2920    Wi 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2921    Wj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 10f  
2922    Wj 2D1626        -9.2     0.     -11.5 FIXEDHF     0.800  0       0.0  0                       
2923    Wj 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2924    Wk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 11f  
2925    Wk 2D1626        -7.9     0.      -9.9 FIXEDHF     0.800  0       0.0  0                       
2926    Wk 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2927    Wl 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 12f  
2928    Wl 2D1626        -7.0     0.      -8.7 FIXEDHF     0.800  0       0.0  0                       
2929    Wl 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2930    Wm 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 13f  
2931    Wm 2D1626        -6.2     0.      -7.7 FIXEDHF     0.800  0       0.0  0                       
2932    Wm 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2933    Wn 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 14f  
2934    Wn 2D1626        -5.5     0.      -6.9 FIXEDHF     0.800  0       0.0  0                       
2935    Wn 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2936    Wt 1D2638       967.4     0.    1209.2 FIXEDHF     0.800  0       0.0  0  4s8f      -4p4d      
2937    Wt 2E2638       123.8     0.     154.8 FIXEDHF     0.800  0       0.0  0                       
2938    Wu 1D2638       444.0     0.     555.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4p5d      
2939    Wu 2E2638        85.4     0.     106.7 FIXEDHF     0.800  0       0.0  0                       
2940    Wv 1D2638       182.6     0.     228.3 FIXEDHF     0.800  0       0.0  0  4s8f      -4p6d      
2941    Wv 2E2638        61.3     0.      76.6 FIXEDHF     0.800  0       0.0  0                       
2942    Ww 1D2638        55.5     0.      69.4 FIXEDHF     0.800  0       0.0  0  4s8f      -4p7d      
2943    Ww 2E2638        46.2     0.      57.7 FIXEDHF     0.800  0       0.0  0                       
2944    Wx 1D2638       -12.6     0.     -15.8 FIXEDHF     0.800  0       0.0  0  4s8f      -4p8d      
2945    Wx 2E2638        36.2     0.      45.3 FIXEDHF     0.800  0       0.0  0                       
2946    Wy 1D2638       -66.5     0.     -83.1 FIXEDHF     0.800  0       0.0  0  4s8f      -4p9d      
2947    Wy 2E2638        29.4     0.      36.8 FIXEDHF     0.800  0       0.0  0                       
2948    Wz 3D1634        29.7     0.      37.1 FIXEDHF     0.800  0       0.0  0  4s8f      -d9 4s4p5s 
2949    Wz 2E1634       -14.5     0.     -18.1 FIXEDHF     0.800  0       0.0  0                       
2950    XY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s10f     
2951    XY 3E2626         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
2952    XZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s11f     
2953    XZ 3E2626         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
2954    Xa 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s12f     
2955    Xa 3E2626         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
2956    Xb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s13f     
2957    Xb 3E2626         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
2958    Xc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s14f     
2959    Xc 3E2626         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
2960    Xd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 4f   
2961    Xd 2D1626       -21.0     0.     -26.3 FIXEDHF     0.800  0       0.0  0                       
2962    Xd 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2963    Xe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 5f   
2964    Xe 2D1626       -18.7     0.     -23.4 FIXEDHF     0.800  0       0.0  0                       
2965    Xe 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2966    Xf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 6f   
2967    Xf 2D1626       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
2968    Xf 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2969    Xg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 7f   
2970    Xg 2D1626       -12.9     0.     -16.1 FIXEDHF     0.800  0       0.0  0                       
2971    Xg 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2972    Xh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 8f   
2973    Xh 2D1626       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0                       
2974    Xh 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2975    Xi 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 9f   
2976    Xi 2D1626        -9.3     0.     -11.6 FIXEDHF     0.800  0       0.0  0                       
2977    Xi 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2978    Xj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 10f  
2979    Xj 2D1626        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
2980    Xj 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2981    Xk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 11f  
2982    Xk 2D1626        -6.8     0.      -8.5 FIXEDHF     0.800  0       0.0  0                       
2983    Xk 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2984    Xl 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 12f  
2985    Xl 2D1626        -5.9     0.      -7.4 FIXEDHF     0.800  0       0.0  0                       
2986    Xl 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2987    Xm 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 13f  
2988    Xm 2D1626        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
2989    Xm 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2990    Xn 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 14f  
2991    Xn 2D1626        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0                       
2992    Xn 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2993    Xt 1D2638       810.1     0.    1012.6 FIXEDHF     0.800  0       0.0  0  4s9f      -4p4d      
2994    Xt 2E2638       106.6     0.     133.2 FIXEDHF     0.800  0       0.0  0                       
2995    Xu 1D2638       382.9     0.     478.6 FIXEDHF     0.800  0       0.0  0  4s9f      -4p5d      
2996    Xu 2E2638        73.5     0.      91.9 FIXEDHF     0.800  0       0.0  0                       
2997    Xv 1D2638       168.5     0.     210.6 FIXEDHF     0.800  0       0.0  0  4s9f      -4p6d      
2998    Xv 2E2638        52.7     0.      65.9 FIXEDHF     0.800  0       0.0  0                       
2999    Xw 1D2638        64.6     0.      80.7 FIXEDHF     0.800  0       0.0  0  4s9f      -4p7d      
3000    Xw 2E2638        39.8     0.      49.7 FIXEDHF     0.800  0       0.0  0                       
3001    Xx 1D2638        10.7     0.      13.4 FIXEDHF     0.800  0       0.0  0  4s9f      -4p8d      
3002    Xx 2E2638        31.3     0.      39.1 FIXEDHF     0.800  0       0.0  0                       
3003    Xy 1D2638       -20.5     0.     -25.6 FIXEDHF     0.800  0       0.0  0  4s9f      -4p9d      
3004    Xy 2E2638        25.4     0.      31.7 FIXEDHF     0.800  0       0.0  0                       
3005    Xz 3D1634        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0  4s9f      -d9 4s4p5s 
3006    Xz 2E1634       -12.6     0.     -15.7 FIXEDHF     0.800  0       0.0  0                       
3007    YZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s11f     
3008    YZ 3E2626         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0                       
3009    Ya 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s12f     
3010    Ya 3E2626         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
3011    Yb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s13f     
3012    Yb 3E2626         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0                       
3013    Yc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s14f     
3014    Yc 3E2626         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
3015    Yd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 4f   
3016    Yd 2D1626       -17.8     0.     -22.3 FIXEDHF     0.800  0       0.0  0                       
3017    Yd 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
3018    Ye 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 5f   
3019    Ye 2D1626       -15.8     0.     -19.8 FIXEDHF     0.800  0       0.0  0                       
3020    Ye 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
3021    Yf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 6f   
3022    Yf 2D1626       -13.2     0.     -16.5 FIXEDHF     0.800  0       0.0  0                       
3023    Yf 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
3024    Yg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 7f   
3025    Yg 2D1626       -11.0     0.     -13.7 FIXEDHF     0.800  0       0.0  0                       
3026    Yg 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
3027    Yh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 8f   
3028    Yh 2D1626        -9.2     0.     -11.5 FIXEDHF     0.800  0       0.0  0                       
3029    Yh 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3030    Yi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 9f   
3031    Yi 2D1626        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
3032    Yi 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3033    Yj 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 10f  
3034    Yj 2D1626        -6.8     0.      -8.5 FIXEDHF     0.800  0       0.0  0                       
3035    Yj 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3036    Yk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 11f  
3037    Yk 2D1626        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0                       
3038    Yk 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3039    Yl 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 12f  
3040    Yl 2D1626        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0                       
3041    Yl 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3042    Ym 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 13f  
3043    Ym 2D1626        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
3044    Ym 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3045    Yn 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 14f  
3046    Yn 2D1626        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
3047    Yn 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3048    Yt 1D2638       691.4     0.     864.3 FIXEDHF     0.800  0       0.0  0  4s10f     -4p4d      
3049    Yt 2E2638        92.8     0.     116.0 FIXEDHF     0.800  0       0.0  0                       
3050    Yu 1D2638       333.2     0.     416.5 FIXEDHF     0.800  0       0.0  0  4s10f     -4p5d      
3051    Yu 2E2638        64.1     0.      80.1 FIXEDHF     0.800  0       0.0  0                       
3052    Yv 1D2638       152.6     0.     190.8 FIXEDHF     0.800  0       0.0  0  4s10f     -4p6d      
3053    Yv 2E2638        46.0     0.      57.5 FIXEDHF     0.800  0       0.0  0                       
3054    Yw 1D2638        65.0     0.      81.2 FIXEDHF     0.800  0       0.0  0  4s10f     -4p7d      
3055    Yw 2E2638        34.6     0.      43.3 FIXEDHF     0.800  0       0.0  0                       
3056    Yx 1D2638        19.9     0.      24.9 FIXEDHF     0.800  0       0.0  0  4s10f     -4p8d      
3057    Yx 2E2638        27.2     0.      34.0 FIXEDHF     0.800  0       0.0  0                       
3058    Yy 1D2638        -5.0     0.      -6.3 FIXEDHF     0.800  0       0.0  0  4s10f     -4p9d      
3059    Yy 2E2638        22.1     0.      27.6 FIXEDHF     0.800  0       0.0  0                       
3060    Yz 3D1634        21.8     0.      27.2 FIXEDHF     0.800  0       0.0  0  4s10f     -d9 4s4p5s 
3061    Yz 2E1634       -11.0     0.     -13.8 FIXEDHF     0.800  0       0.0  0                       
3062    Za 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -4s12f     
3063    Za 3E2626         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0                       
3064    Zb 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -4s13f     
3065    Zb 3E2626         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
3066    Zc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -4s14f     
3067    Zc 3E2626         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
3068    Zd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 4f   
3069    Zd 2D1626       -15.4     0.     -19.2 FIXEDHF     0.800  0       0.0  0                       
3070    Zd 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
3071    Ze 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 5f   
3072    Ze 2D1626       -13.7     0.     -17.1 FIXEDHF     0.800  0       0.0  0                       
3073    Ze 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
3074    Zf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 6f   
3075    Zf 2D1626       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0                       
3076    Zf 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
3077    Zg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 7f   
3078    Zg 2D1626        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
3079    Zg 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
3080    Zh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 8f   
3081    Zh 2D1626        -7.9     0.      -9.9 FIXEDHF     0.800  0       0.0  0                       
3082    Zh 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3083    Zi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 9f   
3084    Zi 2D1626        -6.8     0.      -8.5 FIXEDHF     0.800  0       0.0  0                       
3085    Zi 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3086    Zj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 10f  
3087    Zj 2D1626        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0                       
3088    Zj 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3089    Zk 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 11f  
3090    Zk 2D1626        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0                       
3091    Zk 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3092    Zl 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 12f  
3093    Zl 2D1626        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0                       
3094    Zl 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3095    Zm 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 13f  
3096    Zm 2D1626        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
3097    Zm 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3098    Zn 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 14f  
3099    Zn 2D1626        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0                       
3100    Zn 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3101    Zt 1D2638       599.4     0.     749.3 FIXEDHF     0.800  0       0.0  0  4s11f     -4p4d      
3102    Zt 2E2638        81.7     0.     102.1 FIXEDHF     0.800  0       0.0  0                       
3103    Zu 1D2638       292.8     0.     366.0 FIXEDHF     0.800  0       0.0  0  4s11f     -4p5d      
3104    Zu 2E2638        56.4     0.      70.5 FIXEDHF     0.800  0       0.0  0                       
3105    Zv 1D2638       137.7     0.     172.1 FIXEDHF     0.800  0       0.0  0  4s11f     -4p6d      
3106    Zv 2E2638        40.5     0.      50.6 FIXEDHF     0.800  0       0.0  0                       
3107    Zw 1D2638        62.2     0.      77.8 FIXEDHF     0.800  0       0.0  0  4s11f     -4p7d      
3108    Zw 2E2638        30.6     0.      38.2 FIXEDHF     0.800  0       0.0  0                       
3109    Zx 1D2638        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0  4s11f     -4p8d      
3110    Zx 2E2638        24.0     0.      30.0 FIXEDHF     0.800  0       0.0  0                       
3111    Zy 1D2638         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  4s11f     -4p9d      
3112    Zy 2E2638        19.4     0.      24.3 FIXEDHF     0.800  0       0.0  0                       
3113    Zz 3D1634        19.0     0.      23.8 FIXEDHF     0.800  0       0.0  0  4s11f     -d9 4s4p5s 
3114    Zz 2E1634        -9.8     0.     -12.2 FIXEDHF     0.800  0       0.0  0                       
3115    ab 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -4s13f     
3116    ab 3E2626         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
3117    ac 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -4s14f     
3118    ac 3E2626         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
3119    ad 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 4f   
3120    ad 2D1626       -13.4     0.     -16.7 FIXEDHF     0.800  0       0.0  0                       
3121    ad 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
3122    ae 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 5f   
3123    ae 2D1626       -11.9     0.     -14.9 FIXEDHF     0.800  0       0.0  0                       
3124    ae 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
3125    af 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 6f   
3126    af 2D1626        -9.9     0.     -12.4 FIXEDHF     0.800  0       0.0  0                       
3127    af 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
3128    ag 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 7f   
3129    ag 2D1626        -8.2     0.     -10.3 FIXEDHF     0.800  0       0.0  0                       
3130    ag 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3131    ah 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 8f   
3132    ah 2D1626        -7.0     0.      -8.7 FIXEDHF     0.800  0       0.0  0                       
3133    ah 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3134    ai 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 9f   
3135    ai 2D1626        -5.9     0.      -7.4 FIXEDHF     0.800  0       0.0  0                       
3136    ai 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3137    aj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 10f  
3138    aj 2D1626        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0                       
3139    aj 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3140    ak 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 11f  
3141    ak 2D1626        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0                       
3142    ak 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3143    al 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 12f  
3144    al 2D1626        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
3145    al 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3146    am 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 13f  
3147    am 2D1626        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0                       
3148    am 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3149    an 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 14f  
3150    an 2D1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
3151    an 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
3152    at 1D2638       526.2     0.     657.8 FIXEDHF     0.800  0       0.0  0  4s12f     -4p4d      
3153    at 2E2638        72.6     0.      90.7 FIXEDHF     0.800  0       0.0  0                       
3154    au 1D2638       259.7     0.     324.6 FIXEDHF     0.800  0       0.0  0  4s12f     -4p5d      
3155    au 2E2638        50.1     0.      62.6 FIXEDHF     0.800  0       0.0  0                       
3156    av 1D2638       124.4     0.     155.5 FIXEDHF     0.800  0       0.0  0  4s12f     -4p6d      
3157    av 2E2638        36.0     0.      45.0 FIXEDHF     0.800  0       0.0  0                       
3158    aw 1D2638        58.4     0.      73.0 FIXEDHF     0.800  0       0.0  0  4s12f     -4p7d      
3159    aw 2E2638        27.1     0.      33.9 FIXEDHF     0.800  0       0.0  0                       
3160    ax 1D2638        24.5     0.      30.6 FIXEDHF     0.800  0       0.0  0  4s12f     -4p8d      
3161    ax 2E2638        21.3     0.      26.6 FIXEDHF     0.800  0       0.0  0                       
3162    ay 1D2638         6.0     0.       7.5 FIXEDHF     0.800  0       0.0  0  4s12f     -4p9d      
3163    ay 2E2638        17.3     0.      21.6 FIXEDHF     0.800  0       0.0  0                       
3164    az 3D1634        16.8     0.      21.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9 4s4p5s 
3165    az 2E1634        -8.7     0.     -10.9 FIXEDHF     0.800  0       0.0  0                       
3166    bc 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -4s14f     
3167    bc 3E2626         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
3168    bd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 4f   
3169    bd 2D1626       -11.8     0.     -14.8 FIXEDHF     0.800  0       0.0  0                       
3170    bd 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
3171    be 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 5f   
3172    be 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
3173    be 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
3174    bf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 6f   
3175    bf 2D1626        -8.8     0.     -11.0 FIXEDHF     0.800  0       0.0  0                       
3176    bf 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3177    bg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 7f   
3178    bg 2D1626        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0                       
3179    bg 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3180    bh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 8f   
3181    bh 2D1626        -6.2     0.      -7.7 FIXEDHF     0.800  0       0.0  0                       
3182    bh 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3183    bi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 9f   
3184    bi 2D1626        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
3185    bi 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3186    bj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 10f  
3187    bj 2D1626        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
3188    bj 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3189    bk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 11f  
3190    bk 2D1626        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
3191    bk 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3192    bl 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 12f  
3193    bl 2D1626        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0                       
3194    bl 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3195    bm 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 13f  
3196    bm 2D1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
3197    bm 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
3198    bn 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 14f  
3199    bn 2D1626        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
3200    bn 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
3201    bt 1D2638       466.9     0.     583.6 FIXEDHF     0.800  0       0.0  0  4s13f     -4p4d      
3202    bt 2E2638        65.0     0.      81.2 FIXEDHF     0.800  0       0.0  0                       
3203    bu 1D2638       232.2     0.     290.3 FIXEDHF     0.800  0       0.0  0  4s13f     -4p5d      
3204    bu 2E2638        44.9     0.      56.1 FIXEDHF     0.800  0       0.0  0                       
3205    bv 1D2638       112.8     0.     141.0 FIXEDHF     0.800  0       0.0  0  4s13f     -4p6d      
3206    bv 2E2638        32.2     0.      40.3 FIXEDHF     0.800  0       0.0  0                       
3207    bw 1D2638        54.4     0.      68.0 FIXEDHF     0.800  0       0.0  0  4s13f     -4p7d      
3208    bw 2E2638        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0                       
3209    bx 1D2638        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0  4s13f     -4p8d      
3210    bx 2E2638        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0                       
3211    by 1D2638         7.9     0.       9.9 FIXEDHF     0.800  0       0.0  0  4s13f     -4p9d      
3212    by 2E2638        15.5     0.      19.4 FIXEDHF     0.800  0       0.0  0                       
3213    bz 3D1634        15.0     0.      18.7 FIXEDHF     0.800  0       0.0  0  4s13f     -d9 4s4p5s 
3214    bz 2E1634        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
3215    cd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 4f   
3216    cd 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
3217    cd 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
3218    ce 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 5f   
3219    ce 2D1626        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
3220    ce 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3221    cf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 6f   
3222    cf 2D1626        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
3223    cf 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3224    cg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 7f   
3225    cg 2D1626        -6.6     0.      -8.2 FIXEDHF     0.800  0       0.0  0                       
3226    cg 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
3227    ch 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 8f   
3228    ch 2D1626        -5.5     0.      -6.9 FIXEDHF     0.800  0       0.0  0                       
3229    ch 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3230    ci 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 9f   
3231    ci 2D1626        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0                       
3232    ci 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3233    cj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 10f  
3234    cj 2D1626        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
3235    cj 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3236    ck 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 11f  
3237    ck 2D1626        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0                       
3238    ck 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
3239    cl 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 12f  
3240    cl 2D1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
3241    cl 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
3242    cm 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 13f  
3243    cm 2D1626        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
3244    cm 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
3245    cn 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 14f  
3246    cn 2D1626        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
3247    cn 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
3248    ct 1D2638       418.0     0.     522.5 FIXEDHF     0.800  0       0.0  0  4s14f     -4p4d      
3249    ct 2E2638        58.6     0.      73.3 FIXEDHF     0.800  0       0.0  0                       
3250    cu 1D2638       209.2     0.     261.5 FIXEDHF     0.800  0       0.0  0  4s14f     -4p5d      
3251    cu 2E2638        40.6     0.      50.7 FIXEDHF     0.800  0       0.0  0                       
3252    cv 1D2638       102.6     0.     128.3 FIXEDHF     0.800  0       0.0  0  4s14f     -4p6d      
3253    cv 2E2638        29.1     0.      36.4 FIXEDHF     0.800  0       0.0  0                       
3254    cw 1D2638        50.5     0.      63.1 FIXEDHF     0.800  0       0.0  0  4s14f     -4p7d      
3255    cw 2E2638        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0                       
3256    cx 1D2638        23.5     0.      29.4 FIXEDHF     0.800  0       0.0  0  4s14f     -4p8d      
3257    cx 2E2638        17.3     0.      21.6 FIXEDHF     0.800  0       0.0  0                       
3258    cy 1D2638         8.9     0.      11.1 FIXEDHF     0.800  0       0.0  0  4s14f     -4p9d      
3259    cy 2E2638        14.0     0.      17.5 FIXEDHF     0.800  0       0.0  0                       
3260    cz 3D1634        13.4     0.      16.8 FIXEDHF     0.800  0       0.0  0  4s14f     -d9 4s4p5s 
3261    cz 2E1634        -7.1     0.      -8.9 FIXEDHF     0.800  0       0.0  0                       
3262    de 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 5f   
3263    de 2D1616        34.4     0.      43.0 FIXEDHF     0.800  0       0.0  0                       
3264    de 4D1616         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
3265    de 1E1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3266    de 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3267    de 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3268    df 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 6f   
3269    df 2D1616        24.4     0.      30.5 FIXEDHF     0.800  0       0.0  0                       
3270    df 4D1616         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
3271    df 1E1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3272    df 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3273    df 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3274    dg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 7f   
3275    dg 2D1616        18.6     0.      23.3 FIXEDHF     0.800  0       0.0  0                       
3276    dg 4D1616         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
3277    dg 1E1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3278    dg 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3279    dg 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3280    dh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 8f   
3281    dh 2D1616        15.0     0.      18.7 FIXEDHF     0.800  0       0.0  0                       
3282    dh 4D1616         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
3283    dh 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3284    dh 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3285    dh 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3286    di 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 9f   
3287    di 2D1616        12.3     0.      15.4 FIXEDHF     0.800  0       0.0  0                       
3288    di 4D1616         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
3289    di 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3290    di 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3291    di 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3292    dj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 10f  
3293    dj 2D1616        10.5     0.      13.1 FIXEDHF     0.800  0       0.0  0                       
3294    dj 4D1616         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
3295    dj 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3296    dj 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3297    dj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3298    dk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 11f  
3299    dk 2D1616         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0                       
3300    dk 4D1616         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
3301    dk 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3302    dk 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3303    dk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3304    dl 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 12f  
3305    dl 2D1616         7.8     0.       9.8 FIXEDHF     0.800  0       0.0  0                       
3306    dl 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3307    dl 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3308    dl 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3309    dl 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3310    dm 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 13f  
3311    dm 2D1616         7.0     0.       8.7 FIXEDHF     0.800  0       0.0  0                       
3312    dm 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3313    dm 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3314    dm 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3315    dm 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3316    dn 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 14f  
3317    dn 2D1616         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0                       
3318    dn 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3319    dn 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3320    dn 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3321    dn 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3322    ef 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 6f   
3323    ef 2D1616        21.5     0.      26.9 FIXEDHF     0.800  0       0.0  0                       
3324    ef 4D1616         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
3325    ef 1E1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3326    ef 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3327    ef 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3328    eg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 7f   
3329    eg 2D1616        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0                       
3330    eg 4D1616         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
3331    eg 1E1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3332    eg 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3333    eg 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3334    eh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 8f   
3335    eh 2D1616        13.3     0.      16.6 FIXEDHF     0.800  0       0.0  0                       
3336    eh 4D1616         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
3337    eh 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3338    eh 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3339    eh 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3340    ei 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 9f   
3341    ei 2D1616        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
3342    ei 4D1616         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
3343    ei 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3344    ei 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3345    ei 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3346    ej 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 10f  
3347    ej 2D1616         9.4     0.      11.7 FIXEDHF     0.800  0       0.0  0                       
3348    ej 4D1616         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
3349    ej 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3350    ej 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3351    ej 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3352    ek 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 11f  
3353    ek 2D1616         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
3354    ek 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3355    ek 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3356    ek 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3357    ek 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3358    el 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 12f  
3359    el 2D1616         7.0     0.       8.8 FIXEDHF     0.800  0       0.0  0                       
3360    el 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3361    el 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3362    el 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3363    el 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3364    em 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 13f  
3365    em 2D1616         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0                       
3366    em 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3367    em 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3368    em 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3369    em 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3370    en 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 14f  
3371    en 2D1616         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0                       
3372    en 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3373    en 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3374    en 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3375    en 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3376    fg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 7f   
3377    fg 2D1616        13.7     0.      17.1 FIXEDHF     0.800  0       0.0  0                       
3378    fg 4D1616         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
3379    fg 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3380    fg 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3381    fg 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3382    fh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 8f   
3383    fh 2D1616        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
3384    fh 4D1616         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
3385    fh 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3386    fh 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3387    fh 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3388    fi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 9f   
3389    fi 2D1616         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
3390    fi 4D1616         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
3391    fi 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3392    fi 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3393    fi 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3394    fj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 10f  
3395    fj 2D1616         7.8     0.       9.7 FIXEDHF     0.800  0       0.0  0                       
3396    fj 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3397    fj 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3398    fj 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3399    fj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3400    fk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 11f  
3401    fk 2D1616         6.7     0.       8.4 FIXEDHF     0.800  0       0.0  0                       
3402    fk 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3403    fk 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3404    fk 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3405    fk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3406    fl 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 12f  
3407    fl 2D1616         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0                       
3408    fl 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3409    fl 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3410    fl 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3411    fl 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3412    fm 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 13f  
3413    fm 2D1616         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0                       
3414    fm 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3415    fm 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3416    fm 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3417    fm 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3418    fn 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 14f  
3419    fn 2D1616         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0                       
3420    fn 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3421    fn 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3422    fn 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3423    fn 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3424    gh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 8f   
3425    gh 2D1616         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
3426    gh 4D1616         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
3427    gh 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3428    gh 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3429    gh 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3430    gi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 9f   
3431    gi 2D1616         7.6     0.       9.5 FIXEDHF     0.800  0       0.0  0                       
3432    gi 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3433    gi 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3434    gi 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3435    gi 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3436    gj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 10f  
3437    gj 2D1616         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0                       
3438    gj 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3439    gj 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3440    gj 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3441    gj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3442    gk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 11f  
3443    gk 2D1616         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
3444    gk 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3445    gk 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3446    gk 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3447    gk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3448    gl 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 12f  
3449    gl 2D1616         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0                       
3450    gl 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3451    gl 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3452    gl 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3453    gl 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3454    gm 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 13f  
3455    gm 2D1616         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
3456    gm 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3457    gm 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3458    gm 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3459    gm 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3460    gn 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 14f  
3461    gn 2D1616         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0                       
3462    gn 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3463    gn 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3464    gn 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3465    gn 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3466    hi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 9f   
3467    hi 2D1616         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
3468    hi 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3469    hi 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3470    hi 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3471    hi 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3472    hj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 10f  
3473    hj 2D1616         5.4     0.       6.8 FIXEDHF     0.800  0       0.0  0                       
3474    hj 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3475    hj 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3476    hj 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3477    hj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3478    hk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 11f  
3479    hk 2D1616         4.7     0.       5.9 FIXEDHF     0.800  0       0.0  0                       
3480    hk 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3481    hk 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3482    hk 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3483    hk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3484    hl 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 12f  
3485    hl 2D1616         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0                       
3486    hl 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3487    hl 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3488    hl 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3489    hl 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3490    hm 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 13f  
3491    hm 2D1616         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0                       
3492    hm 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3493    hm 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3494    hm 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3495    hm 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3496    hn 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 14f  
3497    hn 2D1616         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0                       
3498    hn 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3499    hn 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3500    hn 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3501    hn 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3502    ij 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 10f  
3503    ij 2D1616         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0                       
3504    ij 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3505    ij 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3506    ij 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3507    ij 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3508    ik 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 11f  
3509    ik 2D1616         4.0     0.       5.0 FIXEDHF     0.800  0       0.0  0                       
3510    ik 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3511    ik 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3512    ik 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3513    ik 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3514    il 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 12f  
3515    il 2D1616         3.5     0.       4.4 FIXEDHF     0.800  0       0.0  0                       
3516    il 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3517    il 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3518    il 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3519    il 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3520    im 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 13f  
3521    im 2D1616         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0                       
3522    im 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3523    im 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3524    im 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3525    im 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3526    in 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 14f  
3527    in 2D1616         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0                       
3528    in 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3529    in 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3530    in 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3531    in 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3532    jk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 11f  
3533    jk 2D1616         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
3534    jk 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3535    jk 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3536    jk 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3537    jk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3538    jl 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 12f  
3539    jl 2D1616         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
3540    jl 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3541    jl 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3542    jl 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3543    jl 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3544    jm 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 13f  
3545    jm 2D1616         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0                       
3546    jm 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3547    jm 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3548    jm 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3549    jm 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3550    jn 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 14f  
3551    jn 2D1616         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
3552    jn 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3553    jn 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3554    jn 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3555    jn 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3556    kl 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 12f  
3557    kl 2D1616         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
3558    kl 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3559    kl 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3560    kl 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3561    kl 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3562    km 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 13f  
3563    km 2D1616         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
3564    km 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3565    km 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3566    km 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3567    km 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3568    kn 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 14f  
3569    kn 2D1616         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
3570    kn 4D1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3571    kn 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3572    kn 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3573    kn 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3574    lm 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -d9s2 13f  
3575    lm 2D1616         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
3576    lm 4D1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3577    lm 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3578    lm 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3579    lm 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3580    ln 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -d9s2 14f  
3581    ln 2D1616         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
3582    ln 4D1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3583    ln 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3584    ln 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3585    ln 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3586    mn 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -d9s2 14f  
3587    mn 2D1616         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
3588    mn 4D1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3589    mn 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3590    mn 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3591    mn 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3592    op 0D3437       204.3     0.     255.4 FIXEDHF     0.800  0       0.0  0  4p5s      -4p6s      
3593    op 1E3437      1213.9     0.    1517.4 FIXEDHF     0.800  0       0.0  0                       
3594    oq 0D3437       129.6     0.     162.0 FIXEDHF     0.800  0       0.0  0  4p5s      -4p7s      
3595    oq 1E3437       766.5     0.     958.1 FIXEDHF     0.800  0       0.0  0                       
3596    or 0D3437        91.9     0.     114.9 FIXEDHF     0.800  0       0.0  0  4p5s      -4p8s      
3597    or 1E3437       542.9     0.     678.6 FIXEDHF     0.800  0       0.0  0                       
3598    os 0D3437        69.7     0.      87.1 FIXEDHF     0.800  0       0.0  0  4p5s      -4p9s      
3599    os 1E3437       411.2     0.     514.0 FIXEDHF     0.800  0       0.0  0                       
3600    ot 2D3438     -4594.8     0.   -5743.5 FIXEDHF     0.800  0       0.0  0  4p5s      -4p4d      
3601    ot 1E3438     -1513.6     0.   -1892.0 FIXEDHF     0.800  0       0.0  0                       
3602    ou 2D3438     -2206.0     0.   -2757.5 FIXEDHF     0.800  0       0.0  0  4p5s      -4p5d      
3603    ou 1E3438      -842.8     0.   -1053.5 FIXEDHF     0.800  0       0.0  0                       
3604    ov 2D3438     -1294.9     0.   -1618.6 FIXEDHF     0.800  0       0.0  0  4p5s      -4p6d      
3605    ov 1E3438      -538.8     0.    -673.5 FIXEDHF     0.800  0       0.0  0                       
3606    ow 2D3438      -859.6     0.   -1074.5 FIXEDHF     0.800  0       0.0  0  4p5s      -4p7d      
3607    ow 1E3438      -379.2     0.    -474.0 FIXEDHF     0.800  0       0.0  0                       
3608    ox 2D3438      -618.6     0.    -773.2 FIXEDHF     0.800  0       0.0  0  4p5s      -4p8d      
3609    ox 1E3438      -284.6     0.    -355.7 FIXEDHF     0.800  0       0.0  0                       
3610    oy 2D3438      -470.5     0.    -588.1 FIXEDHF     0.800  0       0.0  0  4p5s      -4p9d      
3611    oy 1E3438      -223.4     0.    -279.3 FIXEDHF     0.800  0       0.0  0                       
3612    oz 2D1112       930.2     0.    1162.8 FIXEDHF     0.800  0       0.0  0  4p5s      -d9 4s4p5s 
3613    oz 2D1323     -9906.0     0.  -12382.5 FIXEDHF     0.800  0       0.0  0                       
3614    oz 1E1323     -9822.9     0.  -12278.6 FIXEDHF     0.800  0       0.0  0                       
3615    pq 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6s      -4p7s      
3616    pq 1E3737       401.8     0.     502.3 FIXEDHF     0.800  0       0.0  0                       
3617    pr 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6s      -4p8s      
3618    pr 1E3737       286.8     0.     358.5 FIXEDHF     0.800  0       0.0  0                       
3619    ps 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6s      -4p9s      
3620    ps 1E3737       218.2     0.     272.7 FIXEDHF     0.800  0       0.0  0                       
3621    pt 2D3738     -1441.7     0.   -1802.1 FIXEDHF     0.800  0       0.0  0  4p6s      -4p4d      
3622    pt 1E3738      -761.8     0.    -952.2 FIXEDHF     0.800  0       0.0  0                       
3623    pu 2D3738     -1371.7     0.   -1714.6 FIXEDHF     0.800  0       0.0  0  4p6s      -4p5d      
3624    pu 1E3738      -452.3     0.    -565.4 FIXEDHF     0.800  0       0.0  0                       
3625    pv 2D3738      -897.8     0.   -1122.3 FIXEDHF     0.800  0       0.0  0  4p6s      -4p6d      
3626    pv 1E3738      -298.2     0.    -372.8 FIXEDHF     0.800  0       0.0  0                       
3627    pw 2D3738      -632.6     0.    -790.8 FIXEDHF     0.800  0       0.0  0  4p6s      -4p7d      
3628    pw 1E3738      -213.8     0.    -267.3 FIXEDHF     0.800  0       0.0  0                       
3629    px 2D3738      -473.8     0.    -592.3 FIXEDHF     0.800  0       0.0  0  4p6s      -4p8d      
3630    px 1E3738      -162.4     0.    -203.0 FIXEDHF     0.800  0       0.0  0                       
3631    py 2D3738      -371.1     0.    -463.9 FIXEDHF     0.800  0       0.0  0  4p6s      -4p9d      
3632    py 1E3738      -128.6     0.    -160.8 FIXEDHF     0.800  0       0.0  0                       
3633    qr 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p7s      -4p8s      
3634    qr 1E3737       185.4     0.     231.8 FIXEDHF     0.800  0       0.0  0                       
3635    qs 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p7s      -4p9s      
3636    qs 1E3737       141.2     0.     176.5 FIXEDHF     0.800  0       0.0  0                       
3637    qt 2D3738      -851.2     0.   -1064.0 FIXEDHF     0.800  0       0.0  0  4p7s      -4p4d      
3638    qt 1E3738      -491.2     0.    -614.0 FIXEDHF     0.800  0       0.0  0                       
3639    qu 2D3738      -693.2     0.    -866.5 FIXEDHF     0.800  0       0.0  0  4p7s      -4p5d      
3640    qu 1E3738      -297.1     0.    -371.4 FIXEDHF     0.800  0       0.0  0                       
3641    qv 2D3738      -588.7     0.    -735.9 FIXEDHF     0.800  0       0.0  0  4p7s      -4p6d      
3642    qv 1E3738      -197.7     0.    -247.1 FIXEDHF     0.800  0       0.0  0                       
3643    qw 2D3738      -433.0     0.    -541.3 FIXEDHF     0.800  0       0.0  0  4p7s      -4p7d      
3644    qw 1E3738      -142.4     0.    -178.0 FIXEDHF     0.800  0       0.0  0                       
3645    qx 2D3738      -331.4     0.    -414.2 FIXEDHF     0.800  0       0.0  0  4p7s      -4p8d      
3646    qx 1E3738      -108.6     0.    -135.7 FIXEDHF     0.800  0       0.0  0                       
3647    qy 2D3738      -263.0     0.    -328.8 FIXEDHF     0.800  0       0.0  0  4p7s      -4p9d      
3648    qy 1E3738       -86.2     0.    -107.7 FIXEDHF     0.800  0       0.0  0                       
3649    rs 0D3737         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p8s      -4p9s      
3650    rs 1E3737       101.1     0.     126.4 FIXEDHF     0.800  0       0.0  0                       
3651    rt 2D3738      -584.2     0.    -730.3 FIXEDHF     0.800  0       0.0  0  4p8s      -4p4d      
3652    rt 1E3738      -351.8     0.    -439.8 FIXEDHF     0.800  0       0.0  0                       
3653    ru 2D3738      -471.0     0.    -588.8 FIXEDHF     0.800  0       0.0  0  4p8s      -4p5d      
3654    ru 1E3738      -214.6     0.    -268.2 FIXEDHF     0.800  0       0.0  0                       
3655    rv 2D3738      -366.8     0.    -458.5 FIXEDHF     0.800  0       0.0  0  4p8s      -4p6d      
3656    rv 1E3738      -143.4     0.    -179.2 FIXEDHF     0.800  0       0.0  0                       
3657    rw 2D3738      -306.2     0.    -382.8 FIXEDHF     0.800  0       0.0  0  4p8s      -4p7d      
3658    rw 1E3738      -103.5     0.    -129.4 FIXEDHF     0.800  0       0.0  0                       
3659    rx 2D3738      -239.5     0.    -299.4 FIXEDHF     0.800  0       0.0  0  4p8s      -4p8d      
3660    rx 1E3738       -79.0     0.     -98.8 FIXEDHF     0.800  0       0.0  0                       
3661    ry 2D3738      -192.3     0.    -240.4 FIXEDHF     0.800  0       0.0  0  4p8s      -4p9d      
3662    ry 1E3738       -62.8     0.     -78.5 FIXEDHF     0.800  0       0.0  0                       
3663    st 2D3738      -434.6     0.    -543.3 FIXEDHF     0.800  0       0.0  0  4p9s      -4p4d      
3664    st 1E3738      -268.2     0.    -335.3 FIXEDHF     0.800  0       0.0  0                       
3665    su 2D3738      -349.4     0.    -436.8 FIXEDHF     0.800  0       0.0  0  4p9s      -4p5d      
3666    su 1E3738      -164.4     0.    -205.5 FIXEDHF     0.800  0       0.0  0                       
3667    sv 2D3738      -270.1     0.    -337.6 FIXEDHF     0.800  0       0.0  0  4p9s      -4p6d      
3668    sv 1E3738      -110.1     0.    -137.6 FIXEDHF     0.800  0       0.0  0                       
3669    sw 2D3738      -213.9     0.    -267.4 FIXEDHF     0.800  0       0.0  0  4p9s      -4p7d      
3670    sw 1E3738       -79.6     0.     -99.5 FIXEDHF     0.800  0       0.0  0                       
3671    sx 2D3738      -179.6     0.    -224.5 FIXEDHF     0.800  0       0.0  0  4p9s      -4p8d      
3672    sx 1E3738       -60.8     0.     -76.0 FIXEDHF     0.800  0       0.0  0                       
3673    sy 2D3738      -146.1     0.    -182.6 FIXEDHF     0.800  0       0.0  0  4p9s      -4p9d      
3674    sy 1E3738       -48.3     0.     -60.4 FIXEDHF     0.800  0       0.0  0                       
3675    tu 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p4d      -4p5d      
3676    tu 2D3838      2716.5     0.    3395.6 FIXEDHF     0.800  0       0.0  0                       
3677    tu 1E3838      2477.4     0.    3096.8 FIXEDHF     0.800  0       0.0  0                       
3678    tu 3E3838      1485.0     0.    1856.2 FIXEDHF     0.800  0       0.0  0                       
3679    tv 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p4d      -4p6d      
3680    tv 2D3838      1733.3     0.    2166.6 FIXEDHF     0.800  0       0.0  0                       
3681    tv 1E3838      1745.4     0.    2181.7 FIXEDHF     0.800  0       0.0  0                       
3682    tv 3E3838      1050.1     0.    1312.6 FIXEDHF     0.800  0       0.0  0                       
3683    tw 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p4d      -4p7d      
3684    tw 2D3838      1224.8     0.    1531.0 FIXEDHF     0.800  0       0.0  0                       
3685    tw 1E3838      1302.2     0.    1627.8 FIXEDHF     0.800  0       0.0  0                       
3686    tw 3E3838       784.9     0.     981.1 FIXEDHF     0.800  0       0.0  0                       
3687    tx 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p4d      -4p8d      
3688    tx 2D3838       923.2     0.    1154.0 FIXEDHF     0.800  0       0.0  0                       
3689    tx 1E3838      1015.8     0.    1269.8 FIXEDHF     0.800  0       0.0  0                       
3690    tx 3E3838       613.0     0.     766.2 FIXEDHF     0.800  0       0.0  0                       
3691    ty 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p4d      -4p9d      
3692    ty 2D3838       727.5     0.     909.4 FIXEDHF     0.800  0       0.0  0                       
3693    ty 1E3838       819.7     0.    1024.6 FIXEDHF     0.800  0       0.0  0                       
3694    ty 3E3838       494.9     0.     618.6 FIXEDHF     0.800  0       0.0  0                       
3695    tz 2D1824       658.5     0.     823.1 FIXEDHF     0.800  0       0.0  0  4p4d      -d9 4s4p5s 
3696    tz 2E1824      -226.9     0.    -283.6 FIXEDHF     0.800  0       0.0  0                       
3697    uv 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5d      -4p6d      
3698    uv 2D3838      1321.2     0.    1651.5 FIXEDHF     0.800  0       0.0  0                       
3699    uv 1E3838      1192.2     0.    1490.2 FIXEDHF     0.800  0       0.0  0                       
3700    uv 3E3838       725.8     0.     907.2 FIXEDHF     0.800  0       0.0  0                       
3701    uw 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5d      -4p7d      
3702    uw 2D3838       945.4     0.    1181.8 FIXEDHF     0.800  0       0.0  0                       
3703    uw 1E3838       893.0     0.    1116.2 FIXEDHF     0.800  0       0.0  0                       
3704    uw 3E3838       545.0     0.     681.2 FIXEDHF     0.800  0       0.0  0                       
3705    ux 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5d      -4p8d      
3706    ux 2D3838       718.9     0.     898.6 FIXEDHF     0.800  0       0.0  0                       
3707    ux 1E3838       698.2     0.     872.8 FIXEDHF     0.800  0       0.0  0                       
3708    ux 3E3838       426.8     0.     533.5 FIXEDHF     0.800  0       0.0  0                       
3709    uy 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p5d      -4p9d      
3710    uy 2D3838       570.2     0.     712.7 FIXEDHF     0.800  0       0.0  0                       
3711    uy 1E3838       564.3     0.     705.4 FIXEDHF     0.800  0       0.0  0                       
3712    uy 3E3838       345.2     0.     431.5 FIXEDHF     0.800  0       0.0  0                       
3713    uz 2D1824       334.2     0.     417.7 FIXEDHF     0.800  0       0.0  0  4p5d      -d9 4s4p5s 
3714    uz 2E1824      -178.9     0.    -223.6 FIXEDHF     0.800  0       0.0  0                       
3715    vw 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6d      -4p7d      
3716    vw 2D3838       705.5     0.     881.9 FIXEDHF     0.800  0       0.0  0                       
3717    vw 1E3838       636.6     0.     795.8 FIXEDHF     0.800  0       0.0  0                       
3718    vw 3E3838       390.7     0.     488.4 FIXEDHF     0.800  0       0.0  0                       
3719    vx 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6d      -4p8d      
3720    vx 2D3838       539.0     0.     673.8 FIXEDHF     0.800  0       0.0  0                       
3721    vx 1E3838       498.3     0.     622.9 FIXEDHF     0.800  0       0.0  0                       
3722    vx 3E3838       306.3     0.     382.9 FIXEDHF     0.800  0       0.0  0                       
3723    vy 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p6d      -4p9d      
3724    vy 2D3838       429.1     0.     536.4 FIXEDHF     0.800  0       0.0  0                       
3725    vy 1E3838       403.0     0.     503.8 FIXEDHF     0.800  0       0.0  0                       
3726    vy 3E3838       248.0     0.     310.0 FIXEDHF     0.800  0       0.0  0                       
3727    vz 2D1824       200.8     0.     251.0 FIXEDHF     0.800  0       0.0  0  4p6d      -d9 4s4p5s 
3728    vz 2E1824      -136.9     0.    -171.1 FIXEDHF     0.800  0       0.0  0                       
3729    wx 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p7d      -4p8d      
3730    wx 2D3838       414.5     0.     518.1 FIXEDHF     0.800  0       0.0  0                       
3731    wx 1E3838       374.4     0.     468.0 FIXEDHF     0.800  0       0.0  0                       
3732    wx 3E3838       230.9     0.     288.6 FIXEDHF     0.800  0       0.0  0                       
3733    wy 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p7d      -4p9d      
3734    wy 2D3838       330.6     0.     413.3 FIXEDHF     0.800  0       0.0  0                       
3735    wy 1E3838       302.9     0.     378.6 FIXEDHF     0.800  0       0.0  0                       
3736    wy 3E3838       187.0     0.     233.8 FIXEDHF     0.800  0       0.0  0                       
3737    wz 2D1824       135.1     0.     168.9 FIXEDHF     0.800  0       0.0  0  4p7d      -d9 4s4p5s 
3738    wz 2E1824      -107.0     0.    -133.8 FIXEDHF     0.800  0       0.0  0                       
3739    xy 0D3838         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4p8d      -4p9d      
3740    xy 2D3838       262.6     0.     328.2 FIXEDHF     0.800  0       0.0  0                       
3741    xy 1E3838       237.3     0.     296.6 FIXEDHF     0.800  0       0.0  0                       
3742    xy 3E3838       146.9     0.     183.6 FIXEDHF     0.800  0       0.0  0                       
3743    xz 2D1824        98.1     0.     122.6 FIXEDHF     0.800  0       0.0  0  4p8d      -d9 4s4p5s 
3744    xz 2E1824       -85.9     0.    -107.4 FIXEDHF     0.800  0       0.0  0                       
3745    yz 2D1824        75.0     0.      93.8 FIXEDHF     0.800  0       0.0  0  4p9d      -d9 4s4p5s 
3746    yz 2E1824       -70.7     0.     -88.4 FIXEDHF     0.800  0       0.0  0                       
