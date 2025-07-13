set3803
date > exmq3803.log
delete fort.*
#
assign gam3803e.lin fort.1
assign gam3803o.lin fort.2
assign gaq3803e.lin fort.3
assign gaq3803o.lin fort.4
assign gammasum3803.gam fort.8
#
assign gam3803e.lines fort.11
assign gam3803e.meta fort.12
assign gam3803e.pos fort.13
assign gfm3803e.pos fort.15
assign gfm3803e.metapos fort.14
#
assign gam3803o.lines fort.21
assign gam3803o.meta fort.22
assign gam3803o.pos fort.23
assign gfm3803o.pos fort.25
assign gfm3803o.metapos fort.24
#
assign gaq3803e.lines fort.31
assign gaq3803e.meta fort.32
assign gaq3803e.pos fort.33
assign gfq3803e.pos fort.35
assign gfq3803e.metapos fort.34
#
assign gaq3803o.lines fort.41
assign gaq3803o.meta fort.42
assign gaq3803o.pos fort.43
assign gfq3803o.pos fort.45
assign gfq3803o.metapos fort.44
#
expandforbidden >> exmq3803.log
\rm fort.*
date >> exmq3803.log
