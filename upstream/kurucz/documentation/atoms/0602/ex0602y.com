$SET DEF 0602
$!wavelength-sorted linelist with energy level indices
$ASSIGN POOLQ:GF0602Y.LIN FOR001
$!energy levels with E1 A-sums.  predicted energies are labelled with minus
$ASSIGN 0602:GF0602Y.GAM FOR008
$!or energy levels with E1+M+Q A-sums
$ASSIGN 0602:Gammasum0602Y.GAM FOR008
$!
$!wavelength-sorted line list for lines with good wavelengths 
$!      no predicted energies   160 columns
$ASSIGN 0602:GF0602Y.POS FOR011
$!
$!wavelength-sorted line list with all the lines 
$!      80 columns, no broadening, no lande, no hyperfine, no isotopes
$ASSIGN K1B:GF0602Y.80COL FOR012
$!
$!wavelength-sorted line list with all the lines (160 col)
$ASSIGN K1B:GF0602Y.LINES FOR013
$!
$!wavelength-sorted lines with upper levels below the ionization limit
$ASSIGN K1B:GF0602Y.LOW FOR014
$!
$!wavelength-sorted lines with all the lines including wavenumber, 
$!flog, femisslog, alog, and galog but no damping or splitting data.
$ASSIGN K1B:GF0602Y.AgAfgf FOR015
$!
$!wavelength-sorted lines with upper levels below the ionization limit
$!branching fractions
$ASSIGN K1B:GF0602Y.BF FOR016
$!
$!RUN 0602:EXPAND3007
$RUN CRAY:EXPAND3007
