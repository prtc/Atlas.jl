set3904
delete fort*
assign h3904o.ham fort.7
assign h3904o.dat fort.99
#assign h3904o20 for020
#assign h3904o31 for031
#assign h3904o32 for032
#assign h3904o41 for041
#assign h3904o41 for070
#assign h3904o41 for071
#assign cowanlanl:save72.dat for072
#assign cowanlanl:save73.dat for073
#assign cowanlanl:save74.dat for074
rcgham << "eof" > h3904o.log
 861 0 h3904o
s 2  p 5  p 0  f 0  h 0  k 0  s 0  d 0      y v   s2p5          e=   -741866.18187
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      y v   s2p4 5p       e=   -741509.23183
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      y v   s2p4 6p       e=   -741398.47782
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      y v   s2p4 7p       e=   -741346.95505
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      y v   s2p4 8p       e=   -741318.37200
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      y v   s2p4 9p       e=   -741300.79813
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      y v   s2p4 10p      e=   -741289.20879
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      y v   s2p4 11p      e=   -741281.15885
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      y v   s2p4 12p      e=   -741275.34423
s 2  p 4  p 1  f 0  h 0  k 0  s 0  d 0      y v   s2p4 13p      e=   -741270.99911
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      y v   4p6 5p        e=   -741077.78431
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      y v   4p6 6p        e=   -740965.54655
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      y v   4p6 7p        e=   -740913.55749
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      y v   4p6 8p        e=   -740884.77553
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      y v   4p6 9p        e=   -740867.10052
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      y v   4p6 10p       e=   -740855.45540
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      y v   4p6 11p       e=   -740847.37044
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      y v   4p6 12p       e=   -740841.53472
s 0  p 6  p 1  f 0  h 0  k 0  s 0  d 0      y v   4p6 13p       e=   -740837.17457
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      y v   s2p4 4f       e=   -741435.07419
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      y v   s2p4 5f       e=   -741367.71430
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      y v   s2p4 6f       e=   -741331.08846
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      y v   s2p4 7f       e=   -741309.04912
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      y v   s2p4 8f       e=   -741294.83647
s 2  p 4  p 0  f 1  h 0  k 0  s 0  d 0      y v   s2p4 9f       e=   -741285.15886
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      y v   4p6 4f        e=   -741003.55817
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      y v   4p6 5f        e=   -740935.10807
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      y v   4p6 6f        e=   -740897.91264
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      y v   4p6 7f        e=   -740875.59855
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      y v   4p6 8f        e=   -740861.23828
s 0  p 6  p 0  f 1  h 0  k 0  s 0  d 0      y v   4p6 9f        e=   -740851.47585
s 2  p 4  p 0  f 0  h 1  k 0  s 0  d 0      y v   s2p4 6h       e=   -741326.02418
s 2  p 4  p 0  f 0  h 1  k 0  s 0  d 0      y v   s2p4 7h       e=   -741305.77726
s 2  p 4  p 0  f 0  h 1  k 0  s 0  d 0      y v   s2p4 8h       e=   -741292.61370
s 2  p 4  p 0  f 0  h 1  k 0  s 0  d 0      y v   s2p4 9h       e=   -741283.58631
s 0  p 6  p 0  f 0  h 1  k 0  s 0  d 0      y v   4p6 6h        e=   -740892.16517
s 0  p 6  p 0  f 0  h 1  k 0  s 0  d 0      y v   4p6 7h        e=   -740871.91865
s 0  p 6  p 0  f 0  h 1  k 0  s 0  d 0      y v   4p6 8h        e=   -740858.75271
s 0  p 6  p 0  f 0  h 1  k 0  s 0  d 0      y v   4p6 9h        e=   -740849.72324
s 2  p 4  p 0  f 0  h 0  k 1  s 0  d 0      y v   s2p4 8k       e=   -741292.49673
s 2  p 4  p 0  f 0  h 0  k 1  s 0  d 0      y v   s2p4 9k       e=   -741283.49945
s 0  p 6  p 0  f 0  h 0  k 1  s 0  d 0      y v   4p6 8k        e=   -740858.62578
s 0  p 6  p 0  f 0  h 0  k 1  s 0  d 0      y v   4p6 9k        e=   -740849.62916
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      y v   sp5 5s        e=   -741357.55159
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      y v   sp5 6s        e=   -741218.24433
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      y v   sp5 7s        e=   -741156.39052
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      y v   sp5 8s        e=   -741123.16800
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      y v   sp5 9s        e=   -741103.19014
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      y v   sp5 10s       e=   -741090.23346
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      y v   sp5 11s       e=   -741081.34953
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      y v   sp5 12s       e=   -741074.99160
s 1  p 5  p 0  f 0  h 0  k 0  s 1  d 0      y v   sp5 13s       e=   -741070.27855
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      y v   sp5 4d        e=   -741422.97907
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      y v   sp5 5d        e=   -741234.47440
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      y v   sp5 6d        e=   -741163.57262
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      y v   sp5 7d        e=   -741127.09927
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      y v   sp5 8d        e=   -741105.59838
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      y v   sp5 9d        e=   -741091.82200
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      y v   sp5 10d       e=   -741082.45328
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      y v   sp5 11d       e=   -741075.78591
s 1  p 5  p 0  f 0  h 0  k 0  s 0  d 1      y v   sp5 12d       e=   -741070.87311
eof
