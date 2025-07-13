$set def 1202
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf120207.dat for007
$assign poolg:hf120201.dat for001
$assign poolg:hf120202.dat for002
$assign poolg:hf120204.dat for004
$assign hf1202x.pun for011
$assign hf1202x.rrr for012
$assign hf1202x.dat for013
$assign hf1202xe.dat for014
$assign poolg:hf120231.dat for031
$assign poolg:hf120232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   12    2mg iii s2p6            2s2  2p6
   12    2mg iii s2p5 3p         2s2  2p5  3p
   12    2mg iii s2p5 4p         2s2  2p5  4p
   12    2mg iii s2p5 5p         2s2  2p5  5p
   12    2mg iii s2p5 6p         2s2  2p5  6p
   12    2mg iii s2p5 7p         2s2  2p5  7p
   12    2mg iii s2p5 8p         2s2  2p5  8p
   12    2mg iii s2p5 9p         2s2  2p5  9p
   12    2mg iii s2p5 4f         2s2  2p5  4f
   12    2mg iii s2p5 5f         2s2  2p5  5f
   12    2mg iii s2p5 6f         2s2  2p5  6f
   12    2mg iii s2p5 7f         2s2  2p5  7f
   12    2mg iii s2p5 8f         2s2  2p5  8f
   12    2mg iii s2p5 9f         2s2  2p5  9f
   12    2mg iii s2p5 6h         2s2  2p5  6h
   12    2mg iii s2p5 7h         2s2  2p5  7h
   12    2mg iii s2p5 8h         2s2  2p5  8h
   12    2mg iii s2p5 9h         2s2  2p5  9h
   12    2mg iii s2p5 8k         2s2  2p5  8k
   12    2mg iii s2p5 9k         2s2  2p5  9k
   12    2mg iii sp6 3s          2s   2p6  3s
   12    2mg iii sp6 4s          2s   2p6  4s
   12    2mg iii sp6 5s          2s   2p6  5s
   12    2mg iii sp6 6s          2s   2p6  6s
   12    2mg iii sp6 7s          2s   2p6  7s
   12    2mg iii sp6 8s          2s   2p6  8s
   12    2mg iii sp6 9s          2s   2p6  9s
   12    2mg iii sp6 3d          2s   2p6  3d
   12    2mg iii sp6 4d          2s   2p6  4d
   12    2mg iii sp6 5d          2s   2p6  5d
   12    2mg iii sp6 6d          2s   2p6  6d
   12    2mg iii sp6 7d          2s   2p6  7d
   12    2mg iii sp6 8d          2s   2p6  8d
   12    2mg iii sp6 9d          2s   2p6  9d
   12    2mg iii s2p5 3s         2s2  2p5  3s
   12    2mg iii s2p5 4s         2s2  2p5  4s
   12    2mg iii s2p5 5s         2s2  2p5  5s
   12    2mg iii s2p5 6s         2s2  2p5  6s
   12    2mg iii s2p5 7s         2s2  2p5  7s
   12    2mg iii s2p5 8s         2s2  2p5  8s
   12    2mg iii s2p5 9s         2s2  2p5  9s
   12    2mg iii s2p5 3d         2s2  2p5  3d
   12    2mg iii s2p5 4d         2s2  2p5  4d
   12    2mg iii s2p5 5d         2s2  2p5  5d
   12    2mg iii s2p5 6d         2s2  2p5  6d
   12    2mg iii s2p5 7d         2s2  2p5  7d
   12    2mg iii s2p5 8d         2s2  2p5  8d
   12    2mg iii s2p5 9d         2s2  2p5  9d
   12    2mg iii s2p5 5g         2s2  2p5  5g
   12    2mg iii s2p5 6g         2s2  2p5  6g
   12    2mg iii s2p5 7g         2s2  2p5  7g
   12    2mg iii s2p5 8g         2s2  2p5  8g
   12    2mg iii s2p5 9g         2s2  2p5  9g
   12    2mg iii s2p5 7i         2s2  2p5  7i
   12    2mg iii s2p5 8i         2s2  2p5  8i
   12    2mg iii s2p5 9i         2s2  2p5  9i
   12    2mg iii sp6 3p          2s   2p6  3p
   12    2mg iii sp6 4p          2s   2p6  4p
   12    2mg iii sp6 5p          2s   2p6  5p
   12    2mg iii sp6 6p          2s   2p6  6p
   12    2mg iii sp6 7p          2s   2p6  7p
   12    2mg iii sp6 8p          2s   2p6  8p
   12    2mg iii sp6 9p          2s   2p6  9p
   12    2mg iii sp6 4f          2s   2p6  4f
   12    2mg iii sp6 5f          2s   2p6  5f
   12    2mg iii sp6 6f          2s   2p6  6f
   12    2mg iii sp6 7f          2s   2p6  7f
   12    2mg iii sp6 8f          2s   2p6  8f
   12    2mg iii sp6 9f          2s   2p6  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF120201.DAT;*
$DELETE POOLG:HF120202.DAT;*
$DELETE POOLG:HF120204.DAT;*
$DELETE POOLG:HF120231.DAT;*
$DELETE POOLG:HF120232.DAT;*
