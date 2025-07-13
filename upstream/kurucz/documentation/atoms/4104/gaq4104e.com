set4104
date > gaq4104e.log
delete fort.*
assign gaq4104e.lin fort.7
assign gaq4104e.gam fort.8
assign c4104e.eig fort.2
assign c4104e.eig fort.3
assign rrhf4104e.dat fort.12
#assign gaq410415.dat fort.15
assign lsq4104e.dat fort.41
biggfq << 'eof' >> gaq4104e.log
41.04 EVE
0.        99999.999 -6.5      407897.   326000.   326000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4104e.log
sort -o gaq4104e.lin gaq4104e.lin
date >> gaq4104e.log
