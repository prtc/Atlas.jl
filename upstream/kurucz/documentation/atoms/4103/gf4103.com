set4103
date > gf4103.log
delete fort.*
assign c4103e.eig fort.2
assign c4103o.eig fort.3
assign rrhf4103.dat fort.12
assign ls4103.dat fort.41
assign gf4103.lin fort.7
assign gf4103.wnlin fort.27
assign gf4103.gam fort.8
#assign gf410315.dat fort.15
biggf << 'eof' >> gf4103.log
41.03 ALL
0.        99999.999 -7.5      303350.   243000.   243000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
delete fort*
date >> gf4103.log
sort -o gf4103.lin gf4103.lin
sort -o gf4103.wnlin gf4103.wnlin
date >> gf4103.log
