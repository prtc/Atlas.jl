set4004
date > gaq4004e.log
delete fort.*
assign gaq4004e.lin fort.7
assign gaq4004e.gam fort.8
assign c4004e.eig fort.2
assign c4004e.eig fort.3
assign rrhf4004e.dat fort.12
#assign gaq400415.dat fort.15
assign lsq4004e.dat fort.41
biggfq << 'eof' >> gaq4004e.log
40.04 EVE
0.        99999.999 -6.5      648050.   518000.   518000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4004e.log
sort -o gaq4004e.lin gaq4004e.lin
date >> gaq4004e.log
