set4103
date > gaq4103e.log
delete fort.*
assign gaq4103e.lin fort.7
assign gaq4103e.gam fort.8
assign c4103e.eig fort.2
assign c4103e.eig fort.3
assign rrhf4103e.dat fort.12
#assign gaq410315.dat fort.15
assign lsq4103e.dat fort.41
biggfq << 'eof' >> gaq4103e.log
41.03 EVE
0.        99999.999 -6.5      303350.   243000.   243000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4103e.log
sort -o gaq4103e.lin gaq4103e.lin
date >> gaq4103e.log
