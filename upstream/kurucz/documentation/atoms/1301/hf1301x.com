$set def 1301
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf130107.dat for007
$assign poolg:hf130101.dat for001
$assign poolg:hf130102.dat for002
$assign poolg:hf130104.dat for004
$assign hf1301x.pun for011
$assign hf1301x.rrr for012
$assign hf1301x.dat for013
$assign hf1301xe.dat for014
$assign poolg:hf130131.dat for031
$assign poolg:hf130132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   13    2al ii  3s2             3s2
   13    2al ii  3s4s            3s   4s
   13    2al ii  3s5s            3s   5s
   13    2al ii  3s6s            3s   6s
   13    2al ii  3s7s            3s   7s
   13    2al ii  3s8s            3s   8s
   13    2al ii  3s9s            3s   9s
   13    2al ii  3s10s           3s  10s
   13    2al ii  3s11s           3s  11s
   13    2al ii  3s12s           3s  12s
   13    2al ii  3s13s           3s  13s
   13    2al ii  3s14s           3s  14s
   13    2al ii  3s15s           3s  15s
   13    2al ii  3s16s           3s  16s
   13    2al ii  3d4s            3d   4s
   13    2al ii  3d5s            3d   5s
   13    2al ii  3d6s            3d   6s
   13    2al ii  3d7s            3d   7s
   13    2al ii  3d8s            3d   8s
   13    2al ii  3d9s            3d   9s
   13    2al ii  3d10s           3d  10s
   13    2al ii  3d11s           3d  11s
   13    2al ii  3d12s           3d  12s
   13    2al ii  3d13s           3d  13s
   13    2al ii  3d14s           3d  14s
   13    2al ii  3d15s           3d  15s
   13    2al ii  3d16s           3d  16s
   13    2al ii  3s3d            3s   3d
   13    2al ii  3s4d            3s   4d
   13    2al ii  3s5d            3s   5d
   13    2al ii  3s6d            3s   6d
   13    2al ii  3s7d            3s   7d
   13    2al ii  3s8d            3s   8d
   13    2al ii  3s9d            3s   9d
   13    2al ii  3s10d           3s  10d
   13    2al ii  3s11d           3s  11d
   13    2al ii  3s12d           3s  12d
   13    2al ii  3s13d           3s  13d
   13    2al ii  3s14d           3s  14d
   13    2al ii  3d2             3d2   
   13    2al ii  3d4d            3d   4d
   13    2al ii  3d5d            3d   5d
   13    2al ii  3d6d            3d   6d
   13    2al ii  3d7d            3d   7d
   13    2al ii  3d8d            3d   8d
   13    2al ii  3d9d            3d   9d
   13    2al ii  3d10d           3d  10d
   13    2al ii  3d11d           3d  11d
   13    2al ii  3d12d           3d  12d
   13    2al ii  3d13d           3d  13d
   13    2al ii  3d14d           3d  14d
   13    2al ii  3s5g            3s   5g
   13    2al ii  3s6g            3s   6g
   13    2al ii  3s7g            3s   7g
   13    2al ii  3s8g            3s   8g
   13    2al ii  3s9g            3s   9g
   13    2al ii  3s10g           3s  10g
   13    2al ii  3s11g           3s  11g
   13    2al ii  3s12g           3s  12g
   13    2al ii  3s13g           3s  13g
   13    2al ii  3s7i            3s   7i
   13    2al ii  3s8i            3s   8i
   13    2al ii  3s9i            3s   9i
   13    2al ii  3p2             3p2   
   13    2al ii  3p4p            3p   4p   
   13    2al ii  3p5p            3p   5p   
   13    2al ii  3p6p            3p   6p   
   13    2al ii  3p7p            3p   7p   
   13    2al ii  3p8p            3p   8p   
   13    2al ii  3p9p            3p   9p   
   13    2al ii  3s3p            3s   3p
   13    2al ii  3s4p            3s   4p
   13    2al ii  3s5p            3s   5p
   13    2al ii  3s6p            3s   6p
   13    2al ii  3s7p            3s   7p
   13    2al ii  3s8p            3s   8p
   13    2al ii  3s9p            3s   9p
   13    2al ii  3s10p           3s  10p
   13    2al ii  3s11p           3s  11p
   13    2al ii  3s12p           3s  12p
   13    2al ii  3s13p           3s  13p
   13    2al ii  3s14p           3s  14p
   13    2al ii  3s15p           3s  15p
   13    2al ii  3s16p           3s  16p
   13    2al ii  3s17p           3s  17p
   13    2al ii  3d3p            3d   3p
   13    2al ii  3d4p            3d   4p
   13    2al ii  3d5p            3d   5p
   13    2al ii  3d6p            3d   6p
   13    2al ii  3d7p            3d   7p
   13    2al ii  3d8p            3d   8p
   13    2al ii  3d9p            3d   9p
   13    2al ii  3d10p           3d  10p
   13    2al ii  3d11p           3d  11p
   13    2al ii  3d12p           3d  12p
   13    2al ii  3d13p           3d  13p
   13    2al ii  3d14p           3d  14p
   13    2al ii  3d15p           3d  15p
   13    2al ii  3d16p           3d  16p
   13    2al ii  3d17p           3d  17p
   13    2al ii  3s4f            3s   4f
   13    2al ii  3s5f            3s   5f
   13    2al ii  3s6f            3s   6f
   13    2al ii  3s7f            3s   7f
   13    2al ii  3s8f            3s   8f
   13    2al ii  3s9f            3s   9f
   13    2al ii  3s10f           3s  10f
   13    2al ii  3s11f           3s  11f
   13    2al ii  3s12f           3s  12f
   13    2al ii  3s13f           3s  13f
   13    2al ii  3s14f           3s  14f
   13    2al ii  3s15f           3s  15f
   13    2al ii  3s16f           3s  16f
   13    2al ii  3s17f           3s  17f
   13    2al ii  3s18f           3s  18f
   13    2al ii  3s19f           3s  19f
   13    2al ii  3s20f           3s  20f
   13    2al ii  3d4f            3d   4f
   13    2al ii  3d5f            3d   5f
   13    2al ii  3d6f            3d   6f
   13    2al ii  3d7f            3d   7f
   13    2al ii  3d8f            3d   8f
   13    2al ii  3d9f            3d   9f
   13    2al ii  3d10f           3d  10f
   13    2al ii  3d11f           3d  11f
   13    2al ii  3d12f           3d  12f
   13    2al ii  3d13f           3d  13f
   13    2al ii  3d14f           3d  14f
   13    2al ii  3d15f           3d  15f
   13    2al ii  3d16f           3d  16f
   13    2al ii  3d17f           3d  17f
   13    2al ii  3d18f           3d  18f
   13    2al ii  3d19f           3d  19f
   13    2al ii  3d20f           3d  20f
   13    2al ii  3s6h            3s   6h
   13    2al ii  3s7h            3s   7h
   13    2al ii  3s8h            3s   8h
   13    2al ii  3s9h            3s   9h
   13    2al ii  3s10h           3s  10h
   13    2al ii  3s8k            3s   8k
   13    2al ii  3s9k            3s   9k
   13    2al ii  3p4s            3p   4s
   13    2al ii  3p5s            3p   5s
   13    2al ii  3p6s            3p   6s
   13    2al ii  3p7s            3p   7s
   13    2al ii  3p8s            3p   8s
   13    2al ii  3p9s            3p   9s
   -1
$run cray:rcn2c
$DELETE POOLG:HF130101.DAT;*
$DELETE POOLG:HF130102.DAT;*
$DELETE POOLG:HF130104.DAT;*
$DELETE POOLG:HF130131.DAT;*
$DELETE POOLG:HF130132.DAT;*
