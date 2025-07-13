set4103
delete fort.*
assign h4103o.ham fort.7
assign h4103o.dat fort.99
#assign h4103o20 for020
#assign h4103o31 for031
#assign h4103o32 for032
#assign h4103o41 for041
#assign h4103o41 for070
#assign h4103o41 for071
#assign cowanlanl:save72.dat for072
#assign cowanlanl:save73.dat for073
#assign cowanlanl:save74.dat for074
rcgham << "eof" > h4103o.log
 861 0 H4103O
d 1  s 0  p 1  p 0  f 0  h 0  k 0  d 0      nb iv 4d5p          e=   -837485.77791
d 1  s 0  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 4d6p          e=   -837393.88528
d 1  s 0  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 4d7p          e=   -837353.87468
d 1  s 0  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 4d8p          e=   -837332.53265
d 1  s 0  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 4d9p          e=   -837319.73528
d 1  s 0  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 4d10p         e=   -837311.44329
d 1  s 0  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 4d11p         e=   -837305.75825
d 1  s 0  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 4d12p         e=   -837301.68814
d 1  s 0  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 4d13p         e=   -837298.67813
d 1  s 0  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 4d14p         e=   -837296.38607
d 0  s 1  p 1  p 0  f 0  h 0  k 0  d 0      nb iv 5s5p          e=   -837423.84632
d 0  s 1  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 5s6p          e=   -837321.41667
d 0  s 1  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 5s7p          e=   -837279.05971
d 0  s 1  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 5s8p          e=   -837256.94279
d 0  s 1  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 5s9p          e=   -837243.79319
d 0  s 1  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 5s10p         e=   -837235.31321
d 0  s 1  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 5s11p         e=   -837229.51837
d 0  s 1  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 5s12p         e=   -837225.37927
d 0  s 1  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 5s13p         e=   -837222.32496
d 0  s 1  p 0  p 1  f 0  h 0  k 0  d 0      nb iv 5s14p         e=   -837220.00146
d 1  s 0  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 4d4f          e=   -837402.34158
d 1  s 0  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 4d5f          e=   -837359.32925
d 1  s 0  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 4d6f          e=   -837336.15235
d 1  s 0  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 4d7f          e=   -837322.18391
d 1  s 0  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 4d8f          e=   -837313.15290
d 1  s 0  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 4d9f          e=   -837306.98862
d 1  s 0  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 4d10f         e=   -837302.60508
d 1  s 0  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 4d11f         e=   -837299.37744
d 1  s 0  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 4d12f         e=   -837296.92689
d 1  s 0  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 4d13f         e=   -837295.03453
d 0  s 1  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 5s4f          e=   -837332.01488
d 0  s 1  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 5s5f          e=   -837286.27167
d 0  s 1  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 5s6f          e=   -837261.45080
d 0  s 1  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 5s7f          e=   -837246.74406
d 0  s 1  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 5s8f          e=   -837237.33487
d 0  s 1  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 5s9f          e=   -837230.95664
d 0  s 1  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 5s10f         e=   -837226.44284
d 0  s 1  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 5s11f         e=   -837223.12929
d 0  s 1  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 5s12f         e=   -837220.62154
d 0  s 1  p 0  p 0  f 1  h 0  k 0  d 0      nb iv 5s13f         e=   -837218.68810
d 1  s 0  p 0  p 0  f 0  h 1  k 0  d 0      nb iv 4d6h          e=   -837333.21169
d 1  s 0  p 0  p 0  f 0  h 1  k 0  d 0      nb iv 4d7h          e=   -837320.24487
d 1  s 0  p 0  p 0  f 0  h 1  k 0  d 0      nb iv 4d8h          e=   -837311.81748
d 1  s 0  p 0  p 0  f 0  h 1  k 0  d 0      nb iv 4d9h          e=   -837306.03493
d 1  s 0  p 0  p 0  f 0  h 1  k 0  d 0      nb iv 4d10h         e=   -837301.90145
d 0  s 1  p 0  p 0  f 0  h 1  k 0  d 0      nb iv 5s6h          e=   -837257.01724
d 0  s 1  p 0  p 0  f 0  h 1  k 0  d 0      nb iv 5s7h          e=   -837243.95827
d 0  s 1  p 0  p 0  f 0  h 1  k 0  d 0      nb iv 5s8h          e=   -837235.46651
d 0  s 1  p 0  p 0  f 0  h 1  k 0  d 0      nb iv 5s9h          e=   -837229.64368
d 0  s 1  p 0  p 0  f 0  h 1  k 0  d 0      nb iv 5s10h         e=   -837225.48337
d 0  s 1  p 0  p 0  f 0  h 0  k 1  d 0      nb iv 5s8k          e=   -837235.25047
d 0  s 1  p 0  p 0  f 0  h 0  k 1  d 0      nb iv 5s9k          e=   -837229.49499
d 0  s 1  p 0  p 0  f 0  h 0  k 1  d 0      nb iv 5s10k         e=   -837225.37488
d 1  s 0  p 0  p 0  f 0  h 0  k 1  d 0      nb iv 4d8k          e=   -837311.73119
d 1  s 0  p 0  p 0  f 0  h 0  k 1  d 0      nb iv 4d9k          e=   -837305.97342
d 1  s 0  p 0  p 0  f 0  h 0  k 1  d 0      nb iv 4d10k         e=   -837301.85358
d 0  s 0  p 1  p 0  f 0  h 0  k 0  d 1      nb iv 5p5d          e=   -837297.43499
d 0  s 0  p 1  p 0  f 0  h 0  k 0  d 1      nb iv 5p6d          e=   -837238.04382
d 0  s 0  p 1  p 0  f 0  h 0  k 0  d 1      nb iv 5p7d          e=   -837209.65107
d 0  s 0  p 1  p 0  f 0  h 0  k 0  d 1      nb iv 5p8d          e=   -837193.63952
d 0  s 0  p 1  p 0  f 0  h 0  k 0  d 1      nb iv 5p9d          e=   -837183.63399
