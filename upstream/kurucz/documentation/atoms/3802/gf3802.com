set3802
date > gf3802.log
delete fort.*
assign c3802e.eig fort.2
assign c3802o.eig fort.3
assign rrhf3802.dat fort.12
assign ls3802.dat fort.41
assign gf3802.lin fort.7
assign gf3802.wnlin fort.27
assign gf3802.gam fort.8
#assign gf380215.dat fort.15
#./biggfodd.exe << 'eof' >> gf3802.log
 biggf << 'eof' >> gf3802.log
38.02 ALL
0.        99999.999 -7.5      345879.   277000.   277000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
delete fort*
date >> gf3802.log
sort -o gf3802.lin gf3802.lin
sort -o gf3802.wnlin gf3802.wnlin
date >> gf3802.log
