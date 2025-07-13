set4004
date > gaq4004o.log
delete fort.*
assign gaq4004o.lin fort.7
assign gaq4004o.gam fort.8
assign c4004o.eig fort.2
assign c4004o.eig fort.3
assign rrhf4004o.dat fort.12
#assign gaq400415.dat fort.15
assign lsq4004o.dat fort.41
biggfq << 'eof' >> gaq4004o.log
40.04 ODD
0.        99999.999 -6.5      648050.   518000.   518000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4004o.log
sort -o gaq4004o.lin gaq4004o.lin
date >> gaq4004o.log
