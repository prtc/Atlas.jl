$set def 1804
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf180407.dat for007
$assign poolg:hf180401.dat for001
$assign poolg:hf180402.dat for002
$assign poolg:hf180404.dat for004
$assign hf1804x.pun for011
$assign hf1804x.rrr for012
$assign hf1804x.dat for013
$assign hf1804xe.dat for014
$assign poolg:hf180431.dat for031
$assign poolg:hf180432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   18    5ar v   s2p2            3s2  3p2
   18    5ar v   s2p 4p          3s2  3p   4p
   18    5ar v   s2p 5p          3s2  3p   5p
   18    5ar v   s2p 6p          3s2  3p   6p
   18    5ar v   s2p 7p          3s2  3p   7p
   18    5ar v   s2p 8p          3s2  3p   8p
   18    5ar v   s2p 9p          3s2  3p   9p
   18    5ar v   s2p 10p         3s2  3p  10p
   18    5ar v   p4              3s0  3p4
   18    5ar v   p3 4p           3s0  3p3  4p
   18    5ar v   p3 5p           3s0  3p3  5p
   18    5ar v   p3 6p           3s0  3p3  6p
   18    5ar v   p3 7p           3s0  3p3  7p
   18    5ar v   p3 8p           3s0  3p3  8p
   18    5ar v   p3 9p           3s0  3p3  9p
   18    5ar v   p3 10p          3s0  3p3 10p
   18    5ar v   s2p 4f          3s2  3p   4f
   18    5ar v   s2p 5f          3s2  3p   5f
   18    5ar v   s2p 6f          3s2  3p   6f
   18    5ar v   s2p 7f          3s2  3p   7f
   18    5ar v   s2p 8f          3s2  3p   8f
   18    5ar v   s2p 9f          3s2  3p   9f
   18    5ar v   s2p 10f         3s2  3p  10f
   18    5ar v   p3 4f           3s0  3p3  4f
   18    5ar v   p3 5f           3s0  3p3  5f
   18    5ar v   p3 6f           3s0  3p3  6f
   18    5ar v   p3 7f           3s0  3p3  7f
   18    5ar v   p3 8f           3s0  3p3  8f
   18    5ar v   p3 9f           3s0  3p3  9f
   18    5ar v   p3 10f          3s0  3p3 10f
   18    5ar v   s2p 6h          3s2  3p   6h
   18    5ar v   s2p 7h          3s2  3p   7h
   18    5ar v   s2p 8h          3s2  3p   8h
   18    5ar v   s2p 9h          3s2  3p   9h
   18    5ar v   s2p 10h         3s2  3p  10h
   18    5ar v   p3 6h           3s0  3p3  6h
   18    5ar v   p3 7h           3s0  3p3  7h
   18    5ar v   p3 8h           3s0  3p3  8h
   18    5ar v   p3 9h           3s0  3p3  9h
   18    5ar v   p3 10h          3s0  3p3 10h
   18    5ar v   s2p 8k          3s2  3p   8k
   18    5ar v   s2p 9k          3s2  3p   9k
   18    5ar v   s2p 10k         3s2  3p  10k
   18    5ar v   p3 8k           3s0  3p3  8k
   18    5ar v   p3 9k           3s0  3p3  9k
   18    5ar v   p3 10k          3s0  3p3 10k
   18    5ar v   sp2 4s          3s   3p2  4s
   18    5ar v   sp2 5s          3s   3p2  5s
   18    5ar v   sp2 6s          3s   3p2  6s
   18    5ar v   sp2 7s          3s   3p2  7s
   18    5ar v   sp2 8s          3s   3p2  8s
   18    5ar v   sp2 9s          3s   3p2  9s
   18    5ar v   sp2 10s         3s   3p2 10s
   18    5ar v   sp2 3d          3s   3p2  3d
   18    5ar v   sp2 4d          3s   3p2  4d
   18    5ar v   sp2 5d          3s   3p2  5d
   18    5ar v   sp2 6d          3s   3p2  6d
   18    5ar v   sp2 7d          3s   3p2  7d
   18    5ar v   sp2 8d          3s   3p2  8d
   18    5ar v   sp2 9d          3s   3p2  9d
   18    5ar v   sp2 10d         3s   3p2 10d
   18    5ar v   s2p 4s          3s2  3p   4s
   18    5ar v   s2p 5s          3s2  3p   5s
   18    5ar v   s2p 6s          3s2  3p   6s
   18    5ar v   s2p 7s          3s2  3p   7s
   18    5ar v   s2p 8s          3s2  3p   8s
   18    5ar v   s2p 9s          3s2  3p   9s
   18    5ar v   s2p 10s         3s2  3p  10s
   18    5ar v   p3 4s           3s0  3p3  4s
   18    5ar v   p3 5s           3s0  3p3  5s
   18    5ar v   p3 6s           3s0  3p3  6s
   18    5ar v   p3 7s           3s0  3p3  7s
   18    5ar v   p3 8s           3s0  3p3  8s
   18    5ar v   p3 9s           3s0  3p3  9s
   18    5ar v   p3 10s          3s0  3p3 10s
   18    5ar v   s2p 3d          3s2  3p   3d
   18    5ar v   s2p 4d          3s2  3p   4d
   18    5ar v   s2p 5d          3s2  3p   5d
   18    5ar v   s2p 6d          3s2  3p   6d
   18    5ar v   s2p 7d          3s2  3p   7d
   18    5ar v   s2p 8d          3s2  3p   8d
   18    5ar v   s2p 9d          3s2  3p   9d
   18    5ar v   s2p 10d         3s2  3p  10d
   18    5ar v   p3 3d           3s0  3p3  3d
   18    5ar v   p3 4d           3s0  3p3  4d
   18    5ar v   p3 5d           3s0  3p3  5d
   18    5ar v   p3 6d           3s0  3p3  6d
   18    5ar v   p3 7d           3s0  3p3  7d
   18    5ar v   p3 8d           3s0  3p3  8d
   18    5ar v   p3 9d           3s0  3p3  9d
   18    5ar v   p3 10d          3s0  3p3 10d
   18    5ar v   s2p 5g          3s2  3p   5g
   18    5ar v   s2p 6g          3s2  3p   6g
   18    5ar v   s2p 7g          3s2  3p   7g
   18    5ar v   s2p 8g          3s2  3p   8g
   18    5ar v   s2p 9g          3s2  3p   9g
   18    5ar v   s2p 10g         3s2  3p  10g
   18    5ar v   p3 5g           3s0  3p3  5g
   18    5ar v   p3 6g           3s0  3p3  6g
   18    5ar v   p3 7g           3s0  3p3  7g
   18    5ar v   p3 8g           3s0  3p3  8g
   18    5ar v   p3 9g           3s0  3p3  9g
   18    5ar v   p3 10g          3s0  3p3 10g
   18    5ar v   s2p 7i          3s2  3p   7i
   18    5ar v   s2p 8i          3s2  3p   8i
   18    5ar v   p3 7i           3s0  3p3  7i
   18    5ar v   p3 8i           3s0  3p3  8i
   18    5ar v   sp3             3s   3p3
   18    5ar v   sp2 4p          3s   3p2  4p
   18    5ar v   sp2 5p          3s   3p2  5p
   18    5ar v   sp2 6p          3s   3p2  6p
   18    5ar v   sp2 7p          3s   3p2  7p
   18    5ar v   sp2 8p          3s   3p2  8p
   18    5ar v   sp2 9p          3s   3p2  9p
   18    5ar v   sp2 10p         3s   3p2 10p
   18    5ar v   sp2 4f          3s   3p2  4f
   18    5ar v   sp2 5f          3s   3p2  5f
   18    5ar v   sp2 6f          3s   3p2  6f
   18    5ar v   sp2 7f          3s   3p2  7f
   18    5ar v   sp2 8f          3s   3p2  8f
   18    5ar v   sp2 9f          3s   3p2  9f
   18    5ar v   sp2 10f         3s   3p2 10f
   -1
$run cray:rcn2c
$DELETE POOLG:HF180401.DAT;*
$DELETE POOLG:HF180402.DAT;*
$DELETE POOLG:HF180404.DAT;*
$DELETE POOLG:HF180431.DAT;*
$DELETE POOLG:HF180432.DAT;*
