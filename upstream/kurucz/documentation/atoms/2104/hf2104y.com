$set def 2104
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf210407.dat for007
$assign poolg:hf210401.dat for001
$assign poolg:hf210402.dat for002
$assign poolg:hf210404.dat for004
$assign hf2104y.pun for011
$assign hf2104y.rrr for012
$assign hf2104y.dat for013
$assign hf2104ye.dat for014
$assign poolg:hf210431.dat for031
$assign poolg:hf210432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   21    5sc v  s2p5             3s2  3p5
   21    5sc v  s2p4 4p          3s2  3p4  4p
   21    5sc v  s2p4 5p          3s2  3p4  5p
   21    5sc v  s2p4 6p          3s2  3p4  6p
   21    5sc v  s2p4 7p          3s2  3p4  7p
   21    5sc v  s2p4 8p          3s2  3p4  8p
   21    5sc v  s2p4 9p          3s2  3p4  9p
   21    5sc v  s2p4 10p         3s2  3p4 10p
   21    5sc v  s2p4 11p         3s2  3p4 11p
   21    5sc v  s2p4 12p         3s2  3p4 12p
   21    5sc v  s2p4 4f          3s2  3p4  4f
   21    5sc v  s2p4 5f          3s2  3p4  5f
   21    5sc v  s2p4 6f          3s2  3p4  6f
   21    5sc v  s2p4 7f          3s2  3p4  7f
   21    5sc v  s2p4 8f          3s2  3p4  8f
   21    5sc v  s2p4 9f          3s2  3p4  9f
   21    5sc v  s2p4 10f         3s2  3p4 10f
   21    5sc v  s2p4 11f         3s2  3p4 11f
   21    5sc v  s2p4 12f         3s2  3p4 12f
   21    5sc v  sp5 4s           3s   3p5  4s
   21    5sc v  sp5 5s           3s   3p5  5s
   21    5sc v  sp5 6s           3s   3p5  6s
   21    5sc v  sp5 7s           3s   3p5  7s
   21    5sc v  sp5 8s           3s   3p5  8s
   21    5sc v  sp5 9s           3s   3p5  9s
   21    5sc v  sp5 10s          3s   3p5 10s
   21    5sc v  sp5 11s          3s   3p5 11s
   21    5sc v  sp5 12s          3s   3p5 12s
   21    5sc v  sp5 3d           3s   3p5  3d
   21    5sc v  sp5 4d           3s   3p5  4d
   21    5sc v  sp5 5d           3s   3p5  5d
   21    5sc v  sp5 6d           3s   3p5  6d
   21    5sc v  sp5 7d           3s   3p5  7d
   21    5sc v  sp5 8d           3s   3p5  8d
   21    5sc v  sp5 9d           3s   3p5  9d
   21    5sc v  sp5 10d          3s   3p5 10d
   21    5sc v  sp5 11d          3s   3p5 11d
   21    5sc v  sp5 12d          3s   3p5 12d
   21    5sc v  p6 4p            3s0  3p6  4p
   21    5sc v  p6 4f            3s0  3p6  4f
   21    5sc v  s2p3 3d2         3s2  3p3  3d2
   21    5sc v  s2p3 3d4s        3s2  3p3  3d   4s
   21    5sc v  s2p3 4s2         3s2  3p3  4s2
   21    5sc v  p5 3d2           3s0  3p5  3d2
   21    5sc v  s2p4 4s          3s2  3p4  4s
   21    5sc v  s2p4 5s          3s2  3p4  5s
   21    5sc v  s2p4 6s          3s2  3p4  6s
   21    5sc v  s2p4 7s          3s2  3p4  7s
   21    5sc v  s2p4 8s          3s2  3p4  8s
   21    5sc v  s2p4 9s          3s2  3p4  9s
   21    5sc v  s2p4 10s         3s2  3p4 10s
   21    5sc v  s2p4 11s         3s2  3p4 11s
   21    5sc v  s2p4 12s         3s2  3p4 12s
   21    5sc v  s2p4 3d          3s2  3p4  3d
   21    5sc v  s2p4 4d          3s2  3p4  4d
   21    5sc v  s2p4 5d          3s2  3p4  5d
   21    5sc v  s2p4 6d          3s2  3p4  6d
   21    5sc v  s2p4 7d          3s2  3p4  7d
   21    5sc v  s2p4 8d          3s2  3p4  8d
   21    5sc v  s2p4 9d          3s2  3p4  9d
   21    5sc v  s2p4 10d         3s2  3p4 10d
   21    5sc v  s2p4 11d         3s2  3p4 11d
   21    5sc v  s2p4 12d         3s2  3p4 12d
   21    5sc v  sp6              3s   3p6
   21    5sc v  sp5 4p           3s   3p5  4p
   21    5sc v  sp5 5p           3s   3p5  5p
   21    5sc v  sp5 6p           3s   3p5  6p
   21    5sc v  sp5 7p           3s   3p5  7p
   21    5sc v  sp5 8p           3s   3p5  8p
   21    5sc v  sp5 9p           3s   3p5  9p
   21    5sc v  sp5 10p          3s   3p5 10p
   21    5sc v  sp5 11p          3s   3p5 11p
   21    5sc v  sp5 12p          3s   3p5 12p
   21    5sc v  sp5 4f           3s   3p5  4f
   21    5sc v  sp5 5f           3s   3p5  5f
   21    5sc v  sp5 6f           3s   3p5  6f
   21    5sc v  sp5 7f           3s   3p5  7f
   21    5sc v  sp5 8f           3s   3p5  8f
   21    5sc v  sp5 9f           3s   3p5  9f
   21    5sc v  sp5 10f          3s   3p5 10f
   21    5sc v  sp5 11f          3s   3p5 11f
   21    5sc v  sp5 12f          3s   3p5 12f
   21    5sc v  p6 4s            3s0  3p6  4s
   21    5sc v  p6 3d            3s0  3p6  3d
   21    5sc v  p6 4d            3s0  3p6  4d
   21    5sc v  s2p3 3d4p        3s2  3p3  3d   4p
   21    5sc v  s2p3 4s4p        3s2  3p3  4s   4p
   21    5sc v  sp4 3d2          3s   3p4  3d2
   21    5sc v  sp4 3d4s         3s   3p4  3d   4s
   21    5sc v  sp4 4s2          3s   3p4  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF210401.DAT;*
$DELETE POOLG:HF210402.DAT;*
$DELETE POOLG:HF210404.DAT;*
$DELETE POOLG:HF210431.DAT;*
$DELETE POOLG:HF210432.DAT;*
