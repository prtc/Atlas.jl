$SET DEF CRAY
$!wavelength-sorted linelist with energy level indices
$ASSIGN POOLQ:GF1503Z.LIN FOR001
$!energy levels with E1 A-sums.  predicted energies are labelled with minus
$ASSIGN 1503:GF1503Z.GAM FOR008
$!or energy levels with E1+M+Q A-sums
$ASSIGN 1503:Gammasum1503Z.GAM FOR008
$!
$!wavelength-sorted line list for lines with good wavelengths
$!      no predicted energies   160 columns
$ASSIGN 1503:GF1503Z.POS FOR011
$!
$!wavelength-sorted line list with all the lines
$!      80 columns, no broadening, no lande, no hyperfine, no isotopes
$ASSIGN K1B:GF1503Z.80COL FOR012
$!
$!wavelength-sorted line list with all the lines (160 col)
$ASSIGN K1B:GF1503Z.LINES FOR013
$!
$!wavelength-sorted lines with upper levels below the ionization limit
$ASSIGN K1B:GF1503Z.LOW FOR014
$!
$!wavelength-sorted lines with all the lines including wavenumber,
$!flog, femisslog, alog, and galog but no damping or splitting data.
$ASSIGN K1B:GF1503Z.AgAfgf FOR015
$!
$!wavelength-sorted lines with upper levels below the ionization limit
$!branching fractions
$ASSIGN K1B:GF1503Z.BF FOR016
$!
$RUN CRAY:EXPAND3007
