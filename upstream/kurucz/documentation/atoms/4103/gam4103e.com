set4103
date > gam4103e.log
delete fort.*
assign gam4103e.lin fort.7
assign gam4103e.gam fort.8
assign c4103e.eig fort.2
assign c4103e.eig fort.3
#assign gam410315.dat fort.15
assign lsm4103e.dat fort.41
biggfm << 'eof' >> gam4103e.log
41.03 EVE
0.        99999.999 -6.5      303350.   243000.   243000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4103e.log
sort -o gam4103e.lin gam4103e.lin
date >> gam4103e.log
