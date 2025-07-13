$set def 2701
$assign sys$input for010
$assign sys$output for009
$assign POOL:hf270107.dat for007
$assign POOL:hf270101.dat for001
$assign POOL:hf270102.dat for002
$assign POOL:hf270104.dat for004
$assign hf2701x.pun for011
$assign hf2701x.rrr for012
$assign hf2701x.dat for013
$assign hf2701xe.dat for014
$assign POOL:hf270131.dat for031
$assign POOL:hf270132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   27    2co ii  d8              3d8      
   27    2co ii  d7 4d           3d7  4d
   27    2co ii  d7 5d           3d7  5d
   27    2co ii  d7 6d           3d7  6d
   27    2co ii  d7 7d           3d7  7d
   27    2co ii  d7 8d           3d7  8d
   27    2co ii  d7 9d           3d7  9d
   27    2co ii  d7 10d          3d7 10d
   27    2co ii  d6 4s4d         3d6  4s   4d
   27    2co ii  d6 4s5d         3d6  4s   5d
   27    2co ii  d6 4s6d         3d6  4s   6d
   27    2co ii  d6 4s7d         3d6  4s   7d
   27    2co ii  d6 4s8d         3d6  4s   8d
   27    2co ii  d6 4s9d         3d6  4s   9d
   27    2co ii  d6 4s10d        3d6  4s  10d
   27    2co ii  d5s2 4d         3d5  4s2  4d
   27    2co ii  d5s2 5d         3d5  4s2  5d
   27    2co ii  d5s2 6d         3d5  4s2  6d
   27    2co ii  d5s2 7d         3d5  4s2  7d
   27    2co ii  d5s2 8d         3d5  4s2  8d
   27    2co ii  d5s2 9d         3d5  4s2  9d
   27    2co ii  d5s2 10d        3d5  4s2 10d
   27    2co ii  d7 4s           3d7  4s
   27    2co ii  d7 5s           3d7  5s
   27    2co ii  d7 6s           3d7  6s
   27    2co ii  d7 7s           3d7  7s
   27    2co ii  d7 8s           3d7  8s
   27    2co ii  d7 9s           3d7  9s
   27    2co ii  d7 10s          3d7 10s
   27    2co ii  d6 4s2          3d6  4s2
   27    2co ii  d6 4s5s         3d6  4s   5s
   27    2co ii  d6 4s6s         3d6  4s   6s
   27    2co ii  d6 4s7s         3d6  4s   7s
   27    2co ii  d6 4s8s         3d6  4s   8s
   27    2co ii  d6 4s9s         3d6  4s   9s
   27    2co ii  d6 4s10s        3d6  4s  10s
   27    2co ii  d5s2 5s         3d5  4s2  5s
   27    2co ii  d5s2 6s         3d5  4s2  6s
   27    2co ii  d5s2 7s         3d5  4s2  7s
   27    2co ii  d5s2 8s         3d5  4s2  8s
   27    2co ii  d5s2 9s         3d5  4s2  9s
   27    2co ii  d5s2 10s        3d5  4s2 10s
   27    2co ii  d7 5g           3d7  5g
   27    2co ii  d7 6g           3d7  6g
   27    2co ii  d7 7g           3d7  7g
   27    2co ii  d7 8g           3d7  8g
   27    2co ii  d7 9g           3d7  9g
   27    2co ii  d6 4s5g         3d6  4s   5g
   27    2co ii  d6 4s6g         3d6  4s   6g
   27    2co ii  d6 4s7g         3d6  4s   7g
   27    2co ii  d6 4s8g         3d6  4s   8g
   27    2co ii  d6 4s9g         3d6  4s   9g
   27    2co ii  d7 7i           3d7  7i
   27    2co ii  d7 8i           3d7  8i
   27    2co ii  d7 9i           3d7  9i
   27    2co ii  d6 4s7i         3d6  4s   7i
   27    2co ii  d6 4s8i         3d6  4s   8i
   27    2co ii  d6 4s9i         3d6  4s   9i
   27    2co ii  d7 9l           3d7 10l                                             actually 9l
   27    2co ii  d6 4s9l         3d6  4s  10l                                        actually 9l
   27    2co ii  d6p2            3d6  4p2
   27    2co ii  d7 4p           3d7  4p
   27    2co ii  d7 5p           3d7  5p
   27    2co ii  d7 6p           3d7  6p
   27    2co ii  d7 7p           3d7  7p
   27    2co ii  d7 8p           3d7  8p
   27    2co ii  d7 9p           3d7  9p
   27    2co ii  d6 4s4p         3d6  4s   4p
   27    2co ii  d6 4s5p         3d6  4s   5p
   27    2co ii  d6 4s6p         3d6  4s   6p
   27    2co ii  d6 4s7p         3d6  4s   7p
   27    2co ii  d6 4s8p         3d6  4s   8p
   27    2co ii  d6 4s9p         3d6  4s   9p
   27    2co ii  d5s2 4p         3d5  4s2  4p
   27    2co ii  d5s2 5p         3d5  4s2  5p
   27    2co ii  d5s2 6p         3d5  4s2  6p
   27    2co ii  d5s2 7p         3d5  4s2  7p
   27    2co ii  d5s2 8p         3d5  4s2  8p
   27    2co ii  d5s2 9p         3d5  4s2  9p
   27    2co ii  d7 4f           3d7  4f
   27    2co ii  d7 5f           3d7  5f
   27    2co ii  d7 6f           3d7  6f
   27    2co ii  d7 7f           3d7  7f
   27    2co ii  d7 8f           3d7  8f
   27    2co ii  d7 9f           3d7  9f
   27    2co ii  d6 4s4f         3d6  4s   4f
   27    2co ii  d6 4s5f         3d6  4s   5f
   27    2co ii  d6 4s6f         3d6  4s   6f
   27    2co ii  d6 4s7f         3d6  4s   7f
   27    2co ii  d6 4s8f         3d6  4s   8f
   27    2co ii  d6 4s9f         3d6  4s   9f
   27    2co ii  d5s2 4f         3d5  4s2  4f
   27    2co ii  d5s2 5f         3d5  4s2  5f
   27    2co ii  d5s2 6f         3d5  4s2  6f
   27    2co ii  d5s2 7f         3d5  4s2  7f
   27    2co ii  d5s2 8f         3d5  4s2  8f
   27    2co ii  d5s2 9f         3d5  4s2  9f
   27    2co ii  d7 6h           3d7  6h
   27    2co ii  d7 7h           3d7  7h
   27    2co ii  d7 8h           3d7  8h
   27    2co ii  d7 9h           3d7  9h
   27    2co ii  d6 4s6h         3d6  4s   6h
   27    2co ii  d6 4s7h         3d6  4s   7h
   27    2co ii  d6 4s8h         3d6  4s   8h
   27    2co ii  d6 4s9h         3d6  4s   9h
   27    2co ii  d5s2 6h         3d5  4s2  6h
   27    2co ii  d5s2 7h         3d5  4s2  7h
   27    2co ii  d7 8k           3d7  8k
   27    2co ii  d7 9k           3d7  9k
   27    2co ii  d6 4s8k         3d6  4s   8k
   27    2co ii  d6 4s9k         3d6  4s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF270101.DAT;*
$DELETE POOLG:HF270102.DAT;*
$DELETE POOLG:HF270104.DAT;*
$DELETE POOLG:HF270131.DAT;*
$DELETE POOLG:HF270132.DAT;*
