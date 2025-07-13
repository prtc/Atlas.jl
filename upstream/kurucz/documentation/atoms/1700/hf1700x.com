$set def 1700
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf170007.dat for007
$assign poolg:hf170001.dat for001
$assign poolg:hf170002.dat for002
$assign poolg:hf170004.dat for004
$assign hf1700x.pun for011
$assign hf1700x.rrr for012
$assign hf1700x.dat for013
$assign hf1700xe.dat for014
$assign poolg:hf170031.dat for031
$assign poolg:hf170032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   17    1cl i  s2p5             3s2  3p5
   17    1cl i  s2p4 4p          3s2  3p4  4p
   17    1cl i  s2p4 5p          3s2  3p4  5p
   17    1cl i  s2p4 6p          3s2  3p4  6p
   17    1cl i  s2p4 7p          3s2  3p4  7p
   17    1cl i  s2p4 8p          3s2  3p4  8p
   17    1cl i  s2p4 9p          3s2  3p4  9p
   17    1cl i  s2p4 10p         3s2  3p4 10p
   17    1cl i  s2p4 11p         3s2  3p4 11p
   17    1cl i  s2p4 12p         3s2  3p4 12p
   17    1cl i  3p6 4p           3p6  4p
   17    1cl i  3p6 5p           3p6  5p
   17    1cl i  3p6 6p           3p6  6p
   17    1cl i  3p6 7p           3p6  7p
   17    1cl i  3p6 8p           3p6  8p
   17    1cl i  3p6 9p           3p6  9p
   17    1cl i  3p6 10p          3p6 10p
   17    1cl i  3p6 11p          3p6 11p
   17    1cl i  3p6 12p          3p6 12p
   17    1cl i  s2p4 4f          3s2  3p4  4f
   17    1cl i  s2p4 5f          3s2  3p4  5f
   17    1cl i  s2p4 6f          3s2  3p4  6f
   17    1cl i  s2p4 7f          3s2  3p4  7f
   17    1cl i  s2p4 8f          3s2  3p4  8f
   17    1cl i  s2p4 9f          3s2  3p4  9f
   17    1cl i  3p6 4f           3p6  4f
   17    1cl i  3p6 5f           3p6  5f
   17    1cl i  3p6 6f           3p6  6f
   17    1cl i  3p6 7f           3p6  7f
   17    1cl i  3p6 8f           3p6  8f
   17    1cl i  3p6 9f           3p6  9f
   17    1cl i  s2p4 6h          3s2  3p4  6h
   17    1cl i  s2p4 7h          3s2  3p4  7h
   17    1cl i  s2p4 8h          3s2  3p4  8h
   17    1cl i  s2p4 9h          3s2  3p4  9h
   17    1cl i  3p6 6h           3p6  6h
   17    1cl i  3p6 7h           3p6  7h
   17    1cl i  3p6 8h           3p6  8h
   17    1cl i  3p6 9h           3p6  9h
   17    1cl i  s2p4 8k          3s2  3p4  8k
   17    1cl i  s2p4 9k          3s2  3p4  9k
   17    1cl i  3p6 8k           3p6  8k
   17    1cl i  3p6 9k           3p6  9k
   17    1cl i  sp5 4s           3s   3p5  4s
   17    1cl i  sp5 5s           3s   3p5  5s
   17    1cl i  sp5 6s           3s   3p5  6s
   17    1cl i  sp5 7s           3s   3p5  7s
   17    1cl i  sp5 8s           3s   3p5  8s
   17    1cl i  sp5 9s           3s   3p5  9s
   17    1cl i  sp5 10s          3s   3p5 10s
   17    1cl i  sp5 11s          3s   3p5 11s
   17    1cl i  sp5 12s          3s   3p5 12s
   17    1cl i  sp5 3d           3s   3p5  3d
   17    1cl i  sp5 4d           3s   3p5  4d
   17    1cl i  sp5 5d           3s   3p5  5d
   17    1cl i  sp5 6d           3s   3p5  6d
   17    1cl i  sp5 7d           3s   3p5  7d
   17    1cl i  sp5 8d           3s   3p5  8d
   17    1cl i  sp5 9d           3s   3p5  9d
   17    1cl i  sp5 10d          3s   3p5 10d
   17    1cl i  sp5 11d          3s   3p5 11d
   17    1cl i  s2p4 4s          3s2  3p4  4s
   17    1cl i  s2p4 5s          3s2  3p4  5s
   17    1cl i  s2p4 6s          3s2  3p4  6s
   17    1cl i  s2p4 7s          3s2  3p4  7s
   17    1cl i  s2p4 8s          3s2  3p4  8s
   17    1cl i  s2p4 9s          3s2  3p4  9s
   17    1cl i  s2p4 10s         3s2  3p4 10s
   17    1cl i  s2p4 11s         3s2  3p4 11s
   17    1cl i  s2p4 12s         3s2  3p4 12s
   17    1cl i  s2p4 13s         3s2  3p4 13s
   17    1cl i  3p6 4s           3p6  4s
   17    1cl i  3p6 5s           3p6  5s
   17    1cl i  3p6 6s           3p6  6s
   17    1cl i  3p6 7s           3p6  7s
   17    1cl i  3p6 8s           3p6  8s
   17    1cl i  3p6 9s           3p6  9s
   17    1cl i  3p6 10s          3p6 10s
   17    1cl i  3p6 11s          3p6 11s
   17    1cl i  3p6 12s          3p6 12s
   17    1cl i  3p6 13s          3p6 13s
   17    1cl i  s2p4 3d          3s2  3p4  3d
   17    1cl i  s2p4 4d          3s2  3p4  4d
   17    1cl i  s2p4 5d          3s2  3p4  5d
   17    1cl i  s2p4 6d          3s2  3p4  6d
   17    1cl i  s2p4 7d          3s2  3p4  7d
   17    1cl i  s2p4 8d          3s2  3p4  8d
   17    1cl i  s2p4 9d          3s2  3p4  9d
   17    1cl i  s2p4 10d         3s2  3p4 10d
   17    1cl i  s2p4 11d         3s2  3p4 11d
   17    1cl i  s2p4 12d         3s2  3p4 12d
   17    1cl i  s2p4 13d         3s2  3p4 13d
   17    1cl i  3p6 3d           3p6  3d
   17    1cl i  3p6 4d           3p6  4d
   17    1cl i  3p6 5d           3p6  5d
   17    1cl i  3p6 6d           3p6  6d
   17    1cl i  3p6 7d           3p6  7d
   17    1cl i  3p6 8d           3p6  8d
   17    1cl i  3p6 9d           3p6  9d
   17    1cl i  3p6 10d          3p6 10d
   17    1cl i  3p6 11d          3p6 11d
   17    1cl i  3p6 12d          3p6 12d
   17    1cl i  3p6 13d          3p6 13d
   17    1cl i  s2p4 5g          3s2  3p4  5g
   17    1cl i  s2p4 6g          3s2  3p4  6g
   17    1cl i  s2p4 7g          3s2  3p4  7g
   17    1cl i  s2p4 8g          3s2  3p4  8g
   17    1cl i  s2p4 9g          3s2  3p4  9g
   17    1cl i  s2p4 7i          3s2  3p4  7i
   17    1cl i  s2p4 8i          3s2  3p4  8i
   17    1cl i  s2p4 9i          3s2  3p4  9i
   17    1cl i  sp6              3s   3p6  
   17    1cl i  sp5 4p           3s   3p5  4p
   17    1cl i  sp5 5p           3s   3p5  5p
   17    1cl i  sp5 6p           3s   3p5  6p
   17    1cl i  sp5 7p           3s   3p5  7p
   17    1cl i  sp5 8p           3s   3p5  8p
   17    1cl i  sp5 9p           3s   3p5  9p
   17    1cl i  sp5 4f           3s   3p5  4f
   17    1cl i  sp5 5f           3s   3p5  5f
   17    1cl i  sp5 6f           3s   3p5  6f
   17    1cl i  sp5 7f           3s   3p5  7f
   -1
   -1
   17    1cl i  sp5 8f           3s   3p5  8f
   17    1cl i  sp5 9f           3s   3p5  9f
   17    1cl i  sp5 5g           3s   3p5  5g
   17    1cl i  sp5 6g           3s   3p5  6g
   17    1cl i  sp5 7g           3s   3p5  7g
   17    1cl i  sp5 8g           3s   3p5  8g
   17    1cl i  sp5 9g           3s   3p5  9g
   17    1cl i  sp5 6h           3s   3p5  6h
   17    1cl i  sp5 7h           3s   3p5  7h
   17    1cl i  sp5 8h           3s   3p5  8h
   17    1cl i  sp5 9h           3s   3p5  9h
   17    1cl i  sp5 7i           3s   3p5  7i
   17    1cl i  sp5 8i           3s   3p5  8i
   17    1cl i  sp5 9i           3s   3p5  9i
$run cray:rcn2c
$DELETE POOLG:HF170001.DAT;*
$DELETE POOLG:HF170002.DAT;*
$DELETE POOLG:HF170004.DAT;*
$DELETE POOLG:HF170031.DAT;*
$DELETE POOLG:HF170032.DAT;*
