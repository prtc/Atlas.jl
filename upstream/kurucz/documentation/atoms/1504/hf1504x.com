$set def 1504
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf150407.dat for007
$assign poolg:hf150401.dat for001
$assign poolg:hf150402.dat for002
$assign poolg:hf150404.dat for004
$assign hf1504x.pun for011
$assign hf1504x.rrr for012
$assign hf1504x.dat for013
$assign hf1504xe.dat for014
$assign poolg:hf150431.dat for031
$assign poolg:hf150432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   15    5p v   2p6 3s           2p6  3s
   15    5p v   2p6 4s           2p6  4s
   15    5p v   2p6 5s           2p6  5s
   15    5p v   2p6 6s           2p6  6s
   15    5p v   2p6 7s           2p6  7s
   15    5p v   2p6 8s           2p6  8s
   15    5p v   2p6 9s           2p6  9s
   15    5p v   2p6 10s          2p6 10s
   15    5p v   2p6 11s          2p6 11s
   15    5p v   2p6 12s          2p6 12s
   15    5p v   2p6 13s          2p6 13s
   15    5p v   2p6 14s          2p6 14s
   15    5p v   2p6 3d           2p6  3d
   15    5p v   2p6 4d           2p6  4d
   15    5p v   2p6 5d           2p6  5d
   15    5p v   2p6 6d           2p6  6d
   15    5p v   2p6 7d           2p6  7d
   15    5p v   2p6 8d           2p6  8d
   15    5p v   2p6 9d           2p6  9d
   15    5p v   2p6 10d          2p6 10d
   15    5p v   2p6 11d          2p6 11d
   15    5p v   2p6 12d          2p6 12d
   15    5p v   2p6 13d          2p6 13d
   15    5p v   2p6 14d          2p6 14d
   15    5p v   2p6 5g           2p6  5g
   15    5p v   2p6 6g           2p6  6g
   15    5p v   2p6 7g           2p6  7g
   15    5p v   2p6 8g           2p6  8g
   15    5p v   2p6 9g           2p6  9g
   15    5p v   2p6 10g          2p6 10g
   15    5p v   2p6 11g          2p6 11g
   15    5p v   2p6 12g          2p6 12g
   15    5p v   2p6 13g          2p6 13g
   15    5p v   2p6 14g          2p6 14g
   15    5p v   2p6 7i           2p6  7i
   15    5p v   2p6 8i           2p6  8i
   15    5p v   2p6 9i           2p6  9i
   15    5p v   2p6 10i          2p6 10i
   15    5p v   2p6 11i          2p6 11i
   15    5p v   2p6 12i          2p6 12i
   15    5p v   2p6 13i          2p6 13i
   15    5p v   2p6 14i          2p6 14i
   15    5p v   2p5 3s3p         2p5  3s   3p
   15    5p v   2p5 3p3d         2p5  3p   3d
   15    5p v   2p6 3p           2p6  3p
   15    5p v   2p6 4p           2p6  4p
   15    5p v   2p6 5p           2p6  5p
   15    5p v   2p6 6p           2p6  6p
   15    5p v   2p6 7p           2p6  7p
   15    5p v   2p6 8p           2p6  8p
   15    5p v   2p6 9p           2p6  9p
   15    5p v   2p6 10p          2p6 10p
   15    5p v   2p6 11p          2p6 11p
   15    5p v   2p6 12p          2p6 12p
   15    5p v   2p6 13p          2p6 13p
   15    5p v   2p6 14p          2p6 14p
   15    5p v   2p6 4f           2p6  4f
   15    5p v   2p6 5f           2p6  5f
   15    5p v   2p6 6f           2p6  6f
   15    5p v   2p6 7f           2p6  7f
   15    5p v   2p6 8f           2p6  8f
   15    5p v   2p6 9f           2p6  9f
   15    5p v   2p6 10f          2p6 10f
   15    5p v   2p6 11f          2p6 11f
   15    5p v   2p6 12f          2p6 12f
   15    5p v   2p6 13f          2p6 13f
   15    5p v   2p6 14f          2p6 14f
   15    5p v   2p6 6h           2p6  6h
   15    5p v   2p6 7h           2p6  7h
   15    5p v   2p6 8h           2p6  8h
   15    5p v   2p6 9h           2p6  9h
   15    5p v   2p6 10h          2p6 10h
   15    5p v   2p6 11h          2p6 11h
   15    5p v   2p6 12h          2p6 12h
   15    5p v   2p6 13h          2p6 13h
   15    5p v   2p6 14h          2p6 14h
   15    5p v   2p6 8k           2p6  8k
   15    5p v   2p6 9k           2p6  9k
   15    5p v   2p6 10k          2p6 10k
   15    5p v   2p6 11k          2p6 11k
   15    5p v   2p6 12k          2p6 12k
   15    5p v   2p6 13k          2p6 13k
   15    5p v   2p6 14k          2p6 14k
   15    5p v   2p5 3s2          2p5  3s2
   15    5p v   2p5 3s3d         2p5  3s   3d
   15    5p v   2p5 3p2          2p5  3p2
   -1
$run cray:rcn2c
$DELETE POOLG:HF150401.DAT;*
$DELETE POOLG:HF150402.DAT;*
$DELETE POOLG:HF150404.DAT;*
$DELETE POOLG:HF150431.DAT;*
$DELETE POOLG:HF150432.DAT;*
