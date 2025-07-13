set3802
date > gam3802o.log
delete fort.*
assign gam3802o.lin fort.7
assign gam3802o.gam fort.8
assign c3802o.eig fort.2
assign c3802o.eig fort.3
#assign gam380215.dat fort.15
assign lsm3802o.dat fort.41
biggfm << 'eof' >> gam3802o.log
38.02 ODD
0.        99999.999 -6.5      345879.   277000.   277000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
quit
delete fort.*
date >> gam3802o.log
sort -o gam3802o.lin gam3802o.lin
date >> gam3802o.log
