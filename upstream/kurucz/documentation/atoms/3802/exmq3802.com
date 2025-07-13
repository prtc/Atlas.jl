set3802
date > exmq3802.log
delete fort.*
#
assign gam3802e.lin fort.1
assign gam3802o.lin fort.2
assign gaq3802e.lin fort.3
assign gaq3802o.lin fort.4
assign gammasum3802.gam fort.8
#
assign gam3802e.lines fort.11
assign gam3802e.meta fort.12
assign gam3802e.pos fort.13
assign gfm3802e.pos fort.15
assign gfm3802e.metapos fort.14
#
assign gam3802o.lines fort.21
assign gam3802o.meta fort.22
assign gam3802o.pos fort.23
assign gfm3802o.pos fort.25
assign gfm3802o.metapos fort.24
#
assign gaq3802e.lines fort.31
assign gaq3802e.meta fort.32
assign gaq3802e.pos fort.33
assign gfq3802e.pos fort.35
assign gfq3802e.metapos fort.34
#
assign gaq3802o.lines fort.41
assign gaq3802o.meta fort.42
assign gaq3802o.pos fort.43
assign gfq3802o.pos fort.45
assign gfq3802o.metapos fort.44
#
expandforbidden >> exmq3802.log
\rm fort.*
date >> exmq3802.log
