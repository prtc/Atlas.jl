$set def 2404
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf240407.dat for007
$assign poolg:hf240401.dat for001
$assign poolg:hf240402.dat for002
$assign poolg:hf240404.dat for004
$assign hf2404x.pun for011
$assign hf2404x.rrr for012
$assign hf2404x.dat for013
$assign hf2404xe.dat for014
$assign poolg:hf240431.dat for031
$assign poolg:hf240432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   24    5cr v  3d2              3d2
   24    5cr v  3d4d             3d   4d
   24    5cr v  3d5d             3d   5d
   24    5cr v  3d6d             3d   6d
   24    5cr v  3d7d             3d   7d
   24    5cr v  3d8d             3d   8d
   24    5cr v  3d9d             3d   9d
   24    5cr v  3d10d            3d  10d
   24    5cr v  3d11d            3d  11d
   24    5cr v  3d12d            3d  12d
   24    5cr v  3d13d            3d  13d
   24    5cr v  3d14d            3d  14d
   24    5cr v  3d4s             3d   4s
   24    5cr v  3d5s             3d   5s
   24    5cr v  3d6s             3d   6s
   24    5cr v  3d7s             3d   7s
   24    5cr v  3d8s             3d   8s
   24    5cr v  3d9s             3d   9s
   24    5cr v  3d10s            3d  10s
   24    5cr v  3d11s            3d  11s
   24    5cr v  3d12s            3d  12s
   24    5cr v  3d13s            3d  13s
   24    5cr v  3d14s            3d  14s
   24    5cr v  4s2              4s2
   24    5cr v  4s5s             4s   5s
   24    5cr v  4s6s             4s   6s
   24    5cr v  4s7s             4s   7s
   24    5cr v  4s8s             4s   8s
   24    5cr v  4s9s             4s   9s
   24    5cr v  4s10s            4s  10s
   24    5cr v  4s11s            4s  11s
   24    5cr v  4s12s            4s  12s
   24    5cr v  4s13s            4s  13s
   24    5cr v  4s14s            4s  14s
   24    5cr v  4s4d             4s   4d
   24    5cr v  4s5d             4s   5d
   24    5cr v  4s6d             4s   6d
   24    5cr v  4s7d             4s   7d
   24    5cr v  4s8d             4s   8d
   24    5cr v  4s9d             4s   9d
   24    5cr v  4s10d            4s  10d
   24    5cr v  4s11d            4s  11d
   24    5cr v  4s12d            4s  12d
   24    5cr v  4s13d            4s  13d
   24    5cr v  4s5g             4s   5g
   24    5cr v  4s6g             4s   6g
   24    5cr v  4s7g             4s   7g
   24    5cr v  4s8g             4s   8g
   24    5cr v  4s9g             4s   9g
   24    5cr v  3d5g             3d   5g
   24    5cr v  3d6g             3d   6g
   24    5cr v  3d7g             3d   7g
   24    5cr v  3d8g             3d   8g
   24    5cr v  3d9g             3d   9g
   24    5cr v  3d7i             3d   7i
   24    5cr v  3d8i             3d   8i
   24    5cr v  3d9i             3d   9i
   24    5cr v  4s7i             4s   7i
   24    5cr v  4s8i             4s   8i
   24    5cr v  4s9i             4s   9i
   24    5cr v  4p2              4p2
   24    5cr v  3d4p             3d   4p
   24    5cr v  3d5p             3d   5p
   24    5cr v  3d6p             3d   6p
   24    5cr v  3d7p             3d   7p
   24    5cr v  3d8p             3d   8p
   24    5cr v  3d9p             3d   9p
   24    5cr v  3d10p            3d  10p
   24    5cr v  3d11p            3d  11p
   24    5cr v  3d12p            3d  12p
   24    5cr v  3d13p            3d  13p
   24    5cr v  3d14p            3d  14p
   24    5cr v  4s4p             4s   4p
   24    5cr v  4s5p             4s   5p
   24    5cr v  4s6p             4s   6p
   24    5cr v  4s7p             4s   7p
   24    5cr v  4s8p             4s   8p
   24    5cr v  4s9p             4s   9p
   24    5cr v  4s10p            4s  10p
   24    5cr v  4s11p            4s  11p
   24    5cr v  4s12p            4s  12p
   24    5cr v  4s13p            4s  13p
   24    5cr v  4s14p            4s  14p
   24    5cr v  3d4f             3d   4f
   24    5cr v  3d5f             3d   5f
   24    5cr v  3d6f             3d   6f
   24    5cr v  3d7f             3d   7f
   24    5cr v  3d8f             3d   8f
   24    5cr v  3d9f             3d   9f
   24    5cr v  3d10f            3d  10f
   24    5cr v  3d11f            3d  11f
   24    5cr v  3d12f            3d  12f
   24    5cr v  3d13f            3d  13f
   24    5cr v  3d14f            3d  14f
   24    5cr v  4s4f             4s   4f
   24    5cr v  4s5f             4s   5f
   24    5cr v  4s6f             4s   6f
   24    5cr v  4s7f             4s   7f
   24    5cr v  4s8f             4s   8f
   24    5cr v  4s9f             4s   9f
   24    5cr v  4s10f            4s  10f
   24    5cr v  4s11f            4s  11f
   24    5cr v  4s12f            4s  12f
   24    5cr v  4s13f            4s  13f
   24    5cr v  4s14f            4s  14f
   24    5cr v  3d6h             3d   6h
   24    5cr v  3d7h             3d   7h
   24    5cr v  3d8h             3d   8h
   24    5cr v  3d9h             3d   9h
   24    5cr v  4s6h             4s   6h
   24    5cr v  4s7h             4s   7h
   24    5cr v  4s8h             4s   8h
   24    5cr v  4s9h             4s   9h
   24    5cr v  4s6h             4s   6h
   24    5cr v  4s8k             4s   8k
   24    5cr v  4s9k             4s   9k
   24    5cr v  3d8k             3d   8k
   24    5cr v  3d9k             3d   9k
   24    5cr v  4p4d             4p   4d
   24    5cr v  4p5d             4p   5d
   24    5cr v  4p6d             4p   6d
   24    5cr v  4p7d             4p   7d
   -1
   24    5cr v  3d9l             3d  10l
   24    5cr v  4s9l             4s  10l
   24    5cr v  4p4s             4p   4s
   24    5cr v  4p5s             4p   5s
   24    5cr v  4p6s             4p   6s
   -1
$run cray:rcn2c
$DELETE POOLG:HF240401.DAT;*
$DELETE POOLG:HF240402.DAT;*
$DELETE POOLG:HF240404.DAT;*
$DELETE POOLG:HF240431.DAT;*
$DELETE POOLG:HF240432.DAT;*
