set4603
date > gf4603.log
delete fort.*
assign c4603e.eig fort.2
assign c4603o.eig fort.3
assign rrhf4603.dat fort.12
assign ls4603.dat fort.41
assign gf4603.lin fort.7
assign gf4603.wnlin fort.27
assign gf4603.gam fort.8
#assign gf460315.dat fort.15
biggf << 'eof' >> gf4603.log
46.03 ALL
0.        99999.999 -7.5      371000.   296000.   296000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
delete fort*
date >> gf4603.log
sort -o gf4603.lin gf4603.lin
sort -o gf4603.wnlin gf4603.wnlin
date >> gf4603.log
