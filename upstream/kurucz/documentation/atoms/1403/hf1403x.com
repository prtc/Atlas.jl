$set def 1403
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf140307.dat for007
$assign poolg:hf140301.dat for001
$assign poolg:hf140302.dat for002
$assign poolg:hf140304.dat for004
$assign hf1403x.pun for011
$assign hf1403x.rrr for012
$assign hf1403x.dat for013
$assign hf1403xe.dat for014
$assign poolg:hf140331.dat for031
$assign poolg:hf140332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   14    4si iv 2p6 3s           2p6  3s
   14    4si iv 2p6 4s           2p6  4s
   14    4si iv 2p6 5s           2p6  5s
   14    4si iv 2p6 6s           2p6  6s
   14    4si iv 2p6 7s           2p6  7s
   14    4si iv 2p6 8s           2p6  8s
   14    4si iv 2p6 9s           2p6  9s
   14    4si iv 2p6 10s          2p6 10s
   14    4si iv 2p6 11s          2p6 11s
   14    4si iv 2p6 12s          2p6 12s
   14    4si iv 2p6 13s          2p6 13s
   14    4si iv 2p6 14s          2p6 14s
   14    4si iv 2p6 3d           2p6  3d
   14    4si iv 2p6 4d           2p6  4d
   14    4si iv 2p6 5d           2p6  5d
   14    4si iv 2p6 6d           2p6  6d
   14    4si iv 2p6 7d           2p6  7d
   14    4si iv 2p6 8d           2p6  8d
   14    4si iv 2p6 9d           2p6  9d
   14    4si iv 2p6 10d          2p6 10d
   14    4si iv 2p6 11d          2p6 11d
   14    4si iv 2p6 12d          2p6 12d
   14    4si iv 2p6 13d          2p6 13d
   14    4si iv 2p6 14d          2p6 14d
   14    4si iv 2p6 5g           2p6  5g
   14    4si iv 2p6 6g           2p6  6g
   14    4si iv 2p6 7g           2p6  7g
   14    4si iv 2p6 8g           2p6  8g
   14    4si iv 2p6 9g           2p6  9g
   14    4si iv 2p6 10g          2p6 10g
   14    4si iv 2p6 11g          2p6 11g
   14    4si iv 2p6 12g          2p6 12g
   14    4si iv 2p6 13g          2p6 13g
   14    4si iv 2p6 14g          2p6 14g
   14    4si iv 2p6 7i           2p6  7i
   14    4si iv 2p6 8i           2p6  8i
   14    4si iv 2p6 9i           2p6  9i
   14    4si iv 2p6 10i          2p6 10i
   14    4si iv 2p6 11i          2p6 11i
   14    4si iv 2p6 12i          2p6 12i
   14    4si iv 2p6 13i          2p6 13i
   14    4si iv 2p6 14i          2p6 14i
   14    4si iv 2p5 3s3p         2p5  3s   3p
   14    4si iv 2p5 3p3d         2p5  3p   3d
   14    4si iv 2p6 3p           2p6  3p
   14    4si iv 2p6 4p           2p6  4p
   14    4si iv 2p6 5p           2p6  5p
   14    4si iv 2p6 6p           2p6  6p
   14    4si iv 2p6 7p           2p6  7p
   14    4si iv 2p6 8p           2p6  8p
   14    4si iv 2p6 9p           2p6  9p
   14    4si iv 2p6 10p          2p6 10p
   14    4si iv 2p6 11p          2p6 11p
   14    4si iv 2p6 12p          2p6 12p
   14    4si iv 2p6 13p          2p6 13p
   14    4si iv 2p6 14p          2p6 14p
   14    4si iv 2p6 4f           2p6  4f
   14    4si iv 2p6 5f           2p6  5f
   14    4si iv 2p6 6f           2p6  6f
   14    4si iv 2p6 7f           2p6  7f
   14    4si iv 2p6 8f           2p6  8f
   14    4si iv 2p6 9f           2p6  9f
   14    4si iv 2p6 10f          2p6 10f
   14    4si iv 2p6 11f          2p6 11f
   14    4si iv 2p6 12f          2p6 12f
   14    4si iv 2p6 13f          2p6 13f
   14    4si iv 2p6 14f          2p6 14f
   14    4si iv 2p6 6h           2p6  6h
   14    4si iv 2p6 7h           2p6  7h
   14    4si iv 2p6 8h           2p6  8h
   14    4si iv 2p6 9h           2p6  9h
   14    4si iv 2p6 10h          2p6 10h
   14    4si iv 2p6 11h          2p6 11h
   14    4si iv 2p6 12h          2p6 12h
   14    4si iv 2p6 13h          2p6 13h
   14    4si iv 2p6 14h          2p6 14h
   14    4si iv 2p6 8k           2p6  8k
   14    4si iv 2p6 9k           2p6  9k
   14    4si iv 2p6 10k          2p6 10k
   14    4si iv 2p6 11k          2p6 11k
   14    4si iv 2p6 12k          2p6 12k
   14    4si iv 2p6 13k          2p6 13k
   14    4si iv 2p6 14k          2p6 14k
   14    4si iv 2p5 3s2          2p5  3s2
   14    4si iv 2p5 3s3d         2p5  3s   3d
   14    4si iv 2p5 3p2          2p5  3p2
   -1
$run cray:rcn2c
$DELETE POOLG:HF140301.DAT;*
$DELETE POOLG:HF140302.DAT;*
$DELETE POOLG:HF140304.DAT;*
$DELETE POOLG:HF140331.DAT;*
$DELETE POOLG:HF140332.DAT;*
