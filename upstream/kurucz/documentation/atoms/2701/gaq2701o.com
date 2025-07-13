set2701
date > gaq2701o.log
delete fort.*
assign gaq2701o.lin fort.7
assign gaq2701o.gam fort.8
assign c2701o.eig fort.2
assign c2701o.eig fort.3
assign rrhf2701o.dat fort.12
#assign gaq270115.dat fort.15
assign lsq2701o.dat fort.41
biggfq << 'eof' >> gaq2701o.log
27.01 ODD
0.        99999.999 -7.5      137795.   110000.   110000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq2701o.log
sort -o gaq2701o.lin gaq2701o.lin
date >> gaq2701o.log
