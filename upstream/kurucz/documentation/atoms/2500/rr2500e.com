$set DEF 2500
$assign w2500E.dat for005
$assign sys$output for006
$assign rr2500E.dat for007
$run cray:sigmaQ
