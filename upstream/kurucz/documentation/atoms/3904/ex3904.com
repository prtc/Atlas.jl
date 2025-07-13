set3904
delete fort*
date > ex3904.log
#wavelength-sorted linelist with energy level indices
assign gf3904.lin fort.1
#energy levels with e1 a-sums.  predicted energies are labelled with minus
assign gf3904.gam fort.8
#or energy levels with e1+m+q a-sums
assign gammasum3904.gam fort.8
#
#wavelength-sorted line list for lines with good wavelengths
#      no predicted energies   160 columns
assign gf3904.pos fort.11
#
#wavelength-sorted line list with all the lines
#      80 columns, no broadening, no lande, no hyperfine, no isotopes
assign gf3904.80col fort.12
#
#wavelength-sorted line list with all the lines (160 col)
assign gf3904.lines fort.13
#
#wavelength-sorted lines with upper levels below the ionization limit
assign gf3904.low fort.14
#
#wavelength-sorted lines with all the lines including wavenumber,
#flog, femisslog, alog, and galog but no damping or splitting data.
assign gf3904.agafgf fort.15
#
#wavelength-sorted lines with upper levels below the ionization limit
#branching fractions
assign gf3904.bf fort.16
#
expand >> ex3904.log
\rm fort.*
