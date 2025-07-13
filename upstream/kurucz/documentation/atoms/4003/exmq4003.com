set4003
date > exmq4003.log
delete fort.*
#
assign gam4003e.lin fort.1
assign gam4003o.lin fort.2
assign gaq4003e.lin fort.3
assign gaq4003o.lin fort.4
assign gammasum4003.gam fort.8
#
assign gam4003e.lines fort.11
assign gam4003e.meta fort.12
assign gam4003e.pos fort.13
assign gfm4003e.pos fort.15
assign gfm4003e.metapos fort.14
#
assign gam4003o.lines fort.21
assign gam4003o.meta fort.22
assign gam4003o.pos fort.23
assign gfm4003o.pos fort.25
assign gfm4003o.metapos fort.24
#
assign gaq4003e.lines fort.31
assign gaq4003e.meta fort.32
assign gaq4003e.pos fort.33
assign gfq4003e.pos fort.35
assign gfq4003e.metapos fort.34
#
assign gaq4003o.lines fort.41
assign gaq4003o.meta fort.42
assign gaq4003o.pos fort.43
assign gfq4003o.pos fort.45
assign gfq4003o.metapos fort.44
#
expandforbidden >> exmq4003.log
\rm fort.*
date >> exmq4003.log
