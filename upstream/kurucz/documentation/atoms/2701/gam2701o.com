set2701
date > gam2701o.log
delete fort.*
assign gam2701o.lin fort.7
assign gam2701o.gam fort.8
assign c2701o.eig fort.2
assign c2701o.eig fort.3
#assign gam270115.dat fort.15
assign lsm2701o.dat fort.41
biggfm << 'eof' >> gam2701o.log
27.01 ODD
0.        99999.999 -6.5      137795.   110000.   110000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam2701o.log
sort -o gam2701o.lin gam2701o.lin
date >> gam2701o.log
