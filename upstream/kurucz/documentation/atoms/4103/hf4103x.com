$set def KU6E:[KURUCZ.4103]
$assign sys$input for010
$assign sys$output for009
$assign hf410307.dat for007
$assign hf410301.dat for001
$assign hf410302.dat for002
$assign hf410304.dat for004
$assign hf4103x.pun for011
$assign hf4103x.rrr for012
$assign hf4103x.dat for013
$assign hf4103xe.dat for014
$assign hf410331.dat for031
$assign hf410332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   41    4nb iv 4d2              4d2
   41    4nb iv 4d5s             4d1  5s
   41    4nb iv 4d6s             4d1  6s
   41    4nb iv 4d7s             4d1  7s
   41    4nb iv 4d8s             4d1  8s
   41    4nb iv 4d9s             4d1  9s
   41    4nb iv 4d10s            4d1 10s
   41    4nb iv 4d11s            4d1 11s
   41    4nb iv 4d12s            4d1 12s
   41    4nb iv 4d13s            4d1 13s
   41    4nb iv 4d14s            4d1 14s
   41    4nb iv 5s2              5s2
   41    4nb iv 5s6s             5s1  6s
   41    4nb iv 5s7s             5s1  7s
   41    4nb iv 5s8s             5s1  8s
   41    4nb iv 5s9s             5s1  9s
   41    4nb iv 5s10s            5s1 10s
   41    4nb iv 5s11s            5s1 11s
   41    4nb iv 5s12s            5s1 12s
   41    4nb iv 5s13s            5s1 13s
   41    4nb iv 5s14s            5s1 14s
   41    4nb iv 4d5d             4d1  5d
   41    4nb iv 4d6d             4d1  6d
   41    4nb iv 4d7d             4d1  7d
   41    4nb iv 4d8d             4d1  8d
   41    4nb iv 4d9d             4d1  9d
   41    4nb iv 4d10d            4d1 10d
   41    4nb iv 4d11d            4d1 11d
   41    4nb iv 4d12d            4d1 12d
   41    4nb iv 4d13d            4d1 13d
   41    4nb iv 4d14d            4d1 14d
   41    4nb iv 5s5d             5s1  5d
   41    4nb iv 5s6d             5s1  6d
   41    4nb iv 5s7d             5s1  7d
   41    4nb iv 5s8d             5s1  8d
   41    4nb iv 5s9d             5s1  9d
   41    4nb iv 5s10d            5s1 10d
   41    4nb iv 5s11d            5s1 11d
   41    4nb iv 5s12d            5s1 12d
   41    4nb iv 5s13d            5s1 13d
   41    4nb iv 5s14d            5s1 14d
   41    4nb iv 5s5g             5s1  5g
   41    4nb iv 5s6g             5s1  6g
   41    4nb iv 5s7g             5s1  7g
   41    4nb iv 5s8g             5s1  8g
   41    4nb iv 5s9g             5s1  9g
   41    4nb iv 4d5g             4d1  5g
   41    4nb iv 4d6g             4d1  6g
   41    4nb iv 4d7g             4d1  7g
   41    4nb iv 4d8g             4d1  8g
   41    4nb iv 4d9g             4d1  9g
   41    4nb iv 4d7i             4d1  7i
   41    4nb iv 4d8i             4d1  8i
   41    4nb iv 4d9i             4d1  9i
   41    4nb iv 5s7i             5s1  7i
   41    4nb iv 5s8i             5s1  8i
   41    4nb iv 5s9i             5s1  9i
   41    4nb iv 5p2              5p2
   41    4nb iv 5p6p             5p   6p
   41    4nb iv 5p7p             5p   7p
   41    4nb iv 5p8p             5p   8p
   41    4nb iv 4d5p             4d1  5p
   41    4nb iv 4d6p             4d1  6p
   41    4nb iv 4d7p             4d1  7p
   41    4nb iv 4d8p             4d1  8p
   41    4nb iv 4d9p             4d1  9p
   41    4nb iv 4d10p            4d1 10p
   41    4nb iv 4d11p            4d1 11p
   41    4nb iv 4d12p            4d1 12p
   41    4nb iv 4d13p            4d1 13p
   41    4nb iv 4d14p            4d1 14p
   41    4nb iv 5s5p             5s1  5p
   41    4nb iv 5s6p             5s1  6p
   41    4nb iv 5s7p             5s1  7p
   41    4nb iv 5s8p             5s1  8p
   41    4nb iv 5s9p             5s1  9p
   41    4nb iv 5s10p            5s1 10p
   41    4nb iv 5s11p            5s1 11p
   41    4nb iv 5s12p            5s1 12p
   41    4nb iv 5s13p            5s1 13p
   41    4nb iv 5s14p            5s1 14p
   41    4nb iv 4d4f             4d1  4f
   41    4nb iv 4d5f             4d1  5f
   41    4nb iv 4d6f             4d1  6f
   41    4nb iv 4d7f             4d1  7f
   41    4nb iv 4d8f             4d1  8f
   41    4nb iv 4d9f             4d1  9f
   41    4nb iv 4d10f            4d1 10f
   41    4nb iv 4d11f            4d1 11f
   41    4nb iv 4d12f            4d1 12f
   41    4nb iv 4d13f            4d1 13f
   41    4nb iv 5s4f             5s1  4f
   41    4nb iv 5s5f             5s1  5f
   41    4nb iv 5s6f             5s1  6f
   41    4nb iv 5s7f             5s1  7f
   41    4nb iv 5s8f             5s1  8f
   41    4nb iv 5s9f             5s1  9f
   41    4nb iv 5s10f            5s1 10f
   41    4nb iv 5s11f            5s1 11f
   41    4nb iv 5s12f            5s1 12f
   41    4nb iv 5s13f            5s1 13f
   41    4nb iv 4d6h             4d1  6h
   41    4nb iv 4d7h             4d1  7h
   41    4nb iv 4d8h             4d1  8h
   41    4nb iv 4d9h             4d1  9h
   41    4nb iv 4d10h            4d1 10h
   41    4nb iv 5s6h             5s1  6h
   41    4nb iv 5s7h             5s1  7h
   41    4nb iv 5s8h             5s1  8h
   41    4nb iv 5s9h             5s1  9h
   41    4nb iv 5s10h            5s1 10h
   41    4nb iv 5s8k             5s1  8k
   41    4nb iv 5s9k             5s1  9k
   41    4nb iv 5s10k            5s1 10k
   41    4nb iv 4d8k             4d1  8k
   41    4nb iv 4d9k             4d1  9k
   41    4nb iv 4d10k            4d1 10k
   41    4nb iv 5p5d             5p   5d
   41    4nb iv 5p6d             5p   6d
   41    4nb iv 5p7d             5p   7d
   41    4nb iv 5p8d             5p   8d
   41    4nb iv 5p9d             5p   9d
   -1
$run cray:rcn2c
$DELETE HF410301.DAT;*
$DELETE HF410302.DAT;*
$DELETE HF410304.DAT;*
$DELETE HF410331.DAT;*
$DELETE HF410332.DAT;*
