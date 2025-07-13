$set def 1302
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf130207.dat for007
$assign poolg:hf130201.dat for001
$assign poolg:hf130202.dat for002
$assign poolg:hf130204.dat for004
$assign hf1302x.pun for011
$assign hf1302x.rrr for012
$assign hf1302x.dat for013
$assign hf1302xe.dat for014
$assign poolg:hf130231.dat for031
$assign poolg:hf130232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   13    3aliii 2p6 3s           2p6  3s
   13    3aliii 2p6 4s           2p6  4s
   13    3aliii 2p6 5s           2p6  5s
   13    3aliii 2p6 6s           2p6  6s
   13    3aliii 2p6 7s           2p6  7s
   13    3aliii 2p6 8s           2p6  8s
   13    3aliii 2p6 9s           2p6  9s
   13    3aliii 2p6 10s          2p6 10s
   13    3aliii 2p6 11s          2p6 11s
   13    3aliii 2p6 12s          2p6 12s
   13    3aliii 2p6 13s          2p6 13s
   13    3aliii 2p6 14s          2p6 14s
   13    3aliii 2p6 3d           2p6  3d
   13    3aliii 2p6 4d           2p6  4d
   13    3aliii 2p6 5d           2p6  5d
   13    3aliii 2p6 6d           2p6  6d
   13    3aliii 2p6 7d           2p6  7d
   13    3aliii 2p6 8d           2p6  8d
   13    3aliii 2p6 9d           2p6  9d
   13    3aliii 2p6 10d          2p6 10d
   13    3aliii 2p6 11d          2p6 11d
   13    3aliii 2p6 12d          2p6 12d
   13    3aliii 2p6 13d          2p6 13d
   13    3aliii 2p6 14d          2p6 14d
   13    3aliii 2p6 5g           2p6  5g
   13    3aliii 2p6 6g           2p6  6g
   13    3aliii 2p6 7g           2p6  7g
   13    3aliii 2p6 8g           2p6  8g
   13    3aliii 2p6 9g           2p6  9g
   13    3aliii 2p6 10g          2p6 10g
   13    3aliii 2p6 11g          2p6 11g
   13    3aliii 2p6 12g          2p6 12g
   13    3aliii 2p6 13g          2p6 13g
   13    3aliii 2p6 14g          2p6 14g
   13    3aliii 2p6 7i           2p6  7i
   13    3aliii 2p6 8i           2p6  8i
   13    3aliii 2p6 9i           2p6  9i
   13    3aliii 2p6 10i          2p6 10i
   13    3aliii 2p6 11i          2p6 11i
   13    3aliii 2p6 12i          2p6 12i
   13    3aliii 2p6 13i          2p6 13i
   13    3aliii 2p6 14i          2p6 14i
   13    3aliii 2p5 3s3p         2p5  3s   3p
   13    3aliii 2p5 3p3d         2p5  3p   3d
   13    3aliii 2p6 3p           2p6  3p
   13    3aliii 2p6 4p           2p6  4p
   13    3aliii 2p6 5p           2p6  5p
   13    3aliii 2p6 6p           2p6  6p
   13    3aliii 2p6 7p           2p6  7p
   13    3aliii 2p6 8p           2p6  8p
   13    3aliii 2p6 9p           2p6  9p
   13    3aliii 2p6 10p          2p6 10p
   13    3aliii 2p6 11p          2p6 11p
   13    3aliii 2p6 12p          2p6 12p
   13    3aliii 2p6 13p          2p6 13p
   13    3aliii 2p6 14p          2p6 14p
   13    3aliii 2p6 4f           2p6  4f
   13    3aliii 2p6 5f           2p6  5f
   13    3aliii 2p6 6f           2p6  6f
   13    3aliii 2p6 7f           2p6  7f
   13    3aliii 2p6 8f           2p6  8f
   13    3aliii 2p6 9f           2p6  9f
   13    3aliii 2p6 10f          2p6 10f
   13    3aliii 2p6 11f          2p6 11f
   13    3aliii 2p6 12f          2p6 12f
   13    3aliii 2p6 13f          2p6 13f
   13    3aliii 2p6 14f          2p6 14f
   13    3aliii 2p6 6h           2p6  6h
   13    3aliii 2p6 7h           2p6  7h
   13    3aliii 2p6 8h           2p6  8h
   13    3aliii 2p6 9h           2p6  9h
   13    3aliii 2p6 10h          2p6 10h
   13    3aliii 2p6 11h          2p6 11h
   13    3aliii 2p6 12h          2p6 12h
   13    3aliii 2p6 13h          2p6 13h
   13    3aliii 2p6 14h          2p6 14h
   13    3aliii 2p6 8k           2p6  8k
   13    3aliii 2p6 9k           2p6  9k
   13    3aliii 2p6 10k          2p6 10k
   13    3aliii 2p6 11k          2p6 11k
   13    3aliii 2p6 12k          2p6 12k
   13    3aliii 2p6 13k          2p6 13k
   13    3aliii 2p6 14k          2p6 14k
   13    3aliii 2p5 3s2          2p5  3s2
   13    3aliii 2p5 3s3d         2p5  3s   3d
   13    3aliii 2p5 3p2          2p5  3p2
   -1
$run cray:rcn2c
$DELETE POOLG:HF130201.DAT;*
$DELETE POOLG:HF130202.DAT;*
$DELETE POOLG:HF130204.DAT;*
$DELETE POOLG:HF130231.DAT;*
$DELETE POOLG:HF130232.DAT;*
