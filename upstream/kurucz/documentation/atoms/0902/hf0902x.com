$set def 0902
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf090207.dat for007
$assign poolg:hf090201.dat for001
$assign poolg:hf090202.dat for002
$assign poolg:hf090204.dat for004
$assign hf0902x.pun for011
$assign hf0902x.rrr for012
$assign hf0902x.dat for013
$assign hf0902xe.dat for014
$assign poolg:hf090231.dat for031
$assign poolg:hf090232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    9    3F iii  s2p3            2s2  2p3
    9    3F iii  s2p2 3p         2s2  2p2  3p
    9    3F iii  s2p2 4p         2s2  2p2  4p
    9    3F iii  s2p2 5p         2s2  2p2  5p
    9    3F iii  s2p2 6p         2s2  2p2  6p
    9    3F iii  s2p2 7p         2s2  2p2  7p
    9    3F iii  s2p2 8p         2s2  2p2  8p
    9    3F iii  s2p2 9p         2s2  2p2  9p
    9    3F iii  s2p2 10p        2s2  2p2 10p
    9    3F iii  p5              2s0  2p5
    9    3F iii  p4 3p           2s0  2p4  3p
    9    3F iii  p4 4p           2s0  2p4  4p
    9    3F iii  p4 5p           2s0  2p4  5p
    9    3F iii  p4 6p           2s0  2p4  6p
    9    3F iii  p4 7p           2s0  2p4  7p
    9    3F iii  p4 8p           2s0  2p4  8p
    9    3F iii  p4 9p           2s0  2p4  9p
    9    3F iii  p4 10p          2s0  2p4 10p
    9    3F iii  s2p2 4f         2s2  2p2  4f
    9    3F iii  s2p2 5f         2s2  2p2  5f
    9    3F iii  s2p2 6f         2s2  2p2  6f
    9    3F iii  s2p2 7f         2s2  2p2  7f
    9    3F iii  s2p2 8f         2s2  2p2  8f
    9    3F iii  s2p2 9f         2s2  2p2  9f
    9    3F iii  s2p2 10f        2s2  2p2 10f
    9    3F iii  p4 4f           2s0  2p4  4f
    9    3F iii  p4 5f           2s0  2p4  5f
    9    3F iii  p4 6f           2s0  2p4  6f
    9    3F iii  p4 7f           2s0  2p4  7f
    9    3F iii  p4 8f           2s0  2p4  8f
    9    3F iii  p4 9f           2s0  2p4  9f
    9    3F iii  p4 10f          2s0  2p4 10f
    9    3F iii  s2p2 6h         2s2  2p2  6h
    9    3F iii  s2p2 7h         2s2  2p2  7h
    9    3F iii  s2p2 8h         2s2  2p2  8h
    9    3F iii  s2p2 9h         2s2  2p2  9h
    9    3F iii  p4 6h           2s0  2p4  6h
    9    3F iii  p4 7h           2s0  2p4  7h
    9    3F iii  p4 8h           2s0  2p4  8h
    9    3F iii  p4 9h           2s0  2p4  9h
    9    3F iii  s2p2 8k         2s2  2p2  8k
    9    3F iii  s2p2 9k         2s2  2p2  9k
    9    3F iii  p4 8k           2s0  2p4  8k
    9    3F iii  p4 9k           2s0  2p4  9k
    9    3F iii  sp3 3s          2s   2p3  3s
    9    3F iii  sp3 4s          2s   2p3  4s
    9    3F iii  sp3 5s          2s   2p3  5s
    9    3F iii  sp3 6s          2s   2p3  6s
    9    3F iii  sp3 7s          2s   2p3  7s
    9    3F iii  sp3 8s          2s   2p3  8s
    9    3F iii  sp3 9s          2s   2p3  9s
    9    3F iii  sp3 10s         2s   2p3 10s
    9    3F iii  sp3 3d          2s   2p3  3d
    9    3F iii  sp3 4d          2s   2p3  4d
    9    3F iii  sp3 5d          2s   2p3  5d
    9    3F iii  sp3 6d          2s   2p3  6d
    9    3F iii  sp3 7d          2s   2p3  7d
    9    3F iii  sp3 8d          2s   2p3  8d
    9    3F iii  sp3 9d          2s   2p3  9d
    9    3F iii  sp3 10d         2s   2p3 10d
    9    3F iii  s2p2 3s         2s2  2p2  3s
    9    3F iii  s2p2 4s         2s2  2p2  4s
    9    3F iii  s2p2 5s         2s2  2p2  5s
    9    3F iii  s2p2 6s         2s2  2p2  6s
    9    3F iii  s2p2 7s         2s2  2p2  7s
    9    3F iii  s2p2 8s         2s2  2p2  8s
    9    3F iii  s2p2 9s         2s2  2p2  9s
    9    3F iii  s2p2 10s        2s2  2p2 10s
    9    3F iii  p4 3s           2s0  2p4  3s
    9    3F iii  p4 4s           2s0  2p4  4s
    9    3F iii  p4 5s           2s0  2p4  5s
    9    3F iii  p4 6s           2s0  2p4  6s
    9    3F iii  p4 7s           2s0  2p4  7s
    9    3F iii  p4 8s           2s0  2p4  8s
    9    3F iii  p4 9s           2s0  2p4  9s
    9    3F iii  p4 10s          2s0  2p4 10s
    9    3F iii  s2p2 3d         2s2  2p2  3d
    9    3F iii  s2p2 4d         2s2  2p2  4d
    9    3F iii  s2p2 5d         2s2  2p2  5d
    9    3F iii  s2p2 6d         2s2  2p2  6d
    9    3F iii  s2p2 7d         2s2  2p2  7d
    9    3F iii  s2p2 8d         2s2  2p2  8d
    9    3F iii  s2p2 9d         2s2  2p2  9d
    9    3F iii  s2p2 10d        2s2  2p2 10d
    9    3F iii  p4 3d           2s0  2p4  3d
    9    3F iii  p4 4d           2s0  2p4  4d
    9    3F iii  p4 5d           2s0  2p4  5d
    9    3F iii  p4 6d           2s0  2p4  6d
    9    3F iii  p4 7d           2s0  2p4  7d
    9    3F iii  p4 8d           2s0  2p4  8d
    9    3F iii  p4 9d           2s0  2p4  9d
    9    3F iii  p4 10d          2s0  2p4 10d
    9    3F iii  s2p2 5g         2s2  2p2  5g
    9    3F iii  s2p2 6g         2s2  2p2  6g
    9    3F iii  s2p2 7g         2s2  2p2  7g
    9    3F iii  s2p2 8g         2s2  2p2  8g
    9    3F iii  s2p2 9g         2s2  2p2  9g
    9    3F iii  p4 5g           2s0  2p4  5g
    9    3F iii  p4 6g           2s0  2p4  6g
    9    3F iii  p4 7g           2s0  2p4  7g
    9    3F iii  p4 8g           2s0  2p4  8g
    9    3F iii  p4 9g           2s0  2p4  9g
    9    3F iii  s2p2 7i         2s2  2p2  7i
    9    3F iii  s2p2 8i         2s2  2p2  8i
    9    3F iii  s2p2 9i         2s2  2p2  9i
    9    3F iii  p4 7i           2s0  2p4  7i
    9    3F iii  p4 8i           2s0  2p4  8i
    9    3F iii  p4 9i           2s0  2p4  9i
    9    3F iii  sp4             2s   2p4
    9    3F iii  sp3 3p          2s   2p3  3p
    9    3F iii  sp3 4p          2s   2p3  4p
    9    3F iii  sp3 5p          2s   2p3  5p
    9    3F iii  sp3 6p          2s   2p3  6p
    9    3F iii  sp3 7p          2s   2p3  7p
    9    3F iii  sp3 8p          2s   2p3  8p
    9    3F iii  sp3 9p          2s   2p3  9p
    9    3F iii  sp3 10p         2s   2p3 10p
    9    3F iii  sp3 4f          2s   2p3  4f
    9    3F iii  sp3 5f          2s   2p3  5f
    9    3F iii  sp3 6f          2s   2p3  6f
    9    3F iii  sp3 7f          2s   2p3  7f
    9    3F iii  sp3 8f          2s   2p3  8f
    9    3F iii  sp3 9f          2s   2p3  9f
    9    3F iii  sp3 10f         2s   2p3 10f
   -1
$run cray:rcn2c
$DELETE POOLG:HF090201.DAT;*
$DELETE POOLG:HF090202.DAT;*
$DELETE POOLG:HF090204.DAT;*
$DELETE POOLG:HF090231.DAT;*
$DELETE POOLG:HF090232.DAT;*
