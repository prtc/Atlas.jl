set3904
date > gaq3904e.log
delete fort.*
assign gaq3904e.lin fort.7
assign gaq3904e.gam fort.8
assign c3904e.eig fort.2
assign c3904e.eig fort.3
assign rrhf3904e.dat fort.12
#assign gaq390415.dat fort.15
assign lsq3904e.dat fort.41
biggfq << 'eof' >> gaq3904e.log
39.04 EVE
0.        99999.999 -6.5      607760.   486000.   486000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq3904e.log
sort -o gaq3904e.lin gaq3904e.lin
date >> gaq3904e.log
