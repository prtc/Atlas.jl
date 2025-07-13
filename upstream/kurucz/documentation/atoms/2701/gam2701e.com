set2701
date > gam2701e.log
delete fort.*
assign gam2701e.lin fort.7
assign gam2701e.gam fort.8
assign c2701e.eig fort.2
assign c2701e.eig fort.3
#assign gam270115.dat fort.15
assign lsm2701e.dat fort.41
biggfm << 'eof' >> gam2701e.log
27.01 EVE
0.        99999.999 -7.5      137795.   110000.   110000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam2701e.log
sort -o gam2701e.lin gam2701e.lin
date >> gam2701e.log
