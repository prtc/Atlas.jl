set3804
date > gaq3804o.log
delete fort.*
assign gaq3804o.lin fort.7
assign gaq3804o.gam fort.8
assign c3804o.eig fort.2
assign c3804o.eig fort.3
assign rrhf3804o.dat fort.12
#assign gaq380415.dat fort.15
assign lsq3804o.dat fort.41
biggfq << 'eof' >> gaq3804o.log
38.04 ODD
0.        99999.999 -6.5      570000.   456000.   456000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq3804o.log
sort -o gaq3804o.lin gaq3804o.lin
date >> gaq3804o.log
