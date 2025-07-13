set4104
delete fort*
assign h4104o.ham fort.7
assign h4104o.dat fort.99
#assign h4104o20 for020
#assign h4104o31 for031
#assign h4104o32 for032
#assign h4104o41 for041
#assign h4104o41 for070
#assign h4104o41 for071
#assign cowanlanl:save72.dat for072
#assign cowanlanl:save73.dat for073
#assign cowanlanl:save74.dat for074
rcgham << "eof" > h4104o.log
 836 0 h4104o
p 6  d 0  s 0  p 1  p 0  f 0  h 0  k 0      nb v  4p6 5p        e=   -837153.21614
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      nb v  4p6 6p        e=   -837033.18477
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      nb v  4p6 7p        e=   -836978.55009
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      nb v  4p6 8p        e=   -836948.58739
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      nb v  4p6 9p        e=   -836930.30253
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      nb v  4p6 10p       e=   -836918.30937
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      nb v  4p6 11p       e=   -836910.01268
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      nb v  4p6 12p       e=   -836904.03920
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      nb v  4p6 13p       e=   -836899.58601
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      nb v  4p6 14p       e=   -836896.18067
p 5  d 0  s 0  p 2  p 0  f 0  h 0  k 0      nb v  4p5 5p2       e=   -836699.27951
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 4f        e=   -837063.88456
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 5f        e=   -836996.69930
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 6f        e=   -836959.89940
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 7f        e=   -836937.69544
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 8f        e=   -836923.36760
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 9f        e=   -836913.61383
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 10f       e=   -836906.67939
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 11f       e=   -836901.58360
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 12f       e=   -836897.73079
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 13f       e=   -836894.74174
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      nb v  4p6 14f       e=   -836892.38301
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      nb v  4p6 6h        e=   -836954.23492
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      nb v  4p6 7h        e=   -836933.99888
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      nb v  4p6 8h        e=   -836920.84471
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      nb v  4p6 9h        e=   -836911.82353
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      nb v  4p6 10h       e=   -836905.36749
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      nb v  4p6 11h       e=   -836900.59481
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      nb v  4p6 12h       e=   -836896.96723
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      nb v  4p6 13h       e=   -836894.13886
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      nb v  4p6 14h       e=   -836891.90106
p 6  d 0  s 0  p 0  p 0  f 0  h 0  k 1      nb v  4p6 8k        e=   -836920.74880
p 6  d 0  s 0  p 0  p 0  f 0  h 0  k 1      nb v  4p6 9k        e=   -836911.75136
p 5  d 2  s 0  p 0  p 0  f 0  h 0  k 0      nb v  4p5 4d2       e=   -836990.57920
p 5  d 1  s 1  p 0  p 0  f 0  h 0  k 0      nb v  4p5 4d5s      e=   -836911.83852
p 5  d 0  s 2  p 0  p 0  f 0  h 0  k 0      nb v  4p5 5s2       e=   -836813.22927
eof
