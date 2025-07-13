$set def 2202
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf220207.dat for007
$assign poolg:hf220201.dat for001
$assign poolg:hf220202.dat for002
$assign poolg:hf220204.dat for004
$assign hf2202z.pun for011
$assign hf2202z.rrr for012
$assign hf2202z.dat for013
$assign hf2202ze.dat for014
$assign poolg:hf220231.dat for031
$assign poolg:hf220232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   22    3ti iii3d2              3d2
   22    3ti iii3d4d             3d1  4d
   22    3ti iii3d5d             3d1  5d
   22    3ti iii3d6d             3d1  6d
   22    3ti iii3d7d             3d1  7d
   22    3ti iii3d8d             3d1  8d
   22    3ti iii3d9d             3d1  9d
   22    3ti iii3d10d            3d1 10d
   22    3ti iii3d11d            3d1 11d
   22    3ti iii4s4d             4s1  4d
   22    3ti iii4s5d             4s1  5d
   22    3ti iii4s6d             4s1  6d
   22    3ti iii4s7d             4s1  7d
   22    3ti iii4s8d             4s1  8d
   22    3ti iii4s9d             4s1  9d
   22    3ti iii4s10d            4s1 10d
   22    3ti iii4s11d            4s1 11d
   22    3ti iii3d4s             3d1  4s
   22    3ti iii3d5s             3d1  5s
   22    3ti iii3d6s             3d1  6s
   22    3ti iii3d7s             3d1  7s
   22    3ti iii3d8s             3d1  8s
   22    3ti iii3d9s             3d1  9s
   22    3ti iii3d10s            3d1 10s
   22    3ti iii3d11s            3d1 11s
   22    3ti iii4s2              4s2
   22    3ti iii4s5s             4s1  5s
   22    3ti iii4s6s             4s1  6s
   22    3ti iii4s7s             4s1  7s
   22    3ti iii4s8s             4s1  8s
   22    3ti iii4s9s             4s1  9s
   22    3ti iii4s10s            4s1 10s
   22    3ti iii4s11s            4s1 11s
   22    3ti iii3d5g             3d1  5g
   22    3ti iii3d6g             3d1  6g
   22    3ti iii3d7g             3d1  7g
   22    3ti iii3d8g             3d1  8g
   22    3ti iii3d9g             3d1  9g
   22    3ti iii4s5g             4s1  5g
   22    3ti iii4s6g             4s1  6g
   22    3ti iii4s7g             4s1  7g
   22    3ti iii4s8g             4s1  8g
   22    3ti iii4s9g             4s1  9g
   22    3ti iii3d7i             3d1  7i
   22    3ti iii3d8i             3d1  8i
   22    3ti iii3d9i             3d1  9i
   22    3ti iii4s7i             4s1  7i
   22    3ti iii4s8i             4s1  8i
   22    3ti iii4s9i             4s1  9i
   22    3ti iii4p2              4p2
   22    3ti iii3d4p             3d   4p
   22    3ti iii3d5p             3d   5p
   22    3ti iii3d6p             3d   6p
   22    3ti iii3d7p             3d   7p
   22    3ti iii3d8p             3d   8p
   22    3ti iii3d9p             3d   9p
   22    3ti iii3d10p            3d  10p
   22    3ti iii3d11p            3d  11p
   22    3ti iii4s4p             4s1  4p
   22    3ti iii4s5p             4s1  5p
   22    3ti iii4s6p             4s1  6p
   22    3ti iii4s7p             4s1  7p
   22    3ti iii4s8p             4s1  8p
   22    3ti iii4s9p             4s1  9p
   22    3ti iii4s10p            4s1 10p
   22    3ti iii4s11p            4s1 11p
   22    3ti iii3d4f             3d1  4f
   22    3ti iii3d5f             3d1  5f
   22    3ti iii3d6f             3d1  6f
   22    3ti iii3d7f             3d1  7f
   22    3ti iii3d8f             3d1  8f
   22    3ti iii3d9f             3d1  9f
   22    3ti iii3d10f            3d1 10f
   22    3ti iii3d11f            3d1 11f
   22    3ti iii4s4f             4s1  4f
   22    3ti iii4s5f             4s1  5f
   22    3ti iii4s6f             4s1  6f
   22    3ti iii4s7f             4s1  7f
   22    3ti iii4s8f             4s1  8f
   22    3ti iii4s9f             4s1  9f
   22    3ti iii4s10f            4s1 10f
   22    3ti iii4s11f            4s1 11f
   22    3ti iii3d6h             3d1  6h
   22    3ti iii3d7h             3d1  7h
   22    3ti iii3d8h             3d1  8h
   22    3ti iii3d9h             3d1  9h
   22    3ti iii4s6h             4s1  6h
   22    3ti iii4s7h             4s1  7h
   22    3ti iii4s8h             4s1  8h
   22    3ti iii4s9h             4s1  9h
   22    3ti iii4s8k             4s1  8k
   22    3ti iii4s9k             4s1  9k
   22    3ti iii3d8k             3d1  8k
   22    3ti iii3d9k             3d1  9k
   22    3ti iiip5d3             3p5  3d3
   -1
$run cray:rcn2c
$DELETE POOLG:HF220201.DAT;*
$DELETE POOLG:HF220202.DAT;*
$DELETE POOLG:HF220204.DAT;*
$DELETE POOLG:HF220231.DAT;*
$DELETE POOLG:HF220232.DAT;*
