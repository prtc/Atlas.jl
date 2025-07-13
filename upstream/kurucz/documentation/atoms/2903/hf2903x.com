$set def 2903
$assign sys$input for010
$assign sys$output for009
$assign POOL:hf290307.dat for007
$assign POOL:hf290301.dat for001
$assign POOL:hf290302.dat for002
$assign POOL:hf290304.dat for004
$assign hf2903x.pun for011
$assign hf2903x.rrr for012
$assign hf2903x.dat for013
$assign hf2903xe.dat for014
$assign POOL:hf290331.dat for031
$assign POOL:hf290332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   29    4cu iv  d8              3d8      
   29    4cu iv  d7 4d           3d7  4d
   29    4cu iv  d7 5d           3d7  5d
   29    4cu iv  d7 6d           3d7  6d
   29    4cu iv  d7 7d           3d7  7d
   29    4cu iv  d7 8d           3d7  8d
   29    4cu iv  d7 9d           3d7  9d
   29    4cu iv  d7 10d          3d7 10d
   29    4cu iv  d6 4s4d         3d6  4s   4d
   29    4cu iv  d6 4s5d         3d6  4s   5d
   29    4cu iv  d6 4s6d         3d6  4s   6d
   29    4cu iv  d6 4s7d         3d6  4s   7d
   29    4cu iv  d6 4s8d         3d6  4s   8d
   29    4cu iv  d6 4s9d         3d6  4s   9d
   29    4cu iv  d6 4s10d        3d6  4s  10d
   29    4cu iv  d5s2 4d         3d5  4s2  4d
   29    4cu iv  d5s2 5d         3d5  4s2  5d
   29    4cu iv  d5s2 6d         3d5  4s2  6d
   29    4cu iv  d5s2 7d         3d5  4s2  7d
   29    4cu iv  d5s2 8d         3d5  4s2  8d
   29    4cu iv  d5s2 9d         3d5  4s2  9d
   29    4cu iv  d5s2 10d        3d5  4s2 10d
   29    4cu iv  d7 4s           3d7  4s
   29    4cu iv  d7 5s           3d7  5s
   29    4cu iv  d7 6s           3d7  6s
   29    4cu iv  d7 7s           3d7  7s
   29    4cu iv  d7 8s           3d7  8s
   29    4cu iv  d7 9s           3d7  9s
   29    4cu iv  d7 10s          3d7 10s
   29    4cu iv  d6s2            3d6  4s2
   29    4cu iv  d6 4s5s         3d6  4s   5s
   29    4cu iv  d6 4s6s         3d6  4s   6s
   29    4cu iv  d6 4s7s         3d6  4s   7s
   29    4cu iv  d6 4s8s         3d6  4s   8s
   29    4cu iv  d6 4s9s         3d6  4s   9s
   29    4cu iv  d6 4s10s        3d6  4s  10s
   29    4cu iv  d5s2 5s         3d5  4s2  5s
   29    4cu iv  d5s2 6s         3d5  4s2  6s
   29    4cu iv  d5s2 7s         3d5  4s2  7s
   29    4cu iv  d5s2 8s         3d5  4s2  8s
   29    4cu iv  d5s2 9s         3d5  4s2  9s
   29    4cu iv  d5s2 10s        3d5  4s2 10s
   29    4cu iv  d7 5g           3d7  5g
   29    4cu iv  d7 6g           3d7  6g
   29    4cu iv  d7 7g           3d7  7g
   29    4cu iv  d7 8g           3d7  8g
   29    4cu iv  d7 9g           3d7  9g
   29    4cu iv  d6 4s5g         3d6  4s   5g
   29    4cu iv  d6 4s6g         3d6  4s   6g
   29    4cu iv  d6 4s7g         3d6  4s   7g
   29    4cu iv  d6 4s8g         3d6  4s   8g
   29    4cu iv  d6 4s9g         3d6  4s   9g
   29    4cu iv  d7 7i           3d7  7i
   29    4cu iv  d7 8i           3d7  8i
   29    4cu iv  d7 9i           3d7  9i
   29    4cu iv  d6 4s7i         3d6  4s   7i
   29    4cu iv  d6 4s8i         3d6  4s   8i
   29    4cu iv  d6 4s9i         3d6  4s   9i
   29    4cu iv  d7 9l           3d7 10l                                             actually 9l
   29    4cu iv  d6 4s9l         3d6  4s  10l                                        actually 9l
   29    4cu iv  d6p2            3d6  4p2
   29    4cu iv  d7 4p           3d7  4p
   29    4cu iv  d7 5p           3d7  5p
   29    4cu iv  d7 6p           3d7  6p
   29    4cu iv  d7 7p           3d7  7p
   29    4cu iv  d7 8p           3d7  8p
   29    4cu iv  d7 9p           3d7  9p
   29    4cu iv  d6 4s4p         3d6  4s   4p
   29    4cu iv  d6 4s5p         3d6  4s   5p
   29    4cu iv  d6 4s6p         3d6  4s   6p
   29    4cu iv  d6 4s7p         3d6  4s   7p
   29    4cu iv  d6 4s8p         3d6  4s   8p
   29    4cu iv  d6 4s9p         3d6  4s   9p
   29    4cu iv  d5s2 4p         3d5  4s2  4p
   29    4cu iv  d5s2 5p         3d5  4s2  5p
   29    4cu iv  d5s2 6p         3d5  4s2  6p
   29    4cu iv  d5s2 7p         3d5  4s2  7p
   29    4cu iv  d5s2 8p         3d5  4s2  8p
   29    4cu iv  d5s2 9p         3d5  4s2  9p
   29    4cu iv  d7 4f           3d7  4f
   29    4cu iv  d7 5f           3d7  5f
   29    4cu iv  d7 6f           3d7  6f
   29    4cu iv  d7 7f           3d7  7f
   29    4cu iv  d7 8f           3d7  8f
   29    4cu iv  d7 9f           3d7  9f
   29    4cu iv  d6 4s4f         3d6  4s   4f
   29    4cu iv  d6 4s5f         3d6  4s   5f
   29    4cu iv  d6 4s6f         3d6  4s   6f
   29    4cu iv  d6 4s7f         3d6  4s   7f
   29    4cu iv  d6 4s8f         3d6  4s   8f
   29    4cu iv  d6 4s9f         3d6  4s   9f
   29    4cu iv  d5s2 4f         3d5  4s2  4f
   29    4cu iv  d5s2 5f         3d5  4s2  5f
   29    4cu iv  d5s2 6f         3d5  4s2  6f
   29    4cu iv  d5s2 7f         3d5  4s2  7f
   29    4cu iv  d5s2 8f         3d5  4s2  8f
   29    4cu iv  d5s2 9f         3d5  4s2  9f
   29    4cu iv  d7 6h           3d7  6h
   29    4cu iv  d7 7h           3d7  7h
   29    4cu iv  d7 8h           3d7  8h
   29    4cu iv  d7 9h           3d7  9h
   29    4cu iv  d6 4s6h         3d6  4s   6h
   29    4cu iv  d6 4s7h         3d6  4s   7h
   29    4cu iv  d6 4s8h         3d6  4s   8h
   29    4cu iv  d6 4s9h         3d6  4s   9h
   29    4cu iv  d5s2 6h         3d5  4s2  6h
   29    4cu iv  d5s2 7h         3d5  4s2  7h
   29    4cu iv  d7 8k           3d7  8k
   29    4cu iv  d7 9k           3d7  9k
   29    4cu iv  d6 4s8k         3d6  4s   8k
   29    4cu iv  d6 4s9k         3d6  4s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF290301.DAT;*
$DELETE POOLG:HF290302.DAT;*
$DELETE POOLG:HF290304.DAT;*
$DELETE POOLG:HF290331.DAT;*
$DELETE POOLG:HF290332.DAT;*
