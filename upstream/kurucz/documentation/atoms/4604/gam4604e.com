set4604
date > gam4604e.log
delete fort.*
assign gam4604e.lin fort.7
assign gam4604e.gam fort.8
assign c4604e.eig fort.2
assign c4604e.eig fort.3
#assign gam460415.dat fort.15
assign lsm4604e.dat fort.41
biggfm << 'eof' >> gam4604e.log
46.04 EVE
0.        99999.999 -6.5      492000.   394000.   394000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4604e.log
sort -o gam4604e.lin gam4604e.lin
date >> gam4604e.log
