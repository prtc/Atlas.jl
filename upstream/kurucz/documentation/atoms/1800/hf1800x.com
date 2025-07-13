$set def 1800
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf180007.dat for007
$assign poolg:hf180001.dat for001
$assign poolg:hf180002.dat for002
$assign poolg:hf180004.dat for004
$assign hf1800x.pun for011
$assign hf1800x.dat for013
$assign hf1800xe.dat for014
$assign poolg:hf180031.dat for031
$assign poolg:hf180032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   18    1ar i   s2p6            3s2  3p6
   18    1ar i   s2p5 4p         3s2  3p5  4p
   18    1ar i   s2p5 5p         3s2  3p5  5p
   18    1ar i   s2p5 6p         3s2  3p5  6p
   18    1ar i   s2p5 7p         3s2  3p5  7p
   18    1ar i   s2p5 8p         3s2  3p5  8p
   18    1ar i   s2p5 9p         3s2  3p5  9p
   18    1ar i   s2p5 10p        3s2  3p5 10p
   18    1ar i   s2p5 11p        3s2  3p5 11p
   18    1ar i   s2p5 12p        3s2  3p5 12p
   18    1ar i   s2p5 13p        3s2  3p5 13p
   18    1ar i   s2p5 4f         3s2  3p5  4f
   18    1ar i   s2p5 5f         3s2  3p5  5f
   18    1ar i   s2p5 6f         3s2  3p5  6f
   18    1ar i   s2p5 7f         3s2  3p5  7f
   18    1ar i   s2p5 8f         3s2  3p5  8f
   18    1ar i   s2p5 9f         3s2  3p5  9f
   18    1ar i   s2p5 10f        3s2  3p5 10f
   18    1ar i   s2p5 11f        3s2  3p5 11f
   18    1ar i   s2p5 12f        3s2  3p5 12f
   18    1ar i   s2p5 13f        3s2  3p5 13f
   18    1ar i   s2p5 6h         3s2  3p5  6h
   18    1ar i   s2p5 7h         3s2  3p5  7h
   18    1ar i   s2p5 8h         3s2  3p5  8h
   18    1ar i   s2p5 9h         3s2  3p5  9h
   18    1ar i   s2p5 10h        3s2  3p5 10h
   18    1ar i   s2p5 11h        3s2  3p5 11h
   18    1ar i   s2p5 12h        3s2  3p5 12h
   18    1ar i   s2p5 13h        3s2  3p5 13h
   18    1ar i   s2p5 8k         3s2  3p5  8k
   18    1ar i   s2p5 9k         3s2  3p5  9k
   18    1ar i   sp6 4s          3s   3p6  4s
   18    1ar i   sp6 5s          3s   3p6  5s
   18    1ar i   sp6 6s          3s   3p6  6s
   18    1ar i   sp6 7s          3s   3p6  7s
   18    1ar i   sp6 8s          3s   3p6  8s
   18    1ar i   sp6 9s          3s   3p6  9s
   18    1ar i   sp6 10s         3s   3p6 10s
   18    1ar i   sp6 11s         3s   3p6 11s
   18    1ar i   sp6 12s         3s   3p6 12s
   18    1ar i   sp6 13s         3s   3p6 13s
   18    1ar i   sp6 3d          3s   3p6  3d
   18    1ar i   sp6 4d          3s   3p6  4d
   18    1ar i   sp6 5d          3s   3p6  5d
   18    1ar i   sp6 6d          3s   3p6  6d
   18    1ar i   sp6 7d          3s   3p6  7d
   18    1ar i   sp6 8d          3s   3p6  8d
   18    1ar i   sp6 9d          3s   3p6  9d
   18    1ar i   sp6 10d         3s   3p6 10d
   18    1ar i   sp6 11d         3s   3p6 11d
   18    1ar i   sp6 12d         3s   3p6 12d
   18    1ar i   sp6 13d         3s   3p6 13d
   18    1ar i   s2p5 4s         3s2  3p5  4s
   18    1ar i   s2p5 5s         3s2  3p5  5s
   18    1ar i   s2p5 6s         3s2  3p5  6s
   18    1ar i   s2p5 7s         3s2  3p5  7s
   18    1ar i   s2p5 8s         3s2  3p5  8s
   18    1ar i   s2p5 9s         3s2  3p5  9s
   18    1ar i   s2p5 10s        3s2  3p5 10s
   18    1ar i   s2p5 11s        3s2  3p5 11s
   18    1ar i   s2p5 12s        3s2  3p5 12s
   18    1ar i   s2p5 13s        3s2  3p5 13s
   18    1ar i   s2p5 3d         3s2  3p5  3d
   18    1ar i   s2p5 4d         3s2  3p5  4d
   18    1ar i   s2p5 5d         3s2  3p5  5d
   18    1ar i   s2p5 6d         3s2  3p5  6d
   18    1ar i   s2p5 7d         3s2  3p5  7d
   18    1ar i   s2p5 8d         3s2  3p5  8d
   18    1ar i   s2p5 9d         3s2  3p5  9d
   18    1ar i   s2p5 10d        3s2  3p5 10d
   18    1ar i   s2p5 11d        3s2  3p5 11d
   18    1ar i   s2p5 12d        3s2  3p5 12d
   18    1ar i   s2p5 13d        3s2  3p5 13d
   18    1ar i   s2p5 5g         3s2  3p5  5g
   18    1ar i   s2p5 6g         3s2  3p5  6g
   18    1ar i   s2p5 7g         3s2  3p5  7g
   18    1ar i   s2p5 8g         3s2  3p5  8g
   18    1ar i   s2p5 9g         3s2  3p5  9g
   18    1ar i   s2p5 10g        3s2  3p5 10g
   18    1ar i   s2p5 11g        3s2  3p5 11g
   18    1ar i   s2p5 12g        3s2  3p5 12g
   18    1ar i   s2p5 13g        3s2  3p5 13g
   18    1ar i   s2p5 7i         3s2  3p5  7i
   18    1ar i   s2p5 8i         3s2  3p5  8i
   18    1ar i   s2p5 9i         3s2  3p5  9i
   18    1ar i   sp6 4p          3s   3p6  4p
   18    1ar i   sp6 5p          3s   3p6  5p
   18    1ar i   sp6 6p          3s   3p6  6p
   18    1ar i   sp6 7p          3s   3p6  7p
   18    1ar i   sp6 8p          3s   3p6  8p
   18    1ar i   sp6 9p          3s   3p6  9p
   18    1ar i   sp6 10p         3s   3p6 10p
   18    1ar i   sp6 11p         3s   3p6 11p
   18    1ar i   sp6 12p         3s   3p6 12p
   18    1ar i   sp6 13p         3s   3p6 13p
   18    1ar i   sp6 4f          3s   3p6  4f
   18    1ar i   sp6 5f          3s   3p6  5f
   18    1ar i   sp6 6f          3s   3p6  6f
   18    1ar i   sp6 7f          3s   3p6  7f
   18    1ar i   sp6 8f          3s   3p6  8f
   18    1ar i   sp6 9f          3s   3p6  9f
   18    1ar i   sp6 10f         3s   3p6 10f
   18    1ar i   sp6 11f         3s   3p6 11f
   18    1ar i   sp6 12f         3s   3p6 12f
   18    1ar i   sp6 13f         3s   3p6 13f
   -1
$run cray:rcn2c
$DELETE POOLG:HF180001.DAT;*
$DELETE POOLG:HF180002.DAT;*
$DELETE POOLG:HF180004.DAT;*
$DELETE POOLG:HF180031.DAT;*
$DELETE POOLG:HF180032.DAT;*
