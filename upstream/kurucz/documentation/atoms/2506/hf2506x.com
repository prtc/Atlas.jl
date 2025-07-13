$set def 2506
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf250607.dat for007
$assign poolg:hf250601.dat for001
$assign poolg:hf250602.dat for002
$assign poolg:hf250604.dat for004
$assign hf2506x.pun for011
$assign hf2506x.rrr for012
$assign hf2506x.dat for013
$assign hf2506xe.dat for014
$assign poolg:hf250631.dat for031
$assign poolg:hf250632.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   25    7mn vii3p6 3d           3p6  3d
   25    7mn vii3p6 4d           3p6  4d
   25    7mn vii3p6 5d           3p6  5d
   25    7mn vii3p6 6d           3p6  6d
   25    7mn vii3p6 7d           3p6  7d
   25    7mn vii3p6 8d           3p6  8d
   25    7mn vii3p6 9d           3p6  9d
   25    7mn vii3p6 10d          3p6 10d
   25    7mn vii3p6 11d          3p6 11d
   25    7mn vii3p6 12d          3p6 12d
   25    7mn vii3p6 13d          3p6 13d
   25    7mn vii3p6 14d          3p6 14d
   25    7mn vii3p6 4s           3p6  4s
   25    7mn vii3p6 5s           3p6  5s
   25    7mn vii3p6 6s           3p6  6s
   25    7mn vii3p6 7s           3p6  7s
   25    7mn vii3p6 8s           3p6  8s
   25    7mn vii3p6 9s           3p6  9s
   25    7mn vii3p6 10s          3p6 10s
   25    7mn vii3p6 11s          3p6 11s
   25    7mn vii3p6 12s          3p6 12s
   25    7mn vii3p6 13s          3p6 13s
   25    7mn vii3p6 14s          3p6 14s
   25    7mn vii3p6 5g           3p6  5g
   25    7mn vii3p6 6g           3p6  6g
   25    7mn vii3p6 7g           3p6  7g
   25    7mn vii3p6 8g           3p6  8g
   25    7mn vii3p6 9g           3p6  9g
   25    7mn vii3p6 7i           3p6  7i
   25    7mn vii3p6 8i           3p6  8i
   25    7mn vii3p6 9i           3p6  9i
   25    7mn vii3p5 3d4p         3p5  3d   4p
   25    7mn vii3p5 4s4p         3p5  4s   4p
   25    7mn vii3p6 4p           3p6  4p
   25    7mn vii3p6 5p           3p6  5p
   25    7mn vii3p6 6p           3p6  6p
   25    7mn vii3p6 7p           3p6  7p
   25    7mn vii3p6 8p           3p6  8p
   25    7mn vii3p6 9p           3p6  9p
   25    7mn vii3p6 10p          3p6 10p
   25    7mn vii3p6 11p          3p6 11p
   25    7mn vii3p6 12p          3p6 12p
   25    7mn vii3p6 13p          3p6 13p
   25    7mn vii3p6 14p          3p6 14p
   25    7mn vii3p5 4p2          3p5  4p2
   25    7mn vii3p6 4f           3p6  4f
   25    7mn vii3p6 5f           3p6  5f
   25    7mn vii3p6 6f           3p6  6f
   25    7mn vii3p6 7f           3p6  7f
   25    7mn vii3p6 8f           3p6  8f
   25    7mn vii3p6 9f           3p6  9f
   25    7mn vii3p6 10f          3p6 10f
   25    7mn vii3p6 11f          3p6 11f
   25    7mn vii3p6 12f          3p6 12f
   25    7mn vii3p6 13f          3p6 13f
   25    7mn vii3p6 14f          3p6 14f
   25    7mn vii3p6 6h           3p6  6h
   25    7mn vii3p6 7h           3p6  7h
   25    7mn vii3p6 8h           3p6  8h
   25    7mn vii3p6 9h           3p6  9h
   25    7mn vii3p6 8k           3p6  8k
   25    7mn vii3p6 9k           3p6  9k
   25    7mn vii3p5 3d2          3p5  3d2
   25    7mn vii3p5 3d4s         3p5  3d   4s
   25    7mn vii3p5 4s2          3p5  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF250601.DAT;*
$DELETE POOLG:HF250602.DAT;*
$DELETE POOLG:HF250604.DAT;*
$DELETE POOLG:HF250631.DAT;*
$DELETE POOLG:HF250632.DAT;*
