set4602
date > gaq4602e.log
delete fort.*
assign gaq4602e.lin fort.7
assign gaq4602e.gam fort.8
assign c4602e.eig fort.2
assign c4602e.eig fort.3
assign rrhf4602e.dat fort.12
#assign gaq460215.dat fort.15
assign lsq4602e.dat fort.41
biggfq << 'eof' >> gaq4602e.log
46.02 EVE
0.        99999.999 -7.5      265600.   212000.   212000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4602e.log
sort -o gaq4602e.lin gaq4602e.lin
date >> gaq4602e.log
