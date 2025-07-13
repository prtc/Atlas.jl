set4604
date > exmq4604.log
delete fort.*
#
assign gam4604e.lin fort.1
assign gam4604o.lin fort.2
assign gaq4604e.lin fort.3
assign gaq4604o.lin fort.4
assign gammasum4604.gam fort.8
#
assign gam4604e.lines fort.11
assign gam4604e.meta fort.12
assign gam4604e.pos fort.13
assign gfm4604e.pos fort.15
assign gfm4604e.metapos fort.14
#
assign gam4604o.lines fort.21
assign gam4604o.meta fort.22
assign gam4604o.pos fort.23
assign gfm4604o.pos fort.25
assign gfm4604o.metapos fort.24
#
assign gaq4604e.lines fort.31
assign gaq4604e.meta fort.32
assign gaq4604e.pos fort.33
assign gfq4604e.pos fort.35
assign gfq4604e.metapos fort.34
#
assign gaq4604o.lines fort.41
assign gaq4604o.meta fort.42
assign gaq4604o.pos fort.43
assign gfq4604o.pos fort.45
assign gfq4604o.metapos fort.44
#
expandforbidden >> exmq4604.log
\rm fort.*
date >> exmq4604.log
