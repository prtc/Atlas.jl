$set def ku6e:[kurucz.4003]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf400307.dat for007
$assign pool:hf400301.dat for001
$assign pool:hf400302.dat for002
$assign pool:hf400304.dat for004
$assign hf4003x.pun for011
$assign hf4003x.rrr for012
$assign hf4003x.dat for013
$assign hf4003xe.dat for014
$assign pool:hf400331.dat for031
$assign pool:hf400332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   40    4zr iv 4p6 4d           4p6  4d
   40    4zr iv 4p6 5d           4p6  5d
   40    4zr iv 4p6 6d           4p6  6d
   40    4zr iv 4p6 7d           4p6  7d
   40    4zr iv 4p6 8d           4p6  8d
   40    4zr iv 4p6 9d           4p6  9d
   40    4zr iv 4p6 10d          4p6 10d
   40    4zr iv 4p6 11d          4p6 11d
   40    4zr iv 4p6 12d          4p6 12d
   40    4zr iv 4p6 13d          4p6 13d
   40    4zr iv 4p6 14d          4p6 14d
   40    4zr iv 4p6 5s           4p6  5s
   40    4zr iv 4p6 6s           4p6  6s
   40    4zr iv 4p6 7s           4p6  7s
   40    4zr iv 4p6 8s           4p6  8s
   40    4zr iv 4p6 9s           4p6  9s
   40    4zr iv 4p6 10s          4p6 10s
   40    4zr iv 4p6 11s          4p6 11s
   40    4zr iv 4p6 12s          4p6 12s
   40    4zr iv 4p6 13s          4p6 13s
   40    4zr iv 4p6 14s          4p6 14s
   40    4zr iv 4p6 5g           4p6  5g
   40    4zr iv 4p6 6g           4p6  6g
   40    4zr iv 4p6 7g           4p6  7g
   40    4zr iv 4p6 8g           4p6  8g
   40    4zr iv 4p6 9g           4p6  9g
   40    4zr iv 4p6 10g          4p6 10g
   40    4zr iv 4p6 11g          4p6 11g
   40    4zr iv 4p6 12g          4p6 12g
   40    4zr iv 4p6 13g          4p6 13g
   40    4zr iv 4p6 14g          4p6 14g
   40    4zr iv 4p6 7i           4p6  7i
   40    4zr iv 4p6 8i           4p6  8i
   40    4zr iv 4p6 9i           4p6  9i
   40    4zr iv 4p5 4d5p         4p5  4d   5p
   40    4zr iv 4p5 5s5p         4p5  5s   5p
   40    4zr iv 4p6 5p           4p6  5p
   40    4zr iv 4p6 6p           4p6  6p
   40    4zr iv 4p6 7p           4p6  7p
   40    4zr iv 4p6 8p           4p6  8p
   40    4zr iv 4p6 9p           4p6  9p
   40    4zr iv 4p6 10p          4p6 10p
   40    4zr iv 4p6 11p          4p6 11p
   40    4zr iv 4p6 12p          4p6 12p
   40    4zr iv 4p6 13p          4p6 13p
   40    4zr iv 4p6 14p          4p6 14p
   40    4zr iv 4p5 5p2          4p5  5p2
   40    4zr iv 4p6 4f           4p6  4f
   40    4zr iv 4p6 5f           4p6  5f
   40    4zr iv 4p6 6f           4p6  6f
   40    4zr iv 4p6 7f           4p6  7f
   40    4zr iv 4p6 8f           4p6  8f
   40    4zr iv 4p6 9f           4p6  9f
   40    4zr iv 4p6 10f          4p6 10f
   40    4zr iv 4p6 11f          4p6 11f
   40    4zr iv 4p6 12f          4p6 12f
   40    4zr iv 4p6 13f          4p6 13f
   40    4zr iv 4p6 14f          4p6 14f
   40    4zr iv 4p6 6h           4p6  6h
   40    4zr iv 4p6 7h           4p6  7h
   40    4zr iv 4p6 8h           4p6  8h
   40    4zr iv 4p6 9h           4p6  9h
   40    4zr iv 4p6 10h          4p6 10h
   40    4zr iv 4p6 11h          4p6 11h
   40    4zr iv 4p6 12h          4p6 12h
   40    4zr iv 4p6 13h          4p6 13h
   40    4zr iv 4p6 14h          4p6 14h
   40    4zr iv 4p6 8k           4p6  8k
   40    4zr iv 4p6 9k           4p6  9k
   40    4zr iv 4p5 4d2          4p5  4d2
   40    4zr iv 4p5 4d5s         4p5  4d   5s
   40    4zr iv 4p5 5s2          4p5  5s2
   -1
$run cray:rcn2c
$DELETE POOL:HF400301.DAT;*
$DELETE POOL:HF400302.DAT;*
$DELETE POOL:HF400304.DAT;*
$DELETE POOL:HF400331.DAT;*
$DELETE POOL:HF400332.DAT;*
