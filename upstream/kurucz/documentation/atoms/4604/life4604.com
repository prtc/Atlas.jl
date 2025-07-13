set4604
delete fort.*
#assign gf4604.gam fort.1
assign gammasum4604.gam fort.1
assign life4604.dat fort.7
assign lifemeta4604.dat fort.8
lifetimes > life4604.log
