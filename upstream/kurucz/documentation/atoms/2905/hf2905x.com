$set def 2905
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf290507.dat for007
$assign poolg:hf290501.dat for001
$assign poolg:hf290502.dat for002
$assign poolg:hf290504.dat for004
$assign hf2905X.pun for011
$assign hf2905X.rrr for012
$assign hf2905X.dat for013
$assign hf2905Xe.dat for014
$assign poolg:hf290531.dat for031
$assign poolg:hf290532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  5.0 0.50 0.0  0.70
   29    6cu vi  d6              3p6  3d6
   29    6cu vi  d5 4d           3p6  3d5  4d
   29    6cu vi  d5 5d           3p6  3d5  5d
   29    6cu vi  d5 6d           3p6  3d5  6d
   29    6cu vi  d5 7d           3p6  3d5  7d
   29    6cu vi  d5 8d           3p6  3d5  8d
   29    6cu vi  d5 9d           3p6  3d5  9d
   29    6cu vi  d5 10d          3p6  3d5 10d
   29    6cu vi  d4 4s4d         3p6  3d4  4s   4d
   29    6cu vi  d4 4s5d         3p6  3d4  4s   5d
   29    6cu vi  d4 4s6d         3p6  3d4  4s   6d
   29    6cu vi  d4 4s7d         3p6  3d4  4s   7d
   29    6cu vi  d4 4s8d         3p6  3d4  4s   8d
   29    6cu vi  d4 4s9d         3p6  3d4  4s   9d
   29    6cu vi  d4 4s10d        3p6  3d4  4s  10d
   29    6cu vi  d5 4s           3p6  3d5  4s
   29    6cu vi  d5 5s           3p6  3d5  5s
   29    6cu vi  d5 6s           3p6  3d5  6s
   29    6cu vi  d5 7s           3p6  3d5  7s
   29    6cu vi  d5 8s           3p6  3d5  8s
   29    6cu vi  d5 9s           3p6  3d5  9s
   29    6cu vi  d5 10s          3p6  3d5 10s
   29    6cu vi  d4 4s2          3p6  3d4  4s2
   29    6cu vi  d4 4s5s         3p6  3d4  4s   5s
   29    6cu vi  d4 4s6s         3p6  3d4  4s   6s
   29    6cu vi  d4 4s7s         3p6  3d4  4s   7s
   29    6cu vi  d4 4s8s         3p6  3d4  4s   8s
   29    6cu vi  d4 4s9s         3p6  3d4  4s   9s
   29    6cu vi  d4 4s10s        3p6  3d4  4s  10s
   29    6cu vi  d5 5g           3p6  3d5  5g
   29    6cu vi  d5 6g           3p6  3d5  6g
   29    6cu vi  d5 7g           3p6  3d5  7g
   29    6cu vi  d5 8g           3p6  3d5  8g
   29    6cu vi  d5 9g           3p6  3d5  9g
   29    6cu vi  d4 4s5g         3p6  3d4  4s   5g
   29    6cu vi  d4 4s6g         3p6  3d4  4s   6g
   29    6cu vi  d4 4s7g         3p6  3d4  4s   7g
   29    6cu vi  d4 4s8g         3p6  3d4  4s   8g
   29    6cu vi  d4 4s9g         3p6  3d4  4s   9g
   29    6cu vi  d5 7i           3p6  3d5  7i
   29    6cu vi  d5 8i           3p6  3d5  8i
   29    6cu vi  d5 9i           3p6  3d5  9i
   29    6cu vi  d4 4s7i         3p6  3d4  4s   7i
   29    6cu vi  d4 4s8i         3p6  3d4  4s   8i
   29    6cu vi  d4 4s9i         3p6  3d4  4s   9i
   29    6cu vi  d4 4p2          3p6  3d4  4p2
   29    6cu vi  d5 4p           3p6  3d5  4p
   29    6cu vi  d5 5p           3p6  3d5  5p
   29    6cu vi  d5 6p           3p6  3d5  6p
   29    6cu vi  d5 7p           3p6  3d5  7p
   29    6cu vi  d5 8p           3p6  3d5  8p
   29    6cu vi  d5 9p           3p6  3d5  9p
   29    6cu vi  d5 10p          3p6  3d5 10p
   29    6cu vi  d4 4s4p         3p6  3d4  4s   4p
   29    6cu vi  d4 4s5p         3p6  3d4  4s   5p
   29    6cu vi  d4 4s6p         3p6  3d4  4s   6p
   29    6cu vi  d4 4s7p         3p6  3d4  4s   7p
   29    6cu vi  d4 4s8p         3p6  3d4  4s   8p
   29    6cu vi  d4 4s9p         3p6  3d4  4s   9p
   29    6cu vi  d4 4s10p        3p6  3d4  4s  10p
   29    6cu vi  d3 4s2 4p       3p6  3d3  4s2  4p
   29    6cu vi  d5 4f           3p6  3d5  4f
   29    6cu vi  d5 5f           3p6  3d5  5f
   29    6cu vi  d5 6f           3p6  3d5  6f
   29    6cu vi  d5 7f           3p6  3d5  7f
   29    6cu vi  d5 8f           3p6  3d5  8f
   29    6cu vi  d5 9f           3p6  3d5  9f
   29    6cu vi  d5 10f          3p6  3d5 10f
   29    6cu vi  d4 4s4f         3p6  3d4  4s   4f
   29    6cu vi  d4 4s5f         3p6  3d4  4s   5f
   29    6cu vi  d4 4s6f         3p6  3d4  4s   6f
   29    6cu vi  d4 4s7f         3p6  3d4  4s   7f
   29    6cu vi  d4 4s8f         3p6  3d4  4s   8f
   29    6cu vi  d4 4s9f         3p6  3d4  4s   9f
   29    6cu vi  d5 6h           3p6  3d5  6h
   29    6cu vi  d5 7h           3p6  3d5  7h
   29    6cu vi  d5 8h           3p6  3d5  8h
   29    6cu vi  d5 9h           3p6  3d5  9h
   29    6cu vi  d4 4s6h         3p6  3d4  4s   6h
   29    6cu vi  d4 4s7h         3p6  3d4  4s   7h
   29    6cu vi  d4 4s8h         3p6  3d4  4s   8h
   29    6cu vi  d4 4s9h         3p6  3d4  4s   9h
   29    6cu vi  d5 8k           3p6  3d5  8k
   29    6cu vi  d5 9k           3p6  3d5  9k
   29    6cu vi  d4 4s8k         3p6  3d4  4s   8k
   29    6cu vi  d4 4s9k         3p6  3d4  4s   9k
   29    6cu vi  p5d7            3p5  3d7  
   -1
$run cray:rcn2c
$DELETE POOLG:HF290501.DAT;*
$DELETE POOLG:HF290502.DAT;*
$DELETE POOLG:HF290504.DAT;*
$DELETE POOLG:HF290531.DAT;*
$DELETE POOLG:HF290532.DAT;*
