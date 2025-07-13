$set DEF 2100
$assign w2100.dat for005
$assign sys$output for006
$assign rr2100.dat for007
$!run cray:sigma
$run cray:sigmaold
