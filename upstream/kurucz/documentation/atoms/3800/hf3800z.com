$set def 3800
$assign sys$input for010
$assign sys$output for009
$assign 3800:hf380007.dat for007
$assign 3800:hf380001.dat for001
$assign 3800:hf380002.dat for002
$assign 3800:hf380004.dat for004
$assign hf3800z.pun for011
$assign hf3800z.rrr for012
$assign hf3800z.dat for013
$assign hf3800xe.dat for014
$assign poolg:hf380031.dat for031
$assign poolg:hf380032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   38    1sr i  5s2              5s2
   38    1sr i  5s6s             5s1  6s
   38    1sr i  5s7s             5s1  7s
   38    1sr i  5s8s             5s1  8s
   38    1sr i  5s9s             5s1  9s
   38    1sr i  5s10s            5s1 10s
   38    1sr i  5s11s            5s1 11s
   38    1sr i  5s12s            5s1 12s
   38    1sr i  5s13s            5s1 13s
   38    1sr i  5s14s            5s1 14s
   38    1sr i  4d5s             4d1  5s
   38    1sr i  4d6s             4d1  6s
   38    1sr i  4d7s             4d1  7s
   38    1sr i  4d8s             4d1  8s
   38    1sr i  4d9s             4d1  9s
   38    1sr i  4d10s            4d1 10s
   38    1sr i  4d11s            4d1 11s
   38    1sr i  4d12s            4d1 12s
   38    1sr i  4d13s            4d1 13s
   38    1sr i  4d14s            4d1 14s
   38    1sr i  5s5d             5s1  5d
   38    1sr i  5s6d             5s1  6d
   38    1sr i  5s7d             5s1  7d
   38    1sr i  5s8d             5s1  8d
   38    1sr i  5s9d             5s1  9d
   38    1sr i  5s10d            5s1 10d
   38    1sr i  5s11d            5s1 11d
   38    1sr i  5s12d            5s1 12d
   38    1sr i  5s13d            5s1 13d
   38    1sr i  5s14d            5s1 14d
   38    1sr i  4d2              4d2
   38    1sr i  4d5d             4d1  5d
   38    1sr i  4d6d             4d1  6d
   38    1sr i  4d7d             4d1  7d
   38    1sr i  4d8d             4d1  8d
   38    1sr i  4d9d             4d1  9d
   38    1sr i  4d10d            4d1 10d
   38    1sr i  4d11d            4d1 11d
   38    1sr i  4d12d            4d1 12d
   38    1sr i  4d13d            4d1 13d
   38    1sr i  4d14d            4d1 14d
   38    1sr i  5s5g             5s1  5g
   38    1sr i  5s6g             5s1  6g
   38    1sr i  5s7g             5s1  7g
   38    1sr i  5s8g             5s1  8g
   38    1sr i  5s9g             5s1  9g
   38    1sr i  5s10g            5s1 10g
   38    1sr i  4d5g             4d1  5g
   38    1sr i  4d6g             4d1  6g
   38    1sr i  4d7g             4d1  7g
   38    1sr i  4d8g             4d1  8g
   38    1sr i  4d9g             4d1  9g
   38    1sr i  4d10g            4d1 10g
   38    1sr i  5s7i             5s1  7i
   38    1sr i  5s8i             5s1  8i
   38    1sr i  5s9i             5s1  9i
   38    1sr i  4d7i             4d1  7i
   38    1sr i  4d8i             4d1  8i
   38    1sr i  4d9i             4d1  9i
   38    1sr i  5p2              5p2
   38    1sr i  5p6p             5p   6p
   38    1sr i  5s5p             5s1  5p
   38    1sr i  5s6p             5s1  6p
   38    1sr i  5s7p             5s1  7p
   38    1sr i  5s8p             5s1  8p
   38    1sr i  5s9p             5s1  9p
   38    1sr i  5s10p            5s1 10p
   38    1sr i  5s11p            5s1 11p
   38    1sr i  5s12p            5s1 12p
   38    1sr i  5s13p            5s1 13p
   38    1sr i  5s14p            5s1 14p
   38    1sr i  4d5p             4d1  5p
   38    1sr i  4d6p             4d1  6p
   38    1sr i  4d7p             4d1  7p
   38    1sr i  4d8p             4d1  8p
   38    1sr i  4d9p             4d1  9p
   38    1sr i  4d10p            4d1 10p
   38    1sr i  4d11p            4d1 11p
   38    1sr i  4d12p            4d1 12p
   38    1sr i  4d13p            4d1 13p
   38    1sr i  4d14p            4d1 14p
   38    1sr i  5s4f             5s1  4f
   38    1sr i  5s5f             5s1  5f
   38    1sr i  5s6f             5s1  6f
   38    1sr i  5s7f             5s1  7f
   38    1sr i  5s8f             5s1  8f
   38    1sr i  5s9f             5s1  9f
   38    1sr i  5s10f            5s1 10f
   38    1sr i  5s11f            5s1 11f
   38    1sr i  5s12f            5s1 12f
   38    1sr i  5s13f            5s1 13f
   38    1sr i  5s14f            5s1 14f
   38    1sr i  4d4f             4d1  4f
   38    1sr i  4d5f             4d1  5f
   38    1sr i  4d6f             4d1  6f
   38    1sr i  4d7f             4d1  7f
   38    1sr i  4d8f             4d1  8f
   38    1sr i  4d9f             4d1  9f
   38    1sr i  4d10f            4d1 10f
   38    1sr i  4d11f            4d1 11f
   38    1sr i  4d12f            4d1 12f
   38    1sr i  4d13f            4d1 13f
   38    1sr i  4d14f            4d1 14f
   38    1sr i  5s6h             5s1  6h
   38    1sr i  5s7h             5s1  7h
   38    1sr i  5s8h             5s1  8h
   38    1sr i  5s9h             5s1  9h
   38    1sr i  5s10h            5s1 10h
   38    1sr i  4d6h             4d1  6h
   38    1sr i  4d7h             4d1  7h
   38    1sr i  4d8h             4d1  8h
   38    1sr i  4d9h             4d1  9h
   38    1sr i  4d10h            4d1 10h
   38    1sr i  5s8k             5s1  8k
   38    1sr i  5s9k             5s1  9k
   38    1sr i  5s10k            5s1 10k
   38    1sr i  4d8k             4d1  8k
   38    1sr i  4d9k             4d1  9k
   38    1sr i  4d10k            4d1 10k
   38    1sr i  5p6s             5p   6s
   38    1sr i  5p7s             5p   7s
   38    1sr i  5p8s             5p   8s
   -1
   38    1sr i  4d9l             4d1 10l
   38    1sr i  5s9l             5s1 10l
   -1
$run cray:rcn2c
$DELETE POOLG:HF380001.DAT;*
$DELETE POOLG:HF380002.DAT;*
$DELETE POOLG:HF380004.DAT;*
$DELETE POOLG:HF380031.DAT;*
$DELETE POOLG:HF380032.DAT;*
