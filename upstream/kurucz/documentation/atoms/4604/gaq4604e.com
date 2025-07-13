set4604
date > gaq4604e.log
delete fort.*
assign gaq4604e.lin fort.7
assign gaq4604e.gam fort.8
assign c4604e.eig fort.2
assign c4604e.eig fort.3
assign rrhf4604e.dat fort.12
#assign gaq460415.dat fort.15
assign lsq4604e.dat fort.41
biggfq << 'eof' >> gaq4604e.log
46.04 EVE
0.        99999.999 -6.5      492000.   394000.   394000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
0
eof
delete fort.*
date >> gaq4604e.log
sort -o gaq4604e.lin gaq4604e.lin
date >> gaq4604e.log
