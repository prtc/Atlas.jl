set4602
date > gf4602.log
delete fort.*
assign c4602e.eig fort.2
assign c4602o.eig fort.3
assign rrhf4602.dat fort.12
assign ls4602.dat fort.41
assign gf4602.lin fort.7
assign gf4602.wnlin fort.27
assign gf4602.gam fort.8
#assign gf460215.dat fort.15
biggf << 'eof' >> gf4602.log
46.02 ALL
0.        99999.999 -7.5      265600.   212000.   212000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
\rm fort*
date >> gf4602.log
sort -o gf4602.lin gf4602.lin
sort -o gf4602.wnlin gf4602.wnlin
date >> gf4602.log
