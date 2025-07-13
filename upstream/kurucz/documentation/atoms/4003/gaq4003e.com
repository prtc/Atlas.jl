set4003
date > gaq4003e.log
delete fort.*
assign gaq4003e.lin fort.7
assign gaq4003e.gam fort.8
assign c4003e.eig fort.2
assign c4003e.eig fort.3
assign rrhf4003e.dat fort.12
#assign gaq400315.dat fort.15
assign lsq4003e.dat fort.41
biggfq << 'eof' >> gaq4003e.log
40.03 EVE
0.        99999.999 -6.5      277602.8  222000.   222000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4003e.log
sort -o gaq4003e.lin gaq4003e.lin
date >> gaq4003e.log
