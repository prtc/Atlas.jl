$set def 0700
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf070007.dat for007
$assign poolg:hf070001.dat for001
$assign poolg:hf070002.dat for002
$assign poolg:hf070004.dat for004
$assign hf0700x.pun for011
$assign hf0700x.rrr for012
$assign hf0700x.dat for013
$assign hf0700xe.dat for014
$assign poolg:hf070031.dat for031
$assign poolg:hf070032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    7    1n i    s2p3            2s2  2p3
    7    1n i    s2p2 3p         2s2  2p2  3p
    7    1n i    s2p2 4p         2s2  2p2  4p
    7    1n i    s2p2 5p         2s2  2p2  5p
    7    1n i    s2p2 6p         2s2  2p2  6p
    7    1n i    s2p2 7p         2s2  2p2  7p
    7    1n i    s2p2 8p         2s2  2p2  8p
    7    1n i    s2p2 9p         2s2  2p2  9p
    7    1n i    s2p2 10p        2s2  2p2 10p
    7    1n i    s2p2 11p        2s2  2p2 11p
    7    1n i    s2p2 12p        2s2  2p2 12p
    7    1n i    s2p2 13p        2s2  2p2 13p
    7    1n i    p5              2s0  2p5
    7    1n i    p4 3p           2s0  2p4  3p
    7    1n i    p4 4p           2s0  2p4  4p
    7    1n i    p4 5p           2s0  2p4  5p
    7    1n i    p4 6p           2s0  2p4  6p
    7    1n i    p4 7p           2s0  2p4  7p
    7    1n i    p4 8p           2s0  2p4  8p
    7    1n i    p4 9p           2s0  2p4  9p
    7    1n i    p4 10p          2s0  2p4 10p
    7    1n i    p4 11p          2s0  2p4 11p
    7    1n i    p4 12p          2s0  2p4 12p
    7    1n i    p4 13p          2s0  2p4 13p
    7    1n i    s2p2 4f         2s2  2p2  4f
    7    1n i    s2p2 5f         2s2  2p2  5f
    7    1n i    s2p2 6f         2s2  2p2  6f
    7    1n i    s2p2 7f         2s2  2p2  7f
    7    1n i    s2p2 8f         2s2  2p2  8f
    7    1n i    s2p2 9f         2s2  2p2  9f
    7    1n i    s2p2 10f        2s2  2p2 10f
    7    1n i    s2p2 11f        2s2  2p2 11f
    7    1n i    s2p2 12f        2s2  2p2 12f
    7    1n i    s2p2 13f        2s2  2p2 13f
    7    1n i    p4 4f           2s0  2p4  4f
    7    1n i    p4 5f           2s0  2p4  5f
    7    1n i    p4 6f           2s0  2p4  6f
    7    1n i    p4 7f           2s0  2p4  7f
    7    1n i    p4 8f           2s0  2p4  8f
    7    1n i    p4 9f           2s0  2p4  9f
    7    1n i    p4 10f          2s0  2p4 10f
    7    1n i    p4 11f          2s0  2p4 11f
    7    1n i    p4 12f          2s0  2p4 12f
    7    1n i    p4 13f          2s0  2p4 13f
    7    1n i    s2p2 6h         2s2  2p2  6h
    7    1n i    s2p2 7h         2s2  2p2  7h
    7    1n i    s2p2 8h         2s2  2p2  8h
    7    1n i    s2p2 9h         2s2  2p2  9h
    7    1n i    p4 6h           2s0  2p4  6h
    7    1n i    p4 7h           2s0  2p4  7h
    7    1n i    p4 8h           2s0  2p4  8h
    7    1n i    p4 9h           2s0  2p4  9h
    7    1n i    s2p2 8k         2s2  2p2  8k
    7    1n i    s2p2 9k         2s2  2p2  9k
    7    1n i    p4 8k           2s0  2p4  8k
    7    1n i    p4 9k           2s0  2p4  9k
    7    1n i    sp3 3s          2s   2p3  3s
    7    1n i    sp3 4s          2s   2p3  4s
    7    1n i    sp3 5s          2s   2p3  5s
    7    1n i    sp3 6s          2s   2p3  6s
    7    1n i    sp3 7s          2s   2p3  7s
    7    1n i    sp3 8s          2s   2p3  8s
    7    1n i    sp3 9s          2s   2p3  9s
    7    1n i    sp3 10s         2s   2p3 10s
    7    1n i    sp3 3d          2s   2p3  3d
    7    1n i    sp3 4d          2s   2p3  4d
    7    1n i    sp3 5d          2s   2p3  5d
    7    1n i    sp3 6d          2s   2p3  6d
    7    1n i    sp3 7d          2s   2p3  7d
    7    1n i    sp3 8d          2s   2p3  8d
    7    1n i    sp3 9d          2s   2p3  9d
    7    1n i    sp3 10d         2s   2p3 10d
    7    1n i    s2p2 3s         2s2  2p2  3s
    7    1n i    s2p2 4s         2s2  2p2  4s
    7    1n i    s2p2 5s         2s2  2p2  5s
    7    1n i    s2p2 6s         2s2  2p2  6s
    7    1n i    s2p2 7s         2s2  2p2  7s
    7    1n i    s2p2 8s         2s2  2p2  8s
    7    1n i    s2p2 9s         2s2  2p2  9s
    7    1n i    s2p2 10s        2s2  2p2 10s
    7    1n i    s2p2 11s        2s2  2p2 11s
    7    1n i    s2p2 12s        2s2  2p2 12s
    7    1n i    s2p2 13s        2s2  2p2 13s
    7    1n i    p4 3s           2s0  2p4  3s
    7    1n i    p4 4s           2s0  2p4  4s
    7    1n i    p4 5s           2s0  2p4  5s
    7    1n i    p4 6s           2s0  2p4  6s
    7    1n i    p4 7s           2s0  2p4  7s
    7    1n i    p4 8s           2s0  2p4  8s
    7    1n i    p4 9s           2s0  2p4  9s
    7    1n i    p4 10s          2s0  2p4 10s
    7    1n i    p4 11s          2s0  2p4 11s
    7    1n i    p4 12s          2s0  2p4 12s
    7    1n i    p4 13s          2s0  2p4 13s
    7    1n i    s2p2 3d         2s2  2p2  3d
    7    1n i    s2p2 4d         2s2  2p2  4d
    7    1n i    s2p2 5d         2s2  2p2  5d
    7    1n i    s2p2 6d         2s2  2p2  6d
    7    1n i    s2p2 7d         2s2  2p2  7d
    7    1n i    s2p2 8d         2s2  2p2  8d
    7    1n i    s2p2 9d         2s2  2p2  9d
    7    1n i    s2p2 10d        2s2  2p2 10d
    7    1n i    s2p2 11d        2s2  2p2 11d
    7    1n i    s2p2 12d        2s2  2p2 12d
    7    1n i    p4 3d           2s0  2p4  3d
    7    1n i    p4 4d           2s0  2p4  4d
    7    1n i    p4 5d           2s0  2p4  5d
    7    1n i    p4 6d           2s0  2p4  6d
    7    1n i    p4 7d           2s0  2p4  7d
    7    1n i    p4 8d           2s0  2p4  8d
    7    1n i    p4 9d           2s0  2p4  9d
    7    1n i    p4 10d          2s0  2p4 10d
    7    1n i    p4 11d          2s0  2p4 11d
    7    1n i    p4 12d          2s0  2p4 12d
    7    1n i    s2p2 5g         2s2  2p2  5g
    7    1n i    s2p2 6g         2s2  2p2  6g
    7    1n i    s2p2 7g         2s2  2p2  7g
    7    1n i    s2p2 8g         2s2  2p2  8g
    7    1n i    s2p2 9g         2s2  2p2  9g
    7    1n i    p4 5g           2s0  2p4  5g
    7    1n i    p4 6g           2s0  2p4  6g
    7    1n i    p4 7g           2s0  2p4  7g
    7    1n i    p4 8g           2s0  2p4  8g
    7    1n i    p4 9g           2s0  2p4  9g
    7    1n i    s2p2 7i         2s2  2p2  7i
    7    1n i    s2p2 8i         2s2  2p2  8i
    7    1n i    s2p2 9i         2s2  2p2  9i
    7    1n i    p4 7i           2s0  2p4  7i
    7    1n i    p4 8i           2s0  2p4  8i
    7    1n i    p4 9i           2s0  2p4  9i
    7    1n i    sp4             2s   2p4
    7    1n i    sp3 3p          2s   2p3  3p
    7    1n i    sp3 4p          2s   2p3  4p
    7    1n i    sp3 5p          2s   2p3  5p
    7    1n i    sp3 6p          2s   2p3  6p
    7    1n i    sp3 7p          2s   2p3  7p
    7    1n i    sp3 8p          2s   2p3  8p
    7    1n i    sp3 9p          2s   2p3  9p
    7    1n i    sp3 10p         2s   2p3 10p
    7    1n i    sp3 11p         2s   2p3 11p
    7    1n i    sp3 12p         2s   2p3 12p
    7    1n i    sp3 13p         2s   2p3 13p
    7    1n i    sp3 14p         2s   2p3 14p
    7    1n i    sp3 4f          2s   2p3  4f
    7    1n i    sp3 5f          2s   2p3  5f
    7    1n i    sp3 6f          2s   2p3  6f
    7    1n i    sp3 7f          2s   2p3  7f
    7    1n i    sp3 8f          2s   2p3  8f
    7    1n i    sp3 9f          2s   2p3  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF070001.DAT;*
$DELETE POOLG:HF070002.DAT;*
$DELETE POOLG:HF070004.DAT;*
$DELETE POOLG:HF070031.DAT;*
$DELETE POOLG:HF070032.DAT;*
