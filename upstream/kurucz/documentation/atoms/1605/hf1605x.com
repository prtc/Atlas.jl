$set def 1605
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf160507.dat for007
$assign poolg:hf160501.dat for001
$assign poolg:hf160502.dat for002
$assign poolg:hf160504.dat for004
$assign hf1605x.pun for011
$assign hf1605x.rrr for012
$assign hf1605x.dat for013
$assign hf1605xe.dat for014
$assign poolg:hf160531.dat for031
$assign poolg:hf160532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   16    6s vi  2p6 3s           2p6  3s
   16    6s vi  2p6 4s           2p6  4s
   16    6s vi  2p6 5s           2p6  5s
   16    6s vi  2p6 6s           2p6  6s
   16    6s vi  2p6 7s           2p6  7s
   16    6s vi  2p6 8s           2p6  8s
   16    6s vi  2p6 9s           2p6  9s
   16    6s vi  2p6 10s          2p6 10s
   16    6s vi  2p6 11s          2p6 11s
   16    6s vi  2p6 12s          2p6 12s
   16    6s vi  2p6 13s          2p6 13s
   16    6s vi  2p6 14s          2p6 14s
   16    6s vi  2p6 3d           2p6  3d
   16    6s vi  2p6 4d           2p6  4d
   16    6s vi  2p6 5d           2p6  5d
   16    6s vi  2p6 6d           2p6  6d
   16    6s vi  2p6 7d           2p6  7d
   16    6s vi  2p6 8d           2p6  8d
   16    6s vi  2p6 9d           2p6  9d
   16    6s vi  2p6 10d          2p6 10d
   16    6s vi  2p6 11d          2p6 11d
   16    6s vi  2p6 12d          2p6 12d
   16    6s vi  2p6 13d          2p6 13d
   16    6s vi  2p6 14d          2p6 14d
   16    6s vi  2p6 5g           2p6  5g
   16    6s vi  2p6 6g           2p6  6g
   16    6s vi  2p6 7g           2p6  7g
   16    6s vi  2p6 8g           2p6  8g
   16    6s vi  2p6 9g           2p6  9g
   16    6s vi  2p6 10g          2p6 10g
   16    6s vi  2p6 11g          2p6 11g
   16    6s vi  2p6 12g          2p6 12g
   16    6s vi  2p6 13g          2p6 13g
   16    6s vi  2p6 14g          2p6 14g
   16    6s vi  2p6 7i           2p6  7i
   16    6s vi  2p6 8i           2p6  8i
   16    6s vi  2p6 9i           2p6  9i
   16    6s vi  2p6 10i          2p6 10i
   16    6s vi  2p6 11i          2p6 11i
   16    6s vi  2p6 12i          2p6 12i
   16    6s vi  2p6 13i          2p6 13i
   16    6s vi  2p6 14i          2p6 14i
   16    6s vi  2p5 3s3p         2p5  3s   3p
   16    6s vi  2p5 3p3d         2p5  3p   3d
   16    6s vi  2p6 3p           2p6  3p
   16    6s vi  2p6 4p           2p6  4p
   16    6s vi  2p6 5p           2p6  5p
   16    6s vi  2p6 6p           2p6  6p
   16    6s vi  2p6 7p           2p6  7p
   16    6s vi  2p6 8p           2p6  8p
   16    6s vi  2p6 9p           2p6  9p
   16    6s vi  2p6 10p          2p6 10p
   16    6s vi  2p6 11p          2p6 11p
   16    6s vi  2p6 12p          2p6 12p
   16    6s vi  2p6 13p          2p6 13p
   16    6s vi  2p6 14p          2p6 14p
   16    6s vi  2p6 4f           2p6  4f
   16    6s vi  2p6 5f           2p6  5f
   16    6s vi  2p6 6f           2p6  6f
   16    6s vi  2p6 7f           2p6  7f
   16    6s vi  2p6 8f           2p6  8f
   16    6s vi  2p6 9f           2p6  9f
   16    6s vi  2p6 10f          2p6 10f
   16    6s vi  2p6 11f          2p6 11f
   16    6s vi  2p6 12f          2p6 12f
   16    6s vi  2p6 13f          2p6 13f
   16    6s vi  2p6 14f          2p6 14f
   16    6s vi  2p6 6h           2p6  6h
   16    6s vi  2p6 7h           2p6  7h
   16    6s vi  2p6 8h           2p6  8h
   16    6s vi  2p6 9h           2p6  9h
   16    6s vi  2p6 10h          2p6 10h
   16    6s vi  2p6 11h          2p6 11h
   16    6s vi  2p6 12h          2p6 12h
   16    6s vi  2p6 13h          2p6 13h
   16    6s vi  2p6 14h          2p6 14h
   16    6s vi  2p6 8k           2p6  8k
   16    6s vi  2p6 9k           2p6  9k
   16    6s vi  2p6 10k          2p6 10k
   16    6s vi  2p6 11k          2p6 11k
   16    6s vi  2p6 12k          2p6 12k
   16    6s vi  2p6 13k          2p6 13k
   16    6s vi  2p6 14k          2p6 14k
   16    6s vi  2p5 3s2          2p5  3s2
   16    6s vi  2p5 3s3d         2p5  3s   3d
   16    6s vi  2p5 3p2          2p5  3p2
   -1
$run cray:rcn2c
$DELETE POOLG:HF160501.DAT;*
$DELETE POOLG:HF160502.DAT;*
$DELETE POOLG:HF160504.DAT;*
$DELETE POOLG:HF160531.DAT;*
$DELETE POOLG:HF160532.DAT;*
