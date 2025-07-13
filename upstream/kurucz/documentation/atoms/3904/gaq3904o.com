set3904
date > gaq3904o.log
delete fort.*
assign gaq3904o.lin fort.7
assign gaq3904o.gam fort.8
assign c3904o.eig fort.2
assign c3904o.eig fort.3
assign rrhf3904o.dat fort.12
#assign gaq390415.dat fort.15
assign lsq3904o.dat fort.41
biggfq << 'eof' >> gaq3904o.log
39.04 ODD
0.        99999.999 -6.5      607760.   486000.   486000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq3904o.log
sort -o gaq3904o.lin gaq3904o.lin
date >> gaq3904o.log
