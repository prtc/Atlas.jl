set3803
date > gf3803.log
delete fort.*
assign c3803e.eig fort.3
assign c3803o.eig fort.2
assign rrhf3803.dat fort.12
assign ls3803.dat fort.41
assign gf3803.lin fort.7
assign gf3803.wnlin fort.27
assign gf3803.gam fort.8
#assign gf380315.dat fort.15
#biggf << 'eof' >> gf3803.log
./biggfodd.exe << 'eof' >> gf3803.log
38.03 ALL
0.        99999.999 -7.5      453930.   353000.   353000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
delete fort*
date >> gf3803.log
sort -o gf3803.lin gf3803.lin
sort -o gf3803.wnlin gf3803.wnlin
date >> gf3803.log
