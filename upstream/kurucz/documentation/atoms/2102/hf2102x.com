$set def 2102
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf210207.dat for007
$assign poolg:hf210201.dat for001
$assign poolg:hf210202.dat for002
$assign poolg:hf210204.dat for004
$assign hf2102x.pun for011
$assign hf2102x.rrr for012
$assign hf2102x.dat for013
$assign hf2102xe.dat for014
$assign poolg:hf210231.dat for031
$assign poolg:hf210232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   21    3sciii 3p6 3d           3p6  3d
   21    3sciii 3p6 4d           3p6  4d
   21    3sciii 3p6 5d           3p6  5d
   21    3sciii 3p6 6d           3p6  6d
   21    3sciii 3p6 7d           3p6  7d
   21    3sciii 3p6 8d           3p6  8d
   21    3sciii 3p6 9d           3p6  9d
   21    3sciii 3p6 10d          3p6 10d
   21    3sciii 3p6 11d          3p6 11d
   21    3sciii 3p6 12d          3p6 12d
   21    3sciii 3p6 13d          3p6 13d
   21    3sciii 3p6 14d          3p6 14d
   21    3sciii 3p6 4s           3p6  4s
   21    3sciii 3p6 5s           3p6  5s
   21    3sciii 3p6 6s           3p6  6s
   21    3sciii 3p6 7s           3p6  7s
   21    3sciii 3p6 8s           3p6  8s
   21    3sciii 3p6 9s           3p6  9s
   21    3sciii 3p6 10s          3p6 10s
   21    3sciii 3p6 11s          3p6 11s
   21    3sciii 3p6 12s          3p6 12s
   21    3sciii 3p6 13s          3p6 13s
   21    3sciii 3p6 14s          3p6 14s
   21    3sciii 3p6 5g           3p6  5g
   21    3sciii 3p6 6g           3p6  6g
   21    3sciii 3p6 7g           3p6  7g
   21    3sciii 3p6 8g           3p6  8g
   21    3sciii 3p6 9g           3p6  9g
   21    3sciii 3p6 7i           3p6  7i
   21    3sciii 3p6 8i           3p6  8i
   21    3sciii 3p6 9i           3p6  9i
   21    3sciii 3p5 3d4p         3p5  3d   4p
   21    3sciii 3p5 4s4p         3p5  4s   4p
   21    3sciii 3p6 4p           3p6  4p
   21    3sciii 3p6 5p           3p6  5p
   21    3sciii 3p6 6p           3p6  6p
   21    3sciii 3p6 7p           3p6  7p
   21    3sciii 3p6 8p           3p6  8p
   21    3sciii 3p6 9p           3p6  9p
   21    3sciii 3p6 10p          3p6 10p
   21    3sciii 3p6 11p          3p6 11p
   21    3sciii 3p6 12p          3p6 12p
   21    3sciii 3p6 13p          3p6 13p
   21    3sciii 3p6 14p          3p6 14p
   21    3sciii 3p5 4p2          3p5  4p2
   21    3sciii 3p6 4f           3p6  4f
   21    3sciii 3p6 5f           3p6  5f
   21    3sciii 3p6 6f           3p6  6f
   21    3sciii 3p6 7f           3p6  7f
   21    3sciii 3p6 8f           3p6  8f
   21    3sciii 3p6 9f           3p6  9f
   21    3sciii 3p6 10f          3p6 10f
   21    3sciii 3p6 11f          3p6 11f
   21    3sciii 3p6 12f          3p6 12f
   21    3sciii 3p6 13f          3p6 13f
   21    3sciii 3p6 14f          3p6 14f
   21    3sciii 3p6 6h           3p6  6h
   21    3sciii 3p6 7h           3p6  7h
   21    3sciii 3p6 8h           3p6  8h
   21    3sciii 3p6 9h           3p6  9h
   21    3sciii 3p6 8k           3p6  8k
   21    3sciii 3p6 9k           3p6  9k
   21    3sciii 3p5 3d2          3p5  3d2
   21    3sciii 3p5 3d4s         3p5  3d   4s
   21    3sciii 3p5 4s2          3p5  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF210201.DAT;*
$DELETE POOLG:HF210202.DAT;*
$DELETE POOLG:HF210204.DAT;*
$DELETE POOLG:HF210231.DAT;*
$DELETE POOLG:HF210232.DAT;*
