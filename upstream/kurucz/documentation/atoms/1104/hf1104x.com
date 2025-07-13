$set def 1104
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf110407.dat for007
$assign poolg:hf110401.dat for001
$assign poolg:hf110402.dat for002
$assign poolg:hf110404.dat for004
$assign hf1104x.pun for011
$assign hf1104x.rrr for012
$assign hf1104x.dat for013
$assign hf1104xe.dat for014
$assign poolg:hf110431.dat for031
$assign poolg:hf110432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   11    5na v   s2p3            2s2  2p3
   11    5na v   s2p2 3p         2s2  2p2  3p
   11    5na v   s2p2 4p         2s2  2p2  4p
   11    5na v   s2p2 5p         2s2  2p2  5p
   11    5na v   s2p2 6p         2s2  2p2  6p
   11    5na v   s2p2 7p         2s2  2p2  7p
   11    5na v   s2p2 8p         2s2  2p2  8p
   11    5na v   s2p2 9p         2s2  2p2  9p
   11    5na v   s2p2 10p        2s2  2p2 10p
   11    5na v   p5              2s0  2p5
   11    5na v   p4 3p           2s0  2p4  3p
   11    5na v   p4 4p           2s0  2p4  4p
   11    5na v   p4 5p           2s0  2p4  5p
   11    5na v   p4 6p           2s0  2p4  6p
   11    5na v   p4 7p           2s0  2p4  7p
   11    5na v   p4 8p           2s0  2p4  8p
   11    5na v   p4 9p           2s0  2p4  9p
   11    5na v   p4 10p          2s0  2p4 10p
   11    5na v   s2p2 4f         2s2  2p2  4f
   11    5na v   s2p2 5f         2s2  2p2  5f
   11    5na v   s2p2 6f         2s2  2p2  6f
   11    5na v   s2p2 7f         2s2  2p2  7f
   11    5na v   s2p2 8f         2s2  2p2  8f
   11    5na v   s2p2 9f         2s2  2p2  9f
   11    5na v   s2p2 10f        2s2  2p2 10f
   11    5na v   p4 4f           2s0  2p4  4f
   11    5na v   p4 5f           2s0  2p4  5f
   11    5na v   p4 6f           2s0  2p4  6f
   11    5na v   p4 7f           2s0  2p4  7f
   11    5na v   p4 8f           2s0  2p4  8f
   11    5na v   p4 9f           2s0  2p4  9f
   11    5na v   p4 10f          2s0  2p4 10f
   11    5na v   s2p2 6h         2s2  2p2  6h
   11    5na v   s2p2 7h         2s2  2p2  7h
   11    5na v   s2p2 8h         2s2  2p2  8h
   11    5na v   s2p2 9h         2s2  2p2  9h
   11    5na v   p4 6h           2s0  2p4  6h
   11    5na v   p4 7h           2s0  2p4  7h
   11    5na v   p4 8h           2s0  2p4  8h
   11    5na v   p4 9h           2s0  2p4  9h
   11    5na v   s2p2 8k         2s2  2p2  8k
   11    5na v   s2p2 9k         2s2  2p2  9k
   11    5na v   p4 8k           2s0  2p4  8k
   11    5na v   p4 9k           2s0  2p4  9k
   11    5na v   sp3 3s          2s   2p3  3s
   11    5na v   sp3 4s          2s   2p3  4s
   11    5na v   sp3 5s          2s   2p3  5s
   11    5na v   sp3 6s          2s   2p3  6s
   11    5na v   sp3 7s          2s   2p3  7s
   11    5na v   sp3 8s          2s   2p3  8s
   11    5na v   sp3 9s          2s   2p3  9s
   11    5na v   sp3 10s         2s   2p3 10s
   11    5na v   sp3 3d          2s   2p3  3d
   11    5na v   sp3 4d          2s   2p3  4d
   11    5na v   sp3 5d          2s   2p3  5d
   11    5na v   sp3 6d          2s   2p3  6d
   11    5na v   sp3 7d          2s   2p3  7d
   11    5na v   sp3 8d          2s   2p3  8d
   11    5na v   sp3 9d          2s   2p3  9d
   11    5na v   sp3 10d         2s   2p3 10d
   11    5na v   s2p2 3s         2s2  2p2  3s
   11    5na v   s2p2 4s         2s2  2p2  4s
   11    5na v   s2p2 5s         2s2  2p2  5s
   11    5na v   s2p2 6s         2s2  2p2  6s
   11    5na v   s2p2 7s         2s2  2p2  7s
   11    5na v   s2p2 8s         2s2  2p2  8s
   11    5na v   s2p2 9s         2s2  2p2  9s
   11    5na v   s2p2 10s        2s2  2p2 10s
   11    5na v   p4 3s           2s0  2p4  3s
   11    5na v   p4 4s           2s0  2p4  4s
   11    5na v   p4 5s           2s0  2p4  5s
   11    5na v   p4 6s           2s0  2p4  6s
   11    5na v   p4 7s           2s0  2p4  7s
   11    5na v   p4 8s           2s0  2p4  8s
   11    5na v   p4 9s           2s0  2p4  9s
   11    5na v   p4 10s          2s0  2p4 10s
   11    5na v   s2p2 3d         2s2  2p2  3d
   11    5na v   s2p2 4d         2s2  2p2  4d
   11    5na v   s2p2 5d         2s2  2p2  5d
   11    5na v   s2p2 6d         2s2  2p2  6d
   11    5na v   s2p2 7d         2s2  2p2  7d
   11    5na v   s2p2 8d         2s2  2p2  8d
   11    5na v   s2p2 9d         2s2  2p2  9d
   11    5na v   s2p2 10d        2s2  2p2 10d
   11    5na v   p4 3d           2s0  2p4  3d
   11    5na v   p4 4d           2s0  2p4  4d
   11    5na v   p4 5d           2s0  2p4  5d
   11    5na v   p4 6d           2s0  2p4  6d
   11    5na v   p4 7d           2s0  2p4  7d
   11    5na v   p4 8d           2s0  2p4  8d
   11    5na v   p4 9d           2s0  2p4  9d
   11    5na v   p4 10d          2s0  2p4 10d
   11    5na v   s2p2 5g         2s2  2p2  5g
   11    5na v   s2p2 6g         2s2  2p2  6g
   11    5na v   s2p2 7g         2s2  2p2  7g
   11    5na v   s2p2 8g         2s2  2p2  8g
   11    5na v   s2p2 9g         2s2  2p2  9g
   11    5na v   p4 5g           2s0  2p4  5g
   11    5na v   p4 6g           2s0  2p4  6g
   11    5na v   p4 7g           2s0  2p4  7g
   11    5na v   p4 8g           2s0  2p4  8g
   11    5na v   p4 9g           2s0  2p4  9g
   11    5na v   s2p2 7i         2s2  2p2  7i
   11    5na v   s2p2 8i         2s2  2p2  8i
   11    5na v   s2p2 9i         2s2  2p2  9i
   11    5na v   p4 7i           2s0  2p4  7i
   11    5na v   p4 8i           2s0  2p4  8i
   11    5na v   p4 9i           2s0  2p4  9i
   11    5na v   sp4             2s   2p4
   11    5na v   sp3 3p          2s   2p3  3p
   11    5na v   sp3 4p          2s   2p3  4p
   11    5na v   sp3 5p          2s   2p3  5p
   11    5na v   sp3 6p          2s   2p3  6p
   11    5na v   sp3 7p          2s   2p3  7p
   11    5na v   sp3 8p          2s   2p3  8p
   11    5na v   sp3 9p          2s   2p3  9p
   11    5na v   sp3 10p         2s   2p3 10p
   11    5na v   sp3 4f          2s   2p3  4f
   11    5na v   sp3 5f          2s   2p3  5f
   11    5na v   sp3 6f          2s   2p3  6f
   11    5na v   sp3 7f          2s   2p3  7f
   11    5na v   sp3 8f          2s   2p3  8f
   11    5na v   sp3 9f          2s   2p3  9f
   11    5na v   sp3 10f         2s   2p3 10f
   -1
$run cray:rcn2c
$DELETE POOLG:HF110401.DAT;*
$DELETE POOLG:HF110402.DAT;*
$DELETE POOLG:HF110404.DAT;*
$DELETE POOLG:HF110431.DAT;*
$DELETE POOLG:HF110432.DAT;*
