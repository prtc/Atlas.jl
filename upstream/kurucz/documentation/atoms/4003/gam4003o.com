set4003
date > gam4003o.log
delete fort.*
assign gam4003o.lin fort.7
assign gam4003o.gam fort.8
assign c4003o.eig fort.2
assign c4003o.eig fort.3
#assign gam400315.dat fort.15
assign lsm4003o.dat fort.41
biggfm << 'eof' >> gam4003o.log
40.03 ODD
0.        99999.999 -6.5      277602.8  222000.   222000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4003o.log
sort -o gam4003o.lin gam4003o.lin
date >> gam4003o.log
