$set def 1000
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf100007.dat for007
$assign poolg:hf100001.dat for001
$assign poolg:hf100002.dat for002
$assign poolg:hf100004.dat for004
$assign hf1000x.pun for011
$assign hf1000x.rrr for012
$assign hf1000x.dat for013
$assign hf1000xe.dat for014
$assign poolg:hf100031.dat for031
$assign poolg:hf100032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   10    1ne i   s2p6            2s2  2p6
   10    1ne i   s2p5 3p         2s2  2p5  3p
   10    1ne i   s2p5 4p         2s2  2p5  4p
   10    1ne i   s2p5 5p         2s2  2p5  5p
   10    1ne i   s2p5 6p         2s2  2p5  6p
   10    1ne i   s2p5 7p         2s2  2p5  7p
   10    1ne i   s2p5 8p         2s2  2p5  8p
   10    1ne i   s2p5 9p         2s2  2p5  9p
   10    1ne i   s2p5 10p        2s2  2p5 10p
   10    1ne i   s2p5 11p        2s2  2p5 11p
   10    1ne i   s2p5 12p        2s2  2p5 12p
   10    1ne i   s2p5 13p        2s2  2p5 13p
   10    1ne i   s2p5 14p        2s2  2p5 14p
   10    1ne i   s2p5 4f         2s2  2p5  4f
   10    1ne i   s2p5 5f         2s2  2p5  5f
   10    1ne i   s2p5 6f         2s2  2p5  6f
   10    1ne i   s2p5 7f         2s2  2p5  7f
   10    1ne i   s2p5 8f         2s2  2p5  8f
   10    1ne i   s2p5 9f         2s2  2p5  9f
   10    1ne i   s2p5 10f        2s2  2p5 10f
   10    1ne i   s2p5 11f        2s2  2p5 11f
   10    1ne i   s2p5 12f        2s2  2p5 12f
   10    1ne i   s2p5 13f        2s2  2p5 13f
   10    1ne i   s2p5 14f        2s2  2p5 14f
   10    1ne i   s2p5 6h         2s2  2p5  6h
   10    1ne i   s2p5 7h         2s2  2p5  7h
   10    1ne i   s2p5 8h         2s2  2p5  8h
   10    1ne i   s2p5 9h         2s2  2p5  9h
   10    1ne i   s2p5 8k         2s2  2p5  8k
   10    1ne i   s2p5 9k         2s2  2p5  9k
   10    1ne i   sp6 3s          2s   2p6  3s
   10    1ne i   sp6 4s          2s   2p6  4s
   10    1ne i   sp6 5s          2s   2p6  5s
   10    1ne i   sp6 6s          2s   2p6  6s
   10    1ne i   sp6 7s          2s   2p6  7s
   10    1ne i   sp6 8s          2s   2p6  8s
   10    1ne i   sp6 9s          2s   2p6  9s
   10    1ne i   sp6 10s         2s   2p6 10s
   10    1ne i   sp6 11s         2s   2p6 11s
   10    1ne i   sp6 12s         2s   2p6 12s
   10    1ne i   sp6 13s         2s   2p6 13s
   10    1ne i   sp6 14s         2s   2p6 14s
   10    1ne i   sp6 3d          2s   2p6  3d
   10    1ne i   sp6 4d          2s   2p6  4d
   10    1ne i   sp6 5d          2s   2p6  5d
   10    1ne i   sp6 6d          2s   2p6  6d
   10    1ne i   sp6 7d          2s   2p6  7d
   10    1ne i   sp6 8d          2s   2p6  8d
   10    1ne i   sp6 9d          2s   2p6  9d
   10    1ne i   sp6 10d         2s   2p6 10d
   10    1ne i   sp6 11d         2s   2p6 11d
   10    1ne i   sp6 12d         2s   2p6 12d
   10    1ne i   sp6 13d         2s   2p6 13d
   10    1ne i   sp6 14d         2s   2p6 14d
   10    1ne i   s2p5 3s         2s2  2p5  3s
   10    1ne i   s2p5 4s         2s2  2p5  4s
   10    1ne i   s2p5 5s         2s2  2p5  5s
   10    1ne i   s2p5 6s         2s2  2p5  6s
   10    1ne i   s2p5 7s         2s2  2p5  7s
   10    1ne i   s2p5 8s         2s2  2p5  8s
   10    1ne i   s2p5 9s         2s2  2p5  9s
   10    1ne i   s2p5 10s        2s2  2p5 10s
   10    1ne i   s2p5 11s        2s2  2p5 11s
   10    1ne i   s2p5 12s        2s2  2p5 12s
   10    1ne i   s2p5 13s        2s2  2p5 13s
   10    1ne i   s2p5 14s        2s2  2p5 14s
   10    1ne i   s2p5 3d         2s2  2p5  3d
   10    1ne i   s2p5 4d         2s2  2p5  4d
   10    1ne i   s2p5 5d         2s2  2p5  5d
   10    1ne i   s2p5 6d         2s2  2p5  6d
   10    1ne i   s2p5 7d         2s2  2p5  7d
   10    1ne i   s2p5 8d         2s2  2p5  8d
   10    1ne i   s2p5 9d         2s2  2p5  9d
   10    1ne i   s2p5 10d        2s2  2p5 10d
   10    1ne i   s2p5 11d        2s2  2p5 11d
   10    1ne i   s2p5 12d        2s2  2p5 12d
   10    1ne i   s2p5 13d        2s2  2p5 13d
   10    1ne i   s2p5 14d        2s2  2p5 14d
   10    1ne i   s2p5 5g         2s2  2p5  5g
   10    1ne i   s2p5 6g         2s2  2p5  6g
   10    1ne i   s2p5 7g         2s2  2p5  7g
   10    1ne i   s2p5 8g         2s2  2p5  8g
   10    1ne i   s2p5 9g         2s2  2p5  9g
   10    1ne i   s2p5 7i         2s2  2p5  7i
   10    1ne i   s2p5 8i         2s2  2p5  8i
   10    1ne i   s2p5 9i         2s2  2p5  9i
   10    1ne i   sp6 3p          2s   2p6  3p
   10    1ne i   sp6 4p          2s   2p6  4p
   10    1ne i   sp6 5p          2s   2p6  5p
   10    1ne i   sp6 6p          2s   2p6  6p
   10    1ne i   sp6 7p          2s   2p6  7p
   10    1ne i   sp6 8p          2s   2p6  8p
   10    1ne i   sp6 9p          2s   2p6  9p
   10    1ne i   sp6 10p         2s   2p6 10p
   10    1ne i   sp6 11p         2s   2p6 11p
   10    1ne i   sp6 12p         2s   2p6 12p
   10    1ne i   sp6 13p         2s   2p6 13p
   10    1ne i   sp6 14p         2s   2p6 14p
   10    1ne i   sp6 4f          2s   2p6  4f
   10    1ne i   sp6 5f          2s   2p6  5f
   10    1ne i   sp6 6f          2s   2p6  6f
   10    1ne i   sp6 7f          2s   2p6  7f
   10    1ne i   sp6 8f          2s   2p6  8f
   10    1ne i   sp6 9f          2s   2p6  9f
   10    1ne i   sp6 10f         2s   2p6 10f
   10    1ne i   sp6 11f         2s   2p6 11f
   10    1ne i   sp6 12f         2s   2p6 12f
   10    1ne i   sp6 13f         2s   2p6 13f
   10    1ne i   sp6 14f         2s   2p6 14f
   -1
$run cray:rcn2c
$DELETE POOLG:HF100001.DAT;*
$DELETE POOLG:HF100002.DAT;*
$DELETE POOLG:HF100004.DAT;*
$DELETE POOLG:HF100031.DAT;*
$DELETE POOLG:HF100032.DAT;*
