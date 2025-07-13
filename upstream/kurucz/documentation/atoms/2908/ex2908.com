$SET DEF 2908
$!FOR/LIS EXPAND2908
$!TYPE EXPAND2908
$!LINK EXPAND2908
$!wavelength-sorted linelist with energy level indices
$ASSIGN POOLQ:GF2908.LIN FOR001
$!energy levels with E1 A-sums.  predicted energies are labelled with minus
$ASSIGN 2908:GF2908.GAM FOR008
$!or energy levels with E1+M+Q A-sums
$ASSIGN 2908:Gammasum2908.GAM FOR008
$!
$!wavelength-sorted line list for lines with good wavelengths 
$!      no predicted energies   160 columns
$ASSIGN 2908:GF2908.POS FOR011
$!
$!wavelength-sorted line list with all the lines 
$!      80 columns, no broadening, no lande, no hyperfine, no isotopes
$ASSIGN K1B:GF2908.80COL FOR012
$!
$!wavelength-sorted line list with all the lines (160 col)
$ASSIGN K1B:GF2908.LINES FOR013
$!
$!wavelength-sorted lines with upper levels below the ionization limit
$ASSIGN K1B:GF2908.LOW FOR014
$!
$!wavelength-sorted lines with all the lines including wavenumber, 
$!flog, femisslog, alog, and galog but no damping or splitting data.
$ASSIGN K1B:GF2908.AgAfgf FOR015
$!
$!wavelength-sorted lines with upper levels below the ionization limit
$!branching fractions
$ASSIGN K1B:GF2908.BF FOR016
$!
$RUN CRAY:EXPAND3007
