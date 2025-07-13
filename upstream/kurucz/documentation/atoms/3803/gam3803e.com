set3803
date > gam3803e.log
delete fort.*
assign gam3803e.lin fort.7
assign gam3803e.gam fort.8
assign c3803e.eig fort.2
assign c3803e.eig fort.3
#assign gam380315.dat fort.15
assign lsm3803e.dat fort.41
biggfm << 'eof' >> gam3803e.log
38.03 EVE
0.        99999.999 -6.5      453930.   353000.   353000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam3803e.log
sort -o gam3803e.lin gam3803e.lin
date >> gam3803e.log
