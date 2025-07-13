set4603
date > exmq4603.log
delete fort.*
#
assign gam4603e.lin fort.1
assign gam4603o.lin fort.2
assign gaq4603e.lin fort.3
assign gaq4603o.lin fort.4
assign gammasum4603.gam fort.8
#
assign gam4603e.lines fort.11
assign gam4603e.meta fort.12
assign gam4603e.pos fort.13
assign gfm4603e.pos fort.15
assign gfm4603e.metapos fort.14
#
assign gam4603o.lines fort.21
assign gam4603o.meta fort.22
assign gam4603o.pos fort.23
assign gfm4603o.pos fort.25
assign gfm4603o.metapos fort.24
#
assign gaq4603e.lines fort.31
assign gaq4603e.meta fort.32
assign gaq4603e.pos fort.33
assign gfq4603e.pos fort.35
assign gfq4603e.metapos fort.34
#
assign gaq4603o.lines fort.41
assign gaq4603o.meta fort.42
assign gaq4603o.pos fort.43
assign gfq4603o.pos fort.45
assign gfq4603o.metapos fort.44
#
expandforbidden >> exmq4603.log
\rm fort.*
date >> exmq4603.log
