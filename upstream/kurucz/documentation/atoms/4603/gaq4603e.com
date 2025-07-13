set4603
date > gaq4603e.log
delete fort.*
assign gaq4603e.lin fort.7
assign gaq4603e.gam fort.8
assign c4603e.eig fort.2
assign c4603e.eig fort.3
assign rrhf4603e.dat fort.12
#assign gaq460315.dat fort.15
assign lsq4603e.dat fort.41
biggfq << 'eof' >> gaq4603e.log
46.03 EVE
0.        99999.999 -6.5      371000.   296000.   296000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4603e.log
sort -o gaq4603e.lin gaq4603e.lin
date >> gaq4603e.log
