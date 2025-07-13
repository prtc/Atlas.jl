set3904
date > exmq3904.log
delete fort.*
#
assign gam3904e.lin fort.1
assign gam3904o.lin fort.2
assign gaq3904e.lin fort.3
assign gaq3904o.lin fort.4
assign gammasum3904.gam fort.8
#
assign gam3904e.lines fort.11
assign gam3904e.meta fort.12
assign gam3904e.pos fort.13
assign gfm3904e.pos fort.15
assign gfm3904e.metapos fort.14
#
assign gam3904o.lines fort.21
assign gam3904o.meta fort.22
assign gam3904o.pos fort.23
assign gfm3904o.pos fort.25
assign gfm3904o.metapos fort.24
#
assign gaq3904e.lines fort.31
assign gaq3904e.meta fort.32
assign gaq3904e.pos fort.33
assign gfq3904e.pos fort.35
assign gfq3904e.metapos fort.34
#
assign gaq3904o.lines fort.41
assign gaq3904o.meta fort.42
assign gaq3904o.pos fort.43
assign gfq3904o.pos fort.45
assign gfq3904o.metapos fort.44
#
expandforbidden >> exmq3904.log
\rm fort.*
date >> exmq3904.log
