$set def 1101
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf110107.dat for007
$assign poolg:hf110101.dat for001
$assign poolg:hf110102.dat for002
$assign poolg:hf110104.dat for004
$assign hf1101x.pun for011
$assign hf1101x.rrr for012
$assign hf1101x.dat for013
$assign hf1101xe.dat for014
$assign poolg:hf110131.dat for031
$assign poolg:hf110132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   11    2na ii  s2p6            2s2  2p6
   11    2na ii  s2p5 3p         2s2  2p5  3p
   11    2na ii  s2p5 4p         2s2  2p5  4p
   11    2na ii  s2p5 5p         2s2  2p5  5p
   11    2na ii  s2p5 6p         2s2  2p5  6p
   11    2na ii  s2p5 7p         2s2  2p5  7p
   11    2na ii  s2p5 8p         2s2  2p5  8p
   11    2na ii  s2p5 9p         2s2  2p5  9p
   11    2na ii  s2p5 10p        2s2  2p5 10p
   11    2na ii  s2p5 11p        2s2  2p5 11p
   11    2na ii  s2p5 12p        2s2  2p5 12p
   11    2na ii  s2p5 13p        2s2  2p5 13p
   11    2na ii  s2p5 14p        2s2  2p5 14p
   11    2na ii  s2p5 4f         2s2  2p5  4f
   11    2na ii  s2p5 5f         2s2  2p5  5f
   11    2na ii  s2p5 6f         2s2  2p5  6f
   11    2na ii  s2p5 7f         2s2  2p5  7f
   11    2na ii  s2p5 8f         2s2  2p5  8f
   11    2na ii  s2p5 9f         2s2  2p5  9f
   11    2na ii  s2p5 10f        2s2  2p5 10f
   11    2na ii  s2p5 11f        2s2  2p5 11f
   11    2na ii  s2p5 12f        2s2  2p5 12f
   11    2na ii  s2p5 13f        2s2  2p5 13f
   11    2na ii  s2p5 14f        2s2  2p5 14f
   11    2na ii  s2p5 6h         2s2  2p5  6h
   11    2na ii  s2p5 7h         2s2  2p5  7h
   11    2na ii  s2p5 8h         2s2  2p5  8h
   11    2na ii  s2p5 9h         2s2  2p5  9h
   11    2na ii  s2p5 8k         2s2  2p5  8k
   11    2na ii  s2p5 9k         2s2  2p5  9k
   11    2na ii  sp6 3s          2s   2p6  3s
   11    2na ii  sp6 4s          2s   2p6  4s
   11    2na ii  sp6 5s          2s   2p6  5s
   11    2na ii  sp6 6s          2s   2p6  6s
   11    2na ii  sp6 7s          2s   2p6  7s
   11    2na ii  sp6 8s          2s   2p6  8s
   11    2na ii  sp6 9s          2s   2p6  9s
   11    2na ii  sp6 10s         2s   2p6 10s
   11    2na ii  sp6 11s         2s   2p6 11s
   11    2na ii  sp6 12s         2s   2p6 12s
   11    2na ii  sp6 13s         2s   2p6 13s
   11    2na ii  sp6 14s         2s   2p6 14s
   11    2na ii  sp6 3d          2s   2p6  3d
   11    2na ii  sp6 4d          2s   2p6  4d
   11    2na ii  sp6 5d          2s   2p6  5d
   11    2na ii  sp6 6d          2s   2p6  6d
   11    2na ii  sp6 7d          2s   2p6  7d
   11    2na ii  sp6 8d          2s   2p6  8d
   11    2na ii  sp6 9d          2s   2p6  9d
   11    2na ii  sp6 10d         2s   2p6 10d
   11    2na ii  sp6 11d         2s   2p6 11d
   11    2na ii  sp6 12d         2s   2p6 12d
   11    2na ii  sp6 13d         2s   2p6 13d
   11    2na ii  sp6 14d         2s   2p6 14d
   11    2na ii  s2p5 3s         2s2  2p5  3s
   11    2na ii  s2p5 4s         2s2  2p5  4s
   11    2na ii  s2p5 5s         2s2  2p5  5s
   11    2na ii  s2p5 6s         2s2  2p5  6s
   11    2na ii  s2p5 7s         2s2  2p5  7s
   11    2na ii  s2p5 8s         2s2  2p5  8s
   11    2na ii  s2p5 9s         2s2  2p5  9s
   11    2na ii  s2p5 10s        2s2  2p5 10s
   11    2na ii  s2p5 11s        2s2  2p5 11s
   11    2na ii  s2p5 12s        2s2  2p5 12s
   11    2na ii  s2p5 13s        2s2  2p5 13s
   11    2na ii  s2p5 14s        2s2  2p5 14s
   11    2na ii  s2p5 3d         2s2  2p5  3d
   11    2na ii  s2p5 4d         2s2  2p5  4d
   11    2na ii  s2p5 5d         2s2  2p5  5d
   11    2na ii  s2p5 6d         2s2  2p5  6d
   11    2na ii  s2p5 7d         2s2  2p5  7d
   11    2na ii  s2p5 8d         2s2  2p5  8d
   11    2na ii  s2p5 9d         2s2  2p5  9d
   11    2na ii  s2p5 10d        2s2  2p5 10d
   11    2na ii  s2p5 11d        2s2  2p5 11d
   11    2na ii  s2p5 12d        2s2  2p5 12d
   11    2na ii  s2p5 13d        2s2  2p5 13d
   11    2na ii  s2p5 14d        2s2  2p5 14d
   11    2na ii  s2p5 5g         2s2  2p5  5g
   11    2na ii  s2p5 6g         2s2  2p5  6g
   11    2na ii  s2p5 7g         2s2  2p5  7g
   11    2na ii  s2p5 8g         2s2  2p5  8g
   11    2na ii  s2p5 9g         2s2  2p5  9g
   11    2na ii  s2p5 7i         2s2  2p5  7i
   11    2na ii  s2p5 8i         2s2  2p5  8i
   11    2na ii  s2p5 9i         2s2  2p5  9i
   11    2na ii  sp6 3p          2s   2p6  3p
   11    2na ii  sp6 4p          2s   2p6  4p
   11    2na ii  sp6 5p          2s   2p6  5p
   11    2na ii  sp6 6p          2s   2p6  6p
   11    2na ii  sp6 7p          2s   2p6  7p
   11    2na ii  sp6 8p          2s   2p6  8p
   11    2na ii  sp6 9p          2s   2p6  9p
   11    2na ii  sp6 10p         2s   2p6 10p
   11    2na ii  sp6 11p         2s   2p6 11p
   11    2na ii  sp6 12p         2s   2p6 12p
   11    2na ii  sp6 13p         2s   2p6 13p
   11    2na ii  sp6 14p         2s   2p6 14p
   11    2na ii  sp6 4f          2s   2p6  4f
   11    2na ii  sp6 5f          2s   2p6  5f
   11    2na ii  sp6 6f          2s   2p6  6f
   11    2na ii  sp6 7f          2s   2p6  7f
   11    2na ii  sp6 8f          2s   2p6  8f
   11    2na ii  sp6 9f          2s   2p6  9f
   11    2na ii  sp6 10f         2s   2p6 10f
   11    2na ii  sp6 11f         2s   2p6 11f
   11    2na ii  sp6 12f         2s   2p6 12f
   11    2na ii  sp6 13f         2s   2p6 13f
   11    2na ii  sp6 14f         2s   2p6 14f
   -1
$run cray:rcn2c
$DELETE POOLG:HF110101.DAT;*
$DELETE POOLG:HF110102.DAT;*
$DELETE POOLG:HF110104.DAT;*
$DELETE POOLG:HF110131.DAT;*
$DELETE POOLG:HF110132.DAT;*
