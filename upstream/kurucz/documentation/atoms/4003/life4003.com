set4003
delete fort.*
#assign gf4003.gam fort.1
assign gammasum4003.gam fort.1
assign life4003.dat fort.7
assign lifemeta4003.dat fort.8
lifetimes > life4003.log
