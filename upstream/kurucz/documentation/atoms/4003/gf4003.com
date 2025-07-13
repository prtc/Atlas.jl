set4003
date > gf4003.log
delete fort.*
assign c4003e.eig fort.2
assign c4003o.eig fort.3
assign rrhf4003.dat fort.12
assign ls4003.dat fort.41
assign gf4003.lin fort.7
assign gf4003.wnlin fort.27
assign gf4003.gam fort.8
#assign gf400315.dat fort.15
biggf << 'eof' >> gf4003.log
40.03 ALL
0.        99999.999 -7.5      277602.8  222000.   222000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
delete fort*
date >> gf4003.log
sort -o gf4003.lin gf4003.lin
sort -o gf4003.wnlin gf4003.wnlin
date >> gf4003.log
