$set def 1801
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf180107.dat for007
$assign poolg:hf180101.dat for001
$assign poolg:hf180102.dat for002
$assign poolg:hf180104.dat for004
$assign hf1801x.pun for011
$assign hf1801x.rrr for012
$assign hf1801x.dat for013
$assign hf1801xe.dat for014
$assign poolg:hf180131.dat for031
$assign poolg:hf180132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   18    2ar ii s2p5             3s2  3p5
   18    2ar ii s2p4 4p          3s2  3p4  4p
   18    2ar ii s2p4 5p          3s2  3p4  5p
   18    2ar ii s2p4 6p          3s2  3p4  6p
   18    2ar ii s2p4 7p          3s2  3p4  7p
   18    2ar ii s2p4 8p          3s2  3p4  8p
   18    2ar ii s2p4 9p          3s2  3p4  9p
   18    2ar ii s2p4 10p         3s2  3p4 10p
   18    2ar ii s2p4 11p         3s2  3p4 11p
   18    2ar ii s2p4 12p         3s2  3p4 12p
   18    2ar ii s2p4 4f          3s2  3p4  4f
   18    2ar ii s2p4 5f          3s2  3p4  5f
   18    2ar ii s2p4 6f          3s2  3p4  6f
   18    2ar ii s2p4 7f          3s2  3p4  7f
   18    2ar ii s2p4 8f          3s2  3p4  8f
   18    2ar ii s2p4 9f          3s2  3p4  9f
   18    2ar ii s2p4 10f         3s2  3p4 10f
   18    2ar ii s2p4 11f         3s2  3p4 11f
   18    2ar ii s2p4 12f         3s2  3p4 12f
   18    2ar ii s2p4 6h          3s2  3p4  6h
   18    2ar ii s2p4 7h          3s2  3p4  7h
   18    2ar ii s2p4 8h          3s2  3p4  8h
   18    2ar ii s2p4 9h          3s2  3p4  9h
   18    2ar ii s2p4 10h         3s2  3p4 10h
   18    2ar ii s2p4 11h         3s2  3p4 11h
   18    2ar ii s2p4 12h         3s2  3p4 12h
   18    2ar ii s2p4 8k          3s2  3p4  8k
   18    2ar ii s2p4 9k          3s2  3p4  9k
   18    2ar ii sp5 4s           3s   3p5  4s
   18    2ar ii sp5 5s           3s   3p5  5s
   18    2ar ii sp5 6s           3s   3p5  6s
   18    2ar ii sp5 7s           3s   3p5  7s
   18    2ar ii sp5 8s           3s   3p5  8s
   18    2ar ii sp5 9s           3s   3p5  9s
   18    2ar ii sp5 10s          3s   3p5 10s
   18    2ar ii sp5 11s          3s   3p5 11s
   18    2ar ii sp5 12s          3s   3p5 12s
   18    2ar ii sp5 3d           3s   3p5  3d
   18    2ar ii sp5 4d           3s   3p5  4d
   18    2ar ii sp5 5d           3s   3p5  5d
   18    2ar ii sp5 6d           3s   3p5  6d
   18    2ar ii sp5 7d           3s   3p5  7d
   18    2ar ii sp5 8d           3s   3p5  8d
   18    2ar ii sp5 9d           3s   3p5  9d
   18    2ar ii sp5 10d          3s   3p5 10d
   18    2ar ii sp5 11d          3s   3p5 11d
   18    2ar ii sp5 12d          3s   3p5 12d
   18    2ar ii s2p4 4s          3s2  3p4  4s
   18    2ar ii s2p4 5s          3s2  3p4  5s
   18    2ar ii s2p4 6s          3s2  3p4  6s
   18    2ar ii s2p4 7s          3s2  3p4  7s
   18    2ar ii s2p4 8s          3s2  3p4  8s
   18    2ar ii s2p4 9s          3s2  3p4  9s
   18    2ar ii s2p4 10s         3s2  3p4 10s
   18    2ar ii s2p4 11s         3s2  3p4 11s
   18    2ar ii s2p4 12s         3s2  3p4 12s
   18    2ar ii s2p4 3d          3s2  3p4  3d
   18    2ar ii s2p4 4d          3s2  3p4  4d
   18    2ar ii s2p4 5d          3s2  3p4  5d
   18    2ar ii s2p4 6d          3s2  3p4  6d
   18    2ar ii s2p4 7d          3s2  3p4  7d
   18    2ar ii s2p4 8d          3s2  3p4  8d
   18    2ar ii s2p4 9d          3s2  3p4  9d
   18    2ar ii s2p4 10d         3s2  3p4 10d
   18    2ar ii s2p4 11d         3s2  3p4 11d
   18    2ar ii s2p4 12d         3s2  3p4 12d
   18    2ar ii s2p4 5g          3s2  3p4  5g
   18    2ar ii s2p4 6g          3s2  3p4  6g
   18    2ar ii s2p4 7g          3s2  3p4  7g
   18    2ar ii s2p4 8g          3s2  3p4  8g
   18    2ar ii s2p4 9g          3s2  3p4  9g
   18    2ar ii s2p4 10g         3s2  3p4 10g
   18    2ar ii s2p4 7i          3s2  3p4  7i
   18    2ar ii s2p4 8i          3s2  3p4  8i
   18    2ar ii s2p4 9i          3s2  3p4  9i
   18    2ar ii sp6              3s   3p6
   18    2ar ii sp5 4p           3s   3p5  4p
   18    2ar ii sp5 5p           3s   3p5  5p
   18    2ar ii sp5 6p           3s   3p5  6p
   18    2ar ii sp5 7p           3s   3p5  7p
   18    2ar ii sp5 8p           3s   3p5  8p
   18    2ar ii sp5 9p           3s   3p5  9p
   18    2ar ii sp5 10p          3s   3p5 10p
   18    2ar ii sp5 11p          3s   3p5 11p
   18    2ar ii sp5 12p          3s   3p5 12p
   18    2ar ii sp5 4f           3s   3p5  4f
   18    2ar ii sp5 5f           3s   3p5  5f
   18    2ar ii sp5 6f           3s   3p5  6f
   18    2ar ii sp5 7f           3s   3p5  7f
   18    2ar ii sp5 8f           3s   3p5  8f
   18    2ar ii sp5 9f           3s   3p5  9f
   18    2ar ii sp5 10f          3s   3p5 10f
   18    2ar ii sp5 11f          3s   3p5 11f
   18    2ar ii sp5 12f          3s   3p5 12f
   -1
$run cray:rcn2c
$DELETE POOLG:HF180101.DAT;*
$DELETE POOLG:HF180102.DAT;*
$DELETE POOLG:HF180104.DAT;*
$DELETE POOLG:HF180131.DAT;*
$DELETE POOLG:HF180132.DAT;*
