set3802
delete fort.*
#assign gf3802.gam fort.1
assign gammasum3802.gam fort.1
assign life3802.dat fort.7
assign lifemeta3802.dat fort.8
lifetimes > life3802.log
