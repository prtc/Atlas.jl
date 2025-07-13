set4104
date > exmq4104.log
delete fort.*
#
assign gam4104e.lin fort.1
assign gam4104o.lin fort.2
assign gaq4104e.lin fort.3
assign gaq4104o.lin fort.4
assign gammasum4104.gam fort.8
#
assign gam4104e.lines fort.11
assign gam4104e.meta fort.12
assign gam4104e.pos fort.13
assign gfm4104e.pos fort.15
assign gfm4104e.metapos fort.14
#
assign gam4104o.lines fort.21
assign gam4104o.meta fort.22
assign gam4104o.pos fort.23
assign gfm4104o.pos fort.25
assign gfm4104o.metapos fort.24
#
assign gaq4104e.lines fort.31
assign gaq4104e.meta fort.32
assign gaq4104e.pos fort.33
assign gfq4104e.pos fort.35
assign gfq4104e.metapos fort.34
#
assign gaq4104o.lines fort.41
assign gaq4104o.meta fort.42
assign gaq4104o.pos fort.43
assign gfq4104o.pos fort.45
assign gfq4104o.metapos fort.44
#
expandforbidden >> exmq4104.log
\rm fort.*
date >> exmq4104.log
