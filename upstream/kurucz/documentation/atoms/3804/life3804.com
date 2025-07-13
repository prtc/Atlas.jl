set3804
delete fort.*
#assign gf3804.gam fort.1
assign gammasum3804.gam fort.1
assign life3804.dat fort.7
assign lifemeta3804.dat fort.8
lifetimes > life3804.log
