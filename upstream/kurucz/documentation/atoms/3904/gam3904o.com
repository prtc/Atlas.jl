set3904
date > gam3904o.log
delete fort.*
assign gam3904o.lin fort.7
assign gam3904o.gam fort.8
assign c3904o.eig fort.2
assign c3904o.eig fort.3
#assign gam390415.dat fort.15
assign lsm3904o.dat fort.41
biggfm << 'eof' >> gam3904o.log
39.04 ODD
0.        99999.999 -6.5      607760.   486000.   486000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam3904o.log
sort -o gam3904o.lin gam3904o.lin
date >> gam3904o.log
