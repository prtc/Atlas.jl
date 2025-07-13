$set def 1900
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf190007.dat for007
$assign poolg:hf190001.dat for001
$assign poolg:hf190002.dat for002
$assign poolg:hf190004.dat for004
$assign hf1900z.pun for011
$assign hf1900z.rrr for012
$assign hf1900z.dat for013
$assign hf1900ze.dat for014
$assign poolg:hf190031.dat for031
$assign poolg:hf190032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   19    1k i   3p6 4s           3p6  4s
   19    1k i   3p6 5s           3p6  5s
   19    1k i   3p6 6s           3p6  6s
   19    1k i   3p6 7s           3p6  7s
   19    1k i   3p6 8s           3p6  8s
   19    1k i   3p6 9s           3p6  9s
   19    1k i   3p6 10s          3p6 10s
   19    1k i   3p6 11s          3p6 11s
   19    1k i   3p6 12s          3p6 12s
   19    1k i   3p6 13s          3p6 13s
   19    1k i   3p6 14s          3p6 14s
   19    1k i   3p6 3d           3p6  3d
   19    1k i   3p6 4d           3p6  4d
   19    1k i   3p6 5d           3p6  5d
   19    1k i   3p6 6d           3p6  6d
   19    1k i   3p6 7d           3p6  7d
   19    1k i   3p6 8d           3p6  8d
   19    1k i   3p6 9d           3p6  9d
   19    1k i   3p6 10d          3p6 10d
   19    1k i   3p6 11d          3p6 11d
   19    1k i   3p6 12d          3p6 12d
   19    1k i   3p6 13d          3p6 13d
   19    1k i   3p6 14d          3p6 14d
   19    1k i   3p6 15d          3p6 15d
   19    1k i   3p6 16d          3p6 16d
   19    1k i   3p6 5g           3p6  5g
   19    1k i   3p6 6g           3p6  6g
   19    1k i   3p6 7g           3p6  7g
   19    1k i   3p6 8g           3p6  8g
   19    1k i   3p6 9g           3p6  9g
   19    1k i   3p6 7i           3p6  7i
   19    1k i   3p6 8i           3p6  8i
   19    1k i   3p6 9i           3p6  9i
   19    1k i   3p5 3d4p         3p5  3d   4p
   19    1k i   3p5 4s4p         3p5  4s   4p
   19    1k i   3p6 4p           3p6  4p
   19    1k i   3p6 5p           3p6  5p
   19    1k i   3p6 6p           3p6  6p
   19    1k i   3p6 7p           3p6  7p
   19    1k i   3p6 8p           3p6  8p
   19    1k i   3p6 9p           3p6  9p
   19    1k i   3p6 10p          3p6 10p
   19    1k i   3p6 11p          3p6 11p
   19    1k i   3p6 12p          3p6 12p
   19    1k i   3p6 13p          3p6 13p
   19    1k i   3p6 14p          3p6 14p
   19    1k i   3p5 4p2          3p5  4p2
   19    1k i   3p6 4f           3p6  4f
   19    1k i   3p6 5f           3p6  5f
   19    1k i   3p6 6f           3p6  6f
   19    1k i   3p6 7f           3p6  7f
   19    1k i   3p6 8f           3p6  8f
   19    1k i   3p6 9f           3p6  9f
   19    1k i   3p6 10f          3p6 10f
   19    1k i   3p6 11f          3p6 11f
   19    1k i   3p6 12f          3p6 12f
   19    1k i   3p6 13f          3p6 13f
   19    1k i   3p6 14f          3p6 14f
   19    1k i   3p6 6h           3p6  6h
   19    1k i   3p6 7h           3p6  7h
   19    1k i   3p6 8h           3p6  8h
   19    1k i   3p6 9h           3p6  9h
   19    1k i   3p6 10h          3p6 10h
   19    1k i   3p6 8k           3p6  8k
   19    1k i   3p6 9k           3p6  9k
   19    1k i   3p5 3d2          3p5  3d2
   19    1k i   3p5 3d4s         3p5  3d   4s
   19    1k i   3p5 4s2          3p5  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF190001.DAT;*
$DELETE POOLG:HF190002.DAT;*
$DELETE POOLG:HF190004.DAT;*
$DELETE POOLG:HF190031.DAT;*
$DELETE POOLG:HF190032.DAT;*
