$set def 3901
$assign sys$input for010
$assign sys$output for009
$assign 3901:hf390107.dat for007
$assign 3901:hf390101.dat for001
$assign 3901:hf390102.dat for002
$assign 3901:hf390104.dat for004
$assign hf3901w.pun for011
$assign hf3901w.rrr for012
$assign hf3901w.dat for013
$assign hf3901we.dat for014
$assign poolg:hf390131.dat for031
$assign poolg:hf390132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   39    2y ii  4d5s             4d1  5s
   39    2y ii  4d6s             4d1  6s
   39    2y ii  4d7s             4d1  7s
   39    2y ii  4d8s             4d1  8s
   39    2y ii  4d9s             4d1  9s
   39    2y ii  4d10s            4d1 10s
   39    2y ii  4d11s            4d1 11s
   39    2y ii  4d12s            4d1 12s
   39    2y ii  4d13s            4d1 13s
   39    2y ii  4d14s            4d1 14s
   39    2y ii  5s2              5s2
   39    2y ii  5s6s             5s1  6s
   39    2y ii  5s7s             5s1  7s
   39    2y ii  5s8s             5s1  8s
   39    2y ii  5s9s             5s1  9s
   39    2y ii  5s10s            5s1 10s
   39    2y ii  5s11s            5s1 11s
   39    2y ii  5s12s            5s1 12s
   39    2y ii  5s13s            5s1 13s
   39    2y ii  5s14s            5s1 14s
   39    2y ii  4d2              4d2
   39    2y ii  4d5d             4d1  5d
   39    2y ii  4d6d             4d1  6d
   39    2y ii  4d7d             4d1  7d
   39    2y ii  4d8d             4d1  8d
   39    2y ii  4d9d             4d1  9d
   39    2y ii  4d10d            4d1 10d
   39    2y ii  4d11d            4d1 11d
   39    2y ii  4d12d            4d1 12d
   39    2y ii  4d13d            4d1 13d
   39    2y ii  4d14d            4d1 14d
   39    2y ii  5s5d             5s1  5d
   39    2y ii  5s6d             5s1  6d
   39    2y ii  5s7d             5s1  7d
   39    2y ii  5s8d             5s1  8d
   39    2y ii  5s9d             5s1  9d
   39    2y ii  5s10d            5s1 10d
   39    2y ii  5s11d            5s1 11d
   39    2y ii  5s12d            5s1 12d
   39    2y ii  5s13d            5s1 13d
   39    2y ii  5s14d            5s1 14d
   39    2y ii  5p2              5p2
   39    2y ii  5p6p             5p   6p
   39    2y ii  5p7p             5p   7p
   39    2y ii  5p8p             5p   8p
   39    2y ii  5p9p             5p   9p
   39    2y ii  5p4f             5p   4f
   39    2y ii  5p5f             5p   5f
   39    2y ii  5p6f             5p   6f
   39    2y ii  5p7f             5p   7f
   39    2y ii  5p8f             5p   8f
   39    2y ii  5p9f             5p   9f
   39    2y ii  4d5p             4d1  5p
   39    2y ii  4d6p             4d1  6p
   39    2y ii  4d7p             4d1  7p
   39    2y ii  4d8p             4d1  8p
   39    2y ii  4d9p             4d1  9p
   39    2y ii  4d10p            4d1 10p
   39    2y ii  4d11p            4d1 11p
   39    2y ii  4d12p            4d1 12p
   39    2y ii  4d13p            4d1 13p
   39    2y ii  4d14p            4d1 14p
   39    2y ii  5s5p             5s1  5p
   39    2y ii  5s6p             5s1  6p
   39    2y ii  5s7p             5s1  7p
   39    2y ii  5s8p             5s1  8p
   39    2y ii  5s9p             5s1  9p
   39    2y ii  5s10p            5s1 10p
   39    2y ii  5s11p            5s1 11p
   39    2y ii  5s12p            5s1 12p
   39    2y ii  5s13p            5s1 13p
   39    2y ii  5s14p            5s1 14p
   39    2y ii  4d4f             4d1  4f
   39    2y ii  4d5f             4d1  5f
   39    2y ii  4d6f             4d1  6f
   39    2y ii  4d7f             4d1  7f
   39    2y ii  4d8f             4d1  8f
   39    2y ii  4d9f             4d1  9f
   39    2y ii  4d10f            4d1 10f
   39    2y ii  4d11f            4d1 11f
   39    2y ii  4d12f            4d1 12f
   39    2y ii  4d13f            4d1 13f
   39    2y ii  4d14f            4d1 14f
   39    2y ii  5s4f             5s1  4f
   39    2y ii  5s5f             5s1  5f
   39    2y ii  5s6f             5s1  6f
   39    2y ii  5s7f             5s1  7f
   39    2y ii  5s8f             5s1  8f
   39    2y ii  5s9f             5s1  9f
   39    2y ii  5s10f            5s1 10f
   39    2y ii  5s11f            5s1 11f
   39    2y ii  5s12f            5s1 12f
   39    2y ii  5s13f            5s1 13f
   39    2y ii  5s14f            5s1 14f
   39    2y ii  5p6s             5p   6s
   39    2y ii  5p7s             5p   7s
   39    2y ii  5p8s             5p   8s
   39    2y ii  5p9s             5p   9s
   39    2y ii  5p5d             5p   5d
   39    2y ii  5p6d             5p   6d
   39    2y ii  5p7d             5p   7d
   39    2y ii  5p8d             5p   8d
   39    2y ii  5p9d             5p   9d
   -1
   -1
$run cray:rcn2c
$DELETE POOLG:HF390101.DAT;*
$DELETE POOLG:HF390102.DAT;*
$DELETE POOLG:HF390104.DAT;*
$DELETE POOLG:HF390131.DAT;*
$DELETE POOLG:HF390132.DAT;*
