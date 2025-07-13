$set4700
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf470007.dat for007
$assign poolg:hf470001.dat for001
$assign poolg:hf470002.dat for002
$assign poolg:hf470004.dat for004
$assign hf4700x.pun for011
$assign hf4700x.dat for013
$assign hf4700ex.dat for014
$assign poolg:hf470031.dat for031
$assign poolg:hf470032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   47    1ag i  d10 5s           4d10 5s
   47    1ag i  d10 6s           4d10 6s
   47    1ag i  d10 7s           4d10 7s
   47    1ag i  d10 8s           4d10 8s
   47    1ag i  d10 9s           4d10 9s
   47    1ag i  d10 10s          4d1010s
   47    1ag i  d9 5s2           4d9  5s2
   47    1ag i  d9 5s6s          4d9  5s   6s
   47    1ag i  d9 5s7s          4d9  5s   7s
   47    1ag i  d9 5s8s          4d9  5s   8s
   47    1ag i  d9 5s9s          4d9  5s   9s
   47    1ag i  d9 5s10s         4d9  5s  10s
   47    1ag i  d8 5s2 6s        4d8  5s2  6s
   47    1ag i  d8 5s2 7s        4d8  5s2  7s
   47    1ag i  d8 5s2 8s        4d8  5s2  8s
   47    1ag i  d8 5s2 9s        4d8  5s2  9s
   47    1ag i  d8 5s2 10s       4d8  5s2 10s
   47    1ag i  d10 5d           4d10 5d
   47    1ag i  d10 6d           4d10 6d
   47    1ag i  d10 7d           4d10 7d
   47    1ag i  d10 8d           4d10 8d
   47    1ag i  d10 9d           4d10 9d
   47    1ag i  d10 10d          4d1010d
   47    1ag i  d9 5s5d          4d9  5s   5d
   47    1ag i  d9 5s6d          4d9  5s   6d
   47    1ag i  d9 5s7d          4d9  5s   7d
   47    1ag i  d9 5s8d          4d9  5s   8d
   47    1ag i  d9 5s9d          4d9  5s   9d
   47    1ag i  d9 5s10d         4d9  5s  10d
   47    1ag i  d8 5s2 5d        4d8  5s2  5d
   47    1ag i  d8 5s2 6d        4d8  5s2  6d
   47    1ag i  d8 5s2 7d        4d8  5s2  7d
   47    1ag i  d8 5s2 8d        4d8  5s2  8d
   47    1ag i  d8 5s2 9d        4d8  5s2  9d
   47    1ag i  d8 5s2 10d       4d8  5s2 10d
   47    1ag i  d10 5g           4d10 5g
   47    1ag i  d10 6g           4d10 6g
   47    1ag i  d10 7g           4d10 7g
   47    1ag i  d10 8g           4d10 8g
   47    1ag i  d10 9g           4d10 9g
   47    1ag i  d10 10g          4d1010g
   47    1ag i  d9 5s5g          4d9  5s   5g
   47    1ag i  d9 5s6g          4d9  5s   6g
   47    1ag i  d9 5s7g          4d9  5s   7g
   47    1ag i  d9 5s8g          4d9  5s   8g
   47    1ag i  d9 5s9g          4d9  5s   9g
   47    1ag i  d9 5s10g         4d9  5s  10g
   47    1ag i  d10 7i           4d10 7i
   47    1ag i  d10 8i           4d10 8i
   47    1ag i  d10 9i           4d10 9i
   47    1ag i  d10 10i          4d1010i
   47    1ag i  d9 5s7i          4d9  5s   7i
   47    1ag i  d9 5s8i          4d9  5s   8i
   47    1ag i  d9 5s9i          4d9  5s   9i
   47    1ag i  d9 5s10i         4d9  5s  10i
   47    1ag i  d10 9l           4d1010l
   47    1ag i  d10 10l          4d1011l
   47    1ag i  d9 5s9l          4d9  5s  10l
   47    1ag i  d9 5s10l         4d9  5s  11l
   47    1ag i  d9 5p2           4d9  5p2
   47    1ag i  d10 5p           4d10 5p
   47    1ag i  d10 6p           4d10 6p
   47    1ag i  d10 7p           4d10 7p
   47    1ag i  d10 8p           4d10 8p
   47    1ag i  d10 9p           4d10 9p
   47    1ag i  d10 10p          4d1010p
   47    1ag i  d9 5s5p          4d9  5s   5p
   47    1ag i  d9 5s6p          4d9  5s   6p
   47    1ag i  d9 5s7p          4d9  5s   7p
   47    1ag i  d9 5s8p          4d9  5s   8p
   47    1ag i  d9 5s9p          4d9  5s   9p
   47    1ag i  d9 5s10p         4d9  5s  10p
   47    1ag i  d8 5s2 5p        4d8  5s2  5p
   47    1ag i  d8 5s2 6p        4d8  5s2  6p
   47    1ag i  d8 5s2 7p        4d8  5s2  7p
   47    1ag i  d8 5s2 8p        4d8  5s2  8p   
   47    1ag i  d8 5s2 9p        4d8  5s2  9p
   47    1ag i  d8 5s2 10p       4d8  5s2 10p
   47    1ag i  d10 4f           4d10 4f
   47    1ag i  d10 5f           4d10 5f
   47    1ag i  d10 6f           4d10 6f
   47    1ag i  d10 7f           4d10 7f
   47    1ag i  d10 8f           4d10 8f
   47    1ag i  d10 9f           4d10 9f
   47    1ag i  d10 10f          4d1010f
   47    1ag i  d9 5s4f          4d9  5s   4f
   47    1ag i  d9 5s5f          4d9  5s   5f
   47    1ag i  d9 5s6f          4d9  5s   6f
   47    1ag i  d9 5s7f          4d9  5s   7f
   47    1ag i  d9 5s8f          4d9  5s   8f
   47    1ag i  d9 5s9f          4d9  5s   9f
   47    1ag i  d9 5s10f         4d9  5s  10f
   47    1ag i  d8 5s2 4f        4d8  5s2  4f
   47    1ag i  d8 5s2 5f        4d8  5s2  5f
   47    1ag i  d8 5s2 6f        4d8  5s2  6f
   47    1ag i  d8 5s2 7f        4d8  5s2  7f
   47    1ag i  d8 5s2 8f        4d8  5s2  8f
   47    1ag i  d8 5s2 9f        4d8  5s2  9f
   47    1ag i  d8 5s2 10f       4d8  5s2 10f
   47    1ag i  d10 6h           4d10 6h
   47    1ag i  d10 7h           4d10 7h
   47    1ag i  d10 8h           4d10 8h
   47    1ag i  d10 9h           4d10 9h
   47    1ag i  d10 10h          4d1010h
   47    1ag i  d9 5s6h          4d9  5s   6h
   47    1ag i  d9 5s7h          4d9  5s   7h
   47    1ag i  d9 5s8h          4d9  5s   8h
   47    1ag i  d9 5s9h          4d9  5s   9h
   47    1ag i  d9 5s10h         4d9  5s  10h
   47    1ag i  d10 8k           4d10 8k
   47    1ag i  d10 9k           4d10 9k
   47    1ag i  d1010k           4d1010k
   47    1ag i  d9 5s8k          4d9  5s   8k
   47    1ag i  d9 5s9k          4d9  5s   9k
   47    1ag i  d9 5s10k         4d9  5s  10k
   -1
$run cray:rcn2c
$DELETE POOLG:HF470001.DAT;*
$DELETE POOLG:HF470002.DAT;*
$DELETE POOLG:HF470004.DAT;*
$DELETE POOLG:HF470031.DAT;*
$DELETE POOLG:HF470032.DAT;*
