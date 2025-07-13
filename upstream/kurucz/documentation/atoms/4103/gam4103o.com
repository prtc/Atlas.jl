set4103
date > gam4103o.log
delete fort.*
assign gam4103o.lin fort.7
assign gam4103o.gam fort.8
assign c4103o.eig fort.2
assign c4103o.eig fort.3
#assign gam410315.dat fort.15
assign lsm4103o.dat fort.41
biggfm << 'eof' >> gam4103o.log
41.03 ODD
0.        99999.999 -6.5      303350.   224000.   224000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4103o.log
sort -o gam4103o.lin gam4103o.lin
date >> gam4103o.log
