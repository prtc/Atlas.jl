set4603
date > gam4603o.log
delete fort.*
assign gam4603o.lin fort.7
assign gam4603o.gam fort.8
assign c4603o.eig fort.2
assign c4603o.eig fort.3
#assign gam460315.dat fort.15
assign lsm4603o.dat fort.41
biggfm << 'eof' >> gam4603o.log
46.03 ODD
0.        99999.999 -6.5      371000.   296000.   296000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4603o.log
sort -o gam4603o.lin gam4603o.lin
date >> gam4603o.log
