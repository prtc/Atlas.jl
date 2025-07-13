set4602
date > gam4602e.log
delete fort.*
assign gam4602e.lin fort.7
assign gam4602e.gam fort.8
assign c4602e.eig fort.2
assign c4602e.eig fort.3
#assign gam460215.dat fort.15
assign lsm4602e.dat fort.41
biggfm << 'eof' >> gam4602e.log
46.02 EVE
0.        99999.999 -7.5      265600.   212000.   212000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4602e.log
sort -o gam4602e.lin gam4602e.lin
date >> gam4602e.log
