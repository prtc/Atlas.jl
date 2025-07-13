set4603
delete fort*
date > ex4603.log
#wavelength-sorted linelist with energy level indices
assign gf4603.lin fort.1
#energy levels with e1 a-sums.  predicted energies are labelled with minus
assign gf4603.gam fort.8
#or energy levels with e1+m+q a-sums
assign gammasum4603.gam fort.8
#
#wavelength-sorted line list for lines with good wavelengths
#      no predicted energies   160 columns
assign gf4603.pos fort.11
#
#wavelength-sorted line list with all the lines
#      80 columns, no broadening, no lande, no hyperfine, no isotopes
assign gf4603.80col fort.12
#
#wavelength-sorted line list with all the lines (160 col)
assign gf4603.lines fort.13
#
#wavelength-sorted lines with upper levels below the ionization limit
assign gf4603.low fort.14
#
#wavelength-sorted lines with all the lines including wavenumber,
#flog, femisslog, alog, and galog but no damping or splitting data.
assign gf4603.agafgf fort.15
#
#wavelength-sorted lines with upper levels below the ionization limit
#branching fractions
assign gf4603.bf fort.16
#
expand >> ex4603.log
\rm fort.*
