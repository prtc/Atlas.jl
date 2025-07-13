$set def KU6E:[KURUCZ.4002]
$assign sys$input for010
$assign sys$output for009
$assign hf400207.dat for007
$assign hf400201.dat for001
$assign hf400202.dat for002
$assign hf400204.dat for004
$assign hf4002x.pun for011
$assign hf4002x.rrr for012
$assign hf4002x.dat for013
$assign hf4002xe.dat for014
$assign hf400231.dat for031
$assign hf400232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   40    3zr iii4d2              4d2
   40    3zr iii4d5s             4d1  5s
   40    3zr iii4d6s             4d1  6s
   40    3zr iii4d7s             4d1  7s
   40    3zr iii4d8s             4d1  8s
   40    3zr iii4d9s             4d1  9s
   40    3zr iii4d10s            4d1 10s
   40    3zr iii4d11s            4d1 11s
   40    3zr iii4d12s            4d1 12s
   40    3zr iii4d13s            4d1 13s
   40    3zr iii4d14s            4d1 14s
   40    3zr iii5s2              5s2
   40    3zr iii5s6s             5s1  6s
   40    3zr iii5s7s             5s1  7s
   40    3zr iii5s8s             5s1  8s
   40    3zr iii5s9s             5s1  9s
   40    3zr iii5s10s            5s1 10s
   40    3zr iii5s11s            5s1 11s
   40    3zr iii5s12s            5s1 12s
   40    3zr iii5s13s            5s1 13s
   40    3zr iii5s14s            5s1 14s
   40    3zr iii4d5d             4d1  5d
   40    3zr iii4d6d             4d1  6d
   40    3zr iii4d7d             4d1  7d
   40    3zr iii4d8d             4d1  8d
   40    3zr iii4d9d             4d1  9d
   40    3zr iii4d10d            4d1 10d
   40    3zr iii4d11d            4d1 11d
   40    3zr iii4d12d            4d1 12d
   40    3zr iii4d13d            4d1 13d
   40    3zr iii4d14d            4d1 14d
   40    3zr iii5s5d             5s1  5d
   40    3zr iii5s6d             5s1  6d
   40    3zr iii5s7d             5s1  7d
   40    3zr iii5s8d             5s1  8d
   40    3zr iii5s9d             5s1  9d
   40    3zr iii5s10d            5s1 10d
   40    3zr iii5s11d            5s1 11d
   40    3zr iii5s12d            5s1 12d
   40    3zr iii5s13d            5s1 13d
   40    3zr iii5s14d            5s1 14d
   40    3zr iii5s5g             5s1  5g
   40    3zr iii5s6g             5s1  6g
   40    3zr iii5s7g             5s1  7g
   40    3zr iii5s8g             5s1  8g
   40    3zr iii5s9g             5s1  9g
   40    3zr iii4d5g             4d1  5g
   40    3zr iii4d6g             4d1  6g
   40    3zr iii4d7g             4d1  7g
   40    3zr iii4d8g             4d1  8g
   40    3zr iii4d9g             4d1  9g
   40    3zr iii4d7i             4d1  7i
   40    3zr iii4d8i             4d1  8i
   40    3zr iii4d9i             4d1  9i
   40    3zr iii5s7i             5s1  7i
   40    3zr iii5s8i             5s1  8i
   40    3zr iii5s9i             5s1  9i
   40    3zr iii5p2              5p2
   40    3zr iii5p6p             5p   6p
   40    3zr iii5p7p             5p   7p
   40    3zr iii5p8p             5p   8p
   40    3zr iii4d5p             4d1  5p
   40    3zr iii4d6p             4d1  6p
   40    3zr iii4d7p             4d1  7p
   40    3zr iii4d8p             4d1  8p
   40    3zr iii4d9p             4d1  9p
   40    3zr iii4d10p            4d1 10p
   40    3zr iii4d11p            4d1 11p
   40    3zr iii4d12p            4d1 12p
   40    3zr iii4d13p            4d1 13p
   40    3zr iii4d14p            4d1 14p
   40    3zr iii5s5p             5s1  5p
   40    3zr iii5s6p             5s1  6p
   40    3zr iii5s7p             5s1  7p
   40    3zr iii5s8p             5s1  8p
   40    3zr iii5s9p             5s1  9p
   40    3zr iii5s10p            5s1 10p
   40    3zr iii5s11p            5s1 11p
   40    3zr iii5s12p            5s1 12p
   40    3zr iii5s13p            5s1 13p
   40    3zr iii5s14p            5s1 14p
   40    3zr iii4d4f             4d1  4f
   40    3zr iii4d5f             4d1  5f
   40    3zr iii4d6f             4d1  6f
   40    3zr iii4d7f             4d1  7f
   40    3zr iii4d8f             4d1  8f
   40    3zr iii4d9f             4d1  9f
   40    3zr iii4d10f            4d1 10f
   40    3zr iii4d11f            4d1 11f
   40    3zr iii4d12f            4d1 12f
   40    3zr iii4d13f            4d1 13f
   40    3zr iii5s4f             5s1  4f
   40    3zr iii5s5f             5s1  5f
   40    3zr iii5s6f             5s1  6f
   40    3zr iii5s7f             5s1  7f
   40    3zr iii5s8f             5s1  8f
   40    3zr iii5s9f             5s1  9f
   40    3zr iii5s10f            5s1 10f
   40    3zr iii5s11f            5s1 11f
   40    3zr iii5s12f            5s1 12f
   40    3zr iii5s13f            5s1 13f
   40    3zr iii4d6h             4d1  6h
   40    3zr iii4d7h             4d1  7h
   40    3zr iii4d8h             4d1  8h
   40    3zr iii4d9h             4d1  9h
   40    3zr iii4d10h            4d1 10h
   40    3zr iii5s6h             5s1  6h
   40    3zr iii5s7h             5s1  7h
   40    3zr iii5s8h             5s1  8h
   40    3zr iii5s9h             5s1  9h
   40    3zr iii5s10h            5s1 10h
   40    3zr iii5s8k             5s1  8k
   40    3zr iii5s9k             5s1  9k
   40    3zr iii5s10k            5s1 10k
   40    3zr iii4d8k             4d1  8k
   40    3zr iii4d9k             4d1  9k
   40    3zr iii4d10k            4d1 10k
   40    3zr iii5p5d             5p   5d
   40    3zr iii5p6d             5p   6d
   40    3zr iii5p7d             5p   7d
   40    3zr iii5p8d             5p   8d
   40    3zr iii5p9d             5p   9d
   -1
$run cray:rcn2c
$DELETE HF400201.DAT;*
$DELETE HF400202.DAT;*
$DELETE HF400204.DAT;*
$DELETE HF400231.DAT;*
$DELETE HF400232.DAT;*
