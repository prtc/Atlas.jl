$set def 0401
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf040107.dat for007
$assign poolg:hf040101.dat for001
$assign poolg:hf040102.dat for002
$assign poolg:hf040104.dat for004
$assign hf0401z.pun for011
$assign hf0401z.rrr for012
$assign hf0401z.dat for013
$assign hf0401zE.dat for014
$assign poolg:hf040131.dat for031
$assign poolg:hf040132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    4    2be ii 1s2 2s           1s2  2s
    4    2be ii 1s2 3s           1s2  3s
    4    2be ii 1s2 4s           1s2  4s
    4    2be ii 1s2 5s           1s2  5s
    4    2be ii 1s2 6s           1s2  6s
    4    2be ii 1s2 7s           1s2  7s
    4    2be ii 1s2 8s           1s2  8s
    4    2be ii 1s2 9s           1s2  9s
    4    2be ii 1s2 10s          1s2 10s
    4    2be ii 1s2 11s          1s2 11s
    4    2be ii 1s2 12s          1s2 12s
    4    2be ii 1s2 3d           1s2  3d
    4    2be ii 1s2 4d           1s2  4d
    4    2be ii 1s2 5d           1s2  5d
    4    2be ii 1s2 6d           1s2  6d
    4    2be ii 1s2 7d           1s2  7d
    4    2be ii 1s2 8d           1s2  8d
    4    2be ii 1s2 9d           1s2  9d
    4    2be ii 1s2 10d          1s2 10d
    4    2be ii 1s2 11d          1s2 11d
    4    2be ii 1s2 12d          1s2 12d
    4    2be ii 1s2 5g           1s2  5g
    4    2be ii 1s2 6g           1s2  6g
    4    2be ii 1s2 7g           1s2  7g
    4    2be ii 1s2 8g           1s2  8g
    4    2be ii 1s2 9g           1s2  9g
    4    2be ii 1s2 10g          1s2 10g
    4    2be ii 1s2 11g          1s2 11g
    4    2be ii 1s2 12g          1s2 12g
    4    2be ii 1s2 7i           1s2  7i
    4    2be ii 1s2 8i           1s2  8i
    4    2be ii 1s2 9i           1s2  9i
    4    2be ii 1s2 10i          1s2 10i
    4    2be ii 1s2 11i          1s2 11i
    4    2be ii 1s2 12i          1s2 12i
    4    2be ii 1s2 2p           1s2  2p
    4    2be ii 1s2 3p           1s2  3p
    4    2be ii 1s2 4p           1s2  4p
    4    2be ii 1s2 5p           1s2  5p
    4    2be ii 1s2 6p           1s2  6p
    4    2be ii 1s2 7p           1s2  7p
    4    2be ii 1s2 8p           1s2  8p
    4    2be ii 1s2 9p           1s2  9p
    4    2be ii 1s2 10p          1s2 10p
    4    2be ii 1s2 11p          1s2 11p
    4    2be ii 1s2 12p          1s2 12p
    4    2be ii 1s2 4f           1s2  4f
    4    2be ii 1s2 5f           1s2  5f
    4    2be ii 1s2 6f           1s2  6f
    4    2be ii 1s2 7f           1s2  7f
    4    2be ii 1s2 8f           1s2  8f
    4    2be ii 1s2 9f           1s2  9f
    4    2be ii 1s2 10f          1s2 10f
    4    2be ii 1s2 11f          1s2 11f
    4    2be ii 1s2 12f          1s2 12f
    4    2be ii 1s2 6h           1s2  6h
    4    2be ii 1s2 7h           1s2  7h
    4    2be ii 1s2 8h           1s2  8h
    4    2be ii 1s2 9h           1s2  9h
    4    2be ii 1s2 10h          1s2 10h
    4    2be ii 1s2 11h          1s2 11h
    4    2be ii 1s2 12h          1s2 12h
    4    2be ii 1s2 8k           1s2  8k
    4    2be ii 1s2 9k           1s2  9k
    4    2be ii 1s2 10k          1s2 10k
    4    2be ii 1s2 11k          1s2 11k
    4    2be ii 1s2 12k          1s2 12k
   -1
$run cray:rcn2c
$DELETE POOLG:HF040101.DAT;*
$DELETE POOLG:HF040102.DAT;*
$DELETE POOLG:HF040104.DAT;*
$DELETE POOLG:HF040131.DAT;*
$DELETE POOLG:HF040132.DAT;*
