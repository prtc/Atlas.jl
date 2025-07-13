set4103
delete fort.*
assign h4103e.ham fort.7
assign h4103e.dat fort.99
#assign h4103e20 fort.20
#assign h4103e31 fort.31
#assign h4103e32 fort.32
#assign h4103e41 fort.41
#assign h4103e41 fort.70
#assign h4103e41 fort.71
#assign cowanlanl:save72.dat fort.72
#assign cowanlanl:save73.dat fort.73
#assign cowanlanl:save74.dat fort.74
rcgham << "eof" > h4103e.log
 861 0 H4103E
d 2  s 0  p 0  s 0  d 0  g 0  i 0  p 0      nb iv 4d2           e=   -837580.78110
d 1  s 1  p 0  s 0  d 0  g 0  i 0  p 0      nb iv 4d5s          e=   -837532.73382
d 1  s 0  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 4d6s          e=   -837412.53004
d 1  s 0  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 4d7s          e=   -837363.12619
d 1  s 0  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 4d8s          e=   -837337.81693
d 1  s 0  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 4d9s          e=   -837323.03530
d 1  s 0  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 4d10s         e=   -837313.64130
d 1  s 0  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 4d11s         e=   -837307.29352
d 1  s 0  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 4d12s         e=   -837302.80520
d 1  s 0  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 4d13s         e=   -837299.51859
d 1  s 0  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 4d14s         e=   -837297.03078
d 0  s 2  p 0  s 0  d 0  g 0  i 0  p 0      nb iv 5s2           e=   -837465.58084
d 0  s 1  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 5s6s          e=   -837341.57751
d 0  s 1  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 5s7s          e=   -837288.80150
d 0  s 1  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 5s8s          e=   -837262.43760
d 0  s 1  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 5s9s          e=   -837247.20261
d 0  s 1  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 5s10s         e=   -837237.57528
d 0  s 1  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 5s11s         e=   -837231.09400
d 0  s 1  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 5s12s         e=   -837226.52472
d 0  s 1  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 5s13s         e=   -837223.18464
d 0  s 1  p 0  s 1  d 0  g 0  i 0  p 0      nb iv 5s14s         e=   -837220.66020
d 1  s 0  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 4d5d          e=   -837418.52546
d 1  s 0  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 4d6d          e=   -837365.10009
d 1  s 0  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 4d7d          e=   -837338.76917
d 1  s 0  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 4d8d          e=   -837323.58156
d 1  s 0  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 4d9d          e=   -837313.98798
d 1  s 0  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 4d10d         e=   -837307.52940
d 1  s 0  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 4d11d         e=   -837302.97653
d 1  s 0  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 4d12d         e=   -837299.64452
d 1  s 0  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 4d13d         e=   -837297.12835
d 1  s 0  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 4d14d         e=   -837295.18650
d 0  s 1  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 5s5d          e=   -837348.98036
d 0  s 1  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 5s6d          e=   -837291.51252
d 0  s 1  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 5s7d          e=   -837263.75545
d 0  s 1  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 5s8d          e=   -837247.95984
d 0  s 1  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 5s9d          e=   -837238.05494
d 0  s 1  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 5s10d         e=   -837231.41841
d 0  s 1  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 5s11d         e=   -837226.75649
d 0  s 1  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 5s12d         e=   -837223.35433
d 0  s 1  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 5s13d         e=   -837220.78817
d 0  s 1  p 0  s 0  d 1  g 0  i 0  p 0      nb iv 5s14d         e=   -837218.81510
d 0  s 1  p 0  s 0  d 0  g 1  i 0  p 0      nb iv 5s5g          e=   -837280.15114
d 0  s 1  p 0  s 0  d 0  g 1  i 0  p 0      nb iv 5s6g          e=   -837257.67000
d 0  s 1  p 0  s 0  d 0  g 1  i 0  p 0      nb iv 5s7g          e=   -837244.29737
d 0  s 1  p 0  s 0  d 0  g 1  i 0  p 0      nb iv 5s8g          e=   -837235.67401
d 0  s 1  p 0  s 0  d 0  g 1  i 0  p 0      nb iv 5s9g          e=   -837229.78302
d 1  s 0  p 0  s 0  d 0  g 1  i 0  p 0      nb iv 4d5g          e=   -837355.41124
d 1  s 0  p 0  s 0  d 0  g 1  i 0  p 0      nb iv 4d6g          e=   -837333.59160
d 1  s 0  p 0  s 0  d 0  g 1  i 0  p 0      nb iv 4d7g          e=   -837320.45824
d 1  s 0  p 0  s 0  d 0  g 1  i 0  p 0      nb iv 4d8g          e=   -837311.95125
d 1  s 0  p 0  s 0  d 0  g 1  i 0  p 0      nb iv 4d9g          e=   -837306.12409
d 1  s 0  p 0  s 0  d 0  g 0  i 1  p 0      nb iv 4d7i          e=   -837320.14636
d 1  s 0  p 0  s 0  d 0  g 0  i 1  p 0      nb iv 4d8i          e=   -837311.74866
d 1  s 0  p 0  s 0  d 0  g 0  i 1  p 0      nb iv 4d9i          e=   -837305.98691
d 0  s 1  p 0  s 0  d 0  g 0  i 1  p 0      nb iv 5s7i          e=   -837243.71125
d 0  s 1  p 0  s 0  d 0  g 0  i 1  p 0      nb iv 5s8i          e=   -837235.31185
d 0  s 1  p 0  s 0  d 0  g 0  i 1  p 0      nb iv 5s9i          e=   -837229.54126
d 0  s 0  p 2  s 0  d 0  g 0  i 0  p 0      nb iv 5p2           e=   -837367.94396
d 0  s 0  p 1  s 0  d 0  g 0  i 0  p 1      nb iv 5p6p          e=   -837268.16759
d 0  s 0  p 1  s 0  d 0  g 0  i 0  p 1      nb iv 5p7p          e=   -837225.02318
d 0  s 0  p 1  s 0  d 0  g 0  i 0  p 1      nb iv 5p8p          e=   -837202.64174
