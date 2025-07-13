set4003
date > gaq4003o.log
delete fort.*
assign gaq4003o.lin fort.7
assign gaq4003o.gam fort.8
assign c4003o.eig fort.2
assign c4003o.eig fort.3
assign rrhf4003o.dat fort.12
#assign gaq400315.dat fort.15
assign lsq4003o.dat fort.41
biggfq << 'eof' >> gaq4003o.log
40.03 ODD
0.        99999.999 -6.5      277602.8  222000.   222000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4003o.log
sort -o gaq4003o.lin gaq4003o.lin
date >> gaq4003o.log
