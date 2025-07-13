set3804
date > gaq3804e.log
delete fort.*
assign gaq3804e.lin fort.7
assign gaq3804e.gam fort.8
assign c3804e.eig fort.2
assign c3804e.eig fort.3
assign rrhf3804e.dat fort.12
#assign gaq380415.dat fort.15
assign lsq3804e.dat fort.41
biggfq << 'eof' >> gaq3804e.log
38.04 EVE
0.        99999.999 -6.5      570000.   456000.   456000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq3804e.log
sort -o gaq3804e.lin gaq3804e.lin
date >> gaq3804e.log
