$set def 0502
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf050207.dat for007
$assign poolg:hf050201.dat for001
$assign poolg:hf050202.dat for002
$assign poolg:hf050204.dat for004
$assign hf0502z.pun for011
$assign hf0502z.rrr for012
$assign hf0502z.dat for013
$assign hf0502zE.dat for014
$assign poolg:hf050231.dat for031
$assign poolg:hf050232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    5    3b iii 1s2 2s           1s2  2s
    5    3b iii 1s2 3s           1s2  3s
    5    3b iii 1s2 4s           1s2  4s
    5    3b iii 1s2 5s           1s2  5s
    5    3b iii 1s2 6s           1s2  6s
    5    3b iii 1s2 7s           1s2  7s
    5    3b iii 1s2 8s           1s2  8s
    5    3b iii 1s2 9s           1s2  9s
    5    3b iii 1s2 10s          1s2 10s
    5    3b iii 1s2 11s          1s2 11s
    5    3b iii 1s2 12s          1s2 12s
    5    3b iii 1s2 3d           1s2  3d
    5    3b iii 1s2 4d           1s2  4d
    5    3b iii 1s2 5d           1s2  5d
    5    3b iii 1s2 6d           1s2  6d
    5    3b iii 1s2 7d           1s2  7d
    5    3b iii 1s2 8d           1s2  8d
    5    3b iii 1s2 9d           1s2  9d
    5    3b iii 1s2 10d          1s2 10d
    5    3b iii 1s2 11d          1s2 11d
    5    3b iii 1s2 12d          1s2 12d
    5    3b iii 1s2 5g           1s2  5g
    5    3b iii 1s2 6g           1s2  6g
    5    3b iii 1s2 7g           1s2  7g
    5    3b iii 1s2 8g           1s2  8g
    5    3b iii 1s2 9g           1s2  9g
    5    3b iii 1s2 10g          1s2 10g
    5    3b iii 1s2 11g          1s2 11g
    5    3b iii 1s2 12g          1s2 12g
    5    3b iii 1s2 7i           1s2  7i
    5    3b iii 1s2 8i           1s2  8i
    5    3b iii 1s2 9i           1s2  9i
    5    3b iii 1s2 10i          1s2 10i
    5    3b iii 1s2 11i          1s2 11i
    5    3b iii 1s2 12i          1s2 12i
    5    3b iii 1s2 2p           1s2  2p
    5    3b iii 1s2 3p           1s2  3p
    5    3b iii 1s2 4p           1s2  4p
    5    3b iii 1s2 5p           1s2  5p
    5    3b iii 1s2 6p           1s2  6p
    5    3b iii 1s2 7p           1s2  7p
    5    3b iii 1s2 8p           1s2  8p
    5    3b iii 1s2 9p           1s2  9p
    5    3b iii 1s2 10p          1s2 10p
    5    3b iii 1s2 11p          1s2 11p
    5    3b iii 1s2 12p          1s2 12p
    5    3b iii 1s2 4f           1s2  4f
    5    3b iii 1s2 5f           1s2  5f
    5    3b iii 1s2 6f           1s2  6f
    5    3b iii 1s2 7f           1s2  7f
    5    3b iii 1s2 8f           1s2  8f
    5    3b iii 1s2 9f           1s2  9f
    5    3b iii 1s2 10f          1s2 10f
    5    3b iii 1s2 11f          1s2 11f
    5    3b iii 1s2 12f          1s2 12f
    5    3b iii 1s2 6h           1s2  6h
    5    3b iii 1s2 7h           1s2  7h
    5    3b iii 1s2 8h           1s2  8h
    5    3b iii 1s2 9h           1s2  9h
    5    3b iii 1s2 10h          1s2 10h
    5    3b iii 1s2 11h          1s2 11h
    5    3b iii 1s2 12h          1s2 12h
    5    3b iii 1s2 8k           1s2  8k
    5    3b iii 1s2 9k           1s2  9k
    5    3b iii 1s2 10k          1s2 10k
    5    3b iii 1s2 11k          1s2 11k
    5    3b iii 1s2 12k          1s2 12k
   -1
$run cray:rcn2c
$DELETE POOLG:HF050201.DAT;*
$DELETE POOLG:HF050202.DAT;*
$DELETE POOLG:HF050204.DAT;*
$DELETE POOLG:HF050231.DAT;*
$DELETE POOLG:HF050232.DAT;*
