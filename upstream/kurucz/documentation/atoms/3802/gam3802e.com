set3802
date > gam3802e.log
delete fort.*
assign gam3802e.lin fort.7
assign gam3802e.gam fort.8
assign c3802e.eig fort.2
assign c3802e.eig fort.3
#assign gam380215.dat fort.15
assign lsm3802e.dat fort.41
biggfm << 'eof' >> gam3802e.log
38.02 EVE
0.        99999.999 -6.5      345879.   277000.   277000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam3802e.log
sort -o gam3802e.lin gam3802e.lin
date >> gam3802e.log
