$set def 1203
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf120307.dat for007
$assign poolg:hf120301.dat for001
$assign poolg:hf120302.dat for002
$assign poolg:hf120304.dat for004
$assign hf1203x.pun for011
$assign hf1203x.rrr for012
$assign hf1203x.dat for013
$assign hf1203xe.dat for014
$assign poolg:hf120331.dat for031
$assign poolg:hf120332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   12    4mg iv  s2p5            2s2  2p5
   12    4mg iv  s2p4 3p         2s2  2p4  3p
   12    4mg iv  s2p4 4p         2s2  2p4  4p
   12    4mg iv  s2p4 5p         2s2  2p4  5p
   12    4mg iv  s2p4 6p         2s2  2p4  6p
   12    4mg iv  s2p4 7p         2s2  2p4  7p
   12    4mg iv  s2p4 8p         2s2  2p4  8p
   12    4mg iv  s2p4 9p         2s2  2p4  9p
   12    4mg iv  s2p4 10p        2s2  2p4 10p
   12    4mg iv  s2p4 11p        2s2  2p4 11p
   12    4mg iv  s2p4 12p        2s2  2p4 12p
   12    4mg iv  s2p4 4f         2s2  2p4  4f
   12    4mg iv  s2p4 5f         2s2  2p4  5f
   12    4mg iv  s2p4 6f         2s2  2p4  6f
   12    4mg iv  s2p4 7f         2s2  2p4  7f
   12    4mg iv  s2p4 8f         2s2  2p4  8f
   12    4mg iv  s2p4 9f         2s2  2p4  9f
   12    4mg iv  s2p4 10f        2s2  2p4 10f
   12    4mg iv  s2p4 11f        2s2  2p4 11f
   12    4mg iv  s2p4 12f        2s2  2p4 12f
   12    4mg iv  s2p4 6h         2s2  2p4  6h
   12    4mg iv  s2p4 7h         2s2  2p4  7h
   12    4mg iv  s2p4 8h         2s2  2p4  8h
   12    4mg iv  s2p4 9h         2s2  2p4  9h
   12    4mg iv  s2p4 8k         2s2  2p4  8k
   12    4mg iv  s2p4 9k         2s2  2p4  9k
   12    4mg iv  sp5 3s          2s   2p5  3s
   12    4mg iv  sp5 4s          2s   2p5  4s
   12    4mg iv  sp5 5s          2s   2p5  5s
   12    4mg iv  sp5 6s          2s   2p5  6s
   12    4mg iv  sp5 7s          2s   2p5  7s
   12    4mg iv  sp5 8s          2s   2p5  8s
   12    4mg iv  sp5 9s          2s   2p5  9s
   12    4mg iv  sp5 10s         2s   2p5 10s
   12    4mg iv  sp5 11s         2s   2p5 11s
   12    4mg iv  sp5 12s         2s   2p5 12s
   12    4mg iv  sp5 3d          2s   2p5  3d
   12    4mg iv  sp5 4d          2s   2p5  4d
   12    4mg iv  sp5 5d          2s   2p5  5d
   12    4mg iv  sp5 6d          2s   2p5  6d
   12    4mg iv  sp5 7d          2s   2p5  7d
   12    4mg iv  sp5 8d          2s   2p5  8d
   12    4mg iv  sp5 9d          2s   2p5  9d
   12    4mg iv  sp5 10d         2s   2p5 10d
   12    4mg iv  sp5 11d         2s   2p5 11d
   12    4mg iv  sp5 12d         2s   2p5 12d
   12    4mg iv  s2p4 3s         2s2  2p4  3s
   12    4mg iv  s2p4 4s         2s2  2p4  4s
   12    4mg iv  s2p4 5s         2s2  2p4  5s
   12    4mg iv  s2p4 6s         2s2  2p4  6s
   12    4mg iv  s2p4 7s         2s2  2p4  7s
   12    4mg iv  s2p4 8s         2s2  2p4  8s
   12    4mg iv  s2p4 9s         2s2  2p4  9s
   12    4mg iv  s2p4 10s        2s2  2p4 10s
   12    4mg iv  s2p4 11s        2s2  2p4 11s
   12    4mg iv  s2p4 12s        2s2  2p4 12s
   12    4mg iv  s2p4 3d         2s2  2p4  3d
   12    4mg iv  s2p4 4d         2s2  2p4  4d
   12    4mg iv  s2p4 5d         2s2  2p4  5d
   12    4mg iv  s2p4 6d         2s2  2p4  6d
   12    4mg iv  s2p4 7d         2s2  2p4  7d
   12    4mg iv  s2p4 8d         2s2  2p4  8d
   12    4mg iv  s2p4 9d         2s2  2p4  9d
   12    4mg iv  s2p4 10d        2s2  2p4 10d
   12    4mg iv  s2p4 11d        2s2  2p4 11d
   12    4mg iv  s2p4 12d        2s2  2p4 12d
   12    4mg iv  s2p4 5g         2s2  2p4  5g
   12    4mg iv  s2p4 6g         2s2  2p4  6g
   12    4mg iv  s2p4 7g         2s2  2p4  7g
   12    4mg iv  s2p4 8g         2s2  2p4  8g
   12    4mg iv  s2p4 9g         2s2  2p4  9g
   12    4mg iv  s2p4 7i         2s2  2p4  7i
   12    4mg iv  s2p4 8i         2s2  2p4  8i
   12    4mg iv  s2p4 9i         2s2  2p4  9i
   12    4mg iv  sp6             2s   2p6
   12    4mg iv  sp5 3p          2s   2p5  3p
   12    4mg iv  sp5 4p          2s   2p5  4p
   12    4mg iv  sp5 5p          2s   2p5  5p
   12    4mg iv  sp5 6p          2s   2p5  6p
   12    4mg iv  sp5 7p          2s   2p5  7p
   12    4mg iv  sp5 8p          2s   2p5  8p
   12    4mg iv  sp5 9p          2s   2p5  9p
   12    4mg iv  sp5 10p         2s   2p5 10p
   12    4mg iv  sp5 11p         2s   2p5 11p
   12    4mg iv  sp5 12p         2s   2p5 12p
   12    4mg iv  sp5 4f          2s   2p5  4f
   12    4mg iv  sp5 5f          2s   2p5  5f
   12    4mg iv  sp5 6f          2s   2p5  6f
   12    4mg iv  sp5 7f          2s   2p5  7f
   12    4mg iv  sp5 8f          2s   2p5  8f
   12    4mg iv  sp5 9f          2s   2p5  9f
   12    4mg iv  sp5 10f         2s   2p5 10f
   12    4mg iv  sp5 11f         2s   2p5 11f
   12    4mg iv  sp5 12f         2s   2p5 12f
   -1
$run cray:rcn2c
$DELETE POOLG:HF120301.DAT;*
$DELETE POOLG:HF120302.DAT;*
$DELETE POOLG:HF120304.DAT;*
$DELETE POOLG:HF120331.DAT;*
$DELETE POOLG:HF120332.DAT;*
