set4004
date > gf4004.log
delete fort.*
assign c4004e.eig fort.2
assign c4004o.eig fort.3
assign rrhf4004.dat fort.12
assign ls4004.dat fort.41
assign gf4004.lin fort.7
assign gf4004.wnlin fort.27
assign gf4004.gam fort.8
#assign gf400415.dat fort.15
biggf << 'eof' >> gf4004.log
40.04 ALL
0.        99999.999 -7.5      648050.   518000.   518000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
delete fort*
date >> gf4004.log
sort -o gf4004.lin gf4004.lin
sort -o gf4004.wnlin gf4004.wnlin
date >> gf4004.log
