set2701
date > gaq2701e.log
delete fort.*
assign gaq2701e.lin fort.7
assign gaq2701e.gam fort.8
assign c2701e.eig fort.2
assign c2701e.eig fort.3
assign rrhf2701e.dat fort.12
#assign gaq270115.dat fort.15
assign lsq2701e.dat fort.41
biggfq << 'eof' >> gaq2701e.log
27.01 EVE
0.        99999.999 -7.5      137795.   110000.   110000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq2701e.log
sort -o gaq2701e.lin gaq2701e.lin
date >> gaq2701e.log
