$set def 1902
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf190207.dat for007
$assign poolg:hf190201.dat for001
$assign poolg:hf190202.dat for002
$assign poolg:hf190204.dat for004
$assign hf1902x.pun for011
$assign hf1902x.rrr for012
$assign hf1902x.dat for013
$assign hf1902xe.dat for014
$assign poolg:hf190231.dat for031
$assign poolg:hf190232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   19    3k iii s2p5             3s2  3p5
   19    3k iii s2p4 4p          3s2  3p4  4p
   19    3k iii s2p4 5p          3s2  3p4  5p
   19    3k iii s2p4 6p          3s2  3p4  6p
   19    3k iii s2p4 7p          3s2  3p4  7p
   19    3k iii s2p4 8p          3s2  3p4  8p
   19    3k iii s2p4 9p          3s2  3p4  9p
   19    3k iii s2p4 10p         3s2  3p4 10p
   19    3k iii s2p4 11p         3s2  3p4 11p
   19    3k iii s2p4 12p         3s2  3p4 12p
   19    3k iii s2p4 4f          3s2  3p4  4f
   19    3k iii s2p4 5f          3s2  3p4  5f
   19    3k iii s2p4 6f          3s2  3p4  6f
   19    3k iii s2p4 7f          3s2  3p4  7f
   19    3k iii s2p4 8f          3s2  3p4  8f
   19    3k iii s2p4 9f          3s2  3p4  9f
   19    3k iii s2p4 10f         3s2  3p4 10f
   19    3k iii s2p4 11f         3s2  3p4 11f
   19    3k iii s2p4 12f         3s2  3p4 12f
   19    3k iii s2p4 6h          3s2  3p4  6h
   19    3k iii s2p4 7h          3s2  3p4  7h
   19    3k iii s2p4 8h          3s2  3p4  8h
   19    3k iii s2p4 9h          3s2  3p4  9h
   19    3k iii s2p4 10h         3s2  3p4 10h
   19    3k iii s2p4 11h         3s2  3p4 11h
   19    3k iii s2p4 12h         3s2  3p4 12h
   19    3k iii s2p4 8k          3s2  3p4  8k
   19    3k iii s2p4 9k          3s2  3p4  9k
   19    3k iii sp5 4s           3s   3p5  4s
   19    3k iii sp5 5s           3s   3p5  5s
   19    3k iii sp5 6s           3s   3p5  6s
   19    3k iii sp5 7s           3s   3p5  7s
   19    3k iii sp5 8s           3s   3p5  8s
   19    3k iii sp5 9s           3s   3p5  9s
   19    3k iii sp5 10s          3s   3p5 10s
   19    3k iii sp5 11s          3s   3p5 11s
   19    3k iii sp5 12s          3s   3p5 12s
   19    3k iii sp5 3d           3s   3p5  3d
   19    3k iii sp5 4d           3s   3p5  4d
   19    3k iii sp5 5d           3s   3p5  5d
   19    3k iii sp5 6d           3s   3p5  6d
   19    3k iii sp5 7d           3s   3p5  7d
   19    3k iii sp5 8d           3s   3p5  8d
   19    3k iii sp5 9d           3s   3p5  9d
   19    3k iii sp5 10d          3s   3p5 10d
   19    3k iii sp5 11d          3s   3p5 11d
   19    3k iii sp5 12d          3s   3p5 12d
   19    3k iii s2p4 4s          3s2  3p4  4s
   19    3k iii s2p4 5s          3s2  3p4  5s
   19    3k iii s2p4 6s          3s2  3p4  6s
   19    3k iii s2p4 7s          3s2  3p4  7s
   19    3k iii s2p4 8s          3s2  3p4  8s
   19    3k iii s2p4 9s          3s2  3p4  9s
   19    3k iii s2p4 10s         3s2  3p4 10s
   19    3k iii s2p4 11s         3s2  3p4 11s
   19    3k iii s2p4 12s         3s2  3p4 12s
   19    3k iii s2p4 3d          3s2  3p4  3d
   19    3k iii s2p4 4d          3s2  3p4  4d
   19    3k iii s2p4 5d          3s2  3p4  5d
   19    3k iii s2p4 6d          3s2  3p4  6d
   19    3k iii s2p4 7d          3s2  3p4  7d
   19    3k iii s2p4 8d          3s2  3p4  8d
   19    3k iii s2p4 9d          3s2  3p4  9d
   19    3k iii s2p4 10d         3s2  3p4 10d
   19    3k iii s2p4 11d         3s2  3p4 11d
   19    3k iii s2p4 12d         3s2  3p4 12d
   19    3k iii s2p4 5g          3s2  3p4  5g
   19    3k iii s2p4 6g          3s2  3p4  6g
   19    3k iii s2p4 7g          3s2  3p4  7g
   19    3k iii s2p4 8g          3s2  3p4  8g
   19    3k iii s2p4 9g          3s2  3p4  9g
   19    3k iii s2p4 10g         3s2  3p4 10g
   19    3k iii s2p4 7i          3s2  3p4  7i
   19    3k iii s2p4 8i          3s2  3p4  8i
   19    3k iii s2p4 9i          3s2  3p4  9i
   19    3k iii sp6              3s   3p6
   19    3k iii sp5 4p           3s   3p5  4p
   19    3k iii sp5 5p           3s   3p5  5p
   19    3k iii sp5 6p           3s   3p5  6p
   19    3k iii sp5 7p           3s   3p5  7p
   19    3k iii sp5 8p           3s   3p5  8p
   19    3k iii sp5 9p           3s   3p5  9p
   19    3k iii sp5 10p          3s   3p5 10p
   19    3k iii sp5 11p          3s   3p5 11p
   19    3k iii sp5 12p          3s   3p5 12p
   19    3k iii sp5 4f           3s   3p5  4f
   19    3k iii sp5 5f           3s   3p5  5f
   19    3k iii sp5 6f           3s   3p5  6f
   19    3k iii sp5 7f           3s   3p5  7f
   19    3k iii sp5 8f           3s   3p5  8f
   19    3k iii sp5 9f           3s   3p5  9f
   19    3k iii sp5 10f          3s   3p5 10f
   19    3k iii sp5 11f          3s   3p5 11f
   19    3k iii sp5 12f          3s   3p5 12f
   -1
$run cray:rcn2c
$DELETE POOLG:HF190201.DAT;*
$DELETE POOLG:HF190202.DAT;*
$DELETE POOLG:HF190204.DAT;*
$DELETE POOLG:HF190231.DAT;*
$DELETE POOLG:HF190232.DAT;*
