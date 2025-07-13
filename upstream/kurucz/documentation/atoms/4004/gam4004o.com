set4004
date > gam4004o.log
delete fort.*
assign gam4004o.lin fort.7
assign gam4004o.gam fort.8
assign c4004o.eig fort.2
assign c4004o.eig fort.3
#assign gam400415.dat fort.15
assign lsm4004o.dat fort.41
biggfm << 'eof' >> gam4004o.log
40.04 ODD
0.        99999.999 -6.5      648050.   518000.   518000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4004o.log
sort -o gam4004o.lin gam4004o.lin
date >> gam4004o.log
