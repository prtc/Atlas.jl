$set def 2106
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf210607.dat for007
$assign poolg:hf210601.dat for001
$assign poolg:hf210602.dat for002
$assign poolg:hf210604.dat for004
$assign hf2106x.pun for011
$assign hf2106x.rrr for012
$assign hf2106x.dat for013
$assign hf2106xe.dat for014
$assign poolg:hf210631.dat for031
$assign poolg:hf210632.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   21    7scvii s2p3             3s2  3p3
   21    7scvii s2p2 4p          3s2  3p2  4p
   21    7scvii s2p2 5p          3s2  3p2  5p
   21    7scvii s2p2 6p          3s2  3p2  6p
   21    7scvii s2p2 7p          3s2  3p2  7p
   21    7scvii s2p2 8p          3s2  3p2  8p
   21    7scvii s2p2 9p          3s2  3p2  9p
   21    7scvii s2p2 4f          3s2  3p2  4f
   21    7scvii s2p2 5f          3s2  3p2  5f
   21    7scvii s2p2 6f          3s2  3p2  6f
   21    7scvii s2p2 7f          3s2  3p2  7f
   21    7scvii s2p2 8f          3s2  3p2  8f
   21    7scvii s2p2 9f          3s2  3p2  9f
   21    7scvii s2p2 6h          3s2  3p2  6h
   21    7scvii s2p2 7h          3s2  3p2  7h
   21    7scvii s2p2 8h          3s2  3p2  8h
   21    7scvii s2p2 9h          3s2  3p2  9h
   21    7scvii s2p2 8k          3s2  3p2  8k
   21    7scvii s2p2 9k          3s2  3p2  9k
   21    7scvii sp3 4s           3s   3p3  4s
   21    7scvii sp3 5s           3s   3p3  5s
   21    7scvii sp3 6s           3s   3p3  6s
   21    7scvii sp3 7s           3s   3p3  7s
   21    7scvii sp3 8s           3s   3p3  8s
   21    7scvii sp3 9s           3s   3p3  9s
   21    7scvii sp3 3d           3s   3p3  3d
   21    7scvii sp3 4d           3s   3p3  4d
   21    7scvii sp3 5d           3s   3p3  5d
   21    7scvii sp3 6d           3s   3p3  6d
   21    7scvii sp3 7d           3s   3p3  7d
   21    7scvii sp3 8d           3s   3p3  8d
   21    7scvii sp3 9d           3s   3p3  9d
   21    7scvii p5               3s0  3p5
   21    7scvii s2p2 4s          3s2  3p2  4s
   21    7scvii s2p2 5s          3s2  3p2  5s
   21    7scvii s2p2 6s          3s2  3p2  6s
   21    7scvii s2p2 7s          3s2  3p2  7s
   21    7scvii s2p2 8s          3s2  3p2  8s
   21    7scvii s2p2 9s          3s2  3p2  9s
   21    7scvii s2p2 3d          3s2  3p2  3d
   21    7scvii s2p2 4d          3s2  3p2  4d
   21    7scvii s2p2 5d          3s2  3p2  5d
   21    7scvii s2p2 6d          3s2  3p2  6d
   21    7scvii s2p2 7d          3s2  3p2  7d
   21    7scvii s2p2 8d          3s2  3p2  8d
   21    7scvii s2p2 9d          3s2  3p2  9d
   21    7scvii s2p2 5g          3s2  3p2  5g
   21    7scvii s2p2 6g          3s2  3p2  6g
   21    7scvii s2p2 7g          3s2  3p2  7g
   21    7scvii s2p2 8g          3s2  3p2  8g
   21    7scvii s2p2 9g          3s2  3p2  9g
   21    7scvii s2p2 7i          3s2  3p2  7i
   21    7scvii s2p2 8i          3s2  3p2  8i
   21    7scvii s2p2 9i          3s2  3p2  9i
   21    7scvii sp4              3s   3p4
   21    7scvii sp3 4p           3s   3p3  4p
   21    7scvii sp3 5p           3s   3p3  5p
   21    7scvii sp3 6p           3s   3p3  6p
   21    7scvii sp3 7p           3s   3p3  7p
   21    7scvii sp3 8p           3s   3p3  8p
   21    7scvii sp3 9p           3s   3p3  9p
   21    7scvii sp3 4f           3s   3p3  4f
   21    7scvii sp3 5f           3s   3p3  5f
   21    7scvii sp3 6f           3s   3p3  6f
   21    7scvii sp3 7f           3s   3p3  7f
   21    7scvii sp3 8f           3s   3p3  8f
   21    7scvii sp3 9f           3s   3p3  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF210601.DAT;*
$DELETE POOLG:HF210602.DAT;*
$DELETE POOLG:HF210604.DAT;*
$DELETE POOLG:HF210631.DAT;*
$DELETE POOLG:HF210632.DAT;*
