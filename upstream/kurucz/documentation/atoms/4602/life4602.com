set4602
delete fort.*
#assign gf4602.gam fort.1
assign gammasum4602.gam fort.1
assign life4602.dat fort.7
assign lifemeta4602.dat fort.8
lifetimes > life4602.log
