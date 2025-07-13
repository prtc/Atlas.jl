$SET DEF ku6e:[kurucz.4203]
$!wavelength-sorted linelist with energy level indices
$ASSIGN POOLQ:GF4203.LIN FOR001
$!energy levels with E1 A-sums.  predicted energies are labelled with minus
$ASSIGN GF4203.GAM FOR008
$!or energy levels with E1+M+Q A-sums
$ASSIGN Gammasum4203.GAM FOR008
$!
$!wavelength-sorted line list for lines with good wavelengths
$!      no predicted energies   160 columns
$ASSIGN GF4203.POS FOR011
$!
$!wavelength-sorted line list with all the lines
$!      80 columns, no broadening, no lande, no hyperfine, no isotopes
$ASSIGN K1B:GF4203.80COL FOR012
$!
$!wavelength-sorted line list with all the lines (160 col)
$ASSIGN K1B:GF4203.LINES FOR013
$!
$!wavelength-sorted lines with upper levels below the ionization limit
$ASSIGN K1B:GF4203.LOW FOR014
$!
$!wavelength-sorted lines with all the lines including wavenumber,
$!flog, femisslog, alog, and galog but no damping or splitting data.
$ASSIGN K1B:GF4203.AgAfgf FOR015
$!
$!wavelength-sorted lines with upper levels below the ionization limit
$!branching fractions
$ASSIGN K1B:GF4203.BF FOR016
$!
$RUN CRAY:EXPAND
