set4103
date > exmq4103.log
delete fort.*
#
assign gam4103e.lin fort.1
assign gam4103o.lin fort.2
assign gaq4103e.lin fort.3
assign gaq4103o.lin fort.4
assign gammasum4103.gam fort.8
#
assign gam4103e.lines fort.11
assign gam4103e.meta fort.12
assign gam4103e.pos fort.13
assign gfm4103e.pos fort.15
assign gfm4103e.metapos fort.14
#
assign gam4103o.lines fort.21
assign gam4103o.meta fort.22
assign gam4103o.pos fort.23
assign gfm4103o.pos fort.25
assign gfm4103o.metapos fort.24
#
assign gaq4103e.lines fort.31
assign gaq4103e.meta fort.32
assign gaq4103e.pos fort.33
assign gfq4103e.pos fort.35
assign gfq4103e.metapos fort.34
#
assign gaq4103o.lines fort.41
assign gaq4103o.meta fort.42
assign gaq4103o.pos fort.43
assign gfq4103o.pos fort.45
assign gfq4103o.metapos fort.44
#
expandforbidden >> exmq4103.log
\rm fort.*
date >> exmq4103.log
