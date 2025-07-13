set3904
date > gf3904.log
delete fort.*
assign c3904e.eig fort.3
assign c3904o.eig fort.2
assign rrhf3904.dat fort.12
assign ls3904.dat fort.41
assign gf3904.lin fort.7
assign gf3904.wnlin fort.27
assign gf3904.gam fort.8
#assign gf390415.dat fort.15
#biggf << 'eof' >> gf3904.log
./biggfodd.exe << 'eof' >> gf3904.log
39.04 ALL
0.        99999.999 -7.5      607760.   486000.   486000.   1.        99.
WAVELO    WAVEHI    GFLO      EION      EGFLO     EBOLT     STARTJJ   STOPJJ
  0
eof
delete fort*
date >> gf3904.log
sort -o gf3904.lin gf3904.lin
sort -o gf3904.wnlin gf3904.wnlin
date >> gf3904.log
