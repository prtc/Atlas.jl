set4602
date > gaq4602o.log
delete fort.*
assign gaq4602o.lin fort.7
assign gaq4602o.gam fort.8
assign c4602o.eig fort.2
assign c4602o.eig fort.3
assign rrhf4602o.dat fort.12
#assign gaq460215.dat fort.15
assign lsq4602o.dat fort.41
biggfq << 'eof' >> gaq4602o.log
46.02 ODD
0.        99999.999 -7.5      265600.   212000.   212000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4602o.log
sort -o gaq4602o.lin gaq4602o.lin
date >> gaq4602o.log
