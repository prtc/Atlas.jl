$set def 2205
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf220507.dat for007
$assign poolg:hf220501.dat for001
$assign poolg:hf220502.dat for002
$assign poolg:hf220504.dat for004
$assign hf2205y.pun for011
$assign hf2205y.rrr for012
$assign hf2205y.dat for013
$assign hf2205ye.dat for014
$assign poolg:hf220531.dat for031
$assign poolg:hf220532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   22    6ti vi s2p5             3s2  3p5
   22    6ti vi s2p4 4p          3s2  3p4  4p
   22    6ti vi s2p4 5p          3s2  3p4  5p
   22    6ti vi s2p4 6p          3s2  3p4  6p
   22    6ti vi s2p4 7p          3s2  3p4  7p
   22    6ti vi s2p4 8p          3s2  3p4  8p
   22    6ti vi s2p4 9p          3s2  3p4  9p
   22    6ti vi s2p4 10p         3s2  3p4 10p
   22    6ti vi s2p4 11p         3s2  3p4 11p
   22    6ti vi s2p4 12p         3s2  3p4 12p
   22    6ti vi s2p4 4f          3s2  3p4  4f
   22    6ti vi s2p4 5f          3s2  3p4  5f
   22    6ti vi s2p4 6f          3s2  3p4  6f
   22    6ti vi s2p4 7f          3s2  3p4  7f
   22    6ti vi s2p4 8f          3s2  3p4  8f
   22    6ti vi s2p4 9f          3s2  3p4  9f
   22    6ti vi s2p4 10f         3s2  3p4 10f
   22    6ti vi s2p4 11f         3s2  3p4 11f
   22    6ti vi s2p4 12f         3s2  3p4 12f
   22    6ti vi sp5 4s           3s   3p5  4s
   22    6ti vi sp5 5s           3s   3p5  5s
   22    6ti vi sp5 6s           3s   3p5  6s
   22    6ti vi sp5 7s           3s   3p5  7s
   22    6ti vi sp5 8s           3s   3p5  8s
   22    6ti vi sp5 9s           3s   3p5  9s
   22    6ti vi sp5 10s          3s   3p5 10s
   22    6ti vi sp5 11s          3s   3p5 11s
   22    6ti vi sp5 12s          3s   3p5 12s
   22    6ti vi sp5 3d           3s   3p5  3d
   22    6ti vi sp5 4d           3s   3p5  4d
   22    6ti vi sp5 5d           3s   3p5  5d
   22    6ti vi sp5 6d           3s   3p5  6d
   22    6ti vi sp5 7d           3s   3p5  7d
   22    6ti vi sp5 8d           3s   3p5  8d
   22    6ti vi sp5 9d           3s   3p5  9d
   22    6ti vi sp5 10d          3s   3p5 10d
   22    6ti vi sp5 11d          3s   3p5 11d
   22    6ti vi sp5 12d          3s   3p5 12d
   22    6ti vi p6 4p            3s0  3p6  4p
   22    6ti vi p6 4f            3s0  3p6  4f
   22    6ti vi s2p3 3d2         3s2  3p3  3d2
   22    6ti vi s2p3 3d4s        3s2  3p3  3d   4s
   22    6ti vi s2p3 4s2         3s2  3p3  4s2
   22    6ti vi p5 3d2           3s0  3p5  3d2
   22    6ti vi s2p4 4s          3s2  3p4  4s
   22    6ti vi s2p4 5s          3s2  3p4  5s
   22    6ti vi s2p4 6s          3s2  3p4  6s
   22    6ti vi s2p4 7s          3s2  3p4  7s
   22    6ti vi s2p4 8s          3s2  3p4  8s
   22    6ti vi s2p4 9s          3s2  3p4  9s
   22    6ti vi s2p4 10s         3s2  3p4 10s
   22    6ti vi s2p4 11s         3s2  3p4 11s
   22    6ti vi s2p4 12s         3s2  3p4 12s
   22    6ti vi s2p4 3d          3s2  3p4  3d
   22    6ti vi s2p4 4d          3s2  3p4  4d
   22    6ti vi s2p4 5d          3s2  3p4  5d
   22    6ti vi s2p4 6d          3s2  3p4  6d
   22    6ti vi s2p4 7d          3s2  3p4  7d
   22    6ti vi s2p4 8d          3s2  3p4  8d
   22    6ti vi s2p4 9d          3s2  3p4  9d
   22    6ti vi s2p4 10d         3s2  3p4 10d
   22    6ti vi s2p4 11d         3s2  3p4 11d
   22    6ti vi s2p4 12d         3s2  3p4 12d
   22    6ti vi sp6              3s   3p6
   22    6ti vi sp5 4p           3s   3p5  4p
   22    6ti vi sp5 5p           3s   3p5  5p
   22    6ti vi sp5 6p           3s   3p5  6p
   22    6ti vi sp5 7p           3s   3p5  7p
   22    6ti vi sp5 8p           3s   3p5  8p
   22    6ti vi sp5 9p           3s   3p5  9p
   22    6ti vi sp5 10p          3s   3p5 10p
   22    6ti vi sp5 11p          3s   3p5 11p
   22    6ti vi sp5 12p          3s   3p5 12p
   22    6ti vi sp5 4f           3s   3p5  4f
   22    6ti vi sp5 5f           3s   3p5  5f
   22    6ti vi sp5 6f           3s   3p5  6f
   22    6ti vi sp5 7f           3s   3p5  7f
   22    6ti vi sp5 8f           3s   3p5  8f
   22    6ti vi sp5 9f           3s   3p5  9f
   22    6ti vi sp5 10f          3s   3p5 10f
   22    6ti vi sp5 11f          3s   3p5 11f
   22    6ti vi sp5 12f          3s   3p5 12f
   22    6ti vi p6 4s            3s0  3p6  4s
   22    6ti vi p6 3d            3s0  3p6  3d
   22    6ti vi p6 4d            3s0  3p6  4d
   22    6ti vi s2p3 3d4p        3s2  3p3  3d   4p
   22    6ti vi s2p3 4s4p        3s2  3p3  4s   4p
   22    6ti vi sp4 3d2          3s   3p4  3d2
   22    6ti vi sp4 3d4s         3s   3p4  3d   4s
   22    6ti vi sp4 4s2          3s   3p4  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF220501.DAT;*
$DELETE POOLG:HF220502.DAT;*
$DELETE POOLG:HF220504.DAT;*
$DELETE POOLG:HF220531.DAT;*
$DELETE POOLG:HF220532.DAT;*
