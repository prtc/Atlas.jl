set3804
date > gam3804o.log
delete fort.*
assign gam3804o.lin fort.7
assign gam3804o.gam fort.8
assign c3804o.eig fort.2
assign c3804o.eig fort.3
#assign gam380415.dat fort.15
assign lsm3804o.dat fort.41
biggfm << 'eof' >> gam3804o.log
38.04 ODD
0.        99999.999 -6.5      570000.   456000.   456000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam3804o.log
sort -o gam3804o.lin gam3804o.lin
date >> gam3804o.log
