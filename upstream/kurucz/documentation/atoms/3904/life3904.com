set3904
delete fort.*
#assign gf3904.gam fort.1
assign gammasum3904.gam fort.1
assign life3904.dat fort.7
assign lifemeta3904.dat fort.8
lifetimes > life3904.log
