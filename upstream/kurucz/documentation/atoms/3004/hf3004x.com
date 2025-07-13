$set def 3004
$assign sys$input for010
$assign sys$output for009
$assign POOL:hf300407.dat for007
$assign POOL:hf300401.dat for001
$assign POOL:hf300402.dat for002
$assign POOL:hf300404.dat for004
$assign hf3004x.pun for011
$assign hf3004x.rrr for012
$assign hf3004x.dat for013
$assign hf3004xe.dat for014
$assign POOL:hf300431.dat for031
$assign POOL:hf300432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   30    4zn v   d8              3d8      
   30    4zn v   d7 4d           3d7  4d
   30    4zn v   d7 5d           3d7  5d
   30    4zn v   d7 6d           3d7  6d
   30    4zn v   d7 7d           3d7  7d
   30    4zn v   d7 8d           3d7  8d
   30    4zn v   d7 9d           3d7  9d
   30    4zn v   d7 10d          3d7 10d
   30    4zn v   d6 4s4d         3d6  4s   4d
   30    4zn v   d6 4s5d         3d6  4s   5d
   30    4zn v   d6 4s6d         3d6  4s   6d
   30    4zn v   d6 4s7d         3d6  4s   7d
   30    4zn v   d6 4s8d         3d6  4s   8d
   30    4zn v   d6 4s9d         3d6  4s   9d
   30    4zn v   d6 4s10d        3d6  4s  10d
   30    4zn v   d5s2 4d         3d5  4s2  4d
   30    4zn v   d5s2 5d         3d5  4s2  5d
   30    4zn v   d5s2 6d         3d5  4s2  6d
   30    4zn v   d5s2 7d         3d5  4s2  7d
   30    4zn v   d5s2 8d         3d5  4s2  8d
   30    4zn v   d5s2 9d         3d5  4s2  9d
   30    4zn v   d5s2 10d        3d5  4s2 10d
   30    4zn v   d7 4s           3d7  4s
   30    4zn v   d7 5s           3d7  5s
   30    4zn v   d7 6s           3d7  6s
   30    4zn v   d7 7s           3d7  7s
   30    4zn v   d7 8s           3d7  8s
   30    4zn v   d7 9s           3d7  9s
   30    4zn v   d7 10s          3d7 10s
   30    4zn v   d6 4s2          3d6  4s2
   30    4zn v   d6 4s5s         3d6  4s   5s
   30    4zn v   d6 4s6s         3d6  4s   6s
   30    4zn v   d6 4s7s         3d6  4s   7s
   30    4zn v   d6 4s8s         3d6  4s   8s
   30    4zn v   d6 4s9s         3d6  4s   9s
   30    4zn v   d6 4s10s        3d6  4s  10s
   30    4zn v   d5s2 5s         3d5  4s2  5s
   30    4zn v   d5s2 6s         3d5  4s2  6s
   30    4zn v   d5s2 7s         3d5  4s2  7s
   30    4zn v   d5s2 8s         3d5  4s2  8s
   30    4zn v   d5s2 9s         3d5  4s2  9s
   30    4zn v   d5s2 10s        3d5  4s2 10s
   30    4zn v   d7 5g           3d7  5g
   30    4zn v   d7 6g           3d7  6g
   30    4zn v   d7 7g           3d7  7g
   30    4zn v   d7 8g           3d7  8g
   30    4zn v   d7 9g           3d7  9g
   30    4zn v   d7 10g          3d7  10g
   30    4zn v   d6 4s5g         3d6  4s   5g
   30    4zn v   d6 4s6g         3d6  4s   6g
   30    4zn v   d6 4s7g         3d6  4s   7g
   30    4zn v   d6 4s8g         3d6  4s   8g
   30    4zn v   d6 4s9g         3d6  4s   9g
   30    4zn v   d6 4s10g        3d6  4s  10g
   30    4zn v   d7 7i           3d7  7i
   30    4zn v   d7 8i           3d7  8i
   30    4zn v   d7 9i           3d7  9i
   30    4zn v   d6 4s7i         3d6  4s   7i
   30    4zn v   d6 4s8i         3d6  4s   8i
   30    4zn v   d6 4s9i         3d6  4s   9i
   30    4zn v   d6p2            3d6  4p2
   30    4zn v   d7 4p           3d7  4p
   30    4zn v   d7 5p           3d7  5p
   30    4zn v   d7 6p           3d7  6p
   30    4zn v   d7 7p           3d7  7p
   30    4zn v   d7 8p           3d7  8p
   30    4zn v   d7 9p           3d7  9p
   30    4zn v   d6 4s4p         3d6  4s   4p
   30    4zn v   d6 4s5p         3d6  4s   5p
   30    4zn v   d6 4s6p         3d6  4s   6p
   30    4zn v   d6 4s7p         3d6  4s   7p
   30    4zn v   d6 4s8p         3d6  4s   8p
   30    4zn v   d6 4s9p         3d6  4s   9p
   30    4zn v   d5s2 4p         3d5  4s2  4p
   30    4zn v   d5s2 5p         3d5  4s2  5p
   30    4zn v   d5s2 6p         3d5  4s2  6p
   30    4zn v   d5s2 7p         3d5  4s2  7p
   30    4zn v   d5s2 8p         3d5  4s2  8p
   30    4zn v   d5s2 9p         3d5  4s2  9p
   30    4zn v   d7 4f           3d7  4f
   30    4zn v   d7 5f           3d7  5f
   30    4zn v   d7 6f           3d7  6f
   30    4zn v   d7 7f           3d7  7f
   30    4zn v   d7 8f           3d7  8f
   30    4zn v   d7 9f           3d7  9f
   30    4zn v   d6 4s4f         3d6  4s   4f
   30    4zn v   d6 4s5f         3d6  4s   5f
   30    4zn v   d6 4s6f         3d6  4s   6f
   30    4zn v   d6 4s7f         3d6  4s   7f
   30    4zn v   d6 4s8f         3d6  4s   8f
   30    4zn v   d6 4s9f         3d6  4s   9f
   30    4zn v   d5s2 4f         3d5  4s2  4f
   30    4zn v   d5s2 5f         3d5  4s2  5f
   30    4zn v   d5s2 6f         3d5  4s2  6f
   30    4zn v   d5s2 7f         3d5  4s2  7f
   30    4zn v   d5s2 8f         3d5  4s2  8f
   30    4zn v   d5s2 9f         3d5  4s2  9f
   30    4zn v   d7 6h           3d7  6h
   30    4zn v   d7 7h           3d7  7h
   30    4zn v   d7 8h           3d7  8h
   30    4zn v   d7 9h           3d7  9h
   30    4zn v   d6 4s6h         3d6  4s   6h
   30    4zn v   d6 4s7h         3d6  4s   7h
   30    4zn v   d6 4s8h         3d6  4s   8h
   30    4zn v   d6 4s9h         3d6  4s   9h
   30    4zn v   d5s2 6h         3d5  4s2  6h
   30    4zn v   d5s2 7h         3d5  4s2  7h
   30    4zn v   d7 8k           3d7  8k
   30    4zn v   d7 9k           3d7  9k
   30    4zn v   d6 4s8k         3d6  4s   8k
   30    4zn v   d6 4s9k         3d6  4s   9k
   -1
$run cray:rcn2c
$DELETE POOL:HF300401.DAT;*
$DELETE POOL:HF300402.DAT;*
$DELETE POOL:HF300404.DAT;*
$DELETE POOL:HF300431.DAT;*
$DELETE POOL:HF300432.DAT;*
