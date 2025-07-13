$set def ku6e:[kurucz.4104]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf410407.dat for007
$assign pool:hf410401.dat for001
$assign pool:hf410402.dat for002
$assign pool:hf410404.dat for004
$assign hf4104x.pun for011
$assign hf4104x.rrr for012
$assign hf4104x.dat for013
$assign hf4104xe.dat for014
$assign pool:hf410431.dat for031
$assign pool:hf410432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   41    5nb v  4p6 4d           4p6  4d
   41    5nb v  4p6 5d           4p6  5d
   41    5nb v  4p6 6d           4p6  6d
   41    5nb v  4p6 7d           4p6  7d
   41    5nb v  4p6 8d           4p6  8d
   41    5nb v  4p6 9d           4p6  9d
   41    5nb v  4p6 10d          4p6 10d
   41    5nb v  4p6 11d          4p6 11d
   41    5nb v  4p6 12d          4p6 12d
   41    5nb v  4p6 13d          4p6 13d
   41    5nb v  4p6 14d          4p6 14d
   41    5nb v  4p6 5s           4p6  5s
   41    5nb v  4p6 6s           4p6  6s
   41    5nb v  4p6 7s           4p6  7s
   41    5nb v  4p6 8s           4p6  8s
   41    5nb v  4p6 9s           4p6  9s
   41    5nb v  4p6 10s          4p6 10s
   41    5nb v  4p6 11s          4p6 11s
   41    5nb v  4p6 12s          4p6 12s
   41    5nb v  4p6 13s          4p6 13s
   41    5nb v  4p6 14s          4p6 14s
   41    5nb v  4p6 5g           4p6  5g
   41    5nb v  4p6 6g           4p6  6g
   41    5nb v  4p6 7g           4p6  7g
   41    5nb v  4p6 8g           4p6  8g
   41    5nb v  4p6 9g           4p6  9g
   41    5nb v  4p6 10g          4p6 10g
   41    5nb v  4p6 11g          4p6 11g
   41    5nb v  4p6 12g          4p6 12g
   41    5nb v  4p6 13g          4p6 13g
   41    5nb v  4p6 14g          4p6 14g
   41    5nb v  4p6 7i           4p6  7i
   41    5nb v  4p6 8i           4p6  8i
   41    5nb v  4p6 9i           4p6  9i
   41    5nb v  4p5 4d5p         4p5  4d   5p
   41    5nb v  4p5 5s5p         4p5  5s   5p
   41    5nb v  4p6 5p           4p6  5p
   41    5nb v  4p6 6p           4p6  6p
   41    5nb v  4p6 7p           4p6  7p
   41    5nb v  4p6 8p           4p6  8p
   41    5nb v  4p6 9p           4p6  9p
   41    5nb v  4p6 10p          4p6 10p
   41    5nb v  4p6 11p          4p6 11p
   41    5nb v  4p6 12p          4p6 12p
   41    5nb v  4p6 13p          4p6 13p
   41    5nb v  4p6 14p          4p6 14p
   41    5nb v  4p5 5p2          4p5  5p2
   41    5nb v  4p6 4f           4p6  4f
   41    5nb v  4p6 5f           4p6  5f
   41    5nb v  4p6 6f           4p6  6f
   41    5nb v  4p6 7f           4p6  7f
   41    5nb v  4p6 8f           4p6  8f
   41    5nb v  4p6 9f           4p6  9f
   41    5nb v  4p6 10f          4p6 10f
   41    5nb v  4p6 11f          4p6 11f
   41    5nb v  4p6 12f          4p6 12f
   41    5nb v  4p6 13f          4p6 13f
   41    5nb v  4p6 14f          4p6 14f
   41    5nb v  4p6 6h           4p6  6h
   41    5nb v  4p6 7h           4p6  7h
   41    5nb v  4p6 8h           4p6  8h
   41    5nb v  4p6 9h           4p6  9h
   41    5nb v  4p6 10h          4p6 10h
   41    5nb v  4p6 11h          4p6 11h
   41    5nb v  4p6 12h          4p6 12h
   41    5nb v  4p6 13h          4p6 13h
   41    5nb v  4p6 14h          4p6 14h
   41    5nb v  4p6 8k           4p6  8k
   41    5nb v  4p6 9k           4p6  9k
   41    5nb v  4p5 4d2          4p5  4d2
   41    5nb v  4p5 4d5s         4p5  4d   5s
   41    5nb v  4p5 5s2          4p5  5s2
   -1
$run cray:rcn2c
$DELETE POOL:HF410401.DAT;*
$DELETE POOL:HF410402.DAT;*
$DELETE POOL:HF410404.DAT;*
$DELETE POOL:HF410431.DAT;*
$DELETE POOL:HF410432.DAT;*
