set4104
date > gaq4104o.log
delete fort.*
assign gaq4104o.lin fort.7
assign gaq4104o.gam fort.8
assign c4104o.eig fort.2
assign c4104o.eig fort.3
assign rrhf4104o.dat fort.12
#assign gaq410415.dat fort.15
assign lsq4104o.dat fort.41
biggfq << 'eof' >> gaq4104o.log
41.04 ODD
0.        99999.999 -6.5      407897.   326000.   326000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4104o.log
sort -o gaq4104o.lin gaq4104o.lin
date >> gaq4104o.log
