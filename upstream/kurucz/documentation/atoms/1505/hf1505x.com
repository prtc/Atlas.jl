$set def 1505
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf150507.dat for007
$assign poolg:hf150501.dat for001
$assign poolg:hf150502.dat for002
$assign poolg:hf150504.dat for004
$assign hf1505x.pun for011
$assign hf1505x.rrr for012
$assign hf1505x.dat for013
$assign hf1505xe.dat for014
$assign poolg:hf150531.dat for031
$assign poolg:hf150532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   15    5p vi   s2p6            2s2  2p6
   15    5p vi   s2p5 3p         2s2  2p5  3p
   15    5p vi   s2p5 4p         2s2  2p5  4p
   15    5p vi   s2p5 5p         2s2  2p5  5p
   15    5p vi   s2p5 6p         2s2  2p5  6p
   15    5p vi   s2p5 7p         2s2  2p5  7p
   15    5p vi   s2p5 8p         2s2  2p5  8p
   15    5p vi   s2p5 9p         2s2  2p5  9p
   15    5p vi   s2p5 4f         2s2  2p5  4f
   15    5p vi   s2p5 5f         2s2  2p5  5f
   15    5p vi   s2p5 6f         2s2  2p5  6f
   15    5p vi   s2p5 7f         2s2  2p5  7f
   15    5p vi   s2p5 8f         2s2  2p5  8f
   15    5p vi   s2p5 9f         2s2  2p5  9f
   15    5p vi   s2p5 6h         2s2  2p5  6h
   15    5p vi   s2p5 7h         2s2  2p5  7h
   15    5p vi   s2p5 8h         2s2  2p5  8h
   15    5p vi   s2p5 9h         2s2  2p5  9h
   15    5p vi   s2p5 8k         2s2  2p5  8k
   15    5p vi   s2p5 9k         2s2  2p5  9k
   15    5p vi   sp6 3s          2s   2p6  3s
   15    5p vi   sp6 4s          2s   2p6  4s
   15    5p vi   sp6 5s          2s   2p6  5s
   15    5p vi   sp6 6s          2s   2p6  6s
   15    5p vi   sp6 7s          2s   2p6  7s
   15    5p vi   sp6 8s          2s   2p6  8s
   15    5p vi   sp6 9s          2s   2p6  9s
   15    5p vi   sp6 3d          2s   2p6  3d
   15    5p vi   sp6 4d          2s   2p6  4d
   15    5p vi   sp6 5d          2s   2p6  5d
   15    5p vi   sp6 6d          2s   2p6  6d
   15    5p vi   sp6 7d          2s   2p6  7d
   15    5p vi   sp6 8d          2s   2p6  8d
   15    5p vi   sp6 9d          2s   2p6  9d
   15    5p vi   s2p5 3s         2s2  2p5  3s
   15    5p vi   s2p5 4s         2s2  2p5  4s
   15    5p vi   s2p5 5s         2s2  2p5  5s
   15    5p vi   s2p5 6s         2s2  2p5  6s
   15    5p vi   s2p5 7s         2s2  2p5  7s
   15    5p vi   s2p5 8s         2s2  2p5  8s
   15    5p vi   s2p5 9s         2s2  2p5  9s
   15    5p vi   s2p5 3d         2s2  2p5  3d
   15    5p vi   s2p5 4d         2s2  2p5  4d
   15    5p vi   s2p5 5d         2s2  2p5  5d
   15    5p vi   s2p5 6d         2s2  2p5  6d
   15    5p vi   s2p5 7d         2s2  2p5  7d
   15    5p vi   s2p5 8d         2s2  2p5  8d
   15    5p vi   s2p5 9d         2s2  2p5  9d
   15    5p vi   s2p5 5g         2s2  2p5  5g
   15    5p vi   s2p5 6g         2s2  2p5  6g
   15    5p vi   s2p5 7g         2s2  2p5  7g
   15    5p vi   s2p5 8g         2s2  2p5  8g
   15    5p vi   s2p5 9g         2s2  2p5  9g
   15    5p vi   s2p5 7i         2s2  2p5  7i
   15    5p vi   s2p5 8i         2s2  2p5  8i
   15    5p vi   s2p5 9i         2s2  2p5  9i
   15    5p vi   sp6 3p          2s   2p6  3p
   15    5p vi   sp6 4p          2s   2p6  4p
   15    5p vi   sp6 5p          2s   2p6  5p
   15    5p vi   sp6 6p          2s   2p6  6p
   15    5p vi   sp6 7p          2s   2p6  7p
   15    5p vi   sp6 8p          2s   2p6  8p
   15    5p vi   sp6 9p          2s   2p6  9p
   15    5p vi   sp6 4f          2s   2p6  4f
   15    5p vi   sp6 5f          2s   2p6  5f
   15    5p vi   sp6 6f          2s   2p6  6f
   15    5p vi   sp6 7f          2s   2p6  7f
   15    5p vi   sp6 8f          2s   2p6  8f
   15    5p vi   sp6 9f          2s   2p6  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF150501.DAT;*
$DELETE POOLG:HF150502.DAT;*
$DELETE POOLG:HF150504.DAT;*
$DELETE POOLG:HF150531.DAT;*
$DELETE POOLG:HF150532.DAT;*
