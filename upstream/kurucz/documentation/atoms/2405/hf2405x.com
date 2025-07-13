$set def 2405
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf240507.dat for007
$assign poolg:hf240501.dat for001
$assign poolg:hf240502.dat for002
$assign poolg:hf240504.dat for004
$assign hf2405x.pun for011
$assign hf2405x.rrr for012
$assign hf2405x.dat for013
$assign hf2405xe.dat for014
$assign poolg:hf240531.dat for031
$assign poolg:hf240532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   24    6cr vi 3p6 3d           3p6  3d
   24    6cr vi 3p6 4d           3p6  4d
   24    6cr vi 3p6 5d           3p6  5d
   24    6cr vi 3p6 6d           3p6  6d
   24    6cr vi 3p6 7d           3p6  7d
   24    6cr vi 3p6 8d           3p6  8d
   24    6cr vi 3p6 9d           3p6  9d
   24    6cr vi 3p6 10d          3p6 10d
   24    6cr vi 3p6 11d          3p6 11d
   24    6cr vi 3p6 12d          3p6 12d
   24    6cr vi 3p6 13d          3p6 13d
   24    6cr vi 3p6 14d          3p6 14d
   24    6cr vi 3p6 4s           3p6  4s
   24    6cr vi 3p6 5s           3p6  5s
   24    6cr vi 3p6 6s           3p6  6s
   24    6cr vi 3p6 7s           3p6  7s
   24    6cr vi 3p6 8s           3p6  8s
   24    6cr vi 3p6 9s           3p6  9s
   24    6cr vi 3p6 10s          3p6 10s
   24    6cr vi 3p6 11s          3p6 11s
   24    6cr vi 3p6 12s          3p6 12s
   24    6cr vi 3p6 13s          3p6 13s
   24    6cr vi 3p6 14s          3p6 14s
   24    6cr vi 3p6 5g           3p6  5g
   24    6cr vi 3p6 6g           3p6  6g
   24    6cr vi 3p6 7g           3p6  7g
   24    6cr vi 3p6 8g           3p6  8g
   24    6cr vi 3p6 9g           3p6  9g
   24    6cr vi 3p6 7i           3p6  7i
   24    6cr vi 3p6 8i           3p6  8i
   24    6cr vi 3p6 9i           3p6  9i
   24    6cr vi 3p5 3d4p         3p5  3d   4p
   24    6cr vi 3p5 4s4p         3p5  4s   4p
   24    6cr vi 3p6 4p           3p6  4p
   24    6cr vi 3p6 5p           3p6  5p
   24    6cr vi 3p6 6p           3p6  6p
   24    6cr vi 3p6 7p           3p6  7p
   24    6cr vi 3p6 8p           3p6  8p
   24    6cr vi 3p6 9p           3p6  9p
   24    6cr vi 3p6 10p          3p6 10p
   24    6cr vi 3p6 11p          3p6 11p
   24    6cr vi 3p6 12p          3p6 12p
   24    6cr vi 3p6 13p          3p6 13p
   24    6cr vi 3p6 14p          3p6 14p
   24    6cr vi 3p5 4p2          3p5  4p2
   24    6cr vi 3p6 4f           3p6  4f
   24    6cr vi 3p6 5f           3p6  5f
   24    6cr vi 3p6 6f           3p6  6f
   24    6cr vi 3p6 7f           3p6  7f
   24    6cr vi 3p6 8f           3p6  8f
   24    6cr vi 3p6 9f           3p6  9f
   24    6cr vi 3p6 10f          3p6 10f
   24    6cr vi 3p6 11f          3p6 11f
   24    6cr vi 3p6 12f          3p6 12f
   24    6cr vi 3p6 13f          3p6 13f
   24    6cr vi 3p6 14f          3p6 14f
   24    6cr vi 3p6 6h           3p6  6h
   24    6cr vi 3p6 7h           3p6  7h
   24    6cr vi 3p6 8h           3p6  8h
   24    6cr vi 3p6 9h           3p6  9h
   24    6cr vi 3p6 8k           3p6  8k
   24    6cr vi 3p6 9k           3p6  9k
   24    6cr vi 3p5 3d2          3p5  3d2
   24    6cr vi 3p5 3d4s         3p5  3d   4s
   24    6cr vi 3p5 4s2          3p5  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF240501.DAT;*
$DELETE POOLG:HF240502.DAT;*
$DELETE POOLG:HF240504.DAT;*
$DELETE POOLG:HF240531.DAT;*
$DELETE POOLG:HF240532.DAT;*
