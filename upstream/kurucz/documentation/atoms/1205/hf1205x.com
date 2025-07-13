$set def 1205
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf120507.dat for007
$assign poolg:hf120501.dat for001
$assign poolg:hf120502.dat for002
$assign poolg:hf120504.dat for004
$assign hf1205x.pun for011
$assign hf1205x.rrr for012
$assign hf1205x.dat for013
$assign hf1205xe.dat for014
$assign poolg:hf120531.dat for031
$assign poolg:hf120532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   12    6mg vi  s2p3            2s2  2p3
   12    6mg vi  s2p2 3p         2s2  2p2  3p
   12    6mg vi  s2p2 4p         2s2  2p2  4p
   12    6mg vi  s2p2 5p         2s2  2p2  5p
   12    6mg vi  s2p2 6p         2s2  2p2  6p
   12    6mg vi  s2p2 7p         2s2  2p2  7p
   12    6mg vi  s2p2 8p         2s2  2p2  8p
   12    6mg vi  s2p2 9p         2s2  2p2  9p
   12    6mg vi  s2p2 10p        2s2  2p2 10p
   12    6mg vi  p5              2s0  2p5
   12    6mg vi  p4 3p           2s0  2p4  3p
   12    6mg vi  p4 4p           2s0  2p4  4p
   12    6mg vi  p4 5p           2s0  2p4  5p
   12    6mg vi  p4 6p           2s0  2p4  6p
   12    6mg vi  p4 7p           2s0  2p4  7p
   12    6mg vi  p4 8p           2s0  2p4  8p
   12    6mg vi  p4 9p           2s0  2p4  9p
   12    6mg vi  p4 10p          2s0  2p4 10p
   12    6mg vi  s2p2 4f         2s2  2p2  4f
   12    6mg vi  s2p2 5f         2s2  2p2  5f
   12    6mg vi  s2p2 6f         2s2  2p2  6f
   12    6mg vi  s2p2 7f         2s2  2p2  7f
   12    6mg vi  s2p2 8f         2s2  2p2  8f
   12    6mg vi  s2p2 9f         2s2  2p2  9f
   12    6mg vi  s2p2 10f        2s2  2p2 10f
   12    6mg vi  p4 4f           2s0  2p4  4f
   12    6mg vi  p4 5f           2s0  2p4  5f
   12    6mg vi  p4 6f           2s0  2p4  6f
   12    6mg vi  p4 7f           2s0  2p4  7f
   12    6mg vi  p4 8f           2s0  2p4  8f
   12    6mg vi  p4 9f           2s0  2p4  9f
   12    6mg vi  p4 10f          2s0  2p4 10f
   12    6mg vi  s2p2 6h         2s2  2p2  6h
   12    6mg vi  s2p2 7h         2s2  2p2  7h
   12    6mg vi  s2p2 8h         2s2  2p2  8h
   12    6mg vi  s2p2 9h         2s2  2p2  9h
   12    6mg vi  p4 6h           2s0  2p4  6h
   12    6mg vi  p4 7h           2s0  2p4  7h
   12    6mg vi  p4 8h           2s0  2p4  8h
   12    6mg vi  p4 9h           2s0  2p4  9h
   12    6mg vi  s2p2 8k         2s2  2p2  8k
   12    6mg vi  s2p2 9k         2s2  2p2  9k
   12    6mg vi  p4 8k           2s0  2p4  8k
   12    6mg vi  p4 9k           2s0  2p4  9k
   12    6mg vi  sp3 3s          2s   2p3  3s
   12    6mg vi  sp3 4s          2s   2p3  4s
   12    6mg vi  sp3 5s          2s   2p3  5s
   12    6mg vi  sp3 6s          2s   2p3  6s
   12    6mg vi  sp3 7s          2s   2p3  7s
   12    6mg vi  sp3 8s          2s   2p3  8s
   12    6mg vi  sp3 9s          2s   2p3  9s
   12    6mg vi  sp3 10s         2s   2p3 10s
   12    6mg vi  sp3 3d          2s   2p3  3d
   12    6mg vi  sp3 4d          2s   2p3  4d
   12    6mg vi  sp3 5d          2s   2p3  5d
   12    6mg vi  sp3 6d          2s   2p3  6d
   12    6mg vi  sp3 7d          2s   2p3  7d
   12    6mg vi  sp3 8d          2s   2p3  8d
   12    6mg vi  sp3 9d          2s   2p3  9d
   12    6mg vi  sp3 10d         2s   2p3 10d
   12    6mg vi  s2p2 3s         2s2  2p2  3s
   12    6mg vi  s2p2 4s         2s2  2p2  4s
   12    6mg vi  s2p2 5s         2s2  2p2  5s
   12    6mg vi  s2p2 6s         2s2  2p2  6s
   12    6mg vi  s2p2 7s         2s2  2p2  7s
   12    6mg vi  s2p2 8s         2s2  2p2  8s
   12    6mg vi  s2p2 9s         2s2  2p2  9s
   12    6mg vi  s2p2 10s        2s2  2p2 10s
   12    6mg vi  p4 3s           2s0  2p4  3s
   12    6mg vi  p4 4s           2s0  2p4  4s
   12    6mg vi  p4 5s           2s0  2p4  5s
   12    6mg vi  p4 6s           2s0  2p4  6s
   12    6mg vi  p4 7s           2s0  2p4  7s
   12    6mg vi  p4 8s           2s0  2p4  8s
   12    6mg vi  p4 9s           2s0  2p4  9s
   12    6mg vi  p4 10s          2s0  2p4 10s
   12    6mg vi  s2p2 3d         2s2  2p2  3d
   12    6mg vi  s2p2 4d         2s2  2p2  4d
   12    6mg vi  s2p2 5d         2s2  2p2  5d
   12    6mg vi  s2p2 6d         2s2  2p2  6d
   12    6mg vi  s2p2 7d         2s2  2p2  7d
   12    6mg vi  s2p2 8d         2s2  2p2  8d
   12    6mg vi  s2p2 9d         2s2  2p2  9d
   12    6mg vi  s2p2 10d        2s2  2p2 10d
   12    6mg vi  p4 3d           2s0  2p4  3d
   12    6mg vi  p4 4d           2s0  2p4  4d
   12    6mg vi  p4 5d           2s0  2p4  5d
   12    6mg vi  p4 6d           2s0  2p4  6d
   12    6mg vi  p4 7d           2s0  2p4  7d
   12    6mg vi  p4 8d           2s0  2p4  8d
   12    6mg vi  p4 9d           2s0  2p4  9d
   12    6mg vi  p4 10d          2s0  2p4 10d
   12    6mg vi  s2p2 5g         2s2  2p2  5g
   12    6mg vi  s2p2 6g         2s2  2p2  6g
   12    6mg vi  s2p2 7g         2s2  2p2  7g
   12    6mg vi  s2p2 8g         2s2  2p2  8g
   12    6mg vi  s2p2 9g         2s2  2p2  9g
   12    6mg vi  p4 5g           2s0  2p4  5g
   12    6mg vi  p4 6g           2s0  2p4  6g
   12    6mg vi  p4 7g           2s0  2p4  7g
   12    6mg vi  p4 8g           2s0  2p4  8g
   12    6mg vi  p4 9g           2s0  2p4  9g
   12    6mg vi  s2p2 7i         2s2  2p2  7i
   12    6mg vi  s2p2 8i         2s2  2p2  8i
   12    6mg vi  s2p2 9i         2s2  2p2  9i
   12    6mg vi  p4 7i           2s0  2p4  7i
   12    6mg vi  p4 8i           2s0  2p4  8i
   12    6mg vi  p4 9i           2s0  2p4  9i
   12    6mg vi  sp4             2s   2p4
   12    6mg vi  sp3 3p          2s   2p3  3p
   12    6mg vi  sp3 4p          2s   2p3  4p
   12    6mg vi  sp3 5p          2s   2p3  5p
   12    6mg vi  sp3 6p          2s   2p3  6p
   12    6mg vi  sp3 7p          2s   2p3  7p
   12    6mg vi  sp3 8p          2s   2p3  8p
   12    6mg vi  sp3 9p          2s   2p3  9p
   12    6mg vi  sp3 10p         2s   2p3 10p
   12    6mg vi  sp3 4f          2s   2p3  4f
   12    6mg vi  sp3 5f          2s   2p3  5f
   12    6mg vi  sp3 6f          2s   2p3  6f
   12    6mg vi  sp3 7f          2s   2p3  7f
   12    6mg vi  sp3 8f          2s   2p3  8f
   12    6mg vi  sp3 9f          2s   2p3  9f
   12    6mg vi  sp3 10f         2s   2p3 10f
   -1
$run cray:rcn2c
$DELETE POOLG:HF120501.DAT;*
$DELETE POOLG:HF120502.DAT;*
$DELETE POOLG:HF120504.DAT;*
$DELETE POOLG:HF120531.DAT;*
$DELETE POOLG:HF120532.DAT;*
