$SET def ku6e:[kurucz.4101]
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN POOLQ:H4101E.HAM FOR007
$ASSIGN H4101E.DAT FOR099
$ASSIGN H4101E20 FOR020
$ASSIGN H4101E31 FOR031
$ASSIGN H4101E32 FOR032
$ASSIGN H4101E41 FOR041
$ASSIGN H4101E41 FOR070
$ASSIGN H4101E41 FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGHAM
 861 0 H4101E
d 4  s 0  p 0  s 0  d 0  g 0  i 0  s 0      nb ii d4            e=   -837883.67604
d 3  s 1  p 0  s 0  d 0  g 0  i 0  s 0      nb ii d3 5s         e=   -837883.02423
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 6s         e=   -837822.83983
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 7s         e=   -837802.73590
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 8s         e=   -837793.52589
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 9s         e=   -837788.49181
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 10s        e=   -837785.43651
d 3  s 0  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d3 11s        e=   -837783.44118
d 2  s 2  p 0  s 0  d 0  g 0  i 0  s 0      nb ii d2 5s2        e=   -837866.94564
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s6s       e=   -837803.47795
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s7s       e=   -837781.28895
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s8s       e=   -837771.51386
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s9s       e=   -837766.25103
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s10s      e=   -837763.08443
d 2  s 1  p 0  s 1  d 0  g 0  i 0  s 0      nb ii d2 5s11s      e=   -837761.02797
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 6s        e=   -837766.11918
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 7s        e=   -837742.21209
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 8s        e=   -837731.95214
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 9s        e=   -837726.49283
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 10s       e=   -837723.22979
d 1  s 2  p 0  s 1  d 0  g 0  i 0  s 0      nb ii ds2 11s       e=   -837721.12016
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 5d         e=   -837818.12700
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 6d         e=   -837800.32369
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 7d         e=   -837792.20724
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 8d         e=   -837787.70441
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 9d         e=   -837784.92818
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 10d        e=   -837783.09353
d 3  s 0  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d3 11d        e=   -837781.82088
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s5d       e=   -837797.88956
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s6d       e=   -837778.60333
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s7d       e=   -837770.10880
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s8d       e=   -837765.42562
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s9d       e=   -837762.55905
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s10d      e=   -837760.67328
d 2  s 1  p 0  s 0  d 1  g 0  i 0  s 0      nb ii d2 5s11d      e=   -837759.36612
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 5d        e=   -837760.38641
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 6d        e=   -837739.59659
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 7d        e=   -837730.58944
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 8d        e=   -837725.69540
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 9d        e=   -837722.72374
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 10d       e=   -837720.77879
d 1  s 2  p 0  s 0  d 1  g 0  i 0  s 0      nb ii ds2 11d       e=   -837719.43624
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 5g         e=   -837794.50345
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 6g         e=   -837789.10141
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 7g         e=   -837785.83381
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 8g         e=   -837783.71332
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 9g         e=   -837782.25905
d 3  s 0  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d3 10g        e=   -837781.22058
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s5g       e=   -837772.07823
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s6g       e=   -837766.63955
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s7g       e=   -837763.34717
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s8g       e=   -837761.21157
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s9g       e=   -837759.74763
d 2  s 1  p 0  s 0  d 0  g 1  i 0  s 0      nb ii d2 5s10g      e=   -837758.70360
d 3  s 0  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d3 7i         e=   -837785.76543
d 3  s 0  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d3 8i         e=   -837783.66556
d 3  s 0  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d3 9i         e=   -837782.22514
d 2  s 1  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d2 5s7i       e=   -837763.23174
d 2  s 1  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d2 5s8i       e=   -837761.13165
d 2  s 1  p 0  s 0  d 0  g 0  i 1  s 0      nb ii d2 5s9i       e=   -837759.69140
d 2  s 0  p 2  s 0  d 0  g 0  i 0  s 0      nb ii d2 5p2        e=   -837801.32551
