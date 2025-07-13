$set def 1102
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf110207.dat for007
$assign poolg:hf110201.dat for001
$assign poolg:hf110202.dat for002
$assign poolg:hf110204.dat for004
$assign hf1102x.pun for011
$assign hf1102x.rrr for012
$assign hf1102x.dat for013
$assign hf1102xe.dat for014
$assign poolg:hf110231.dat for031
$assign poolg:hf110232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   11    3na iii s2p5            2s2  2p5
   11    3na iii s2p4 3p         2s2  2p4  3p
   11    3na iii s2p4 4p         2s2  2p4  4p
   11    3na iii s2p4 5p         2s2  2p4  5p
   11    3na iii s2p4 6p         2s2  2p4  6p
   11    3na iii s2p4 7p         2s2  2p4  7p
   11    3na iii s2p4 8p         2s2  2p4  8p
   11    3na iii s2p4 9p         2s2  2p4  9p
   11    3na iii s2p4 10p        2s2  2p4 10p
   11    3na iii s2p4 11p        2s2  2p4 11p
   11    3na iii s2p4 12p        2s2  2p4 12p
   11    3na iii s2p4 4f         2s2  2p4  4f
   11    3na iii s2p4 5f         2s2  2p4  5f
   11    3na iii s2p4 6f         2s2  2p4  6f
   11    3na iii s2p4 7f         2s2  2p4  7f
   11    3na iii s2p4 8f         2s2  2p4  8f
   11    3na iii s2p4 9f         2s2  2p4  9f
   11    3na iii s2p4 10f        2s2  2p4 10f
   11    3na iii s2p4 11f        2s2  2p4 11f
   11    3na iii s2p4 12f        2s2  2p4 12f
   11    3na iii s2p4 6h         2s2  2p4  6h
   11    3na iii s2p4 7h         2s2  2p4  7h
   11    3na iii s2p4 8h         2s2  2p4  8h
   11    3na iii s2p4 9h         2s2  2p4  9h
   11    3na iii s2p4 8k         2s2  2p4  8k
   11    3na iii s2p4 9k         2s2  2p4  9k
   11    3na iii sp5 3s          2s   2p5  3s
   11    3na iii sp5 4s          2s   2p5  4s
   11    3na iii sp5 5s          2s   2p5  5s
   11    3na iii sp5 6s          2s   2p5  6s
   11    3na iii sp5 7s          2s   2p5  7s
   11    3na iii sp5 8s          2s   2p5  8s
   11    3na iii sp5 9s          2s   2p5  9s
   11    3na iii sp5 10s         2s   2p5 10s
   11    3na iii sp5 11s         2s   2p5 11s
   11    3na iii sp5 12s         2s   2p5 12s
   11    3na iii sp5 3d          2s   2p5  3d
   11    3na iii sp5 4d          2s   2p5  4d
   11    3na iii sp5 5d          2s   2p5  5d
   11    3na iii sp5 6d          2s   2p5  6d
   11    3na iii sp5 7d          2s   2p5  7d
   11    3na iii sp5 8d          2s   2p5  8d
   11    3na iii sp5 9d          2s   2p5  9d
   11    3na iii sp5 10d         2s   2p5 10d
   11    3na iii sp5 11d         2s   2p5 11d
   11    3na iii sp5 12d         2s   2p5 12d
   11    3na iii s2p4 3s         2s2  2p4  3s
   11    3na iii s2p4 4s         2s2  2p4  4s
   11    3na iii s2p4 5s         2s2  2p4  5s
   11    3na iii s2p4 6s         2s2  2p4  6s
   11    3na iii s2p4 7s         2s2  2p4  7s
   11    3na iii s2p4 8s         2s2  2p4  8s
   11    3na iii s2p4 9s         2s2  2p4  9s
   11    3na iii s2p4 10s        2s2  2p4 10s
   11    3na iii s2p4 11s        2s2  2p4 11s
   11    3na iii s2p4 12s        2s2  2p4 12s
   11    3na iii s2p4 3d         2s2  2p4  3d
   11    3na iii s2p4 4d         2s2  2p4  4d
   11    3na iii s2p4 5d         2s2  2p4  5d
   11    3na iii s2p4 6d         2s2  2p4  6d
   11    3na iii s2p4 7d         2s2  2p4  7d
   11    3na iii s2p4 8d         2s2  2p4  8d
   11    3na iii s2p4 9d         2s2  2p4  9d
   11    3na iii s2p4 10d        2s2  2p4 10d
   11    3na iii s2p4 11d        2s2  2p4 11d
   11    3na iii s2p4 12d        2s2  2p4 12d
   11    3na iii s2p4 5g         2s2  2p4  5g
   11    3na iii s2p4 6g         2s2  2p4  6g
   11    3na iii s2p4 7g         2s2  2p4  7g
   11    3na iii s2p4 8g         2s2  2p4  8g
   11    3na iii s2p4 9g         2s2  2p4  9g
   11    3na iii s2p4 7i         2s2  2p4  7i
   11    3na iii s2p4 8i         2s2  2p4  8i
   11    3na iii s2p4 9i         2s2  2p4  9i
   11    3na iii sp6             2s   2p6
   11    3na iii sp5 3p          2s   2p5  3p
   11    3na iii sp5 4p          2s   2p5  4p
   11    3na iii sp5 5p          2s   2p5  5p
   11    3na iii sp5 6p          2s   2p5  6p
   11    3na iii sp5 7p          2s   2p5  7p
   11    3na iii sp5 8p          2s   2p5  8p
   11    3na iii sp5 9p          2s   2p5  9p
   11    3na iii sp5 10p         2s   2p5 10p
   11    3na iii sp5 11p         2s   2p5 11p
   11    3na iii sp5 12p         2s   2p5 12p
   11    3na iii sp5 4f          2s   2p5  4f
   11    3na iii sp5 5f          2s   2p5  5f
   11    3na iii sp5 6f          2s   2p5  6f
   11    3na iii sp5 7f          2s   2p5  7f
   11    3na iii sp5 8f          2s   2p5  8f
   11    3na iii sp5 9f          2s   2p5  9f
   11    3na iii sp5 10f         2s   2p5 10f
   11    3na iii sp5 11f         2s   2p5 11f
   11    3na iii sp5 12f         2s   2p5 12f
   -1
$run cray:rcn2c
$DELETE POOLG:HF110201.DAT;*
$DELETE POOLG:HF110202.DAT;*
$DELETE POOLG:HF110204.DAT;*
$DELETE POOLG:HF110231.DAT;*
$DELETE POOLG:HF110232.DAT;*
