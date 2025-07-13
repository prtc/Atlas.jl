$set DEF 3002
$assign sys$input for010
$assign sys$output for009
$assign pool:hf300207.dat for007
$assign pool:hf300201.dat for001
$assign pool:hf300202.dat for002
$assign pool:hf300204.dat for004
$assign hf3002x.pun for011
$assign hf3002x.rrr for012
$assign hf3002x.dat for013
$assign hf3002xe.dat for014
$assign pool:hf300231.dat for031
$assign pool:hf300232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   30    3zn iii d10             3d10
   30    3zn iii d9 4d           3d9  4d
   30    3zn iii d9 5d           3d9  5d
   30    3zn iii d9 6d           3d9  6d
   30    3zn iii d9 7d           3d9  7d
   30    3zn iii d9 8d           3d9  8d
   30    3zn iii d9 9d           3d9  9d
   30    3zn iii d8 4s4d         3d8  4s   4d
   30    3zn iii d8 4s5d         3d8  4s   5d
   30    3zn iii d8 4s6d         3d8  4s   6d
   30    3zn iii d8 4s7d         3d8  4s   7d
   30    3zn iii d8 4s8d         3d8  4s   8d
   30    3zn iii d8 4s9d         3d8  4s   9d
   30    3zn iii d7 4s2 4d       3d7  4s2  4d
   30    3zn iii d7 4s2 5d       3d7  4s2  5d
   30    3zn iii d7 4s2 6d       3d7  4s2  6d
   30    3zn iii d7 4s2 7d       3d7  4s2  7d
   30    3zn iii d7 4s2 8d       3d7  4s2  8d
   30    3zn iii d7 4s2 9d       3d7  4s2  9d
   30    3zn iii d9 4s           3d9  4s
   30    3zn iii d9 5s           3d9  5s
   30    3zn iii d9 6s           3d9  6s
   30    3zn iii d9 7s           3d9  7s
   30    3zn iii d9 8s           3d9  8s
   30    3zn iii d9 9s           3d9  9s
   30    3zn iii d9 10s          3d9 10s
   30    3zn iii d9 11s          3d9 11s
   30    3zn iii d9 12s          3d9 12s
   30    3zn iii d8 4s2          3d8  4s2
   30    3zn iii d8 4s5s         3d8  4s   5s
   30    3zn iii d8 4s6s         3d8  4s   6s
   30    3zn iii d8 4s7s         3d8  4s   7s
   30    3zn iii d8 4s8s         3d8  4s   8s
   30    3zn iii d8 4s9s         3d8  4s   9s
   30    3zn iii d8 4s10s        3d8  4s  10s
   30    3zn iii d8 4s11s        3d8  4s  11s
   30    3zn iii d8 4s12s        3d8  4s  12s
   30    3zn iii d7 4s2 5s       3d7  4s2  5s
   30    3zn iii d7 4s2 6s       3d7  4s2  6s
   30    3zn iii d7 4s2 7s       3d7  4s2  7s
   30    3zn iii d7 4s2 8s       3d7  4s2  8s
   30    3zn iii d7 4s2 9s       3d7  4s2  9s
   30    3zn iii d8 4s5g         3d8  4s   5g
   30    3zn iii d8 4s6g         3d8  4s   6g
   30    3zn iii d8 4s7g         3d8  4s   7g
   30    3zn iii d8 4s8g         3d8  4s   8g
   30    3zn iii d8 4s9g         3d8  4s   9g
   30    3zn iii d9 5g           3d9  5g
   30    3zn iii d9 6g           3d9  6g
   30    3zn iii d9 7g           3d9  7g
   30    3zn iii d9 8g           3d9  8g
   30    3zn iii d9 9g           3d9  9g
   30    3zn iii d8 4s7i         3d8  4s   7i
   30    3zn iii d8 4s8i         3d8  4s   8i
   30    3zn iii d8 4s9i         3d8  4s   9i
   30    3zn iii d9 7i           3d9  7i
   30    3zn iii d9 8i           3d9  8i
   30    3zn iii d9 9i           3d9  9i
   30    3zn iii d9 9l           3d9 10l
   30    3zn iii d8 4s9l         3d8  4s  10l
   30    3zn iii d8 4p2          3d8  4p2
   30    3zn iii d9 4p           3d9  4p
   30    3zn iii d9 5p           3d9  5p
   30    3zn iii d9 6p           3d9  6p
   30    3zn iii d9 7p           3d9  7p
   30    3zn iii d9 8p           3d9  8p
   30    3zn iii d9 9p           3d9  9p
   30    3zn iii d9 10p          3d9 10p
   30    3zn iii d9 11p          3d9 11p
   30    3zn iii d9 12p          3d9 12p
   30    3zn iii d9 13p          3d9 13p
   30    3zn iii d8 4s4p         3d8  4s   4p
   30    3zn iii d8 4s5p         3d8  4s   5p
   30    3zn iii d8 4s6p         3d8  4s   6p
   30    3zn iii d8 4s7p         3d8  4s   7p
   30    3zn iii d8 4s8p         3d8  4s   8p
   30    3zn iii d8 4s9p         3d8  4s   9p
   30    3zn iii d8 4s10p        3d8  4s  10p
   30    3zn iii d8 4s11p        3d8  4s  11p
   30    3zn iii d8 4s12p        3d8  4s  12p
   30    3zn iii d8 4s13p        3d8  4s  13p
   30    3zn iii d7 4s2 4p       3d7  4s2  4p
   30    3zn iii d7 4s2 5p       3d7  4s2  5p
   30    3zn iii d7 4s2 6p       3d7  4s2  6p
   30    3zn iii d7 4s2 7p       3d7  4s2  7p
   30    3zn iii d7 4s2 8p       3d7  4s2  8p
   30    3zn iii d7 4s2 9p       3d7  4s2  9p
   30    3zn iii d7 4s2 10p      3d7  4s2 10p
   30    3zn iii d7 4s2 11p      3d7  4s2 11p
   30    3zn iii d7 4s2 12p      3d7  4s2 12p
   30    3zn iii d7 4s2 13p      3d7  4s2 13p
   30    3zn iii d7 4s2 14p      3d7  4s2 14p
   30    3zn iii d8 4s4f         3d8  4s   4f
   30    3zn iii d8 4s5f         3d8  4s   5f
   30    3zn iii d8 4s6f         3d8  4s   6f
   30    3zn iii d8 4s7f         3d8  4s   7f
   30    3zn iii d8 4s8f         3d8  4s   8f
   30    3zn iii d8 4s9f         3d8  4s   9f
   30    3zn iii d9 4f           3d9  4f
   30    3zn iii d9 5f           3d9  5f
   30    3zn iii d9 6f           3d9  6f
   30    3zn iii d9 7f           3d9  7f
   30    3zn iii d9 8f           3d9  8f
   30    3zn iii d9 9f           3d9  9f
   30    3zn iii d7 4s2 4f       3d7  4s2  4f
   30    3zn iii d7 4s2 5f       3d7  4s2  5f
   30    3zn iii d7 4s2 6f       3d7  4s2  6f
   30    3zn iii d7 4s2 7f       3d7  4s2  7f
   30    3zn iii d7 4s2 8f       3d7  4s2  8f
   30    3zn iii d7 4s2 9f       3d7  4s2  9f
   30    3zn iii d8 4s6h         3d8  4s   6h
   30    3zn iii d8 4s7h         3d8  4s   7h
   30    3zn iii d8 4s8h         3d8  4s   8h
   30    3zn iii d8 4s9h         3d8  4s   9h
   30    3zn iii d9 6h           3d9  6h
   30    3zn iii d9 7h           3d9  7h
   30    3zn iii d9 8h           3d9  8h
   30    3zn iii d9 9h           3d9  9h
   30    3zn iii d8 4s8k         3d8  4s   8k
   30    3zn iii d8 4s9k         3d8  4s   9k
   30    3zn iii d9 8k           3d9  8k
   30    3zn iii d9 9k           3d9  9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF300201.DAT;*
$DELETE POOLG:HF300202.DAT;*
$DELETE POOLG:HF300204.DAT;*
$DELETE POOLG:HF300231.DAT;*
$DELETE POOLG:HF300232.DAT;*
