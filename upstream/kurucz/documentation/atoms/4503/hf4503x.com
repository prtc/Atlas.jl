$set def ku6e:[kurucz.4503]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf450307.dat for007
$assign pool:hf450301.dat for001
$assign pool:hf450302.dat for002
$assign pool:hf450304.dat for004
$assign hf4503X.pun for011
$assign hf4503X.rrr for012
$assign hf4503X.dat for013
$assign hf4503Xe.dat for014
$assign pool:hf450331.dat for031
$assign pool:hf450332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  5.0 0.50 0.0  0.70
   45    4rh iv  d6              4d6
   45    4rh iv  d5 5s           4d5  5s
   45    4rh iv  d5 6s           4d5  6s
   45    4rh iv  d5 7s           4d5  7s
   45    4rh iv  d5 8s           4d5  8s
   45    4rh iv  d5 9s           4d5  9s
   45    4rh iv  d5 10s          4d5 10s
   45    4rh iv  d4 5s2          4d4  5s2
   45    4rh iv  d4 5s6s         4d4  5s   6s
   45    4rh iv  d4 5s7s         4d4  5s   7s
   45    4rh iv  d4 5s8s         4d4  5s   8s
   45    4rh iv  d4 5s9s         4d4  5s   9s
   45    4rh iv  d4 5s10s        4d4  5s  10s
   45    4rh iv  d3s2 6s         4d3  5s2  6s
   45    4rh iv  d3s2 7s         4d3  5s2  7s
   45    4rh iv  d3s2 8s         4d3  5s2  8s
   45    4rh iv  d3s2 9s         4d3  5s2  9s
   45    4rh iv  d3s2 10s        4d3  5s2 10s
   45    4rh iv  d5 5d           4d5  5d
   45    4rh iv  d5 6d           4d5  6d
   45    4rh iv  d5 7d           4d5  7d
   45    4rh iv  d5 8d           4d5  8d
   45    4rh iv  d5 9d           4d5  9d
   45    4rh iv  d5 10d          4d5 10d
   45    4rh iv  d4 5s5d         4d4  5s   5d
   45    4rh iv  d4 5s6d         4d4  5s   6d
   45    4rh iv  d4 5s7d         4d4  5s   7d
   45    4rh iv  d4 5s8d         4d4  5s   8d
   45    4rh iv  d4 5s9d         4d4  5s   9d
   45    4rh iv  d4 5s10d        4d4  5s  10d
   45    4rh iv  d3s2 5d         4d3  5s2  5d
   45    4rh iv  d3s2 6d         4d3  5s2  6d
   45    4rh iv  d3s2 7d         4d3  5s2  7d
   45    4rh iv  d3s2 8d         4d3  5s2  8d
   45    4rh iv  d3s2 9d         4d3  5s2  9d
   45    4rh iv  d3s2 10d        4d3  5s2 10d
   45    4rh iv  d5 5g           4d5  5g
   45    4rh iv  d5 6g           4d5  6g
   45    4rh iv  d5 7g           4d5  7g
   45    4rh iv  d5 8g           4d5  8g
   45    4rh iv  d5 9g           4d5  9g
   45    4rh iv  d4 5s5g         4d4  5s   5g
   45    4rh iv  d4 5s6g         4d4  5s   6g
   45    4rh iv  d4 5s7g         4d4  5s   7g
   45    4rh iv  d4 5s8g         4d4  5s   8g
   45    4rh iv  d4 5s9g         4d4  5s   9g
   45    4rh iv  d5 7i           4d5  7i
   45    4rh iv  d5 8i           4d5  8i
   45    4rh iv  d5 9i           4d5  9i
   45    4rh iv  d4 5s7i         4d4  5s   7i
   45    4rh iv  d4 5s8i         4d4  5s   8i
   45    4rh iv  d4 5s9i         4d4  5s   9i
   45    4rh iv  d4 5p2          4d4  5p2
   45    4rh iv  d5 5p           4d5  5p
   45    4rh iv  d5 6p           4d5  6p
   45    4rh iv  d5 7p           4d5  7p
   45    4rh iv  d5 8p           4d5  8p
   45    4rh iv  d5 9p           4d5  9p
   45    4rh iv  d5 10p          4d5 10p
   45    4rh iv  d4 5s5p         4d4  5s   5p
   45    4rh iv  d4 5s6p         4d4  5s   6p
   45    4rh iv  d4 5s7p         4d4  5s   7p
   45    4rh iv  d4 5s8p         4d4  5s   8p
   45    4rh iv  d4 5s9p         4d4  5s   9p
   45    4rh iv  d4 5s10p        4d4  5s  10p
   45    4rh iv  d3s2 5p         4d3  5s2  5p
   45    4rh iv  d3s2 6p         4d3  5s2  6p
   45    4rh iv  d3s2 7p         4d3  5s2  7p
   45    4rh iv  d3s2 8p         4d3  5s2  8p
   45    4rh iv  d3s2 9p         4d3  5s2  9p
   45    4rh iv  d3s2 10p        4d3  5s2 10p
   45    4rh iv  d5 4f           4d5  4f
   45    4rh iv  d5 5f           4d5  5f
   45    4rh iv  d5 6f           4d5  6f
   45    4rh iv  d5 7f           4d5  7f
   45    4rh iv  d5 8f           4d5  8f
   45    4rh iv  d5 9f           4d5  9f
   45    4rh iv  d4 5s4f         4d4  5s   4f
   45    4rh iv  d4 5s5f         4d4  5s   5f
   45    4rh iv  d4 5s6f         4d4  5s   6f
   45    4rh iv  d4 5s7f         4d4  5s   7f
   45    4rh iv  d4 5s8f         4d4  5s   8f
   45    4rh iv  d4 5s9f         4d4  5s   9f
   45    4rh iv  d3s2 4f         4d3  5s2  4f
   45    4rh iv  d3s2 5f         4d3  5s2  5f
   45    4rh iv  d3s2 6f         4d3  5s2  6f
   45    4rh iv  d3s2 7f         4d3  5s2  7f
   45    4rh iv  d3s2 8f         4d3  5s2  8f
   45    4rh iv  d3s2 9f         4d3  5s2  9f
   45    4rh iv  d5 6h           4d5  6h
   45    4rh iv  d5 7h           4d5  7h
   45    4rh iv  d5 8h           4d5  8h
   45    4rh iv  d5 9h           4d5  9h
   45    4rh iv  d4 5s6h         4d4  5s   6h
   45    4rh iv  d4 5s7h         4d4  5s   7h
   45    4rh iv  d4 5s8h         4d4  5s   8h
   45    4rh iv  d4 5s9h         4d4  5s   9h
   45    4rh iv  d5 8k           4d5  8k
   45    4rh iv  d5 9k           4d5  9k
   45    4rh iv  d4 5s8k         4d4  5s   8k
   45    4rh iv  d4 5s9k         4d4  5s   9k
   -1
   45    4rh iv  d4 5p5d         4d4  5p   5d
   45    4rh iv  d4 5p6d         4d4  5p   6d
   45    4rh iv  d4 5p7d         4d4  5p   7d
   45    4rh iv  d4 5p8d         4d4  5p   8d
   45    4rh iv  d4 5p9d         4d4  5p   9d
$run cray:rcn2c
$DELETE POOL:HF450301.DAT;*
$DELETE POOL:HF450302.DAT;*
$DELETE POOL:HF450304.DAT;*
$DELETE POOL:HF450331.DAT;*
$DELETE POOL:HF450332.DAT;*
