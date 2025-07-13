set3802
date > gaq3802o.log
delete fort.*
assign gaq3802o.lin fort.7
assign gaq3802o.gam fort.8
assign c3802o.eig fort.2
assign c3802o.eig fort.3
assign rrhf3802o.dat fort.12
#assign gaq380215.dat fort.15
assign lsq3802o.dat fort.41
biggfq << 'eof' >> gaq3802o.log
38.02 ODD
0.        99999.999 -6.5      345879.   277000.   277000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq3802o.log
sort -o gaq3802o.lin gaq3802o.lin
date >> gaq3802o.log
