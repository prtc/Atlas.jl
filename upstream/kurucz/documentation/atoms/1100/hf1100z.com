$set def 1100
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf110007.dat for007
$assign poolg:hf110001.dat for001
$assign poolg:hf110002.dat for002
$assign poolg:hf110004.dat for004
$assign hf1100z.pun for011
$assign hf1100z.rrr for012
$assign hf1100z.dat for013
$assign hf1100ze.dat for014
$assign poolg:hf110031.dat for031
$assign poolg:hf110032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   11    1na i  2p6 3s           2p6  3s
   11    1na i  2p6 4s           2p6  4s
   11    1na i  2p6 5s           2p6  5s
   11    1na i  2p6 6s           2p6  6s
   11    1na i  2p6 7s           2p6  7s
   11    1na i  2p6 8s           2p6  8s
   11    1na i  2p6 9s           2p6  9s
   11    1na i  2p6 10s          2p6 10s
   11    1na i  2p6 11s          2p6 11s
   11    1na i  2p6 12s          2p6 12s
   11    1na i  2p6 13s          2p6 13s
   11    1na i  2p6 14s          2p6 14s
   11    1na i  2p6 3d           2p6  3d
   11    1na i  2p6 4d           2p6  4d
   11    1na i  2p6 5d           2p6  5d
   11    1na i  2p6 6d           2p6  6d
   11    1na i  2p6 7d           2p6  7d
   11    1na i  2p6 8d           2p6  8d
   11    1na i  2p6 9d           2p6  9d
   11    1na i  2p6 10d          2p6 10d
   11    1na i  2p6 11d          2p6 11d
   11    1na i  2p6 12d          2p6 12d
   11    1na i  2p6 13d          2p6 13d
   11    1na i  2p6 14d          2p6 14d
   11    1na i  2p6 5g           2p6  5g
   11    1na i  2p6 6g           2p6  6g
   11    1na i  2p6 7g           2p6  7g
   11    1na i  2p6 8g           2p6  8g
   11    1na i  2p6 9g           2p6  9g
   11    1na i  2p6 10g          2p6 10g
   11    1na i  2p6 11g          2p6 11g
   11    1na i  2p6 12g          2p6 12g
   11    1na i  2p6 13g          2p6 13g
   11    1na i  2p6 14g          2p6 14g
   11    1na i  2p6 7i           2p6  7i
   11    1na i  2p6 8i           2p6  8i
   11    1na i  2p6 9i           2p6  9i
   11    1na i  2p6 10i          2p6 10i
   11    1na i  2p6 11i          2p6 11i
   11    1na i  2p6 12i          2p6 12i
   11    1na i  2p6 13i          2p6 13i
   11    1na i  2p6 14i          2p6 14i
   11    1na i  2p5 3s3p         2p5  3s   3p
   11    1na i  2p5 3p3d         2p5  3p   3d
   11    1na i  2p6 3p           2p6  3p
   11    1na i  2p6 4p           2p6  4p
   11    1na i  2p6 5p           2p6  5p
   11    1na i  2p6 6p           2p6  6p
   11    1na i  2p6 7p           2p6  7p
   11    1na i  2p6 8p           2p6  8p
   11    1na i  2p6 9p           2p6  9p
   11    1na i  2p6 10p          2p6 10p
   11    1na i  2p6 11p          2p6 11p
   11    1na i  2p6 12p          2p6 12p
   11    1na i  2p6 13p          2p6 13p
   11    1na i  2p6 14p          2p6 14p
   11    1na i  2p6 4f           2p6  4f
   11    1na i  2p6 5f           2p6  5f
   11    1na i  2p6 6f           2p6  6f
   11    1na i  2p6 7f           2p6  7f
   11    1na i  2p6 8f           2p6  8f
   11    1na i  2p6 9f           2p6  9f
   11    1na i  2p6 10f          2p6 10f
   11    1na i  2p6 11f          2p6 11f
   11    1na i  2p6 12f          2p6 12f
   11    1na i  2p6 13f          2p6 13f
   11    1na i  2p6 14f          2p6 14f
   11    1na i  2p6 6h           2p6  6h
   11    1na i  2p6 7h           2p6  7h
   11    1na i  2p6 8h           2p6  8h
   11    1na i  2p6 9h           2p6  9h
   11    1na i  2p6 10h          2p6 10h
   11    1na i  2p6 11h          2p6 11h
   11    1na i  2p6 12h          2p6 12h
   11    1na i  2p6 13h          2p6 13h
   11    1na i  2p6 14h          2p6 14h
   11    1na i  2p6 8k           2p6  8k
   11    1na i  2p6 9k           2p6  9k
   11    1na i  2p6 10k          2p6 10k
   11    1na i  2p6 11k          2p6 11k
   11    1na i  2p6 12k          2p6 12k
   11    1na i  2p6 13k          2p6 13k
   11    1na i  2p6 14k          2p6 14k
   11    1na i  2p5 3s2          2p5  3s2
   11    1na i  2p5 3s3d         2p5  3s   3d
   11    1na i  2p5 3d2          2p5  3d2
   11    1na i  2p5 3p2          2p5  3p2
   -1
$run cray:rcn2c
$DELETE POOLG:HF110001.DAT;*
$DELETE POOLG:HF110002.DAT;*
$DELETE POOLG:HF110004.DAT;*
$DELETE POOLG:HF110031.DAT;*
$DELETE POOLG:HF110032.DAT;*
