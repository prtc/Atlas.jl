set2701
date > gf2701.log
\rm fort.*
assign c2701e.eig fort.2
assign c2701o.eig fort.3
assign rrhf2701.dat fort.12
assign ls2701.dat fort.41
assign gf2701.lin fort.7
assign gf2701.wnlin fort.27
assign gf2701.gam fort.8
assign gf270115.dat fort.15
biggf << 'eof' >> gf2701.log
27.01 ALL
0.        99999.999 -7.5      137795.   110000.   110000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
\rm fort*
date >> gf2701.log
sort -o gf2701.lin gf2701.lin
sort -o gf2701.wnlin gf2701.wnlin
date >> gf2701.log
