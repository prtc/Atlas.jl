$set def 2505
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf250507.dat for007
$assign poolg:hf250501.dat for001
$assign poolg:hf250502.dat for002
$assign poolg:hf250504.dat for004
$assign hf2505x.pun for011
$assign hf2505x.rrr for012
$assign hf2505x.dat for013
$assign hf2505xe.dat for014
$assign poolg:hf250531.dat for031
$assign poolg:hf250532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   25    6mn vi 3d2              3d2
   25    6mn vi 3d4d             3d   4d
   25    6mn vi 3d5d             3d   5d
   25    6mn vi 3d6d             3d   6d
   25    6mn vi 3d7d             3d   7d
   25    6mn vi 3d8d             3d   8d
   25    6mn vi 3d9d             3d   9d
   25    6mn vi 3d10d            3d  10d
   25    6mn vi 3d11d            3d  11d
   25    6mn vi 3d12d            3d  12d
   25    6mn vi 3d13d            3d  13d
   25    6mn vi 4s4d             4s   4d
   25    6mn vi 4s5d             4s   5d
   25    6mn vi 4s6d             4s   6d
   25    6mn vi 4s7d             4s   7d
   25    6mn vi 4s8d             4s   8d
   25    6mn vi 4s9d             4s   9d
   25    6mn vi 4s10d            4s  10d
   25    6mn vi 4s11d            4s  11d
   25    6mn vi 4s12d            4s  12d
   25    6mn vi 4s13d            4s  13d
   25    6mn vi 3d4s             3d   4s
   25    6mn vi 3d5s             3d   5s
   25    6mn vi 3d6s             3d   6s
   25    6mn vi 3d7s             3d   7s
   25    6mn vi 3d8s             3d   8s
   25    6mn vi 3d9s             3d   9s
   25    6mn vi 3d10s            3d  10s
   25    6mn vi 3d11s            3d  11s
   25    6mn vi 3d12s            3d  12s
   25    6mn vi 3d13s            3d  13s
   25    6mn vi 3d14s            3d  14s
   25    6mn vi 4s2              4s2
   25    6mn vi 4s5s             4s   5s
   25    6mn vi 4s6s             4s   6s
   25    6mn vi 4s7s             4s   7s
   25    6mn vi 4s8s             4s   8s
   25    6mn vi 4s9s             4s   9s
   25    6mn vi 4s10s            4s  10s
   25    6mn vi 4s11s            4s  11s
   25    6mn vi 4s12s            4s  12s
   25    6mn vi 4s13s            4s  13s
   25    6mn vi 4s14s            4s  14s
   25    6mn vi 3d5g             3d   5g
   25    6mn vi 3d6g             3d   6g
   25    6mn vi 3d7g             3d   7g
   25    6mn vi 3d8g             3d   8g
   25    6mn vi 3d9g             3d   9g
   25    6mn vi 4s5g             4s   5g
   25    6mn vi 4s6g             4s   6g
   25    6mn vi 4s7g             4s   7g
   25    6mn vi 4s8g             4s   8g
   25    6mn vi 4s9g             4s   9g
   25    6mn vi 3d7i             3d   7i
   25    6mn vi 3d8i             3d   8i
   25    6mn vi 3d9i             3d   9i
   25    6mn vi 4s7i             4s   7i
   25    6mn vi 4s8i             4s   8i
   25    6mn vi 4s9i             4s   9i
   25    6mn vi 4p2              4p2
   25    6mn vi p5d2 4p          3p5  3d2  4p
   25    6mn vi 3d4p             3d   4p
   25    6mn vi 3d5p             3d   5p
   25    6mn vi 3d6p             3d   6p
   25    6mn vi 3d7p             3d   7p
   25    6mn vi 3d8p             3d   8p
   25    6mn vi 3d9p             3d   9p
   25    6mn vi 3d10p            3d  10p
   25    6mn vi 3d11p            3d  11p
   25    6mn vi 3d12p            3d  12p
   25    6mn vi 3d13p            3d  13p
   25    6mn vi 3d14p            3d  14p
   25    6mn vi 4s4p             4s   4p
   25    6mn vi 4s5p             4s   5p
   25    6mn vi 4s6p             4s   6p
   25    6mn vi 4s7p             4s   7p
   25    6mn vi 4s8p             4s   8p
   25    6mn vi 4s9p             4s   9p
   25    6mn vi 4s10p            4s  10p
   25    6mn vi 4s11p            4s  11p
   25    6mn vi 4s12p            4s  12p
   25    6mn vi 4s13p            4s  13p
   25    6mn vi 4s14p            4s  14p
   25    6mn vi 3d4f             3d   4f
   25    6mn vi 3d5f             3d   5f
   25    6mn vi 3d6f             3d   6f
   25    6mn vi 3d7f             3d   7f
   25    6mn vi 3d8f             3d   8f
   25    6mn vi 3d9f             3d   9f
   25    6mn vi 3d10f            3d  10f
   25    6mn vi 3d11f            3d  11f
   25    6mn vi 3d12f            3d  12f
   25    6mn vi 3d13f            3d  13f
   25    6mn vi 3d14f            3d  14f
   25    6mn vi 4s4f             4s   4f
   25    6mn vi 4s5f             4s   5f
   25    6mn vi 4s6f             4s   6f
   25    6mn vi 4s7f             4s   7f
   25    6mn vi 4s8f             4s   8f
   25    6mn vi 4s9f             4s   9f
   25    6mn vi 4s10f            4s  10f
   25    6mn vi 4s11f            4s  11f
   25    6mn vi 4s12f            4s  12f
   25    6mn vi 4s13f            4s  13f
   25    6mn vi 4s14f            4s  14f
   25    6mn vi 3d6h             3d   6h
   25    6mn vi 3d7h             3d   7h
   25    6mn vi 3d8h             3d   8h
   25    6mn vi 3d9h             3d   9h
   25    6mn vi 3d10h            3d  10h
   25    6mn vi 4s6h             4s   6h
   25    6mn vi 4s7h             4s   7h
   25    6mn vi 4s8h             4s   8h
   25    6mn vi 4s9h             4s   9h
   25    6mn vi 4s10h            4s  10h
   25    6mn vi 4s8k             4s   8k
   25    6mn vi 4s9k             4s   9k
   25    6mn vi 3d8k             3d   8k
   25    6mn vi 3d9k             3d   9k
   25    6mn vi p5d3             3p5  3d3
   25    6mn vi p5d2s            3p5  3d2  4s
   25    6mn vi p5ds2            3p5  3d   4s2
   -1
   25    6mn vi 3d9l             3d  10l
   25    6mn vi 4s9l             4s  10l
   25    6mn vi 4p4s             4p   4s
   25    6mn vi 4p5s             4p   5s
   25    6mn vi 4p6s             4p   6s
   -1
$run cray:rcn2c
$DELETE POOLG:HF250501.DAT;*
$DELETE POOLG:HF250502.DAT;*
$DELETE POOLG:HF250504.DAT;*
$DELETE POOLG:HF250531.DAT;*
$DELETE POOLG:HF250532.DAT;*
