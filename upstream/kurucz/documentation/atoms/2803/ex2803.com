$SET DEF 2803
$!FOR/LIS EXPAND3007
$!TYPE EXPAND3007
$!LINK EXPAND3007
$!wavelength-sorted linelist with energy level indices
$ASSIGN POOLQ:GF2803.LIN FOR001
$!energy levels with E1 A-sums.  predicted energies are labelled with minus
$ASSIGN 2803:GF2803.GAM FOR008
$!or energy levels with E1+M+Q A-sums
$ASSIGN 2803:Gammasum2803.GAM FOR008
$!
$!wavelength-sorted line list for lines with good wavelengths 
$!      no predicted energies   160 columns
$ASSIGN 2803:GF2803.POS FOR011
$!
$!wavelength-sorted line list with all the lines 
$!      80 columns, no broadening, no lande, no hyperfine, no isotopes
$ASSIGN K1B:GF2803.80COL FOR012
$!
$!wavelength-sorted line list with all the lines (160 col)
$ASSIGN K1B:GF2803.LINES FOR013
$!
$!wavelength-sorted lines with upper levels below the ionization limit
$ASSIGN K1B:GF2803.LOW FOR014
$!
$!wavelength-sorted lines with all the lines including wavenumber, 
$!flog, femisslog, alog, and galog but no damping or splitting data.
$ASSIGN K1B:GF2803.AgAfgf FOR015
$!
$!wavelength-sorted lines with upper levels below the ionization limit
$!branching fractions
$ASSIGN K1B:GF2803.BF FOR016
$!
$!RUN 2803:EXPAND3007
$RUN CRAY:EXPAND3007
