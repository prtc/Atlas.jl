$set def KU6E:[KURUCZ.4600]
$assign sys$input for010
$assign sys$output for009
$assign hf460007.dat for007
$assign hf460001.dat for001
$assign hf460002.dat for002
$assign hf460004.dat for004
$assign hf4600x.pun for011
$assign hf4600x.rrr for012
$assign hf4600x.dat for013
$assign hf4600xe.dat for014
$assign hf460031.dat for031
$assign hf460032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   46    1pd i  d10              4d10
   46    1pd i  d9 5s            4d9  5s
   46    1pd i  d9 6s            4d9  6s
   46    1pd i  d9 7s            4d9  7s
   46    1pd i  d9 8s            4d9  8s
   46    1pd i  d9 9s            4d9  9s
   46    1pd i  d9 10s           4d9 10s
   46    1pd i  d9 11s           4d9 11s
   46    1pd i  d9 12s           4d9 12s
   46    1pd i  d8 5s2           4d8  5s2
   46    1pd i  d8 5s6s          4d8  5s   6s
   46    1pd i  d8 5s7s          4d8  5s   7s
   46    1pd i  d8 5s8s          4d8  5s   8s
   46    1pd i  d8 5s9s          4d8  5s   9s
   46    1pd i  d8 5s10s         4d8  5s  10s
   46    1pd i  d8 5s11s         4d8  5s  11s
   46    1pd i  d8 5s12s         4d8  5s  12s
   46    1pd i  d7s2 6s          4d7  5s2  6s
   46    1pd i  d7s2 7s          4d7  5s2  7s
   46    1pd i  d7s2 8s          4d7  5s2  8s
   46    1pd i  d7s2 9s          4d7  5s2  9s
   46    1pd i  d7s2 10s         4d7  5s2 10s
   46    1pd i  d7s2 11s         4d7  5s2 11s
   46    1pd i  d7s2 12s         4d7  5s2 12s
   46    1pd i  d9 5d            4d9  5d
   46    1pd i  d9 6d            4d9  6d
   46    1pd i  d9 7d            4d9  7d
   46    1pd i  d9 8d            4d9  8d
   46    1pd i  d9 9d            4d9  9d
   46    1pd i  d9 10d           4d9 10d
   46    1pd i  d9 11d           4d9 11d
   46    1pd i  d8 5s5d          4d8  5s   5d
   46    1pd i  d8 5s6d          4d8  5s   6d
   46    1pd i  d8 5s7d          4d8  5s   7d
   46    1pd i  d8 5s8d          4d8  5s   8d
   46    1pd i  d8 5s9d          4d8  5s   9d
   46    1pd i  d8 5s10d         4d8  5s  10d
   46    1pd i  d8 5s11d         4d8  5s  11d
   46    1pd i  d7s2 5d          4d7  5s2  5d
   46    1pd i  d7s2 6d          4d7  5s2  6d
   46    1pd i  d7s2 7d          4d7  5s2  7d
   46    1pd i  d7s2 8d          4d7  5s2  8d
   46    1pd i  d7s2 9d          4d7  5s2  9d
   46    1pd i  d7s2 10d         4d7  5s2 10d
   46    1pd i  d9 5g            4d9  5g
   46    1pd i  d9 6g            4d9  6g
   46    1pd i  d9 7g            4d9  7g
   46    1pd i  d9 8g            4d9  8g
   46    1pd i  d9 9g            4d9  9g
   46    1pd i  d8 5s5g          4d8  5s   5g
   46    1pd i  d8 5s6g          4d8  5s   6g
   46    1pd i  d8 5s7g          4d8  5s   7g
   46    1pd i  d8 5s8g          4d8  5s   8g
   46    1pd i  d8 5s9g          4d8  5s   9g
   46    1pd i  d9 7i            4d9  7i
   46    1pd i  d9 8i            4d9  8i
   46    1pd i  d9 9i            4d9  9i
   46    1pd i  d8 5s7i          4d8  5s   7i
   46    1pd i  d8 5s8i          4d8  5s   8i
   46    1pd i  d8 5s9i          4d8  5s   9i
   46    1pd i  d8 5p2           4d8  5p2
   46    1pd i  d9 5p            4d9  5p
   46    1pd i  d9 6p            4d9  6p
   46    1pd i  d9 7p            4d9  7p
   46    1pd i  d9 8p            4d9  8p
   46    1pd i  d9 9p            4d9  9p
   46    1pd i  d9 10p           4d9 10p
   46    1pd i  d9 11p           4d9 11p
   46    1pd i  d9 12p           4d9 12p
   46    1pd i  d9 13p           4d9 13p
   46    1pd i  d8 5s5p          4d8  5s   5p
   46    1pd i  d8 5s6p          4d8  5s   6p
   46    1pd i  d8 5s7p          4d8  5s   7p
   46    1pd i  d8 5s8p          4d8  5s   8p
   46    1pd i  d8 5s9p          4d8  5s   9p
   46    1pd i  d8 5s10p         4d8  5s  10p
   46    1pd i  d8 5s11p         4d8  5s  11p
   46    1pd i  d8 5s12p         4d8  5s  12p
   46    1pd i  d8 5s13p         4d8  5s  13p
   46    1pd i  d7s2 5p          4d7  5s2  5p
   46    1pd i  d7s2 5p          4d7  5s2  5p
   46    1pd i  d7s2 6p          4d7  5s2  6p
   46    1pd i  d7s2 7p          4d7  5s2  7p
   46    1pd i  d7s2 8p          4d7  5s2  8p
   46    1pd i  d7s2 9p          4d7  5s2  9p
   46    1pd i  d7s2 10p         4d7  5s2 10p
   46    1pd i  d7s2 11p         4d7  5s2 11p
   46    1pd i  d7s2 12p         4d7  5s2 12p
   46    1pd i  d7s2 13p         4d7  5s2 13p
   46    1pd i  d9 4f            4d9  4f
   46    1pd i  d9 5f            4d9  5f
   46    1pd i  d9 6f            4d9  6f
   46    1pd i  d9 7f            4d9  7f
   46    1pd i  d9 8f            4d9  8f
   46    1pd i  d9 9f            4d9  9f
   46    1pd i  d9 10f           4d9 10f
   46    1pd i  d8 5s4f          4d8  5s   4f
   46    1pd i  d8 5s5f          4d8  5s   5f
   46    1pd i  d8 5s6f          4d8  5s   6f
   46    1pd i  d8 5s7f          4d8  5s   7f
   46    1pd i  d8 5s8f          4d8  5s   8f
   46    1pd i  d8 5s9f          4d8  5s   9f
   46    1pd i  d8 5s10f         4d8  5s  10f
   46    1pd i  d7s2 4f          4d7  5s2  4f
   46    1pd i  d7s2 5f          4d7  5s2  5f
   46    1pd i  d7s2 6f          4d7  5s2  6f
   46    1pd i  d7s2 7f          4d7  5s2  7f
   46    1pd i  d7s2 8f          4d7  5s2  8f
   46    1pd i  d7s2 9f          4d7  5s2  9f
   46    1pd i  d7s2 10f         4d7  5s2 10f
   46    1pd i  d9 6h            4d9  6h
   46    1pd i  d9 7h            4d9  7h
   46    1pd i  d9 8h            4d9  8h
   46    1pd i  d9 9h            4d9  9h
   46    1pd i  d8 5s6h          4d8  5s   6h
   46    1pd i  d8 5s7h          4d8  5s   7h
   46    1pd i  d8 5s8h          4d8  5s   8h
   46    1pd i  d8 5s9h          4d8  5s   9h
   46    1pd i  d9 8k            4d9  8k
   46    1pd i  d9 9k            4d9  9k
   46    1pd i  d8 5s8k          4d8  5s   8k
   46    1pd i  d8 5s9k          4d8  5s   9k
   -1
$run cray:rcn2c
$DELETE HF460001.DAT;*
$DELETE HF460002.DAT;*
$DELETE HF460004.DAT;*
$DELETE HF460031.DAT;*
$DELETE HF460032.DAT;*
