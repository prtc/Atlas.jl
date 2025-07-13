set2701
date > exmq2701.log
\rm fort.*
#
assign gam2701e.lin fort.1
assign gam2701o.lin fort.2
assign gaq2701e.lin fort.3
assign gaq2701o.lin fort.4
assign gammasum2701.gam fort.8
#
assign gam2701e.lines fort.11
assign gam2701e.meta fort.12
assign gam2701e.pos fort.13
assign gfm2701e.pos fort.15
assign gfm2701e.metapos fort.14
#
assign gam2701o.lines fort.21
assign gam2701o.meta fort.22
assign gam2701o.pos fort.23
assign gfm2701o.pos fort.25
assign gfm2701o.metapos fort.24
#
assign gaq2701e.lines fort.31
assign gaq2701e.meta fort.32
assign gaq2701e.pos fort.33
assign gfq2701e.pos fort.35
assign gfq2701e.metapos fort.34
#
assign gaq2701o.lines fort.41
assign gaq2701o.meta fort.42
assign gaq2701o.pos fort.43
assign gfq2701o.pos fort.45
assign gfq2701o.metapos fort.44
#
expandforbidden >> exmq2701.log
\rm fort.*
date >> exmq2701.log
