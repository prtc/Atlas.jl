set4004
delete fort*
assign h4004o.ham fort.7
assign h4004o.dat fort.99
#assign h4004o20 for020
#assign h4004o31 for031
#assign h4004o32 for032
#assign h4004o41 for041
#assign h4004o41 for070
#assign h4004o41 for071
#assign cowanlanl:save72.dat for072
#assign cowanlanl:save73.dat for073
#assign cowanlanl:save74.dat for074
rcgham << "eof" > h4004o.log
 850 0 h4004o
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      zr v   s2p5 5s      e=   -788510.06159
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      zr v   s2p5 6s      e=   -788364.34672
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      zr v   s2p5 7s      e=   -788300.50957
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      zr v   s2p5 8s      e=   -788266.44322
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      zr v   s2p5 9s      e=   -788246.04377
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      zr v   s2p5 10s     e=   -788232.85259
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      zr v   s2p5 11s     e=   -788223.82738
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      zr v   s2p5 12s     e=   -788217.37946
s 2  p 5  s 1  d 0  g 0  i 0  p 0  f 0      zr v   s2p5 13s     e=   -788212.60548
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      zr v   s2p5 4d      e=   -788577.94035
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      zr v   s2p5 5d      e=   -788380.23836
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      zr v   s2p5 6d      e=   -788307.44330
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      zr v   s2p5 7d      e=   -788270.21295
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      zr v   s2p5 8d      e=   -788248.34294
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      zr v   s2p5 9d      e=   -788234.36380
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      zr v   s2p5 10d     e=   -788224.87586
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      zr v   s2p5 11d     e=   -788218.13175
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      zr v   s2p5 12d     e=   -788213.16866
s 2  p 5  s 0  d 1  g 0  i 0  p 0  f 0      zr v   s2p5 13d     e=   -788209.41543
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      zr v   s2p5 5g      e=   -788300.85747
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      zr v   s2p5 6g      e=   -788266.87578
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      zr v   s2p5 7g      e=   -788246.39218
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      zr v   s2p5 8g      e=   -788233.11530
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      zr v   s2p5 9g      e=   -788224.02427
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      zr v   s2p5 10g     e=   -788217.52424
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      zr v   s2p5 11g     e=   -788212.72217
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      zr v   s2p5 12g     e=   -788209.07700
s 2  p 5  s 0  d 0  g 1  i 0  p 0  f 0      zr v   s2p5 13g     e=   -788206.23601
s 2  p 5  s 0  d 0  g 0  i 1  p 0  f 0      zr v   s2p5 7i      e=   -788245.93742
s 2  p 5  s 0  d 0  g 0  i 1  p 0  f 0      zr v   s2p5 8i      e=   -788232.81575
s 2  p 5  s 0  d 0  g 0  i 1  p 0  f 0      zr v   s2p5 9i      e=   -788223.81749
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      zr v   sp6 5p       e=   -788230.72680
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      zr v   sp6 6p       e=   -788114.56910
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      zr v   sp6 7p       e=   -788061.24481
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      zr v   sp6 8p       e=   -788031.86491
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      zr v   sp6 9p       e=   -788013.88103
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      zr v   sp6 10p      e=   -788002.05925
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      zr v   sp6 11p      e=   -787993.86661
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      zr v   sp6 12p      e=   -787987.96098
s 1  p 6  s 0  d 0  g 0  i 0  p 1  f 0      zr v   sp6 13p      e=   -787983.55323
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      zr v   sp6 4f       e=   -788148.91378
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      zr v   sp6 5f       e=   -788081.11918
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      zr v   sp6 6f       e=   -788044.10842
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      zr v   sp6 7f       e=   -788021.83771
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      zr v   sp6 8f       e=   -788007.48750
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      zr v   sp6 9f       e=   -787997.72470
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      zr v   sp6 10f      e=   -787990.78711
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      zr v   sp6 11f      e=   -787985.69104
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      zr v   sp6 12f      e=   -787981.83721
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 1      zr v   sp6 13f      e=   -787978.84820
eof
