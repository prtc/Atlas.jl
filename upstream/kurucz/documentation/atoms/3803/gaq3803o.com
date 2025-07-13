set3803
date > gaq3803o.log
delete fort.*
assign gaq3803o.lin fort.7
assign gaq3803o.gam fort.8
assign c3803o.eig fort.2
assign c3803o.eig fort.3
assign rrhf3803o.dat fort.12
#assign gaq380315.dat fort.15
assign lsq3803o.dat fort.41
biggfq << 'eof' >> gaq3803o.log
38.03 ODD
0.        99999.999 -6.5      453930.   353000.   353000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq3803o.log
sort -o gaq3803o.lin gaq3803o.lin
date >> gaq3803o.log
