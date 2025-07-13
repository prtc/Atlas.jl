set3804
delete fort*
assign h3804o.ham fort.7
assign h3804o.dat fort.99
#assign h3804o20 for020
#assign h3804o31 for031
#assign h3804o32 for032
#assign h3804o41 for041
#assign h3804o41 for070
#assign h3804o41 for071
#assign cowanlanl:save72.dat for072
#assign cowanlanl:save73.dat for073
#assign cowanlanl:save74.dat for074
rcgham << "eof" > h3804o.log
 847 0 H3804O
s 2  p 3  s 1  d 0  g 0  i 0  p 0  f 0      sr v  s2p3 5s       e=   -696330.63855
s 2  p 3  s 1  d 0  g 0  i 0  p 0  f 0      sr v  s2p3 6s       e=   -696197.14485
s 2  p 3  s 1  d 0  g 0  i 0  p 0  f 0      sr v  s2p3 7s       e=   -696137.26271
s 2  p 3  s 1  d 0  g 0  i 0  p 0  f 0      sr v  s2p3 8s       e=   -696104.90119
s 2  p 3  s 1  d 0  g 0  i 0  p 0  f 0      sr v  s2p3 9s       e=   -696085.36061
s 2  p 3  s 1  d 0  g 0  i 0  p 0  f 0      sr v  s2p3 10s      e=   -696072.64945
s 2  p 3  s 1  d 0  g 0  i 0  p 0  f 0      sr v  s2p3 11s      e=   -696063.91368
s 2  p 3  s 1  d 0  g 0  i 0  p 0  f 0      sr v  s2p3 12s      e=   -696057.65183
s 2  p 3  s 1  d 0  g 0  i 0  p 0  f 0      sr v  s2p3 13s      e=   -696053.00201
s 2  p 3  s 0  d 1  g 0  i 0  p 0  f 0      sr v  s2p3 4d       e=   -696382.78227
s 2  p 3  s 0  d 1  g 0  i 0  p 0  f 0      sr v  s2p3 5d       e=   -696211.73715
s 2  p 3  s 0  d 1  g 0  i 0  p 0  f 0      sr v  s2p3 6d       e=   -696143.87641
s 2  p 3  s 0  d 1  g 0  i 0  p 0  f 0      sr v  s2p3 7d       e=   -696108.56269
s 2  p 3  s 0  d 1  g 0  i 0  p 0  f 0      sr v  s2p3 8d       e=   -696087.61844
s 2  p 3  s 0  d 1  g 0  i 0  p 0  f 0      sr v  s2p3 9d       e=   -696074.14497
s 2  p 3  s 0  d 1  g 0  i 0  p 0  f 0      sr v  s2p3 10d      e=   -696064.95741
s 2  p 3  s 0  d 1  g 0  i 0  p 0  f 0      sr v  s2p3 11d      e=   -696058.40455
s 2  p 3  s 0  d 1  g 0  i 0  p 0  f 0      sr v  s2p3 12d      e=   -696053.56668
s 2  p 3  s 0  d 1  g 0  i 0  p 0  f 0      sr v  s2p3 13d      e=   -696049.90017
s 2  p 3  s 0  d 0  g 1  i 0  p 0  f 0      sr v  s2p3 5g       e=   -696141.81375
s 2  p 3  s 0  d 0  g 1  i 0  p 0  f 0      sr v  s2p3 6g       e=   -696107.72469
s 2  p 3  s 0  d 0  g 1  i 0  p 0  f 0      sr v  s2p3 7g       e=   -696087.20544
s 2  p 3  s 0  d 0  g 1  i 0  p 0  f 0      sr v  s2p3 8g       e=   -696073.91227
s 2  p 3  s 0  d 0  g 1  i 0  p 0  f 0      sr v  s2p3 9g       e=   -696064.81245
s 2  p 3  s 0  d 0  g 0  i 1  p 0  f 0      sr v  s2p3 7i       e=   -696086.71623
s 2  p 3  s 0  d 0  g 0  i 1  p 0  f 0      sr v  s2p3 8i       e=   -696073.59493
s 2  p 3  s 0  d 0  g 0  i 1  p 0  f 0      sr v  s2p3 9i       e=   -696064.59561
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 0      sr v  sp5           e=   -696430.37324
s 1  p 4  s 0  d 0  g 0  i 0  p 1  f 0      sr v  sp4 5p        e=   -696106.17742
s 1  p 4  s 0  d 0  g 0  i 0  p 1  f 0      sr v  sp4 6p        e=   -695999.49618
s 1  p 4  s 0  d 0  g 0  i 0  p 1  f 0      sr v  sp4 7p        e=   -695949.37453
s 1  p 4  s 0  d 0  g 0  i 0  p 1  f 0      sr v  sp4 8p        e=   -695921.42264
s 1  p 4  s 0  d 0  g 0  i 0  p 1  f 0      sr v  sp4 9p        e=   -695904.17675
s 1  p 4  s 0  d 0  g 0  i 0  p 1  f 0      sr v  sp4 10p       e=   -695892.77523
s 1  p 4  s 0  d 0  g 0  i 0  p 1  f 0      sr v  sp4 11p       e=   -695884.84001
s 1  p 4  s 0  d 0  g 0  i 0  p 1  f 0      sr v  sp4 12p       e=   -695879.10058
s 1  p 4  s 0  d 0  g 0  i 0  p 1  f 0      sr v  sp4 13p       e=   -695874.80605
s 1  p 4  s 0  d 0  g 0  i 0  p 0  f 1      sr v  sp4 4f        e=   -696039.47646
s 1  p 4  s 0  d 0  g 0  i 0  p 0  f 1      sr v  sp4 5f        e=   -695971.66707
s 1  p 4  s 0  d 0  g 0  i 0  p 0  f 1      sr v  sp4 6f        e=   -695934.96078
s 1  p 4  s 0  d 0  g 0  i 0  p 0  f 1      sr v  sp4 7f        e=   -695912.92881
s 1  p 4  s 0  d 0  g 0  i 0  p 0  f 1      sr v  sp4 8f        e=   -695898.73406
s 1  p 4  s 0  d 0  g 0  i 0  p 0  f 1      sr v  sp4 9f        e=   -695889.07209
s 1  p 4  s 0  d 0  g 0  i 0  p 0  f 1      sr v  sp4 10f       e=   -695882.20189
s 1  p 4  s 0  d 0  g 0  i 0  p 0  f 1      sr v  sp4 11f       e=   -695877.15222
s 1  p 4  s 0  d 0  g 0  i 0  p 0  f 1      sr v  sp4 12f       e=   -695873.33018
s 1  p 4  s 0  d 0  g 0  i 0  p 0  f 1      sr v  sp4 12f       e=   -695870.36488
eof
