set4003
delete fort.*
assign h4003e.ham fort.7
assign h4003e.dat fort.99
#assign h4003e20 fort.20
#assign h4003e31 fort.31
#assign h4003e32 fort.32
#assign h4003e41 fort.41
#assign h4003e41 fort.70
#assign h4003e41 fort.71
#assign cowanlanl:save72.dat fort.72
#assign cowanlanl:save73.dat fort.73
#assign cowanlanl:save74.dat fort.74
rcgham << "eof" > h4003e.log
 836 0 h4003e
p 6  d 1  s 0  p 0  d 0  s 0  g 0  i 0      zr iv 4p6 4d        e=   -789119.08299
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      zr iv 4p6 5d        e=   -788972.44219
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      zr iv 4p6 6d        e=   -788921.56497
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      zr iv 4p6 7d        e=   -788896.00435
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      zr iv 4p6 8d        e=   -788881.16323
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      zr iv 4p6 9d        e=   -788871.75510
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      zr iv 4p6 10d       e=   -788865.40482
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      zr iv 4p6 11d       e=   -788860.91988
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      zr iv 4p6 12d       e=   -788857.63403
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      zr iv 4p6 13d       e=   -788855.14764
p 6  d 0  s 0  p 0  d 1  s 0  g 0  i 0      zr iv 4p6 14d       e=   -788853.23049
p 6  d 0  s 1  p 0  d 0  s 0  g 0  i 0      zr iv 4p6 5s        e=   -789080.26922
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      zr iv 4p6 6s        e=   -788966.61182
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      zr iv 4p6 7s        e=   -788919.41196
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      zr iv 4p6 8s        e=   -788894.92720
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      zr iv 4p6 9s        e=   -788880.54027
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      zr iv 4p6 10s       e=   -788871.35886
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      zr iv 4p6 11s       e=   -788865.13649
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      zr iv 4p6 12s       e=   -788860.72671
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      zr iv 4p6 13s       e=   -788857.49188
p 6  d 0  s 0  p 0  d 0  s 1  g 0  i 0      zr iv 4p6 14s       e=   -788855.03960
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      zr iv 4p6 5g        e=   -788913.20843
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      zr iv 4p6 6g        e=   -788891.57261
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      zr iv 4p6 7g        e=   -788878.50381
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      zr iv 4p6 8g        e=   -788870.02637
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      zr iv 4p6 9g        e=   -788864.21626
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      zr iv 4p6 10g       e=   -788860.06644
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      zr iv 4p6 11g       e=   -788856.99975
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      zr iv 4p6 12g       e=   -788854.66209
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      zr iv 4p6 13g       e=   -788852.84995
p 6  d 0  s 0  p 0  d 0  s 0  g 1  i 0      zr iv 4p6 14g       e=   -788851.41094
p 6  d 0  s 0  p 0  d 0  s 0  g 0  i 1      zr iv 4p6 7i        e=   -788878.25958
p 6  d 0  s 0  p 0  d 0  s 0  g 0  i 1      zr iv 4p6 8i        e=   -788869.86037
p 6  d 0  s 0  p 0  d 0  s 0  g 0  i 1      zr iv 4p6 9i        e=   -788864.10102
p 5  d 1  s 0  p 1  d 0  s 0  g 0  i 0      zr iv 4p5 4d5p      e=   -788773.98109
p 5  d 0  s 1  p 1  d 0  s 0  g 0  i 0      zr iv 4p5 5s5p      e=   -788720.06272
eof
