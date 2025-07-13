set3803
date > gam3803o.log
delete fort.*
assign gam3803o.lin fort.7
assign gam3803o.gam fort.8
assign c3803o.eig fort.2
assign c3803o.eig fort.3
#assign gam380315.dat fort.15
assign lsm3803o.dat fort.41
biggfm << 'eof' >> gam3803o.log
38.03 ODD
0.        99999.999 -6.5      453930.   353000.   353000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam3803o.log
sort -o gam3803o.lin gam3803o.lin
date >> gam3803o.log
