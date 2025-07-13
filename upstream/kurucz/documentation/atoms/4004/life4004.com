set4004
delete fort.*
#assign gf4004.gam fort.1
assign gammasum4004.gam fort.1
assign life4004.dat fort.7
assign lifemeta4004.dat fort.8
lifetimes > life4004.log
