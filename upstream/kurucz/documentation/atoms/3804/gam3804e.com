set3804
date > gam3804e.log
delete fort.*
assign gam3804e.lin fort.7
assign gam3804e.gam fort.8
assign c3804e.eig fort.2
assign c3804e.eig fort.3
#assign gam380415.dat fort.15
assign lsm3804e.dat fort.41
biggfm << 'eof' >> gam3804e.log
38.04 EVE
0.        99999.999 -6.5      570000.   456000.   456000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam3804e.log
sort -o gam3804e.lin gam3804e.lin
date >> gam3804e.log
