set4603
date > gaq4603o.log
delete fort.*
assign gaq4603o.lin fort.7
assign gaq4603o.gam fort.8
assign c4603o.eig fort.2
assign c4603o.eig fort.3
assign rrhf4603o.dat fort.12
#assign gaq460315.dat fort.15
assign lsq4603o.dat fort.41
biggfq << 'eof' >> gaq4603o.log
46.03 ODD
0.        99999.999 -6.5      371000.   296000.   296000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4603o.log
sort -o gaq4603o.lin gaq4603o.lin
date >> gaq4603o.log
