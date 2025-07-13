$set def 2601
$assign w2601.dat for005
$assign sys$output for006
$assign rr2601.dat for007
$run cray:sigmaold
