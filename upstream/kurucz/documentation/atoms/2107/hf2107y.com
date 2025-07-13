$set def 2107
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf210707.dat for007
$assign poolg:hf210701.dat for001
$assign poolg:hf210702.dat for002
$assign poolg:hf210704.dat for004
$assign hf2107y.pun for011
$assign hf2107y.rrr for012
$assign hf2107y.dat for013
$assign hf2107ye.dat for014
$assign poolg:hf210731.dat for031
$assign poolg:hf210732.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   21    8scviii s2p2            3s2  3p2
   21    8scviii s2p 4p          3s2  3p   4p
   21    8scviii s2p 5p          3s2  3p   5p
   21    8scviii s2p 6p          3s2  3p   6p
   21    8scviii s2p 7p          3s2  3p   7p
   21    8scviii s2p 8p          3s2  3p   8p
   21    8scviii s2p 9p          3s2  3p   9p
   21    8scviii s2p 10p         3s2  3p  10p
   21    8scviii p4              3s0  3p4
   21    8scviii p3 4p           3s0  3p3  4p
   21    8scviii p3 5p           3s0  3p3  5p
   21    8scviii p3 6p           3s0  3p3  6p
   21    8scviii p3 7p           3s0  3p3  7p
   21    8scviii p3 8p           3s0  3p3  8p
   21    8scviii p3 9p           3s0  3p3  9p
   21    8scviii p3 10p          3s0  3p3 10p
   21    8scviii s2p 4f          3s2  3p   4f
   21    8scviii s2p 5f          3s2  3p   5f
   21    8scviii s2p 6f          3s2  3p   6f
   21    8scviii s2p 7f          3s2  3p   7f
   21    8scviii s2p 8f          3s2  3p   8f
   21    8scviii s2p 9f          3s2  3p   9f
   21    8scviii s2p 10f         3s2  3p  10f
   21    8scviii p3 4f           3s0  3p3  4f
   21    8scviii p3 5f           3s0  3p3  5f
   21    8scviii p3 6f           3s0  3p3  6f
   21    8scviii p3 7f           3s0  3p3  7f
   21    8scviii p3 8f           3s0  3p3  8f
   21    8scviii p3 9f           3s0  3p3  9f
   21    8scviii p3 10f          3s0  3p3 10f
   21    8scviii sp2 4s          3s   3p2  4s
   21    8scviii sp2 5s          3s   3p2  5s
   21    8scviii sp2 6s          3s   3p2  6s
   21    8scviii sp2 7s          3s   3p2  7s
   21    8scviii sp2 8s          3s   3p2  8s
   21    8scviii sp2 9s          3s   3p2  9s
   21    8scviii sp2 10s         3s   3p2 10s
   21    8scviii sp2 3d          3s   3p2  3d
   21    8scviii sp2 4d          3s   3p2  4d
   21    8scviii sp2 5d          3s   3p2  5d
   21    8scviii sp2 6d          3s   3p2  6d
   21    8scviii sp2 7d          3s   3p2  7d
   21    8scviii sp2 8d          3s   3p2  8d
   21    8scviii sp2 9d          3s   3p2  9d
   21    8scviii sp2 10d         3s   3p2 10d
   21    8scviii p2 3d2          3s0  3p2  3d2
   21    8scviii p2 3d4s         3s0  3p2  3d   4s
   21    8scviii p2 4s2          3s0  3p2  4s2
   21    8scviii s2 3d2          3s2  3p0  3d2
   21    8scviii s2 3d4s         3s2  3p0  3d   4s
   21    8scviii s2 4s2          3s2  3p0  4s2
   21    8scviii s2p 4s          3s2  3p   4s
   21    8scviii s2p 5s          3s2  3p   5s
   21    8scviii s2p 6s          3s2  3p   6s
   21    8scviii s2p 7s          3s2  3p   7s
   21    8scviii s2p 8s          3s2  3p   8s
   21    8scviii s2p 9s          3s2  3p   9s
   21    8scviii s2p 10s         3s2  3p  10s
   21    8scviii p3 4s           3s0  3p3  4s
   21    8scviii p3 5s           3s0  3p3  5s
   21    8scviii p3 6s           3s0  3p3  6s
   21    8scviii p3 7s           3s0  3p3  7s
   21    8scviii p3 8s           3s0  3p3  8s
   21    8scviii p3 9s           3s0  3p3  9s
   21    8scviii p3 10s          3s0  3p3 10s
   21    8scviii s2p 3d          3s2  3p   3d
   21    8scviii s2p 4d          3s2  3p   4d
   21    8scviii s2p 5d          3s2  3p   5d
   21    8scviii s2p 6d          3s2  3p   6d
   21    8scviii s2p 7d          3s2  3p   7d
   21    8scviii s2p 8d          3s2  3p   8d
   21    8scviii s2p 9d          3s2  3p   9d
   21    8scviii s2p 10d         3s2  3p  10d
   21    8scviii p3 3d           3s0  3p3  3d
   21    8scviii p3 4d           3s0  3p3  4d
   21    8scviii p3 5d           3s0  3p3  5d
   21    8scviii p3 6d           3s0  3p3  6d
   21    8scviii p3 7d           3s0  3p3  7d
   21    8scviii p3 8d           3s0  3p3  8d
   21    8scviii p3 9d           3s0  3p3  9d
   21    8scviii p3 10d          3s0  3p3 10d
   21    8scviii sp3             3s   3p3
   21    8scviii sp2 4p          3s   3p2  4p
   21    8scviii sp2 5p          3s   3p2  5p
   21    8scviii sp2 6p          3s   3p2  6p
   21    8scviii sp2 7p          3s   3p2  7p
   21    8scviii sp2 8p          3s   3p2  8p
   21    8scviii sp2 9p          3s   3p2  9p
   21    8scviii sp2 10p         3s   3p2 10p
   21    8scviii sp2 4f          3s   3p2  4f
   21    8scviii sp2 5f          3s   3p2  5f
   21    8scviii sp2 6f          3s   3p2  6f
   21    8scviii sp2 7f          3s   3p2  7f
   21    8scviii sp2 8f          3s   3p2  8f
   21    8scviii sp2 9f          3s   3p2  9f
   21    8scviii sp2 10f         3s   3p2 10f
   -1
$run cray:rcn2c
$DELETE POOLG:HF210701.DAT;*
$DELETE POOLG:HF210702.DAT;*
$DELETE POOLG:HF210704.DAT;*
$DELETE POOLG:HF210731.DAT;*
$DELETE POOLG:HF210732.DAT;*
