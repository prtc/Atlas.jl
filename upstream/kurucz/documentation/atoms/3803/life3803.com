set3803
delete fort.*
#assign gf3803.gam fort.1
assign gammasum3803.gam fort.1
assign life3803.dat fort.7
assign lifemeta3803.dat fort.8
lifetimes > life3803.log
