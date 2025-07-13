$set2501
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf250107.dat for007
$assign poolg:hf250101.dat for001
$assign poolg:hf250102.dat for002
$assign poolg:hf250104.dat for004
$assign hf2501X.pun for011
$assign hf2501X.rrr for012
$assign hf2501X.dat for013
$assign hf2501Xe.dat for014
$assign poolg:hf250131.dat for031
$assign poolg:hf250132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  5.0 0.50 0.0  0.70
   25    2mn ii  d6              3d6
   25    2mn ii  d5 4d           3d5  4d
   25    2mn ii  d5 5d           3d5  5d
   25    2mn ii  d5 6d           3d5  6d
   25    2mn ii  d5 7d           3d5  7d
   25    2mn ii  d5 8d           3d5  8d
   25    2mn ii  d5 9d           3d5  9d
   25    2mn ii  d5 10d          3d5 10d
   25    2mn ii  d5 11d          3d5 11d
   25    2mn ii  d5 12d          3d5 12d
   25    2mn ii  d4 4s4d         3d4  4s   4d
   25    2mn ii  d4 4s5d         3d4  4s   5d
   25    2mn ii  d4 4s6d         3d4  4s   6d
   25    2mn ii  d4 4s7d         3d4  4s   7d
   25    2mn ii  d4 4s8d         3d4  4s   8d
   25    2mn ii  d4 4s9d         3d4  4s   9d
   25    2mn ii  d5 4s           3d5  4s
   25    2mn ii  d5 5s           3d5  5s
   25    2mn ii  d5 6s           3d5  6s
   25    2mn ii  d5 7s           3d5  7s
   25    2mn ii  d5 8s           3d5  8s
   25    2mn ii  d5 9s           3d5  9s
   25    2mn ii  d5 10s          3d5 10s
   25    2mn ii  d5 11s          3d5 11s
   25    2mn ii  d5 12s          3d5 12s
   25    2mn ii  d4 4s2          3d4  4s2
   25    2mn ii  d4 4s5s         3d4  4s   5s
   25    2mn ii  d4 4s6s         3d4  4s   6s
   25    2mn ii  d4 4s7s         3d4  4s   7s
   25    2mn ii  d4 4s8s         3d4  4s   8s
   25    2mn ii  d4 4s9s         3d4  4s   9s
   25    2mn ii  d5 5g           3d5  5g
   25    2mn ii  d5 6g           3d5  6g
   25    2mn ii  d5 7g           3d5  7g
   25    2mn ii  d5 8g           3d5  8g
   25    2mn ii  d5 9g           3d5  9g
   25    2mn ii  d4 4s5g         3d4  4s   5g
   25    2mn ii  d4 4s6g         3d4  4s   6g
   25    2mn ii  d4 4s7g         3d4  4s   7g
   25    2mn ii  d4 4s8g         3d4  4s   8g
   25    2mn ii  d4 4s9g         3d4  4s   9g
   25    2mn ii  d5 7i           3d5  7i
   25    2mn ii  d5 8i           3d5  8i
   25    2mn ii  d5 9i           3d5  9i
   25    2mn ii  d4 4s7i         3d4  4s   7i
   25    2mn ii  d4 4s8i         3d4  4s   8i
   25    2mn ii  d4 4s9i         3d4  4s   9i
   25    2mn ii  d5 9l           3d5 10l                                              actually 9l
   25    2mn ii  d4 4s9l         3d4  4s  10l                                         ACTUALLY 9l
   25    2mn ii  d4 4p2          3d4  4p2
   25    2mn ii  d5 4p           3d5  4p
   25    2mn ii  d5 5p           3d5  5p
   25    2mn ii  d5 6p           3d5  6p
   25    2mn ii  d5 7p           3d5  7p
   25    2mn ii  d5 8p           3d5  8p
   25    2mn ii  d5 9p           3d5  9p
   25    2mn ii  d5 10p          3d5 10p
   25    2mn ii  d4 4s4p         3d4  4s   4p
   25    2mn ii  d4 4s5p         3d4  4s   5p
   25    2mn ii  d4 4s6p         3d4  4s   6p
   25    2mn ii  d4 4s7p         3d4  4s   7p
   25    2mn ii  d4 4s8p         3d4  4s   8p
   25    2mn ii  d4 4s9p         3d4  4s   9p
   25    2mn ii  d4 4s10p        3d4  4s  10p
   25    2mn ii  d3s2 4p         3d3  4s2  4p
   25    2mn ii  d5 4f           3d5  4f
   25    2mn ii  d5 5f           3d5  5f
   25    2mn ii  d5 6f           3d5  6f
   25    2mn ii  d5 7f           3d5  7f
   25    2mn ii  d5 8f           3d5  8f
   25    2mn ii  d5 9f           3d5  9f
   25    2mn ii  d5 10f          3d5 10f
   25    2mn ii  d4 4s4f         3d4  4s   4f
   25    2mn ii  d4 4s5f         3d4  4s   5f
   25    2mn ii  d4 4s6f         3d4  4s   6f
   25    2mn ii  d4 4s7f         3d4  4s   7f
   25    2mn ii  d4 4s8f         3d4  4s   8f
   25    2mn ii  d4 4s9f         3d4  4s   9f
   25    2mn ii  d4 4s10f        3d4  4s  10f
   25    2mn ii  d5 6h           3d5  6h
   25    2mn ii  d5 7h           3d5  7h
   25    2mn ii  d5 8h           3d5  8h
   25    2mn ii  d5 9h           3d5  9h
   25    2mn ii  d4 4s6h         3d4  4s   6h
   25    2mn ii  d4 4s7h         3d4  4s   7h
   25    2mn ii  d4 4s8h         3d4  4s   8h
   25    2mn ii  d4 4s9h         3d4  4s   9h
   25    2mn ii  d5 8k           3d5  8k
   25    2mn ii  d5 9k           3d5  9k
   25    2mn ii  d4 4s8k         3d4  4s   8k
   25    2mn ii  d4 4s9k         3d4  4s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF250101.DAT;*
$DELETE POOLG:HF250102.DAT;*
$DELETE POOLG:HF250104.DAT;*
$DELETE POOLG:HF250131.DAT;*
$DELETE POOLG:HF250132.DAT;*
