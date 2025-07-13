$set def 1400
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf140007.dat for007
$assign poolg:hf140001.dat for001
$assign poolg:hf140002.dat for002
$assign poolg:hf140004.dat for004
$assign hf1400x.pun for011
$assign hf1400x.rrr for012
$assign hf1400x.dat for013
$assign hf1400xe.dat for014
$assign poolg:hf140031.dat for031
$assign poolg:hf140032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   14    1si i   s2p2            3s2  3p2
   14    1si i   s2p 4p          3s2  3p   4p
   14    1si i   s2p 5p          3s2  3p   5p
   14    1si i   s2p 6p          3s2  3p   6p
   14    1si i   s2p 7p          3s2  3p   7p
   14    1si i   s2p 8p          3s2  3p   8p
   14    1si i   s2p 9p          3s2  3p   9p
   14    1si i   s2p 10p         3s2  3p  10p
   14    1si i   p4              3s0  3p4
   14    1si i   p3 4p           3s0  3p3  4p
   14    1si i   p3 5p           3s0  3p3  5p
   14    1si i   p3 6p           3s0  3p3  6p
   14    1si i   p3 7p           3s0  3p3  7p
   14    1si i   p3 8p           3s0  3p3  8p
   14    1si i   p3 9p           3s0  3p3  9p
   14    1si i   p3 10p          3s0  3p3 10p
   14    1si i   s2p 4f          3s2  3p   4f
   14    1si i   s2p 5f          3s2  3p   5f
   14    1si i   s2p 6f          3s2  3p   6f
   14    1si i   s2p 7f          3s2  3p   7f
   14    1si i   s2p 8f          3s2  3p   8f
   14    1si i   s2p 9f          3s2  3p   9f
   14    1si i   s2p 10f         3s2  3p  10f
   14    1si i   p3 4f           3s0  3p3  4f
   14    1si i   p3 5f           3s0  3p3  5f
   14    1si i   p3 6f           3s0  3p3  6f
   14    1si i   p3 7f           3s0  3p3  7f
   14    1si i   p3 8f           3s0  3p3  8f
   14    1si i   p3 9f           3s0  3p3  9f
   14    1si i   p3 10f          3s0  3p3 10f
   14    1si i   s2p 6h          3s2  3p   6h
   14    1si i   s2p 7h          3s2  3p   7h
   14    1si i   s2p 8h          3s2  3p   8h
   14    1si i   s2p 9h          3s2  3p   9h
   14    1si i   s2p 10h         3s2  3p  10h
   14    1si i   p3 6h           3s0  3p3  6h
   14    1si i   p3 7h           3s0  3p3  7h
   14    1si i   p3 8h           3s0  3p3  8h
   14    1si i   p3 9h           3s0  3p3  9h
   14    1si i   p3 10h          3s0  3p3 10h
   14    1si i   s2p 8k          3s2  3p   8k
   14    1si i   s2p 9k          3s2  3p   9k
   14    1si i   s2p 10k         3s2  3p  10k
   14    1si i   p3 8k           3s0  3p3  8k
   14    1si i   p3 9k           3s0  3p3  9k
   14    1si i   p3 10k          3s0  3p3 10k
   14    1si i   sp2 4s          3s   3p2  4s
   14    1si i   sp2 5s          3s   3p2  5s
   14    1si i   sp2 6s          3s   3p2  6s
   14    1si i   sp2 7s          3s   3p2  7s
   14    1si i   sp2 8s          3s   3p2  8s
   14    1si i   sp2 9s          3s   3p2  9s
   14    1si i   sp2 10s         3s   3p2 10s
   14    1si i   sp2 3d          3s   3p2  3d
   14    1si i   sp2 4d          3s   3p2  4d
   14    1si i   sp2 5d          3s   3p2  5d
   14    1si i   sp2 6d          3s   3p2  6d
   14    1si i   sp2 7d          3s   3p2  7d
   14    1si i   sp2 8d          3s   3p2  8d
   14    1si i   sp2 9d          3s   3p2  9d
   14    1si i   sp2 10d         3s   3p2 10d
   14    1si i   s2p 4s          3s2  3p   4s
   14    1si i   s2p 5s          3s2  3p   5s
   14    1si i   s2p 6s          3s2  3p   6s
   14    1si i   s2p 7s          3s2  3p   7s
   14    1si i   s2p 8s          3s2  3p   8s
   14    1si i   s2p 9s          3s2  3p   9s
   14    1si i   s2p 10s         3s2  3p  10s
   14    1si i   p3 4s           3s0  3p3  4s
   14    1si i   p3 5s           3s0  3p3  5s
   14    1si i   p3 6s           3s0  3p3  6s
   14    1si i   p3 7s           3s0  3p3  7s
   14    1si i   p3 8s           3s0  3p3  8s
   14    1si i   p3 9s           3s0  3p3  9s
   14    1si i   p3 10s          3s0  3p3 10s
   14    1si i   s2p 3d          3s2  3p   3d
   14    1si i   s2p 4d          3s2  3p   4d
   14    1si i   s2p 5d          3s2  3p   5d
   14    1si i   s2p 6d          3s2  3p   6d
   14    1si i   s2p 7d          3s2  3p   7d
   14    1si i   s2p 8d          3s2  3p   8d
   14    1si i   s2p 9d          3s2  3p   9d
   14    1si i   s2p 10d         3s2  3p  10d
   14    1si i   p3 3d           3s0  3p3  3d
   14    1si i   p3 4d           3s0  3p3  4d
   14    1si i   p3 5d           3s0  3p3  5d
   14    1si i   p3 6d           3s0  3p3  6d
   14    1si i   p3 7d           3s0  3p3  7d
   14    1si i   p3 8d           3s0  3p3  8d
   14    1si i   p3 9d           3s0  3p3  9d
   14    1si i   p3 10d          3s0  3p3 10d
   14    1si i   s2p 5g          3s2  3p   5g
   14    1si i   s2p 6g          3s2  3p   6g
   14    1si i   s2p 7g          3s2  3p   7g
   14    1si i   s2p 8g          3s2  3p   8g
   14    1si i   s2p 9g          3s2  3p   9g
   14    1si i   s2p 10g         3s2  3p  10g
   14    1si i   p3 5g           3s0  3p3  5g
   14    1si i   p3 6g           3s0  3p3  6g
   14    1si i   p3 7g           3s0  3p3  7g
   14    1si i   p3 8g           3s0  3p3  8g
   14    1si i   p3 9g           3s0  3p3  9g
   14    1si i   p3 10g          3s0  3p3 10g
   14    1si i   s2p 7i          3s2  3p   7i
   14    1si i   s2p 8i          3s2  3p   8i
   14    1si i   s2p 9i          3s2  3p   9i
   14    1si i   p3 7i           3s0  3p3  7i
   14    1si i   p3 8i           3s0  3p3  8i
   14    1si i   p3 9i           3s0  3p3  9i
   14    1si i   sp3             3s   3p3
   14    1si i   sp2 4p          3s   3p2  4p
   14    1si i   sp2 5p          3s   3p2  5p
   14    1si i   sp2 6p          3s   3p2  6p
   14    1si i   sp2 7p          3s   3p2  7p
   14    1si i   sp2 8p          3s   3p2  8p
   14    1si i   sp2 9p          3s   3p2  9p
   14    1si i   sp2 4f          3s   3p2  4f
   14    1si i   sp2 5f          3s   3p2  5f
   14    1si i   sp2 6f          3s   3p2  6f
   14    1si i   sp2 7f          3s   3p2  7f
   14    1si i   sp2 8f          3s   3p2  8f
   14    1si i   sp2 9f          3s   3p2  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF140001.DAT;*
$DELETE POOLG:HF140002.DAT;*
$DELETE POOLG:HF140004.DAT;*
$DELETE POOLG:HF140031.DAT;*
$DELETE POOLG:HF140032.DAT;*
