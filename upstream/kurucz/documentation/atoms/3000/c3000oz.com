$SET def 3000
$SET VERIFY=NOIMAGE
$ASSIGN B3000OZ.PUN FOR007
$ASSIGN H3000OZ.HAM FOR001
$ASSIGN POOLQ:C3000OZ.EIG FOR003
$ASSIGN EAV3000OZ.DAT FOR066
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
    1    0    0    0        .3       1.5
    1  1.         50  150  150  130  100   70   50   40   20   10   10    0
  30.00
4s4p      4s5p      4s6p      4s7p      4s8p      4s9p      4s10p     4s11p
4s12p     4s13p     4s14p     4s15p     d9s2 4p   d9s2 5p   d9s2 6p   d9s2 7p   
d9s2 8p   d9s2 9p   d9s2 10p  d9s2 11p  d9s2 12p  d9s2 13p  d9s2 14p  d9s2 15p  
4s4f      4s5f      4s6f      4s7f      4s8f      4s9f      4s10f     4s11f     
4s12f     4s13f     4s14f     d9s2 4f   d9s2 5f   d9s2 6f   d9s2 7f   d9s2 8f   
d9s2 9f   d9s2 10f  d9s2 11f  d9s2 12f  d9s2 13f  d9s2 14f  4s6h      4s7h
4s8h      4s9h      d9s2 6h   d9s2 7h   d9s2 8h   d9s2 9h   4s8k      4s9k
d9s2 8k   d9s2 9k   4p5s      5s5p      d9 4s4p5s
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
1  0.                            3d9.4s4p(3D)5s 3P2       4s4p5s 3P2
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
   1.     123470.                3d9.4s2.5p 1P            s2.5p 1P
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
   1.     136666.6               3d9.4s2.10p 1P           s210p 1P
   1.     136763.7               3d9.4s2.5f 1P            s2.5f 1P
1  1.                            3d9.4s2.8f 3P            s2.8f 3P
   1.     136771.1               3d9.4s2.8f 3D            s2.8f 3F
   1.     137059.6               3d9.4s2.11p 1P           s211p 1P
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
1  1.                            3d9.4s4p(3D)5s 5P        4s4p5s 5P
1  1.                            3d9.4s4p(3D)5s 5F        4s4p5s 5F
1  1.                            3d9.4s4p(3D)5s 3P2       4s4p5s 3P2
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
1  2.                            4d5s 3P                  4d5s 3P
1  2.                            3d9.4s2.5p 3P            s2.5p 3P
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
1  2.                            3d9.4s2.6h 3F            s2.6h 3F
1  2.                            3d9.4s2.9p 3P            s2.9p 3P
1  2.                            3d9.4s2.9p 1D            s2.9p 1D
1  2.                            3d9.4s2.7f 3D            s2.7f 3D
1  2.                            3d9.4s2.7f 1D            s2.7f 1D
1  2.                            3d9.4s2.7h 3F            s2.7h 3F
1  2.                            3d9.4s2.7p 3F            s2.7p 3F
1  2.                            3d9.4s2.7p 3D            s2.7p 3D
1  2.                            3d9.4s2.10p 3P           s2.10p 3P
1  2.                            3d9.4s2.10p 1D           s2.10p 1D
1  2.                            3d9.4s2.5f 3P            s2.5f 3P
1  2.                            3d9.4s2.5f 3F            s2.5f 3F
1  2.                            3d9.4s2.8f 3D            s2.8f 3D
1  2.                            3d9.4s2.8f 1D            s2.8f 1D
1  2.                            3d9.4s2.8h 3F            s2.8h 3F
1  2.                            3d9.4s2.11p 3P           s2.11p 3P
1  2.                            3d9.4s2.11p 1D           s2.11p 1D
1  2.                            3d9.4s2.9f 3D            s2.9f 3D
1  2.                            3d9.4s2.9f 1D            s2.9f 1D
1  2.                            3d9.4s2.9h 3F            s2.9h 3F
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
1  2.                            3d9.4s4p(3D)5s 5F        4s4p5s 5F
1  2.                            3d9.4s4p(3D)5s 3P2       4s4p5s 3P2
1  2.                            3d9.4s4p(1D)5s 3F        4s4p5s 3F
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
1  3.                            3d9.4s2.5p 1F            s2.5p 1F
1  3.                            3d9.4s2.5p 3D            s2.5p 3D
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
1  3.                            3d9.4s2.6h 3F            s2.6h 3F
1  3.                            3d9.4s2.6h 3G            s2.6h 3G
1  3.                            3d9.4s2.9p 1F            s2.9p 1F
1  3.                            3d9.4s2.9p 3D            s2.9p 3D
1  3.                            3d9.4s2.7f 3D            s2.7f 3D
1  3.                            3d9.4s2.7f 1F            s2.7f 1F
1  3.                            3d9.4s2.7h 3F            s2.7h 3F
1  3.                            3d9.4s2.7h 3G            s2.7h 3G
1  3.                            3d9.4s2.7p 3F            s2.7p 3F
1  3.                            3d9.4s2.10p 1F           s2.10p 1F
1  3.                            3d9.4s2.10p 3D           s2.10p 3D
1  3.                            3d9.4s2.5f 3F            s2.5f 3F
1  3.                            3d9.4s2.5f 3G            s2.5f 3G
1  3.                            3d9.4s2.8f 3D            s2.8f 3D
1  3.                            3d9.4s2.8f 1F            s2.8f 1F
1  3.                            3d9.4s2.8h 3F            s2.8h 3F
1  3.                            3d9.4s2.8h 3G            s2.8h 3G
1  3.                            3d9.4s2.11p 1F           s2.11p 1F
1  3.                            3d9.4s2.11p 3D           s2.11p 3D
1  3.                            3d9.4s2.9f 3D            s2.9f 3D
1  3.                            3d9.4s2.9f 1F            s2.9f 1F
1  3.                            3d9.4s2.9h 3F            s2.9h 3F
1  3.                            3d9.4s2.9h 3G            s2.9h 3G
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
1  3.                            3d9.4s2.6h 1F            s2.6h 1F
1  3.                            3d9.4s2.9p 3F            s2.9p 3F
1  3.                            3d9.4s2.7f 3F            s2.7f 3F
1  3.                            3d9.4s2.7f 3G            s2.7f 3G
1  3.                            3d9.4s2.7h 1F            s2.7h 1F
1  3.                            3d9.4s2.10p 3F           s2.10p 3F
1  3.                            3d9.4s2.8f 3F            s2.8f 3F
1  3.                            3d9.4s2.8f 3G            s2.8f 3G
1  3.                            3d9.4s2.8h 1F            s2.8h 1F
1  3.                            3d9.4s2.11p 3F           s2.11p 3F
1  3.                            3d9.4s2.9f 3F            s2.9f 3F
1  3.                            3d9.4s2.9f 3G            s2.9f 3G
1  3.                            3d9.4s2.9h 1F            s2.9h 1F
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
   4.      72731.2               4s6h 3H                  4s6h 3H
   4.      73499.5               4s7f 3F                  4s7f 3F
   4.      73534.9               4s7h 3H                  4s7h 3H
   4.      74053.7               4s8h 3H                  4s8h 3H
1  4.                            4s8f 3F                  4s8f 3F
   4.      74409.3               4s9h 3H                  4s9h 3H
1  4.                            4s9f 3F                  4s9f 3F
1  4.                            4s10f 3F                 4s10f 3F
1  4.                            4s11f 3F                 4s11f 3F
1  4.                            4s12f 3F                 4s12f 3F
1  4.                            4s13f 3F                 4s13f 3F
1  4.                            4s14f 3F                 4s14f 3F
1  4.                            3d9.4s2.4p 3F            s2.4p 3F
1  4.                            3d9.4s2.5p 3F            s2.5p 3F
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
1  4.                            3d9.4s2.6h 3G            s2.6h 3G
1  4.                            3d9.4s2.6h 3H            s2.6h 3H
1  4.                            3d9.4s2.9p 3F            s2.9p 3F
1  4.                            3d9.4s2.7f 3F            s2.7f 3F
1  4.                            3d9.4s2.7f 1G            s2.7f 1G
1  4.                            3d9.4s2.7h 3G            s2.7h 3G
1  4.                            3d9.4s2.7h 3H            s2.7h 3H
1  4.                            3d9.4s2.10p 3F           s2.10p 3F
1  4.                            3d9.4s2.5f 3H            s2.5f 3H
1  4.                            3d9.4s2.5f 3G            s2.5f 3G
1  4.                            3d9.4s2.8f 3F            s2.8f 3F
1  4.                            3d9.4s2.8f 1G            s2.8f 1G
1  4.                            3d9.4s2.8h 3G            s2.8h 3G
1  4.                            3d9.4s2.8h 3H            s2.8h 3H
1  4.                            3d9.4s2.8k 3H            s2.8k 3H
1  4.                            3d9.4s2.11p 3F           s2.11p 3F
1  4.                            3d9.4s2.9f 3F            s2.9f 3F
1  4.                            3d9.4s2.9f 1G            s2.9f 1G
1  4.                            3d9.4s2.9h 3G            s2.9h 3G
1  4.                            3d9.4s2.8k 3H            s2.9k 3H
1  4.                            3d9.4s2.9h 3H            s2.9h 3H
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
1  4.                            3d9.4s2.6h 3F            s2.6h 3F
1  4.                            3d9.4s2.6h 3H            s2.6h 3H
1  4.                            3d9.4s2.7f 3H            s2.7f 3H
1  4.                            3d9.4s2.7f 3G            s2.7f 3G
1  4.                            3d9.4s2.7h 3F            s2.7h 3F
1  4.                            3d9.4s2.7h 3H            s2.7h 3H
1  4.                            3d9.4s2.8f 3H            s2.8f 3H
1  4.                            3d9.4s2.8f 3G            s2.8f 3G
1  4.                            3d9.4s2.8h 3F            s2.8h 3F
1  4.                            3d9.4s2.8h 3H            s2.8h 3H
1  4.                            3d9.4s2.9f 3H            s2.9f 3H
1  4.                            3d9.4s2.9f 3G            s2.9f 3G
1  4.                            3d9.4s2.9h 3F            s2.9h 3F
1  4.                            3d9.4s2.9h 3H            s2.9h 3H
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
1  5.                            4s6h 1H                  4s6h 1H
   5.      72731.2               4s6h 3H                  4s6h 3H
1  5.                            4s7h 1H                  4s7h 1H
   5.      73534.9               4s7h 3H                  4s7h 3H
1  5.                            4s8h 1H                  4s8h 1H
   5.      74053.7               4s8h 3H                  4s8h 3H
1  5.                            4s9h 1H                  4s9h 1H
   5.      74409.3               4s9h 3H                  4s9h 3H
1  5.                            3d9.4s2.4f 1H            s2.4f 1H
1  5.                            3d9.4s2.4f 3G            s2.4f 3G
1  5.                            3d9.4s2.5f 1H            s2.5f 1H
1  5.                            3d9.4s2.5f 3G            s2.5f 3G
1  5.                            3d9.4s2.4f 3H            s2.4f 3H
1  5.                            3d9.4s2.6f 1H            s2.6f 1H
1  5.                            3d9.4s2.6f 3G            s2.6f 3G
1  5.                            3d9.4s2.6h 3G            s2.6h 3G
1  5.                            3d9.4s2.6h 1H            s2.6h 1H
1  5.                            3d9.4s2.7f 1H            s2.7f 1H
1  5.                            3d9.4s2.7f 3G            s2.7f 3G
1  5.                            3d9.4s2.7h 3G            s2.7h 3G
1  5.                            3d9.4s2.7h 1H            s2.7h 1H
1  5.                            3d9.4s2.5f 3H            s2.5f 3H
1  5.                            3d9.4s2.8f 1H            s2.8f 1H
1  5.                            3d9.4s2.8f 3G            s2.8f 3G
1  5.                            3d9.4s2.8h 3G            s2.8h 3G
1  5.                            3d9.4s2.8h 1H            s2.8h 1H
1  5.                            3d9.4s2.8k 3H            s2.8k 3H
1  5.                            3d9.4s2.8k 3I            s2.8k 3I
1  5.                            3d9.4s2.9f 1H            s2.9f 1H
1  5.                            3d9.4s2.9f 3G            s2.9f 3G
1  5.                            3d9.4s2.9k 3H            s2.9k 3H
1  5.                            3d9.4s2.9h 3G            s2.9h 3G
1  5.                            3d9.4s2.9k 3I            s2.9k 3I
1  5.                            3d9.4s2.9h 1H            s2.9h 1H
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
1  5.                            3d9.4s2.6h 3G            s2.6h 3G
1  5.                            3d9.4s2.6h 3I            s2.6h 3I
1  5.                            3d9.4s2.7f 3H            s2.7f 3H
1  5.                            3d9.4s2.7h 3G            s2.7h 3G
1  5.                            3d9.4s2.7h 3I            s2.7h 3I
1  5.                            3d9.4s2.8f 3H            s2.8f 3H
1  5.                            3d9.4s2.8h 3G            s2.8h 3G
1  5.                            3d9.4s2.8h 3I            s2.8h 3I
1  5.                            3d9.4s2.8k 1H            s2.8k 1H
1  5.                            3d9.4s2.9f 3H            s2.9f 3H
1  5.                            3d9.4s2.9h 3G            s2.9h 3G
1  5.                            3d9.4s2.9h 3I            s2.9h 3I
1  5.                            3d9.4s2.9k 1H            s2.9k 1H
1  5.                            3d9.4s2.10f 3H           s2.10f 3H
1  5.                            3d9.4s2.11f 3H           s2.11f 3H
1  5.                            3d9.4s2.12f 3H           s2.12f 3H
1  5.                            3d9.4s2.13f 3H           s2.13f 3H
1  5.                            3d9.4s2.14f 3H           s2.14f 3H
1  5.                            3d9.4s4p5s 5F            4s4p5s 5F
   6.      72731.2               4s6h 3H                  4s6h 3H
   6.      73534.9               4s7h 3H                  4s7h 3H
   6.      74053.7               4s8h 3H                  4s8h 3H
1  6.                            4s8k 3K                  4s8k 3K
   6.      74409.3               4s9h 3H                  4s9h 3H
