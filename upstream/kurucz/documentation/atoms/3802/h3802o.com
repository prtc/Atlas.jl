set3802
delete fort*
assign h3802o.ham fort.7
assign h3802o.dat fort.99
#assign h3802o20 for020
#assign h3802o31 for031
#assign h3802o32 for032
#assign h3802o41 for041
#assign h3802o41 for070
#assign h3802o41 for071
#assign cowanlanl:save72.dat for072
#assign cowanlanl:save73.dat for073
#assign cowanlanl:save74.dat for074
rcgham << "eof" > h3802o.log
 850 0 H3802O
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      sr iii s2p5 5s      e=   -697225.47370
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      sr iii s2p5 6s      e=   -697149.95878
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      sr iii s2p5 7s      e=   -697120.04422
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      sr iii s2p5 8s      e=   -697104.89042
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      sr iii s2p5 9s      e=   -697096.12669
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      sr iii s2p5 10s     e=   -697090.59415
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      sr iii s2p5 11s     e=   -697086.87931
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      sr iii s2p5 12s     e=   -697084.26506
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      sr iii s2p5 14s     e=   -697080.91015
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      sr iii s2p5 4d      e=   -697230.40050
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      sr iii s2p5 5d      e=   -697148.33305
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      sr iii s2p5 6d      e=   -697119.00454
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      sr iii s2p5 7d      e=   -697104.26051
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      sr iii s2p5 8d      e=   -697095.72488
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      sr iii s2p5 9d      e=   -697090.32401
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      sr iii s2p5 10d     e=   -697086.68986
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      sr iii s2p5 11d     e=   -697084.12704
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      sr iii s2p5 12d     e=   -697082.24758
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      sr iii s2p5 13d     e=   -697080.83050
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      sr iii s2p5 5g      e=   -697113.35693
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      sr iii s2p5 6g      e=   -697101.22242
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      sr iii s2p5 7g      e=   -697093.88912
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      sr iii s2p5 8g      e=   -697089.12657
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      sr iii s2p5 9g      e=   -697085.86431
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      sr iii s2p5 10g     e=   -697083.53255
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      sr iii s2p5 11g     e=   -697081.80601
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      sr iii s2p5 12g     e=   -697080.49245
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      sr iii s2p5 13g     e=   -697079.47375
s 2  p 5  s 0  d 0  g 0  i 1  p 0  f 0      sr iii s2p5 7i      e=   -697093.76777
s 2  p 5  s 0  d 0  g 0  i 1  p 0  f 0      sr iii s2p5 8i      e=   -697089.04433
s 2  p 5  s 0  d 0  g 0  i 1  p 0  f 0      sr iii s2p5 9i      e=   -697085.80418
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      sr iii sp6 5p       e=   -697008.54532
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      sr iii sp6 6p       e=   -696952.56293
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      sr iii sp6 7p       e=   -696928.78475
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      sr iii sp6 8p       e=   -696916.20615
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      sr iii sp6 9p       e=   -696908.71489
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      sr iii sp6 10p      e=   -696903.88488
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      sr iii sp6 11p      e=   -696900.58697
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      sr iii sp6 12p      e=   -696898.23581
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      sr iii sp6 14p      e=   -696896.50230
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      sr iii sp6 4f       e=   -696952.89035
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      sr iii sp6 5f       e=   -696929.35780
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      sr iii sp6 6f       e=   -696916.65955
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      sr iii sp6 7f       e=   -696909.05261
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      sr iii sp6 8f       e=   -696904.13540
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      sr iii sp6 9f       e=   -696900.77745
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      sr iii sp6 10f      e=   -696898.38348
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      sr iii sp6 11f      e=   -696896.61353
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      sr iii sp6 12f      e=   -696895.27010
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      sr iii sp6 13f      e=   -696894.23019
