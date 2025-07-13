set3804
delete fort*
assign h3804e.ham fort.7
assign h3804e.dat fort.99
#assign h3804e20 fort.20
#assign h3804e31 fort.31
#assign h3804e32 fort.32
#assign h3804e41 fort.41
#assign h3804e41 fort.70
#assign h3804e41 fort.71
#assign cowanlanl:save72.dat fort.72
#assign cowanlanl:save73.dat fort.73
#assign cowanlanl:save74.dat fort.74
rcgham << "eof" > h3804e.log
 845 0 h3804e
s 2  p 4  p 0  f 0  h 0  k 0  s 0  d 0      sr v  s2p4          e=   -696611.93573
s 2  p 3  p 1  f 0  h 0  k 0  s 0  d 0      sr v  s2p3 5p       e=   -696282.12030
s 2  p 3  p 1  f 0  h 0  k 0  s 0  d 0      sr v  s2p3 6p       e=   -696176.14729
s 2  p 3  p 1  f 0  h 0  k 0  s 0  d 0      sr v  s2p3 7p       e=   -696126.25159
s 2  p 3  p 1  f 0  h 0  k 0  s 0  d 0      sr v  s2p3 8p       e=   -696098.39672
s 2  p 3  p 1  f 0  h 0  k 0  s 0  d 0      sr v  s2p3 9p       e=   -696081.20030
s 2  p 3  p 1  f 0  h 0  k 0  s 0  d 0      sr v  s2p3 10p      e=   -696069.82692
s 2  p 3  p 1  f 0  h 0  k 0  s 0  d 0      sr v  s2p3 11p      e=   -696061.90803
s 2  p 3  p 1  f 0  h 0  k 0  s 0  d 0      sr v  s2p3 12p      e=   -696056.17956
s 2  p 3  p 1  f 0  h 0  k 0  s 0  d 0      sr v  s2p3 13p      e=   -696051.89219
s 2  p 3  p 0  f 1  h 0  k 0  s 0  d 0      sr v  s2p3 4f       e=   -696215.45016
s 2  p 3  p 0  f 1  h 0  k 0  s 0  d 0      sr v  s2p3 5f       e=   -696148.16714
s 2  p 3  p 0  f 1  h 0  k 0  s 0  d 0      sr v  s2p3 6f       e=   -696111.73513
s 2  p 3  p 0  f 1  h 0  k 0  s 0  d 0      sr v  s2p3 7f       e=   -696089.83619
s 2  p 3  p 0  f 1  h 0  k 0  s 0  d 0      sr v  s2p3 8f       e=   -696075.71225
s 2  p 3  p 0  f 1  h 0  k 0  s 0  d 0      sr v  s2p3 9f       e=   -696066.09099
s 2  p 3  p 0  f 1  h 0  k 0  s 0  d 0      sr v  s2p3 10f      e=   -696059.24652
s 2  p 3  p 0  f 1  h 0  k 0  s 0  d 0      sr v  s2p3 11f      e=   -696054.21298
s 2  p 3  p 0  f 1  h 0  k 0  s 0  d 0      sr v  s2p3 12f      e=   -696050.40268
s 2  p 3  p 0  f 1  h 0  k 0  s 0  d 0      sr v  s2p3 13f      e=   -696047.44549
s 2  p 3  p 0  f 0  h 1  k 0  s 0  d 0      sr v  s2p3 6h       e=   -696107.12162
s 2  p 3  p 0  f 0  h 1  k 0  s 0  d 0      sr v  s2p3 7h       e=   -696086.86793
s 2  p 3  p 0  f 0  h 1  k 0  s 0  d 0      sr v  s2p3 8h       e=   -696073.69906
s 2  p 3  p 0  f 0  h 1  k 0  s 0  d 0      sr v  s2p3 9h       e=   -696064.66832
s 2  p 3  p 0  f 0  h 0  k 1  s 0  d 0      sr v  s2p3 8k       e=   -696073.57048
s 2  p 3  p 0  f 0  h 0  k 1  s 0  d 0      sr v  s2p3 9k       e=   -696064.57357
s 1  p 4  p 0  f 0  h 0  k 0  s 1  d 0      sr v  sp4 5s        e=   -696153.18582
s 1  p 4  p 0  f 0  h 0  k 0  s 1  d 0      sr v  sp4 6s        e=   -696020.01584
s 1  p 4  p 0  f 0  h 0  k 0  s 1  d 0      sr v  sp4 7s        e=   -695960.15849
s 1  p 4  p 0  f 0  h 0  k 0  s 1  d 0      sr v  sp4 8s        e=   -695927.79916
s 1  p 4  p 0  f 0  h 0  k 0  s 1  d 0      sr v  sp4 9s        e=   -695908.25767
s 1  p 4  p 0  f 0  h 0  k 0  s 1  d 0      sr v  sp4 10s       e=   -695895.54515
s 1  p 4  p 0  f 0  h 0  k 0  s 1  d 0      sr v  sp4 11s       e=   -695886.80845
s 1  p 4  p 0  f 0  h 0  k 0  s 1  d 0      sr v  sp4 12s       e=   -695880.54552
s 1  p 4  p 0  f 0  h 0  k 0  s 1  d 0      sr v  sp4 13s       e=   -695875.89540
s 1  p 4  p 0  f 0  h 0  k 0  s 0  d 1      sr v  sp4 4d        e=   -696210.68306
s 1  p 4  p 0  f 0  h 0  k 0  s 0  d 1      sr v  sp4 5d        e=   -696035.56299
s 1  p 4  p 0  f 0  h 0  k 0  s 0  d 1      sr v  sp4 6d        e=   -695967.16496
s 1  p 4  p 0  f 0  h 0  k 0  s 0  d 1      sr v  sp4 7d        e=   -695931.66868
s 1  p 4  p 0  f 0  h 0  k 0  s 0  d 1      sr v  sp4 8d        e=   -695910.64010
s 1  p 4  p 0  f 0  h 0  k 0  s 0  d 1      sr v  sp4 9d        e=   -695897.12268
s 1  p 4  p 0  f 0  h 0  k 0  s 0  d 1      sr v  sp4 10d       e=   -695887.90782
s 1  p 4  p 0  f 0  h 0  k 0  s 0  d 1      sr v  sp4 11d       e=   -695881.33799
s 1  p 4  p 0  f 0  h 0  k 0  s 0  d 1      sr v  sp4 12d       e=   -695876.48986
s 1  p 4  p 0  f 0  h 0  k 0  s 0  d 1      sr v  sp4 13d       e=   -695872.81591
eof
