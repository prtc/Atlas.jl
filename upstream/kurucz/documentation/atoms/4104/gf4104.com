set4104
date > gf4104.log
delete fort.*
assign c4104e.eig fort.2
assign c4104o.eig fort.3
assign rrhf4104.dat fort.12
assign ls4104.dat fort.41
assign gf4104.lin fort.7
assign gf4104.wnlin fort.27
assign gf4104.gam fort.8
#assign gf410415.dat fort.15
biggf << 'eof' >> gf4104.log
41.04 ALL
0.        99999.999 -7.5      407897.   326000.   326000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
delete fort*
date >> gf4104.log
sort -o gf4104.lin gf4104.lin
sort -o gf4104.wnlin gf4104.wnlin
date >> gf4104.log
