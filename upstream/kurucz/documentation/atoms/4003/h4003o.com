set4003
delete fort*
assign h4003o.ham fort.7
assign h4003o.dat fort.99
#assign h4003o20 for020
#assign h4003o31 for031
#assign h4003o32 for032
#assign h4003o41 for041
#assign h4003o41 for070
#assign h4003o41 for071
#assign cowanlanl:save72.dat for072
#assign cowanlanl:save73.dat for073
#assign cowanlanl:save74.dat for074
rcgham << "eof" > h4003o.log
 836 0 h4003o
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      zr iv 4p6 5p        e=   -789036.06714
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      zr iv 4p6 6p        e=   -788948.86419
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      zr iv 4p6 7p        e=   -788910.47598
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      zr iv 4p6 8p        e=   -788889.78825
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      zr iv 4p6 9p        e=   -788877.31578
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      zr iv 4p6 10p       e=   -788869.20360
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      zr iv 4p6 11p       e=   -788863.62827
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      zr iv 4p6 12p       e=   -788859.62734
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      zr iv 4p6 13p       e=   -788856.66320
p 6  d 0  s 0  p 0  p 1  f 0  h 0  k 0      zr iv 4p6 14p       e=   -788854.40347
p 5  d 0  s 0  p 2  p 0  f 0  h 0  k 0      zr iv 4p5 5p2       e=   -788666.26618
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 4f        e=   -788958.83798
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 5f        e=   -788916.53124
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 6f        e=   -788893.70556
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 7f        e=   -788879.94404
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 8f        e=   -788871.03416
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 9f        e=   -788864.94374
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 10f       e=   -788860.60744
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 11f       e=   -788857.41084
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 12f       e=   -788854.98187
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 13f       e=   -788853.10432
p 6  d 0  s 0  p 0  p 0  f 1  h 0  k 0      zr iv 4p6 14f       e=   -788851.61305
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      zr iv 4p6 6h        e=   -788891.25658
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      zr iv 4p6 7h        e=   -788878.31117
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      zr iv 4p6 8h        e=   -788869.90145
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      zr iv 4p6 9h        e=   -788864.13110
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      zr iv 4p6 10h       e=   -788860.00611
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      zr iv 4p6 11h       e=   -788856.95305
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      zr iv 4p6 12h       e=   -788854.62631
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      zr iv 4p6 13h       e=   -788852.82230
p 6  d 0  s 0  p 0  p 0  f 0  h 1  k 0      zr iv 4p6 14h       e=   -788851.38713
p 6  d 0  s 0  p 0  p 0  f 0  h 0  k 1      zr iv 4p6 8k        e=   -788869.85510
p 6  d 0  s 0  p 0  p 0  f 0  h 0  k 1      zr iv 4p6 9k        e=   -788864.09669
p 5  d 2  s 0  p 0  p 0  f 0  h 0  k 0      zr iv 4p5 4d2       e=   -788860.97117
p 5  d 1  s 1  p 0  p 0  f 0  h 0  k 0      zr iv 4p5 4d5s      e=   -788819.27566
p 5  d 0  s 2  p 0  p 0  f 0  h 0  k 0      zr iv 4p5 5s2       e=   -788760.16888
eof
