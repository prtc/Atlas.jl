set4604
date > gaq4604o.log
delete fort.*
assign gaq4604o.lin fort.7
assign gaq4604o.gam fort.8
assign c4604o.eig fort.2
assign c4604o.eig fort.3
assign rrhf4604o.dat fort.12
#assign gaq460415.dat fort.15
assign lsq4604o.dat fort.41
biggfq << 'eof' >> gaq4604o.log
46.04 ODD
0.        99999.999 -6.5      492000.   394000.   394000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4604o.log
sort -o gaq4604o.lin gaq4604o.lin
date >> gaq4604o.log
