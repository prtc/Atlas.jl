set2701
date > ex2701.log
\rm fort.*
#wavelength-sorted linelist with energy level indices
assign gf2701.lin fort.1
#energy levels with e1 a-sums.  predicted energies are labelled with minus
assign gf2701.gam fort.8
#or energy levels with e1+m+q a-sums
assign gammasum2701.gam fort.8
#
#wavelength-sorted line list for lines with good wavelengths
#      no predicted energies   160 columns
assign gf2701.pos fort.11
#
#wavelength-sorted line list with all the lines
#      80 columns, no broadening, no lande, no hyperfine, no isotopes
assign gf2701.80col fort.12
#
#wavelength-sorted line list with all the lines (160 col)
assign gf2701.lines fort.13
#
#wavelength-sorted lines with upper levels below the ionization limit
assign gf2701.low fort.14
#
#wavelength-sorted lines with all the lines including wavenumber,
#flog, femisslog, alog, and galog but no damping or splitting data.
assign gf2701.agafgf fort.15
#
#wavelength-sorted lines with upper levels below the ionization limit
#branching fractions
assign gf2701.bf fort.16
#
expand >> ex2701.log
\rm fort.*
