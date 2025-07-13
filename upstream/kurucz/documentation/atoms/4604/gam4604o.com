set4604
date > gam4604o.log
delete fort.*
assign gam4604o.lin fort.7
assign gam4604o.gam fort.8
assign c4604o.eig fort.2
assign c4604o.eig fort.3
#assign gam460415.dat fort.15
assign lsm4604o.dat fort.41
biggfm << 'eof' >> gam4604o.log
46.04 ODD
0.        99999.999 -6.5      492000.   394000.   394000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gam4604o.log
sort -o gam4604o.lin gam4604o.lin
date >> gam4604o.log
