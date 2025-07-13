set2701
\rm fort.*
#assign gf2701.gam fort.1
assign gammasum2701.gam fort.1
assign life2701.dat fort.7
assign lifemeta2701.dat fort.8
lifetimes > life2701.log
