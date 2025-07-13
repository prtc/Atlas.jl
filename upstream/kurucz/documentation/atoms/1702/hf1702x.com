$set def 1702
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf170207.dat for007
$assign poolg:hf170201.dat for001
$assign poolg:hf170202.dat for002
$assign poolg:hf170204.dat for004
$assign hf1702x.pun for011
$assign hf1702x.rrr for012
$assign hf1702x.dat for013
$assign hf1702xe.dat for014
$assign poolg:hf170231.dat for031
$assign poolg:hf170232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   17    3cliii s2p3             3s2  3p3
   17    3cliii s2p2 4p          3s2  3p2  4p
   17    3cliii s2p2 5p          3s2  3p2  5p
   17    3cliii s2p2 6p          3s2  3p2  6p
   17    3cliii s2p2 7p          3s2  3p2  7p
   17    3cliii s2p2 8p          3s2  3p2  8p
   17    3cliii s2p2 9p          3s2  3p2  9p
   17    3cliii s2p2 4f          3s2  3p2  4f
   17    3cliii s2p2 5f          3s2  3p2  5f
   17    3cliii s2p2 6f          3s2  3p2  6f
   17    3cliii s2p2 7f          3s2  3p2  7f
   17    3cliii s2p2 8f          3s2  3p2  8f
   17    3cliii s2p2 9f          3s2  3p2  9f
   17    3cliii s2p2 6h          3s2  3p2  6h
   17    3cliii s2p2 7h          3s2  3p2  7h
   17    3cliii s2p2 8h          3s2  3p2  8h
   17    3cliii s2p2 9h          3s2  3p2  9h
   17    3cliii s2p2 8k          3s2  3p2  8k
   17    3cliii s2p2 9k          3s2  3p2  9k
   17    3cliii sp3 4s           3s   3p3  4s
   17    3cliii sp3 5s           3s   3p3  5s
   17    3cliii sp3 6s           3s   3p3  6s
   17    3cliii sp3 7s           3s   3p3  7s
   17    3cliii sp3 8s           3s   3p3  8s
   17    3cliii sp3 9s           3s   3p3  9s
   17    3cliii sp3 3d           3s   3p3  3d
   17    3cliii sp3 4d           3s   3p3  4d
   17    3cliii sp3 5d           3s   3p3  5d
   17    3cliii sp3 6d           3s   3p3  6d
   17    3cliii sp3 7d           3s   3p3  7d
   17    3cliii sp3 8d           3s   3p3  8d
   17    3cliii sp3 9d           3s   3p3  9d
   17    3cliii p5               3s0  3p5  
   17    3cliii s2p2 4s          3s2  3p2  4s
   17    3cliii s2p2 5s          3s2  3p2  5s
   17    3cliii s2p2 6s          3s2  3p2  6s
   17    3cliii s2p2 7s          3s2  3p2  7s
   17    3cliii s2p2 8s          3s2  3p2  8s
   17    3cliii s2p2 9s          3s2  3p2  9s
   17    3cliii s2p2 3d          3s2  3p2  3d
   17    3cliii s2p2 4d          3s2  3p2  4d
   17    3cliii s2p2 5d          3s2  3p2  5d
   17    3cliii s2p2 6d          3s2  3p2  6d
   17    3cliii s2p2 7d          3s2  3p2  7d
   17    3cliii s2p2 8d          3s2  3p2  8d
   17    3cliii s2p2 9d          3s2  3p2  9d
   17    3cliii s2p2 5g          3s2  3p2  5g
   17    3cliii s2p2 6g          3s2  3p2  6g
   17    3cliii s2p2 7g          3s2  3p2  7g
   17    3cliii s2p2 8g          3s2  3p2  8g
   17    3cliii s2p2 9g          3s2  3p2  9g
   17    3cliii s2p2 7i          3s2  3p2  7i
   17    3cliii s2p2 8i          3s2  3p2  8i
   17    3cliii s2p2 9i          3s2  3p2  9i
   17    3cliii sp4              3s   3p4  
   17    3cliii sp3 4p           3s   3p3  4p
   17    3cliii sp3 5p           3s   3p3  5p
   17    3cliii sp3 6p           3s   3p3  6p
   17    3cliii sp3 7p           3s   3p3  7p
   17    3cliii sp3 8p           3s   3p3  8p
   17    3cliii sp3 9p           3s   3p3  9p
   17    3cliii sp3 4f           3s   3p3  4f
   17    3cliii sp3 5f           3s   3p3  5f
   17    3cliii sp3 6f           3s   3p3  6f
   17    3cliii sp3 7f           3s   3p3  7f
   17    3cliii sp3 8f           3s   3p3  8f
   17    3cliii sp3 9f           3s   3p3  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF170201.DAT;*
$DELETE POOLG:HF170202.DAT;*
$DELETE POOLG:HF170204.DAT;*
$DELETE POOLG:HF170231.DAT;*
$DELETE POOLG:HF170232.DAT;*
