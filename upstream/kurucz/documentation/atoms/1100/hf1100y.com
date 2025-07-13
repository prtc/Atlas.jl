$set def 1100
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf110007.dat for007
$assign poolg:hf110001.dat for001
$assign poolg:hf110002.dat for002
$assign poolg:hf110004.dat for004
$assign hf1100y.pun for011
$assign hf1100y.rrr for012
$assign hf1100y.dat for013
$assign hf1100ye.dat for014
$assign poolg:hf110031.dat for031
$assign poolg:hf110032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   11    1na i  2p6 3s           2p6  3s
   11    1na i  2p6 4s           2p6  4s
   11    1na i  2p6 5s           2p6  5s
   11    1na i  2p6 6s           2p6  6s
   11    1na i  2p6 7s           2p6  7s
   11    1na i  2p6 8s           2p6  8s
   11    1na i  2p6 9s           2p6  9s
   11    1na i  2p5 3p4s         2p5  3p   4s
   11    1na i  2p5 3p5s         2p5  3p   5s
   11    1na i  2p5 3p6s         2p5  3p   6s
   11    1na i  2p5 3p7s         2p5  3p   7s
   11    1na i  2p5 3p8s         2p5  3p   8s
   11    1na i  2p5 3p9s         2p5  3p   9s
   11    1na i  2p6 3d           2p6  3d
   11    1na i  2p6 4d           2p6  4d
   11    1na i  2p6 5d           2p6  5d
   11    1na i  2p6 6d           2p6  6d
   11    1na i  2p6 7d           2p6  7d
   11    1na i  2p6 8d           2p6  8d
   11    1na i  2p6 9d           2p6  9d
   11    1na i  2p5 3p4d         2p5  3p   4d
   11    1na i  2p5 3p5d         2p5  3p   5d
   11    1na i  2p5 3p6d         2p5  3p   6d
   11    1na i  2p5 3p7d         2p5  3p   7d
   11    1na i  2p5 3p8d         2p5  3p   8d
   11    1na i  2p5 3p9d         2p5  3p   9d
   11    1na i  2p5 3s3p         2p5  3s   3p
   11    1na i  2p5 3s4p         2p5  3s   4p
   11    1na i  2p5 3s5p         2p5  3s   5p
   11    1na i  2p5 3s6p         2p5  3s   6p
   11    1na i  2p5 3s7p         2p5  3s   7p
   11    1na i  2p5 3s8p         2p5  3s   8p
   11    1na i  2p5 3s9p         2p5  3s   9p
   11    1na i  2p5 3d3p         2p5  3d   3p
   11    1na i  2p5 3d4p         2p5  3d   4p
   11    1na i  2p5 3d5p         2p5  3d   5p
   11    1na i  2p5 3d6p         2p5  3d   6p
   11    1na i  2p5 3d7p         2p5  3d   7p
   11    1na i  2p5 3d8p         2p5  3d   8p
   11    1na i  2p5 3d9p         2p5  3d   9p
   11    1na i  2p6 3p           2p6  3p
   11    1na i  2p6 4p           2p6  4p
   11    1na i  2p6 5p           2p6  5p
   11    1na i  2p6 6p           2p6  6p
   11    1na i  2p6 7p           2p6  7p
   11    1na i  2p6 8p           2p6  8p
   11    1na i  2p6 9p           2p6  9p
   11    1na i  2p5 3p2          2p5  3p2
   11    1na i  2p5 3p4p         2p5  3p   4p
   11    1na i  2p5 3p5p         2p5  3p   5p
   11    1na i  2p5 3p6p         2p5  3p   6p
   11    1na i  2p5 3p7p         2p5  3p   7p
   11    1na i  2p5 3p8p         2p5  3p   8p
   11    1na i  2p5 3p9p         2p5  3p   9p
   11    1na i  2p6 4f           2p6  4f
   11    1na i  2p6 5f           2p6  5f
   11    1na i  2p6 6f           2p6  6f
   11    1na i  2p6 7f           2p6  7f
   11    1na i  2p6 8f           2p6  8f
   11    1na i  2p6 9f           2p6  9f
   11    1na i  2p5 3p4f         2p5  3p   4f
   11    1na i  2p5 3p5f         2p5  3p   5f
   11    1na i  2p5 3p6f         2p5  3p   6f
   11    1na i  2p5 3p7f         2p5  3p   7f
   11    1na i  2p5 3p8f         2p5  3p   8f
   11    1na i  2p5 3p9f         2p5  3p   9f
   11    1na i  2p5 3s2          2p5  3s2
   11    1na i  2p5 3s4s         2p5  3s   4s
   11    1na i  2p5 3s5s         2p5  3s   5s
   11    1na i  2p5 3s6s         2p5  3s   6s
   11    1na i  2p5 3s7s         2p5  3s   7s
   11    1na i  2p5 3s8s         2p5  3s   8s
   11    1na i  2p5 3s9s         2p5  3s   9s
   11    1na i  2p5 3d4s         2p5  3d   4s
   11    1na i  2p5 3d5s         2p5  3d   5s
   11    1na i  2p5 3d6s         2p5  3d   6s
   11    1na i  2p5 3d7s         2p5  3d   7s
   11    1na i  2p5 3d8s         2p5  3d   8s
   11    1na i  2p5 3d9s         2p5  3d   9s
   11    1na i  2p5 3s3d         2p5  3s   3d
   11    1na i  2p5 3s4d         2p5  3s   4d
   11    1na i  2p5 3s5d         2p5  3s   5d
   11    1na i  2p5 3s6d         2p5  3s   6d
   11    1na i  2p5 3s7d         2p5  3s   7d
   11    1na i  2p5 3s8d         2p5  3s   8d
   11    1na i  2p5 3s9d         2p5  3s   9d
   11    1na i  2p5 3d2          2p5  3d2
   11    1na i  2p5 3d4d         2p5  3d   4d
   11    1na i  2p5 3d5d         2p5  3d   5d
   11    1na i  2p5 3d6d         2p5  3d   6d
   11    1na i  2p5 3d7d         2p5  3d   7d
   11    1na i  2p5 3d8d         2p5  3d   8d
   11    1na i  2p5 3d9d         2p5  3d   9d
   -1
$run cray:rcn2c
$DELETE POOLG:HF110001.DAT;*
$DELETE POOLG:HF110002.DAT;*
$DELETE POOLG:HF110004.DAT;*
$DELETE POOLG:HF110031.DAT;*
$DELETE POOLG:HF110032.DAT;*
