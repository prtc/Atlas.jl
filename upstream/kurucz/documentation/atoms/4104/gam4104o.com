set4104
date > gam4104o.log
delete fort.*
assign gam4104o.lin fort.7
assign gam4104o.gam fort.8
assign c4104o.eig fort.2
assign c4104o.eig fort.3
#assign gam410415.dat fort.15
assign lsm4104o.dat fort.41
biggfm << 'eof' >> gam4104o.log
41.04 ODD
0.        99999.999 -6.5      407897.   326000.   326000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4104o.log
sort -o gam4104o.lin gam4104o.lin
date >> gam4104o.log
