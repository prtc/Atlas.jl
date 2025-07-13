$set def KU6E:[KURUCZ.4500]
$assign sys$input for010
$assign sys$output for009
$assign hf450007.dat for007
$assign hf450001.dat for001
$assign hf450002.dat for002
$assign hf450004.dat for004
$assign hf4500x.pun for011
$assign hf4500x.rrr for012
$assign hf4500x.dat for013
$assign hf4500xe.dat for014
$assign hf450031.dat for031
$assign hf450032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   45    1rh i  d8 5s            4d8  5s
   45    1rh i  d8 6s            4d8  6s
   45    1rh i  d8 7s            4d8  7s
   45    1rh i  d8 8s            4d8  8s
   45    1rh i  d8 9s            4d8  9s
   45    1rh i  d8 10s           4d8 10s
   45    1rh i  d8 11s           4d8 11s
   45    1rh i  d8 12s           4d8 12s
   45    1rh i  d7 5s2           4d7  5s2
   45    1rh i  d7 5s6s          4d7  5s   6s
   45    1rh i  d7 5s7s          4d7  5s   7s
   45    1rh i  d7 5s8s          4d7  5s   8s
   45    1rh i  d7 5s9s          4d7  5s   9s
   45    1rh i  d7 5s10s         4d7  5s  10s
   45    1rh i  d7 5s11s         4d7  5s  11s
   45    1rh i  d7 5s12s         4d7  5s  12s
   45    1rh i  d6s2 6s          4d6  5s2  6s
   45    1rh i  d6s2 7s          4d6  5s2  7s
   45    1rh i  d6s2 8s          4d6  5s2  8s
   45    1rh i  d6s2 9s          4d6  5s2  9s
   45    1rh i  d6s2 10s         4d6  5s2 10s
   45    1rh i  d6s2 11s         4d6  5s2 11s
   45    1rh i  d9               4d9
   45    1rh i  d8 5d            4d8  5d
   45    1rh i  d8 6d            4d8  6d
   45    1rh i  d8 7d            4d8  7d
   45    1rh i  d8 8d            4d8  8d
   45    1rh i  d8 9d            4d8  9d
   45    1rh i  d8 10d           4d8 10d
   45    1rh i  d8 11d           4d8 11d
   45    1rh i  d7 5s5d          4d7  5s   5d
   45    1rh i  d7 5s6d          4d7  5s   6d
   45    1rh i  d7 5s7d          4d7  5s   7d
   45    1rh i  d7 5s8d          4d7  5s   8d
   45    1rh i  d7 5s9d          4d7  5s   9d
   45    1rh i  d7 5s10d         4d7  5s  10d
   45    1rh i  d7 5s11d         4d7  5s  11d
   45    1rh i  d6s2 5d          4d6  5s2  5d
   45    1rh i  d6s2 6d          4d6  5s2  6d
   45    1rh i  d6s2 7d          4d6  5s2  7d
   45    1rh i  d6s2 8d          4d6  5s2  8d
   45    1rh i  d6s2 9d          4d6  5s2  9d
   45    1rh i  d6s2 10d         4d6  5s2 10d
   45    1rh i  d6s2 11d         4d6  5s2 11d
   45    1rh i  d8 5g            4d8  5g
   45    1rh i  d8 6g            4d8  6g
   45    1rh i  d8 7g            4d8  7g
   45    1rh i  d8 8g            4d8  8g
   45    1rh i  d8 9g            4d8  9g
   45    1rh i  d7 5s5g          4d7  5s   5g
   45    1rh i  d7 5s6g          4d7  5s   6g
   45    1rh i  d7 5s7g          4d7  5s   7g
   45    1rh i  d7 5s8g          4d7  5s   8g
   45    1rh i  d7 5s9g          4d7  5s   9g
   45    1rh i  d8 7i            4d8  7i
   45    1rh i  d8 8i            4d8  8i
   45    1rh i  d8 9i            4d8  9i
   45    1rh i  d7 5s7i          4d7  5s   7i
   45    1rh i  d7 5s8i          4d7  5s   8i
   45    1rh i  d7 5s9i          4d7  5s   9i
   45    1rh i  d7 5p2           4d7  5p2
   45    1rh i  d8 5p            4d8  5p
   45    1rh i  d8 6p            4d8  6p
   45    1rh i  d8 7p            4d8  7p
   45    1rh i  d8 8p            4d8  8p
   45    1rh i  d8 9p            4d8  9p
   45    1rh i  d8 10p           4d8 10p
   45    1rh i  d8 11p           4d8 11p
   45    1rh i  d8 12p           4d8 12p
   45    1rh i  d7 5s5p          4d7  5s   5p
   45    1rh i  d7 5s6p          4d7  5s   6p
   45    1rh i  d7 5s7p          4d7  5s   7p
   45    1rh i  d7 5s8p          4d7  5s   8p
   45    1rh i  d7 5s9p          4d7  5s   9p
   45    1rh i  d7 5s10p         4d7  5s  10p
   45    1rh i  d7 5s11p         4d7  5s  11p
   45    1rh i  d7 5s12p         4d7  5s  12p
   45    1rh i  d6s2 5p          4d6  5s2  5p
   45    1rh i  d6s2 6p          4d6  5s2  6p
   45    1rh i  d6s2 7p          4d6  5s2  7p
   45    1rh i  d6s2 8p          4d6  5s2  8p
   45    1rh i  d6s2 9p          4d6  5s2  9p
   45    1rh i  d6s2 10p         4d6  5s2 10p
   45    1rh i  d6s2 11p         4d6  5s2 11p
   45    1rh i  d6s2 12p         4d6  5s2 12p
   45    1rh i  d8 4f            4d8  4f
   45    1rh i  d8 5f            4d8  5f
   45    1rh i  d8 6f            4d8  6f
   45    1rh i  d8 7f            4d8  7f
   45    1rh i  d8 8f            4d8  8f
   45    1rh i  d8 9f            4d8  9f
   45    1rh i  d8 10f           4d8 10f
   45    1rh i  d8 11f           4d8 11f
   45    1rh i  d8 12f           4d8 12f
   45    1rh i  d7 5s4f          4d7  5s   4f
   45    1rh i  d7 5s5f          4d7  5s   5f
   45    1rh i  d7 5s6f          4d7  5s   6f
   45    1rh i  d7 5s7f          4d7  5s   7f
   45    1rh i  d7 5s8f          4d7  5s   8f
   45    1rh i  d7 5s9f          4d7  5s   9f
   45    1rh i  d7 5s10f         4d7  5s  10f
   45    1rh i  d7 5s11f         4d7  5s  11f
   45    1rh i  d7 5s12f         4d7  5s  12f
   45    1rh i  d6s2 4f          4d6  5s2  4f
   45    1rh i  d6s2 5f          4d6  5s2  5f
   45    1rh i  d6s2 6f          4d6  5s2  6f
   45    1rh i  d6s2 7f          4d6  5s2  7f
   45    1rh i  d6s2 8f          4d6  5s2  8f
   45    1rh i  d6s2 9f          4d6  5s2  9f
   45    1rh i  d6s2 10f         4d6  5s2 10f
   45    1rh i  d8 6h            4d8  6h
   45    1rh i  d8 7h            4d8  7h
   45    1rh i  d8 8h            4d8  8h
   45    1rh i  d8 9h            4d8  9h
   45    1rh i  d7 5s6h          4d7  5s   6h
   45    1rh i  d7 5s7h          4d7  5s   7h
   45    1rh i  d7 5s8h          4d7  5s   8h
   45    1rh i  d7 5s9h          4d7  5s   9h
   45    1rh i  d8 8k            4d8  8k
   45    1rh i  d8 9k            4d8  9k
   45    1rh i  d7 5s8k          4d7  5s   8k
   45    1rh i  d7 5s9k          4d7  5s   9k
   -1
$run cray:rcn2c
$DELETE HF450001.DAT;*
$DELETE HF450002.DAT;*
$DELETE HF450004.DAT;*
$DELETE HF450031.DAT;*
$DELETE HF450032.DAT;*
