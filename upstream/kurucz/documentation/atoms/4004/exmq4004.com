set4004
date > exmq4004.log
delete fort.*
#
assign gam4004e.lin fort.1
assign gam4004o.lin fort.2
assign gaq4004e.lin fort.3
assign gaq4004o.lin fort.4
assign gammasum4004.gam fort.8
#
assign gam4004e.lines fort.11
assign gam4004e.meta fort.12
assign gam4004e.pos fort.13
assign gfm4004e.pos fort.15
assign gfm4004e.metapos fort.14
#
assign gam4004o.lines fort.21
assign gam4004o.meta fort.22
assign gam4004o.pos fort.23
assign gfm4004o.pos fort.25
assign gfm4004o.metapos fort.24
#
assign gaq4004e.lines fort.31
assign gaq4004e.meta fort.32
assign gaq4004e.pos fort.33
assign gfq4004e.pos fort.35
assign gfq4004e.metapos fort.34
#
assign gaq4004o.lines fort.41
assign gaq4004o.meta fort.42
assign gaq4004o.pos fort.43
assign gfq4004o.pos fort.45
assign gfq4004o.metapos fort.44
#
expandforbidden >> exmq4004.log
\rm fort.*
date >> exmq4004.log
