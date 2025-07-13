set3804
date > exmq3804.log
delete fort.*
#
assign gam3804e.lin fort.1
assign gam3804o.lin fort.2
assign gaq3804e.lin fort.3
assign gaq3804o.lin fort.4
assign gammasum3804.gam fort.8
#
assign gam3804e.lines fort.11
assign gam3804e.meta fort.12
assign gam3804e.pos fort.13
assign gfm3804e.pos fort.15
assign gfm3804e.metapos fort.14
#
assign gam3804o.lines fort.21
assign gam3804o.meta fort.22
assign gam3804o.pos fort.23
assign gfm3804o.pos fort.25
assign gfm3804o.metapos fort.24
#
assign gaq3804e.lines fort.31
assign gaq3804e.meta fort.32
assign gaq3804e.pos fort.33
assign gfq3804e.pos fort.35
assign gfq3804e.metapos fort.34
#
assign gaq3804o.lines fort.41
assign gaq3804o.meta fort.42
assign gaq3804o.pos fort.43
assign gfq3804o.pos fort.45
assign gfq3804o.metapos fort.44
#
expandforbidden >> exmq3804.log
\rm fort.*
date >> exmq3804.log
