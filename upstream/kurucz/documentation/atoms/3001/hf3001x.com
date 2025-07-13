$set3001
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf300107.dat for007
$assign poolg:hf300101.dat for001
$assign poolg:hf300102.dat for002
$assign poolg:hf300104.dat for004
$assign hf3001x.pun for011
$assign hf3001x.rrr for012
$assign hf3001x.dat for013
$assign hf3001xe.dat for014
$assign poolg:hf300131.dat for031
$assign poolg:hf300132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   30    2zn ii d10 4s           3d10 4s
   30    2zn ii d10 5s           3d10 5s
   30    2zn ii d10 6s           3d10 6s
   30    2zn ii d10 7s           3d10 7s
   30    2zn ii d10 8s           3d10 8s
   30    2zn ii d10 9s           3d10 9s
   30    2zn ii d10 10s          3d1010s
   30    2zn ii d10 11s          3d1011s
   30    2zn ii d10 12s          3d1012s
   30    2zn ii d10 13s          3d1013s
   30    2zn ii d10 14s          3d1014s
   30    2zn ii d10 15s          3d1015s
   30    2zn ii d9 4s2           3d9  4s2
   30    2zn ii d9 4s5s          3d9  4s   5s
   30    2zn ii d9 4s6s          3d9  4s   6s
   30    2zn ii d9 4s7s          3d9  4s   7s
   30    2zn ii d9 4s8s          3d9  4s   8s
   30    2zn ii d9 4s9s          3d9  4s   9s
   30    2zn ii d9 4s10s         3d9  4s  10s
   30    2zn ii d9 4s11s         3d9  4s  11s
   30    2zn ii d9 4s12s         3d9  4s  12s
   30    2zn ii d9 4s13s         3d9  4s  13s
   30    2zn ii d9 4s14s         3d9  4s  14s
   30    2zn ii d9 4s15s         3d9  4s  15s
   30    2zn ii d8 4s2 5s        3d8  4s2  5s
   30    2zn ii d8 4s2 6s        3d8  4s2  6s
   30    2zn ii d10 4d           3d10 4d
   30    2zn ii d10 5d           3d10 5d
   30    2zn ii d10 6d           3d10 6d
   30    2zn ii d10 7d           3d10 7d
   30    2zn ii d10 8d           3d10 8d
   30    2zn ii d10 9d           3d10 9d
   30    2zn ii d10 10d          3d1010d
   30    2zn ii d9 4s4d          3d9  4s   4d
   30    2zn ii d9 4s5d          3d9  4s   5d
   30    2zn ii d9 4s6d          3d9  4s   6d
   30    2zn ii d9 4s7d          3d9  4s   7d
   30    2zn ii d9 4s8d          3d9  4s   8d
   30    2zn ii d9 4s9d          3d9  4s   9d
   30    2zn ii d9 4s10d         3d9  4s  10d
   30    2zn ii d8 4s2 4d        3d8  4s2  4d
   30    2zn ii d8 4s2 5d        3d8  4s2  5d
   30    2zn ii d9 4s5g          3d9  4s   5g
   30    2zn ii d9 4s6g          3d9  4s   6g
   30    2zn ii d9 4s7g          3d9  4s   7g
   30    2zn ii d9 4s8g          3d9  4s   8g
   30    2zn ii d9 4s9g          3d9  4s   9g
   30    2zn ii d10 5g           3d10 5g
   30    2zn ii d10 6g           3d10 6g
   30    2zn ii d10 7g           3d10 7g
   30    2zn ii d10 8g           3d10 8g
   30    2zn ii d10 9g           3d10 9g
   30    2zn ii d9 4s7i          3d9  4s   7i
   30    2zn ii d9 4s8i          3d9  4s   8i
   30    2zn ii d9 4s9i          3d9  4s   9i
   30    2zn ii d10 7i           3d10 7i
   30    2zn ii d10 8i           3d10 8i
   30    2zn ii d10 9i           3d10 9i
   30    2zn ii d9 4s9l          3d9  4s  10l
   30    2zn ii d10 9l           3d1010l
   30    2zn ii d9 4p2           3d9  4p2
   30    2zn ii d10 4p           3d10 4p
   30    2zn ii d10 5p           3d10 5p
   30    2zn ii d10 6p           3d10 6p
   30    2zn ii d10 7p           3d10 7p
   30    2zn ii d10 8p           3d10 8p
   30    2zn ii d10 9p           3d10 9p
   30    2zn ii d10 10p          3d1010p
   30    2zn ii d10 11p          3d1011p
   30    2zn ii d10 12p          3d1012p
   30    2zn ii d10 13p          3d1013p
   30    2zn ii d10 14p          3d1014p
   30    2zn ii d10 15p          3d1015p
   30    2zn ii d9 4s4p          3d9  4s   4p
   30    2zn ii d9 4s5p          3d9  4s   5p
   30    2zn ii d9 4s6p          3d9  4s   6p
   30    2zn ii d9 4s7p          3d9  4s   7p
   30    2zn ii d9 4s8p          3d9  4s   8p
   30    2zn ii d9 4s9p          3d9  4s   9p
   30    2zn ii d9 4s10p         3d9  4s  10p
   30    2zn ii d9 4s11p         3d9  4s  11p
   30    2zn ii d9 4s12p         3d9  4s  12p
   30    2zn ii d9 4s13p         3d9  4s  13p
   30    2zn ii d9 4s14p         3d9  4s  14p
   30    2zn ii d9 4s15p         3d9  4s  15p
   30    2zn ii d8 4s2 4p        3d8  4s2  4p
   30    2zn ii d8 4s2 5p        3d8  4s2  5p
   30    2zn ii d8 4s2 6p        3d8  4s2  6p
   30    2zn ii d8 4s2 7p        3d8  4s2  7p
   30    2zn ii d10 4f           3d10 4f
   30    2zn ii d10 5f           3d10 5f
   30    2zn ii d10 6f           3d10 6f
   30    2zn ii d10 7f           3d10 7f
   30    2zn ii d10 8f           3d10 8f
   30    2zn ii d10 9f           3d10 9f
   30    2zn ii d10 10f          3d1010f
   30    2zn ii d10 11f          3d1011f
   30    2zn ii d10 12f          3d1012f
   30    2zn ii d9 4s4f          3d9  4s   4f
   30    2zn ii d9 4s5f          3d9  4s   5f
   30    2zn ii d9 4s6f          3d9  4s   6f
   30    2zn ii d9 4s7f          3d9  4s   7f
   30    2zn ii d9 4s8f          3d9  4s   8f
   30    2zn ii d9 4s9f          3d9  4s   9f
   30    2zn ii d9 4s10f         3d9  4s  10f
   30    2zn ii d9 4s11f         3d9  4s  11f
   30    2zn ii d9 4s12f         3d9  4s  12f
   30    2zn ii d8 4s2 4f        3d8  4s2  4f
   30    2zn ii d8 4s2 5f        3d8  4s2  5f
   30    2zn ii d9 4s6h          3d9  4s   6h
   30    2zn ii d9 4s7h          3d9  4s   7h
   30    2zn ii d9 4s8h          3d9  4s   8h
   30    2zn ii d9 4s9h          3d9  4s   9h
   30    2zn ii d10 6h           3d10 6h
   30    2zn ii d10 7h           3d10 7h
   30    2zn ii d10 8h           3d10 8h
   30    2zn ii d10 9h           3d10 9h
   30    2zn ii d9 4s8k          3d9  4s   8k
   30    2zn ii d9 4s9k          3d9  4s   9k
   30    2zn ii d10 8k           3d10 8k
   30    2zn ii d10 9k           3d10 9k
   30    2zn ii d9 4p5s          3d9  4p   5s
   -1
$run cray:rcn2c
$DELETE POOLG:HF300101.DAT;*
$DELETE POOLG:HF300102.DAT;*
$DELETE POOLG:HF300104.DAT;*
$DELETE POOLG:HF300131.DAT;*
$DELETE POOLG:HF300132.DAT;*
