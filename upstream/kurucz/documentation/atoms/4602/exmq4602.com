set4602
date > exmq4602.log
delete fort.*
#
assign gam4602e.lin fort.1
assign gam4602o.lin fort.2
assign gaq4602e.lin fort.3
assign gaq4602o.lin fort.4
assign gammasum4602.gam fort.8
#
assign gam4602e.lines fort.11
assign gam4602e.meta fort.12
assign gam4602e.pos fort.13
assign gfm4602e.pos fort.15
assign gfm4602e.metapos fort.14
#
assign gam4602o.lines fort.21
assign gam4602o.meta fort.22
assign gam4602o.pos fort.23
assign gfm4602o.pos fort.25
assign gfm4602o.metapos fort.24
#
assign gaq4602e.lines fort.31
assign gaq4602e.meta fort.32
assign gaq4602e.pos fort.33
assign gfq4602e.pos fort.35
assign gfq4602e.metapos fort.34
#
assign gaq4602o.lines fort.41
assign gaq4602o.meta fort.42
assign gaq4602o.pos fort.43
assign gfq4602o.pos fort.45
assign gfq4602o.metapos fort.44
#
expandforbidden >> exmq4602.log
delete fort.*
date >> exmq4602.log
