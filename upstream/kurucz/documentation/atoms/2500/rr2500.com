$set DEF 2500
$assign w2500.dat for005
$assign sys$output for006
$assign rr2500.dat for007
$run cray:sigma
