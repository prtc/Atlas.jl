set2701
\rm fort.*
assign ab270159.dat fort.1
assign gf2701.pos fort.2
assign hyper270159.pos fort.7
hyperfine > hyper270159.posout
sort -o hyper270159.pos hyper270159.pos
\rm fort.*
assign ab270159.dat fort.1
assign gf2701.all fort.2
assign hyper270159.all fort.7
hyperfine > hyper270159.allout
sort -o hyper270159.all hyper270159.all
