set4604
date > gf4604.log
delete fort.*
assign c4604e.eig fort.2
assign c4604o.eig fort.3
assign rrhf4604.dat fort.12
assign ls4604.dat fort.41
assign gf4604.lin fort.7
assign gf4604.wnlin fort.27
assign gf4604.gam fort.8
#assign gf460415.dat fort.15
biggf << 'eof' >> gf4604.log
46.04 ALL
0.        99999.999 -7.5      492000.   394000.   394000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
delete fort*
date >> gf4604.log
sort -o gf4604.lin gf4604.lin
sort -o gf4604.wnlin gf4604.wnlin
date >> gf4604.log
