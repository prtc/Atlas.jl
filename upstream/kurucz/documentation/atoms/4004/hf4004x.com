$set def ku6e:[kurucz.4004]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf400407.dat for007
$assign pool:hf400401.dat for001
$assign pool:hf400402.dat for002
$assign pool:hf400404.dat for004
$assign hf4004x.pun for011
$assign hf4004x.rrr for012
$assign hf4004x.dat for013
$assign hf4004xe.dat for014
$assign pool:hf400431.dat for031
$assign pool:hf400432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   40    5zr v   s2p6            4s2  4p6
   40    5zr v   s2p5 5p         4s2  4p5  5p
   40    5zr v   s2p5 6p         4s2  4p5  6p
   40    5zr v   s2p5 7p         4s2  4p5  7p
   40    5zr v   s2p5 8p         4s2  4p5  8p
   40    5zr v   s2p5 9p         4s2  4p5  9p
   40    5zr v   s2p5 10p        4s2  4p5 10p
   40    5zr v   s2p5 11p        4s2  4p5 11p
   40    5zr v   s2p5 12p        4s2  4p5 12p
   40    5zr v   s2p5 13p        4s2  4p5 13p
   40    5zr v   s2p5 4f         4s2  4p5  4f
   40    5zr v   s2p5 5f         4s2  4p5  5f
   40    5zr v   s2p5 6f         4s2  4p5  6f
   40    5zr v   s2p5 7f         4s2  4p5  7f
   40    5zr v   s2p5 8f         4s2  4p5  8f
   40    5zr v   s2p5 9f         4s2  4p5  9f
   40    5zr v   s2p5 10f        4s2  4p5 10f
   40    5zr v   s2p5 11f        4s2  4p5 11f
   40    5zr v   s2p5 12f        4s2  4p5 12f
   40    5zr v   s2p5 13f        4s2  4p5 13f
   40    5zr v   s2p5 6h         4s2  4p5  6h
   40    5zr v   s2p5 7h         4s2  4p5  7h
   40    5zr v   s2p5 8h         4s2  4p5  8h
   40    5zr v   s2p5 9h         4s2  4p5  9h
   40    5zr v   s2p5 10h        4s2  4p5 10h
   40    5zr v   s2p5 11h        4s2  4p5 11h
   40    5zr v   s2p5 12h        4s2  4p5 12h
   40    5zr v   s2p5 13h        4s2  4p5 13h
   40    5zr v   s2p5 8k         4s2  4p5  8k
   40    5zr v   s2p5 9k         4s2  4p5  9k
   40    5zr v   sp6 5s          4s   4p6  5s
   40    5zr v   sp6 6s          4s   4p6  6s
   40    5zr v   sp6 7s          4s   4p6  7s
   40    5zr v   sp6 8s          4s   4p6  8s
   40    5zr v   sp6 9s          4s   4p6  9s
   40    5zr v   sp6 10s         4s   4p6 10s
   40    5zr v   sp6 11s         4s   4p6 11s
   40    5zr v   sp6 12s         4s   4p6 12s
   40    5zr v   sp6 13s         4s   4p6 13s
   40    5zr v   sp6 4d          4s   4p6  4d
   40    5zr v   sp6 5d          4s   4p6  5d
   40    5zr v   sp6 6d          4s   4p6  6d
   40    5zr v   sp6 7d          4s   4p6  7d
   40    5zr v   sp6 8d          4s   4p6  8d
   40    5zr v   sp6 9d          4s   4p6  9d
   40    5zr v   sp6 10d         4s   4p6 10d
   40    5zr v   sp6 11d         4s   4p6 11d
   40    5zr v   sp6 12d         4s   4p6 12d
   40    5zr v   sp6 13d         4s   4p6 13d
   40    5zr v   s2p5 5s         4s2  4p5  5s
   40    5zr v   s2p5 6s         4s2  4p5  6s
   40    5zr v   s2p5 7s         4s2  4p5  7s
   40    5zr v   s2p5 8s         4s2  4p5  8s
   40    5zr v   s2p5 9s         4s2  4p5  9s
   40    5zr v   s2p5 10s        4s2  4p5 10s
   40    5zr v   s2p5 11s        4s2  4p5 11s
   40    5zr v   s2p5 12s        4s2  4p5 12s
   40    5zr v   s2p5 13s        4s2  4p5 13s
   40    5zr v   s2p5 4d         4s2  4p5  4d
   40    5zr v   s2p5 5d         4s2  4p5  5d
   40    5zr v   s2p5 6d         4s2  4p5  6d
   40    5zr v   s2p5 7d         4s2  4p5  7d
   40    5zr v   s2p5 8d         4s2  4p5  8d
   40    5zr v   s2p5 9d         4s2  4p5  9d
   40    5zr v   s2p5 10d        4s2  4p5 10d
   40    5zr v   s2p5 11d        4s2  4p5 11d
   40    5zr v   s2p5 12d        4s2  4p5 12d
   40    5zr v   s2p5 13d        4s2  4p5 13d
   40    5zr v   s2p5 5g         4s2  4p5  5g
   40    5zr v   s2p5 6g         4s2  4p5  6g
   40    5zr v   s2p5 7g         4s2  4p5  7g
   40    5zr v   s2p5 8g         4s2  4p5  8g
   40    5zr v   s2p5 9g         4s2  4p5  9g
   40    5zr v   s2p5 10g        4s2  4p5 10g
   40    5zr v   s2p5 11g        4s2  4p5 11g
   40    5zr v   s2p5 12g        4s2  4p5 12g
   40    5zr v   s2p5 13g        4s2  4p5 13g
   40    5zr v   s2p5 7i         4s2  4p5  7i
   40    5zr v   s2p5 8i         4s2  4p5  8i
   40    5zr v   s2p5 9i         4s2  4p5  9i
   40    5zr v   sp6 5p          4s   4p6  5p
   40    5zr v   sp6 6p          4s   4p6  6p
   40    5zr v   sp6 7p          4s   4p6  7p
   40    5zr v   sp6 8p          4s   4p6  8p
   40    5zr v   sp6 9p          4s   4p6  9p
   40    5zr v   sp6 10p         4s   4p6 10p
   40    5zr v   sp6 11p         4s   4p6 11p
   40    5zr v   sp6 12p         4s   4p6 12p
   40    5zr v   sp6 13p         4s   4p6 13p
   40    5zr v   sp6 4f          4s   4p6  4f
   40    5zr v   sp6 5f          4s   4p6  5f
   40    5zr v   sp6 6f          4s   4p6  6f
   40    5zr v   sp6 7f          4s   4p6  7f
   40    5zr v   sp6 8f          4s   4p6  8f
   40    5zr v   sp6 9f          4s   4p6  9f
   40    5zr v   sp6 10f         4s   4p6 10f
   40    5zr v   sp6 11f         4s   4p6 11f
   40    5zr v   sp6 12f         4s   4p6 12f
   40    5zr v   sp6 13f         4s   4p6 13f
   -1
$run cray:rcn2c
$DELETE POOL:HF400401.DAT;*
$DELETE POOL:HF400402.DAT;*
$DELETE POOL:HF400404.DAT;*
$DELETE POOL:HF400431.DAT;*
$DELETE POOL:HF400432.DAT;*
