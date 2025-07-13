set3803
delete fort*
assign h3803e.ham fort.7
assign h3803e.dat fort.99
#assign h3803e20 fort.20
#assign h3803e31 fort.31
#assign h3803e32 fort.32
#assign h3803e41 fort.41
#assign h3803e41 fort.70
#assign h3803e41 fort.71
#assign cowanlanl:save72.dat fort.72
#assign cowanlanl:save73.dat fort.73
#assign cowanlanl:save74.dat fort.74
rcgham << "eof" > h3803e.log
 861 0 h3803e
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      sr iv s2p4 5s       e=   -696834.60172
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      sr iv s2p4 6s       e=   -696730.46182
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      sr iv s2p4 7s       e=   -696686.15611
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      sr iv s2p4 8s       e=   -696662.87910
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      sr iv s2p4 9s       e=   -696649.08727
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      sr iv s2p4 10s      e=   -696640.23396
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      sr iv s2p4 11s      e=   -696634.20709
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      sr iv s2p4 12s      e=   -696629.92050
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      sr iv s2p4 13s      e=   -696626.76768
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      sr iv s2p4 14s      e=   -696624.37204
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      sr iv 4p6 5s        e=   -696442.62122
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      sr iv 4p6 6s        e=   -696338.92437
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      sr iv 4p6 7s        e=   -696294.64303
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      sr iv 4p6 8s        e=   -696271.36352
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      sr iv 4p6 9s        e=   -696257.56698
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      sr iv 4p6 10s       e=   -696248.70965
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      sr iv 4p6 11s       e=   -696242.67995
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      sr iv 4p6 12s       e=   -696238.39156
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      sr iv 4p6 13s       e=   -696235.23767
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      sr iv 4p6 14s       e=   -696232.84131
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 4d       e=   -696862.24781
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 5d       e=   -696735.70516
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 6d       e=   -696688.19877
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 7d       e=   -696663.93152
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 8d       e=   -696649.70800
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 9d       e=   -696640.63219
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 10d      e=   -696634.47966
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 11d      e=   -696630.11828
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 12d      e=   -696626.91430
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 13d      e=   -696624.48392
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      sr iv s2p4 14d      e=   -696622.60641
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 4d        e=   -696480.70131
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 5d        e=   -696345.86998
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 6d        e=   -696297.38327
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 7d        e=   -696272.78216
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 8d        e=   -696258.40502
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 9d        e=   -696249.24964
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 10d       e=   -696243.05005
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 11d       e=   -696238.65906
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 12d       e=   -696235.43574
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 13d       e=   -696232.99233
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      sr iv 4p6 14d       e=   -696231.10597
s 2  p 4  s 0  d 0  g 1  i 0  p 0  f 0      sr iv s2p4 5g       e=   -696682.85915
s 2  p 4  s 0  d 0  g 1  i 0  p 0  f 0      sr iv s2p4 6g       e=   -696661.16261
s 2  p 4  s 0  d 0  g 1  i 0  p 0  f 0      sr iv s2p4 7g       e=   -696648.06469
s 2  p 4  s 0  d 0  g 1  i 0  p 0  f 0      sr iv s2p4 8g       e=   -696639.57226
s 2  p 4  s 0  d 0  g 1  i 0  p 0  f 0      sr iv s2p4 9g       e=   -696633.75371
s 2  p 4  s 0  d 0  g 0  i 1  p 0  f 0      sr iv s2p4 7i       e=   -696647.78063
s 2  p 4  s 0  d 0  g 0  i 1  p 0  f 0      sr iv s2p4 8i       e=   -696639.38265
s 2  p 4  s 0  d 0  g 0  i 1  p 0  f 0      sr iv s2p4 9i       e=   -696633.62325
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 0      sr iv sp6           e=   -696888.27748
s 1  p 5  s 0  d 0  g 0  i 0  p 1  f 0      sr iv sp5 5p        e=   -696613.24531
s 1  p 5  s 0  d 0  g 0  i 0  p 1  f 0      sr iv sp5 6p        e=   -696532.52428
s 1  p 5  s 0  d 0  g 0  i 0  p 1  f 0      sr iv sp5 7p        e=   -696496.24314
s 1  p 5  s 0  d 0  g 0  i 0  p 1  f 0      sr iv sp5 8p        e=   -696476.47397
s 1  p 5  s 0  d 0  g 0  i 0  p 1  f 0      sr iv sp5 9p        e=   -696464.46849
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 1      sr iv sp5 4f        e=   -696547.65023
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 1      sr iv sp5 5f        e=   -696504.81489
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 1      sr iv sp5 6f        e=   -696481.82311
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 1      sr iv sp5 7f        e=   -696467.98350
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 1      sr iv sp5 8f        e=   -696459.03616
eof
