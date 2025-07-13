$set def 0801
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf080107.dat for007
$assign poolg:hf080101.dat for001
$assign poolg:hf080102.dat for002
$assign poolg:hf080104.dat for004
$assign hf0801x.pun for011
$assign hf0801x.rrr for012
$assign hf0801x.dat for013
$assign hf0801xe.dat for014
$assign poolg:hf080131.dat for031
$assign poolg:hf080132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    8    2O ii   s2p3            2s2  2p3
    8    2O ii   s2p2 3p         2s2  2p2  3p
    8    2O ii   s2p2 4p         2s2  2p2  4p
    8    2O ii   s2p2 5p         2s2  2p2  5p
    8    2O ii   s2p2 6p         2s2  2p2  6p
    8    2O ii   s2p2 7p         2s2  2p2  7p
    8    2O ii   s2p2 8p         2s2  2p2  8p
    8    2O ii   s2p2 9p         2s2  2p2  9p
    8    2O ii   s2p2 10p        2s2  2p2 10p
    8    2O ii   p5              2s0  2p5
    8    2O ii   p4 3p           2s0  2p4  3p
    8    2O ii   p4 4p           2s0  2p4  4p
    8    2O ii   p4 5p           2s0  2p4  5p
    8    2O ii   p4 6p           2s0  2p4  6p
    8    2O ii   p4 7p           2s0  2p4  7p
    8    2O ii   p4 8p           2s0  2p4  8p
    8    2O ii   p4 9p           2s0  2p4  9p
    8    2O ii   p4 10p          2s0  2p4 10p
    8    2O ii   s2p2 4f         2s2  2p2  4f
    8    2O ii   s2p2 5f         2s2  2p2  5f
    8    2O ii   s2p2 6f         2s2  2p2  6f
    8    2O ii   s2p2 7f         2s2  2p2  7f
    8    2O ii   s2p2 8f         2s2  2p2  8f
    8    2O ii   s2p2 9f         2s2  2p2  9f
    8    2O ii   s2p2 10f        2s2  2p2 10f
    8    2O ii   p4 4f           2s0  2p4  4f
    8    2O ii   p4 5f           2s0  2p4  5f
    8    2O ii   p4 6f           2s0  2p4  6f
    8    2O ii   p4 7f           2s0  2p4  7f
    8    2O ii   p4 8f           2s0  2p4  8f
    8    2O ii   p4 9f           2s0  2p4  9f
    8    2O ii   p4 10f          2s0  2p4 10f
    8    2O ii   s2p2 6h         2s2  2p2  6h
    8    2O ii   s2p2 7h         2s2  2p2  7h
    8    2O ii   s2p2 8h         2s2  2p2  8h
    8    2O ii   s2p2 9h         2s2  2p2  9h
    8    2O ii   p4 6h           2s0  2p4  6h
    8    2O ii   p4 7h           2s0  2p4  7h
    8    2O ii   p4 8h           2s0  2p4  8h
    8    2O ii   p4 9h           2s0  2p4  9h
    8    2O ii   s2p2 8k         2s2  2p2  8k
    8    2O ii   s2p2 9k         2s2  2p2  9k
    8    2O ii   p4 8k           2s0  2p4  8k
    8    2O ii   p4 9k           2s0  2p4  9k
    8    2O ii   sp3 3s          2s   2p3  3s
    8    2O ii   sp3 4s          2s   2p3  4s
    8    2O ii   sp3 5s          2s   2p3  5s
    8    2O ii   sp3 6s          2s   2p3  6s
    8    2O ii   sp3 7s          2s   2p3  7s
    8    2O ii   sp3 8s          2s   2p3  8s
    8    2O ii   sp3 9s          2s   2p3  9s
    8    2O ii   sp3 10s         2s   2p3 10s
    8    2O ii   sp3 3d          2s   2p3  3d
    8    2O ii   sp3 4d          2s   2p3  4d
    8    2O ii   sp3 5d          2s   2p3  5d
    8    2O ii   sp3 6d          2s   2p3  6d
    8    2O ii   sp3 7d          2s   2p3  7d
    8    2O ii   sp3 8d          2s   2p3  8d
    8    2O ii   sp3 9d          2s   2p3  9d
    8    2O ii   sp3 10d         2s   2p3 10d
    8    2O ii   s2p2 3s         2s2  2p2  3s
    8    2O ii   s2p2 4s         2s2  2p2  4s
    8    2O ii   s2p2 5s         2s2  2p2  5s
    8    2O ii   s2p2 6s         2s2  2p2  6s
    8    2O ii   s2p2 7s         2s2  2p2  7s
    8    2O ii   s2p2 8s         2s2  2p2  8s
    8    2O ii   s2p2 9s         2s2  2p2  9s
    8    2O ii   p4 3s           2s0  2p4  3s
    8    2O ii   p4 4s           2s0  2p4  4s
    8    2O ii   p4 5s           2s0  2p4  5s
    8    2O ii   p4 6s           2s0  2p4  6s
    8    2O ii   p4 7s           2s0  2p4  7s
    8    2O ii   p4 8s           2s0  2p4  8s
    8    2O ii   p4 9s           2s0  2p4  9s
    8    2O ii   s2p2 3d         2s2  2p2  3d
    8    2O ii   s2p2 4d         2s2  2p2  4d
    8    2O ii   s2p2 5d         2s2  2p2  5d
    8    2O ii   s2p2 6d         2s2  2p2  6d
    8    2O ii   s2p2 7d         2s2  2p2  7d
    8    2O ii   s2p2 8d         2s2  2p2  8d
    8    2O ii   s2p2 9d         2s2  2p2  9d
    8    2O ii   s2p2 10d        2s2  2p2 10d
    8    2O ii   p4 3d           2s0  2p4  3d
    8    2O ii   p4 4d           2s0  2p4  4d
    8    2O ii   p4 5d           2s0  2p4  5d
    8    2O ii   p4 6d           2s0  2p4  6d
    8    2O ii   p4 7d           2s0  2p4  7d
    8    2O ii   p4 8d           2s0  2p4  8d
    8    2O ii   p4 9d           2s0  2p4  9d
    8    2O ii   p4 10d          2s0  2p4 10d
    8    2O ii   s2p2 5g         2s2  2p2  5g
    8    2O ii   s2p2 6g         2s2  2p2  6g
    8    2O ii   s2p2 7g         2s2  2p2  7g
    8    2O ii   s2p2 8g         2s2  2p2  8g
    8    2O ii   s2p2 9g         2s2  2p2  9g
    8    2O ii   p4 5g           2s0  2p4  5g
    8    2O ii   p4 6g           2s0  2p4  6g
    8    2O ii   p4 7g           2s0  2p4  7g
    8    2O ii   p4 8g           2s0  2p4  8g
    8    2O ii   p4 9g           2s0  2p4  9g
    8    2O ii   s2p2 7i         2s2  2p2  7i
    8    2O ii   s2p2 8i         2s2  2p2  8i
    8    2O ii   s2p2 9i         2s2  2p2  9i
    8    2O ii   p4 7i           2s0  2p4  7i
    8    2O ii   p4 8i           2s0  2p4  8i
    8    2O ii   p4 9i           2s0  2p4  9i
    8    2O ii   sp4             2s   2p4
    8    2O ii   sp3 3p          2s   2p3  3p
    8    2O ii   sp3 4p          2s   2p3  4p
    8    2O ii   sp3 5p          2s   2p3  5p
    8    2O ii   sp3 6p          2s   2p3  6p
    8    2O ii   sp3 7p          2s   2p3  7p
    8    2O ii   sp3 8p          2s   2p3  8p
    8    2O ii   sp3 9p          2s   2p3  9p
    8    2O ii   sp3 4f          2s   2p3  4f
    8    2O ii   sp3 5f          2s   2p3  5f
    8    2O ii   sp3 6f          2s   2p3  6f
    8    2O ii   sp3 7f          2s   2p3  7f
    8    2O ii   sp3 8f          2s   2p3  8f
    8    2O ii   sp3 9f          2s   2p3  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF080101.DAT;*
$DELETE POOLG:HF080102.DAT;*
$DELETE POOLG:HF080104.DAT;*
$DELETE POOLG:HF080131.DAT;*
$DELETE POOLG:HF080132.DAT;*
