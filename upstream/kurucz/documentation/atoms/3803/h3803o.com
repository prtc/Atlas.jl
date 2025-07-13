set3803
delete fort*
assign h3803o.ham fort.7
assign h3803o.dat fort.99
#assign h3803o20 fort.20
 
#assign h3803o31 fort.31
#assign h3803o32 fort.32
#assign h3803o41 fort.41
#assign h3803o41 fort.70
#assign h3803o41 fort.71
#assign cowanlanl:save72.dat fort.72
#assign cowanlanl:save73.dat fort.73
#assign cowanlanl:save74.dat fort.74
rcgham << "eof" > h3803o.log
 861 0 h3803o
s 2  p 5  p 0  f 0  h 0  k 0  s 0  d 0      sr iv s2p5          e=   -697073.60695
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      sr iv s2p4 5p       e=   -696793.77555
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      sr iv s2p4 6p       e=   -696713.70084
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      sr iv s2p4 7p       e=   -696677.61398
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      sr iv s2p4 8p       e=   -696657.92688
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      sr iv s2p4 9p       e=   -696645.96178
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      sr iv s2p4 10p      e=   -696638.13522
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      sr iv s2p4 11p      e=   -696632.73357
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      sr iv s2p4 12p      e=   -696628.84375
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      sr iv s2p4 13p      e=   -696625.95431
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      sr iv 4p6 5p        e=   -696404.38223
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      sr iv 4p6 6p        e=   -696322.96797
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      sr iv 4p6 7p        e=   -696286.47783
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      sr iv 4p6 8p        e=   -696266.62079
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      sr iv 4p6 9p        e=   -696254.57152
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      sr iv 4p6 10p       e=   -696246.69732
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      sr iv 4p6 11p       e=   -696241.26672
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      sr iv 4p6 12p       e=   -696237.35893
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      sr iv 4p6 13p       e=   -696234.45739
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      sr iv s2p4 4f       e=   -696728.62345
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      sr iv s2p4 5f       e=   -696686.02401
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      sr iv s2p4 6f       e=   -696663.16973
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      sr iv s2p4 7f       e=   -696649.40954
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      sr iv s2p4 8f       e=   -696640.50798
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      sr iv s2p4 9f       e=   -696634.42712
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      sr iv 4p6 4f        e=   -696338.34135
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      sr iv 4p6 5f        e=   -696295.24008
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      sr iv 4p6 6f        e=   -696272.09048
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      sr iv 4p6 7f        e=   -696258.16145
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      sr iv 4p6 8f        e=   -696249.16407
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      sr iv 4p6 9f        e=   -696243.02496
s 2  p 4  p 0  f 0  h 1  k 0  s 0  d 0      sr iv s2p4 6h       e=   -696660.79760
s 2  p 4  p 0  f 0  h 1  k 0  s 0  d 0      sr iv s2p4 7h       e=   -696647.84984
s 2  p 4  p 0  f 0  h 1  k 0  s 0  d 0      sr iv s2p4 8h       e=   -696639.43508
s 2  p 4  p 0  f 0  h 1  k 0  s 0  d 0      sr iv s2p4 9h       e=   -696633.66122
s 0  p 6  p 0  f 0  h 1  k 0  s 0  d 0      sr iv 4p6 6h        e=   -696269.26838
s 0  p 6  p 0  f 0  h 1  k 0  s 0  d 0      sr iv 4p6 7h        e=   -696256.31985
s 0  p 6  p 0  f 0  h 1  k 0  s 0  d 0      sr iv 4p6 8h        e=   -696247.90457
s 0  p 6  p 0  f 0  h 1  k 0  s 0  d 0      sr iv 4p6 9h        e=   -696242.13003
s 2  p 4  p 0  f 0  h 0  k 1  s 0  d 0      sr iv s2p4 8k       e=   -696639.37357
s 2  p 4  p 0  f 0  h 0  k 1  s 0  d 0      sr iv s2p4 9k       e=   -696633.61633
s 0  p 6  p 0  f 0  h 0  k 1  s 0  d 0      sr iv 4p6 8k        e=   -696247.83951
s 0  p 6  p 0  f 0  h 0  k 1  s 0  d 0      sr iv 4p6 9k        e=   -696242.08221
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      sr iv sp5 5s        e=   -696652.78948
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      sr iv sp5 6s        e=   -696548.88419
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      sr iv sp5 7s        e=   -696504.59741
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      sr iv sp5 8s        e=   -696481.32147
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      sr iv sp5 9s        e=   -696467.52900
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      sr iv sp5 10s       e=   -696458.67456
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      sr iv sp5 11s       e=   -696452.64690
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      sr iv sp5 12s       e=   -696448.35953
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      sr iv sp5 13s       e=   -696445.20632
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      sr iv sp5 4d        e=   -696685.47606
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      sr iv sp5 5d        e=   -696554.96834
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      sr iv sp5 6d        e=   -696506.98387
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      sr iv sp5 7d        e=   -696482.55467
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      sr iv sp5 8d        e=   -696468.25713
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      sr iv sp5 9d        e=   -696459.14285
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      sr iv sp5 10d       e=   -696452.96719
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      sr iv sp5 11d       e=   -696448.59157
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      sr iv sp5 12d       e=   -696445.37826
eof
