set4004
delete fort*
assign h4004e.ham fort.7
assign h4004e.dat fort.99
#assign h4004e20 fort.20
#assign h4004e31 fort.31
#assign h4004e32 fort.32
#assign h4004e41 fort.41
#assign h4004e41 fort.70
#assign h4004e41 fort.71
#assign cowanlanl:save72.dat fort.72
#assign cowanlanl:save73.dat fort.73
#assign cowanlanl:save74.dat fort.74
rcgham << "eof" > h4004e.log
 849 0 h4004e
s 2  p 6  p 0  f 0  h 0  k 0  s 0  d 0      zr v   s2p6         e=   -788842.41566
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      zr v   s2p5 5p      e=   -788457.50081
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      zr v   s2p5 6p      e=   -788342.06297
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      zr v   s2p5 7p      e=   -788288.96207
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      zr v   s2p5 8p      e=   -788259.67670
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      zr v   s2p5 9p      e=   -788241.74086
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      zr v   s2p5 10p     e=   -788229.94543
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      zr v   s2p5 11p     e=   -788221.76859
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      zr v   s2p5 12p     e=   -788215.87329
s 2  p 5  p 1  f 0  h 0  k 0  s 0  d 0      zr v   s2p5 13p     e=   -788211.47280
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      zr v   s2p5 4f      e=   -788375.77983
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      zr v   s2p5 5f      e=   -788308.46222
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      zr v   s2p5 6f      e=   -788271.71623
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      zr v   s2p5 7f      e=   -788249.57689
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      zr v   s2p5 8f      e=   -788235.29674
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      zr v   s2p5 9f      e=   -788225.57524
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      zr v   s2p5 10f     e=   -788218.66278
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      zr v   s2p5 11f     e=   -788213.58354
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      zr v   s2p5 12f     e=   -788209.74123
s 2  p 5  p 0  f 1  h 0  k 0  s 0  d 0      zr v   s2p5 13f     e=   -788206.76024
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      zr v   s2p5 6h      e=   -788266.30375
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      zr v   s2p5 7h      e=   -788246.06356
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      zr v   s2p5 8h      e=   -788232.90479
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      zr v   s2p5 9h      e=   -788223.88063
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      zr v   s2p5 10h     e=   -788217.42263
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      zr v   s2p5 11h     e=   -788212.64898
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      zr v   s2p5 12h     e=   -788209.01989
s 2  p 5  p 0  f 0  h 1  k 0  s 0  d 0      zr v   s2p5 13h     e=   -788206.19104
s 2  p 5  p 0  f 0  h 0  k 1  s 0  d 0      zr v   s2p5 8k      e=   -788232.79842
s 2  p 5  p 0  f 0  h 0  k 1  s 0  d 0      zr v   s2p5 9k      e=   -788223.80093
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      zr v   sp6 5s       e=   -788281.71680
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      zr v   sp6 6s       e=   -788136.36105
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      zr v   sp6 7s       e=   -788072.56161
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      zr v   sp6 8s       e=   -788038.50277
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      zr v   sp6 9s       e=   -788018.10492
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      zr v   sp6 10s      e=   -788004.91366
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      zr v   sp6 11s      e=   -787995.88781
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      zr v   sp6 12s      e=   -787989.44001
s 1  p 6  p 0  f 0  h 0  k 0  s 1  d 0      zr v   sp6 13s      e=   -787984.66519
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      zr v   sp6 4d       e=   -788355.57946
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      zr v   sp6 5d       e=   -788153.21036
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      zr v   sp6 6d       e=   -788079.89184
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      zr v   sp6 7d       e=   -788042.48174
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      zr v   sp6 8d       e=   -788020.52962
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      zr v   sp6 9d       e=   -788006.50701
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      zr v   sp6 10d      e=   -787996.99263
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      zr v   sp6 11d      e=   -787990.23304
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      zr v   sp6 12d      e=   -787985.25909
s 1  p 6  p 0  f 0  h 0  k 0  s 0  d 1      zr v   sp6 13d      e=   -787981.49882
eof
