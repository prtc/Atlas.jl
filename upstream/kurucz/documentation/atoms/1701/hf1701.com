$set1701
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf170107.dat for007
$assign poolg:hf170101.dat for001
$assign poolg:hf170102.dat for002
$assign poolg:hf170104.dat for004
$assign hf1701.pun for011
$assign hf1701.dat for013
$assign hf1701e.dat for014
$assign poolg:hf170131.dat for031
$assign poolg:hf170132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   17    2cl ii s2p4             3s2  3p4
   17    2cl ii s2p3 4p          3s2  3p3  4p
   17    2cl ii s2p3 5p          3s2  3p3  5p
   17    2cl ii s2p3 6p          3s2  3p3  6p
   17    2cl ii s2p3 7p          3s2  3p3  7p
   17    2cl ii s2p3 8p          3s2  3p3  8p
   17    2cl ii s2p3 9p          3s2  3p3  9p
   17    2cl ii s2p3 10p         3s2  3p3 10p
   17    2cl ii s2p3 11p         3s2  3p3 11p
   17    2cl ii s2p3 12p         3s2  3p3 12p
   17    2cl ii 3p6              3p6  
   17    2cl ii 3p5 4p           3p5  4p
   17    2cl ii 3p5 5p           3p5  5p
   17    2cl ii 3p5 6p           3p5  6p
   17    2cl ii 3p5 7p           3p5  7p
   17    2cl ii 3p5 8p           3p5  8p
   17    2cl ii 3p5 9p           3p5  9p
   17    2cl ii 3p5 10p          3p5 10p
   17    2cl ii 3p5 11p          3p5 11p
   17    2cl ii 3p5 12p          3p5 12p
   17    2cl ii s2p3 4f          3s2  3p3  4f
   17    2cl ii s2p3 5f          3s2  3p3  5f
   17    2cl ii s2p3 6f          3s2  3p3  6f
   17    2cl ii s2p3 7f          3s2  3p3  7f
   17    2cl ii s2p3 8f          3s2  3p3  8f
   17    2cl ii s2p3 9f          3s2  3p3  9f
   17    2cl ii 3p5 4f           3p5  4f
   17    2cl ii 3p5 5f           3p5  5f
   17    2cl ii 3p5 6f           3p5  6f
   17    2cl ii 3p5 7f           3p5  7f
   17    2cl ii 3p5 8f           3p5  8f
   17    2cl ii 3p5 9f           3p5  9f
   17    2cl ii s2p3 6h          3s2  3p3  6h
   17    2cl ii s2p3 7h          3s2  3p3  7h
   17    2cl ii s2p3 8h          3s2  3p3  8h
   17    2cl ii s2p3 9h          3s2  3p3  9h
   17    2cl ii 3p5 6h           3p5  6h
   17    2cl ii 3p5 7h           3p5  7h
   17    2cl ii 3p5 8h           3p5  8h
   17    2cl ii 3p5 9h           3p5  9h
   17    2cl ii s2p3 8k          3s2  3p3  8k
   17    2cl ii s2p3 9k          3s2  3p3  9k
   17    2cl ii 3p5 8k           3p5  8k
   17    2cl ii 3p5 9k           3p5  9k
   17    2cl ii sp4 4s           3s   3p4  4s
   17    2cl ii sp4 5s           3s   3p4  5s
   17    2cl ii sp4 6s           3s   3p4  6s
   17    2cl ii sp4 7s           3s   3p4  7s
   17    2cl ii sp4 8s           3s   3p4  8s
   17    2cl ii sp4 9s           3s   3p4  9s
   17    2cl ii sp4 10s          3s   3p4 10s
   17    2cl ii sp4 11s          3s   3p4 11s
   17    2cl ii sp4 3d           3s   3p4  3d
   17    2cl ii sp4 4d           3s   3p4  4d
   17    2cl ii sp4 5d           3s   3p4  5d
   17    2cl ii sp4 6d           3s   3p4  6d
   17    2cl ii sp4 7d           3s   3p4  7d
   17    2cl ii sp4 8d           3s   3p4  8d
   17    2cl ii sp4 9d           3s   3p4  9d
   17    2cl ii sp4 10d          3s   3p4 10d
   17    2cl ii sp4 11d          3s   3p4 11d
   17    2cl ii s2p3 4s          3s2  3p3  4s
   17    2cl ii s2p3 5s          3s2  3p3  5s
   17    2cl ii s2p3 6s          3s2  3p3  6s
   17    2cl ii s2p3 7s          3s2  3p3  7s
   17    2cl ii s2p3 8s          3s2  3p3  8s
   17    2cl ii s2p3 9s          3s2  3p3  9s
   17    2cl ii s2p3 10s         3s2  3p3 10s
   17    2cl ii s2p3 11s         3s2  3p3 11s
   17    2cl ii s2p3 12s         3s2  3p3 12s
   17    2cl ii s2p3 13s         3s2  3p3 13s
   17    2cl ii 3p5 4s           3p5  4s
   17    2cl ii 3p5 5s           3p5  5s
   17    2cl ii 3p5 6s           3p5  6s
   17    2cl ii 3p5 7s           3p5  7s
   17    2cl ii 3p5 8s           3p5  8s
   17    2cl ii 3p5 9s           3p5  9s
   17    2cl ii 3p5 10s          3p5 10s
   17    2cl ii 3p5 11s          3p5 11s
   17    2cl ii 3p5 12s          3p5 12s
   17    2cl ii 3p5 13s          3p5 13s
   17    2cl ii s2p3 3d          3s2  3p3  3d
   17    2cl ii s2p3 4d          3s2  3p3  4d
   17    2cl ii s2p3 5d          3s2  3p3  5d
   17    2cl ii s2p3 6d          3s2  3p3  6d
   17    2cl ii s2p3 7d          3s2  3p3  7d
   17    2cl ii s2p3 8d          3s2  3p3  8d
   17    2cl ii s2p3 9d          3s2  3p3  9d
   17    2cl ii s2p3 10d         3s2  3p3 10d
   17    2cl ii s2p3 11d         3s2  3p3 11d
   17    2cl ii s2p3 12d         3s2  3p3 12d
   17    2cl ii s2p3 13d         3s2  3p3 13d
   17    2cl ii 3p5 3d           3p5  3d
   17    2cl ii 3p5 4d           3p5  4d
   17    2cl ii 3p5 5d           3p5  5d
   17    2cl ii 3p5 6d           3p5  6d
   17    2cl ii 3p5 7d           3p5  7d
   17    2cl ii 3p5 8d           3p5  8d
   17    2cl ii 3p5 9d           3p5  9d
   17    2cl ii 3p5 10d          3p5 10d
   17    2cl ii 3p5 11d          3p5 11d
   17    2cl ii 3p5 12d          3p5 12d
   17    2cl ii 3p5 13d          3p5 13d
   17    2cl ii s2p3 5g          3s2  3p3  5g
   17    2cl ii s2p3 6g          3s2  3p3  6g
   17    2cl ii s2p3 7g          3s2  3p3  7g
   17    2cl ii s2p3 8g          3s2  3p3  8g
   17    2cl ii s2p3 9g          3s2  3p3  9g
   17    2cl ii s2p3 7i          3s2  3p3  7i
   17    2cl ii s2p3 8i          3s2  3p3  8i
   17    2cl ii s2p3 9i          3s2  3p3  9i
   17    2cl ii sp5              3s   3p5  
   17    2cl ii sp4 4p           3s   3p4  4p
   17    2cl ii sp4 5p           3s   3p4  5p
   17    2cl ii sp4 6p           3s   3p4  6p
   17    2cl ii sp4 7p           3s   3p4  7p
   17    2cl ii sp4 8p           3s   3p4  8p
   17    2cl ii sp4 9p           3s   3p4  9p
   17    2cl ii sp4 4f           3s   3p4  4f
   17    2cl ii sp4 5f           3s   3p4  5f
   17    2cl ii sp4 6f           3s   3p4  6f
   17    2cl ii sp4 7f           3s   3p4  7f
   17    2cl ii sp4 8f           3s   3p4  8f
   17    2cl ii sp4 9f           3s   3p4  9f
   -1
   -1
   17    2cl ii sp4 5g           3s   3p4  5g
   17    2cl ii sp4 6g           3s   3p4  6g
   17    2cl ii sp4 7g           3s   3p4  7g
   17    2cl ii sp4 8g           3s   3p4  8g
   17    2cl ii sp4 9g           3s   3p4  9g
   17    2cl ii sp4 6h           3s   3p4  6h
   17    2cl ii sp4 7h           3s   3p4  7h
   17    2cl ii sp4 8h           3s   3p4  8h
   17    2cl ii sp4 9h           3s   3p4  9h
   17    2cl ii sp4 7i           3s   3p4  7i
   17    2cl ii sp4 8i           3s   3p4  8i
   17    2cl ii sp4 9i           3s   3p4  9i
$run cray:rcn2c
$DELETE POOLG:HF170101.DAT;*
$DELETE POOLG:HF170102.DAT;*
$DELETE POOLG:HF170104.DAT;*
$DELETE POOLG:HF170131.DAT;*
$DELETE POOLG:HF170132.DAT;*
