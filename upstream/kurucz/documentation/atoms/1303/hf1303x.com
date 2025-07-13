$set def 1303
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf130307.dat for007
$assign poolg:hf130301.dat for001
$assign poolg:hf130302.dat for002
$assign poolg:hf130304.dat for004
$assign hf1303x.pun for011
$assign hf1303x.rrr for012
$assign hf1303x.dat for013
$assign hf1303xe.dat for014
$assign poolg:hf130331.dat for031
$assign poolg:hf130332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   13    3al iv  s2p6            2s2  2p6
   13    3al iv  s2p5 3p         2s2  2p5  3p
   13    3al iv  s2p5 4p         2s2  2p5  4p
   13    3al iv  s2p5 5p         2s2  2p5  5p
   13    3al iv  s2p5 6p         2s2  2p5  6p
   13    3al iv  s2p5 7p         2s2  2p5  7p
   13    3al iv  s2p5 8p         2s2  2p5  8p
   13    3al iv  s2p5 9p         2s2  2p5  9p
   13    3al iv  s2p5 10p        2s2  2p5 10p
   13    3al iv  s2p5 4f         2s2  2p5  4f
   13    3al iv  s2p5 5f         2s2  2p5  5f
   13    3al iv  s2p5 6f         2s2  2p5  6f
   13    3al iv  s2p5 7f         2s2  2p5  7f
   13    3al iv  s2p5 8f         2s2  2p5  8f
   13    3al iv  s2p5 9f         2s2  2p5  9f
   13    3al iv  s2p5 10f        2s2  2p5 10f
   13    3al iv  s2p5 6h         2s2  2p5  6h
   13    3al iv  s2p5 7h         2s2  2p5  7h
   13    3al iv  s2p5 8h         2s2  2p5  8h
   13    3al iv  s2p5 9h         2s2  2p5  9h
   13    3al iv  s2p5 10h        2s2  2p5 10h
   13    3al iv  s2p5 8k         2s2  2p5  8k
   13    3al iv  s2p5 9k         2s2  2p5  9k
   13    3al iv  s2p5 10k        2s2  2p5 10k
   13    3al iv  sp6 3s          2s   2p6  3s
   13    3al iv  sp6 4s          2s   2p6  4s
   13    3al iv  sp6 5s          2s   2p6  5s
   13    3al iv  sp6 6s          2s   2p6  6s
   13    3al iv  sp6 7s          2s   2p6  7s
   13    3al iv  sp6 8s          2s   2p6  8s
   13    3al iv  sp6 9s          2s   2p6  9s
   13    3al iv  sp6 10s         2s   2p6 10s
   13    3al iv  sp6 3d          2s   2p6  3d
   13    3al iv  sp6 4d          2s   2p6  4d
   13    3al iv  sp6 5d          2s   2p6  5d
   13    3al iv  sp6 6d          2s   2p6  6d
   13    3al iv  sp6 7d          2s   2p6  7d
   13    3al iv  sp6 8d          2s   2p6  8d
   13    3al iv  sp6 9d          2s   2p6  9d
   13    3al iv  sp6 10d         2s   2p6 10d
   13    3al iv  s2p5 3s         2s2  2p5  3s
   13    3al iv  s2p5 4s         2s2  2p5  4s
   13    3al iv  s2p5 5s         2s2  2p5  5s
   13    3al iv  s2p5 6s         2s2  2p5  6s
   13    3al iv  s2p5 7s         2s2  2p5  7s
   13    3al iv  s2p5 8s         2s2  2p5  8s
   13    3al iv  s2p5 9s         2s2  2p5  9s
   13    3al iv  s2p5 10s        2s2  2p5 10s
   13    3al iv  s2p5 3d         2s2  2p5  3d
   13    3al iv  s2p5 4d         2s2  2p5  4d
   13    3al iv  s2p5 5d         2s2  2p5  5d
   13    3al iv  s2p5 6d         2s2  2p5  6d
   13    3al iv  s2p5 7d         2s2  2p5  7d
   13    3al iv  s2p5 8d         2s2  2p5  8d
   13    3al iv  s2p5 9d         2s2  2p5  9d
   13    3al iv  s2p5 10d        2s2  2p5 10d
   13    3al iv  s2p5 5g         2s2  2p5  5g
   13    3al iv  s2p5 6g         2s2  2p5  6g
   13    3al iv  s2p5 7g         2s2  2p5  7g
   13    3al iv  s2p5 8g         2s2  2p5  8g
   13    3al iv  s2p5 9g         2s2  2p5  9g
   13    3al iv  s2p5 10g        2s2  2p5 10g
   13    3al iv  s2p5 7i         2s2  2p5  7i
   13    3al iv  s2p5 8i         2s2  2p5  8i
   13    3al iv  s2p5 9i         2s2  2p5  9i
   13    3al iv  s2p5 10i        2s2  2p5 10i
   13    3al iv  sp6 3p          2s   2p6  3p
   13    3al iv  sp6 4p          2s   2p6  4p
   13    3al iv  sp6 5p          2s   2p6  5p
   13    3al iv  sp6 6p          2s   2p6  6p
   13    3al iv  sp6 7p          2s   2p6  7p
   13    3al iv  sp6 8p          2s   2p6  8p
   13    3al iv  sp6 9p          2s   2p6  9p
   13    3al iv  sp6 10p         2s   2p6 10p
   13    3al iv  sp6 4f          2s   2p6  4f
   13    3al iv  sp6 5f          2s   2p6  5f
   13    3al iv  sp6 6f          2s   2p6  6f
   13    3al iv  sp6 7f          2s   2p6  7f
   13    3al iv  sp6 8f          2s   2p6  8f
   13    3al iv  sp6 9f          2s   2p6  9f
   13    3al iv  sp6 10f         2s   2p6 10f
   -1
$run cray:rcn2c
$DELETE POOLG:HF130301.DAT;*
$DELETE POOLG:HF130302.DAT;*
$DELETE POOLG:HF130304.DAT;*
$DELETE POOLG:HF130331.DAT;*
$DELETE POOLG:HF130332.DAT;*
