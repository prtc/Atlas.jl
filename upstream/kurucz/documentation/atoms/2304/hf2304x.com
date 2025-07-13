$set def 2304
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf230407.dat for007
$assign poolg:hf230401.dat for001
$assign poolg:hf230402.dat for002
$assign poolg:hf230404.dat for004
$assign hf2304x.pun for011
$assign hf2304x.rrr for012
$assign hf2304x.dat for013
$assign hf2304xe.dat for014
$assign poolg:hf230431.dat for031
$assign poolg:hf230432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   23    5v v   3p6 3d           3p6  3d
   23    5v v   3p6 4d           3p6  4d
   23    5v v   3p6 5d           3p6  5d
   23    5v v   3p6 6d           3p6  6d
   23    5v v   3p6 7d           3p6  7d
   23    5v v   3p6 8d           3p6  8d
   23    5v v   3p6 9d           3p6  9d
   23    5v v   3p6 10d          3p6 10d
   23    5v v   3p6 11d          3p6 11d
   23    5v v   3p6 12d          3p6 12d
   23    5v v   3p6 13d          3p6 13d
   23    5v v   3p6 14d          3p6 14d
   23    5v v   3p6 4s           3p6  4s
   23    5v v   3p6 5s           3p6  5s
   23    5v v   3p6 6s           3p6  6s
   23    5v v   3p6 7s           3p6  7s
   23    5v v   3p6 8s           3p6  8s
   23    5v v   3p6 9s           3p6  9s
   23    5v v   3p6 10s          3p6 10s
   23    5v v   3p6 11s          3p6 11s
   23    5v v   3p6 12s          3p6 12s
   23    5v v   3p6 13s          3p6 13s
   23    5v v   3p6 14s          3p6 14s
   23    5v v   3p6 5g           3p6  5g
   23    5v v   3p6 6g           3p6  6g
   23    5v v   3p6 7g           3p6  7g
   23    5v v   3p6 8g           3p6  8g
   23    5v v   3p6 9g           3p6  9g
   23    5v v   3p6 7i           3p6  7i
   23    5v v   3p6 8i           3p6  8i
   23    5v v   3p6 9i           3p6  9i
   23    5v v   3p5 3d4p         3p5  3d   4p
   23    5v v   3p5 4s4p         3p5  4s   4p
   23    5v v   3p6 4p           3p6  4p
   23    5v v   3p6 5p           3p6  5p
   23    5v v   3p6 6p           3p6  6p
   23    5v v   3p6 7p           3p6  7p
   23    5v v   3p6 8p           3p6  8p
   23    5v v   3p6 9p           3p6  9p
   23    5v v   3p6 10p          3p6 10p
   23    5v v   3p6 11p          3p6 11p
   23    5v v   3p6 12p          3p6 12p
   23    5v v   3p6 13p          3p6 13p
   23    5v v   3p6 14p          3p6 14p
   23    5v v   3p5 4p2          3p5  4p2
   23    5v v   3p6 4f           3p6  4f
   23    5v v   3p6 5f           3p6  5f
   23    5v v   3p6 6f           3p6  6f
   23    5v v   3p6 7f           3p6  7f
   23    5v v   3p6 8f           3p6  8f
   23    5v v   3p6 9f           3p6  9f
   23    5v v   3p6 10f          3p6 10f
   23    5v v   3p6 11f          3p6 11f
   23    5v v   3p6 12f          3p6 12f
   23    5v v   3p6 13f          3p6 13f
   23    5v v   3p6 14f          3p6 14f
   23    5v v   3p6 6h           3p6  6h
   23    5v v   3p6 7h           3p6  7h
   23    5v v   3p6 8h           3p6  8h
   23    5v v   3p6 9h           3p6  9h
   23    5v v   3p6 8k           3p6  8k
   23    5v v   3p6 9k           3p6  9k
   23    5v v   3p5 3d2          3p5  3d2
   23    5v v   3p5 3d4s         3p5  3d   4s
   23    5v v   3p5 4s2          3p5  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF230401.DAT;*
$DELETE POOLG:HF230402.DAT;*
$DELETE POOLG:HF230404.DAT;*
$DELETE POOLG:HF230431.DAT;*
$DELETE POOLG:HF230432.DAT;*
