set4603
delete fort.*
#assign gf4603.gam fort.1
assign gammasum4603.gam fort.1
assign life4603.dat fort.7
assign lifemeta4603.dat fort.8
lifetimes > life4603.log
