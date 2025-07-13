$set def 2400
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf240007.dat for007
$assign poolg:hf240001.dat for001
$assign poolg:hf240002.dat for002
$assign poolg:hf240004.dat for004
$assign hf2400X.pun for011
$assign hf2400X.rrr for012
$assign hf2400X.dat for013
$assign hf2400Xe.dat for014
$assign poolg:hf240031.dat for031
$assign poolg:hf240032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  5.0 0.50 0.0  0.70
   24    1cr i   d4 4s2          3d4  4s2
   24    1cr i   d4 4s5s         3d4  4s   5s
   24    1cr i   d4 4s6s         3d4  4s   6s
   24    1cr i   d4 4s7s         3d4  4s   7s
   24    1cr i   d4 4s8s         3d4  4s   8s
   24    1cr i   d4 4s9s         3d4  4s   9s
   24    1cr i   d5 4s           3d5  4s
   24    1cr i   d5 5s           3d5  5s
   24    1cr i   d5 6s           3d5  6s
   24    1cr i   d5 7s           3d5  7s
   24    1cr i   d5 8s           3d5  8s
   24    1cr i   d5 9s           3d5  9s
   24    1cr i   d3 4s2 5s       3d3  4s2  5s
   24    1cr i   d6              3d6
   24    1cr i   d5 4d           3d5  4d
   24    1cr i   d5 5d           3d5  5d
   24    1cr i   d5 6d           3d5  6d
   24    1cr i   d5 7d           3d5  7d
   24    1cr i   d5 8d           3d5  8d
   24    1cr i   d5 9d           3d5  9d
   24    1cr i   d4 4s4d         3d4  4s   4d
   24    1cr i   d4 4s5d         3d4  4s   5d
   24    1cr i   d4 4s6d         3d4  4s   6d
   24    1cr i   d4 4s7d         3d4  4s   7d
   24    1cr i   d4 4s8d         3d4  4s   8d
   24    1cr i   d4 4s9d         3d4  4s   9d
   24    1cr i   d3 4s2 4d       3d3  4s2  4d
   24    1cr i   d3 4s2 5d       3d3  4s2  5d
   24    1cr i   d5 5g           3d5  5g
   24    1cr i   d5 6g           3d5  6g
   24    1cr i   d5 7g           3d5  7g
   24    1cr i   d5 8g           3d5  8g
   24    1cr i   d5 9g           3d5  9g
   24    1cr i   d4 4s5g         3d4  4s   5g
   24    1cr i   d4 4s6g         3d4  4s   6g
   24    1cr i   d4 4s7g         3d4  4s   7g
   24    1cr i   d4 4s8g         3d4  4s   8g
   24    1cr i   d4 4s9g         3d4  4s   9g
   24    1cr i   d5 7i           3d5  7i
   24    1cr i   d5 8i           3d5  8i
   24    1cr i   d5 9i           3d5  9i
   24    1cr i   d4 4s7i         3d4  4s   7i
   24    1cr i   d4 4s8i         3d4  4s   8i
   24    1cr i   d4 4s9i         3d4  4s   9i
   24    1cr i   d5 9l           3d5 10l                                              actually 9l
   24    1cr i   d4 4s9l         3d4  4s  10l                                         ACTUALLY 9l
   24    1cr i   d4 4p2          3d4  4p2
   24    1cr i   d5 4p           3d5  4p
   24    1cr i   d5 5p           3d5  5p
   24    1cr i   d5 6p           3d5  6p
   24    1cr i   d5 7p           3d5  7p
   24    1cr i   d5 8p           3d5  8p
   24    1cr i   d5 9p           3d5  9p
   24    1cr i   d4 4s4p         3d4  4s   4p
   24    1cr i   d4 4s5p         3d4  4s   5p
   24    1cr i   d4 4s6p         3d4  4s   6p
   24    1cr i   d4 4s7p         3d4  4s   7p
   24    1cr i   d4 4s8p         3d4  4s   8p
   24    1cr i   d4 4s9p         3d4  4s   9p
   24    1cr i   d3 4s2 4p       3d3  4s2  4p
   24    1cr i   d3 4s2 5p       3d3  4s2  5p
   24    1cr i   d5 4f           3d5  4f
   24    1cr i   d5 5f           3d5  5f
   24    1cr i   d5 6f           3d5  6f
   24    1cr i   d5 7f           3d5  7f
   24    1cr i   d5 8f           3d5  8f
   24    1cr i   d5 9f           3d5  9f
   24    1cr i   d4 4s4f         3d4  4s   4f
   24    1cr i   d4 4s5f         3d4  4s   5f
   24    1cr i   d4 4s6f         3d4  4s   6f
   24    1cr i   d4 4s7f         3d4  4s   7f
   24    1cr i   d4 4s8f         3d4  4s   8f
   24    1cr i   d4 4s9f         3d4  4s   9f
   24    1cr i   d3 4s2 4f       3d3  4s2  4f
   24    1cr i   d3 4s2 5f       3d3  4s2  5f
   24    1cr i   d5 6h           3d5  6h
   24    1cr i   d5 7h           3d5  7h
   24    1cr i   d5 8h           3d5  8h
   24    1cr i   d5 9h           3d5  9h
   24    1cr i   d4 4s6h         3d4  4s   6h
   24    1cr i   d4 4s7h         3d4  4s   7h
   24    1cr i   d4 4s8h         3d4  4s   8h
   24    1cr i   d4 4s9h         3d4  4s   9h
   24    1cr i   d5 8k           3d5  8k
   24    1cr i   d5 9k           3d5  9k
   24    1cr i   d4 4s8k         3d4  4s   8k
   24    1cr i   d4 4s9k         3d4  4s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF240001.DAT;*
$DELETE POOLG:HF240002.DAT;*
$DELETE POOLG:HF240004.DAT;*
$DELETE POOLG:HF240031.DAT;*
$DELETE POOLG:HF240032.DAT;*
