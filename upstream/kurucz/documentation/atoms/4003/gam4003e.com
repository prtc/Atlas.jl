set4003
date > gam4003e.log
delete fort.*
assign gam4003e.lin fort.7
assign gam4003e.gam fort.8
assign c4003e.eig fort.2
assign c4003e.eig fort.3
#assign gam400315.dat fort.15
assign lsm4003e.dat fort.41
biggfm << 'eof' >> gam4003e.log
40.03 EVE
0.        99999.999 -6.5      277602.8  222000.   222000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4003e.log
sort -o gam4003e.lin gam4003e.lin
date >> gam4003e.log
