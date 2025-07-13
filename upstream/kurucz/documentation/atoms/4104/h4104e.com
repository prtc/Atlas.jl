set4104
delete fort.*
assign h4104e.ham fort.7
assign h4104e.dat fort.99
#assign h4104e20 fort.20
#assign h4104e31 fort.31
#assign h4104e32 fort.32
#assign h4104e41 fort.41
#assign h4104e41 fort.70
#assign h4104e41 fort.71
#assign cowanlanl:save72.dat fort.72
#assign cowanlanl:save73.dat fort.73
#assign cowanlanl:save74.dat fort.74
rcgham << "eof" > h4104e.log
 836 0 h4104e
p 6  d 1  s 0  p 0  d 0  s 0  g 0  i 0      nb v  4p6 4d        e=   -837284.29133
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      nb v  4p6 5d        e=   -837072.54994
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      nb v  4p6 6d        e=   -836997.41636
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      nb v  4p6 7d        e=   -836959.28473
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      nb v  4p6 8d        e=   -836936.98288
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      nb v  4p6 9d        e=   -836922.77042
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      nb v  4p6 10d       e=   -836913.14250
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      nb v  4p6 11d       e=   -836906.31131
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      nb v  4p6 12d       e=   -836901.28959
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      nb v  4p6 13d       e=   -836897.49646
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      nb v  4p6 14d       e=   -836894.55317
p 6  d 0  s 1  p 0  d 0  s 0  g 0  i 0      nb v  4p6 5s        e=   -837207.80287
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      nb v  4p6 6s        e=   -837056.10479
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      nb v  4p6 7s        e=   -836990.36300
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      nb v  4p6 8s        e=   -836955.48378
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      nb v  4p6 9s        e=   -836934.67690
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      nb v  4p6 10s       e=   -836921.25868
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      nb v  4p6 11s       e=   -836912.09703
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      nb v  4p6 12s       e=   -836905.56218
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      nb v  4p6 13s       e=   -836900.73015
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      nb v  4p6 14s       e=   -836897.06607
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      nb v  4p6 5g        e=   -836988.71242
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      nb v  4p6 6g        e=   -836954.78020
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      nb v  4p6 7g        e=   -836934.31700
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      nb v  4p6 8g        e=   -836921.04966
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      nb v  4p6 9g        e=   -836911.96358
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      nb v  4p6 10g       e=   -836905.46726
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      nb v  4p6 11g       e=   -836900.66617
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      nb v  4p6 12g       e=   -836897.02227
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      nb v  4p6 13g       e=   -836894.18238
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      nb v  4p6 14g       e=   -836891.93763
p 6  d 0  s 0  p 0  d 0  s 0  g 0  i 1      nb v  4p6 7i        e=   -836933.88600
p 6  d 0  s 0  p 0  d 0  s 0  g 0  i 1      nb v  4p6 8i        e=   -836920.76350
p 6  d 0  s 0  p 0  d 0  s 0  g 0  i 1      nb v  4p6 9i        e=   -836911.76559
p 5  d 1  s 0  p 1  d 0  s 0  g 0  i 0      nb v  4p5 4d5p      e=   -836856.25765
p 5  d 0  s 1  p 1  d 0  s 0  g 0  i 0      nb v  4p5 5s5p      e=   -836763.76553
