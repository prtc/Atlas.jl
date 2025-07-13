set4603
date > gam4603e.log
delete fort.*
assign gam4603e.lin fort.7
assign gam4603e.gam fort.8
assign c4603e.eig fort.2
assign c4603e.eig fort.3
#assign gam460315.dat fort.15
assign lsm4603e.dat fort.41
biggfm << 'eof' >> gam4603e.log
46.03 EVE
0.        99999.999 -6.5      371000.   296000.   296000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4603e.log
sort -o gam4603e.lin gam4603e.lin
date >> gam4603e.log
