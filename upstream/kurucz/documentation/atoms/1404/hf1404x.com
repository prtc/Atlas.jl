$set def 1404
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf140407.dat for007
$assign poolg:hf140401.dat for001
$assign poolg:hf140402.dat for002
$assign poolg:hf140404.dat for004
$assign hf1404x.pun for011
$assign hf1404x.rrr for012
$assign hf1404x.dat for013
$assign hf1404xe.dat for014
$assign poolg:hf140431.dat for031
$assign poolg:hf140432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   14    4si v   s2p6            2s2  2p6
   14    4si v   s2p5 3p         2s2  2p5  3p
   14    4si v   s2p5 4p         2s2  2p5  4p
   14    4si v   s2p5 5p         2s2  2p5  5p
   14    4si v   s2p5 6p         2s2  2p5  6p
   14    4si v   s2p5 7p         2s2  2p5  7p
   14    4si v   s2p5 8p         2s2  2p5  8p
   14    4si v   s2p5 9p         2s2  2p5  9p
   14    4si v   s2p5 4f         2s2  2p5  4f
   14    4si v   s2p5 5f         2s2  2p5  5f
   14    4si v   s2p5 6f         2s2  2p5  6f
   14    4si v   s2p5 7f         2s2  2p5  7f
   14    4si v   s2p5 8f         2s2  2p5  8f
   14    4si v   s2p5 9f         2s2  2p5  9f
   14    4si v   s2p5 6h         2s2  2p5  6h
   14    4si v   s2p5 7h         2s2  2p5  7h
   14    4si v   s2p5 8h         2s2  2p5  8h
   14    4si v   s2p5 9h         2s2  2p5  9h
   14    4si v   s2p5 8k         2s2  2p5  8k
   14    4si v   s2p5 9k         2s2  2p5  9k
   14    4si v   sp6 3s          2s   2p6  3s
   14    4si v   sp6 4s          2s   2p6  4s
   14    4si v   sp6 5s          2s   2p6  5s
   14    4si v   sp6 6s          2s   2p6  6s
   14    4si v   sp6 7s          2s   2p6  7s
   14    4si v   sp6 8s          2s   2p6  8s
   14    4si v   sp6 9s          2s   2p6  9s
   14    4si v   sp6 3d          2s   2p6  3d
   14    4si v   sp6 4d          2s   2p6  4d
   14    4si v   sp6 5d          2s   2p6  5d
   14    4si v   sp6 6d          2s   2p6  6d
   14    4si v   sp6 7d          2s   2p6  7d
   14    4si v   sp6 8d          2s   2p6  8d
   14    4si v   sp6 9d          2s   2p6  9d
   14    4si v   s2p5 3s         2s2  2p5  3s
   14    4si v   s2p5 4s         2s2  2p5  4s
   14    4si v   s2p5 5s         2s2  2p5  5s
   14    4si v   s2p5 6s         2s2  2p5  6s
   14    4si v   s2p5 7s         2s2  2p5  7s
   14    4si v   s2p5 8s         2s2  2p5  8s
   14    4si v   s2p5 9s         2s2  2p5  9s
   14    4si v   s2p5 3d         2s2  2p5  3d
   14    4si v   s2p5 4d         2s2  2p5  4d
   14    4si v   s2p5 5d         2s2  2p5  5d
   14    4si v   s2p5 6d         2s2  2p5  6d
   14    4si v   s2p5 7d         2s2  2p5  7d
   14    4si v   s2p5 8d         2s2  2p5  8d
   14    4si v   s2p5 9d         2s2  2p5  9d
   14    4si v   s2p5 5g         2s2  2p5  5g
   14    4si v   s2p5 6g         2s2  2p5  6g
   14    4si v   s2p5 7g         2s2  2p5  7g
   14    4si v   s2p5 8g         2s2  2p5  8g
   14    4si v   s2p5 9g         2s2  2p5  9g
   14    4si v   s2p5 7i         2s2  2p5  7i
   14    4si v   s2p5 8i         2s2  2p5  8i
   14    4si v   s2p5 9i         2s2  2p5  9i
   14    4si v   sp6 3p          2s   2p6  3p
   14    4si v   sp6 4p          2s   2p6  4p
   14    4si v   sp6 5p          2s   2p6  5p
   14    4si v   sp6 6p          2s   2p6  6p
   14    4si v   sp6 7p          2s   2p6  7p
   14    4si v   sp6 8p          2s   2p6  8p
   14    4si v   sp6 9p          2s   2p6  9p
   14    4si v   sp6 4f          2s   2p6  4f
   14    4si v   sp6 5f          2s   2p6  5f
   14    4si v   sp6 6f          2s   2p6  6f
   14    4si v   sp6 7f          2s   2p6  7f
   14    4si v   sp6 8f          2s   2p6  8f
   14    4si v   sp6 9f          2s   2p6  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF140401.DAT;*
$DELETE POOLG:HF140402.DAT;*
$DELETE POOLG:HF140404.DAT;*
$DELETE POOLG:HF140431.DAT;*
$DELETE POOLG:HF140432.DAT;*
