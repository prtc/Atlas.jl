$set def 1201
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf120107.dat for007
$assign poolg:hf120101.dat for001
$assign poolg:hf120102.dat for002
$assign poolg:hf120104.dat for004
$assign hf1201z.pun for011
$assign hf1201z.rrr for012
$assign hf1201z.dat for013
$assign hf1201ze.dat for014
$assign poolg:hf120131.dat for031
$assign poolg:hf120132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   12    2mg ii 2p6 3s           2p6  3s
   12    2mg ii 2p6 4s           2p6  4s
   12    2mg ii 2p6 5s           2p6  5s
   12    2mg ii 2p6 6s           2p6  6s
   12    2mg ii 2p6 7s           2p6  7s
   12    2mg ii 2p6 8s           2p6  8s
   12    2mg ii 2p6 9s           2p6  9s
   12    2mg ii 2p6 10s          2p6 10s
   12    2mg ii 2p6 11s          2p6 11s
   12    2mg ii 2p6 12s          2p6 12s
   12    2mg ii 2p6 13s          2p6 13s
   12    2mg ii 2p6 14s          2p6 14s
   12    2mg ii 2p6 3d           2p6  3d
   12    2mg ii 2p6 4d           2p6  4d
   12    2mg ii 2p6 5d           2p6  5d
   12    2mg ii 2p6 6d           2p6  6d
   12    2mg ii 2p6 7d           2p6  7d
   12    2mg ii 2p6 8d           2p6  8d
   12    2mg ii 2p6 9d           2p6  9d
   12    2mg ii 2p6 10d          2p6 10d
   12    2mg ii 2p6 11d          2p6 11d
   12    2mg ii 2p6 12d          2p6 12d
   12    2mg ii 2p6 13d          2p6 13d
   12    2mg ii 2p6 14d          2p6 14d
   12    2mg ii 2p6 5g           2p6  5g
   12    2mg ii 2p6 6g           2p6  6g
   12    2mg ii 2p6 7g           2p6  7g
   12    2mg ii 2p6 8g           2p6  8g
   12    2mg ii 2p6 9g           2p6  9g
   12    2mg ii 2p6 10g          2p6 10g
   12    2mg ii 2p6 11g          2p6 11g
   12    2mg ii 2p6 12g          2p6 12g
   12    2mg ii 2p6 13g          2p6 13g
   12    2mg ii 2p6 14g          2p6 14g
   12    2mg ii 2p6 7i           2p6  7i
   12    2mg ii 2p6 8i           2p6  8i
   12    2mg ii 2p6 9i           2p6  9i
   12    2mg ii 2p6 10i          2p6 10i
   12    2mg ii 2p6 11i          2p6 11i
   12    2mg ii 2p6 12i          2p6 12i
   12    2mg ii 2p6 13i          2p6 13i
   12    2mg ii 2p6 14i          2p6 14i
   12    2mg ii 2p5 3s3p         2p5  3s   3p
   12    2mg ii 2p5 3p3d         2p5  3p   3d
   12    2mg ii 2p6 3p           2p6  3p
   12    2mg ii 2p6 4p           2p6  4p
   12    2mg ii 2p6 5p           2p6  5p
   12    2mg ii 2p6 6p           2p6  6p
   12    2mg ii 2p6 7p           2p6  7p
   12    2mg ii 2p6 8p           2p6  8p
   12    2mg ii 2p6 9p           2p6  9p
   12    2mg ii 2p6 10p          2p6 10p
   12    2mg ii 2p6 11p          2p6 11p
   12    2mg ii 2p6 12p          2p6 12p
   12    2mg ii 2p6 13p          2p6 13p
   12    2mg ii 2p6 14p          2p6 14p
   12    2mg ii 2p6 4f           2p6  4f
   12    2mg ii 2p6 5f           2p6  5f
   12    2mg ii 2p6 6f           2p6  6f
   12    2mg ii 2p6 7f           2p6  7f
   12    2mg ii 2p6 8f           2p6  8f
   12    2mg ii 2p6 9f           2p6  9f
   12    2mg ii 2p6 10f          2p6 10f
   12    2mg ii 2p6 11f          2p6 11f
   12    2mg ii 2p6 12f          2p6 12f
   12    2mg ii 2p6 13f          2p6 13f
   12    2mg ii 2p6 14f          2p6 14f
   12    2mg ii 2p6 6h           2p6  6h
   12    2mg ii 2p6 7h           2p6  7h
   12    2mg ii 2p6 8h           2p6  8h
   12    2mg ii 2p6 9h           2p6  9h
   12    2mg ii 2p6 10h          2p6 10h
   12    2mg ii 2p6 11h          2p6 11h
   12    2mg ii 2p6 12h          2p6 12h
   12    2mg ii 2p6 13h          2p6 13h
   12    2mg ii 2p6 14h          2p6 14h
   12    2mg ii 2p6 8k           2p6  8k
   12    2mg ii 2p6 9k           2p6  9k
   12    2mg ii 2p6 10k          2p6 10k
   12    2mg ii 2p6 11k          2p6 11k
   12    2mg ii 2p6 12k          2p6 12k
   12    2mg ii 2p6 13k          2p6 13k
   12    2mg ii 2p6 14k          2p6 14k
   12    2mg ii 2p5 3s2          2p5  3s2
   12    2mg ii 2p5 3s3d         2p5  3s   3d
   12    2mg ii 2p5 3d2          2p5  3d2
   12    2mg ii 2p5 3p2          2p5  3p2
   -1
$run cray:rcn2c
$DELETE POOLG:HF120101.DAT;*
$DELETE POOLG:HF120102.DAT;*
$DELETE POOLG:HF120104.DAT;*
$DELETE POOLG:HF120131.DAT;*
$DELETE POOLG:HF120132.DAT;*