1  6.                            4s9k 3K                  4s9k 3K                           
1  6.                            3d9.4s2.4f 3H            s2.4f 3H
1  6.                            3d9.4s2.5f 3H            s2.5f 3H
1  6.                            3d9.4s2.6h 1I            s2.6h 1I                            
1  6.                            3d9.4s2.6h 3H            s2.6h 3H
1  6.                            3d9.4s2.6f 3H            s2.6f 3H
1  6.                            3d9.4s2.7h 1I            s2.7h 1I                            
1  6.                            3d9.4s2.7h 3H            s2.7h 3H
1  6.                            3d9.4s2.7f 3H            s2.7f 3H
1  6.                            3d9.4s2.8h 1I            s2.8h 1I                            
1  6.                            3d9.4s2.8h 3H            s2.8h 3H
1  6.                            3d9.4s2.8k 3H            s2.8k 3H
1  6.                            3d9.4s2.8k 3K            s2.8k 3K
1  6.                            3d9.4s2.8f 3H            s2.8f 3H
1  6.                            3d9.4s2.9h 1I            s2.9h 1I                            
1  6.                            3d9.4s2.9h 3H            s2.9h 3H
1  6.                            3d9.4s2.9k 3H            s2.9k 3H
1  6.                            3d9.4s2.9k 3K            s2.9k 3K
1  6.                            3d9.4s2.9f 3H            s2.9f 3H
1  6.                            3d9.4s2.10f 3H           s2.10f 3H
1  6.                            3d9.4s2.11f 3H           s2.11f 3H
1  6.                            3d9.4s2.12f 3H           s2.12f 3H
1  6.                            3d9.4s2.13f 3H           s2.13f 3H
1  6.                            3d9.4s2.14f 3H           s2.14f 3H
1  6.                            3d9.4s2.6h 3K            s2.6h 3K                            
1  6.                            3d9.4s2.6h 3I            s2.6h 3I
1  6.                            3d9.4s2.7h 3K            s2.7h 3K                            
1  6.                            3d9.4s2.7h 3I            s2.7h 3I
1  6.                            3d9.4s2.8h 3K            s2.8h 3K                            
1  6.                            3d9.4s2.8h 3I            s2.8h 3I
1  6.                            3d9.4s2.8k 3H            s2.8k 3H
1  6.                            3d9.4s2.8k 3K            s2.8k 3K
1  6.                            3d9.4s2.9h 3K            s2.9h 3K                            
1  6.                            3d9.4s2.9k 3H            s2.9k 3H
1  6.                            3d9.4s2.9k 3K            s2.9k 3K
1  6.                            3d9.4s2.9h 3I            s2.9h 3I
1  7.                            4s8k 1K                  4s8k 1K
1  7.                            4s8k 3K                  4s8k 3K
1  7.                            4s9k 1K                  4s9k 1K
1  7.                            4s9k 3K                  4s9k 3K
1  7.                            3d9.4s2.6h 1K            s2.6h 1K
1  7.                            3d9.4s2.6h 3I            s2.6h 3I
1  7.                            3d9.4s2.7h 1K            s2.7h 1K
1  7.                            3d9.4s2.7h 3I            s2.7h 3I
1  7.                            3d9.4s2.8h 1K            s2.8h 1K
1  7.                            3d9.4s2.8h 3I            s2.8h 3I
1  7.                            3d9.4s2.8k 3I            s2.8k 3I
1  7.                            3d9.4s2.8k 1K            s2.8k 1K
1  7.                            3d9.4s2.9h 1K            s2.9h 1K
1  7.                            3d9.4s2.9h 3I            s2.9h 3I
1  7.                            3d9.4s2.9k 3I            s2.9k 3I
1  7.                            3d9.4s2.9k 1K            s2.9k 1K
1  7.                            3d9.4s2.6h 3K            s2.6h 3K
1  7.                            3d9.4s2.7h 3K            s2.7h 3K
1  7.                            3d9.4s2.8h 3K            s2.8h 3K
1  7.                            3d9.4s2.8k 3I            s2.8k 3I
1  7.                            3d9.4s2.8k 3L            s2.8k 3L
1  7.                            3d9.4s2.9h 3K            s2.9h 3K
1  7.                            3d9.4s2.9k 3I            s2.9k 3I
1  7.                            3d9.4s2.9k 3L            s2.9k 3L
1  8.                            4s8k 3K                  4s8k 3K
1  8.                            4s9k 3K                  4s9k 3K
1  8.                            4s6h 3K                  4s6h 3K
1  8.                            4s7h 3K                  4s7h 3K
1  8.                            4s8h 3K                  4s8h 3K
1  8.                            4s8k 1L                  4s8k 1L
1  8.                            4s8k 3K                  4s8k 3K
1  8.                            4s9h 3K                  4s9h 3K
1  8.                            4s9k 1L                  4s9k 1L
1  8.                            4s9k 3K                  4s9k 3K
1  8.                            4s8k 3M                  4s8k 3M
1  8.                            4s8k 3L                  4s8k 3L
1  8.                            4s9k 3M                  4s9k 3M
1  8.                            4s9k 3L                  4s9k 3L
1  9.                            3d9.4s2.8k 1M            s2.8k 1M
1  9.                            3d9.4s2.8k 3L            s2.8k 3L
1  9.                            3d9.4s2.9k 1M            s2.9k 1M
1  9.                            3d9.4s2.9k 3L            s2.9k 3M
1  9.                            3d9.4s2.8k 3M            s2.8k 3M
1  9.                            3d9.4s2.9k 1M            s2.9k 1M
1 10.                            3d9.4s2.8k 3M            s2.8k 3M
1 10.                            3d9.4s2.9k 3M            s2.9k 3M
 3778       5.4   64      LEAST SQUARES
   1    1  EAV        36885.2     3.   29509.3             1.000  0    6900.0  0             4s4p      
   2    1  ZETA 3       390.4     5.     371.2             1.000  0       0.0  0                       
   3    1  G1(23)     23808.6    10.   33147.5             0.800  0       0.0  0                       
   4    2  EAV        61625.2     3.   54874.1             1.000  0    6900.0  0             4s5p      
   5    2  ZETA 5        55.6     5.      65.6             1.000  0       0.0  0                       
   6    2  G1(25)      2095.2    11.    3616.7             0.800  0       0.0  0                       
   7    3  EAV        68191.2     3.   61376.1             1.000  0    6900.0  0             4s6p      
   8    3  ZETA 5        21.0     5.      25.1             1.000  0       0.0  0                       
   9    3  G1(25)       667.9    10.    1234.7             0.800  0       0.0  0                       
  10    4  EAV        71030.4     3.   64185.9             1.000  0    6900.0  0             4s7p      
  11    4  ZETA 5        10.2     5.      12.4             1.000  0       0.0  0                       
  12    4  G1(25)       296.3    10.     576.5             0.800  0       0.0  0                       
  13    5  EAV        72523.6     3.   65665.0             1.000  0    6900.0  0             4s8p      
  14    5  ZETA 5         5.7     5.       7.0             1.000  0       0.0  0                       
  15    5  G1(25)       155.8    10.     316.9             0.800  0       0.0  0                       
  16    6  EAV        73406.6     3.   66540.9             1.000  0    6900.0  0             4s9p      
  17    6  ZETA 5         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
  18    6  G1(25)        90.6    10.     193.2             0.800  0       0.0  0                       
  19    7  EAV        73972.9     4.   67102.6             1.000  0    6900.0  0             4s10p     
  20    7  ZETA 5         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
  21    7  G1(25)        55.3    12.     126.6             0.800  0       0.0  0                       
  22    8  EAV        74357.3     4.   67484.0             1.000  0    6900.0  0             4s11p     
  23    8  ZETA 5         2.0     0.       2.0 FIXEDHF     1.000  0       0.0  0                       
  24    8  G1(25)        35.1    12.      87.5             0.800  0       0.0  0                       
  25    9  EAV        74630.1     4.   67755.0             1.000  0    6900.0  0             4s12p     
  26    9  ZETA 5         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
  27    9  G1(25)        22.7    12.      63.0             0.800  0       0.0  0                       
  28    A  EAV        74828.5     6.   67954.4             1.000  0    6900.0  0             4s13p     
  29    A  ZETA 5         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
  30    A  G1(25)        18.8     0.      46.9 FIXEDHF     0.400  0       0.0  0                       
  31    B  EAV        74979.2     6.   68105.6             1.000  0    6900.0  0             4s14p     
  32    B  ZETA 5         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
  33    B  G1(25)        14.3     0.      35.8 FIXEDHF     0.400  0       0.0  0                       
  34    C  EAV        75092.8     6.   68222.9             1.000  0    6900.0  0             4s15p     
  35    C  ZETA 5         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
  36    C  G1(25)        11.2     0.      28.0 FIXEDHF     0.400  0       0.0  0                       
  37    D  EAV        92487.5     3.   75237.7             1.000  0   15000.0  0             d9s2 4p   
  38    D  ZETA 1      1083.1     0.    1083.1 FIXEDHF     1.000  0       0.0  0                       
  39    D  ZETA 3       545.8     0.     545.8 FIXEDHF     1.000  0       0.0  0                       
  40    D  F2(13)     12327.3    20.   12071.9             0.800  0       0.0  0                       
  41    D  G1(13)      3642.8     7.    4217.1             0.800  0       0.0  0                       
  42    D  G3(13)      2845.9     0.    3557.4 FIXEDHF     0.800  0       0.0  0                       
  43    E  EAV       124526.9     3.  109381.1             1.000  0   15000.0  0             d9s2 5p   
  44    E  ZETA 1      1084.7     0.    1084.7 FIXEDHF     1.000  0       0.0  0                       
  45    E  ZETA 5        71.0     0.      71.0 FIXEDHF     1.000  0       0.0  0                       
  46    E  F2(15)      1655.4    21.    1506.3             0.800  0       0.0  0                       
  47    E  G1(15)       615.5    79.     503.1             0.800  0       0.0  0                       
  48    E  G3(15)       348.6     0.     435.8 FIXEDHF     0.800  0       0.0  0                       
  49    F  EAV       131700.7     3.  116613.8             1.000  0   15000.0  0             d9s2 6p   
  50    F  ZETA 1      1085.0     0.    1085.0 FIXEDHF     1.000  0       0.0  0                       
  51    F  ZETA 5        26.9     0.      26.9 FIXEDHF     1.000  0       0.0  0                       
  52    F  F2(15)       439.8     0.     549.8 FIXEDHF     0.800  0       0.0  0                       
  53    F  G1(15)       149.8     0.     187.3 FIXEDHF     0.800  0       0.0  0                       
  54    F  G3(15)       130.6     0.     163.2 FIXEDHF     0.800  0       0.0  0                       
  55    G  EAV       134696.0     3.  119634.2             1.000  0   15000.0  0             d9s2 7p   
  56    G  ZETA 1      1085.0     0.    1085.0 FIXEDHF     1.000  0       0.0  0                       
  57    G  ZETA 5        13.2     0.      13.2 FIXEDHF     1.000  0       0.0  0                       
  58    G  F2(15)       211.5     0.     264.4 FIXEDHF     0.800  0       0.0  0                       
  59    G  G1(15)        72.8     0.      91.0 FIXEDHF     0.800  0       0.0  0                       
  60    G  G3(15)        63.6     0.      79.5 FIXEDHF     0.800  0       0.0  0                       
  61    H  EAV       136256.1     3.  121198.6             1.000  0   15000.0  0             d9s2 8p   
  62    H  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  63    H  ZETA 5         7.4     0.       7.4 FIXEDHF     1.000  0       0.0  0                       
  64    H  F2(15)       118.2     0.     147.8 FIXEDHF     0.800  0       0.0  0                       
  65    H  G1(15)        40.9     0.      51.1 FIXEDHF     0.800  0       0.0  0                       
  66    H  G3(15)        35.8     0.      44.7 FIXEDHF     0.800  0       0.0  0                       
  67    I  EAV       137172.7     3.  122115.9             1.000  0   15000.0  0             d9s2 9p   
  68    I  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  69    I  ZETA 5         4.6     0.       4.6 FIXEDHF     1.000  0       0.0  0                       
  70    I  F2(15)        72.8     0.      91.0 FIXEDHF     0.800  0       0.0  0                       
  71    I  G1(15)        25.3     0.      31.6 FIXEDHF     0.800  0       0.0  0                       
  72    I  G3(15)        22.2     0.      27.7 FIXEDHF     0.800  0       0.0  0                       
  73    J  EAV       137756.3     3.  122699.3             1.000  0       0.0  0             d9s2 10p  
  74    J  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  75    J  ZETA 5         3.1     0.       3.1 FIXEDHF     1.000  0       0.0  0                       
  76    J  F2(15)        48.1     0.      60.1 FIXEDHF     0.800  0       0.0  0                       
  77    J  G1(15)        16.7     0.      20.9 FIXEDHF     0.800  0       0.0  0                       
  78    J  G3(15)        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0                       
  79    K  EAV       138150.9     3.  123094.3             1.000  0       0.0  0             d9s2 11p  
  80    K  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  81    K  ZETA 5         2.1     0.       2.1 FIXEDHF     1.000  0       0.0  0                       
  82    K  F2(15)        33.4     0.      41.8 FIXEDHF     0.800  0       0.0  0                       
  83    K  G1(15)        11.7     0.      14.6 FIXEDHF     0.800  0       0.0  0                       
  84    K  G3(15)        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0                       
  85    L  EAV       138431.1     3.  123373.2             1.000  0   15000.0  0             d9s2 12p  
  86    L  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  87    L  ZETA 5         1.5     0.       1.5 FIXEDHF     1.000  0       0.0  0                       
  88    L  F2(15)        24.2     0.      30.2 FIXEDHF     0.800  0       0.0  0                       
  89    L  G1(15)         8.5     0.      10.6 FIXEDHF     0.800  0       0.0  0                       
  90    L  G3(15)         7.4     0.       9.3 FIXEDHF     0.800  0       0.0  0                       
  91    M  EAV       138635.2     3.  123578.6             1.000  0   15000.0  0             d9s2 13p  
  92    M  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  93    M  ZETA 5         1.2     0.       1.2 FIXEDHF     1.000  0       0.0  0                       
  94    M  F2(15)        18.0     0.      22.5 FIXEDHF     0.800  0       0.0  0                       
  95    M  G1(15)         6.3     0.       7.9 FIXEDHF     0.800  0       0.0  0                       
  96    M  G3(15)         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0                       
  97    N  EAV       138790.5     3.  123733.1             1.000  0   15000.0  0             d9s2 14p  
  98    N  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
  99    N  ZETA 5         0.9     0.       0.9 FIXEDHF     1.000  0       0.0  0                       
 100    N  F2(15)        13.8     0.      17.3 FIXEDHF     0.800  0       0.0  0                       
 101    N  G1(15)         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0                       
 102    N  G3(15)         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0                       
 103    O  EAV       138911.3     3.  123853.0             1.000  0       0.0  0             d9s2 15p  
 104    O  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 105    O  ZETA 5         0.7     0.       0.7 FIXEDHF     1.000  0       0.0  0                       
 106    O  F2(15)        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0                       
 107    O  G1(15)         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
 108    O  G3(15)         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
 109    P  EAV        68834.1     3.   61956.1             1.000  0    6900.0  0             4s4f      
 110    P  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 111    P  G3(26)        11.3     0.      14.1 FIXEDHF     0.800  0       0.0  0                       
 112    Q  EAV        71335.8     3.   64449.7             1.000  0    6900.0  0             4s5f      
 113    Q  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 114    Q  G3(26)         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0                       
 115    R  EAV        72691.4     3.   65808.4             1.000  0    6900.0  0             4s6f      
 116    R  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 117    R  G3(26)         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0                       
 118    S  EAV        73499.9     3.   66627.9             1.000  0    6900.0  0             4s7f      
 119    S  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 120    S  G3(26)         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0                       
 121    T  EAV        74059.2     0.   67159.2 FIXEDHF     1.000  0    6900.0  0             4s8f      
 122    T  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 123    T  G3(26)         3.6     0.       4.5 FIXEDHF     0.800  0       0.0  0                       
 124    U  EAV        74423.0     0.   67523.0 FIXEDHF     1.000  0    6900.0  0             4s9f      
 125    U  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 126    U  G3(26)         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
 127    V  EAV        74683.1     0.   67783.1 FIXEDHF     1.000  0    6900.0  0             4s10f     
 128    V  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 129    V  G3(26)         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
 130    W  EAV        74875.5     0.   67975.5 FIXEDHF     1.000  0    6900.0  0             4s11f     
 131    W  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 132    W  G3(26)         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
 133    X  EAV        75021.6     0.   68121.6 FIXEDHF     1.000  0    6900.0  0             4s12f     
 134    X  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 135    X  G3(26)         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
 136    Y  EAV        75135.3     0.   68235.3 FIXEDHF     1.000  0    6900.0  0             4s13f     
 137    Y  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 138    Y  G3(26)         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
 139    Z  EAV        75225.5     0.   68325.5 FIXEDHF     1.000  0    6900.0  0             4s14f     
 140    Z  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 141    Z  G3(26)         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
 142    a  EAV       132641.9     3.  117594.2             1.000  0       0.0  0             d9s2 4f   
 143    a  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 144    a  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 145    a  F2(16)        66.0    74.      73.1             0.800  0       0.0  0                       
 146    a  F4(16)         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
 147    a  G1(16)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
 148    a  G3(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 149    a  G5(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 150    b  EAV       135141.0     3.  120087.6             1.000  0       0.0  0             d9s2 5f   
 151    b  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 152    b  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 153    b  F2(16)        30.5     0.      38.1 FIXEDHF     0.800  0       0.0  0                       
 154    b  F4(16)         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
 155    b  G1(16)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
 156    b  G3(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 157    b  G5(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 158    c  EAV       136502.1     3.  121446.7             1.000  0       0.0  0             d9s2 6f   
 159    c  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 160    c  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 161    c  F2(16)        17.9     0.      22.4 FIXEDHF     0.800  0       0.0  0                       
 162    c  F4(16)         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
 163    c  G1(16)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
 164    c  G3(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 165    c  G5(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 166    d  EAV       137323.9     4.  122266.6             1.000  0       0.0  0             d9s2 7f   
 167    d  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 168    d  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 169    d  F2(16)        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0                       
 170    d  F4(16)         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
 171    d  G1(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 172    d  G3(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 173    d  G5(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 174    e  EAV       137858.3     4.  122798.3             1.000  0       0.0  0             d9s2 8f   
 175    e  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 176    e  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 177    e  F2(16)         7.8     0.       9.7 FIXEDHF     0.800  0       0.0  0                       
 178    e  F4(16)         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
 179    e  G1(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 180    e  G3(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 181    e  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 182    f  EAV       138218.6     4.  123162.4             1.000  0       0.0  0             d9s2 9f   
 183    f  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 184    f  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 185    f  F2(16)         5.4     0.       6.8 FIXEDHF     0.800  0       0.0  0                       
 186    f  F4(16)         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
 187    f  G1(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 188    f  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 189    f  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 190    g  EAV       138478.8     4.  123422.6             1.000  0       0.0  0             d9s2 10f  
 191    g  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 192    g  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 193    g  F2(16)         4.0     0.       5.0 FIXEDHF     0.800  0       0.0  0                       
 194    g  F4(16)         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
 195    g  G1(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 196    g  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 197    g  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 198    h  EAV       138672.2     4.  123615.0             1.000  0       0.0  0             d9s2 11f  
 199    h  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 200    h  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 201    h  F2(16)         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
 202    h  F4(16)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
 203    h  G1(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 204    h  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 205    h  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 206    i  EAV       138816.9     4.  123761.2             1.000  0       0.0  0             d9s2 12f  
 207    i  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 208    i  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 209    i  F2(16)         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
 210    i  F4(16)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
 211    i  G1(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 212    i  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 213    i  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 214    j  EAV       138936.7     5.  123875.0             1.000  0       0.0  0             d9s2 13f  
 215    j  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 216    j  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 217    j  F2(16)         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
 218    j  F4(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 219    j  G1(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 220    j  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 221    j  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 222    k  EAV       139027.2     5.  123875.0             1.000  0   15050.0  0             d9s2 14f  
 223    k  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 224    k  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 225    k  F2(16)         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
 226    k  F4(16)         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
 227    k  G1(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 228    k  G3(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 229    k  G5(16)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 230    l  EAV        72731.2     3.   65839.3             1.000  0    6900.0  0             4s6h      
 231    l  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 232    l  G5(27)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 233    m  EAV        73534.9     3.   66648.2             1.000  0    6900.0  0             4s7h      
 234    m  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 235    m  G5(27)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 236    n  EAV        74053.7     3.   67173.1             1.000  0    6900.0  0             4s8h      
 237    n  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 238    n  G5(27)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 239    o  EAV        74409.3     3.   67533.2             1.000  0    6900.0  0             4s9h      
 240    o  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 241    o  G5(27)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 242    p  EAV       136479.8     0.  121479.8 FIXEDHF     1.000  0   15050.0  0             d9s2 6h   
 243    p  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 244    p  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 245    p  F2(17)         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
 246    p  F4(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 247    p  G3(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 248    p  G5(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 249    p  G7(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 250    q  EAV       137288.1     0.  122288.1 FIXEDHF     1.000  0   15050.0  0             d9s2 7h   
 251    q  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 252    q  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 253    q  F2(17)         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0                       
 254    q  F4(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 255    q  G3(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 256    q  G5(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 257    q  G7(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 258    r  EAV       137813.0     0.  122813.0 FIXEDHF     1.000  0   15050.0  0             d9s2 8h   
 259    r  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 260    r  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 261    r  F2(17)         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
 262    r  F4(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 263    r  G3(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 264    r  G5(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 265    r  G7(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 266    s  EAV       138173.1     0.  123173.1 FIXEDHF     1.000  0   15050.0  0             d9s2 9h   
 267    s  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 268    s  ZETA 7         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 269    s  F2(17)         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
 270    s  F4(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 271    s  G3(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 272    s  G5(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 273    s  G7(17)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 274    t  EAV        74073.3     0.   67173.3 FIXEDHF     1.000  0    6900.0  0             4s8k      
 275    t  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 276    t  G7(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 277    u  EAV        74433.3     0.   67533.3 FIXEDHF     1.000  0    6900.0  0             4s9k      
 278    u  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 279    u  G7(28)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 280    v  EAV       137813.7     0.  122813.7 FIXEDHF     1.000  0   15050.0  0             d9s2 8k   
 281    v  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 282    v  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 283    v  F2(18)         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
 284    v  F4(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 285    v  G5(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 286    v  G7(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 287    v  G9(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 288    w  EAV       138173.2     0.  123173.2 FIXEDHF     1.000  0   15050.0  0             d9s2 9k   
 289    w  ZETA 1      1085.1     0.    1085.1 FIXEDHF     1.000  0       0.0  0                       
 290    w  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0                       
 291    w  F2(18)         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
 292    w  F4(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 293    w  G5(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 294    w  G7(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 295    w  G9(18)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
 296    x  EAV       103184.4     5.   92975.0             1.000  0   10000.0  0             4p5s      
 297    x  ZETA 3       643.2     0.     643.2 FIXEDHF     1.000  0       0.0  0                       
 298    x  G1(34)      2505.8     0.    3132.3 FIXEDHF     0.800  0       0.0  0                       
 299    y  EAV       144128.1     0.  134128.1 FIXEDHF     1.000  0   10000.0  0             5s5p      
 300    y  ZETA 5       134.6     0.     134.6 FIXEDHF     1.000  0       0.0  0                       
 301    y  G1(45)     10623.8     0.   13279.8 FIXEDHF     0.800  0       0.0  0                       
 302    z  EAV       166431.6     5.  144443.2             0.000  0       0.0  0             d9 4s4p5s 
 303    z  ZETA 1      1088.1     0.    1088.1 FIXEDHF     1.000  0       0.0  0                       
 304    z  ZETA 3       833.9     0.     833.9 FIXEDHF     1.000  0       0.0  0                       
 305    z  F2(13)     13029.4     0.   16286.8 FIXEDHF     0.800  0       0.0  0                       
 306    z  G2(12)      8665.1     0.   10831.4 FIXEDHF     0.800  0       0.0  0                       
 307    z  G1(13)      4809.6     0.    6012.0 FIXEDHF     0.800  0       0.0  0                       
 308    z  G3(13)      4126.6     0.    5158.2 FIXEDHF     0.800  0       0.0  0                       
 309    z  G2(14)       699.4     0.     874.2 FIXEDHF     0.800  0       0.0  0                       
 310    z  G1(23)     37809.0     0.   47261.3 FIXEDHF     0.800  0       0.0  0                       
 311    z  G0(24)      1803.3     0.    2254.1 FIXEDHF     0.800  0       0.0  0                       
 312    z  G1(34)      2245.9     0.    2807.4 FIXEDHF     0.800  0       0.0  0                       
 313    12 0D2325      1397.5     0.    1746.9 FIXEDHF     0.800  0       0.0  0  4s4p      -4s5p      
 314    12 1E2325      8261.5     0.   10326.9 FIXEDHF     0.800  0       0.0  0                       
 315    13 0D2325       800.5     0.    1000.6 FIXEDHF     0.800  0       0.0  0  4s4p      -4s6p      
 316    13 1E2325      4710.9     0.    5888.6 FIXEDHF     0.800  0       0.0  0                       
 317    14 0D2325       541.7     0.     677.1 FIXEDHF     0.800  0       0.0  0  4s4p      -4s7p      
 318    14 1E2325      3181.7     0.    3977.1 FIXEDHF     0.800  0       0.0  0                       
 319    15 0D2325       399.4     0.     499.3 FIXEDHF     0.800  0       0.0  0  4s4p      -4s8p      
 320    15 1E2325      2343.6     0.    2929.5 FIXEDHF     0.800  0       0.0  0                       
 321    16 0D2325       310.7     0.     388.4 FIXEDHF     0.800  0       0.0  0  4s4p      -4s9p      
 322    16 1E2325      1822.2     0.    2277.8 FIXEDHF     0.800  0       0.0  0                       
 323    17 0D2325       250.9     0.     313.6 FIXEDHF     0.800  0       0.0  0  4s4p      -4s10p     
 324    17 1E2325      1470.7     0.    1838.4 FIXEDHF     0.800  0       0.0  0                       
 325    18 0D2325       208.2     0.     260.3 FIXEDHF     0.800  0       0.0  0  4s4p      -4s11p     
 326    18 1E2325      1220.1     0.    1525.1 FIXEDHF     0.800  0       0.0  0                       
 327    19 0D2325       176.5     0.     220.6 FIXEDHF     0.800  0       0.0  0  4s4p      -4s12p     
 328    19 1E2325      1033.8     0.    1292.2 FIXEDHF     0.800  0       0.0  0                       
 329    1A 0D2325       152.1     0.     190.1 FIXEDHF     0.800  0       0.0  0  4s4p      -4s13p     
 330    1A 1E2325       890.7     0.    1113.4 FIXEDHF     0.800  0       0.0  0                       
 331    1B 0D2325       132.9     0.     166.1 FIXEDHF     0.800  0       0.0  0  4s4p      -4s14p     
 332    1B 1E2325       778.1     0.     972.6 FIXEDHF     0.800  0       0.0  0                       
 333    1C 0D2325       117.4     0.     146.7 FIXEDHF     0.800  0       0.0  0  4s4p      -4s15p     
 334    1C 1E2325       687.4     0.     859.3 FIXEDHF     0.800  0       0.0  0                       
 335    1D 2D1112       600.6     0.     750.7 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 4p   
 336    1D 2D1323     -7616.3     0.   -9520.4 FIXEDHF     0.800  0       0.0  0                       
 337    1D 1E1323     -7467.1     0.   -9333.9 FIXEDHF     0.800  0       0.0  0                       
 338    1E 2D1325     -1910.1     0.   -2387.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 5p   
 339    1E 1E1325     -2352.5     0.   -2940.6 FIXEDHF     0.800  0       0.0  0                       
 340    1F 2D1325     -1086.1     0.   -1357.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 6p   
 341    1F 1E1325     -1404.0     0.   -1755.0 FIXEDHF     0.800  0       0.0  0                       
 342    1G 2D1325      -734.1     0.    -917.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 7p   
 343    1G 1E1325      -969.1     0.   -1211.4 FIXEDHF     0.800  0       0.0  0                       
 344    1H 2D1325      -541.3     0.    -676.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 8p   
 345    1H 1E1325      -722.8     0.    -903.5 FIXEDHF     0.800  0       0.0  0                       
 346    1I 2D1325      -421.3     0.    -526.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 9p   
 347    1I 1E1325      -566.5     0.    -708.1 FIXEDHF     0.800  0       0.0  0                       
 348    1J 2D1325      -340.4     0.    -425.5 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 10p  
 349    1J 1E1325      -459.8     0.    -574.8 FIXEDHF     0.800  0       0.0  0                       
 350    1K 2D1325      -282.6     0.    -353.3 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 11p  
 351    1K 1E1325      -383.0     0.    -478.8 FIXEDHF     0.800  0       0.0  0                       
 352    1L 2D1325      -239.6     0.    -299.5 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 12p  
 353    1L 1E1325      -325.6     0.    -407.0 FIXEDHF     0.800  0       0.0  0                       
 354    1M 2D1325      -206.6     0.    -258.3 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 13p  
 355    1M 1E1325      -281.3     0.    -351.6 FIXEDHF     0.800  0       0.0  0                       
 356    1N 2D1325      -180.6     0.    -225.8 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 14p  
 357    1N 1E1325      -246.2     0.    -307.8 FIXEDHF     0.800  0       0.0  0                       
 358    1O 2D1325      -159.7     0.    -199.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 15p  
 359    1O 1E1325      -217.9     0.    -272.4 FIXEDHF     0.800  0       0.0  0                       
 360    1a 2D1326      -214.0     0.    -267.5 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 4f   
 361    1a 1E1326       -92.5     0.    -115.6 FIXEDHF     0.800  0       0.0  0                       
 362    1b 2D1326      -195.7     0.    -244.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 5f   
 363    1b 1E1326       -89.2     0.    -111.5 FIXEDHF     0.800  0       0.0  0                       
 364    1c 2D1326      -166.5     0.    -208.1 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 6f   
 365    1c 1E1326       -78.0     0.     -97.5 FIXEDHF     0.800  0       0.0  0                       
 366    1d 2D1326      -140.9     0.    -176.1 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 7f   
 367    1d 1E1326       -67.1     0.     -83.9 FIXEDHF     0.800  0       0.0  0                       
 368    1e 2D1326      -120.2     0.    -150.3 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 8f   
 369    1e 1E1326       -58.0     0.     -72.5 FIXEDHF     0.800  0       0.0  0                       
 370    1f 2D1326      -103.8     0.    -129.7 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 9f   
 371    1f 1E1326       -50.4     0.     -63.0 FIXEDHF     0.800  0       0.0  0                       
 372    1g 2D1326       -90.6     0.    -113.2 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 10f  
 373    1g 1E1326       -44.2     0.     -55.3 FIXEDHF     0.800  0       0.0  0                       
 374    1h 2D1326       -79.8     0.     -99.8 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 11f  
 375    1h 1E1326       -39.2     0.     -49.0 FIXEDHF     0.800  0       0.0  0                       
 376    1i 2D1326       -71.0     0.     -88.8 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 12f  
 377    1i 1E1326       -35.0     0.     -43.8 FIXEDHF     0.800  0       0.0  0                       
 378    1j 2D1326       -63.7     0.     -79.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 13f  
 379    1j 1E1326       -31.5     0.     -39.4 FIXEDHF     0.800  0       0.0  0                       
 380    1k 2D1326       -63.7     0.     -79.6 FIXEDHF     0.800  0       0.0  0  4s4p      -d9s2 14f  
 381    1k 1E1326       -31.5     0.     -39.4 FIXEDHF     0.800  0       0.0  0                       
 382    1x 1D2334     -2616.9     0.   -3271.1 FIXEDHF     0.800  0       0.0  0  4s4p      -4p5s      
 383    1x 0E2334      -204.6     0.    -255.8 FIXEDHF     0.800  0       0.0  0                       
 384    1y 0D2345      1503.7     0.    1879.6 FIXEDHF     0.800  0       0.0  0  4s4p      -5s5p      
 385    1y 1E2345       528.0     0.     660.0 FIXEDHF     0.800  0       0.0  0                       
 386    1z 2D1114       377.5     0.     471.9 FIXEDHF     0.800  0       0.0  0  4s4p      -d9 4s4p5s 
 387    1z 1D1334       557.5     0.     696.9 FIXEDHF     0.800  0       0.0  0                       
 388    1z 2E1334     -1773.1     0.   -2216.4 FIXEDHF     0.800  0       0.0  0                       
 389    23 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s6p      
 390    23 1E2525      1687.1     0.    2108.9 FIXEDHF     0.800  0       0.0  0                       
 391    24 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s7p      
 392    24 1E2525      1150.4     0.    1438.0 FIXEDHF     0.800  0       0.0  0                       
 393    25 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s8p      
 394    25 1E2525       851.8     0.    1064.8 FIXEDHF     0.800  0       0.0  0                       
 395    26 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s9p      
 396    26 1E2525       664.4     0.     830.5 FIXEDHF     0.800  0       0.0  0                       
 397    27 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s10p     
 398    27 1E2525       537.4     0.     671.8 FIXEDHF     0.800  0       0.0  0                       
 399    28 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s11p     
 400    28 1E2525       446.5     0.     558.1 FIXEDHF     0.800  0       0.0  0                       
 401    29 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s12p     
 402    29 1E2525       378.8     0.     473.5 FIXEDHF     0.800  0       0.0  0                       
 403    2A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s13p     
 404    2A 1E2525       326.6     0.     408.3 FIXEDHF     0.800  0       0.0  0                       
 405    2B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s14p     
 406    2B 1E2525       285.5     0.     356.9 FIXEDHF     0.800  0       0.0  0                       
 407    2C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -4s15p     
 408    2C 1E2525       252.4     0.     315.5 FIXEDHF     0.800  0       0.0  0                       
 409    2D 2D1523     -2472.9     0.   -3091.1 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 4p   
 410    2D 1E1523     -2516.2     0.   -3145.3 FIXEDHF     0.800  0       0.0  0                       
 411    2E 2D1112       689.1     0.     861.4 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 5p   
 412    2E 2D1525     -1070.7     0.   -1338.4 FIXEDHF     0.800  0       0.0  0                       
 413    2E 1E1525      -829.0     0.   -1036.2 FIXEDHF     0.800  0       0.0  0                       
 414    2F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 6p   
 415    2F 2D1525      -569.4     0.    -711.8 FIXEDHF     0.800  0       0.0  0                       
 416    2F 1E1525      -497.5     0.    -621.9 FIXEDHF     0.800  0       0.0  0                       
 417    2G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 7p   
 418    2G 2D1525      -380.1     0.    -475.1 FIXEDHF     0.800  0       0.0  0                       
 419    2G 1E1525      -344.2     0.    -430.2 FIXEDHF     0.800  0       0.0  0                       
 420    2H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 8p   
 421    2H 2D1525      -278.9     0.    -348.6 FIXEDHF     0.800  0       0.0  0                       
 422    2H 1E1525      -257.0     0.    -321.2 FIXEDHF     0.800  0       0.0  0                       
 423    2I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 9p   
 424    2I 2D1525      -216.5     0.    -270.6 FIXEDHF     0.800  0       0.0  0                       
 425    2I 1E1525      -201.5     0.    -251.9 FIXEDHF     0.800  0       0.0  0                       
 426    2J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 10p  
 427    2J 2D1525      -174.6     0.    -218.3 FIXEDHF     0.800  0       0.0  0                       
 428    2J 1E1525      -163.7     0.    -204.6 FIXEDHF     0.800  0       0.0  0                       
 429    2K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 11p  
 430    2K 2D1525      -144.9     0.    -181.1 FIXEDHF     0.800  0       0.0  0                       
 431    2K 1E1525      -136.4     0.    -170.5 FIXEDHF     0.800  0       0.0  0                       
 432    2L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 12p  
 433    2L 2D1525      -122.7     0.    -153.4 FIXEDHF     0.800  0       0.0  0                       
 434    2L 1E1525      -115.9     0.    -144.9 FIXEDHF     0.800  0       0.0  0                       
 435    2M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 13p  
 436    2M 2D1525      -105.8     0.    -132.2 FIXEDHF     0.800  0       0.0  0                       
 437    2M 1E1525      -100.2     0.    -125.2 FIXEDHF     0.800  0       0.0  0                       
 438    2N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 14p  
 439    2N 2D1525       -92.4     0.    -115.5 FIXEDHF     0.800  0       0.0  0                       
 440    2N 1E1525       -87.7     0.    -109.6 FIXEDHF     0.800  0       0.0  0                       
 441    2O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 15p  
 442    2O 2D1525       -81.7     0.    -102.1 FIXEDHF     0.800  0       0.0  0                       
 443    2O 1E1525       -77.6     0.     -97.0 FIXEDHF     0.800  0       0.0  0                       
 444    2a 2D1526       102.6     0.     128.2 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 4f   
 445    2a 1E1526       -29.8     0.     -37.3 FIXEDHF     0.800  0       0.0  0                       
 446    2b 2D1526        64.2     0.      80.2 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 5f   
 447    2b 1E1526       -28.9     0.     -36.1 FIXEDHF     0.800  0       0.0  0                       
 448    2c 2D1526        43.5     0.      54.4 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 6f   
 449    2c 1E1526       -25.4     0.     -31.7 FIXEDHF     0.800  0       0.0  0                       
 450    2d 2D1526        31.7     0.      39.6 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 7f   
 451    2d 1E1526       -21.8     0.     -27.3 FIXEDHF     0.800  0       0.0  0                       
 452    2e 2D1526        24.3     0.      30.4 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 8f   
 453    2e 1E1526       -18.9     0.     -23.6 FIXEDHF     0.800  0       0.0  0                       
 454    2f 2D1526        19.4     0.      24.2 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 9f   
 455    2f 1E1526       -16.4     0.     -20.5 FIXEDHF     0.800  0       0.0  0                       
 456    2g 2D1526        15.9     0.      19.9 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 10f  
 457    2g 1E1526       -14.4     0.     -18.0 FIXEDHF     0.800  0       0.0  0                       
 458    2h 2D1526        13.4     0.      16.7 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 11f  
 459    2h 1E1526       -12.8     0.     -16.0 FIXEDHF     0.800  0       0.0  0                       
 460    2i 2D1526        11.4     0.      14.3 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 12f  
 461    2i 1E1526       -11.4     0.     -14.3 FIXEDHF     0.800  0       0.0  0                       
 462    2j 2D1526         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 13f  
 463    2j 1E1526       -10.2     0.     -12.8 FIXEDHF     0.800  0       0.0  0                       
 464    2k 2D1526         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0  4s5p      -d9s2 14f  
 465    2k 1E1526       -10.2     0.     -12.8 FIXEDHF     0.800  0       0.0  0                       
 466    2x 1D2534      5731.7     0.    7164.6 FIXEDHF     0.800  0       0.0  0  4s5p      -4p5s      
 467    2x 0E2534      1817.0     0.    2271.2 FIXEDHF     0.800  0       0.0  0                       
 468    2y 0D2545       217.3     0.     271.6 FIXEDHF     0.800  0       0.0  0  4s5p      -5s5p      
 469    2y 1E2545       786.2     0.     982.8 FIXEDHF     0.800  0       0.0  0                       
 470    2z 1D1534     -1291.3     0.   -1614.1 FIXEDHF     0.800  0       0.0  0  4s5p      -d9 4s4p5s 
 471    2z 2E1534      -671.9     0.    -839.9 FIXEDHF     0.800  0       0.0  0                       
 472    34 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s7p      
 473    34 1E2525       674.6     0.     843.3 FIXEDHF     0.800  0       0.0  0                       
 474    35 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s8p      
 475    35 1E2525       500.0     0.     625.0 FIXEDHF     0.800  0       0.0  0                       
 476    36 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s9p      
 477    36 1E2525       390.2     0.     487.8 FIXEDHF     0.800  0       0.0  0                       
 478    37 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s10p     
 479    37 1E2525       315.8     0.     394.7 FIXEDHF     0.800  0       0.0  0                       
 480    38 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s11p     
 481    38 1E2525       262.4     0.     328.0 FIXEDHF     0.800  0       0.0  0                       
 482    39 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s12p     
 483    39 1E2525       222.6     0.     278.3 FIXEDHF     0.800  0       0.0  0                       
 484    3A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s13p     
 485    3A 1E2525       192.1     0.     240.1 FIXEDHF     0.800  0       0.0  0                       
 486    3B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s14p     
 487    3B 1E2525       167.9     0.     209.9 FIXEDHF     0.800  0       0.0  0                       
 488    3C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -4s15p     
 489    3C 1E2525       148.4     0.     185.5 FIXEDHF     0.800  0       0.0  0                       
 490    3D 2D1523     -1429.7     0.   -1787.1 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 4p   
 491    3D 1E1523     -1465.0     0.   -1831.3 FIXEDHF     0.800  0       0.0  0                       
 492    3E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 5p   
 493    3E 2D1525      -606.2     0.    -757.8 FIXEDHF     0.800  0       0.0  0                       
 494    3E 1E1525      -487.7     0.    -609.6 FIXEDHF     0.800  0       0.0  0                       
 495    3F 2D1112       699.5     0.     874.4 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 6p   
 496    3F 2D1525      -382.6     0.    -478.3 FIXEDHF     0.800  0       0.0  0                       
 497    3F 1E1525      -293.1     0.    -366.4 FIXEDHF     0.800  0       0.0  0                       
 498    3G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 7p   
 499    3G 2D1525      -250.0     0.    -312.5 FIXEDHF     0.800  0       0.0  0                       
 500    3G 1E1525      -202.9     0.    -253.6 FIXEDHF     0.800  0       0.0  0                       
 501    3H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 8p   
 502    3H 2D1525      -182.7     0.    -228.4 FIXEDHF     0.800  0       0.0  0                       
 503    3H 1E1525      -151.5     0.    -189.4 FIXEDHF     0.800  0       0.0  0                       
 504    3I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 9p   
 505    3I 2D1525      -141.6     0.    -177.0 FIXEDHF     0.800  0       0.0  0                       
 506    3I 1E1525      -118.9     0.    -148.6 FIXEDHF     0.800  0       0.0  0                       
 507    3J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 10p  
 508    3J 2D1525      -114.2     0.    -142.7 FIXEDHF     0.800  0       0.0  0                       
 509    3J 1E1525       -96.6     0.    -120.7 FIXEDHF     0.800  0       0.0  0                       
 510    3K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 11p  
 511    3K 2D1525       -94.6     0.    -118.3 FIXEDHF     0.800  0       0.0  0                       
 512    3K 1E1525       -80.5     0.    -100.6 FIXEDHF     0.800  0       0.0  0                       
 513    3L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 12p  
 514    3L 2D1525       -80.2     0.    -100.2 FIXEDHF     0.800  0       0.0  0                       
 515    3L 1E1525       -68.4     0.     -85.5 FIXEDHF     0.800  0       0.0  0                       
 516    3M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 13p  
 517    3M 2D1525       -69.1     0.     -86.4 FIXEDHF     0.800  0       0.0  0                       
 518    3M 1E1525       -59.1     0.     -73.9 FIXEDHF     0.800  0       0.0  0                       
 519    3N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 14p  
 520    3N 2D1525       -60.3     0.     -75.4 FIXEDHF     0.800  0       0.0  0                       
 521    3N 1E1525       -51.8     0.     -64.7 FIXEDHF     0.800  0       0.0  0                       
 522    3O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 15p  
 523    3O 2D1525       -53.4     0.     -66.7 FIXEDHF     0.800  0       0.0  0                       
 524    3O 1E1525       -45.8     0.     -57.2 FIXEDHF     0.800  0       0.0  0                       
 525    3a 2D1526        11.8     0.      14.8 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 4f   
 526    3a 1E1526       -17.2     0.     -21.5 FIXEDHF     0.800  0       0.0  0                       
 527    3b 2D1526        27.8     0.      34.7 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 5f   
 528    3b 1E1526       -16.7     0.     -20.9 FIXEDHF     0.800  0       0.0  0                       
 529    3c 2D1526        23.4     0.      29.3 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 6f   
 530    3c 1E1526       -14.6     0.     -18.3 FIXEDHF     0.800  0       0.0  0                       
 531    3d 2D1526        19.0     0.      23.7 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 7f   
 532    3d 1E1526       -12.6     0.     -15.8 FIXEDHF     0.800  0       0.0  0                       
 533    3e 2D1526        15.4     0.      19.3 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 8f   
 534    3e 1E1526       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0                       
 535    3f 2D1526        12.9     0.      16.1 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 9f   
 536    3f 1E1526        -9.5     0.     -11.9 FIXEDHF     0.800  0       0.0  0                       
 537    3g 2D1526        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 10f  
 538    3g 1E1526        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0                       
 539    3h 2D1526         9.4     0.      11.7 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 11f  
 540    3h 1E1526        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
 541    3i 2D1526         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 12f  
 542    3i 1E1526        -6.6     0.      -8.3 FIXEDHF     0.800  0       0.0  0                       
 543    3j 2D1526         7.2     0.       9.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 13f  
 544    3j 1E1526        -5.9     0.      -7.4 FIXEDHF     0.800  0       0.0  0                       
 545    3k 2D1526         7.2     0.       9.0 FIXEDHF     0.800  0       0.0  0  4s6p      -d9s2 14f  
 546    3k 1E1526        -5.9     0.      -7.4 FIXEDHF     0.800  0       0.0  0                       
 547    3x 1D2534      3242.7     0.    4053.4 FIXEDHF     0.800  0       0.0  0  4s6p      -4p5s      
 548    3x 0E2534      1050.7     0.    1313.4 FIXEDHF     0.800  0       0.0  0                       
 549    3y 0D2545       354.5     0.     443.1 FIXEDHF     0.800  0       0.0  0  4s6p      -5s5p      
 550    3y 1E2545       538.2     0.     672.7 FIXEDHF     0.800  0       0.0  0                       
 551    3z 1D1534      -759.4     0.    -949.2 FIXEDHF     0.800  0       0.0  0  4s6p      -d9 4s4p5s 
 552    3z 2E1534      -402.2     0.    -502.7 FIXEDHF     0.800  0       0.0  0                       
 553    45 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s8p      
 554    45 1E2525       341.9     0.     427.4 FIXEDHF     0.800  0       0.0  0                       
 555    46 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s9p      
 556    46 1E2525       266.9     0.     333.6 FIXEDHF     0.800  0       0.0  0                       
 557    47 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s10p     
 558    47 1E2525       216.0     0.     270.0 FIXEDHF     0.800  0       0.0  0                       
 559    48 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s11p     
 560    48 1E2525       179.5     0.     224.4 FIXEDHF     0.800  0       0.0  0                       
 561    49 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s12p     
 562    49 1E2525       152.3     0.     190.4 FIXEDHF     0.800  0       0.0  0                       
 563    4A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s13p     
 564    4A 1E2525       131.4     0.     164.3 FIXEDHF     0.800  0       0.0  0                       
 565    4B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s14p     
 566    4B 1E2525       114.9     0.     143.6 FIXEDHF     0.800  0       0.0  0                       
 567    4C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -4s15p     
 568    4C 1E2525       101.6     0.     127.0 FIXEDHF     0.800  0       0.0  0                       
 569    4D 2D1523      -972.0     0.   -1215.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 4p   
 570    4D 1E1523      -999.0     0.   -1248.7 FIXEDHF     0.800  0       0.0  0                       
 571    4E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 5p   
 572    4E 2D1525      -411.5     0.    -514.4 FIXEDHF     0.800  0       0.0  0                       
 573    4E 1E1525      -334.1     0.    -417.6 FIXEDHF     0.800  0       0.0  0                       
 574    4F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 6p   
 575    4F 2D1525      -258.2     0.    -322.7 FIXEDHF     0.800  0       0.0  0                       
 576    4F 1E1525      -200.9     0.    -251.1 FIXEDHF     0.800  0       0.0  0                       
 577    4G 2D1112       702.8     0.     878.5 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 7p   
 578    4G 2D1525      -181.8     0.    -227.3 FIXEDHF     0.800  0       0.0  0                       
 579    4G 1E1525      -139.0     0.    -173.8 FIXEDHF     0.800  0       0.0  0                       
 580    4H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 8p   
 581    4H 2D1525      -131.5     0.    -164.4 FIXEDHF     0.800  0       0.0  0                       
 582    4H 1E1525      -103.9     0.    -129.9 FIXEDHF     0.800  0       0.0  0                       
 583    4I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 9p   
 584    4I 2D1525      -101.8     0.    -127.2 FIXEDHF     0.800  0       0.0  0                       
 585    4I 1E1525       -81.5     0.    -101.9 FIXEDHF     0.800  0       0.0  0                       
 586    4J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 10p  
 587    4J 2D1525       -82.0     0.    -102.5 FIXEDHF     0.800  0       0.0  0                       
 588    4J 1E1525       -66.2     0.     -82.7 FIXEDHF     0.800  0       0.0  0                       
 589    4K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 11p  
 590    4K 2D1525       -67.9     0.     -84.9 FIXEDHF     0.800  0       0.0  0                       
 591    4K 1E1525       -55.1     0.     -68.9 FIXEDHF     0.800  0       0.0  0                       
 592    4L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 12p  
 593    4L 2D1525       -57.5     0.     -71.9 FIXEDHF     0.800  0       0.0  0                       
 594    4L 1E1525       -46.9     0.     -58.6 FIXEDHF     0.800  0       0.0  0                       
 595    4M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 13p  
 596    4M 2D1525       -49.6     0.     -62.0 FIXEDHF     0.800  0       0.0  0                       
 597    4M 1E1525       -40.6     0.     -50.7 FIXEDHF     0.800  0       0.0  0                       
 598    4N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 14p  
 599    4N 2D1525       -43.3     0.     -54.1 FIXEDHF     0.800  0       0.0  0                       
 600    4N 1E1525       -35.4     0.     -44.3 FIXEDHF     0.800  0       0.0  0                       
 601    4O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 15p  
 602    4O 2D1525       -38.2     0.     -47.8 FIXEDHF     0.800  0       0.0  0                       
 603    4O 1E1525       -31.4     0.     -39.3 FIXEDHF     0.800  0       0.0  0                       
 604    4a 2D1526         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 4f   
 605    4a 1E1526       -11.7     0.     -14.6 FIXEDHF     0.800  0       0.0  0                       
 606    4b 2D1526         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 5f   
 607    4b 1E1526       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0                       
 608    4c 2D1526        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 6f   
 609    4c 1E1526        -9.9     0.     -12.4 FIXEDHF     0.800  0       0.0  0                       
 610    4d 2D1526        10.1     0.      12.6 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 7f   
 611    4d 1E1526        -8.6     0.     -10.7 FIXEDHF     0.800  0       0.0  0                       
 612    4e 2D1526         8.8     0.      11.0 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 8f   
 613    4e 1E1526        -7.4     0.      -9.3 FIXEDHF     0.800  0       0.0  0                       
 614    4f 2D1526         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 9f   
 615    4f 1E1526        -6.5     0.      -8.1 FIXEDHF     0.800  0       0.0  0                       
 616    4g 2D1526         6.6     0.       8.2 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 10f  
 617    4g 1E1526        -5.7     0.      -7.1 FIXEDHF     0.800  0       0.0  0                       
 618    4h 2D1526         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 11f  
 619    4h 1E1526        -5.0     0.      -6.3 FIXEDHF     0.800  0       0.0  0                       
 620    4i 2D1526         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 12f  
 621    4i 1E1526        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0                       
 622    4j 2D1526         4.5     0.       5.6 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 13f  
 623    4j 1E1526        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
 624    4k 2D1526         4.5     0.       5.6 FIXEDHF     0.800  0       0.0  0  4s7p      -d9s2 14f  
 625    4k 1E1526        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
 626    4x 1D2534      2201.5     0.    2751.9 FIXEDHF     0.800  0       0.0  0  4s7p      -4p5s      
 627    4x 0E2534       713.0     0.     891.3 FIXEDHF     0.800  0       0.0  0                       
 628    4y 0D2545       251.2     0.     314.0 FIXEDHF     0.800  0       0.0  0  4s7p      -5s5p      
 629    4y 1E2545       389.4     0.     486.8 FIXEDHF     0.800  0       0.0  0                       
 630    4z 1D1534      -522.7     0.    -653.4 FIXEDHF     0.800  0       0.0  0  4s7p      -d9 4s4p5s 
 631    4z 2E1534      -277.5     0.    -346.9 FIXEDHF     0.800  0       0.0  0                       
 632    56 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s9p      
 633    56 1E2525       197.9     0.     247.4 FIXEDHF     0.800  0       0.0  0                       
 634    57 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s10p     
 635    57 1E2525       160.2     0.     200.3 FIXEDHF     0.800  0       0.0  0                       
 636    58 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s11p     
 637    58 1E2525       133.2     0.     166.5 FIXEDHF     0.800  0       0.0  0                       
 638    59 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s12p     
 639    59 1E2525       113.0     0.     141.3 FIXEDHF     0.800  0       0.0  0                       
 640    5A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s13p     
 641    5A 1E2525        97.5     0.     121.9 FIXEDHF     0.800  0       0.0  0                       
 642    5B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s14p     
 643    5B 1E2525        85.2     0.     106.5 FIXEDHF     0.800  0       0.0  0                       
 644    5C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4s15p     
 645    5C 1E2525        75.4     0.      94.2 FIXEDHF     0.800  0       0.0  0                       
 646    5D 2D1523      -718.6     0.    -898.3 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 4p   
 647    5D 1E1523      -739.8     0.    -924.7 FIXEDHF     0.800  0       0.0  0                       
 648    5E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 5p   
 649    5E 2D1525      -304.3     0.    -380.4 FIXEDHF     0.800  0       0.0  0                       
 650    5E 1E1525      -248.0     0.    -310.0 FIXEDHF     0.800  0       0.0  0                       
 651    5F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 6p   
 652    5F 2D1525      -190.9     0.    -238.6 FIXEDHF     0.800  0       0.0  0                       
 653    5F 1E1525      -149.2     0.    -186.5 FIXEDHF     0.800  0       0.0  0                       
 654    5G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 7p   
 655    5G 2D1525      -134.1     0.    -167.6 FIXEDHF     0.800  0       0.0  0                       
 656    5G 1E1525      -103.3     0.    -129.1 FIXEDHF     0.800  0       0.0  0                       
 657    5H 2D1112       704.2     0.     880.2 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 8p   
 658    5H 2D1525      -101.0     0.    -126.2 FIXEDHF     0.800  0       0.0  0                       
 659    5H 1E1525       -77.1     0.     -96.4 FIXEDHF     0.800  0       0.0  0                       
 660    5I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 9p   
 661    5I 2D1525       -77.7     0.     -97.1 FIXEDHF     0.800  0       0.0  0                       
 662    5I 1E1525       -60.6     0.     -75.7 FIXEDHF     0.800  0       0.0  0                       
 663    5J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 10p  
 664    5J 2D1525       -62.5     0.     -78.1 FIXEDHF     0.800  0       0.0  0                       
 665    5J 1E1525       -49.2     0.     -61.5 FIXEDHF     0.800  0       0.0  0                       
 666    5K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 11p  
 667    5K 2D1525       -51.8     0.     -64.7 FIXEDHF     0.800  0       0.0  0                       
 668    5K 1E1525       -41.0     0.     -51.2 FIXEDHF     0.800  0       0.0  0                       
 669    5L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 12p  
 670    5L 2D1525       -43.8     0.     -54.8 FIXEDHF     0.800  0       0.0  0                       
 671    5L 1E1525       -34.8     0.     -43.5 FIXEDHF     0.800  0       0.0  0                       
 672    5M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 13p  
 673    5M 2D1525       -37.8     0.     -47.2 FIXEDHF     0.800  0       0.0  0                       
 674    5M 1E1525       -30.1     0.     -37.6 FIXEDHF     0.800  0       0.0  0                       
 675    5N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 14p  
 676    5N 2D1525       -33.0     0.     -41.2 FIXEDHF     0.800  0       0.0  0                       
 677    5N 1E1525       -26.3     0.     -32.9 FIXEDHF     0.800  0       0.0  0                       
 678    5O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 15p  
 679    5O 2D1525       -29.1     0.     -36.4 FIXEDHF     0.800  0       0.0  0                       
 680    5O 1E1525       -23.4     0.     -29.2 FIXEDHF     0.800  0       0.0  0                       
 681    5a 2D1526         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 4f   
 682    5a 1E1526        -8.6     0.     -10.8 FIXEDHF     0.800  0       0.0  0                       
 683    5b 2D1526         5.4     0.       6.8 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 5f   
 684    5b 1E1526        -8.4     0.     -10.5 FIXEDHF     0.800  0       0.0  0                       
 685    5c 2D1526         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 6f   
 686    5c 1E1526        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
 687    5d 2D1526         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 7f   
 688    5d 1E1526        -6.3     0.      -7.9 FIXEDHF     0.800  0       0.0  0                       
 689    5e 2D1526         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 8f   
 690    5e 1E1526        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0                       
 691    5f 2D1526         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 9f   
 692    5f 1E1526        -4.8     0.      -6.0 FIXEDHF     0.800  0       0.0  0                       
 693    5g 2D1526         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 10f  
 694    5g 1E1526        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0                       
 695    5h 2D1526         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 11f  
 696    5h 1E1526        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
 697    5i 2D1526         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 12f  
 698    5i 1E1526        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
 699    5j 2D1526         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 13f  
 700    5j 1E1526        -3.0     0.      -3.7 FIXEDHF     0.800  0       0.0  0                       
 701    5k 2D1526         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0  4s8p      -d9s2 14f  
 702    5k 1E1526        -3.0     0.      -3.7 FIXEDHF     0.800  0       0.0  0                       
 703    5x 1D2534      1629.6     0.    2037.0 FIXEDHF     0.800  0       0.0  0  4s8p      -4p5s      
 704    5x 0E2534       526.4     0.     658.0 FIXEDHF     0.800  0       0.0  0                       
 705    5y 0D2545       189.1     0.     236.4 FIXEDHF     0.800  0       0.0  0  4s8p      -5s5p      
 706    5y 1E2545       297.3     0.     371.6 FIXEDHF     0.800  0       0.0  0                       
 707    5z 1D1534      -389.6     0.    -487.0 FIXEDHF     0.800  0       0.0  0  4s8p      -d9 4s4p5s 
 708    5z 2E1534      -206.9     0.    -258.6 FIXEDHF     0.800  0       0.0  0                       
 709    67 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s10p     
 710    67 1E2525       125.1     0.     156.4 FIXEDHF     0.800  0       0.0  0                       
 711    68 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s11p     
 712    68 1E2525       104.0     0.     130.0 FIXEDHF     0.800  0       0.0  0                       
 713    69 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s12p     
 714    69 1E2525        88.2     0.     110.3 FIXEDHF     0.800  0       0.0  0                       
 715    6A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s13p     
 716    6A 1E2525        76.2     0.      95.2 FIXEDHF     0.800  0       0.0  0                       
 717    6B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s14p     
 718    6B 1E2525        66.6     0.      83.2 FIXEDHF     0.800  0       0.0  0                       
 719    6C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -4s15p     
 720    6C 1E2525        58.9     0.      73.6 FIXEDHF     0.800  0       0.0  0                       
 721    6D 2D1523      -560.1     0.    -700.1 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 4p   
 722    6D 1E1523      -577.1     0.    -721.4 FIXEDHF     0.800  0       0.0  0                       
 723    6E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 5p   
 724    6E 2D1525      -237.3     0.    -296.6 FIXEDHF     0.800  0       0.0  0                       
 725    6E 1E1525      -193.8     0.    -242.2 FIXEDHF     0.800  0       0.0  0                       
 726    6F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 6p   
 727    6F 2D1525      -148.9     0.    -186.1 FIXEDHF     0.800  0       0.0  0                       
 728    6F 1E1525      -116.6     0.    -145.7 FIXEDHF     0.800  0       0.0  0                       
 729    6G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 7p   
 730    6G 2D1525      -104.6     0.    -130.7 FIXEDHF     0.800  0       0.0  0                       
 731    6G 1E1525       -80.7     0.    -100.9 FIXEDHF     0.800  0       0.0  0                       
 732    6H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 8p   
 733    6H 2D1525       -78.6     0.     -98.3 FIXEDHF     0.800  0       0.0  0                       
 734    6H 1E1525       -60.3     0.     -75.4 FIXEDHF     0.800  0       0.0  0                       
 735    6I 2D1112       704.8     0.     881.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 9p   
 736    6I 2D1525       -61.9     0.     -77.4 FIXEDHF     0.800  0       0.0  0                       
 737    6I 1E1525       -47.3     0.     -59.1 FIXEDHF     0.800  0       0.0  0                       
 738    6J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 10p  
 739    6J 2D1525       -49.6     0.     -62.0 FIXEDHF     0.800  0       0.0  0                       
 740    6J 1E1525       -38.4     0.     -48.0 FIXEDHF     0.800  0       0.0  0                       
 741    6K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 11p  
 742    6K 2D1525       -41.1     0.     -51.4 FIXEDHF     0.800  0       0.0  0                       
 743    6K 1E1525       -32.0     0.     -40.0 FIXEDHF     0.800  0       0.0  0                       
 744    6L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 12p  
 745    6L 2D1525       -34.8     0.     -43.5 FIXEDHF     0.800  0       0.0  0                       
 746    6L 1E1525       -27.2     0.     -34.0 FIXEDHF     0.800  0       0.0  0                       
 747    6M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 13p  
 748    6M 2D1525       -29.9     0.     -37.4 FIXEDHF     0.800  0       0.0  0                       
 749    6M 1E1525       -23.5     0.     -29.4 FIXEDHF     0.800  0       0.0  0                       
 750    6N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 14p  
 751    6N 2D1525       -26.2     0.     -32.7 FIXEDHF     0.800  0       0.0  0                       
 752    6N 1E1525       -20.6     0.     -25.8 FIXEDHF     0.800  0       0.0  0                       
 753    6O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 15p  
 754    6O 2D1525       -23.1     0.     -28.9 FIXEDHF     0.800  0       0.0  0                       
 755    6O 1E1525       -18.2     0.     -22.8 FIXEDHF     0.800  0       0.0  0                       
 756    6a 2D1526         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 4f   
 757    6a 1E1526        -6.7     0.      -8.4 FIXEDHF     0.800  0       0.0  0                       
 758    6b 2D1526         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 5f   
 759    6b 1E1526        -6.6     0.      -8.2 FIXEDHF     0.800  0       0.0  0                       
 760    6c 2D1526         3.6     0.       4.5 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 6f   
 761    6c 1E1526        -5.8     0.      -7.2 FIXEDHF     0.800  0       0.0  0                       
 762    6d 2D1526         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 7f   
 763    6d 1E1526        -5.0     0.      -6.2 FIXEDHF     0.800  0       0.0  0                       
 764    6e 2D1526         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 8f   
 765    6e 1E1526        -4.2     0.      -5.3 FIXEDHF     0.800  0       0.0  0                       
 766    6f 2D1526         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 9f   
 767    6f 1E1526        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
 768    6g 2D1526         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 10f  
 769    6g 1E1526        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0                       
 770    6h 2D1526         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 11f  
 771    6h 1E1526        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
 772    6i 2D1526         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 12f  
 773    6i 1E1526        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
 774    6j 2D1526         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 13f  
 775    6j 1E1526        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
 776    6k 2D1526         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0  4s9p      -d9s2 14f  
 777    6k 1E1526        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
 778    6x 1D2534      1272.1     0.    1590.1 FIXEDHF     0.800  0       0.0  0  4s9p      -4p5s      
 779    6x 0E2534       409.8     0.     512.2 FIXEDHF     0.800  0       0.0  0                       
 780    6y 0D2545       148.9     0.     186.1 FIXEDHF     0.800  0       0.0  0  4s9p      -5s5p      
 781    6y 1E2545       236.2     0.     295.2 FIXEDHF     0.800  0       0.0  0                       
 782    6z 1D1534      -305.4     0.    -381.7 FIXEDHF     0.800  0       0.0  0  4s9p      -d9 4s4p5s 
 783    6z 2E1534      -162.1     0.    -202.6 FIXEDHF     0.800  0       0.0  0                       
 784    78 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s11p     
 785    78 1E2525        84.2     0.     105.2 FIXEDHF     0.800  0       0.0  0                       
 786    79 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s12p     
 787    79 1E2525        71.4     0.      89.3 FIXEDHF     0.800  0       0.0  0                       
 788    7A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s13p     
 789    7A 1E2525        61.6     0.      77.0 FIXEDHF     0.800  0       0.0  0                       
 790    7B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s14p     
 791    7B 1E2525        53.8     0.      67.3 FIXEDHF     0.800  0       0.0  0                       
 792    7C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -4s15p     
 793    7C 1E2525        47.6     0.      59.5 FIXEDHF     0.800  0       0.0  0                       
 794    7D 2D1523      -452.8     0.    -566.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 4p   
 795    7D 1E1523      -466.9     0.    -583.6 FIXEDHF     0.800  0       0.0  0                       
 796    7E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 5p   
 797    7E 2D1525      -191.9     0.    -239.9 FIXEDHF     0.800  0       0.0  0                       
 798    7E 1E1525      -156.9     0.    -196.1 FIXEDHF     0.800  0       0.0  0                       
 799    7F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 6p   
 800    7F 2D1525      -120.5     0.    -150.6 FIXEDHF     0.800  0       0.0  0                       
 801    7F 1E1525       -94.4     0.    -118.0 FIXEDHF     0.800  0       0.0  0                       
 802    7G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 7p   
 803    7G 2D1525       -84.6     0.    -105.8 FIXEDHF     0.800  0       0.0  0                       
 804    7G 1E1525       -65.4     0.     -81.7 FIXEDHF     0.800  0       0.0  0                       
 805    7H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 8p   
 806    7H 2D1525       -63.6     0.     -79.5 FIXEDHF     0.800  0       0.0  0                       
 807    7H 1E1525       -48.8     0.     -61.0 FIXEDHF     0.800  0       0.0  0                       
 808    7I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 9p   
 809    7I 2D1525       -50.1     0.     -62.6 FIXEDHF     0.800  0       0.0  0                       
 810    7I 1E1525       -38.3     0.     -47.9 FIXEDHF     0.800  0       0.0  0                       
 811    7J 2D1112       705.2     0.     881.5 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 10p  
 812    7J 2D1525       -40.7     0.     -50.9 FIXEDHF     0.800  0       0.0  0                       
 813    7J 1E1525       -31.1     0.     -38.9 FIXEDHF     0.800  0       0.0  0                       
 814    7K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 11p  
 815    7K 2D1525       -33.6     0.     -42.0 FIXEDHF     0.800  0       0.0  0                       
 816    7K 1E1525       -25.9     0.     -32.4 FIXEDHF     0.800  0       0.0  0                       
 817    7L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 12p  
 818    7L 2D1525       -28.5     0.     -35.6 FIXEDHF     0.800  0       0.0  0                       
 819    7L 1E1525       -22.1     0.     -27.6 FIXEDHF     0.800  0       0.0  0                       
 820    7M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 13p  
 821    7M 2D1525       -24.5     0.     -30.6 FIXEDHF     0.800  0       0.0  0                       
 822    7M 1E1525       -19.0     0.     -23.8 FIXEDHF     0.800  0       0.0  0                       
 823    7N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 14p  
 824    7N 2D1525       -21.4     0.     -26.8 FIXEDHF     0.800  0       0.0  0                       
 825    7N 1E1525       -16.7     0.     -20.9 FIXEDHF     0.800  0       0.0  0                       
 826    7O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 15p  
 827    7O 2D1525       -18.9     0.     -23.6 FIXEDHF     0.800  0       0.0  0                       
 828    7O 1E1525       -14.8     0.     -18.5 FIXEDHF     0.800  0       0.0  0                       
 829    7a 2D1526         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 4f   
 830    7a 1E1526        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0                       
 831    7b 2D1526         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 5f   
 832    7b 1E1526        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
 833    7c 2D1526         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 6f   
 834    7c 1E1526        -4.6     0.      -5.8 FIXEDHF     0.800  0       0.0  0                       
 835    7d 2D1526         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 7f   
 836    7d 1E1526        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
 837    7e 2D1526         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 8f   
 838    7e 1E1526        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0                       
 839    7f 2D1526         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 9f   
 840    7f 1E1526        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
 841    7g 2D1526         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 10f  
 842    7g 1E1526        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
 843    7h 2D1526         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 11f  
 844    7h 1E1526        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
 845    7i 2D1526         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 12f  
 846    7i 1E1526        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
 847    7j 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 13f  
 848    7j 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
 849    7k 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s10p     -d9s2 14f  
 850    7k 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
 851    7x 1D2534      1030.0     0.    1287.5 FIXEDHF     0.800  0       0.0  0  4s10p     -4p5s      
 852    7x 0E2534       331.0     0.     413.7 FIXEDHF     0.800  0       0.0  0                       
 853    7y 0D2545       121.1     0.     151.4 FIXEDHF     0.800  0       0.0  0  4s10p     -5s5p      
 854    7y 1E2545       193.4     0.     241.7 FIXEDHF     0.800  0       0.0  0                       
 855    7z 1D1534      -247.9     0.    -309.9 FIXEDHF     0.800  0       0.0  0  4s10p     -d9 4s4p5s 
 856    7z 2E1534      -131.4     0.    -164.3 FIXEDHF     0.800  0       0.0  0                       
 857    89 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4s12p     
 858    89 1E2525        59.4     0.      74.2 FIXEDHF     0.800  0       0.0  0                       
 859    8A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4s13p     
 860    8A 1E2525        51.2     0.      64.0 FIXEDHF     0.800  0       0.0  0                       
 861    8B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4s14p     
 862    8B 1E2525        44.8     0.      56.0 FIXEDHF     0.800  0       0.0  0                       
 863    8C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -4s15p     
 864    8C 1E2525        39.6     0.      49.5 FIXEDHF     0.800  0       0.0  0                       
 865    8D 2D1523      -376.1     0.    -470.1 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 4p   
 866    8D 1E1523      -388.0     0.    -485.0 FIXEDHF     0.800  0       0.0  0                       
 867    8E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 5p   
 868    8E 2D1525      -159.5     0.    -199.4 FIXEDHF     0.800  0       0.0  0                       
 869    8E 1E1525      -130.5     0.    -163.1 FIXEDHF     0.800  0       0.0  0                       
 870    8F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 6p   
 871    8F 2D1525      -100.2     0.    -125.2 FIXEDHF     0.800  0       0.0  0                       
 872    8F 1E1525       -78.6     0.     -98.2 FIXEDHF     0.800  0       0.0  0                       
 873    8G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 7p   
 874    8G 2D1525       -70.4     0.     -88.0 FIXEDHF     0.800  0       0.0  0                       
 875    8G 1E1525       -54.4     0.     -68.0 FIXEDHF     0.800  0       0.0  0                       
 876    8H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 8p   
 877    8H 2D1525       -52.9     0.     -66.1 FIXEDHF     0.800  0       0.0  0                       
 878    8H 1E1525       -40.6     0.     -50.8 FIXEDHF     0.800  0       0.0  0                       
 879    8I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 9p   
 880    8I 2D1525       -41.6     0.     -52.0 FIXEDHF     0.800  0       0.0  0                       
 881    8I 1E1525       -31.8     0.     -39.8 FIXEDHF     0.800  0       0.0  0                       
 882    8J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 10p  
 883    8J 2D1525       -33.8     0.     -42.3 FIXEDHF     0.800  0       0.0  0                       
 884    8J 1E1525       -25.9     0.     -32.4 FIXEDHF     0.800  0       0.0  0                       
 885    8K 2D1112       705.4     0.     881.8 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 11p  
 886    8K 2D1525       -28.2     0.     -35.3 FIXEDHF     0.800  0       0.0  0                       
 887    8K 1E1525       -21.6     0.     -27.0 FIXEDHF     0.800  0       0.0  0                       
 888    8L 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 12p  
 889    8L 2D1525       -23.8     0.     -29.8 FIXEDHF     0.800  0       0.0  0                       
 890    8L 1E1525       -18.3     0.     -22.9 FIXEDHF     0.800  0       0.0  0                       
 891    8M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 13p  
 892    8M 2D1525       -20.6     0.     -25.7 FIXEDHF     0.800  0       0.0  0                       
 893    8M 1E1525       -15.8     0.     -19.8 FIXEDHF     0.800  0       0.0  0                       
 894    8N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 14p  
 895    8N 2D1525       -17.9     0.     -22.4 FIXEDHF     0.800  0       0.0  0                       
 896    8N 1E1525       -13.9     0.     -17.4 FIXEDHF     0.800  0       0.0  0                       
 897    8O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 15p  
 898    8O 2D1525       -15.8     0.     -19.8 FIXEDHF     0.800  0       0.0  0                       
 899    8O 1E1525       -12.3     0.     -15.4 FIXEDHF     0.800  0       0.0  0                       
 900    8a 2D1526         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 4f   
 901    8a 1E1526        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
 902    8b 2D1526         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 5f   
 903    8b 1E1526        -4.4     0.      -5.5 FIXEDHF     0.800  0       0.0  0                       
 904    8c 2D1526         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 6f   
 905    8c 1E1526        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
 906    8d 2D1526         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 7f   
 907    8d 1E1526        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
 908    8e 2D1526         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 8f   
 909    8e 1E1526        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
 910    8f 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 9f   
 911    8f 1E1526        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
 912    8g 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 10f  
 913    8g 1E1526        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
 914    8h 2D1526         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 11f  
 915    8h 1E1526        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
 916    8i 2D1526         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 12f  
 917    8i 1E1526        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
 918    8j 2D1526         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 13f  
 919    8j 1E1526        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
 920    8k 2D1526         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  4s11p     -d9s2 14f  
 921    8k 1E1526        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
 922    8x 1D2534       856.6     0.    1070.8 FIXEDHF     0.800  0       0.0  0  4s11p     -4p5s      
 923    8x 0E2534       274.7     0.     343.4 FIXEDHF     0.800  0       0.0  0                       
 924    8y 0D2545       101.0     0.     126.2 FIXEDHF     0.800  0       0.0  0  4s11p     -5s5p      
 925    8y 1E2545       162.0     0.     202.5 FIXEDHF     0.800  0       0.0  0                       
 926    8z 1D1534      -206.6     0.    -258.2 FIXEDHF     0.800  0       0.0  0  4s11p     -d9 4s4p5s 
 927    8z 2E1534      -109.4     0.    -136.8 FIXEDHF     0.800  0       0.0  0                       
 928    9A 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -4s13p     
 929    9A 1E2525        43.4     0.      54.3 FIXEDHF     0.800  0       0.0  0                       
 930    9B 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -4s14p     
 931    9B 1E2525        38.0     0.      47.5 FIXEDHF     0.800  0       0.0  0                       
 932    9C 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -4s15p     
 933    9C 1E2525        33.6     0.      42.0 FIXEDHF     0.800  0       0.0  0                       
 934    9D 2D1523      -318.9     0.    -398.6 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 4p   
 935    9D 1E1523      -329.1     0.    -411.4 FIXEDHF     0.800  0       0.0  0                       
 936    9E 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 5p   
 937    9E 2D1525      -135.4     0.    -169.2 FIXEDHF     0.800  0       0.0  0                       
 938    9E 1E1525      -110.7     0.    -138.4 FIXEDHF     0.800  0       0.0  0                       
 939    9F 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 6p   
 940    9F 2D1525       -85.0     0.    -106.3 FIXEDHF     0.800  0       0.0  0                       
 941    9F 1E1525       -66.6     0.     -83.3 FIXEDHF     0.800  0       0.0  0                       
 942    9G 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 7p   
 943    9G 2D1525       -59.8     0.     -74.7 FIXEDHF     0.800  0       0.0  0                       
 944    9G 1E1525       -46.2     0.     -57.7 FIXEDHF     0.800  0       0.0  0                       
 945    9H 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 8p   
 946    9H 2D1525       -44.9     0.     -56.1 FIXEDHF     0.800  0       0.0  0                       
 947    9H 1E1525       -34.5     0.     -43.1 FIXEDHF     0.800  0       0.0  0                       
 948    9I 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 9p   
 949    9I 2D1525       -35.4     0.     -44.2 FIXEDHF     0.800  0       0.0  0                       
 950    9I 1E1525       -27.0     0.     -33.8 FIXEDHF     0.800  0       0.0  0                       
 951    9J 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 10p  
 952    9J 2D1525       -28.7     0.     -35.9 FIXEDHF     0.800  0       0.0  0                       
 953    9J 1E1525       -22.0     0.     -27.5 FIXEDHF     0.800  0       0.0  0                       
 954    9K 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 11p  
 955    9K 2D1525       -24.0     0.     -30.0 FIXEDHF     0.800  0       0.0  0                       
 956    9K 1E1525       -18.3     0.     -22.9 FIXEDHF     0.800  0       0.0  0                       
 957    9L 2D1112       705.6     0.     882.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 12p  
 958    9L 2D1525       -20.4     0.     -25.5 FIXEDHF     0.800  0       0.0  0                       
 959    9L 1E1525       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
 960    9M 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 13p  
 961    9M 2D1525       -17.5     0.     -21.9 FIXEDHF     0.800  0       0.0  0                       
 962    9M 1E1525       -13.4     0.     -16.8 FIXEDHF     0.800  0       0.0  0                       
 963    9N 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 14p  
 964    9N 2D1525       -15.3     0.     -19.1 FIXEDHF     0.800  0       0.0  0                       
 965    9N 1E1525       -11.8     0.     -14.7 FIXEDHF     0.800  0       0.0  0                       
 966    9O 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 15p  
 967    9O 2D1525       -13.5     0.     -16.9 FIXEDHF     0.800  0       0.0  0                       
 968    9O 1E1525       -10.4     0.     -13.0 FIXEDHF     0.800  0       0.0  0                       
 969    9a 2D1526         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 4f   
 970    9a 1E1526        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0                       
 971    9b 2D1526         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 5f   
 972    9b 1E1526        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
 973    9c 2D1526         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 6f   
 974    9c 1E1526        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0                       
 975    9d 2D1526         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 7f   
 976    9d 1E1526        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
 977    9e 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 8f   
 978    9e 1E1526        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
 979    9f 2D1526         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 9f   
 980    9f 1E1526        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
 981    9g 2D1526         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 10f  
 982    9g 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
 983    9h 2D1526         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 11f  
 984    9h 1E1526        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
 985    9i 2D1526         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 12f  
 986    9i 1E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
 987    9j 2D1526         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 13f  
 988    9j 1E1526        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
 989    9k 2D1526         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  4s12p     -d9s2 14f  
 990    9k 1E1526        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
 991    9x 1D2534       727.4     0.     909.2 FIXEDHF     0.800  0       0.0  0  4s12p     -4p5s      
 992    9x 0E2534       232.8     0.     291.0 FIXEDHF     0.800  0       0.0  0                       
 993    9y 0D2545        85.9     0.     107.4 FIXEDHF     0.800  0       0.0  0  4s12p     -5s5p      
 994    9y 1E2545       138.3     0.     172.9 FIXEDHF     0.800  0       0.0  0                       
 995    9z 1D1534      -175.6     0.    -219.5 FIXEDHF     0.800  0       0.0  0  4s12p     -d9 4s4p5s 
 996    9z 2E1534       -93.0     0.    -116.2 FIXEDHF     0.800  0       0.0  0                       
 997    AB 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -4s14p     
 998    AB 1E2525        32.8     0.      41.0 FIXEDHF     0.800  0       0.0  0                       
 999    AC 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -4s15p     
1000    AC 1E2525        29.0     0.      36.2 FIXEDHF     0.800  0       0.0  0                       
1001    AD 2D1523      -275.0     0.    -343.7 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 4p   
1002    AD 1E1523      -283.8     0.    -354.8 FIXEDHF     0.800  0       0.0  0                       
1003    AE 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 5p   
1004    AE 2D1525      -116.7     0.    -145.9 FIXEDHF     0.800  0       0.0  0                       
1005    AE 1E1525       -95.6     0.    -119.5 FIXEDHF     0.800  0       0.0  0                       
1006    AF 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 6p   
1007    AF 2D1525       -73.4     0.     -91.7 FIXEDHF     0.800  0       0.0  0                       
1008    AF 1E1525       -57.5     0.     -71.9 FIXEDHF     0.800  0       0.0  0                       
1009    AG 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 7p   
1010    AG 2D1525       -51.5     0.     -64.4 FIXEDHF     0.800  0       0.0  0                       
1011    AG 1E1525       -39.8     0.     -49.8 FIXEDHF     0.800  0       0.0  0                       
1012    AH 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 8p   
1013    AH 2D1525       -38.8     0.     -48.5 FIXEDHF     0.800  0       0.0  0                       
1014    AH 1E1525       -29.8     0.     -37.2 FIXEDHF     0.800  0       0.0  0                       
1015    AI 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 9p   
1016    AI 2D1525       -30.5     0.     -38.1 FIXEDHF     0.800  0       0.0  0                       
1017    AI 1E1525       -23.4     0.     -29.2 FIXEDHF     0.800  0       0.0  0                       
1018    AJ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 10p  
1019    AJ 2D1525       -24.8     0.     -31.0 FIXEDHF     0.800  0       0.0  0                       
1020    AJ 1E1525       -19.0     0.     -23.7 FIXEDHF     0.800  0       0.0  0                       
1021    AK 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 11p  
1022    AK 2D1525       -20.7     0.     -25.9 FIXEDHF     0.800  0       0.0  0                       
1023    AK 1E1525       -15.8     0.     -19.8 FIXEDHF     0.800  0       0.0  0                       
1024    AL 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 12p  
1025    AL 2D1525       -17.6     0.     -22.0 FIXEDHF     0.800  0       0.0  0                       
1026    AL 1E1525       -13.4     0.     -16.8 FIXEDHF     0.800  0       0.0  0                       
1027    AM 2D1112       705.7     0.     882.1 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 13p  
1028    AM 2D1525       -15.2     0.     -19.0 FIXEDHF     0.800  0       0.0  0                       
1029    AM 1E1525       -11.6     0.     -14.5 FIXEDHF     0.800  0       0.0  0                       
1030    AN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 14p  
1031    AN 2D1525       -13.3     0.     -16.6 FIXEDHF     0.800  0       0.0  0                       
1032    AN 1E1525       -10.2     0.     -12.7 FIXEDHF     0.800  0       0.0  0                       
1033    AO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 15p  
1034    AO 2D1525       -11.7     0.     -14.6 FIXEDHF     0.800  0       0.0  0                       
1035    AO 1E1525        -9.0     0.     -11.3 FIXEDHF     0.800  0       0.0  0                       
1036    Aa 2D1526         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 4f   
1037    Aa 1E1526        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0                       
1038    Ab 2D1526         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 5f   
1039    Ab 1E1526        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0                       
1040    Ac 2D1526         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 6f   
1041    Ac 1E1526        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
1042    Ad 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 7f   
1043    Ad 1E1526        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
1044    Ae 2D1526         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 8f   
1045    Ae 1E1526        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
1046    Af 2D1526         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 9f   
1047    Af 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1048    Ag 2D1526         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 10f  
1049    Ag 1E1526        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1050    Ah 2D1526         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 11f  
1051    Ah 1E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1052    Ai 2D1526         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 12f  
1053    Ai 1E1526        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
1054    Aj 2D1526         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 13f  
1055    Aj 1E1526        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1056    Ak 2D1526         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  4s13p     -d9s2 14f  
1057    Ak 1E1526        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1058    Ax 1D2534       627.8     0.     784.8 FIXEDHF     0.800  0       0.0  0  4s13p     -4p5s      
1059    Ax 0E2534       200.7     0.     250.9 FIXEDHF     0.800  0       0.0  0                       
1060    Ay 0D2545        74.2     0.      92.8 FIXEDHF     0.800  0       0.0  0  4s13p     -5s5p      
1061    Ay 1E2545       119.8     0.     149.8 FIXEDHF     0.800  0       0.0  0                       
1062    Az 1D1534      -151.8     0.    -189.7 FIXEDHF     0.800  0       0.0  0  4s13p     -d9 4s4p5s 
1063    Az 2E1534       -80.2     0.    -100.3 FIXEDHF     0.800  0       0.0  0                       
1064    BC 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -4s15p     
1065    BC 1E2525        25.4     0.      31.7 FIXEDHF     0.800  0       0.0  0                       
1066    BD 2D1523      -240.3     0.    -300.4 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 4p   
1067    BD 1E1523      -248.2     0.    -310.2 FIXEDHF     0.800  0       0.0  0                       
1068    BE 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 5p   
1069    BE 2D1525      -102.1     0.    -127.6 FIXEDHF     0.800  0       0.0  0                       
1070    BE 1E1525       -83.6     0.    -104.5 FIXEDHF     0.800  0       0.0  0                       
1071    BF 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 6p   
1072    BF 2D1525       -64.2     0.     -80.2 FIXEDHF     0.800  0       0.0  0                       
1073    BF 1E1525       -50.3     0.     -62.9 FIXEDHF     0.800  0       0.0  0                       
1074    BG 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 7p   
1075    BG 2D1525       -45.1     0.     -56.4 FIXEDHF     0.800  0       0.0  0                       
1076    BG 1E1525       -34.8     0.     -43.5 FIXEDHF     0.800  0       0.0  0                       
1077    BH 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 8p   
1078    BH 2D1525       -33.9     0.     -42.4 FIXEDHF     0.800  0       0.0  0                       
1079    BH 1E1525       -26.0     0.     -32.5 FIXEDHF     0.800  0       0.0  0                       
1080    BI 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 9p   
1081    BI 2D1525       -26.6     0.     -33.3 FIXEDHF     0.800  0       0.0  0                       
1082    BI 1E1525       -20.4     0.     -25.5 FIXEDHF     0.800  0       0.0  0                       
1083    BJ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 10p  
1084    BJ 2D1525       -21.7     0.     -27.1 FIXEDHF     0.800  0       0.0  0                       
1085    BJ 1E1525       -16.6     0.     -20.7 FIXEDHF     0.800  0       0.0  0                       
1086    BK 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 11p  
1087    BK 2D1525       -18.1     0.     -22.6 FIXEDHF     0.800  0       0.0  0                       
1088    BK 1E1525       -13.8     0.     -17.3 FIXEDHF     0.800  0       0.0  0                       
1089    BL 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 12p  
1090    BL 2D1525       -15.4     0.     -19.2 FIXEDHF     0.800  0       0.0  0                       
1091    BL 1E1525       -11.8     0.     -14.7 FIXEDHF     0.800  0       0.0  0                       
1092    BM 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 13p  
1093    BM 2D1525       -13.3     0.     -16.6 FIXEDHF     0.800  0       0.0  0                       
1094    BM 1E1525       -10.2     0.     -12.7 FIXEDHF     0.800  0       0.0  0                       
1095    BN 2D1112       705.7     0.     882.1 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 14p  
1096    BN 2D1525       -11.7     0.     -14.6 FIXEDHF     0.800  0       0.0  0                       
1097    BN 1E1525        -8.9     0.     -11.1 FIXEDHF     0.800  0       0.0  0                       
1098    BO 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 15p  
1099    BO 2D1525       -10.3     0.     -12.9 FIXEDHF     0.800  0       0.0  0                       
1100    BO 1E1525        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
1101    Ba 2D1526         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 4f   
1102    Ba 1E1526        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
1103    Bb 2D1526         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 5f   
1104    Bb 1E1526        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
1105    Bc 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 6f   
1106    Bc 1E1526        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1107    Bd 2D1526         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 7f   
1108    Bd 1E1526        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1109    Be 2D1526         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 8f   
1110    Be 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1111    Bf 2D1526         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 9f   
1112    Bf 1E1526        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1113    Bg 2D1526         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 10f  
1114    Bg 1E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1115    Bh 2D1526         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 11f  
1116    Bh 1E1526        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1117    Bi 2D1526         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 12f  
1118    Bi 1E1526        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1119    Bj 2D1526         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 13f  
1120    Bj 1E1526        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1121    Bk 2D1526         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  4s14p     -d9s2 14f  
1122    Bk 1E1526        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1123    Bx 1D2534       549.2     0.     686.5 FIXEDHF     0.800  0       0.0  0  4s14p     -4p5s      
1124    Bx 0E2534       175.4     0.     219.2 FIXEDHF     0.800  0       0.0  0                       
1125    By 0D2545        65.0     0.      81.2 FIXEDHF     0.800  0       0.0  0  4s14p     -5s5p      
1126    By 1E2545       105.2     0.     131.5 FIXEDHF     0.800  0       0.0  0                       
1127    Bz 1D1534      -132.9     0.    -166.1 FIXEDHF     0.800  0       0.0  0  4s14p     -d9 4s4p5s 
1128    Bz 2E1534       -70.2     0.     -87.8 FIXEDHF     0.800  0       0.0  0                       
1129    CD 2D1523      -212.4     0.    -265.5 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 4p   
1130    CD 1E1523      -219.4     0.    -274.2 FIXEDHF     0.800  0       0.0  0                       
1131    CE 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 5p   
1132    CE 2D1525       -90.2     0.    -112.8 FIXEDHF     0.800  0       0.0  0                       
1133    CE 1E1525       -73.9     0.     -92.4 FIXEDHF     0.800  0       0.0  0                       
1134    CF 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 6p   
1135    CF 2D1525       -56.7     0.     -70.9 FIXEDHF     0.800  0       0.0  0                       
1136    CF 1E1525       -44.5     0.     -55.6 FIXEDHF     0.800  0       0.0  0                       
1137    CG 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 7p   
1138    CG 2D1525       -39.8     0.     -49.8 FIXEDHF     0.800  0       0.0  0                       
1139    CG 1E1525       -30.8     0.     -38.5 FIXEDHF     0.800  0       0.0  0                       
1140    CH 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 8p   
1141    CH 2D1525       -30.0     0.     -37.5 FIXEDHF     0.800  0       0.0  0                       
1142    CH 1E1525       -23.0     0.     -28.8 FIXEDHF     0.800  0       0.0  0                       
1143    CI 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 9p   
1144    CI 2D1525       -23.6     0.     -29.5 FIXEDHF     0.800  0       0.0  0                       
1145    CI 1E1525       -18.1     0.     -22.6 FIXEDHF     0.800  0       0.0  0                       
1146    CJ 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 10p  
1147    CJ 2D1525       -19.2     0.     -24.0 FIXEDHF     0.800  0       0.0  0                       
1148    CJ 1E1525       -14.6     0.     -18.3 FIXEDHF     0.800  0       0.0  0                       
1149    CK 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 11p  
1150    CK 2D1525       -16.0     0.     -20.0 FIXEDHF     0.800  0       0.0  0                       
1151    CK 1E1525       -12.2     0.     -15.3 FIXEDHF     0.800  0       0.0  0                       
1152    CL 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 12p  
1153    CL 2D1525       -13.6     0.     -17.0 FIXEDHF     0.800  0       0.0  0                       
1154    CL 1E1525       -10.4     0.     -13.0 FIXEDHF     0.800  0       0.0  0                       
1155    CM 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 13p  
1156    CM 2D1525       -11.8     0.     -14.7 FIXEDHF     0.800  0       0.0  0                       
1157    CM 1E1525        -9.0     0.     -11.2 FIXEDHF     0.800  0       0.0  0                       
1158    CN 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 14p  
1159    CN 2D1525       -10.3     0.     -12.9 FIXEDHF     0.800  0       0.0  0                       
1160    CN 1E1525        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
1161    CO 2D1112       705.8     0.     882.2 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 15p  
1162    CO 2D1525        -9.1     0.     -11.4 FIXEDHF     0.800  0       0.0  0                       
1163    CO 1E1525        -7.0     0.      -8.7 FIXEDHF     0.800  0       0.0  0                       
1164    Ca 2D1526         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 4f   
1165    Ca 1E1526        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1166    Cb 2D1526         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 5f   
1167    Cb 1E1526        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1168    Cc 2D1526         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 6f   
1169    Cc 1E1526        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1170    Cd 2D1526         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 7f   
1171    Cd 1E1526        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1172    Ce 2D1526         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 8f   
1173    Ce 1E1526        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1174    Cf 2D1526         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 9f   
1175    Cf 1E1526        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1176    Cg 2D1526         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 10f  
1177    Cg 1E1526        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1178    Ch 2D1526         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 11f  
1179    Ch 1E1526        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1180    Ci 2D1526         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 12f  
1181    Ci 1E1526        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
1182    Cj 2D1526         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 13f  
1183    Cj 1E1526        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
1184    Ck 2D1526         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0  4s15p     -d9s2 14f  
1185    Ck 1E1526        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
1186    Cx 1D2534       485.8     0.     607.2 FIXEDHF     0.800  0       0.0  0  4s15p     -4p5s      
1187    Cx 0E2534       154.9     0.     193.6 FIXEDHF     0.800  0       0.0  0                       
1188    Cy 0D2545        57.5     0.      71.9 FIXEDHF     0.800  0       0.0  0  4s15p     -5s5p      
1189    Cy 1E2545        93.3     0.     116.6 FIXEDHF     0.800  0       0.0  0                       
1190    Cz 1D1534      -117.6     0.    -147.0 FIXEDHF     0.800  0       0.0  0  4s15p     -d9 4s4p5s 
1191    Cz 2E1534       -62.2     0.     -77.7 FIXEDHF     0.800  0       0.0  0                       
1192    DE 0D1315       120.1     0.     150.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 5p   
1193    DE 2D1315      2959.0     0.    3698.8 FIXEDHF     0.800  0       0.0  0                       
1194    DE 1E1315      1161.8     0.    1452.2 FIXEDHF     0.800  0       0.0  0                       
1195    DE 3E1315       993.8     0.    1242.3 FIXEDHF     0.800  0       0.0  0                       
1196    DF 0D1315        73.3     0.      91.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 6p   
1197    DF 2D1315      1761.5     0.    2201.9 FIXEDHF     0.800  0       0.0  0                       
1198    DF 1E1315       707.8     0.     884.8 FIXEDHF     0.800  0       0.0  0                       
1199    DF 3E1315       607.4     0.     759.3 FIXEDHF     0.800  0       0.0  0                       
1200    DG 0D1315        51.0     0.      63.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 7p   
1201    DG 2D1315      1215.0     0.    1518.8 FIXEDHF     0.800  0       0.0  0                       
1202    DG 1E1315       493.0     0.     616.3 FIXEDHF     0.800  0       0.0  0                       
1203    DG 3E1315       423.7     0.     529.6 FIXEDHF     0.800  0       0.0  0                       
1204    DH 0D1315        38.3     0.      47.9 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 8p   
1205    DH 2D1315       905.9     0.    1132.4 FIXEDHF     0.800  0       0.0  0                       
1206    DH 1E1315       369.6     0.     462.0 FIXEDHF     0.800  0       0.0  0                       
1207    DH 3E1315       317.8     0.     397.2 FIXEDHF     0.800  0       0.0  0                       
1208    DI 0D1315        30.1     0.      37.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 9p   
1209    DI 2D1315       709.9     0.     887.4 FIXEDHF     0.800  0       0.0  0                       
1210    DI 1E1315       290.6     0.     363.2 FIXEDHF     0.800  0       0.0  0                       
1211    DI 3E1315       249.9     0.     312.4 FIXEDHF     0.800  0       0.0  0                       
1212    DJ 0D1315        24.5     0.      30.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 10p  
1213    DJ 2D1315       576.2     0.     720.2 FIXEDHF     0.800  0       0.0  0                       
1214    DJ 1E1315       236.3     0.     295.4 FIXEDHF     0.800  0       0.0  0                       
1215    DJ 3E1315       203.4     0.     254.2 FIXEDHF     0.800  0       0.0  0                       
1216    DK 0D1315        20.4     0.      25.5 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 11p  
1217    DK 2D1315       480.0     0.     600.0 FIXEDHF     0.800  0       0.0  0                       
1218    DK 1E1315       197.1     0.     246.4 FIXEDHF     0.800  0       0.0  0                       
1219    DK 3E1315       169.7     0.     212.1 FIXEDHF     0.800  0       0.0  0                       
1220    DL 0D1315        17.4     0.      21.7 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 12p  
1221    DL 2D1315       408.0     0.     510.0 FIXEDHF     0.800  0       0.0  0                       
1222    DL 1E1315       167.8     0.     209.7 FIXEDHF     0.800  0       0.0  0                       
1223    DL 3E1315       144.4     0.     180.5 FIXEDHF     0.800  0       0.0  0                       
1224    DM 0D1315        15.0     0.      18.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 13p  
1225    DM 2D1315       352.4     0.     440.5 FIXEDHF     0.800  0       0.0  0                       
1226    DM 1E1315       145.0     0.     181.3 FIXEDHF     0.800  0       0.0  0                       
1227    DM 3E1315       124.9     0.     156.1 FIXEDHF     0.800  0       0.0  0                       
1228    DN 0D1315        13.2     0.      16.5 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 14p  
1229    DN 2D1315       308.5     0.     385.6 FIXEDHF     0.800  0       0.0  0                       
1230    DN 1E1315       127.0     0.     158.8 FIXEDHF     0.800  0       0.0  0                       
1231    DN 3E1315       109.4     0.     136.7 FIXEDHF     0.800  0       0.0  0                       
1232    DO 0D1315        11.7     0.      14.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 15p  
1233    DO 2D1315       273.0     0.     341.3 FIXEDHF     0.800  0       0.0  0                       
1234    DO 1E1315       112.5     0.     140.6 FIXEDHF     0.800  0       0.0  0                       
1235    DO 3E1315        96.9     0.     121.1 FIXEDHF     0.800  0       0.0  0                       
1236    DP 2D2316      -185.5     0.    -231.9 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s4f      
1237    DP 3E2316       -71.0     0.     -88.8 FIXEDHF     0.800  0       0.0  0                       
1238    DQ 2D2316      -170.1     0.    -212.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s5f      
1239    DQ 3E2316       -67.0     0.     -83.8 FIXEDHF     0.800  0       0.0  0                       
1240    DR 2D2316      -144.8     0.    -181.0 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s6f      
1241    DR 3E2316       -58.0     0.     -72.5 FIXEDHF     0.800  0       0.0  0                       
1242    DS 2D2316      -122.6     0.    -153.2 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s7f      
1243    DS 3E2316       -49.6     0.     -62.0 FIXEDHF     0.800  0       0.0  0                       
1244    DT 2D2316      -104.6     0.    -130.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s8f      
1245    DT 3E2316       -42.6     0.     -53.3 FIXEDHF     0.800  0       0.0  0                       
1246    DU 2D2316       -90.3     0.    -112.9 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s9f      
1247    DU 3E2316       -37.0     0.     -46.2 FIXEDHF     0.800  0       0.0  0                       
1248    DV 2D2316       -78.8     0.     -98.5 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s10f     
1249    DV 3E2316       -32.4     0.     -40.5 FIXEDHF     0.800  0       0.0  0                       
1250    DW 2D2316       -69.4     0.     -86.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s11f     
1251    DW 3E2316       -28.6     0.     -35.8 FIXEDHF     0.800  0       0.0  0                       
1252    DX 2D2316       -61.8     0.     -77.3 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s12f     
1253    DX 3E2316       -25.5     0.     -31.9 FIXEDHF     0.800  0       0.0  0                       
1254    DY 2D2316       -55.4     0.     -69.3 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s13f     
1255    DY 3E2316       -23.0     0.     -28.7 FIXEDHF     0.800  0       0.0  0                       
1256    DZ 2D2316       -50.1     0.     -62.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -4s14f     
1257    DZ 3E2316       -20.7     0.     -25.9 FIXEDHF     0.800  0       0.0  0                       
1258    Da 2D1316       127.9     0.     159.9 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 4f   
1259    Da 4D1316        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0                       
1260    Da 1E1316        16.1     0.      20.1 FIXEDHF     0.800  0       0.0  0                       
1261    Da 3E1316        10.7     0.      13.4 FIXEDHF     0.800  0       0.0  0                       
1262    Db 2D1316       119.3     0.     149.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 5f   
1263    Db 4D1316        24.2     0.      30.3 FIXEDHF     0.800  0       0.0  0                       
1264    Db 1E1316        15.7     0.      19.6 FIXEDHF     0.800  0       0.0  0                       
1265    Db 3E1316        10.5     0.      13.1 FIXEDHF     0.800  0       0.0  0                       
1266    Dc 2D1316       102.5     0.     128.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 6f   
1267    Dc 4D1316        21.2     0.      26.5 FIXEDHF     0.800  0       0.0  0                       
1268    Dc 1E1316        13.8     0.      17.2 FIXEDHF     0.800  0       0.0  0                       
1269    Dc 3E1316         9.2     0.      11.5 FIXEDHF     0.800  0       0.0  0                       
1270    Dd 2D1316        87.3     0.     109.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 7f   
1271    Dd 4D1316        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0                       
1272    Dd 1E1316        11.9     0.      14.9 FIXEDHF     0.800  0       0.0  0                       
1273    Dd 3E1316         8.0     0.      10.0 FIXEDHF     0.800  0       0.0  0                       
1274    De 2D1316        74.9     0.      93.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 8f   
1275    De 4D1316        15.8     0.      19.7 FIXEDHF     0.800  0       0.0  0                       
1276    De 1E1316        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0                       
1277    De 3E1316         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0                       
1278    Df 2D1316        64.8     0.      81.0 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 9f   
1279    Df 4D1316        13.7     0.      17.1 FIXEDHF     0.800  0       0.0  0                       
1280    Df 1E1316         9.0     0.      11.2 FIXEDHF     0.800  0       0.0  0                       
1281    Df 3E1316         6.0     0.       7.5 FIXEDHF     0.800  0       0.0  0                       
1282    Dg 2D1316        56.6     0.      70.8 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 10f  
1283    Dg 4D1316        12.0     0.      15.0 FIXEDHF     0.800  0       0.0  0                       
1284    Dg 1E1316         7.8     0.       9.8 FIXEDHF     0.800  0       0.0  0                       
1285    Dg 3E1316         5.3     0.       6.6 FIXEDHF     0.800  0       0.0  0                       
1286    Dh 2D1316        50.1     0.      62.6 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 11f  
1287    Dh 4D1316        10.6     0.      13.3 FIXEDHF     0.800  0       0.0  0                       
1288    Dh 1E1316         7.0     0.       8.7 FIXEDHF     0.800  0       0.0  0                       
1289    Dh 3E1316         4.7     0.       5.9 FIXEDHF     0.800  0       0.0  0                       
1290    Di 2D1316        44.6     0.      55.7 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 12f  
1291    Di 4D1316         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0                       
1292    Di 1E1316         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0                       
1293    Di 3E1316         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0                       
1294    Dj 2D1316        40.0     0.      50.0 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 13f  
1295    Dj 4D1316         8.6     0.      10.7 FIXEDHF     0.800  0       0.0  0                       
1296    Dj 1E1316         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
1297    Dj 3E1316         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
1298    Dk 2D1316        40.0     0.      50.0 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 14f  
1299    Dk 4D1316         8.6     0.      10.7 FIXEDHF     0.800  0       0.0  0                       
1300    Dk 1E1316         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
1301    Dk 3E1316         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
1302    Dp 4D1317         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 6h   
1303    Dp 3E1317         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1304    Dq 4D1317         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 7h   
1305    Dq 3E1317         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1306    Dr 4D1317         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 8h   
1307    Dr 3E1317         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1308    Ds 4D1317         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9s2 9h   
1309    Ds 3E1317         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1310    Dz 0D1214       229.0     0.     286.2 FIXEDHF     0.800  0       0.0  0  d9s2 4p   -d9 4s4p5s 
1311    Dz 2E1214      2286.1     0.    2857.6 FIXEDHF     0.800  0       0.0  0                       
1312    Dz 0D2224      2326.2     0.    2907.8 FIXEDHF     0.800  0       0.0  0                       
1313    Dz 1D2334     -1763.8     0.   -2204.7 FIXEDHF     0.800  0       0.0  0                       
1314    Dz 0E2334       -98.1     0.    -122.6 FIXEDHF     0.800  0       0.0  0                       
1315    EF 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 6p   
1316    EF 2D1515       695.4     0.     869.2 FIXEDHF     0.800  0       0.0  0                       
1317    EF 1E1515       245.5     0.     306.9 FIXEDHF     0.800  0       0.0  0                       
1318    EF 3E1515       213.3     0.     266.6 FIXEDHF     0.800  0       0.0  0                       
1319    EG 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 7p   
1320    EG 2D1515       476.5     0.     595.6 FIXEDHF     0.800  0       0.0  0                       
1321    EG 1E1515       171.1     0.     213.9 FIXEDHF     0.800  0       0.0  0                       
1322    EG 3E1515       148.9     0.     186.1 FIXEDHF     0.800  0       0.0  0                       
1323    EH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 8p   
1324    EH 2D1515       354.3     0.     442.9 FIXEDHF     0.800  0       0.0  0                       
1325    EH 1E1515       128.3     0.     160.4 FIXEDHF     0.800  0       0.0  0                       
1326    EH 3E1515       111.7     0.     139.6 FIXEDHF     0.800  0       0.0  0                       
1327    EI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 9p   
1328    EI 2D1515       277.3     0.     346.6 FIXEDHF     0.800  0       0.0  0                       
1329    EI 1E1515       100.9     0.     126.1 FIXEDHF     0.800  0       0.0  0                       
1330    EI 3E1515        87.8     0.     109.8 FIXEDHF     0.800  0       0.0  0                       
1331    EJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 10p  
1332    EJ 2D1515       224.8     0.     281.0 FIXEDHF     0.800  0       0.0  0                       
1333    EJ 1E1515        82.1     0.     102.6 FIXEDHF     0.800  0       0.0  0                       
1334    EJ 3E1515        71.4     0.      89.3 FIXEDHF     0.800  0       0.0  0                       
1335    EK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 11p  
1336    EK 2D1515       187.2     0.     234.0 FIXEDHF     0.800  0       0.0  0                       
1337    EK 1E1515        68.5     0.      85.6 FIXEDHF     0.800  0       0.0  0                       
1338    EK 3E1515        59.7     0.      74.6 FIXEDHF     0.800  0       0.0  0                       
1339    EL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 12p  
1340    EL 2D1515       159.0     0.     198.8 FIXEDHF     0.800  0       0.0  0                       
1341    EL 1E1515        58.2     0.      72.8 FIXEDHF     0.800  0       0.0  0                       
1342    EL 3E1515        50.8     0.      63.5 FIXEDHF     0.800  0       0.0  0                       
1343    EM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 13p  
1344    EM 2D1515       137.4     0.     171.7 FIXEDHF     0.800  0       0.0  0                       
1345    EM 1E1515        50.4     0.      63.0 FIXEDHF     0.800  0       0.0  0                       
1346    EM 3E1515        43.9     0.      54.9 FIXEDHF     0.800  0       0.0  0                       
1347    EN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 14p  
1348    EN 2D1515       120.2     0.     150.2 FIXEDHF     0.800  0       0.0  0                       
1349    EN 1E1515        44.1     0.      55.1 FIXEDHF     0.800  0       0.0  0                       
1350    EN 3E1515        38.5     0.      48.1 FIXEDHF     0.800  0       0.0  0                       
1351    EO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 15p  
1352    EO 2D1515       106.3     0.     132.9 FIXEDHF     0.800  0       0.0  0                       
1353    EO 1E1515        39.0     0.      48.8 FIXEDHF     0.800  0       0.0  0                       
1354    EO 3E1515        34.1     0.      42.6 FIXEDHF     0.800  0       0.0  0                       
1355    EP 2D2516       125.1     0.     156.4 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s4f      
1356    EP 3E2516       -19.5     0.     -24.4 FIXEDHF     0.800  0       0.0  0                       
1357    EQ 2D2516        86.7     0.     108.4 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s5f      
1358    EQ 3E2516       -18.6     0.     -23.2 FIXEDHF     0.800  0       0.0  0                       
1359    ER 2D2516        63.2     0.      79.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s6f      
1360    ER 3E2516       -16.1     0.     -20.1 FIXEDHF     0.800  0       0.0  0                       
1361    ES 2D2516        48.5     0.      60.6 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s7f      
1362    ES 3E2516       -13.8     0.     -17.3 FIXEDHF     0.800  0       0.0  0                       
1363    ET 2D2516        38.7     0.      48.4 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s8f      
1364    ET 3E2516       -11.9     0.     -14.9 FIXEDHF     0.800  0       0.0  0                       
1365    EU 2D2516        31.8     0.      39.8 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s9f      
1366    EU 3E2516       -10.3     0.     -12.9 FIXEDHF     0.800  0       0.0  0                       
1367    EV 2D2516        26.8     0.      33.5 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s10f     
1368    EV 3E2516        -9.0     0.     -11.3 FIXEDHF     0.800  0       0.0  0                       
1369    EW 2D2516        23.0     0.      28.7 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s11f     
1370    EW 3E2516        -8.0     0.     -10.0 FIXEDHF     0.800  0       0.0  0                       
1371    EX 2D2516        19.9     0.      24.9 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s12f     
1372    EX 3E2516        -7.1     0.      -8.9 FIXEDHF     0.800  0       0.0  0                       
1373    EY 2D2516        17.5     0.      21.9 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s13f     
1374    EY 3E2516        -6.4     0.      -8.0 FIXEDHF     0.800  0       0.0  0                       
1375    EZ 2D2516        15.6     0.      19.5 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -4s14f     
1376    EZ 3E2516        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0                       
1377    Ea 2D1516       -66.6     0.     -83.3 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 4f   
1378    Ea 4D1516         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
1379    Ea 1E1516         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0                       
1380    Ea 3E1516         3.5     0.       4.4 FIXEDHF     0.800  0       0.0  0                       
1381    Eb 2D1516       -44.4     0.     -55.5 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 5f   
1382    Eb 4D1516         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0                       
1383    Eb 1E1516         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0                       
1384    Eb 3E1516         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
1385    Ec 2D1516       -31.4     0.     -39.3 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 6f   
1386    Ec 4D1516         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
1387    Ec 1E1516         4.5     0.       5.6 FIXEDHF     0.800  0       0.0  0                       
1388    Ec 3E1516         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
1389    Ed 2D1516       -23.6     0.     -29.5 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 7f   
1390    Ed 4D1516         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
1391    Ed 1E1516         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0                       
1392    Ed 3E1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
1393    Ee 2D1516       -18.5     0.     -23.1 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 8f   
1394    Ee 4D1516         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0                       
1395    Ee 1E1516         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
1396    Ee 3E1516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0                       
1397    Ef 2D1516       -15.0     0.     -18.8 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 9f   
1398    Ef 4D1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
1399    Ef 1E1516         2.9     0.       3.6 FIXEDHF     0.800  0       0.0  0                       
1400    Ef 3E1516         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
1401    Eg 2D1516       -12.5     0.     -15.6 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 10f  
1402    Eg 4D1516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
1403    Eg 1E1516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0                       
1404    Eg 3E1516         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0                       
1405    Eh 2D1516       -10.6     0.     -13.3 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 11f  
1406    Eh 4D1516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
1407    Eh 1E1516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0                       
1408    Eh 3E1516         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
1409    Ei 2D1516        -9.1     0.     -11.4 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 12f  
1410    Ei 4D1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
1411    Ei 1E1516         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
1412    Ei 3E1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1413    Ej 2D1516        -8.0     0.     -10.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 13f  
1414    Ej 4D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
1415    Ej 1E1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
1416    Ej 3E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1417    Ek 2D1516        -8.0     0.     -10.0 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 14f  
1418    Ek 4D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
1419    Ek 1E1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
1420    Ek 3E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1421    Ep 4D1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 6h   
1422    Ep 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1423    Eq 4D1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 7h   
1424    Eq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1425    Er 4D1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 8h   
1426    Er 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1427    Es 4D1517        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9s2 9h   
1428    Es 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1429    Ez 1D2534      6441.0     0.    8051.2 FIXEDHF     0.800  0       0.0  0  d9s2 5p   -d9 4s4p5s 
1430    Ez 0E2534      1595.4     0.    1994.3 FIXEDHF     0.800  0       0.0  0                       
1431    FG 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 7p   
1432    FG 2D1515       299.0     0.     373.8 FIXEDHF     0.800  0       0.0  0                       
1433    FG 1E1515       104.4     0.     130.5 FIXEDHF     0.800  0       0.0  0                       
1434    FG 3E1515        91.1     0.     113.9 FIXEDHF     0.800  0       0.0  0                       
1435    FH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 8p   
1436    FH 2D1515       222.0     0.     277.5 FIXEDHF     0.800  0       0.0  0                       
1437    FH 1E1515        78.3     0.      97.9 FIXEDHF     0.800  0       0.0  0                       
1438    FH 3E1515        68.3     0.      85.4 FIXEDHF     0.800  0       0.0  0                       
1439    FI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 9p   
1440    FI 2D1515       173.7     0.     217.1 FIXEDHF     0.800  0       0.0  0                       
1441    FI 1E1515        61.5     0.      76.9 FIXEDHF     0.800  0       0.0  0                       
1442    FI 3E1515        53.8     0.      67.2 FIXEDHF     0.800  0       0.0  0                       
1443    FJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 10p  
1444    FJ 2D1515       140.8     0.     176.0 FIXEDHF     0.800  0       0.0  0                       
1445    FJ 1E1515        50.1     0.      62.6 FIXEDHF     0.800  0       0.0  0                       
1446    FJ 3E1515        43.8     0.      54.7 FIXEDHF     0.800  0       0.0  0                       
1447    FK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 11p  
1448    FK 2D1515       117.2     0.     146.5 FIXEDHF     0.800  0       0.0  0                       
1449    FK 1E1515        41.8     0.      52.2 FIXEDHF     0.800  0       0.0  0                       
1450    FK 3E1515        36.5     0.      45.6 FIXEDHF     0.800  0       0.0  0                       
1451    FL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 12p  
1452    FL 2D1515        99.6     0.     124.5 FIXEDHF     0.800  0       0.0  0                       
1453    FL 1E1515        35.5     0.      44.4 FIXEDHF     0.800  0       0.0  0                       
1454    FL 3E1515        31.0     0.      38.8 FIXEDHF     0.800  0       0.0  0                       
1455    FM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 13p  
1456    FM 2D1515        86.0     0.     107.5 FIXEDHF     0.800  0       0.0  0                       
1457    FM 1E1515        30.7     0.      38.4 FIXEDHF     0.800  0       0.0  0                       
1458    FM 3E1515        26.9     0.      33.6 FIXEDHF     0.800  0       0.0  0                       
1459    FN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 14p  
1460    FN 2D1515        75.3     0.      94.1 FIXEDHF     0.800  0       0.0  0                       
1461    FN 1E1515        27.0     0.      33.7 FIXEDHF     0.800  0       0.0  0                       
1462    FN 3E1515        23.5     0.      29.4 FIXEDHF     0.800  0       0.0  0                       
1463    FO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 15p  
1464    FO 2D1515        66.6     0.      83.2 FIXEDHF     0.800  0       0.0  0                       
1465    FO 1E1515        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0                       
1466    FO 3E1515        20.8     0.      26.0 FIXEDHF     0.800  0       0.0  0                       
1467    FP 2D2516        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s4f      
1468    FP 3E2516       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0                       
1469    FQ 2D2516        32.6     0.      40.8 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s5f      
1470    FQ 3E2516       -10.8     0.     -13.5 FIXEDHF     0.800  0       0.0  0                       
1471    FR 2D2516        28.9     0.      36.1 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s6f      
1472    FR 3E2516        -9.4     0.     -11.7 FIXEDHF     0.800  0       0.0  0                       
1473    FS 2D2516        24.1     0.      30.1 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s7f      
1474    FS 3E2516        -8.1     0.     -10.1 FIXEDHF     0.800  0       0.0  0                       
1475    FT 2D2516        20.2     0.      25.2 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s8f      
1476    FT 3E2516        -7.0     0.      -8.7 FIXEDHF     0.800  0       0.0  0                       
1477    FU 2D2516        17.0     0.      21.3 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s9f      
1478    FU 3E2516        -6.0     0.      -7.5 FIXEDHF     0.800  0       0.0  0                       
1479    FV 2D2516        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s10f     
1480    FV 3E2516        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
1481    FW 2D2516        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s11f     
1482    FW 3E2516        -4.6     0.      -5.8 FIXEDHF     0.800  0       0.0  0                       
1483    FX 2D2516        11.2     0.      14.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s12f     
1484    FX 3E2516        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0                       
1485    FY 2D2516         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s13f     
1486    FY 3E2516        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
1487    FZ 2D2516         8.9     0.      11.1 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -4s14f     
1488    FZ 3E2516        -3.4     0.      -4.2 FIXEDHF     0.800  0       0.0  0                       
1489    Fa 2D1516        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 4f   
1490    Fa 4D1516         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
1491    Fa 1E1516         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0                       
1492    Fa 3E1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0                       
1493    Fb 2D1516       -15.5     0.     -19.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 5f   
1494    Fb 4D1516         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
1495    Fb 1E1516         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
1496    Fb 3E1516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
1497    Fc 2D1516       -13.8     0.     -17.2 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 6f   
1498    Fc 4D1516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0                       
1499    Fc 1E1516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
1500    Fc 3E1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
1501    Fd 2D1516       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 7f   
1502    Fd 4D1516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0                       
1503    Fd 1E1516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
1504    Fd 3E1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
1505    Fe 2D1516        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 8f   
1506    Fe 4D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
1507    Fe 1E1516         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
1508    Fe 3E1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1509    Ff 2D1516        -7.9     0.      -9.9 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 9f   
1510    Ff 4D1516         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
1511    Ff 1E1516         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0                       
1512    Ff 3E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1513    Fg 2D1516        -6.7     0.      -8.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 10f  
1514    Fg 4D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
1515    Fg 1E1516         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
1516    Fg 3E1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1517    Fh 2D1516        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 11f  
1518    Fh 4D1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1519    Fh 1E1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1520    Fh 3E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1521    Fi 2D1516        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 12f  
1522    Fi 4D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1523    Fi 1E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1524    Fi 3E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1525    Fj 2D1516        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 13f  
1526    Fj 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1527    Fj 1E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1528    Fj 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1529    Fk 2D1516        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 14f  
1530    Fk 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1531    Fk 1E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1532    Fk 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1533    Fp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 6h   
1534    Fp 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1535    Fq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 7h   
1536    Fq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1537    Fr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 8h   
1538    Fr 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1539    Fs 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9s2 9h   
1540    Fs 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1541    Fz 1D2534      3465.5     0.    4331.9 FIXEDHF     0.800  0       0.0  0  d9s2 6p   -d9 4s4p5s 
1542    Fz 0E2534       931.5     0.    1164.4 FIXEDHF     0.800  0       0.0  0                       
1543    GH 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 8p   
1544    GH 2D1515       156.5     0.     195.6 FIXEDHF     0.800  0       0.0  0                       
1545    GH 1E1515        54.6     0.      68.2 FIXEDHF     0.800  0       0.0  0                       
1546    GH 3E1515        47.7     0.      59.6 FIXEDHF     0.800  0       0.0  0                       
1547    GI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 9p   
1548    GI 2D1515       122.3     0.     152.9 FIXEDHF     0.800  0       0.0  0                       
1549    GI 1E1515        42.9     0.      53.6 FIXEDHF     0.800  0       0.0  0                       
1550    GI 3E1515        37.5     0.      46.9 FIXEDHF     0.800  0       0.0  0                       
1551    GJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 10p  
1552    GJ 2D1515        99.1     0.     123.9 FIXEDHF     0.800  0       0.0  0                       
1553    GJ 1E1515        34.9     0.      43.6 FIXEDHF     0.800  0       0.0  0                       
1554    GJ 3E1515        30.6     0.      38.2 FIXEDHF     0.800  0       0.0  0                       
1555    GK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 11p  
1556    GK 2D1515        82.6     0.     103.2 FIXEDHF     0.800  0       0.0  0                       
1557    GK 1E1515        29.1     0.      36.4 FIXEDHF     0.800  0       0.0  0                       
1558    GK 3E1515        25.5     0.      31.9 FIXEDHF     0.800  0       0.0  0                       
1559    GL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 12p  
1560    GL 2D1515        70.1     0.      87.6 FIXEDHF     0.800  0       0.0  0                       
1561    GL 1E1515        24.8     0.      31.0 FIXEDHF     0.800  0       0.0  0                       
1562    GL 3E1515        21.7     0.      27.1 FIXEDHF     0.800  0       0.0  0                       
1563    GM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 13p  
1564    GM 2D1515        60.6     0.      75.7 FIXEDHF     0.800  0       0.0  0                       
1565    GM 1E1515        21.4     0.      26.8 FIXEDHF     0.800  0       0.0  0                       
1566    GM 3E1515        18.7     0.      23.4 FIXEDHF     0.800  0       0.0  0                       
1567    GN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 14p  
1568    GN 2D1515        53.0     0.      66.2 FIXEDHF     0.800  0       0.0  0                       
1569    GN 1E1515        18.8     0.      23.5 FIXEDHF     0.800  0       0.0  0                       
1570    GN 3E1515        16.4     0.      20.5 FIXEDHF     0.800  0       0.0  0                       
1571    GO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 15p  
1572    GO 2D1515        46.9     0.      58.6 FIXEDHF     0.800  0       0.0  0                       
1573    GO 1E1515        16.6     0.      20.8 FIXEDHF     0.800  0       0.0  0                       
1574    GO 3E1515        14.6     0.      18.2 FIXEDHF     0.800  0       0.0  0                       
1575    GP 2D2516        10.6     0.      13.3 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s4f      
1576    GP 3E2516        -7.8     0.      -9.7 FIXEDHF     0.800  0       0.0  0                       
1577    GQ 2D2516         9.4     0.      11.8 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s5f      
1578    GQ 3E2516        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
1579    GR 2D2516        13.2     0.      16.5 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s6f      
1580    GR 3E2516        -6.4     0.      -8.0 FIXEDHF     0.800  0       0.0  0                       
1581    GS 2D2516        12.3     0.      15.4 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s7f      
1582    GS 3E2516        -5.5     0.      -6.9 FIXEDHF     0.800  0       0.0  0                       
1583    GT 2D2516        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s8f      
1584    GT 3E2516        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0                       
1585    GU 2D2516         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s9f      
1586    GU 3E2516        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0                       
1587    GV 2D2516         8.3     0.      10.4 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s10f     
1588    GV 3E2516        -3.6     0.      -4.5 FIXEDHF     0.800  0       0.0  0                       
1589    GW 2D2516         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s11f     
1590    GW 3E2516        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0                       
1591    GX 2D2516         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s12f     
1592    GX 3E2516        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
1593    GY 2D2516         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s13f     
1594    GY 3E2516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1595    GZ 2D2516         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -4s14f     
1596    GZ 3E2516        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
1597    Ga 2D1516        -3.8     0.      -4.8 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 4f   
1598    Ga 4D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
1599    Ga 1E1516         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0                       
1600    Ga 3E1516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0                       
1601    Gb 2D1516        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 5f   
1602    Gb 4D1516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
1603    Gb 1E1516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
1604    Gb 3E1516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0                       
1605    Gc 2D1516        -5.6     0.      -7.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 6f   
1606    Gc 4D1516         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
1607    Gc 1E1516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
1608    Gc 3E1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
1609    Gd 2D1516        -5.4     0.      -6.7 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 7f   
1610    Gd 4D1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1611    Gd 1E1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
1612    Gd 3E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1613    Ge 2D1516        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 8f   
1614    Ge 4D1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1615    Ge 1E1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1616    Ge 3E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1617    Gf 2D1516        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 9f   
1618    Gf 4D1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1619    Gf 1E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1620    Gf 3E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1621    Gg 2D1516        -3.6     0.      -4.5 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 10f  
1622    Gg 4D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
1623    Gg 1E1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1624    Gg 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1625    Gh 2D1516        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 11f  
1626    Gh 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1627    Gh 1E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1628    Gh 3E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1629    Gi 2D1516        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 12f  
1630    Gi 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1631    Gi 1E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1632    Gi 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1633    Gj 2D1516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 13f  
1634    Gj 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1635    Gj 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1636    Gj 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1637    Gk 2D1516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 14f  
1638    Gk 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1639    Gk 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1640    Gk 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1641    Gp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 6h   
1642    Gp 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1643    Gq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 7h   
1644    Gq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1645    Gr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 8h   
1646    Gr 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1647    Gs 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9s2 9h   
1648    Gs 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1649    Gz 1D2534      2317.5     0.    2896.9 FIXEDHF     0.800  0       0.0  0  d9s2 7p   -d9 4s4p5s 
1650    Gz 0E2534       636.0     0.     795.0 FIXEDHF     0.800  0       0.0  0                       
1651    HI 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 9p   
1652    HI 2D1515        92.2     0.     115.3 FIXEDHF     0.800  0       0.0  0                       
1653    HI 1E1515        32.2     0.      40.2 FIXEDHF     0.800  0       0.0  0                       
1654    HI 3E1515        28.2     0.      35.2 FIXEDHF     0.800  0       0.0  0                       
1655    HJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 10p  
1656    HJ 2D1515        74.7     0.      93.4 FIXEDHF     0.800  0       0.0  0                       
1657    HJ 1E1515        26.2     0.      32.7 FIXEDHF     0.800  0       0.0  0                       
1658    HJ 3E1515        22.9     0.      28.6 FIXEDHF     0.800  0       0.0  0                       
1659    HK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 11p  
1660    HK 2D1515        62.2     0.      77.7 FIXEDHF     0.800  0       0.0  0                       
1661    HK 1E1515        21.8     0.      27.3 FIXEDHF     0.800  0       0.0  0                       
1662    HK 3E1515        19.1     0.      23.9 FIXEDHF     0.800  0       0.0  0                       
1663    HL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 12p  
1664    HL 2D1515        52.8     0.      66.0 FIXEDHF     0.800  0       0.0  0                       
1665    HL 1E1515        18.6     0.      23.2 FIXEDHF     0.800  0       0.0  0                       
1666    HL 3E1515        16.2     0.      20.3 FIXEDHF     0.800  0       0.0  0                       
1667    HM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 13p  
1668    HM 2D1515        45.6     0.      57.0 FIXEDHF     0.800  0       0.0  0                       
1669    HM 1E1515        16.1     0.      20.1 FIXEDHF     0.800  0       0.0  0                       
1670    HM 3E1515        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0                       
1671    HN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 14p  
1672    HN 2D1515        39.9     0.      49.9 FIXEDHF     0.800  0       0.0  0                       
1673    HN 1E1515        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0                       
1674    HN 3E1515        12.3     0.      15.4 FIXEDHF     0.800  0       0.0  0                       
1675    HO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 15p  
1676    HO 2D1515        35.4     0.      44.2 FIXEDHF     0.800  0       0.0  0                       
1677    HO 1E1515        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0                       
1678    HO 3E1515        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0                       
1679    HP 2D2516         7.6     0.       9.5 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s4f      
1680    HP 3E2516        -5.8     0.      -7.2 FIXEDHF     0.800  0       0.0  0                       
1681    HQ 2D2516         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s5f      
1682    HQ 3E2516        -5.4     0.      -6.8 FIXEDHF     0.800  0       0.0  0                       
1683    HR 2D2516         6.0     0.       7.5 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s6f      
1684    HR 3E2516        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0                       
1685    HS 2D2516         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s7f      
1686    HS 3E2516        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
1687    HT 2D2516         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s8f      
1688    HT 3E2516        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0                       
1689    HU 2D2516         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s9f      
1690    HU 3E2516        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
1691    HV 2D2516         5.1     0.       6.4 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s10f     
1692    HV 3E2516        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0                       
1693    HW 2D2516         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s11f     
1694    HW 3E2516        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
1695    HX 2D2516         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s12f     
1696    HX 3E2516        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
1697    HY 2D2516         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s13f     
1698    HY 3E2516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
1699    HZ 2D2516         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -4s14f     
1700    HZ 3E2516        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0                       
1701    Ha 2D1516        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 4f   
1702    Ha 4D1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1703    Ha 1E1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
1704    Ha 3E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1705    Hb 2D1516        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 5f   
1706    Hb 4D1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
1707    Hb 1E1516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
1708    Hb 3E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1709    Hc 2D1516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 6f   
1710    Hc 4D1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1711    Hc 1E1516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
1712    Hc 3E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1713    Hd 2D1516        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 7f   
1714    Hd 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1715    Hd 1E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1716    Hd 3E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1717    He 2D1516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 8f   
1718    He 4D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
1719    He 1E1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1720    He 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1721    Hf 2D1516        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 9f   
1722    Hf 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1723    Hf 1E1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
1724    Hf 3E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1725    Hg 2D1516        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 10f  
1726    Hg 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1727    Hg 1E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1728    Hg 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1729    Hh 2D1516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 11f  
1730    Hh 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1731    Hh 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1732    Hh 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1733    Hi 2D1516        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 12f  
1734    Hi 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1735    Hi 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1736    Hi 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1737    Hj 2D1516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 13f  
1738    Hj 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1739    Hj 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1740    Hj 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1741    Hk 2D1516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 14f  
1742    Hk 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1743    Hk 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1744    Hk 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1745    Hp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 6h   
1746    Hp 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1747    Hq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 7h   
1748    Hq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1749    Hr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 8h   
1750    Hr 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1751    Hs 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9s2 9h   
1752    Hs 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1753    Hz 1D2534      1703.0     0.    2128.7 FIXEDHF     0.800  0       0.0  0  d9s2 8p   -d9 4s4p5s 
1754    Hz 0E2534       471.4     0.     589.3 FIXEDHF     0.800  0       0.0  0                       
1755    IJ 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 10p  
1756    IJ 2D1515        59.0     0.      73.7 FIXEDHF     0.800  0       0.0  0                       
1757    IJ 1E1515        20.6     0.      25.7 FIXEDHF     0.800  0       0.0  0                       
1758    IJ 3E1515        18.0     0.      22.5 FIXEDHF     0.800  0       0.0  0                       
1759    IK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 11p  
1760    IK 2D1515        49.0     0.      61.3 FIXEDHF     0.800  0       0.0  0                       
1761    IK 1E1515        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0                       
1762    IK 3E1515        15.0     0.      18.8 FIXEDHF     0.800  0       0.0  0                       
1763    IL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 12p  
1764    IL 2D1515        41.7     0.      52.1 FIXEDHF     0.800  0       0.0  0                       
1765    IL 1E1515        14.6     0.      18.3 FIXEDHF     0.800  0       0.0  0                       
1766    IL 3E1515        12.8     0.      16.0 FIXEDHF     0.800  0       0.0  0                       
1767    IM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 13p  
1768    IM 2D1515        36.0     0.      45.0 FIXEDHF     0.800  0       0.0  0                       
1769    IM 1E1515        12.6     0.      15.8 FIXEDHF     0.800  0       0.0  0                       
1770    IM 3E1515        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
1771    IN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 14p  
1772    IN 2D1515        31.4     0.      39.3 FIXEDHF     0.800  0       0.0  0                       
1773    IN 1E1515        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
1774    IN 3E1515         9.7     0.      12.1 FIXEDHF     0.800  0       0.0  0                       
1775    IO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 15p  
1776    IO 2D1515        27.8     0.      34.8 FIXEDHF     0.800  0       0.0  0                       
1777    IO 1E1515         9.8     0.      12.3 FIXEDHF     0.800  0       0.0  0                       
1778    IO 3E1515         8.6     0.      10.7 FIXEDHF     0.800  0       0.0  0                       
1779    IP 2D2516         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s4f      
1780    IP 3E2516        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0                       
1781    IQ 2D2516         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s5f      
1782    IQ 3E2516        -4.2     0.      -5.3 FIXEDHF     0.800  0       0.0  0                       
1783    IR 2D2516         4.8     0.       6.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s6f      
1784    IR 3E2516        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0                       
1785    IS 2D2516         3.9     0.       4.9 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s7f      
1786    IS 3E2516        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0                       
1787    IT 2D2516         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s8f      
1788    IT 3E2516        -2.7     0.      -3.4 FIXEDHF     0.800  0       0.0  0                       
1789    IU 2D2516         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s9f      
1790    IU 3E2516        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
1791    IV 2D2516         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s10f     
1792    IV 3E2516        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
1793    IW 2D2516         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s11f     
1794    IW 3E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1795    IX 2D2516         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s12f     
1796    IX 3E2516        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
1797    IY 2D2516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s13f     
1798    IY 3E2516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
1799    IZ 2D2516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -4s14f     
1800    IZ 3E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1801    Ia 2D1516        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 4f   
1802    Ia 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1803    Ia 1E1516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
1804    Ia 3E1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
1805    Ib 2D1516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 5f   
1806    Ib 4D1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1807    Ib 1E1516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0                       
1808    Ib 3E1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
1809    Ic 2D1516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 6f   
1810    Ic 4D1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
1811    Ic 1E1516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
1812    Ic 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1813    Id 2D1516        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 7f   
1814    Id 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1815    Id 1E1516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
1816    Id 3E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1817    Ie 2D1516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 8f   
1818    Ie 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1819    Ie 1E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1820    Ie 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1821    If 2D1516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 9f   
1822    If 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1823    If 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1824    If 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1825    Ig 2D1516        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 10f  
1826    Ig 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1827    Ig 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1828    Ig 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1829    Ih 2D1516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 11f  
1830    Ih 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1831    Ih 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1832    Ih 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1833    Ii 2D1516        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 12f  
1834    Ii 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1835    Ii 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1836    Ii 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1837    Ij 2D1516        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 13f  
1838    Ij 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1839    Ij 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1840    Ij 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1841    Ik 2D1516        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 14f  
1842    Ik 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1843    Ik 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1844    Ik 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1845    Ip 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 6h   
1846    Ip 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1847    Iq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 7h   
1848    Iq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1849    Ir 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 8h   
1850    Ir 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1851    Is 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9s2 9h   
1852    Is 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1853    Iz 1D2534      1323.7     0.    1654.6 FIXEDHF     0.800  0       0.0  0  d9s2 9p   -d9 4s4p5s 
1854    Iz 0E2534       368.0     0.     460.0 FIXEDHF     0.800  0       0.0  0                       
1855    JK 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 11p  
1856    JK 2D1515        40.0     0.      50.0 FIXEDHF     0.800  0       0.0  0                       
1857    JK 1E1515        14.0     0.      17.5 FIXEDHF     0.800  0       0.0  0                       
1858    JK 3E1515        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0                       
1859    JL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 12p  
1860    JL 2D1515        33.9     0.      42.4 FIXEDHF     0.800  0       0.0  0                       
1861    JL 1E1515        11.9     0.      14.9 FIXEDHF     0.800  0       0.0  0                       
1862    JL 3E1515        10.4     0.      13.0 FIXEDHF     0.800  0       0.0  0                       
1863    JM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 13p  
1864    JM 2D1515        29.3     0.      36.6 FIXEDHF     0.800  0       0.0  0                       
1865    JM 1E1515        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0                       
1866    JM 3E1515         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0                       
1867    JN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 14p  
1868    JN 2D1515        25.7     0.      32.1 FIXEDHF     0.800  0       0.0  0                       
1869    JN 1E1515         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0                       
1870    JN 3E1515         7.9     0.       9.9 FIXEDHF     0.800  0       0.0  0                       
1871    JO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 15p  
1872    JO 2D1515        22.7     0.      28.4 FIXEDHF     0.800  0       0.0  0                       
1873    JO 1E1515         8.0     0.      10.0 FIXEDHF     0.800  0       0.0  0                       
1874    JO 3E1515         7.0     0.       8.7 FIXEDHF     0.800  0       0.0  0                       
1875    JP 2D2516         4.6     0.       5.7 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s4f      
1876    JP 3E2516        -3.6     0.      -4.5 FIXEDHF     0.800  0       0.0  0                       
1877    JQ 2D2516         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s5f      
1878    JQ 3E2516        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0                       
1879    JR 2D2516         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s6f      
1880    JR 3E2516        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
1881    JS 2D2516         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s7f      
1882    JS 3E2516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
1883    JT 2D2516         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s8f      
1884    JT 3E2516        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
1885    JU 2D2516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s9f      
1886    JU 3E2516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
1887    JV 2D2516         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s10f     
1888    JV 3E2516        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
1889    JW 2D2516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s11f     
1890    JW 3E2516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0                       
1891    JX 2D2516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s12f     
1892    JX 3E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
1893    JY 2D2516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s13f     
1894    JY 3E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
1895    JZ 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -4s14f     
1896    JZ 3E2516        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1897    Ja 2D1516        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 4f   
1898    Ja 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1899    Ja 1E1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1900    Ja 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1901    Jb 2D1516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 5f   
1902    Jb 4D1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1903    Jb 1E1516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
1904    Jb 3E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1905    Jc 2D1516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 6f   
1906    Jc 4D1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1907    Jc 1E1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
1908    Jc 3E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1909    Jd 2D1516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 7f   
1910    Jd 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1911    Jd 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
1912    Jd 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1913    Je 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 8f   
1914    Je 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1915    Je 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1916    Je 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1917    Jf 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 9f   
1918    Jf 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1919    Jf 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1920    Jf 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1921    Jg 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 10f  
1922    Jg 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1923    Jg 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1924    Jg 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1925    Jh 2D1516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 11f  
1926    Jh 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1927    Jh 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
1928    Jh 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1929    Ji 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 12f  
1930    Ji 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1931    Ji 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
1932    Ji 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1933    Jj 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 13f  
1934    Jj 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1935    Jj 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1936    Jj 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1937    Jk 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 14f  
1938    Jk 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1939    Jk 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
1940    Jk 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
1941    Jp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 6h   
1942    Jp 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1943    Jq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 7h   
1944    Jq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1945    Jr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 8h   
1946    Jr 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1947    Js 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9s2 9h   
1948    Js 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
1949    Jz 1D2534      1068.6     0.    1335.8 FIXEDHF     0.800  0       0.0  0  d9s2 10p  -d9 4s4p5s 
1950    Jz 0E2534       297.9     0.     372.4 FIXEDHF     0.800  0       0.0  0                       
1951    KL 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 12p  
1952    KL 2D1515        28.4     0.      35.5 FIXEDHF     0.800  0       0.0  0                       
1953    KL 1E1515         9.9     0.      12.4 FIXEDHF     0.800  0       0.0  0                       
1954    KL 3E1515         8.7     0.      10.9 FIXEDHF     0.800  0       0.0  0                       
1955    KM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 13p  
1956    KM 2D1515        24.5     0.      30.6 FIXEDHF     0.800  0       0.0  0                       
1957    KM 1E1515         8.6     0.      10.7 FIXEDHF     0.800  0       0.0  0                       
1958    KM 3E1515         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0                       
1959    KN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 14p  
1960    KN 2D1515        21.4     0.      26.8 FIXEDHF     0.800  0       0.0  0                       
1961    KN 1E1515         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0                       
1962    KN 3E1515         6.6     0.       8.2 FIXEDHF     0.800  0       0.0  0                       
1963    KO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 15p  
1964    KO 2D1515        19.0     0.      23.7 FIXEDHF     0.800  0       0.0  0                       
1965    KO 1E1515         6.6     0.       8.3 FIXEDHF     0.800  0       0.0  0                       
1966    KO 3E1515         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0                       
1967    KP 2D2516         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s4f      
1968    KP 3E2516        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
1969    KQ 2D2516         3.6     0.       4.5 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s5f      
1970    KQ 3E2516        -2.9     0.      -3.6 FIXEDHF     0.800  0       0.0  0                       
1971    KR 2D2516         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s6f      
1972    KR 3E2516        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
1973    KS 2D2516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s7f      
1974    KS 3E2516        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
1975    KT 2D2516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s8f      
1976    KT 3E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
1977    KU 2D2516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s9f      
1978    KU 3E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
1979    KV 2D2516         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s10f     
1980    KV 3E2516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
1981    KW 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s11f     
1982    KW 3E2516        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
1983    KX 2D2516         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s12f     
1984    KX 3E2516        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0                       
1985    KY 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s13f     
1986    KY 3E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
1987    KZ 2D2516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -4s14f     
1988    KZ 3E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
1989    Ka 2D1516        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 4f   
1990    Ka 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1991    Ka 1E1516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
1992    Ka 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1993    Kb 2D1516        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 5f   
1994    Kb 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1995    Kb 1E1516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0                       
1996    Kb 3E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
1997    Kc 2D1516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 6f   
1998    Kc 4D1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
1999    Kc 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2000    Kc 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2001    Kd 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 7f   
2002    Kd 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2003    Kd 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2004    Kd 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2005    Ke 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 8f   
2006    Ke 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2007    Ke 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2008    Ke 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2009    Kf 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 9f   
2010    Kf 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2011    Kf 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2012    Kf 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2013    Kg 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 10f  
2014    Kg 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2015    Kg 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2016    Kg 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2017    Kh 2D1516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 11f  
2018    Kh 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2019    Kh 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2020    Kh 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2021    Ki 2D1516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 12f  
2022    Ki 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2023    Ki 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2024    Ki 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2025    Kj 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 13f  
2026    Kj 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2027    Kj 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2028    Kj 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2029    Kk 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 14f  
2030    Kk 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2031    Kk 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2032    Kk 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2033    Kp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 6h   
2034    Kp 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2035    Kq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 7h   
2036    Kq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2037    Kr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 8h   
2038    Kr 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2039    Ks 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9s2 9h   
2040    Ks 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2041    Kz 1D2534       887.0     0.    1108.8 FIXEDHF     0.800  0       0.0  0  d9s2 11p  -d9 4s4p5s 
2042    Kz 0E2534       247.7     0.     309.6 FIXEDHF     0.800  0       0.0  0                       
2043    LM 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 13p  
2044    LM 2D1515        20.9     0.      26.1 FIXEDHF     0.800  0       0.0  0                       
2045    LM 1E1515         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0                       
2046    LM 3E1515         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
2047    LN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 14p  
2048    LN 2D1515        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0                       
2049    LN 1E1515         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
2050    LN 3E1515         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
2051    LO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 15p  
2052    LO 2D1515        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0                       
2053    LO 1E1515         5.7     0.       7.1 FIXEDHF     0.800  0       0.0  0                       
2054    LO 3E1515         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0                       
2055    LP 2D2516         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s4f      
2056    LP 3E2516        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
2057    LQ 2D2516         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s5f      
2058    LQ 3E2516        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0                       
2059    LR 2D2516         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s6f      
2060    LR 3E2516        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0                       
2061    LS 2D2516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s7f      
2062    LS 3E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2063    LT 2D2516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s8f      
2064    LT 3E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2065    LU 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s9f      
2066    LU 3E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2067    LV 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s10f     
2068    LV 3E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2069    LW 2D2516         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s11f     
2070    LW 3E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2071    LX 2D2516         1.2     0.       1.5 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s12f     
2072    LX 3E2516        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2073    LY 2D2516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s13f     
2074    LY 3E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2075    LZ 2D2516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -4s14f     
2076    LZ 3E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2077    La 2D1516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 4f   
2078    La 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2079    La 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2080    La 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2081    Lb 2D1516        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 5f   
2082    Lb 4D1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2083    Lb 1E1516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2084    Lb 3E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2085    Lc 2D1516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 6f   
2086    Lc 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2087    Lc 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2088    Lc 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2089    Ld 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 7f   
2090    Ld 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2091    Ld 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2092    Ld 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2093    Le 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 8f   
2094    Le 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2095    Le 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2096    Le 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2097    Lf 2D1516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 9f   
2098    Lf 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2099    Lf 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2100    Lf 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2101    Lg 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 10f  
2102    Lg 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2103    Lg 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2104    Lg 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2105    Lh 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 11f  
2106    Lh 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2107    Lh 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2108    Lh 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2109    Li 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 12f  
2110    Li 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2111    Li 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2112    Li 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2113    Lj 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 13f  
2114    Lj 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2115    Lj 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2116    Lj 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2117    Lk 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 14f  
2118    Lk 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2119    Lk 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2120    Lk 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2121    Lp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 6h   
2122    Lp 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2123    Lq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 7h   
2124    Lq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2125    Lr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 8h   
2126    Lr 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2127    Ls 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9s2 9h   
2128    Ls 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2129    Lz 1D2534       752.0     0.     940.0 FIXEDHF     0.800  0       0.0  0  d9s2 12p  -d9 4s4p5s 
2130    Lz 0E2534       210.2     0.     262.8 FIXEDHF     0.800  0       0.0  0                       
2131    MN 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 14p  
2132    MN 2D1515        15.8     0.      19.7 FIXEDHF     0.800  0       0.0  0                       
2133    MN 1E1515         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0                       
2134    MN 3E1515         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0                       
2135    MO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 15p  
2136    MO 2D1515        14.0     0.      17.5 FIXEDHF     0.800  0       0.0  0                       
2137    MO 1E1515         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0                       
2138    MO 3E1515         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
2139    MP 2D2516         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s4f      
2140    MP 3E2516        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
2141    MQ 2D2516         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s5f      
2142    MQ 3E2516        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0                       
2143    MR 2D2516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s6f      
2144    MR 3E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2145    MS 2D2516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s7f      
2146    MS 3E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2147    MT 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s8f      
2148    MT 3E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2149    MU 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s9f      
2150    MU 3E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2151    MV 2D2516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s10f     
2152    MV 3E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2153    MW 2D2516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s11f     
2154    MW 3E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2155    MX 2D2516         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s12f     
2156    MX 3E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2157    MY 2D2516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s13f     
2158    MY 3E2516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2159    MZ 2D2516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -4s14f     
2160    MZ 3E2516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2161    Ma 2D1516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 4f   
2162    Ma 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2163    Ma 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2164    Ma 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2165    Mb 2D1516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 5f   
2166    Mb 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2167    Mb 1E1516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2168    Mb 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2169    Mc 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 6f   
2170    Mc 4D1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2171    Mc 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2172    Mc 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2173    Md 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 7f   
2174    Md 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2175    Md 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2176    Md 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2177    Me 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 8f   
2178    Me 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2179    Me 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2180    Me 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2181    Mf 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 9f   
2182    Mf 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2183    Mf 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2184    Mf 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2185    Mg 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 10f  
2186    Mg 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2187    Mg 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2188    Mg 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2189    Mh 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 11f  
2190    Mh 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2191    Mh 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2192    Mh 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2193    Mi 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 12f  
2194    Mi 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2195    Mi 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2196    Mi 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2197    Mj 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 13f  
2198    Mj 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2199    Mj 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2200    Mj 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2201    Mk 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 14f  
2202    Mk 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2203    Mk 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2204    Mk 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2205    Mp 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 6h   
2206    Mp 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2207    Mq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 7h   
2208    Mq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2209    Mr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 8h   
2210    Mr 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2211    Ms 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9s2 9h   
2212    Ms 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2213    Mz 1D2534       648.3     0.     810.4 FIXEDHF     0.800  0       0.0  0  d9s2 13p  -d9 4s4p5s 
2214    Mz 0E2534       181.4     0.     226.8 FIXEDHF     0.800  0       0.0  0                       
2215    NO 0D1515         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 15p  
2216    NO 2D1515        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0                       
2217    NO 1E1515         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
2218    NO 3E1515         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
2219    NP 2D2516         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s4f      
2220    NP 3E2516        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0                       
2221    NQ 2D2516         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s5f      
2222    NQ 3E2516        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0                       
2223    NR 2D2516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s6f      
2224    NR 3E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2225    NS 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s7f      
2226    NS 3E2516        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0                       
2227    NT 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s8f      
2228    NT 3E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2229    NU 2D2516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s9f      
2230    NU 3E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2231    NV 2D2516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s10f     
2232    NV 3E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2233    NW 2D2516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s11f     
2234    NW 3E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2235    NX 2D2516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s12f     
2236    NX 3E2516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2237    NY 2D2516         0.8     0.       1.0 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s13f     
2238    NY 3E2516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2239    NZ 2D2516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -4s14f     
2240    NZ 3E2516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2241    Na 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 4f   
2242    Na 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2243    Na 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2244    Na 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2245    Nb 2D1516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 5f   
2246    Nb 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2247    Nb 1E1516         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2248    Nb 3E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2249    Nc 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 6f   
2250    Nc 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2251    Nc 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2252    Nc 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2253    Nd 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 7f   
2254    Nd 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2255    Nd 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2256    Nd 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2257    Ne 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 8f   
2258    Ne 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2259    Ne 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2260    Ne 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2261    Nf 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 9f   
2262    Nf 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2263    Nf 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2264    Nf 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2265    Ng 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 10f  
2266    Ng 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2267    Ng 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2268    Ng 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2269    Nh 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 11f  
2270    Nh 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2271    Nh 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2272    Nh 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2273    Ni 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 12f  
2274    Ni 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2275    Ni 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2276    Ni 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2277    Nj 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 13f  
2278    Nj 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2279    Nj 1E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2280    Nj 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2281    Nk 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 14f  
2282    Nk 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2283    Nk 1E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2284    Nk 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2285    Np 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 6h   
2286    Np 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2287    Nq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 7h   
2288    Nq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2289    Nr 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 8h   
2290    Nr 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2291    Ns 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9s2 9h   
2292    Ns 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2293    Nz 1D2534       566.6     0.     708.2 FIXEDHF     0.800  0       0.0  0  d9s2 14p  -d9 4s4p5s 
2294    Nz 0E2534       158.7     0.     198.4 FIXEDHF     0.800  0       0.0  0                       
2295    OP 2D2516         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s4f      
2296    OP 3E2516        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0                       
2297    OQ 2D2516         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s5f      
2298    OQ 3E2516        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0                       
2299    OR 2D2516         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s6f      
2300    OR 3E2516        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0                       
2301    OS 2D2516         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s7f      
2302    OS 3E2516        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0                       
2303    OT 2D2516         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s8f      
2304    OT 3E2516        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2305    OU 2D2516         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s9f      
2306    OU 3E2516        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2307    OV 2D2516         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s10f     
2308    OV 3E2516        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2309    OW 2D2516         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s11f     
2310    OW 3E2516        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2311    OX 2D2516         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s12f     
2312    OX 3E2516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2313    OY 2D2516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s13f     
2314    OY 3E2516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2315    OZ 2D2516         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -4s14f     
2316    OZ 3E2516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2317    Oa 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 4f   
2318    Oa 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2319    Oa 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2320    Oa 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2321    Ob 2D1516        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 5f   
2322    Ob 4D1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2323    Ob 1E1516         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2324    Ob 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2325    Oc 2D1516        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 6f   
2326    Oc 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2327    Oc 1E1516         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2328    Oc 3E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2329    Od 2D1516        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 7f   
2330    Od 4D1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2331    Od 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2332    Od 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2333    Oe 2D1516        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 8f   
2334    Oe 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2335    Oe 1E1516         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
2336    Oe 3E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2337    Of 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 9f   
2338    Of 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2339    Of 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2340    Of 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2341    Og 2D1516        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 10f  
2342    Og 4D1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2343    Og 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2344    Og 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2345    Oh 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 11f  
2346    Oh 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2347    Oh 1E1516         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
2348    Oh 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2349    Oi 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 12f  
2350    Oi 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2351    Oi 1E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2352    Oi 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2353    Oj 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 13f  
2354    Oj 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2355    Oj 1E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2356    Oj 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2357    Ok 2D1516        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 14f  
2358    Ok 4D1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2359    Ok 1E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2360    Ok 3E1516         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2361    Op 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 6h   
2362    Op 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2363    Oq 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 7h   
2364    Oq 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2365    Or 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 8h   
2366    Or 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2367    Os 4D1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9s2 9h   
2368    Os 3E1517         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2369    Oz 1D2534       500.7     0.     625.9 FIXEDHF     0.800  0       0.0  0  d9s2 15p  -d9 4s4p5s 
2370    Oz 0E2534       140.3     0.     175.4 FIXEDHF     0.800  0       0.0  0                       
2371    PQ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s5f      
2372    PQ 3E2626        10.3     0.      12.9 FIXEDHF     0.800  0       0.0  0                       
2373    PR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s6f      
2374    PR 3E2626         8.8     0.      11.0 FIXEDHF     0.800  0       0.0  0                       
2375    PS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s7f      
2376    PS 3E2626         7.4     0.       9.3 FIXEDHF     0.800  0       0.0  0                       
2377    PT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s8f      
2378    PT 3E2626         6.3     0.       7.9 FIXEDHF     0.800  0       0.0  0                       
2379    PU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s9f      
2380    PU 3E2626         5.4     0.       6.8 FIXEDHF     0.800  0       0.0  0                       
2381    PV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s10f     
2382    PV 3E2626         4.8     0.       6.0 FIXEDHF     0.800  0       0.0  0                       
2383    PW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s11f     
2384    PW 3E2626         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0                       
2385    PX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s12f     
2386    PX 3E2626         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
2387    PY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s13f     
2388    PY 3E2626         3.4     0.       4.2 FIXEDHF     0.800  0       0.0  0                       
2389    PZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -4s14f     
2390    PZ 3E2626         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
2391    Pa 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 4f   
2392    Pa 2D1626      -100.7     0.    -125.9 FIXEDHF     0.800  0       0.0  0                       
2393    Pa 3E1626        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0                       
2394    Pb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 5f   
2395    Pb 2D1626       -59.0     0.     -73.8 FIXEDHF     0.800  0       0.0  0                       
2396    Pb 3E1626        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2397    Pc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 6f   
2398    Pc 2D1626       -41.8     0.     -52.2 FIXEDHF     0.800  0       0.0  0                       
2399    Pc 3E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2400    Pd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 7f   
2401    Pd 2D1626       -31.9     0.     -39.9 FIXEDHF     0.800  0       0.0  0                       
2402    Pd 3E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2403    Pe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 8f   
2404    Pe 2D1626       -25.6     0.     -32.0 FIXEDHF     0.800  0       0.0  0                       
2405    Pe 3E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2406    Pf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 9f   
2407    Pf 2D1626       -21.1     0.     -26.4 FIXEDHF     0.800  0       0.0  0                       
2408    Pf 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2409    Pg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 10f  
2410    Pg 2D1626       -17.8     0.     -22.3 FIXEDHF     0.800  0       0.0  0                       
2411    Pg 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2412    Ph 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 11f  
2413    Ph 2D1626       -15.4     0.     -19.2 FIXEDHF     0.800  0       0.0  0                       
2414    Ph 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2415    Pi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 12f  
2416    Pi 2D1626       -13.4     0.     -16.8 FIXEDHF     0.800  0       0.0  0                       
2417    Pi 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2418    Pj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 13f  
2419    Pj 2D1626       -11.8     0.     -14.8 FIXEDHF     0.800  0       0.0  0                       
2420    Pj 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2421    Pk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 14f  
2422    Pk 2D1626       -11.8     0.     -14.8 FIXEDHF     0.800  0       0.0  0                       
2423    Pk 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2424    Pp 2D1627       -11.8     0.     -14.8 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 6h   
2425    Pp 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2426    Pq 2D1627       -11.5     0.     -14.4 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 7h   
2427    Pq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2428    Pr 2D1627       -10.2     0.     -12.8 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 8h   
2429    Pr 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2430    Ps 2D1627        -9.0     0.     -11.3 FIXEDHF     0.800  0       0.0  0  4s4f      -d9s2 9h   
2431    Ps 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2432    Pz 3D1634        63.4     0.      79.3 FIXEDHF     0.800  0       0.0  0  4s4f      -d9 4s4p5s 
2433    Pz 2E1634       -24.0     0.     -30.0 FIXEDHF     0.800  0       0.0  0                       
2434    QR 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s6f      
2435    QR 3E2626         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
2436    QS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s7f      
2437    QS 3E2626         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0                       
2438    QT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s8f      
2439    QT 3E2626         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0                       
2440    QU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s9f      
2441    QU 3E2626         5.0     0.       6.3 FIXEDHF     0.800  0       0.0  0                       
2442    QV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s10f     
2443    QV 3E2626         4.4     0.       5.5 FIXEDHF     0.800  0       0.0  0                       
2444    QW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s11f     
2445    QW 3E2626         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0                       
2446    QX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s12f     
2447    QX 3E2626         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
2448    QY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s13f     
2449    QY 3E2626         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
2450    QZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -4s14f     
2451    QZ 3E2626         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0                       
2452    Qa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 4f   
2453    Qa 2D1626       -59.0     0.     -73.8 FIXEDHF     0.800  0       0.0  0                       
2454    Qa 3E1626        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0                       
2455    Qb 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 5f   
2456    Qb 2D1626       -52.2     0.     -65.3 FIXEDHF     0.800  0       0.0  0                       
2457    Qb 3E1626        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
2458    Qc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 6f   
2459    Qc 2D1626       -36.8     0.     -46.0 FIXEDHF     0.800  0       0.0  0                       
2460    Qc 3E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2461    Qd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 7f   
2462    Qd 2D1626       -28.2     0.     -35.3 FIXEDHF     0.800  0       0.0  0                       
2463    Qd 3E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2464    Qe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 8f   
2465    Qe 2D1626       -22.6     0.     -28.3 FIXEDHF     0.800  0       0.0  0                       
2466    Qe 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2467    Qf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 9f   
2468    Qf 2D1626       -18.8     0.     -23.5 FIXEDHF     0.800  0       0.0  0                       
2469    Qf 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2470    Qg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 10f  
2471    Qg 2D1626       -15.9     0.     -19.9 FIXEDHF     0.800  0       0.0  0                       
2472    Qg 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2473    Qh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 11f  
2474    Qh 2D1626       -13.7     0.     -17.1 FIXEDHF     0.800  0       0.0  0                       
2475    Qh 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2476    Qi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 12f  
2477    Qi 2D1626       -12.0     0.     -15.0 FIXEDHF     0.800  0       0.0  0                       
2478    Qi 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2479    Qj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 13f  
2480    Qj 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
2481    Qj 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2482    Qk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 14f  
2483    Qk 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
2484    Qk 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2485    Qp 2D1627         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 6h   
2486    Qp 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2487    Qq 2D1627        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 7h   
2488    Qq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2489    Qr 2D1627        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 8h   
2490    Qr 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2491    Qs 2D1627        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0  4s5f      -d9s2 9h   
2492    Qs 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2493    Qz 3D1634        53.4     0.      66.7 FIXEDHF     0.800  0       0.0  0  4s5f      -d9 4s4p5s 
2494    Qz 2E1634       -22.7     0.     -28.4 FIXEDHF     0.800  0       0.0  0                       
2495    RS 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s7f      
2496    RS 3E2626         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0                       
2497    RT 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s8f      
2498    RT 3E2626         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0                       
2499    RU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s9f      
2500    RU 3E2626         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0                       
2501    RV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s10f     
2502    RV 3E2626         3.8     0.       4.7 FIXEDHF     0.800  0       0.0  0                       
2503    RW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s11f     
2504    RW 3E2626         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0                       
2505    RX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s12f     
2506    RX 3E2626         3.0     0.       3.7 FIXEDHF     0.800  0       0.0  0                       
2507    RY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s13f     
2508    RY 3E2626         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
2509    RZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -4s14f     
2510    RZ 3E2626         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
2511    Ra 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 4f   
2512    Ra 2D1626       -41.7     0.     -52.1 FIXEDHF     0.800  0       0.0  0                       
2513    Ra 3E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2514    Rb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 5f   
2515    Rb 2D1626       -36.8     0.     -46.0 FIXEDHF     0.800  0       0.0  0                       
2516    Rb 3E1626        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0                       
2517    Rc 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 6f   
2518    Rc 2D1626       -30.6     0.     -38.2 FIXEDHF     0.800  0       0.0  0                       
2519    Rc 3E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2520    Rd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 7f   
2521    Rd 2D1626       -23.4     0.     -29.2 FIXEDHF     0.800  0       0.0  0                       
2522    Rd 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2523    Re 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 8f   
2524    Re 2D1626       -18.8     0.     -23.5 FIXEDHF     0.800  0       0.0  0                       
2525    Re 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2526    Rf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 9f   
2527    Rf 2D1626       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
2528    Rf 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2529    Rg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 10f  
2530    Rg 2D1626       -13.2     0.     -16.5 FIXEDHF     0.800  0       0.0  0                       
2531    Rg 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2532    Rh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 11f  
2533    Rh 2D1626       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0                       
2534    Rh 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2535    Ri 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 12f  
2536    Ri 2D1626        -9.9     0.     -12.4 FIXEDHF     0.800  0       0.0  0                       
2537    Ri 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2538    Rj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 13f  
2539    Rj 2D1626        -8.8     0.     -11.0 FIXEDHF     0.800  0       0.0  0                       
2540    Rj 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2541    Rk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 14f  
2542    Rk 2D1626        -8.8     0.     -11.0 FIXEDHF     0.800  0       0.0  0                       
2543    Rk 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2544    Rp 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 6h   
2545    Rp 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2546    Rq 2D1627         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 7h   
2547    Rq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2548    Rr 2D1627         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 8h   
2549    Rr 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2550    Rs 2D1627         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  4s6f      -d9s2 9h   
2551    Rs 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2552    Rz 3D1634        43.3     0.      54.1 FIXEDHF     0.800  0       0.0  0  4s6f      -d9 4s4p5s 
2553    Rz 2E1634       -19.7     0.     -24.6 FIXEDHF     0.800  0       0.0  0                       
2554    ST 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s8f      
2555    ST 3E2626         4.2     0.       5.3 FIXEDHF     0.800  0       0.0  0                       
2556    SU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s9f      
2557    SU 3E2626         3.6     0.       4.5 FIXEDHF     0.800  0       0.0  0                       
2558    SV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s10f     
2559    SV 3E2626         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0                       
2560    SW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s11f     
2561    SW 3E2626         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0                       
2562    SX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s12f     
2563    SX 3E2626         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0                       
2564    SY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s13f     
2565    SY 3E2626         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0                       
2566    SZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -4s14f     
2567    SZ 3E2626         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0                       
2568    Sa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 4f   
2569    Sa 2D1626       -31.8     0.     -39.8 FIXEDHF     0.800  0       0.0  0                       
2570    Sa 3E1626        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
2571    Sb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 5f   
2572    Sb 2D1626       -28.2     0.     -35.3 FIXEDHF     0.800  0       0.0  0                       
2573    Sb 3E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2574    Sc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 6f   
2575    Sc 2D1626       -23.4     0.     -29.2 FIXEDHF     0.800  0       0.0  0                       
2576    Sc 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2577    Sd 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 7f   
2578    Sd 2D1626       -19.4     0.     -24.3 FIXEDHF     0.800  0       0.0  0                       
2579    Sd 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2580    Se 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 8f   
2581    Se 2D1626       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
2582    Se 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2583    Sf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 9f   
2584    Sf 2D1626       -12.9     0.     -16.1 FIXEDHF     0.800  0       0.0  0                       
2585    Sf 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2586    Sg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 10f  
2587    Sg 2D1626       -11.0     0.     -13.7 FIXEDHF     0.800  0       0.0  0                       
2588    Sg 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2589    Sh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 11f  
2590    Sh 2D1626        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
2591    Sh 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2592    Si 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 12f  
2593    Si 2D1626        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0                       
2594    Si 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2595    Sj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 13f  
2596    Sj 2D1626        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
2597    Sj 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2598    Sk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 14f  
2599    Sk 2D1626        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0                       
2600    Sk 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2601    Sp 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 6h   
2602    Sp 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2603    Sq 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 7h   
2604    Sq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2605    Sr 2D1627         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 8h   
2606    Sr 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2607    Ss 2D1627         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  4s7f      -d9s2 9h   
2608    Ss 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2609    Sz 3D1634        35.5     0.      44.4 FIXEDHF     0.800  0       0.0  0  4s7f      -d9 4s4p5s 
2610    Sz 2E1634       -16.9     0.     -21.1 FIXEDHF     0.800  0       0.0  0                       
2611    TU 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s9f      
2612    TU 3E2626         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0                       
2613    TV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s10f     
2614    TV 3E2626         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0                       
2615    TW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s11f     
2616    TW 3E2626         2.4     0.       3.0 FIXEDHF     0.800  0       0.0  0                       
2617    TX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s12f     
2618    TX 3E2626         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
2619    TY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s13f     
2620    TY 3E2626         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0                       
2621    TZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -4s14f     
2622    TZ 3E2626         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0                       
2623    Ta 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 4f   
2624    Ta 2D1626       -25.5     0.     -31.9 FIXEDHF     0.800  0       0.0  0                       
2625    Ta 3E1626        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0                       
2626    Tb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 5f   
2627    Tb 2D1626       -22.6     0.     -28.3 FIXEDHF     0.800  0       0.0  0                       
2628    Tb 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2629    Tc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 6f   
2630    Tc 2D1626       -18.8     0.     -23.5 FIXEDHF     0.800  0       0.0  0                       
2631    Tc 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2632    Td 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 7f   
2633    Td 2D1626       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
2634    Td 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2635    Te 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 8f   
2636    Te 2D1626       -13.1     0.     -16.4 FIXEDHF     0.800  0       0.0  0                       
2637    Te 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2638    Tf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 9f   
2639    Tf 2D1626       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0                       
2640    Tf 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2641    Tg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 10f  
2642    Tg 2D1626        -9.2     0.     -11.5 FIXEDHF     0.800  0       0.0  0                       
2643    Tg 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2644    Th 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 11f  
2645    Th 2D1626        -7.9     0.      -9.9 FIXEDHF     0.800  0       0.0  0                       
2646    Th 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2647    Ti 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 12f  
2648    Ti 2D1626        -7.0     0.      -8.7 FIXEDHF     0.800  0       0.0  0                       
2649    Ti 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2650    Tj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 13f  
2651    Tj 2D1626        -6.2     0.      -7.7 FIXEDHF     0.800  0       0.0  0                       
2652    Tj 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2653    Tk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 14f  
2654    Tk 2D1626        -6.2     0.      -7.7 FIXEDHF     0.800  0       0.0  0                       
2655    Tk 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2656    Tp 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 6h   
2657    Tp 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2658    Tq 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 7h   
2659    Tq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2660    Tr 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 8h   
2661    Tr 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2662    Ts 2D1627         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0  4s8f      -d9s2 9h   
2663    Ts 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2664    Tz 3D1634        29.7     0.      37.1 FIXEDHF     0.800  0       0.0  0  4s8f      -d9 4s4p5s 
2665    Tz 2E1634       -14.5     0.     -18.1 FIXEDHF     0.800  0       0.0  0                       
2666    UV 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s10f     
2667    UV 3E2626         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
2668    UW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s11f     
2669    UW 3E2626         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
2670    UX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s12f     
2671    UX 3E2626         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
2672    UY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s13f     
2673    UY 3E2626         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
2674    UZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -4s14f     
2675    UZ 3E2626         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0                       
2676    Ua 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 4f   
2677    Ua 2D1626       -21.0     0.     -26.3 FIXEDHF     0.800  0       0.0  0                       
2678    Ua 3E1626        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0                       
2679    Ub 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 5f   
2680    Ub 2D1626       -18.7     0.     -23.4 FIXEDHF     0.800  0       0.0  0                       
2681    Ub 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2682    Uc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 6f   
2683    Uc 2D1626       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0                       
2684    Uc 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2685    Ud 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 7f   
2686    Ud 2D1626       -12.9     0.     -16.1 FIXEDHF     0.800  0       0.0  0                       
2687    Ud 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2688    Ue 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 8f   
2689    Ue 2D1626       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0                       
2690    Ue 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2691    Uf 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 9f   
2692    Uf 2D1626        -9.3     0.     -11.6 FIXEDHF     0.800  0       0.0  0                       
2693    Uf 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2694    Ug 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 10f  
2695    Ug 2D1626        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
2696    Ug 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2697    Uh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 11f  
2698    Uh 2D1626        -6.8     0.      -8.5 FIXEDHF     0.800  0       0.0  0                       
2699    Uh 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2700    Ui 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 12f  
2701    Ui 2D1626        -5.9     0.      -7.4 FIXEDHF     0.800  0       0.0  0                       
2702    Ui 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2703    Uj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 13f  
2704    Uj 2D1626        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
2705    Uj 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2706    Uk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 14f  
2707    Uk 2D1626        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
2708    Uk 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2709    Up 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 6h   
2710    Up 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2711    Uq 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 7h   
2712    Uq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2713    Ur 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 8h   
2714    Ur 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2715    Us 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9f      -d9s2 9h   
2716    Us 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2717    Uz 3D1634        25.2     0.      31.5 FIXEDHF     0.800  0       0.0  0  4s9f      -d9 4s4p5s 
2718    Uz 2E1634       -12.6     0.     -15.7 FIXEDHF     0.800  0       0.0  0                       
2719    VW 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s11f     
2720    VW 3E2626         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0                       
2721    VX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s12f     
2722    VX 3E2626         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0                       
2723    VY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s13f     
2724    VY 3E2626         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0                       
2725    VZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -4s14f     
2726    VZ 3E2626         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
2727    Va 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 4f   
2728    Va 2D1626       -17.8     0.     -22.3 FIXEDHF     0.800  0       0.0  0                       
2729    Va 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2730    Vb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 5f   
2731    Vb 2D1626       -15.8     0.     -19.8 FIXEDHF     0.800  0       0.0  0                       
2732    Vb 3E1626        -0.5     0.      -0.6 FIXEDHF     0.800  0       0.0  0                       
2733    Vc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 6f   
2734    Vc 2D1626       -13.2     0.     -16.5 FIXEDHF     0.800  0       0.0  0                       
2735    Vc 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2736    Vd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 7f   
2737    Vd 2D1626       -11.0     0.     -13.7 FIXEDHF     0.800  0       0.0  0                       
2738    Vd 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2739    Ve 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 8f   
2740    Ve 2D1626        -9.2     0.     -11.5 FIXEDHF     0.800  0       0.0  0                       
2741    Ve 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2742    Vf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 9f   
2743    Vf 2D1626        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
2744    Vf 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2745    Vg 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 10f  
2746    Vg 2D1626        -6.8     0.      -8.5 FIXEDHF     0.800  0       0.0  0                       
2747    Vg 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2748    Vh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 11f  
2749    Vh 2D1626        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0                       
2750    Vh 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2751    Vi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 12f  
2752    Vi 2D1626        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0                       
2753    Vi 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2754    Vj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 13f  
2755    Vj 2D1626        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
2756    Vj 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2757    Vk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 14f  
2758    Vk 2D1626        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
2759    Vk 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2760    Vp 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 6h   
2761    Vp 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2762    Vq 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 7h   
2763    Vq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2764    Vr 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 8h   
2765    Vr 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2766    Vs 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s10f     -d9s2 9h   
2767    Vs 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2768    Vz 3D1634        21.8     0.      27.2 FIXEDHF     0.800  0       0.0  0  4s10f     -d9 4s4p5s 
2769    Vz 2E1634       -11.0     0.     -13.8 FIXEDHF     0.800  0       0.0  0                       
2770    WX 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -4s12f     
2771    WX 3E2626         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0                       
2772    WY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -4s13f     
2773    WY 3E2626         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0                       
2774    WZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -4s14f     
2775    WZ 3E2626         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
2776    Wa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 4f   
2777    Wa 2D1626       -15.4     0.     -19.2 FIXEDHF     0.800  0       0.0  0                       
2778    Wa 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2779    Wb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 5f   
2780    Wb 2D1626       -13.7     0.     -17.1 FIXEDHF     0.800  0       0.0  0                       
2781    Wb 3E1626        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0                       
2782    Wc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 6f   
2783    Wc 2D1626       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0                       
2784    Wc 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2785    Wd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 7f   
2786    Wd 2D1626        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
2787    Wd 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2788    We 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 8f   
2789    We 2D1626        -7.9     0.      -9.9 FIXEDHF     0.800  0       0.0  0                       
2790    We 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2791    Wf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 9f   
2792    Wf 2D1626        -6.8     0.      -8.5 FIXEDHF     0.800  0       0.0  0                       
2793    Wf 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2794    Wg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 10f  
2795    Wg 2D1626        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0                       
2796    Wg 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2797    Wh 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 11f  
2798    Wh 2D1626        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0                       
2799    Wh 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2800    Wi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 12f  
2801    Wi 2D1626        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0                       
2802    Wi 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2803    Wj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 13f  
2804    Wj 2D1626        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
2805    Wj 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2806    Wk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 14f  
2807    Wk 2D1626        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
2808    Wk 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2809    Wp 2D1627        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 6h   
2810    Wp 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2811    Wq 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 7h   
2812    Wq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2813    Wr 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 8h   
2814    Wr 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2815    Ws 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s11f     -d9s2 9h   
2816    Ws 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2817    Wz 3D1634        19.0     0.      23.8 FIXEDHF     0.800  0       0.0  0  4s11f     -d9 4s4p5s 
2818    Wz 2E1634        -9.8     0.     -12.2 FIXEDHF     0.800  0       0.0  0                       
2819    XY 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -4s13f     
2820    XY 3E2626         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0                       
2821    XZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -4s14f     
2822    XZ 3E2626         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
2823    Xa 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 4f   
2824    Xa 2D1626       -13.4     0.     -16.7 FIXEDHF     0.800  0       0.0  0                       
2825    Xa 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2826    Xb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 5f   
2827    Xb 2D1626       -11.9     0.     -14.9 FIXEDHF     0.800  0       0.0  0                       
2828    Xb 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2829    Xc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 6f   
2830    Xc 2D1626        -9.9     0.     -12.4 FIXEDHF     0.800  0       0.0  0                       
2831    Xc 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2832    Xd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 7f   
2833    Xd 2D1626        -8.2     0.     -10.3 FIXEDHF     0.800  0       0.0  0                       
2834    Xd 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2835    Xe 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 8f   
2836    Xe 2D1626        -7.0     0.      -8.7 FIXEDHF     0.800  0       0.0  0                       
2837    Xe 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2838    Xf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 9f   
2839    Xf 2D1626        -5.9     0.      -7.4 FIXEDHF     0.800  0       0.0  0                       
2840    Xf 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2841    Xg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 10f  
2842    Xg 2D1626        -5.1     0.      -6.4 FIXEDHF     0.800  0       0.0  0                       
2843    Xg 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2844    Xh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 11f  
2845    Xh 2D1626        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0                       
2846    Xh 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2847    Xi 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 12f  
2848    Xi 2D1626        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
2849    Xi 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2850    Xj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 13f  
2851    Xj 2D1626        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0                       
2852    Xj 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2853    Xk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 14f  
2854    Xk 2D1626        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0                       
2855    Xk 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2856    Xp 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 6h   
2857    Xp 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2858    Xq 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 7h   
2859    Xq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2860    Xr 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 8h   
2861    Xr 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2862    Xs 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9s2 9h   
2863    Xs 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2864    Xz 3D1634        16.8     0.      21.0 FIXEDHF     0.800  0       0.0  0  4s12f     -d9 4s4p5s 
2865    Xz 2E1634        -8.7     0.     -10.9 FIXEDHF     0.800  0       0.0  0                       
2866    YZ 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -4s14f     
2867    YZ 3E2626         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2868    Ya 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 4f   
2869    Ya 2D1626       -11.8     0.     -14.8 FIXEDHF     0.800  0       0.0  0                       
2870    Ya 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2871    Yb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 5f   
2872    Yb 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
2873    Yb 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2874    Yc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 6f   
2875    Yc 2D1626        -8.8     0.     -11.0 FIXEDHF     0.800  0       0.0  0                       
2876    Yc 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2877    Yd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 7f   
2878    Yd 2D1626        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0                       
2879    Yd 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2880    Ye 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 8f   
2881    Ye 2D1626        -6.2     0.      -7.7 FIXEDHF     0.800  0       0.0  0                       
2882    Ye 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2883    Yf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 9f   
2884    Yf 2D1626        -5.3     0.      -6.6 FIXEDHF     0.800  0       0.0  0                       
2885    Yf 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2886    Yg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 10f  
2887    Yg 2D1626        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0                       
2888    Yg 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2889    Yh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 11f  
2890    Yh 2D1626        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0                       
2891    Yh 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2892    Yi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 12f  
2893    Yi 2D1626        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0                       
2894    Yi 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2895    Yj 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 13f  
2896    Yj 2D1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
2897    Yj 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2898    Yk 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 14f  
2899    Yk 2D1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
2900    Yk 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2901    Yp 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 6h   
2902    Yp 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2903    Yq 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 7h   
2904    Yq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2905    Yr 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 8h   
2906    Yr 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2907    Ys 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s13f     -d9s2 9h   
2908    Ys 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2909    Yz 3D1634        15.0     0.      18.7 FIXEDHF     0.800  0       0.0  0  4s13f     -d9 4s4p5s 
2910    Yz 2E1634        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
2911    Za 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 4f   
2912    Za 2D1626       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0                       
2913    Za 3E1626        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0                       
2914    Zb 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 5f   
2915    Zb 2D1626        -9.4     0.     -11.8 FIXEDHF     0.800  0       0.0  0                       
2916    Zb 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2917    Zc 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 6f   
2918    Zc 2D1626        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0                       
2919    Zc 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2920    Zd 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 7f   
2921    Zd 2D1626        -6.6     0.      -8.2 FIXEDHF     0.800  0       0.0  0                       
2922    Zd 3E1626        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0                       
2923    Ze 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 8f   
2924    Ze 2D1626        -5.5     0.      -6.9 FIXEDHF     0.800  0       0.0  0                       
2925    Ze 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2926    Zf 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 9f   
2927    Zf 2D1626        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0                       
2928    Zf 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2929    Zg 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 10f  
2930    Zg 2D1626        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0                       
2931    Zg 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2932    Zh 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 11f  
2933    Zh 2D1626        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0                       
2934    Zh 3E1626        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0                       
2935    Zi 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 12f  
2936    Zi 2D1626        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0                       
2937    Zi 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2938    Zj 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 13f  
2939    Zj 2D1626        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
2940    Zj 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2941    Zk 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 14f  
2942    Zk 2D1626        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0                       
2943    Zk 3E1626        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0                       
2944    Zp 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 6h   
2945    Zp 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2946    Zq 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 7h   
2947    Zq 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2948    Zr 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 8h   
2949    Zr 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2950    Zs 2D1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s14f     -d9s2 9h   
2951    Zs 3E1627         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2952    Zz 3D1634        13.4     0.      16.8 FIXEDHF     0.800  0       0.0  0  4s14f     -d9 4s4p5s 
2953    Zz 2E1634        -7.1     0.      -8.9 FIXEDHF     0.800  0       0.0  0                       
2954    ab 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 5f   
2955    ab 2D1616        34.4     0.      43.0 FIXEDHF     0.800  0       0.0  0                       
2956    ab 4D1616         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
2957    ab 1E1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2958    ab 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2959    ab 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2960    ac 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 6f   
2961    ac 2D1616        24.4     0.      30.5 FIXEDHF     0.800  0       0.0  0                       
2962    ac 4D1616         1.0     0.       1.3 FIXEDHF     0.800  0       0.0  0                       
2963    ac 1E1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2964    ac 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2965    ac 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2966    ad 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 7f   
2967    ad 2D1616        18.6     0.      23.3 FIXEDHF     0.800  0       0.0  0                       
2968    ad 4D1616         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0                       
2969    ad 1E1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
2970    ad 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2971    ad 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2972    ae 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 8f   
2973    ae 2D1616        15.0     0.      18.7 FIXEDHF     0.800  0       0.0  0                       
2974    ae 4D1616         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
2975    ae 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2976    ae 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2977    ae 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2978    af 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 9f   
2979    af 2D1616        12.3     0.      15.4 FIXEDHF     0.800  0       0.0  0                       
2980    af 4D1616         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
2981    af 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2982    af 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2983    af 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2984    ag 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 10f  
2985    ag 2D1616        10.5     0.      13.1 FIXEDHF     0.800  0       0.0  0                       
2986    ag 4D1616         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
2987    ag 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2988    ag 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2989    ag 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2990    ah 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 11f  
2991    ah 2D1616         9.0     0.      11.3 FIXEDHF     0.800  0       0.0  0                       
2992    ah 4D1616         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
2993    ah 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2994    ah 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
2995    ah 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
2996    ai 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 12f  
2997    ai 2D1616         7.8     0.       9.8 FIXEDHF     0.800  0       0.0  0                       
2998    ai 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
2999    ai 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3000    ai 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3001    ai 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3002    aj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 13f  
3003    aj 2D1616         7.0     0.       8.7 FIXEDHF     0.800  0       0.0  0                       
3004    aj 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3005    aj 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3006    aj 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3007    aj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3008    ak 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 14f  
3009    ak 2D1616         7.0     0.       8.7 FIXEDHF     0.800  0       0.0  0                       
3010    ak 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3011    ak 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3012    ak 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3013    ak 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3014    al 2D2617       -11.8     0.     -14.8 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -4s6h      
3015    al 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3016    am 2D2617       -11.5     0.     -14.4 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -4s7h      
3017    am 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3018    an 2D2617       -10.2     0.     -12.8 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -4s8h      
3019    an 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3020    ao 2D2617        -9.0     0.     -11.3 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -4s9h      
3021    ao 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3022    ap 2D1617         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 6h   
3023    ap 4D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3024    ap 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3025    ap 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3026    aq 2D1617         6.6     0.       8.3 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 7h   
3027    aq 4D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3028    aq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3029    aq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3030    ar 2D1617         5.9     0.       7.4 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 8h   
3031    ar 4D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3032    ar 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3033    ar 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3034    as 2D1617         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 9h   
3035    as 4D1617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3036    as 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3037    as 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3038    av 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 8k   
3039    av 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3040    aw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 4f   -d9s2 9k   
3041    aw 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3042    bc 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 6f   
3043    bc 2D1616        21.5     0.      26.9 FIXEDHF     0.800  0       0.0  0                       
3044    bc 4D1616         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0                       
3045    bc 1E1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3046    bc 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3047    bc 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3048    bd 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 7f   
3049    bd 2D1616        16.6     0.      20.7 FIXEDHF     0.800  0       0.0  0                       
3050    bd 4D1616         0.7     0.       0.9 FIXEDHF     0.800  0       0.0  0                       
3051    bd 1E1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3052    bd 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3053    bd 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3054    be 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 8f   
3055    be 2D1616        13.3     0.      16.6 FIXEDHF     0.800  0       0.0  0                       
3056    be 4D1616         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
3057    be 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3058    be 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3059    be 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3060    bf 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 9f   
3061    bf 2D1616        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
3062    bf 4D1616         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
3063    bf 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3064    bf 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3065    bf 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3066    bg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 10f  
3067    bg 2D1616         9.4     0.      11.7 FIXEDHF     0.800  0       0.0  0                       
3068    bg 4D1616         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
3069    bg 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3070    bg 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3071    bg 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3072    bh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 11f  
3073    bh 2D1616         8.1     0.      10.1 FIXEDHF     0.800  0       0.0  0                       
3074    bh 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3075    bh 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3076    bh 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3077    bh 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3078    bi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 12f  
3079    bi 2D1616         7.0     0.       8.8 FIXEDHF     0.800  0       0.0  0                       
3080    bi 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3081    bi 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3082    bi 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3083    bi 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3084    bj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 13f  
3085    bj 2D1616         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0                       
3086    bj 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3087    bj 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3088    bj 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3089    bj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3090    bk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 14f  
3091    bk 2D1616         6.2     0.       7.8 FIXEDHF     0.800  0       0.0  0                       
3092    bk 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3093    bk 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3094    bk 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3095    bk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3096    bl 2D2617         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -4s6h      
3097    bl 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3098    bm 2D2617        -0.4     0.      -0.5 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -4s7h      
3099    bm 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3100    bn 2D2617        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -4s8h      
3101    bn 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3102    bo 2D2617        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -4s9h      
3103    bo 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3104    bp 2D1617        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 6h   
3105    bp 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3106    bp 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3107    bp 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3108    bq 2D1617         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 7h   
3109    bq 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3110    bq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3111    bq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3112    br 2D1617         0.9     0.       1.1 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 8h   
3113    br 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3114    br 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3115    br 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3116    bs 2D1617         1.1     0.       1.4 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 9h   
3117    bs 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3118    bs 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3119    bs 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3120    bv 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 8k   
3121    bv 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3122    bw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 5f   -d9s2 9k   
3123    bw 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3124    cd 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 7f   
3125    cd 2D1616        13.7     0.      17.1 FIXEDHF     0.800  0       0.0  0                       
3126    cd 4D1616         0.6     0.       0.8 FIXEDHF     0.800  0       0.0  0                       
3127    cd 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3128    cd 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3129    cd 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3130    ce 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 8f   
3131    ce 2D1616        11.0     0.      13.8 FIXEDHF     0.800  0       0.0  0                       
3132    ce 4D1616         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0                       
3133    ce 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3134    ce 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3135    ce 5E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3136    cf 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 9f   
3137    cf 2D1616         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
3138    cf 4D1616         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
3139    cf 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3140    cf 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3141    cf 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3142    cg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 10f  
3143    cg 2D1616         7.8     0.       9.7 FIXEDHF     0.800  0       0.0  0                       
3144    cg 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3145    cg 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3146    cg 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3147    cg 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3148    ch 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 11f  
3149    ch 2D1616         6.7     0.       8.4 FIXEDHF     0.800  0       0.0  0                       
3150    ch 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3151    ch 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3152    ch 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3153    ch 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3154    ci 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 12f  
3155    ci 2D1616         5.8     0.       7.3 FIXEDHF     0.800  0       0.0  0                       
3156    ci 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3157    ci 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3158    ci 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3159    ci 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3160    cj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 13f  
3161    cj 2D1616         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0                       
3162    cj 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3163    cj 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3164    cj 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3165    cj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3166    ck 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 14f  
3167    ck 2D1616         5.2     0.       6.5 FIXEDHF     0.800  0       0.0  0                       
3168    ck 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3169    ck 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3170    ck 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3171    ck 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3172    cl 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -4s6h      
3173    cl 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3174    cm 2D2617         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -4s7h      
3175    cm 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3176    cn 2D2617         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -4s8h      
3177    cn 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3178    co 2D2617         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -4s9h      
3179    co 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3180    cp 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 6h   
3181    cp 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3182    cp 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3183    cp 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3184    cq 2D1617        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 7h   
3185    cq 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3186    cq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3187    cq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3188    cr 2D1617        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 8h   
3189    cr 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3190    cr 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3191    cr 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3192    cs 2D1617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 9h   
3193    cs 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3194    cs 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3195    cs 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3196    cv 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 8k   
3197    cv 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3198    cw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6f   -d9s2 9k   
3199    cw 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3200    de 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 8f   
3201    de 2D1616         9.1     0.      11.4 FIXEDHF     0.800  0       0.0  0                       
3202    de 4D1616         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0                       
3203    de 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3204    de 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3205    de 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3206    df 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 9f   
3207    df 2D1616         7.6     0.       9.5 FIXEDHF     0.800  0       0.0  0                       
3208    df 4D1616         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3209    df 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3210    df 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3211    df 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3212    dg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 10f  
3213    dg 2D1616         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0                       
3214    dg 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3215    dg 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3216    dg 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3217    dg 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3218    dh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 11f  
3219    dh 2D1616         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0                       
3220    dh 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3221    dh 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3222    dh 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3223    dh 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3224    di 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 12f  
3225    di 2D1616         4.9     0.       6.1 FIXEDHF     0.800  0       0.0  0                       
3226    di 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3227    di 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3228    di 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3229    di 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3230    dj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 13f  
3231    dj 2D1616         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
3232    dj 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3233    dj 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3234    dj 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3235    dj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3236    dk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 14f  
3237    dk 2D1616         4.3     0.       5.4 FIXEDHF     0.800  0       0.0  0                       
3238    dk 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3239    dk 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3240    dk 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3241    dk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3242    dl 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -4s6h      
3243    dl 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3244    dm 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -4s7h      
3245    dm 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3246    dn 2D2617         0.6     0.       0.7 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -4s8h      
3247    dn 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3248    do 2D2617         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -4s9h      
3249    do 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3250    dp 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 6h   
3251    dp 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3252    dp 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3253    dp 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3254    dq 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 7h   
3255    dq 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3256    dq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3257    dq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3258    dr 2D1617        -0.3     0.      -0.4 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 8h   
3259    dr 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3260    dr 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3261    dr 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3262    ds 2D1617        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 9h   
3263    ds 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3264    ds 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3265    ds 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3266    dv 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 8k   
3267    dv 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3268    dw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7f   -d9s2 9k   
3269    dw 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3270    ef 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 9f   
3271    ef 2D1616         6.4     0.       8.0 FIXEDHF     0.800  0       0.0  0                       
3272    ef 4D1616         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0                       
3273    ef 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3274    ef 3E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3275    ef 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3276    eg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 10f  
3277    eg 2D1616         5.4     0.       6.8 FIXEDHF     0.800  0       0.0  0                       
3278    eg 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3279    eg 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3280    eg 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3281    eg 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3282    eh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 11f  
3283    eh 2D1616         4.7     0.       5.9 FIXEDHF     0.800  0       0.0  0                       
3284    eh 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3285    eh 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3286    eh 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3287    eh 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3288    ei 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 12f  
3289    ei 2D1616         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0                       
3290    ei 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3291    ei 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3292    ei 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3293    ei 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3294    ej 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 13f  
3295    ej 2D1616         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0                       
3296    ej 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3297    ej 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3298    ej 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3299    ej 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3300    ek 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 14f  
3301    ek 2D1616         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0                       
3302    ek 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3303    ek 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3304    ek 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3305    ek 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3306    el 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -4s6h      
3307    el 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3308    em 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -4s7h      
3309    em 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3310    en 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -4s8h      
3311    en 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3312    eo 2D2617         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -4s9h      
3313    eo 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3314    ep 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 6h   
3315    ep 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3316    ep 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3317    ep 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3318    eq 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 7h   
3319    eq 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3320    eq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3321    eq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3322    er 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 8h   
3323    er 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3324    er 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3325    er 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3326    es 2D1617        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 9h   
3327    es 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3328    es 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3329    es 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3330    ev 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 8k   
3331    ev 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3332    ew 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8f   -d9s2 9k   
3333    ew 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3334    fg 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 10f  
3335    fg 2D1616         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0                       
3336    fg 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3337    fg 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3338    fg 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3339    fg 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3340    fh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 11f  
3341    fh 2D1616         4.0     0.       5.0 FIXEDHF     0.800  0       0.0  0                       
3342    fh 4D1616         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0                       
3343    fh 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3344    fh 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3345    fh 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3346    fi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 12f  
3347    fi 2D1616         3.5     0.       4.4 FIXEDHF     0.800  0       0.0  0                       
3348    fi 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3349    fi 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3350    fi 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3351    fi 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3352    fj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 13f  
3353    fj 2D1616         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0                       
3354    fj 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3355    fj 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3356    fj 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3357    fj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3358    fk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 14f  
3359    fk 2D1616         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0                       
3360    fk 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3361    fk 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3362    fk 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3363    fk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3364    fl 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -4s6h      
3365    fl 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3366    fm 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -4s7h      
3367    fm 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3368    fn 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -4s8h      
3369    fn 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3370    fo 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -4s9h      
3371    fo 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3372    fp 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 6h   
3373    fp 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3374    fp 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3375    fp 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3376    fq 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 7h   
3377    fq 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3378    fq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3379    fq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3380    fr 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 8h   
3381    fr 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3382    fr 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3383    fr 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3384    fs 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 9h   
3385    fs 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3386    fs 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3387    fs 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3388    fv 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 8k   
3389    fv 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3390    fw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9f   -d9s2 9k   
3391    fw 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3392    gh 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 11f  
3393    gh 2D1616         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0                       
3394    gh 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3395    gh 1E1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3396    gh 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3397    gh 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3398    gi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 12f  
3399    gi 2D1616         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0                       
3400    gi 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3401    gi 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3402    gi 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3403    gi 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3404    gj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 13f  
3405    gj 2D1616         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0                       
3406    gj 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3407    gj 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3408    gj 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3409    gj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3410    gk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 14f  
3411    gk 2D1616         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0                       
3412    gk 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3413    gk 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3414    gk 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3415    gk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3416    gl 2D2617        -0.1     0.      -0.1 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -4s6h      
3417    gl 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3418    gm 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -4s7h      
3419    gm 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3420    gn 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -4s8h      
3421    gn 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3422    go 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -4s9h      
3423    go 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3424    gp 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 6h   
3425    gp 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3426    gp 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3427    gp 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3428    gq 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 7h   
3429    gq 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3430    gq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3431    gq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3432    gr 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 8h   
3433    gr 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3434    gr 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3435    gr 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3436    gs 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 9h   
3437    gs 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3438    gs 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3439    gs 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3440    gv 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 8k   
3441    gv 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3442    gw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 10f  -d9s2 9k   
3443    gw 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3444    hi 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 12f  
3445    hi 2D1616         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0                       
3446    hi 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3447    hi 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3448    hi 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3449    hi 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3450    hj 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 13f  
3451    hj 2D1616         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
3452    hj 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3453    hj 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3454    hj 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3455    hj 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3456    hk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 14f  
3457    hk 2D1616         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0                       
3458    hk 4D1616         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0                       
3459    hk 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3460    hk 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3461    hk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3462    hl 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -4s6h      
3463    hl 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3464    hm 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -4s7h      
3465    hm 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3466    hn 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -4s8h      
3467    hn 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3468    ho 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -4s9h      
3469    ho 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3470    hp 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 6h   
3471    hp 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3472    hp 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3473    hp 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3474    hq 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 7h   
3475    hq 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3476    hq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3477    hq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3478    hr 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 8h   
3479    hr 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3480    hr 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3481    hr 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3482    hs 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 9h   
3483    hs 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3484    hs 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3485    hs 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3486    hv 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 8k   
3487    hv 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3488    hw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 11f  -d9s2 9k   
3489    hw 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3490    ij 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -d9s2 13f  
3491    ij 2D1616         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
3492    ij 4D1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3493    ij 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3494    ij 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3495    ij 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3496    ik 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -d9s2 14f  
3497    ik 2D1616         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0                       
3498    ik 4D1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3499    ik 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3500    ik 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3501    ik 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3502    il 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -4s6h      
3503    il 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3504    im 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -4s7h      
3505    im 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3506    in 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -4s8h      
3507    in 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3508    io 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -4s9h      
3509    io 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3510    ip 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -d9s2 6h   
3511    ip 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3512    ip 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3513    ip 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3514    iq 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -d9s2 7h   
3515    iq 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3516    iq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3517    iq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3518    ir 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -d9s2 8h   
3519    ir 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3520    ir 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3521    ir 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3522    is 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -d9s2 9h   
3523    is 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3524    is 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3525    is 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3526    iv 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -d9s2 8k   
3527    iv 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3528    iw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 12f  -d9s2 9k   
3529    iw 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3530    jk 0D1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -d9s2 14f  
3531    jk 2D1616         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0                       
3532    jk 4D1616         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0                       
3533    jk 1E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3534    jk 3E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3535    jk 5E1616         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3536    jl 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -4s6h      
3537    jl 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3538    jm 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -4s7h      
3539    jm 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3540    jn 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -4s8h      
3541    jn 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3542    jo 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -4s9h      
3543    jo 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3544    jp 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -d9s2 6h   
3545    jp 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3546    jp 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3547    jp 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3548    jq 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -d9s2 7h   
3549    jq 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3550    jq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3551    jq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3552    jr 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -d9s2 8h   
3553    jr 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3554    jr 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3555    jr 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3556    js 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -d9s2 9h   
3557    js 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3558    js 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3559    js 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3560    jv 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -d9s2 8k   
3561    jv 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3562    jw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 13f  -d9s2 9k   
3563    jw 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3564    kl 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14f  -4s6h      
3565    kl 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3566    km 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14f  -4s7h      
3567    km 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3568    kn 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14f  -4s8h      
3569    kn 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3570    ko 2D2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14f  -4s9h      
3571    ko 5E2617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3572    kp 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14f  -d9s2 6h   
3573    kp 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3574    kp 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3575    kp 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3576    kq 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14f  -d9s2 7h   
3577    kq 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3578    kq 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3579    kq 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3580    kr 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14f  -d9s2 8h   
3581    kr 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3582    kr 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3583    kr 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3584    ks 2D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14f  -d9s2 9h   
3585    ks 4D1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3586    ks 3E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3587    ks 5E1617         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3588    kv 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14f  -d9s2 8k   
3589    kv 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3590    kw 4D1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 14f  -d9s2 9k   
3591    kw 5E1618         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3592    lm 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6h      -4s7h      
3593    lm 5E2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3594    ln 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6h      -4s8h      
3595    ln 5E2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3596    lo 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6h      -4s9h      
3597    lo 5E2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3598    lp 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s6h      -d9s2 6h   
3599    lp 2D1727        -7.5     0.      -9.4 FIXEDHF     0.800  0       0.0  0                       
3600    lp 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3601    lq 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6h      -d9s2 7h   
3602    lq 2D1727        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0                       
3603    lq 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3604    lr 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6h      -d9s2 8h   
3605    lr 2D1727        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
3606    lr 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3607    ls 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s6h      -d9s2 9h   
3608    ls 2D1727        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
3609    ls 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3610    lv 2D1728        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0  4s6h      -d9s2 8k   
3611    lv 5E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3612    lw 2D1728        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0  4s6h      -d9s2 9k   
3613    lw 5E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3614    mn 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7h      -4s8h      
3615    mn 5E2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3616    mo 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7h      -4s9h      
3617    mo 5E2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3618    mp 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7h      -d9s2 6h   
3619    mp 2D1727        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0                       
3620    mp 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3621    mq 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s7h      -d9s2 7h   
3622    mq 2D1727        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0                       
3623    mq 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3624    mr 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7h      -d9s2 8h   
3625    mr 2D1727        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0                       
3626    mr 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3627    ms 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s7h      -d9s2 9h   
3628    ms 2D1727        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
3629    ms 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3630    mv 2D1728         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  4s7h      -d9s2 8k   
3631    mv 5E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3632    mw 2D1728        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  4s7h      -d9s2 9k   
3633    mw 5E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3634    no 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8h      -4s9h      
3635    no 5E2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3636    np 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8h      -d9s2 6h   
3637    np 2D1727        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0                       
3638    np 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3639    nq 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8h      -d9s2 7h   
3640    nq 2D1727        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0                       
3641    nq 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3642    nr 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s8h      -d9s2 8h   
3643    nr 2D1727        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0                       
3644    nr 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3645    ns 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8h      -d9s2 9h   
3646    ns 2D1727        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
3647    ns 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3648    nv 2D1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8h      -d9s2 8k   
3649    nv 5E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3650    nw 2D1728         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  4s8h      -d9s2 9k   
3651    nw 5E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3652    op 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9h      -d9s2 6h   
3653    op 2D1727        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0                       
3654    op 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3655    oq 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9h      -d9s2 7h   
3656    oq 2D1727        -2.6     0.      -3.2 FIXEDHF     0.800  0       0.0  0                       
3657    oq 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3658    or 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9h      -d9s2 8h   
3659    or 2D1727        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0                       
3660    or 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3661    os 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s9h      -d9s2 9h   
3662    os 2D1727        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0                       
3663    os 5E1727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3664    ov 2D1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9h      -d9s2 8k   
3665    ov 5E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3666    ow 2D1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9h      -d9s2 9k   
3667    ow 5E1728         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3668    pq 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6h   -d9s2 7h   
3669    pq 2D1717         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0                       
3670    pq 4D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3671    pq 3E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3672    pq 5E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3673    pq 7E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3674    pr 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6h   -d9s2 8h   
3675    pr 2D1717         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0                       
3676    pr 4D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3677    pr 3E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3678    pr 5E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3679    pr 7E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3680    ps 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 6h   -d9s2 9h   
3681    ps 2D1717         1.4     0.       1.7 FIXEDHF     0.800  0       0.0  0                       
3682    ps 4D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3683    ps 3E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3684    ps 5E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3685    ps 7E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3686    pt 2D2718        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0  d9s2 6h   -4s8k      
3687    pt 7E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3688    pu 2D2718        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0  d9s2 6h   -4s9k      
3689    pu 7E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3690    pv 2D1718         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 6h   -d9s2 8k   
3691    pv 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3692    pv 5E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3693    pv 7E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3694    pw 2D1718         1.0     0.       1.2 FIXEDHF     0.800  0       0.0  0  d9s2 6h   -d9s2 9k   
3695    pw 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3696    pw 5E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3697    pw 7E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3698    qr 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7h   -d9s2 8h   
3699    qr 2D1717         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0                       
3700    qr 4D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3701    qr 3E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3702    qr 5E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3703    qr 7E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3704    qs 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 7h   -d9s2 9h   
3705    qs 2D1717         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0                       
3706    qs 4D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3707    qs 3E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3708    qs 5E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3709    qs 7E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3710    qt 2D2718         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0  d9s2 7h   -4s8k      
3711    qt 7E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3712    qu 2D2718        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 7h   -4s9k      
3713    qu 7E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3714    qv 2D1718        -0.2     0.      -0.3 FIXEDHF     0.800  0       0.0  0  d9s2 7h   -d9s2 8k   
3715    qv 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3716    qv 5E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3717    qv 7E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3718    qw 2D1718         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0  d9s2 7h   -d9s2 9k   
3719    qw 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3720    qw 5E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3721    qw 7E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3722    rs 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8h   -d9s2 9h   
3723    rs 2D1717         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0                       
3724    rs 4D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3725    rs 3E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3726    rs 5E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3727    rs 7E1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3728    rt 2D2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8h   -4s8k      
3729    rt 7E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3730    ru 2D2718         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0  d9s2 8h   -4s9k      
3731    ru 7E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3732    rv 2D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8h   -d9s2 8k   
3733    rv 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3734    rv 5E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3735    rv 7E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3736    rw 2D1718        -0.2     0.      -0.2 FIXEDHF     0.800  0       0.0  0  d9s2 8h   -d9s2 9k   
3737    rw 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3738    rw 5E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3739    rw 7E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3740    st 2D2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9h   -4s8k      
3741    st 7E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3742    su 2D2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9h   -4s9k      
3743    su 7E2718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3744    sv 2D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9h   -d9s2 8k   
3745    sv 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3746    sv 5E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3747    sv 7E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3748    sw 2D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 9h   -d9s2 9k   
3749    sw 4D1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3750    sw 5E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3751    sw 7E1718         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3752    tu 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8k      -4s9k      
3753    tu 7E2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3754    tv 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s8k      -d9s2 8k   
3755    tv 2D1828        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0                       
3756    tv 7E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3757    tw 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s8k      -d9s2 9k   
3758    tw 2D1828        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
3759    tw 7E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3760    uv 2D1112         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  4s9k      -d9s2 8k   
3761    uv 2D1828        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0                       
3762    uv 7E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3763    uw 2D1112       705.9     0.     882.4 FIXEDHF     0.800  0       0.0  0  4s9k      -d9s2 9k   
3764    uw 2D1828        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0                       
3765    uw 7E1828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3766    vw 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  d9s2 8k   -d9s2 9k   
3767    vw 2D1818         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0                       
3768    vw 4D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3769    vw 5E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3770    vw 7E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3771    vw 9E1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0                       
3772    xy 1D3445     -4831.0     0.   -6038.7 FIXEDHF     0.800  0       0.0  0  4p5s      -5s5p      
3773    xy 0E3445      -677.0     0.    -846.2 FIXEDHF     0.800  0       0.0  0                       
3774    xz 2D1112       930.2     0.    1162.8 FIXEDHF     0.800  0       0.0  0  4p5s      -d9 4s4p5s 
3775    xz 2D1323     -9906.0     0.  -12382.5 FIXEDHF     0.800  0       0.0  0                       
3776    xz 1E1323     -9822.9     0.  -12278.6 FIXEDHF     0.800  0       0.0  0                       
3777    yz 2D1523     -3173.8     0.   -3967.3 FIXEDHF     0.800  0       0.0  0  5s5p      -d9 4s4p5s 
3778    yz 1E1523     -3234.0     0.   -4042.5 FIXEDHF     0.800  0       0.0  0                       
