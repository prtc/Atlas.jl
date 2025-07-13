set3802
delete fort*
assign h3802e.ham fort.7
assign h3802e.dat fort.99
#assign h3802e20 fort.20
#assign h3802e31 fort.31
#assign h3802e32 fort.32
#assign h3802e41 fort.41
#assign h3802e41 fort.70
#assign h3802e41 fort.71
#assign cowanlanl:save72.dat fort.72
#assign cowanlanl:save73.dat fort.73
#assign cowanlanl:save74.dat fort.74
rcgham << "eof" > h3802e.log
 849 0 h3802e
s 2  p 6  p 0  f 0  h 0  k 0  s 0  d 0      sr iii s2p6         e=   -697421.99583
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      sr iii s2p5 5p      e=   -697193.02960
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      sr iii s2p5 6p      e=   -697137.59364
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      sr iii s2p5 7p      e=   -697113.96962
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      sr iii s2p5 8p      e=   -697101.45362
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      sr iii s2p5 9p      e=   -697093.99369
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      sr iii s2p5 10p     e=   -697089.18073
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      sr iii s2p5 11p     e=   -697085.89303
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      sr iii s2p5 12p     e=   -697083.54854
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      sr iii s2p5 13p     e=   -697081.81904
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      sr iii s2p5 4f      e=   -697138.02348
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      sr iii s2p5 5f      e=   -697114.55813
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      sr iii s2p5 6f      e=   -697101.90592
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      sr iii s2p5 7f      e=   -697094.32598
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      sr iii s2p5 8f      e=   -697089.42617
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      sr iii s2p5 9f      e=   -697086.07894
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      sr iii s2p5 10f     e=   -697083.69224
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      sr iii s2p5 11f     e=   -697081.92750
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      sr iii s2p5 12f     e=   -697080.58733
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      sr iii s2p5 13f     e=   -697079.54996
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      sr iii s2p5 6h      e=   -697101.06765
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      sr iii s2p5 7h      e=   -697093.78766
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      sr iii s2p5 8h      e=   -697089.05869
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      sr iii s2p5 9h      e=   -697085.81686
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      sr iii s2p5 10h     e=   -697083.49742
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      sr iii s2p5 11h     e=   -697081.77843
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      sr iii s2p5 12h     e=   -697080.47271
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      sr iii s2p5 13h     e=   -697079.45877
s 2  p 5  p 0  f 0  h 0  k 1  s 0  d 0      sr iii s2p5 8k      e=   -697089.04193
s 2  p 5  p 0  f 0  h 0  k 1  s 0  d 0      sr iii s2p5 9k      e=   -697085.80209
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      sr iii sp6 5s       e=   -697039.97335
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      sr iii sp6 6s       e=   -696964.61328
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      sr iii sp6 7s       e=   -696934.71451
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      sr iii sp6 8s       e=   -696919.56317
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      sr iii sp6 9s       e=   -696910.79909
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      sr iii sp6 10s      e=   -696905.26614
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      sr iii sp6 11s      e=   -696901.55108
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      sr iii sp6 12s      e=   -696898.93636
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      sr iii sp6 13s      e=   -696897.02283
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      sr iii sp6 4d       e=   -697049.38076
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      sr iii sp6 5d       e=   -696963.69693
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      sr iii sp6 6d       e=   -696933.96509
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      sr iii sp6 7d       e=   -696919.08432
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      sr iii sp6 8d       e=   -696910.48679
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      sr iii sp6 9d       e=   -696905.05380
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      sr iii sp6 10d      e=   -696901.40121
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      sr iii sp6 11d      e=   -696898.82684
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      sr iii sp6 12d      e=   -696896.93956
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      sr iii sp6 13d      e=   -696895.51749
