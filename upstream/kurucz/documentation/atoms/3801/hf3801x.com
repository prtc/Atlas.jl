$set def 3801
$assign sys$input for010
$assign sys$output for009
$assign pool:hf380107.dat for007
$assign pool:hf380101.dat for001
$assign pool:hf380102.dat for002
$assign pool:hf380104.dat for004
$assign hf3801x.pun for011
$assign hf3801x.rrr for012
$assign hf3801x.dat for013
$assign hf3801xe.dat for014
$assign pool:hf380131.dat for031
$assign pool:hf380132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   38    2sr ii 4p6 5s           4p6  5s
   38    2sr ii 4p6 6s           4p6  6s
   38    2sr ii 4p6 7s           4p6  7s
   38    2sr ii 4p6 8s           4p6  8s
   38    2sr ii 4p6 9s           4p6  9s
   38    2sr ii 4p6 10s          4p6 10s
   38    2sr ii 4p6 11s          4p6 11s
   38    2sr ii 4p6 12s          4p6 12s
   38    2sr ii 4p6 13s          4p6 13s
   38    2sr ii 4p6 14s          4p6 14s
   38    2sr ii 4p6 4d           4p6  4d
   38    2sr ii 4p6 5d           4p6  5d
   38    2sr ii 4p6 6d           4p6  6d
   38    2sr ii 4p6 7d           4p6  7d
   38    2sr ii 4p6 8d           4p6  8d
   38    2sr ii 4p6 9d           4p6  9d
   38    2sr ii 4p6 10d          4p6 10d
   38    2sr ii 4p6 11d          4p6 11d
   38    2sr ii 4p6 12d          4p6 12d
   38    2sr ii 4p6 13d          4p6 13d
   38    2sr ii 4p6 14d          4p6 14d
   38    2sr ii 4p6 5g           4p6  5g
   38    2sr ii 4p6 6g           4p6  6g
   38    2sr ii 4p6 7g           4p6  7g
   38    2sr ii 4p6 8g           4p6  8g
   38    2sr ii 4p6 9g           4p6  9g
   38    2sr ii 4p6 10g          4p6 10g
   38    2sr ii 4p6 11g          4p6 11g
   38    2sr ii 4p6 12g          4p6 12g
   38    2sr ii 4p6 13g          4p6 13g
   38    2sr ii 4p6 14g          4p6 14g
   38    2sr ii 4p6 7i           4p6  7i
   38    2sr ii 4p6 8i           4p6  8i
   38    2sr ii 4p6 9i           4p6  9i
   38    2sr ii 4p5 4d5p         4p5  4d   5p
   38    2sr ii 4p5 5s5p         4p5  5s   5p
   38    2sr ii 4p6 5p           4p6  5p
   38    2sr ii 4p6 6p           4p6  6p
   38    2sr ii 4p6 7p           4p6  7p
   38    2sr ii 4p6 8p           4p6  8p
   38    2sr ii 4p6 9p           4p6  9p
   38    2sr ii 4p6 10p          4p6 10p
   38    2sr ii 4p6 11p          4p6 11p
   38    2sr ii 4p6 12p          4p6 12p
   38    2sr ii 4p6 13p          4p6 13p
   38    2sr ii 4p6 14p          4p6 14p
   38    2sr ii 4p5 5p2          4p5  5p2
   38    2sr ii 4p6 4f           4p6  4f
   38    2sr ii 4p6 5f           4p6  5f
   38    2sr ii 4p6 6f           4p6  6f
   38    2sr ii 4p6 7f           4p6  7f
   38    2sr ii 4p6 8f           4p6  8f
   38    2sr ii 4p6 9f           4p6  9f
   38    2sr ii 4p6 10f          4p6 10f
   38    2sr ii 4p6 11f          4p6 11f
   38    2sr ii 4p6 12f          4p6 12f
   38    2sr ii 4p6 13f          4p6 13f
   38    2sr ii 4p6 14f          4p6 14f
   38    2sr ii 4p6 6h           4p6  6h
   38    2sr ii 4p6 7h           4p6  7h
   38    2sr ii 4p6 8h           4p6  8h
   38    2sr ii 4p6 9h           4p6  9h
   38    2sr ii 4p6 10h          4p6 10h
   38    2sr ii 4p6 11h          4p6 11h
   38    2sr ii 4p6 12h          4p6 12h
   38    2sr ii 4p6 13h          4p6 13h
   38    2sr ii 4p6 14h          4p6 14h
   38    2sr ii 4p6 8k           4p6  8k
   38    2sr ii 4p6 9k           4p6  9k
   38    2sr ii 4p5 4d2          4p5  4d2
   38    2sr ii 4p5 4d5s         4p5  4d   5s
   38    2sr ii 4p5 5s2          4p5  5s2
   -1
$run cray:rcn2c
$DELETE POOL:HF380101.DAT;*
$DELETE POOL:HF380102.DAT;*
$DELETE POOL:HF380104.DAT;*
$DELETE POOL:HF380131.DAT;*
$DELETE POOL:HF380132.DAT;*
