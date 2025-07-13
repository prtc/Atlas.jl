$set def 1802
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf180207.dat for007
$assign poolg:hf180201.dat for001
$assign poolg:hf180202.dat for002
$assign poolg:hf180204.dat for004
$assign hf1802x.pun for011
$assign hf1802x.rrr for012
$assign hf1802x.dat for013
$assign hf1802xe.dat for014
$assign poolg:hf180231.dat for031
$assign poolg:hf180232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   18    2ariii s2p4             3s2  3p4
   18    3ariii s2p3 4p          3s2  3p3  4p
   18    3ariii s2p3 5p          3s2  3p3  5p
   18    3ariii s2p3 6p          3s2  3p3  6p
   18    3ariii s2p3 7p          3s2  3p3  7p
   18    3ariii s2p3 8p          3s2  3p3  8p
   18    3ariii s2p3 9p          3s2  3p3  9p
   18    3ariii s2p3 10p         3s2  3p3 10p
   18    3ariii s2p3 11p         3s2  3p3 11p
   18    3ariii s2p3 12p         3s2  3p3 12p
   18    3ariii p6               3s0  3p6 
   18    3ariii s2p3 4f          3s2  3p3  4f
   18    3ariii s2p3 5f          3s2  3p3  5f
   18    3ariii s2p3 6f          3s2  3p3  6f
   18    3ariii s2p3 7f          3s2  3p3  7f
   18    3ariii s2p3 8f          3s2  3p3  8f
   18    3ariii s2p3 9f          3s2  3p3  9f
   18    3ariii s2p3 10f         3s2  3p3 10f
   18    3ariii s2p3 11f         3s2  3p3 11f
   18    3ariii s2p3 12f         3s2  3p3 12f
   18    3ariii s2p3 6h          3s2  3p3  6h
   18    3ariii s2p3 7h          3s2  3p3  7h
   18    3ariii s2p3 8h          3s2  3p3  8h
   18    3ariii s2p3 9h          3s2  3p3  9h
   18    3ariii s2p3 10h         3s2  3p3 10h
   18    3ariii s2p3 11h         3s2  3p3 11h
   18    3ariii s2p3 12h         3s2  3p3 12h
   18    3ariii s2p3 8k          3s2  3p3  8k
   18    3ariii s2p3 9k          3s2  3p3  9k
   18    3ariii sp4 4s           3s   3p4  4s
   18    3ariii sp4 5s           3s   3p4  5s
   18    3ariii sp4 6s           3s   3p4  6s
   18    3ariii sp4 7s           3s   3p4  7s
   18    3ariii sp4 8s           3s   3p4  8s
   18    3ariii sp4 9s           3s   3p4  9s
   18    3ariii sp4 10s          3s   3p4 10s
   18    3ariii sp4 11s          3s   3p4 11s
   18    3ariii sp4 12s          3s   3p4 12s
   18    3ariii sp4 3d           3s   3p4  3d
   18    3ariii sp4 4d           3s   3p4  4d
   18    3ariii sp4 5d           3s   3p4  5d
   18    3ariii sp4 6d           3s   3p4  6d
   18    3ariii sp4 7d           3s   3p4  7d
   18    3ariii sp4 8d           3s   3p4  8d
   18    3ariii sp4 9d           3s   3p4  9d
   18    3ariii sp4 10d          3s   3p4 10d
   18    3ariii sp4 11d          3s   3p4 11d
   18    3ariii sp4 12d          3s   3p4 12d
   18    3ariii s2p3 4s          3s2  3p3  4s
   18    3ariii s2p3 5s          3s2  3p3  5s
   18    3ariii s2p3 6s          3s2  3p3  6s
   18    3ariii s2p3 7s          3s2  3p3  7s
   18    3ariii s2p3 8s          3s2  3p3  8s
   18    3ariii s2p3 9s          3s2  3p3  9s
   18    3ariii s2p3 10s         3s2  3p3 10s
   18    3ariii s2p3 11s         3s2  3p3 11s
   18    3ariii s2p3 12s         3s2  3p3 12s
   18    3ariii s2p3 3d          3s2  3p3  3d
   18    3ariii s2p3 4d          3s2  3p3  4d
   18    3ariii s2p3 5d          3s2  3p3  5d
   18    3ariii s2p3 6d          3s2  3p3  6d
   18    3ariii s2p3 7d          3s2  3p3  7d
   18    3ariii s2p3 8d          3s2  3p3  8d
   18    3ariii s2p3 9d          3s2  3p3  9d
   18    3ariii s2p3 10d         3s2  3p3 10d
   18    3ariii s2p3 11d         3s2  3p3 11d
   18    3ariii s2p3 12d         3s2  3p3 12d
   18    3ariii s2p3 5g          3s2  3p3  5g
   18    3ariii s2p3 6g          3s2  3p3  6g
   18    3ariii s2p3 7g          3s2  3p3  7g
   18    3ariii s2p3 8g          3s2  3p3  8g
   18    3ariii s2p3 9g          3s2  3p3  9g
   18    3ariii s2p3 10g         3s2  3p3 10g
   18    3ariii s2p3 11g         3s2  3p3 11g
   18    3ariii s2p3 12g         3s2  3p3 12g
   18    3ariii s2p3 7i          3s2  3p3  7i
   18    3ariii s2p3 8i          3s2  3p3  8i
   18    3ariii s2p3 9i          3s2  3p3  9i
   18    3ariii sp5              3s   3p5  
   18    3ariii sp4 5p           3s   3p4  5p
   18    3ariii sp4 6p           3s   3p4  6p
   18    3ariii sp4 7p           3s   3p4  7p
   18    3ariii sp4 8p           3s   3p4  8p
   18    3ariii sp4 9p           3s   3p4  9p
   18    3ariii sp4 10p          3s   3p4 10p
   18    3ariii sp4 11p          3s   3p4 11p
   18    3ariii sp4 12p          3s   3p4 12p
   18    3ariii sp4 4f           3s   3p4  4f
   18    3ariii sp4 5f           3s   3p4  5f
   18    3ariii sp4 6f           3s   3p4  6f
   18    3ariii sp4 7f           3s   3p4  7f
   18    3ariii sp4 8f           3s   3p4  8f
   18    3ariii sp4 9f           3s   3p4  9f
   18    3ariii sp4 10f          3s   3p4 10f
   18    3ariii sp4 11f          3s   3p4 11f
   18    3ariii sp4 12f          3s   3p4 12f
   -1
$run cray:rcn2c
$DELETE POOLG:HF180201.DAT;*
$DELETE POOLG:HF180202.DAT;*
$DELETE POOLG:HF180204.DAT;*
$DELETE POOLG:HF180231.DAT;*
$DELETE POOLG:HF180232.DAT;*
