set4604
delete fort*
date > ex4604.log
#wavelength-sorted linelist with energy level indices
assign gf4604.lin fort.1
#energy levels with e1 a-sums.  predicted energies are labelled with minus
assign gf4604.gam fort.8
#or energy levels with e1+m+q a-sums
assign gammasum4604.gam fort.8
#
#wavelength-sorted line list for lines with good wavelengths
#      no predicted energies   160 columns
assign gf4604.pos fort.11
#
#wavelength-sorted line list with all the lines
#      80 columns, no broadening, no lande, no hyperfine, no isotopes
assign gf4604.80col fort.12
#
#wavelength-sorted line list with all the lines (160 col)
assign gf4604.lines fort.13
#
#wavelength-sorted lines with upper levels below the ionization limit
assign gf4604.low fort.14
#
#wavelength-sorted lines with all the lines including wavenumber,
#flog, femisslog, alog, and galog but no damping or splitting data.
assign gf4604.agafgf fort.15
#
#wavelength-sorted lines with upper levels below the ionization limit
#branching fractions
assign gf4604.bf fort.16
#
expand >> ex4604.log
\rm fort.*
