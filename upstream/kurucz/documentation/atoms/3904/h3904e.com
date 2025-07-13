set3904
delete fort*
assign h3904e.ham fort.7
assign h3904e.dat fort.99
#assign h3904e20 fort.20
#assign h3904e31 fort.31
#assign h3904e32 fort.32
#assign h3904e41 fort.41
#assign h3904e41 fort.70
#assign h3904e41 fort.71
#assign cowanlanl:save72.dat fort.72
#assign cowanlanl:save73.dat fort.73
#assign cowanlanl:save74.dat fort.74
rcgham << "eof" > h3904e.log
 861 0 h3904e
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      y v   s2p4 5s       e=   -741559.77205
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      y v   s2p4 6s       e=   -741420.12156
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      y v   s2p4 7s       e=   -741358.23557
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      y v   s2p4 8s       e=   -741325.00797
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      y v   s2p4 9s       e=   -741305.03011
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      y v   s2p4 10s      e=   -741292.07402
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      y v   s2p4 11s      e=   -741283.19036
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      y v   s2p4 12s      e=   -741276.83392
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      y v   s2p4 13s      e=   -741272.12093
s 2  p 4  s 1  d 0  g 0  i 0  p 0  f 0      y v   s2p4 14s      e=   -741268.53849
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      y v   4p6 5s        e=   -741125.21727
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      y v   4p6 6s        e=   -740986.21665
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      y v   4p6 7s        e=   -740924.37912
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      y v   4p6 8s        e=   -740891.15467
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      y v   4p6 9s        e=   -740871.17363
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      y v   4p6 10s       e=   -740858.21431
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      y v   4p6 11s       e=   -740849.32793
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      y v   4p6 12s       e=   -740842.96936
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      y v   4p6 13s       e=   -740838.25438
s 0  p 6  s 1  d 0  g 0  i 0  p 0  f 0      y v   4p6 14s       e=   -740834.67177
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 4d       e=   -741619.52821
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 5d       e=   -741435.39622
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 6d       e=   -741365.02341
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 7d       e=   -741328.73115
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 8d       e=   -741307.31328
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 9d       e=   -741293.58126
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 10d      e=   -741284.23867
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 11d      e=   -741277.58764
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 12d      e=   -741272.68559
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 13d      e=   -741268.97406
s 2  p 4  s 0  d 1  g 0  i 0  p 0  f 0      y v   s2p4 14d      e=   -741266.08895
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 4d        e=   -741196.66217
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 5d        e=   -741003.43020
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 6d        e=   -740931.96906
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 7d        e=   -740895.30239
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 8d        e=   -740873.71100
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 9d        e=   -740859.88645
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 10d       e=   -740850.49011
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 11d       e=   -740843.80481
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 12d       e=   -740838.88066
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 13d       e=   -740835.15431
s 0  p 6  s 0  d 1  g 0  i 0  p 0  f 0      y v   4p6 14d       e=   -740832.25793
s 2  p 4  s 0  d 0  g 1  i 0  p 0  f 0      y v   s2p4 5g       e=   -741360.65141
s 2  p 4  s 0  d 0  g 1  i 0  p 0  f 0      y v   s2p4 6g       e=   -741326.61571
s 2  p 4  s 0  d 0  g 1  i 0  p 0  f 0      y v   s2p4 7g       e=   -741306.11328
s 2  p 4  s 0  d 0  g 1  i 0  p 0  f 0      y v   s2p4 8g       e=   -741292.82743
s 2  p 4  s 0  d 0  g 1  i 0  p 0  f 0      y v   s2p4 9g       e=   -741283.73132
s 2  p 4  s 0  d 0  g 0  i 1  p 0  f 0      y v   s2p4 7i       e=   -741305.63895
s 2  p 4  s 0  d 0  g 0  i 1  p 0  f 0      y v   s2p4 8i       e=   -741292.51697
s 2  p 4  s 0  d 0  g 0  i 1  p 0  f 0      y v   s2p4 9i       e=   -741283.51825
s 1  p 6  s 0  d 0  g 0  i 0  p 0  f 0      y v   sp6           e=   -741659.62621
s 1  p 5  s 0  d 0  g 0  i 0  p 1  f 0      y v   sp5 5p        e=   -741308.55345
s 1  p 5  s 0  d 0  g 0  i 0  p 1  f 0      y v   sp5 6p        e=   -741197.08653
s 1  p 5  s 0  d 0  g 0  i 0  p 1  f 0      y v   sp5 7p        e=   -741145.33872
s 1  p 5  s 0  d 0  g 0  i 0  p 1  f 0      y v   sp5 8p        e=   -741116.66029
s 1  p 5  s 0  d 0  g 0  i 0  p 1  f 0      y v   sp5 9p        e=   -741099.03770
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 1      y v   sp5 4f        e=   -741234.33867
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 1      y v   sp5 5f        e=   -741166.47349
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 1      y v   sp5 6f        e=   -741129.57727
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 1      y v   sp5 7f        e=   -741107.40695
s 1  p 5  s 0  d 0  g 0  i 0  p 0  f 1      y v   sp5 8f        e=   -741093.12369
eof
