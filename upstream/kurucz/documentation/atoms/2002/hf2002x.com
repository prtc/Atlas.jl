$set def 2002
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf200207.dat for007
$assign poolg:hf200201.dat for001
$assign poolg:hf200202.dat for002
$assign poolg:hf200204.dat for004
$assign hf2002x.pun for011
$assign hf2002x.rrr for012
$assign hf2002x.dat for013
$assign hf2002xe.dat for014
$assign poolg:hf200231.dat for031
$assign poolg:hf200232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   20    3ca iii s2p6            3s2  3p6
   20    3ca iii s2p5 4p         3s2  3p5  4p
   20    3ca iii s2p5 5p         3s2  3p5  5p
   20    3ca iii s2p5 6p         3s2  3p5  6p
   20    3ca iii s2p5 7p         3s2  3p5  7p
   20    3ca iii s2p5 8p         3s2  3p5  8p
   20    3ca iii s2p5 9p         3s2  3p5  9p
   20    3ca iii s2p5 10p        3s2  3p5 10p
   20    3ca iii s2p5 11p        3s2  3p5 11p
   20    3ca iii s2p5 12p        3s2  3p5 12p
   20    3ca iii s2p5 13p        3s2  3p5 13p
   20    3ca iii s2p5 4f         3s2  3p5  4f
   20    3ca iii s2p5 5f         3s2  3p5  5f
   20    3ca iii s2p5 6f         3s2  3p5  6f
   20    3ca iii s2p5 7f         3s2  3p5  7f
   20    3ca iii s2p5 8f         3s2  3p5  8f
   20    3ca iii s2p5 9f         3s2  3p5  9f
   20    3ca iii s2p5 10f        3s2  3p5 10f
   20    3ca iii s2p5 11f        3s2  3p5 11f
   20    3ca iii s2p5 12f        3s2  3p5 12f
   20    3ca iii s2p5 13f        3s2  3p5 13f
   20    3ca iii s2p5 6h         3s2  3p5  6h
   20    3ca iii s2p5 7h         3s2  3p5  7h
   20    3ca iii s2p5 8h         3s2  3p5  8h
   20    3ca iii s2p5 9h         3s2  3p5  9h
   20    3ca iii s2p5 10h        3s2  3p5 10h
   20    3ca iii s2p5 11h        3s2  3p5 11h
   20    3ca iii s2p5 12h        3s2  3p5 12h
   20    3ca iii s2p5 13h        3s2  3p5 13h
   20    3ca iii s2p5 8k         3s2  3p5  8k
   20    3ca iii s2p5 9k         3s2  3p5  9k
   20    3ca iii sp6 4s          3s   3p6  4s
   20    3ca iii sp6 5s          3s   3p6  5s
   20    3ca iii sp6 6s          3s   3p6  6s
   20    3ca iii sp6 7s          3s   3p6  7s
   20    3ca iii sp6 8s          3s   3p6  8s
   20    3ca iii sp6 9s          3s   3p6  9s
   20    3ca iii sp6 10s         3s   3p6 10s
   20    3ca iii sp6 11s         3s   3p6 11s
   20    3ca iii sp6 12s         3s   3p6 12s
   20    3ca iii sp6 13s         3s   3p6 13s
   20    3ca iii sp6 3d          3s   3p6  3d
   20    3ca iii sp6 4d          3s   3p6  4d
   20    3ca iii sp6 5d          3s   3p6  5d
   20    3ca iii sp6 6d          3s   3p6  6d
   20    3ca iii sp6 7d          3s   3p6  7d
   20    3ca iii sp6 8d          3s   3p6  8d
   20    3ca iii sp6 9d          3s   3p6  9d
   20    3ca iii sp6 10d         3s   3p6 10d
   20    3ca iii sp6 11d         3s   3p6 11d
   20    3ca iii sp6 12d         3s   3p6 12d
   20    3ca iii sp6 13d         3s   3p6 13d
   20    3ca iii s2p5 4s         3s2  3p5  4s
   20    3ca iii s2p5 5s         3s2  3p5  5s
   20    3ca iii s2p5 6s         3s2  3p5  6s
   20    3ca iii s2p5 7s         3s2  3p5  7s
   20    3ca iii s2p5 8s         3s2  3p5  8s
   20    3ca iii s2p5 9s         3s2  3p5  9s
   20    3ca iii s2p5 10s        3s2  3p5 10s
   20    3ca iii s2p5 11s        3s2  3p5 11s
   20    3ca iii s2p5 12s        3s2  3p5 12s
   20    3ca iii s2p5 13s        3s2  3p5 13s
   20    3ca iii s2p5 3d         3s2  3p5  3d
   20    3ca iii s2p5 4d         3s2  3p5  4d
   20    3ca iii s2p5 5d         3s2  3p5  5d
   20    3ca iii s2p5 6d         3s2  3p5  6d
   20    3ca iii s2p5 7d         3s2  3p5  7d
   20    3ca iii s2p5 8d         3s2  3p5  8d
   20    3ca iii s2p5 9d         3s2  3p5  9d
   20    3ca iii s2p5 10d        3s2  3p5 10d
   20    3ca iii s2p5 11d        3s2  3p5 11d
   20    3ca iii s2p5 12d        3s2  3p5 12d
   20    3ca iii s2p5 13d        3s2  3p5 13d
   20    3ca iii s2p5 5g         3s2  3p5  5g
   20    3ca iii s2p5 6g         3s2  3p5  6g
   20    3ca iii s2p5 7g         3s2  3p5  7g
   20    3ca iii s2p5 8g         3s2  3p5  8g
   20    3ca iii s2p5 9g         3s2  3p5  9g
   20    3ca iii s2p5 10g        3s2  3p5 10g
   20    3ca iii s2p5 11g        3s2  3p5 11g
   20    3ca iii s2p5 12g        3s2  3p5 12g
   20    3ca iii s2p5 13g        3s2  3p5 13g
   20    3ca iii s2p5 7i         3s2  3p5  7i
   20    3ca iii s2p5 8i         3s2  3p5  8i
   20    3ca iii s2p5 9i         3s2  3p5  9i
   20    3ca iii sp6 4p          3s   3p6  4p
   20    3ca iii sp6 5p          3s   3p6  5p
   20    3ca iii sp6 6p          3s   3p6  6p
   20    3ca iii sp6 7p          3s   3p6  7p
   20    3ca iii sp6 8p          3s   3p6  8p
   20    3ca iii sp6 9p          3s   3p6  9p
   20    3ca iii sp6 10p         3s   3p6 10p
   20    3ca iii sp6 11p         3s   3p6 11p
   20    3ca iii sp6 12p         3s   3p6 12p
   20    3ca iii sp6 13p         3s   3p6 13p
   20    3ca iii sp6 4f          3s   3p6  4f
   20    3ca iii sp6 5f          3s   3p6  5f
   20    3ca iii sp6 6f          3s   3p6  6f
   20    3ca iii sp6 7f          3s   3p6  7f
   20    3ca iii sp6 8f          3s   3p6  8f
   20    3ca iii sp6 9f          3s   3p6  9f
   20    3ca iii sp6 10f         3s   3p6 10f
   20    3ca iii sp6 11f         3s   3p6 11f
   20    3ca iii sp6 12f         3s   3p6 12f
   20    3ca iii sp6 13f         3s   3p6 13f
   -1
$run cray:rcn2c
$DELETE POOLG:HF200201.DAT;*
$DELETE POOLG:HF200202.DAT;*
$DELETE POOLG:HF200204.DAT;*
$DELETE POOLG:HF200231.DAT;*
$DELETE POOLG:HF200232.DAT;*
