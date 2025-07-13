$set def 1600
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf160007.dat for007
$assign poolg:hf160001.dat for001
$assign poolg:hf160002.dat for002
$assign poolg:hf160004.dat for004
$assign hf1600x.pun for011
$assign hf1600x.RRR for012
$assign hf1600x.dat for013
$assign hf1600xe.dat for014
$assign poolg:hf160031.dat for031
$assign poolg:hf160032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   16    1s i   s2p4             3s2  3p4
   16    1s i   s2p3 4p          3s2  3p3  4p
   16    1s i   s2p3 5p          3s2  3p3  5p
   16    1s i   s2p3 6p          3s2  3p3  6p
   16    1s i   s2p3 7p          3s2  3p3  7p
   16    1s i   s2p3 8p          3s2  3p3  8p
   16    1s i   s2p3 9p          3s2  3p3  9p
   16    1s i   s2p3 10p         3s2  3p3 10p
   16    1s i   s2p3 11p         3s2  3p3 11p
   16    1s i   s2p3 12p         3s2  3p3 12p
   16    1s i   s2p3 13p         3s2  3p3 13p
   16    1s i   s2p3 14p         3s2  3p3 14p
   16    1s i   s2p3 15p         3s2  3p3 15p
   16    1s i   s2p3 16p         3s2  3p3 16p
   16    1s i   s2p3 4f          3s2  3p3  4f
   16    1s i   s2p3 5f          3s2  3p3  5f
   16    1s i   s2p3 6f          3s2  3p3  6f
   16    1s i   s2p3 7f          3s2  3p3  7f
   16    1s i   s2p3 8f          3s2  3p3  8f
   16    1s i   s2p3 9f          3s2  3p3  9f
   16    1s i   s2p3 10f         3s2  3p3 10f
   16    1s i   s2p3 11f         3s2  3p3 11f
   16    1s i   s2p3 12f         3s2  3p3 12f
   16    1s i   s2p3 13f         3s2  3p3 13f
   16    1s i   s2p3 14f         3s2  3p3 14f
   16    1s i   s2p3 15f         3s2  3p3 15f
   16    1s i   s2p3 16f         3s2  3p3 16f
   16    1s i   s2p3 17f         3s2  3p3 17f
   16    1s i   s2p3 6h          3s2  3p3  6h
   16    1s i   s2p3 7h          3s2  3p3  7h
   16    1s i   s2p3 8h          3s2  3p3  8h
   16    1s i   s2p3 9h          3s2  3p3  9h
   16    1s i   s2p3 8k          3s2  3p3  8k
   16    1s i   s2p3 9k          3s2  3p3  9k
   16    1s i   sp4 4s           3s   3p4  4s
   16    1s i   sp4 5s           3s   3p4  5s
   16    1s i   sp4 6s           3s   3p4  6s
   16    1s i   sp4 7s           3s   3p4  7s
   16    1s i   sp4 8s           3s   3p4  8s
   16    1s i   sp4 9s           3s   3p4  9s
   16    1s i   sp4 10s          3s   3p4 10s
   16    1s i   sp4 11s          3s   3p4 11s
   16    1s i   sp4 12s          3s   3p4 12s
   16    1s i   sp4 13s          3s   3p4 13s
   16    1s i   sp4 14s          3s   3p4 14s
   16    1s i   sp4 15s          3s   3p4 15s
   16    1s i   sp4 16s          3s   3p4 16s
   16    1s i   sp4 3d           3s   3p4  3d
   16    1s i   sp4 4d           3s   3p4  4d
   16    1s i   sp4 5d           3s   3p4  5d
   16    1s i   sp4 6d           3s   3p4  6d
   16    1s i   sp4 7d           3s   3p4  7d
   16    1s i   sp4 8d           3s   3p4  8d
   16    1s i   sp4 9d           3s   3p4  9d
   16    1s i   sp4 10d          3s   3p4 10d
   16    1s i   sp4 11d          3s   3p4 11d
   16    1s i   sp4 12d          3s   3p4 12d
   16    1s i   sp4 13d          3s   3p4 13d
   16    1s i   sp4 14d          3s   3p4 14d
   16    1s i   sp4 15d          3s   3p4 15d
   16    1s i   sp4 16d          3s   3p4 16d
   16    1s i   s2p3 4s          3s2  3p3  4s
   16    1s i   s2p3 5s          3s2  3p3  5s
   16    1s i   s2p3 6s          3s2  3p3  6s
   16    1s i   s2p3 7s          3s2  3p3  7s
   16    1s i   s2p3 8s          3s2  3p3  8s
   16    1s i   s2p3 9s          3s2  3p3  9s
   16    1s i   s2p3 10s         3s2  3p3 10s
   16    1s i   s2p3 11s         3s2  3p3 11s
   16    1s i   s2p3 12s         3s2  3p3 12s
   16    1s i   s2p3 13s         3s2  3p3 13s
   16    1s i   s2p3 14s         3s2  3p3 14s
   16    1s i   s2p3 15s         3s2  3p3 15s
   16    1s i   s2p3 16s         3s2  3p3 16s
   16    1s i   s2p3 3d          3s2  3p3  3d
   16    1s i   s2p3 4d          3s2  3p3  4d
   16    1s i   s2p3 5d          3s2  3p3  5d
   16    1s i   s2p3 6d          3s2  3p3  6d
   16    1s i   s2p3 7d          3s2  3p3  7d
   16    1s i   s2p3 8d          3s2  3p3  8d
   16    1s i   s2p3 9d          3s2  3p3  9d
   16    1s i   s2p3 10d         3s2  3p3 10d
   16    1s i   s2p3 11d         3s2  3p3 11d
   16    1s i   s2p3 12d         3s2  3p3 12d
   16    1s i   s2p3 13d         3s2  3p3 13d
   16    1s i   s2p3 14d         3s2  3p3 14d
   16    1s i   s2p3 15d         3s2  3p3 15d
   16    1s i   s2p3 16d         3s2  3p3 16d
   16    1s i   s2p3 5g          3s2  3p3  5g
   16    1s i   s2p3 6g          3s2  3p3  6g
   16    1s i   s2p3 7g          3s2  3p3  7g
   16    1s i   s2p3 8g          3s2  3p3  8g
   16    1s i   s2p3 9g          3s2  3p3  9g
   16    1s i   s2p3 7i          3s2  3p3  7i
   16    1s i   s2p3 8i          3s2  3p3  8i
   16    1s i   s2p3 9i          3s2  3p3  9i
   16    1s i   sp5              3s   3p5  
   16    1s i   sp4 4p           3s   3p4  4p
   16    1s i   sp4 5p           3s   3p4  5p
   16    1s i   sp4 6p           3s   3p4  6p
   16    1s i   sp4 7p           3s   3p4  7p
   16    1s i   sp4 8p           3s   3p4  8p
   16    1s i   sp4 9p           3s   3p4  9p
   16    1s i   sp4 10p          3s   3p4 10p
   16    1s i   sp4 11p          3s   3p4 11p
   16    1s i   sp4 12p          3s   3p4 12p
   16    1s i   sp4 13p          3s   3p4 13p
   16    1s i   sp4 14p          3s   3p4 14p
   16    1s i   sp4 15p          3s   3p4 15p
   16    1s i   sp4 4f           3s   3p4  4f
   16    1s i   sp4 5f           3s   3p4  5f
   16    1s i   sp4 6f           3s   3p4  6f
   16    1s i   sp4 7f           3s   3p4  7f
   16    1s i   sp4 8f           3s   3p4  8f
   16    1s i   sp4 9f           3s   3p4  9f
   16    1s i   sp4 10f          3s   3p4 10f
   16    1s i   sp4 11f          3s   3p4 11f
   16    1s i   sp4 12f          3s   3p4 12f
   16    1s i   sp4 13f          3s   3p4 13f
   16    1s i   sp4 14f          3s   3p4 14f
   16    1s i   sp4 15f          3s   3p4 15f
   16    1s i   sp4 16f          3s   3p4 16f
   -1
$run cray:rcn2c
$DELETE POOLG:HF160001.DAT;*
$DELETE POOLG:HF160002.DAT;*
$DELETE POOLG:HF160004.DAT;*
$DELETE POOLG:HF160031.DAT;*
$DELETE POOLG:HF160032.DAT;*
