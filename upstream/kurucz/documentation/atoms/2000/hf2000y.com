$set def 2000
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf200007.dat for007
$assign poolg:hf200001.dat for001
$assign poolg:hf200002.dat for002
$assign poolg:hf200004.dat for004
$assign hf2000y.pun for011
$assign hf2000y.dat for013
$assign hf2000ye.dat for014
$assign poolg:hf200031.dat for031
$assign poolg:hf200032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   20    1ca i  4s2              4s2
   20    1ca i  4s5s             4s1  5s
   20    1ca i  4s6s             4s1  6s
   20    1ca i  4s7s             4s1  7s
   20    1ca i  4s8s             4s1  8s
   20    1ca i  4s9s             4s1  9s
   20    1ca i  4s10s            4s1 10s
   20    1ca i  4s11s            4s1 11s
   20    1ca i  4s12s            4s1 12s
   20    1ca i  4s13s            4s1 13s
   20    1ca i  3d4s             3d1  4s
   20    1ca i  3d5s             3d1  5s
   20    1ca i  3d6s             3d1  6s
   20    1ca i  3d7s             3d1  7s
   20    1ca i  3d8s             3d1  8s
   20    1ca i  3d9s             3d1  9s
   20    1ca i  3d10s            3d1 10s
   20    1ca i  3d11s            3d1 11s
   20    1ca i  3d12s            3d1 12s
   20    1ca i  3d13s            3d1 13s
   20    1ca i  4s4d             4s1  4d
   20    1ca i  4s5d             4s1  5d
   20    1ca i  4s6d             4s1  6d
   20    1ca i  4s7d             4s1  7d
   20    1ca i  4s8d             4s1  8d
   20    1ca i  4s9d             4s1  9d
   20    1ca i  4s10d            4s1 10d
   20    1ca i  4s11d            4s1 11d
   20    1ca i  4s12d            4s1 12d
   20    1ca i  4s13d            4s1 13d
   20    1ca i  3d2              3d2
   20    1ca i  3d4d             3d1  4d
   20    1ca i  3d5d             3d1  5d
   20    1ca i  3d6d             3d1  6d
   20    1ca i  3d7d             3d1  7d
   20    1ca i  3d8d             3d1  8d
   20    1ca i  3d9d             3d1  9d
   20    1ca i  3d10d            3d1 10d
   20    1ca i  3d11d            3d1 11d
   20    1ca i  3d12d            3d1 12d
   20    1ca i  3d13d            3d1 13d
   20    1ca i  4s5g             4s1  5g
   20    1ca i  4s6g             4s1  6g
   20    1ca i  4s7g             4s1  7g
   20    1ca i  4s8g             4s1  8g
   20    1ca i  4s9g             4s1  9g
   20    1ca i  3d5g             3d1  5g
   20    1ca i  3d6g             3d1  6g
   20    1ca i  3d7g             3d1  7g
   20    1ca i  3d8g             3d1  8g
   20    1ca i  3d9g             3d1  9g
   20    1ca i  4s7i             4s1  7i
   20    1ca i  4s8i             4s1  8i
   20    1ca i  4s9i             4s1  9i
   20    1ca i  3d7i             3d1  7i
   20    1ca i  3d8i             3d1  8i
   20    1ca i  3d9i             3d1  9i
   20    1ca i  4p2              4p2
   20    1ca i  4p5p             4p1  5p
   20    1ca i  4p6p             4p1  6p
   20    1ca i  4p7p             4p1  7p
   20    1ca i  4s4p             4s1  4p
   20    1ca i  4s5p             4s1  5p
   20    1ca i  4s6p             4s1  6p
   20    1ca i  4s7p             4s1  7p
   20    1ca i  4s8p             4s1  8p
   20    1ca i  4s9p             4s1  9p
   20    1ca i  4s10p            4s1 10p
   20    1ca i  4s11p            4s1 11p
   20    1ca i  4s12p            4s1 12p
   20    1ca i  4s13p            4s1 13p
   20    1ca i  4s14p            4s1 14p
   20    1ca i  3d4p             3d1  4p
   20    1ca i  3d5p             3d1  5p
   20    1ca i  3d6p             3d1  6p
   20    1ca i  3d7p             3d1  7p
   20    1ca i  3d8p             3d1  8p
   20    1ca i  3d9p             3d1  9p
   20    1ca i  3d10p            3d1 10p
   20    1ca i  3d11p            3d1 11p
   20    1ca i  3d12p            3d1 12p
   20    1ca i  3d13p            3d1 13p
   20    1ca i  3d14p            3d1 14p
   20    1ca i  4s4f             4s1  4f
   20    1ca i  4s5f             4s1  5f
   20    1ca i  4s6f             4s1  6f
   20    1ca i  4s7f             4s1  7f
   20    1ca i  4s8f             4s1  8f
   20    1ca i  4s9f             4s1  9f
   20    1ca i  4s10f            4s1 10f
   20    1ca i  4s11f            4s1 11f
   20    1ca i  4s12f            4s1 12f
   20    1ca i  4s13f            4s1 13f
   20    1ca i  4s14f            4s1 14f
   20    1ca i  3d4f             3d1  4f
   20    1ca i  3d5f             3d1  5f
   20    1ca i  3d6f             3d1  6f
   20    1ca i  3d7f             3d1  7f
   20    1ca i  3d8f             3d1  8f
   20    1ca i  3d9f             3d1  9f
   20    1ca i  3d10f            3d1 10f
   20    1ca i  3d11f            3d1 11f
   20    1ca i  3d12f            3d1 12f
   20    1ca i  3d13f            3d1 13f
   20    1ca i  3d14f            3d1 14f
   20    1ca i  4s6h             4s1  6h
   20    1ca i  4s7h             4s1  7h
   20    1ca i  4s8h             4s1  8h
   20    1ca i  4s9h             4s1  9h
   20    1ca i  3d6h             3d1  6h
   20    1ca i  3d7h             3d1  7h
   20    1ca i  3d8h             3d1  8h
   20    1ca i  3d9h             3d1  9h
   20    1ca i  4p5s             4p1  5s
   20    1ca i  4p6s             4p1  6s
   20    1ca i  4p7s             4p1  7s
   20    1ca i  4p8s             4p1  8s
   20    1ca i  4p4d             4p1  4d
   20    1ca i  4p5d             4p1  5d
   20    1ca i  4p6d             4p1  6d
   20    1ca i  4p7d             4p1  7d
   20    1ca i  4p8d             4p1  8d
   -1
   20    1ca i  4s9l             4s1 10l
   20    1ca i  3d9l             3d1 10l
   20    1ca i  4p5s             4p1  5s
   20    1ca i  4p6s             4p1  6s
   20    1ca i  4p7s             4p1  7s
   20    1ca i  4s8k             4s1  8k
   20    1ca i  4s9k             4s1  9k
   20    1ca i  3d8k             3d1  8k
   20    1ca i  3d9k             3d1  9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF200001.DAT;*
$DELETE POOLG:HF200002.DAT;*
$DELETE POOLG:HF200004.DAT;*
$DELETE POOLG:HF200031.DAT;*
$DELETE POOLG:HF200032.DAT;*
