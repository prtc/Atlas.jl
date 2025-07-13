$SETPOOLG
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN 4701:H4701E.HAM FOR007
$ASSIGN 4701:H4701E.DAT FOR099
$ASSIGN H4701E20 FOR020
$ASSIGN H4701E31 FOR031
$ASSIGN H4701E32 FOR032
$ASSIGN H4701E41 FOR041
$ASSIGN H4701E41 FOR070
$ASSIGN H4701E41 FOR071
$ASSIGN COWANLANL:SAVE72.DAT FOR072
$ASSIGN COWANLANL:SAVE73.DAT FOR073
$ASSIGN COWANLANL:SAVE74.DAT FOR074
$RUN CRAY:RCGHAM
 842 0 H4701E
d10  s 0  p 0  d 0  s 0  g 0  i 0  l 0      ag ii d10           e=  -1165962.997
d 9  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d9 5d         e=  -1165842.442
d 9  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d9 6d         e=  -1165821.922
d 9  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d9 7d         e=  -1165812.772
d 9  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d9 8d         e=  -1165807.792
d 9  s 0  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d9 9d         e=  -1165804.771
d 8  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d8 5s5d       e=  -1165771.522
d 8  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d8 5s6d       e=  -1165749.438
d 8  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d8 5s7d       e=  -1165739.904
d 8  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d8 5s8d       e=  -1165734.758
d 8  s 1  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d8 5s9d       e=  -1165731.650
d 7  s 2  p 0  d 1  s 0  g 0  i 0  l 0      ag ii d7s2 5d       e=  -1165674.123
d 9  s 1  p 0  d 0  s 0  g 0  i 0  l 0      ag ii d9 5s         e=  -1165924.313
d 9  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ag ii d9 6s         e=  -1165847.949
d 9  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ag ii d9 7s         e=  -1165824.560
d 9  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ag ii d9 8s         e=  -1165814.175
d 9  s 0  p 0  d 0  s 1  g 0  i 0  l 0      ag ii d9 9s         e=  -1165808.620
d 8  s 2  p 0  d 0  s 0  g 0  i 0  l 0      ag ii d8 5s2        e=  -1165859.910
d 8  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ag ii d8 5s6s       e=  -1165778.381
d 8  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ag ii d8 5s7s       e=  -1165752.495
d 8  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ag ii d8 5s8s       e=  -1165741.469
d 8  s 1  p 0  d 0  s 1  g 0  i 0  l 0      ag ii d8 5s9s       e=  -1165735.662
d 7  s 2  p 0  d 0  s 1  g 0  i 0  l 0      ag ii d7s2 6s       e=  -1165681.055
d 9  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ag ii d9 5g         e=  -1165813.823
d 9  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ag ii d9 6g         e=  -1165808.448
d 9  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ag ii d9 7g         e=  -1165805.200
d 9  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ag ii d9 8g         e=  -1165803.092
d 9  s 0  p 0  d 0  s 0  g 1  i 0  l 0      ag ii d9 9g         e=  -1165801.645
d 8  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ag ii d8 5s5g       e=  -1165740.630
d 8  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ag ii d8 5s6g       e=  -1165735.232
d 8  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ag ii d8 5s7g       e=  -1165731.966
d 8  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ag ii d8 5s8g       e=  -1165729.846
d 8  s 1  p 0  d 0  s 0  g 1  i 0  l 0      ag ii d8 5s9g       e=  -1165728.392
d 9  s 0  p 0  d 0  s 0  g 0  i 1  l 0      ag ii d9 7i         e=  -1165805.172
d 9  s 0  p 0  d 0  s 0  g 0  i 1  l 0      ag ii d9 8i         e=  -1165803.071
d 9  s 0  p 0  d 0  s 0  g 0  i 1  l 0      ag ii d9 9i         e=  -1165801.630
d 8  s 1  p 0  d 0  s 0  g 0  i 1  l 0      ag ii d8 5s7i       e=  -1165731.900
d 8  s 1  p 0  d 0  s 0  g 0  i 1  l 0      ag ii d8 5s8i       e=  -1165729.799
d 8  s 1  p 0  d 0  s 0  g 0  i 1  l 0      ag ii d8 5s9i       e=  -1165728.358
d 9  s 0  p 0  d 0  s 0  g 0  i 0  l 1      ag ii d9 9l         e=  -1165800.600
d 8  s 1  p 0  d 0  s 0  g 0  i 0  l 1      ag ii d8 5s9l       e=  -1165727.328
d 8  s 0  p 2  d 0  s 0  g 0  i 0  l 0      ag ii d8 5p2        e=  -1165769.459
