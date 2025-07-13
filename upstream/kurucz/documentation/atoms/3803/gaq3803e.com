set3803
date > gaq3803e.log
delete fort.*
assign gaq3803e.lin fort.7
assign gaq3803e.gam fort.8
assign c3803e.eig fort.2
assign c3803e.eig fort.3
assign rrhf3803e.dat fort.12
#assign gaq380315.dat fort.15
assign lsq3803e.dat fort.41
biggfq << 'eof' >> gaq3803e.log
38.03 EVE
0.        99999.999 -6.5      453930.   353000.   353000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq3803e.log
sort -o gaq3803e.lin gaq3803e.lin
date >> gaq3803e.log
