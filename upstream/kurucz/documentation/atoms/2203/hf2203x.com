$set def 2203
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf220307.dat for007
$assign poolg:hf220301.dat for001
$assign poolg:hf220302.dat for002
$assign poolg:hf220304.dat for004
$assign hf2203x.pun for011
$assign hf2203x.rrr for012
$assign hf2203x.dat for013
$assign hf2203xe.dat for014
$assign poolg:hf220331.dat for031
$assign poolg:hf220332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   22    4ti iv 3p6 3d           3p6  3d
   22    4ti iv 3p6 4d           3p6  4d
   22    4ti iv 3p6 5d           3p6  5d
   22    4ti iv 3p6 6d           3p6  6d
   22    4ti iv 3p6 7d           3p6  7d
   22    4ti iv 3p6 8d           3p6  8d
   22    4ti iv 3p6 9d           3p6  9d
   22    4ti iv 3p6 10d          3p6 10d
   22    4ti iv 3p6 11d          3p6 11d
   22    4ti iv 3p6 12d          3p6 12d
   22    4ti iv 3p6 13d          3p6 13d
   22    4ti iv 3p6 14d          3p6 14d
   22    4ti iv 3p6 4s           3p6  4s
   22    4ti iv 3p6 5s           3p6  5s
   22    4ti iv 3p6 6s           3p6  6s
   22    4ti iv 3p6 7s           3p6  7s
   22    4ti iv 3p6 8s           3p6  8s
   22    4ti iv 3p6 9s           3p6  9s
   22    4ti iv 3p6 10s          3p6 10s
   22    4ti iv 3p6 11s          3p6 11s
   22    4ti iv 3p6 12s          3p6 12s
   22    4ti iv 3p6 13s          3p6 13s
   22    4ti iv 3p6 14s          3p6 14s
   22    4ti iv 3p6 5g           3p6  5g
   22    4ti iv 3p6 6g           3p6  6g
   22    4ti iv 3p6 7g           3p6  7g
   22    4ti iv 3p6 8g           3p6  8g
   22    4ti iv 3p6 9g           3p6  9g
   22    4ti iv 3p6 7i           3p6  7i
   22    4ti iv 3p6 8i           3p6  8i
   22    4ti iv 3p6 9i           3p6  9i
   22    4ti iv 3p5 3d4p         3p5  3d   4p
   22    4ti iv 3p5 4s4p         3p5  4s   4p
   22    4ti iv 3p6 4p           3p6  4p
   22    4ti iv 3p6 5p           3p6  5p
   22    4ti iv 3p6 6p           3p6  6p
   22    4ti iv 3p6 7p           3p6  7p
   22    4ti iv 3p6 8p           3p6  8p
   22    4ti iv 3p6 9p           3p6  9p
   22    4ti iv 3p6 10p          3p6 10p
   22    4ti iv 3p6 11p          3p6 11p
   22    4ti iv 3p6 12p          3p6 12p
   22    4ti iv 3p6 13p          3p6 13p
   22    4ti iv 3p6 14p          3p6 14p
   22    4ti iv 3p5 4p2          3p5  4p2
   22    4ti iv 3p6 4f           3p6  4f
   22    4ti iv 3p6 5f           3p6  5f
   22    4ti iv 3p6 6f           3p6  6f
   22    4ti iv 3p6 7f           3p6  7f
   22    4ti iv 3p6 8f           3p6  8f
   22    4ti iv 3p6 9f           3p6  9f
   22    4ti iv 3p6 10f          3p6 10f
   22    4ti iv 3p6 11f          3p6 11f
   22    4ti iv 3p6 12f          3p6 12f
   22    4ti iv 3p6 13f          3p6 13f
   22    4ti iv 3p6 14f          3p6 14f
   22    4ti iv 3p6 6h           3p6  6h
   22    4ti iv 3p6 7h           3p6  7h
   22    4ti iv 3p6 8h           3p6  8h
   22    4ti iv 3p6 9h           3p6  9h
   22    4ti iv 3p6 8k           3p6  8k
   22    4ti iv 3p6 9k           3p6  9k
   22    4ti iv 3p5 3d2          3p5  3d2
   22    4ti iv 3p5 3d4s         3p5  3d   4s
   22    4ti iv 3p5 4s2          3p5  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF220301.DAT;*
$DELETE POOLG:HF220302.DAT;*
$DELETE POOLG:HF220304.DAT;*
$DELETE POOLG:HF220331.DAT;*
$DELETE POOLG:HF220332.DAT;*
