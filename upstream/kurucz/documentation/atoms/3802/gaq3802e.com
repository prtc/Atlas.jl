set3802
date > gaq3802e.log
delete fort.*
assign gaq3802e.lin fort.7
assign gaq3802e.gam fort.8
assign c3802e.eig fort.2
assign c3802e.eig fort.3
assign rrhf3802e.dat fort.12
#assign gaq380215.dat fort.15
assign lsq3802e.dat fort.41
biggfq << 'eof' >> gaq3802e.log
38.02 EVE
0.        99999.999 -6.5      345879.   277000.   277000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq3802e.log
sort -o gaq3802e.lin gaq3802e.lin
date >> gaq3802e.log
