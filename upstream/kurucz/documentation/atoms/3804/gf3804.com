set3804
date > gf3804.log
delete fort.*
assign c3804e.eig fort.2
assign c3804o.eig fort.3
assign rrhf3804.dat fort.12
assign ls3804.dat fort.41
assign gf3804.lin fort.7
assign gf3804.wnlin fort.27
assign gf3804.gam fort.8
#assign gf380415.dat fort.15
#./biggfodd.exe << 'eof' >> gf3804.log
 biggf << 'eof' >> gf3804.log
38.04 ALL
0.        99999.999 -7.5      570000.   456000.   456000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
delete fort*
date >> gf3804.log
sort -o gf3804.lin gf3804.lin
sort -o gf3804.wnlin gf3804.wnlin
date >> gf3804.log
