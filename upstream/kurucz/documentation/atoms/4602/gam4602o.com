set4602
delete fort.*
date > gam4602o.log
assign gam4602o.lin fort.7
assign gam4602o.gam fort.8
assign c4602o.eig fort.2
assign c4602o.eig fort.3
assign gam460215.dat fort.15
assign lsm4602o.dat fort.41
biggfm << 'eof' >> gam4602o.log
46.02 ODD
0.        99999.999 -7.5      265600.   212000.   212000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4602o.log
sort -o gam4602o.lin gam4602o.lin
date >> gam4602o.log
