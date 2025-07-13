set4103
date > gaq4103o.log
delete fort.*
assign gaq4103o.lin fort.7
assign gaq4103o.gam fort.8
assign c4103o.eig fort.2
assign c4103o.eig fort.3
assign rrhf4103o.dat fort.12
#assign gaq410315.dat fort.15
assign lsq4103o.dat fort.41
biggfq << 'eof' >> gaq4103o.log
41.03 ODD
0.        99999.999 -6.5      303350.   243000.   243000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4103o.log
sort -o gaq4103o.lin gaq4103o.lin
date >> gaq4103o.log
