set4103
delete fort.*
#assign gf4103.gam fort.1
assign gammasum4103.gam fort.1
assign life4103.dat fort.7
assign lifemeta4103.dat fort.8
lifetimes > life4103.log
