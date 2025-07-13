$set def 2001
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf200107.dat for007
$assign poolg:hf200101.dat for001
$assign poolg:hf200102.dat for002
$assign poolg:hf200104.dat for004
$assign hf2001z.pun for011
$assign hf2001z.rrr for012
$assign hf2001z.dat for013
$assign hf2001ze.dat for014
$assign poolg:hf200131.dat for031
$assign poolg:hf200132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   20    2ca ii 3p6 4s           3p6  4s
   20    2ca ii 3p6 5s           3p6  5s
   20    2ca ii 3p6 6s           3p6  6s
   20    2ca ii 3p6 7s           3p6  7s
   20    2ca ii 3p6 8s           3p6  8s
   20    2ca ii 3p6 9s           3p6  9s
   20    2ca ii 3p6 10s          3p6 10s
   20    2ca ii 3p6 11s          3p6 11s
   20    2ca ii 3p6 12s          3p6 12s
   20    2ca ii 3p6 13s          3p6 13s
   20    2ca ii 3p6 14s          3p6 14s
   20    2ca ii 3p6 3d           3p6  3d
   20    2ca ii 3p6 4d           3p6  4d
   20    2ca ii 3p6 5d           3p6  5d
   20    2ca ii 3p6 6d           3p6  6d
   20    2ca ii 3p6 7d           3p6  7d
   20    2ca ii 3p6 8d           3p6  8d
   20    2ca ii 3p6 9d           3p6  9d
   20    2ca ii 3p6 10d          3p6 10d
   20    2ca ii 3p6 11d          3p6 11d
   20    2ca ii 3p6 12d          3p6 12d
   20    2ca ii 3p6 13d          3p6 13d
   20    2ca ii 3p6 14d          3p6 14d
   20    2ca ii 3p6 15d          3p6 15d
   20    2ca ii 3p6 16d          3p6 16d
   20    2ca ii 3p6 5g           3p6  5g
   20    2ca ii 3p6 6g           3p6  6g
   20    2ca ii 3p6 7g           3p6  7g
   20    2ca ii 3p6 8g           3p6  8g
   20    2ca ii 3p6 9g           3p6  9g
   20    2ca ii 3p6 7i           3p6  7i
   20    2ca ii 3p6 8i           3p6  8i
   20    2ca ii 3p6 9i           3p6  9i
   20    2ca ii 3p5 3d4p         3p5  3d   4p
   20    2ca ii 3p5 4s4p         3p5  4s   4p
   20    2ca ii 3p6 4p           3p6  4p
   20    2ca ii 3p6 5p           3p6  5p
   20    2ca ii 3p6 6p           3p6  6p
   20    2ca ii 3p6 7p           3p6  7p
   20    2ca ii 3p6 8p           3p6  8p
   20    2ca ii 3p6 9p           3p6  9p
   20    2ca ii 3p6 10p          3p6 10p
   20    2ca ii 3p6 11p          3p6 11p
   20    2ca ii 3p6 12p          3p6 12p
   20    2ca ii 3p6 13p          3p6 13p
   20    2ca ii 3p6 14p          3p6 14p
   20    2ca ii 3p5 4p2          3p5  4p2
   20    2ca ii 3p6 4f           3p6  4f
   20    2ca ii 3p6 5f           3p6  5f
   20    2ca ii 3p6 6f           3p6  6f
   20    2ca ii 3p6 7f           3p6  7f
   20    2ca ii 3p6 8f           3p6  8f
   20    2ca ii 3p6 9f           3p6  9f
   20    2ca ii 3p6 10f          3p6 10f
   20    2ca ii 3p6 11f          3p6 11f
   20    2ca ii 3p6 12f          3p6 12f
   20    2ca ii 3p6 13f          3p6 13f
   20    2ca ii 3p6 14f          3p6 14f
   20    2ca ii 3p6 6h           3p6  6h
   20    2ca ii 3p6 7h           3p6  7h
   20    2ca ii 3p6 8h           3p6  8h
   20    2ca ii 3p6 9h           3p6  9h
   20    2ca ii 3p6 10h          3p6 10h
   20    2ca ii 3p6 8k           3p6  8k
   20    2ca ii 3p6 9k           3p6  9k
   20    2ca ii 3p5 3d2          3p5  3d2
   20    2ca ii 3p5 3d4s         3p5  3d   4s
   20    2ca ii 3p5 4s2          3p5  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF200101.DAT;*
$DELETE POOLG:HF200102.DAT;*
$DELETE POOLG:HF200104.DAT;*
$DELETE POOLG:HF200131.DAT;*
$DELETE POOLG:HF200132.DAT;*
