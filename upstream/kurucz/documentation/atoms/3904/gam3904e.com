set3904
date > gam3904e.log
delete fort.*
assign gam3904e.lin fort.7
assign gam3904e.gam fort.8
assign c3904e.eig fort.2
assign c3904e.eig fort.3
#assign gam390415.dat fort.15
assign lsm3904e.dat fort.41
biggfm << 'eof' >> gam3904e.log
39.04 EVE
0.        99999.999 -6.5      607760.   486000.   486000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam3904e.log
sort -o gam3904e.lin gam3904e.lin
date >> gam3904e.log
