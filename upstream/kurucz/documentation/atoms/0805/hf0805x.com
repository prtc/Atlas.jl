$set def 0805
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf080507.dat for007
$assign poolg:hf080501.dat for001
$assign poolg:hf080502.dat for002
$assign poolg:hf080504.dat for004
$assign hf0805x.pun for011
$assign hf0805x.rrr for012
$assign hf0805x.dat for013
$assign hf0805XE.dat for014
$assign poolg:hf080531.dat for031
$assign poolg:hf080532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    8    6o vi  1s2 2s           1s2  2s
    8    6o vi  1s2 3s           1s2  3s
    8    6o vi  1s2 4s           1s2  4s
    8    6o vi  1s2 5s           1s2  5s
    8    6o vi  1s2 6s           1s2  6s
    8    6o vi  1s2 7s           1s2  7s
    8    6o vi  1s2 8s           1s2  8s
    8    6o vi  1s2 9s           1s2  9s
    8    6o vi  1s2 10s          1s2 10s
    8    6o vi  1s2 11s          1s2 11s
    8    6o vi  1s2 12s          1s2 12s
    8    6o vi  1s2s2            1s   2s2   
    8    6o vi  1s2s3s           1s   2s   3s
    8    6o vi  1s2s4s           1s   2s   4s
    8    6o vi  1s2s5s           1s   2s   5s
    8    6o vi  1s2s6s           1s   2s   6s
    8    6o vi  1s2s7s           1s   2s   7s
    8    6o vi  1s2s8s           1s   2s   8s
    8    6o vi  1s2s9s           1s   2s   9s
    8    6o vi  1s2s10s          1s   2s  10s
    8    6o vi  1s2s11s          1s   2s  11s
    8    6o vi  1s2s12s          1s   2s  12s
    8    6o vi  1s2 3d           1s2  3d
    8    6o vi  1s2 4d           1s2  4d
    8    6o vi  1s2 5d           1s2  5d
    8    6o vi  1s2 6d           1s2  6d
    8    6o vi  1s2 7d           1s2  7d
    8    6o vi  1s2 8d           1s2  8d
    8    6o vi  1s2 9d           1s2  9d
    8    6o vi  1s2 10d          1s2 10d
    8    6o vi  1s2 11d          1s2 11d
    8    6o vi  1s2 12d          1s2 12d
    8    6o vi  1s2s3d           1s   2s   3d
    8    6o vi  1s2s4d           1s   2s   4d
    8    6o vi  1s2s5d           1s   2s   5d
    8    6o vi  1s2s6d           1s   2s   6d
    8    6o vi  1s2s7d           1s   2s   7d
    8    6o vi  1s2s8d           1s   2s   8d
    8    6o vi  1s2s9d           1s   2s   9d
    8    6o vi  1s2s10d          1s   2s  10d
    8    6o vi  1s2s11d          1s   2s  11d
    8    6o vi  1s2s12d          1s   2s  12d
    8    6o vi  1s2p2            1s   2p2
    8    6o vi  1s2p3p           1s   2p   3p
    8    6o vi  1s2p4p           1s   2p   4p
    8    6o vi  1s2p5p           1s   2p   5p
    8    6o vi  1s2p6p           1s   2p   6p
    8    6o vi  1s2p7p           1s   2p   7p
    8    6o vi  1s2p8p           1s   2p   8p
    8    6o vi  1s2p9p           1s   2p   9p
    8    6o vi  1s2p10p          1s   2p  10p
    8    6o vi  1s2p11p          1s   2p  11p
    8    6o vi  1s2p12p          1s   2p  12p
    8    6o vi  1s2 5g           1s2  5g
    8    6o vi  1s2 6g           1s2  6g
    8    6o vi  1s2 7g           1s2  7g
    8    6o vi  1s2 8g           1s2  8g
    8    6o vi  1s2 9g           1s2  9g
    8    6o vi  1s2 10g          1s2 10g
    8    6o vi  1s2 11g          1s2 11g
    8    6o vi  1s2 12g          1s2 12g
    8    6o vi  1s2 7i           1s2  7i
    8    6o vi  1s2 8i           1s2  8i
    8    6o vi  1s2 9i           1s2  9i
    8    6o vi  1s2 10i          1s2 10i
    8    6o vi  1s2 11i          1s2 11i
    8    6o vi  1s2 12i          1s2 12i
    8    6o vi  1s2 2p           1s2  2p
    8    6o vi  1s2 3p           1s2  3p
    8    6o vi  1s2 4p           1s2  4p
    8    6o vi  1s2 5p           1s2  5p
    8    6o vi  1s2 6p           1s2  6p
    8    6o vi  1s2 7p           1s2  7p
    8    6o vi  1s2 8p           1s2  8p
    8    6o vi  1s2 9p           1s2  9p
    8    6o vi  1s2 10p          1s2 10p
    8    6o vi  1s2 11p          1s2 11p
    8    6o vi  1s2 12p          1s2 12p
    8    6o vi  1s2s2p           1s   2s   2p
    8    6o vi  1s2s3p           1s   2s   3p
    8    6o vi  1s2s4p           1s   2s   4p
    8    6o vi  1s2s5p           1s   2s   5p
    8    6o vi  1s2s6p           1s   2s   6p
    8    6o vi  1s2s7p           1s   2s   7p
    8    6o vi  1s2s8p           1s   2s   8p
    8    6o vi  1s2s9p           1s   2s   9p
    8    6o vi  1s2s10p          1s   2s  10p
    8    6o vi  1s2s11p          1s   2s  11p
    8    6o vi  1s2s12p          1s   2s  12p
    8    6o vi  1s2 4f           1s2  4f
    8    6o vi  1s2 5f           1s2  5f
    8    6o vi  1s2 6f           1s2  6f
    8    6o vi  1s2 7f           1s2  7f
    8    6o vi  1s2 8f           1s2  8f
    8    6o vi  1s2 9f           1s2  9f
    8    6o vi  1s2 10f          1s2 10f
    8    6o vi  1s2 11f          1s2 11f
    8    6o vi  1s2 12f          1s2 12f
    8    6o vi  1s2s4f           1s   2s   4f
    8    6o vi  1s2s5f           1s   2s   5f
    8    6o vi  1s2s6f           1s   2s   6f
    8    6o vi  1s2s7f           1s   2s   7f
    8    6o vi  1s2s8f           1s   2s   8f
    8    6o vi  1s2s9f           1s   2s   9f
    8    6o vi  1s2s10f          1s   2s  10f
    8    6o vi  1s2s11f          1s   2s  11f
    8    6o vi  1s2s12f          1s   2s  12f
    8    6o vi  1s2p3d           1s   2p   3d
    8    6o vi  1s2p4d           1s   2p   4d
    8    6o vi  1s2p5d           1s   2p   5d
    8    6o vi  1s2p6d           1s   2p   6d
    8    6o vi  1s2p7d           1s   2p   7d
    8    6o vi  1s2p8d           1s   2p   8d
    8    6o vi  1s2p9d           1s   2p   9d
    8    6o vi  1s2p10d          1s   2p  10d
    8    6o vi  1s2p11d          1s   2p  11d
    8    6o vi  1s2p12d          1s   2p  12d
    8    6o vi  1s2 6h           1s2  6h
    8    6o vi  1s2 7h           1s2  7h
    8    6o vi  1s2 8h           1s2  8h
    8    6o vi  1s2 9h           1s2  9h
    8    6o vi  1s2 10h          1s2 10h
    8    6o vi  1s2 11h          1s2 11h
    8    6o vi  1s2 12h          1s2 12h
    8    6o vi  1s2 8k           1s2  8k
    8    6o vi  1s2 9k           1s2  9k
    8    6o vi  1s2 10k          1s2 10k
    8    6o vi  1s2 11k          1s2 11k
    8    6o vi  1s2 12k          1s2 12k
   -1
$run cray:rcn2c
$DELETE POOLG:HF080501.DAT;*
$DELETE POOLG:HF080502.DAT;*
$DELETE POOLG:HF080504.DAT;*
$DELETE POOLG:HF080531.DAT;*
$DELETE POOLG:HF080532.DAT;*
