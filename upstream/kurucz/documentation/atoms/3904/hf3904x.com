$set def ku6e:[kurucz.3904]
$assign sys$input for010
$assign sys$output for009
$assign hf390407.dat for007
$assign hf390401.dat for001
$assign hf390402.dat for002
$assign hf390404.dat for004
$assign hf3904x.pun for011
$assign hf3904x.rrr for012
$assign hf3904x.dat for013
$assign hf3904xe.dat for014
$assign hf390431.dat for031
$assign hf390432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   39    5y v   s2p5             3d10 4s2  4p5
   39    5y v   s2p4 5p          3d10 4s2  4p4  5p
   39    5y v   s2p4 6p          3d10 4s2  4p4  6p
   39    5y v   s2p4 7p          3d10 4s2  4p4  7p
   39    5y v   s2p4 8p          3d10 4s2  4p4  8p
   39    5y v   s2p4 9p          3d10 4s2  4p4  9p
   39    5y v   s2p4 10p         3d10 4s2  4p4 10p
   39    5y v   s2p4 11p         3d10 4s2  4p4 11p
   39    5y v   s2p4 12p         3d10 4s2  4p4 12p
   39    5y v   s2p4 13p         3d10 4s2  4p4 13p
   39    5y v   4p6 5p           3d10 4s0  4p6  5p
   39    5y v   4p6 6p           3d10 4s0  4p6  6p
   39    5y v   4p6 7p           3d10 4s0  4p6  7p
   39    5y v   4p6 8p           3d10 4s0  4p6  8p
   39    5y v   4p6 9p           3d10 4s0  4p6  9p
   39    5y v   4p6 10p          3d10 4s0  4p6 10p
   39    5y v   4p6 11p          3d10 4s0  4p6 11p
   39    5y v   4p6 12p          3d10 4s0  4p6 12p
   39    5y v   4p6 13p          3d10 4s0  4p6 13p
   39    5y v   s2p4 4f          3d10 4s2  4p4  4f
   39    5y v   s2p4 5f          3d10 4s2  4p4  5f
   39    5y v   s2p4 6f          3d10 4s2  4p4  6f
   39    5y v   s2p4 7f          3d10 4s2  4p4  7f
   39    5y v   s2p4 8f          3d10 4s2  4p4  8f
   39    5y v   s2p4 9f          3d10 4s2  4p4  9f
   39    5y v   4p6 4f           3d10 4s0  4p6  4f
   39    5y v   4p6 5f           3d10 4s0  4p6  5f
   39    5y v   4p6 6f           3d10 4s0  4p6  6f
   39    5y v   4p6 7f           3d10 4s0  4p6  7f
   39    5y v   4p6 8f           3d10 4s0  4p6  8f
   39    5y v   4p6 9f           3d10 4s0  4p6  9f
   39    5y v   s2p4 6h          3d10 4s2  4p4  6h
   39    5y v   s2p4 7h          3d10 4s2  4p4  7h
   39    5y v   s2p4 8h          3d10 4s2  4p4  8h
   39    5y v   s2p4 9h          3d10 4s2  4p4  9h
   39    5y v   4p6 6h           3d10 4s0  4p6  6h
   39    5y v   4p6 7h           3d10 4s0  4p6  7h
   39    5y v   4p6 8h           3d10 4s0  4p6  8h
   39    5y v   4p6 9h           3d10 4s0  4p6  9h
   39    5y v   s2p4 8k          3d10 4s2  4p4  8k
   39    5y v   s2p4 9k          3d10 4s2  4p4  9k
   39    5y v   4p6 8k           3d10 4s0  4p6  8k
   39    5y v   4p6 9k           3d10 4s0  4p6  9k
   39    5y v   sp5 5s           3d10 4s   4p5  5s
   39    5y v   sp5 6s           3d10 4s   4p5  6s
   39    5y v   sp5 7s           3d10 4s   4p5  7s
   39    5y v   sp5 8s           3d10 4s   4p5  8s
   39    5y v   sp5 9s           3d10 4s   4p5  9s
   39    5y v   sp5 10s          3d10 4s   4p5 10s
   39    5y v   sp5 11s          3d10 4s   4p5 11s
   39    5y v   sp5 12s          3d10 4s   4p5 12s
   39    5y v   sp5 13s          3d10 4s   4p5 13s
   39    5y v   sp5 4d           3d10 4s   4p5  4d
   39    5y v   sp5 5d           3d10 4s   4p5  5d
   39    5y v   sp5 6d           3d10 4s   4p5  6d
   39    5y v   sp5 7d           3d10 4s   4p5  7d
   39    5y v   sp5 8d           3d10 4s   4p5  8d
   39    5y v   sp5 9d           3d10 4s   4p5  9d
   39    5y v   sp5 10d          3d10 4s   4p5 10d
   39    5y v   sp5 11d          3d10 4s   4p5 11d
   39    5y v   sp5 12d          3d10 4s   4p5 12d
   39    5y v   s2p4 5s          3d10 4s2  4p4  5s
   39    5y v   s2p4 6s          3d10 4s2  4p4  6s
   39    5y v   s2p4 7s          3d10 4s2  4p4  7s
   39    5y v   s2p4 8s          3d10 4s2  4p4  8s
   39    5y v   s2p4 9s          3d10 4s2  4p4  9s
   39    5y v   s2p4 10s         3d10 4s2  4p4 10s
   39    5y v   s2p4 11s         3d10 4s2  4p4 11s
   39    5y v   s2p4 12s         3d10 4s2  4p4 12s
   39    5y v   s2p4 13s         3d10 4s2  4p4 13s
   39    5y v   s2p4 14s         3d10 4s2  4p4 14s
   39    5y v   4p6 5s           3d10 4s0  4p6  5s
   39    5y v   4p6 6s           3d10 4s0  4p6  6s
   39    5y v   4p6 7s           3d10 4s0  4p6  7s
   39    5y v   4p6 8s           3d10 4s0  4p6  8s
   39    5y v   4p6 9s           3d10 4s0  4p6  9s
   39    5y v   4p6 10s          3d10 4s0  4p6 10s
   39    5y v   4p6 11s          3d10 4s0  4p6 11s
   39    5y v   4p6 12s          3d10 4s0  4p6 12s
   39    5y v   4p6 13s          3d10 4s0  4p6 13s
   39    5y v   4p6 14s          3d10 4s0  4p6 14s
   39    5y v   s2p4 4d          3d10 4s2  4p4  4d
   39    5y v   s2p4 5d          3d10 4s2  4p4  5d
   39    5y v   s2p4 6d          3d10 4s2  4p4  6d
   39    5y v   s2p4 7d          3d10 4s2  4p4  7d
   39    5y v   s2p4 8d          3d10 4s2  4p4  8d
   39    5y v   s2p4 9d          3d10 4s2  4p4  9d
   39    5y v   s2p4 10d         3d10 4s2  4p4 10d
   39    5y v   s2p4 11d         3d10 4s2  4p4 11d
   39    5y v   s2p4 12d         3d10 4s2  4p4 12d
   39    5y v   s2p4 13d         3d10 4s2  4p4 13d
   39    5y v   s2p4 14d         3d10 4s2  4p4 14d
   39    5y v   4p6 4d           3d10 4s0  4p6  4d
   39    5y v   4p6 5d           3d10 4s0  4p6  5d
   39    5y v   4p6 6d           3d10 4s0  4p6  6d
   39    5y v   4p6 7d           3d10 4s0  4p6  7d
   39    5y v   4p6 8d           3d10 4s0  4p6  8d
   39    5y v   4p6 9d           3d10 4s0  4p6  9d
   39    5y v   4p6 10d          3d10 4s0  4p6 10d
   39    5y v   4p6 11d          3d10 4s0  4p6 11d
   39    5y v   4p6 12d          3d10 4s0  4p6 12d
   39    5y v   4p6 13d          3d10 4s0  4p6 13d
   39    5y v   4p6 14d          3d10 4s0  4p6 14d
   39    5y v   s2p4 5g          3d10 4s2  4p4  5g
   39    5y v   s2p4 6g          3d10 4s2  4p4  6g
   39    5y v   s2p4 7g          3d10 4s2  4p4  7g
   39    5y v   s2p4 8g          3d10 4s2  4p4  8g
   39    5y v   s2p4 9g          3d10 4s2  4p4  9g
   39    5y v   s2p4 7i          3d10 4s2  4p4  7i
   39    5y v   s2p4 8i          3d10 4s2  4p4  8i
   39    5y v   s2p4 9i          3d10 4s2  4p4  9i
   39    5y v   sp6              3d10 4s   4p6  
   39    5y v   sp5 5p           3d10 4s   4p5  5p
   39    5y v   sp5 6p           3d10 4s   4p5  6p
   39    5y v   sp5 7p           3d10 4s   4p5  7p
   39    5y v   sp5 8p           3d10 4s   4p5  8p
   39    5y v   sp5 9p           3d10 4s   4p5  9p
   39    5y v   sp5 4f           3d10 4s   4p5  4f
   39    5y v   sp5 5f           3d10 4s   4p5  5f
   39    5y v   sp5 6f           3d10 4s   4p5  6f
   39    5y v   sp5 7f           3d10 4s   4p5  7f
   39    5y v   sp5 8f           3d10 4s   4p5  8f
   -1
   39    5y v   sp5 8f           3d10 4s   4p5  8f
   39    5y v   sp5 9f           3d10 4s   4p5  9f
   39    5y v   sp5 5g           3d10 4s   4p5  5g
   39    5y v   sp5 6g           3d10 4s   4p5  6g
   39    5y v   sp5 7g           3d10 4s   4p5  7g
   39    5y v   sp5 8g           3d10 4s   4p5  8g
   39    5y v   sp5 9g           3d10 4s   4p5  9g
   39    5y v   sp5 6h           3d10 4s   4p5  6h
   39    5y v   sp5 7h           3d10 4s   4p5  7h
   39    5y v   sp5 8h           3d10 4s   4p5  8h
   39    5y v   sp5 9h           3d10 4s   4p5  9h
   39    5y v   sp5 7i           3d10 4s   4p5  7i
   39    5y v   sp5 8i           3d10 4s   4p5  8i
   39    5y v   sp5 9i           3d10 4s   4p5  9i
$run cray:rcn2c
$DELETE HF390401.DAT;*
$DELETE HF390402.DAT;*
$DELETE HF390404.DAT;*
$DELETE HF390431.DAT;*
$DELETE HF390432.DAT;*
