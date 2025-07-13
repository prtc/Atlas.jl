set4104
delete fort.*
#assign gf4104.gam fort.1
assign gammasum4104.gam fort.1
assign life4104.dat fort.7
assign lifemeta4104.dat fort.8
lifetimes > life4104.log
