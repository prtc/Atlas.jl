$set def 2809
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf280907.dat for007
$assign poolg:hf280901.dat for001
$assign poolg:hf280902.dat for002
$assign poolg:hf280904.dat for004
$assign hf2809Z.pun for011
$assign hf2809Z.rrr for012
$assign hf2809Z.dat for013
$assign hf2809Ze.dat for014
$assign poolg:hf280931.dat for031
$assign poolg:hf280932.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   28   10ni x   3p6 3d          3p6  3d
   28   10ni x   3p6 4d          3p6  4d
   28   10ni x   3p6 5d          3p6  5d
   28   10ni x   3p6 6d          3p6  6d
   28   10ni x   3p6 7d          3p6  7d
   28   10ni x   3p6 8d          3p6  8d
   28   10ni x   3p6 9d          3p6  9d
   28   10ni x   3p6 10d         3p6 10d
   28   10ni x   3p6 11d         3p6 11d
   28   10ni x   3p6 12d         3p6 12d
   28   10ni x   3p6 4s          3p6  4s
   28   10ni x   3p6 5s          3p6  5s
   28   10ni x   3p6 6s          3p6  6s
   28   10ni x   3p6 7s          3p6  7s
   28   10ni x   3p6 8s          3p6  8s
   28   10ni x   3p6 9s          3p6  9s
   28   10ni x   3p6 10s         3p6 10s
   28   10ni x   3p6 11s         3p6 11s
   28   10ni x   3p6 12s         3p6 12s
   28   10ni x   3p6 5g          3p6  5g
   28   10ni x   3p6 6g          3p6  6g
   28   10ni x   3p6 7g          3p6  7g
   28   10ni x   3p6 8g          3p6  8g
   28   10ni x   3p6 9g          3p6  9g
   28   10ni x   3p6 7i          3p6  7i
   28   10ni x   3p6 8i          3p6  8i
   28   10ni x   3p6 9i          3p6  9i
   28   10ni x   3p5 3d4p        3p5  3d   4p
   28   10ni x   3p5 3d5p        3p5  3d   5p
   28   10ni x   3p5 3d6p        3p5  3d   6p
   28   10ni x   3p5 3d7p        3p5  3d   7p
   28   10ni x   3p5 3d8p        3p5  3d   8p
   28   10ni x   3p5 3d9p        3p5  3d   9p
   28   10ni x   3p5 4s4p        3p5  4s   4p
   28   10ni x   3p5 4s5p        3p5  4s   5p
   28   10ni x   3p5 4s6p        3p5  4s   6p
   28   10ni x   3p5 4s7p        3p5  4s   7p
   28   10ni x   3p5 4s8p        3p5  4s   8p
   28   10ni x   3p5 4s9p        3p5  4s   9p
   28   10ni x   3p6 4p          3p6  4p
   28   10ni x   3p6 5p          3p6  5p
   28   10ni x   3p6 6p          3p6  6p
   28   10ni x   3p6 7p          3p6  7p
   28   10ni x   3p6 8p          3p6  8p
   28   10ni x   3p6 9p          3p6  9p
   28   10ni x   3p6 10p         3p6 10p
   28   10ni x   3p6 11p         3p6 11p
   28   10ni x   3p6 12p         3p6 12p
   28   10ni x   3p6 4f          3p6  4f
   28   10ni x   3p6 5f          3p6  5f
   28   10ni x   3p6 6f          3p6  6f
   28   10ni x   3p6 7f          3p6  7f
   28   10ni x   3p6 8f          3p6  8f
   28   10ni x   3p6 9f          3p6  9f
   28   10ni x   3p6 10f         3p6 10f
   28   10ni x   3p6 11f         3p6 11f
   28   10ni x   3p6 12f         3p6 12f
   28   10ni x   3p6 6h          3p6  6h
   28   10ni x   3p6 7h          3p6  7h
   28   10ni x   3p6 8h          3p6  8h
   28   10ni x   3p6 9h          3p6  9h
   28   10ni x   3p6 8k          3p6  8k
   28   10ni x   3p6 9k          3p6  9k
   28   10ni x   3p5 3d2         3p5  3d2
   28   10ni x   3p5 3d4d        3p5  3d   4d
   28   10ni x   3p5 3d5d        3p5  3d   5d
   28   10ni x   3p5 3d6d        3p5  3d   6d
   28   10ni x   3p5 3d7d        3p5  3d   7d
   28   10ni x   3p5 3d8d        3p5  3d   8d
   28   10ni x   3p5 3d9d        3p5  3d   9d
   28   10ni x   3p5 4s4d        3p5  4s   4d
   28   10ni x   3p5 4s5d        3p5  4s   5d
   28   10ni x   3p5 4s6d        3p5  4s   6d
   28   10ni x   3p5 4s7d        3p5  4s   7d
   28   10ni x   3p5 4s8d        3p5  4s   8d
   28   10ni x   3p5 4s9d        3p5  4s   9d
   28   10ni x   3p5 3d4s        3p5  3d   4s
   28   10ni x   3p5 4s2         3p5  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF280901.DAT;*
$DELETE POOLG:HF280902.DAT;*
$DELETE POOLG:HF280904.DAT;*
$DELETE POOLG:HF280931.DAT;*
$DELETE POOLG:HF280932.DAT;*
