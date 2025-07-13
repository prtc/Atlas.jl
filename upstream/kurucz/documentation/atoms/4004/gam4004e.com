set4004
date > gam4004e.log
delete fort.*
assign gam4004e.lin fort.7
assign gam4004e.gam fort.8
assign c4004e.eig fort.2
assign c4004e.eig fort.3
#assign gam400415.dat fort.15
assign lsm4004e.dat fort.41
biggfm << 'eof' >> gam4004e.log
40.04 EVE
0.        99999.999 -6.5      648050.   518000.   518000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4004e.log
sort -o gam4004e.lin gam4004e.lin
date >> gam4004e.log
