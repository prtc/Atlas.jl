$set def 2604
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf260407.dat for007
$assign poolg:hf260401.dat for001
$assign poolg:hf260402.dat for002
$assign poolg:hf260404.dat for004
$assign hf2604x.pun for011
$assign hf2604x.rrr for012
$assign hf2604x.dat for013
$assign hf2604xE.dat for014
$assign poolg:hf260431.dat for031
$assign poolg:hf260432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   26    5fe v  d4               3p6  3d4
   26    5fe v  d3 4d            3p6  3d3  4d
   26    5fe v  d3 5d            3p6  3d3  5d
   26    5fe v  d3 6d            3p6  3d3  6d
   26    5fe v  d3 7d            3p6  3d3  7d
   26    5fe v  d3 8d            3p6  3d3  8d
   26    5fe v  d3 9d            3p6  3d3  9d
   26    5fe v  d3 10d           3p6  3d3 10d
   26    5fe v  d2 4s4d          3p6  3d2  4s   4d
   26    5fe v  d2 4s5d          3p6  3d2  4s   5d
   26    5fe v  d2 4s6d          3p6  3d2  4s   6d
   26    5fe v  d2 4s7d          3p6  3d2  4s   7d
   26    5fe v  d2 4s8d          3p6  3d2  4s   8d
   26    5fe v  d2 4s9d          3p6  3d2  4s   9d
   26    5fe v  d2 4s10d         3p6  3d2  4s  10d
   26    5fe v  d1 4s2 4d        3p6  3d1  4s2  4d
   26    5fe v  d1 4s2 5d        3p6  3d1  4s2  5d
   26    5fe v  d1 4s2 6d        3p6  3d1  4s2  6d
   26    5fe v  d1 4s2 7d        3p6  3d1  4s2  7d
   26    5fe v  d1 4s2 8d        3p6  3d1  4s2  8d
   26    5fe v  d1 4s2 9d        3p6  3d1  4s2  9d
   26    5fe v  d1 4s2 10d       3p6  3d1  4s2 10d
   26    5fe v  d3 4s            3p6  3d3  4s
   26    5fe v  d3 5s            3p6  3d3  5s
   26    5fe v  d3 6s            3p6  3d3  6s
   26    5fe v  d3 7s            3p6  3d3  7s
   26    5fe v  d3 8s            3p6  3d3  8s
   26    5fe v  d3 9s            3p6  3d3  9s
   26    5fe v  d3 10s           3p6  3d3 10s
   26    5fe v  d2 4s2           3p6  3d2  4s2
   26    5fe v  d2 4s5s          3p6  3d2  4s   5s
   26    5fe v  d2 4s6s          3p6  3d2  4s   6s
   26    5fe v  d2 4s7s          3p6  3d2  4s   7s
   26    5fe v  d2 4s8s          3p6  3d2  4s   8s
   26    5fe v  d2 4s9s          3p6  3d2  4s   9s
   26    5fe v  d2 4s10s         3p6  3d2  4s  10s
   26    5fe v  d1 4s2 5s        3p6  3d1  4s2  5s
   26    5fe v  d1 4s2 6s        3p6  3d1  4s2  6s
   26    5fe v  d1 4s2 7s        3p6  3d1  4s2  7s
   26    5fe v  d1 4s2 8s        3p6  3d1  4s2  8s
   26    5fe v  d1 4s2 9s        3p6  3d1  4s2  9s
   26    5fe v  d1 4s2 10s       3p6  3d1  4s2 10s
   26    5fe v  d3 5g            3p6  3d3  5g
   26    5fe v  d3 6g            3p6  3d3  6g
   26    5fe v  d3 7g            3p6  3d3  7g
   26    5fe v  d3 8g            3p6  3d3  8g
   26    5fe v  d3 9g            3p6  3d3  9g
   26    5fe v  d3 10g           3p6  3d3 10g
   26    5fe v  d2 4s5g          3p6  3d2  4s   5g
   26    5fe v  d2 4s6g          3p6  3d2  4s   6g
   26    5fe v  d2 4s7g          3p6  3d2  4s   7g
   26    5fe v  d2 4s8g          3p6  3d2  4s   8g
   26    5fe v  d2 4s9g          3p6  3d2  4s   9g
   26    5fe v  d2 4s10g         3p6  3d2  4s  10g
   26    5fe v  d3 7i            3p6  3d3  7i
   26    5fe v  d3 8i            3p6  3d3  8i
   26    5fe v  d3 9i            3p6  3d3  9i
   26    5fe v  d2 4s7i          3p6  3d2  4s   7i
   26    5fe v  d2 4s8i          3p6  3d2  4s   8i
   26    5fe v  d2 4s9i          3p6  3d2  4s   9i
   26    5fe v  d2 4p2           3p6  3d2  4p2
   26    5fe v  d3 4p            3p6  3d3  4p
   26    5fe v  d3 5p            3p6  3d3  5p
   26    5fe v  d3 6p            3p6  3d3  6p
   26    5fe v  d3 7p            3p6  3d3  7p
   26    5fe v  d3 8p            3p6  3d3  8p
   26    5fe v  d3 9p            3p6  3d3  9p
   26    5fe v  d3 10p           3p6  3d3 10p
   26    5fe v  d3 11p           3p6  3d3 11p
   26    5fe v  d2 4s4p          3p6  3d2  4s   4p
   26    5fe v  d2 4s5p          3p6  3d2  4s   5p
   26    5fe v  d2 4s6p          3p6  3d2  4s   6p
   26    5fe v  d2 4s7p          3p6  3d2  4s   7p
   26    5fe v  d2 4s8p          3p6  3d2  4s   8p
   26    5fe v  d2 4s9p          3p6  3d2  4s   9p
   26    5fe v  d2 4s10p         3p6  3d2  4s  10p
   26    5fe v  d2 4s11p         3p6  3d2  4s  11p
   26    5fe v  d1 4s2 4p        3p6  3d1  4s2  4p
   26    5fe v  d1 4s2 5p        3p6  3d1  4s2  5p
   26    5fe v  d1 4s2 6p        3p6  3d1  4s2  6p
   26    5fe v  d1 4s2 7p        3p6  3d1  4s2  7p
   26    5fe v  d1 4s2 8p        3p6  3d1  4s2  8p
   26    5fe v  d1 4s2 9p        3p6  3d1  4s2  9p
   26    5fe v  d1 4s2 10p       3p6  3d1  4s2 10p
   26    5fe v  d1 4s2 11p       3p6  3d1  4s2 11p
   26    5fe v  d3 4f            3p6  3d3  4f
   26    5fe v  d3 5f            3p6  3d3  5f
   26    5fe v  d3 6f            3p6  3d3  6f
   26    5fe v  d3 7f            3p6  3d3  7f
   26    5fe v  d3 8f            3p6  3d3  8f
   26    5fe v  d3 9f            3p6  3d3  9f
   26    5fe v  d3 10f           3p6  3d3 10f
   26    5fe v  d3 11f           3p6  3d3 11f
   26    5fe v  d2 4s4f          3p6  3d2  4s   4f
   26    5fe v  d2 4s5f          3p6  3d2  4s   5f
   26    5fe v  d2 4s6f          3p6  3d2  4s   6f
   26    5fe v  d2 4s7f          3p6  3d2  4s   7f
   26    5fe v  d2 4s8f          3p6  3d2  4s   8f
   26    5fe v  d2 4s9f          3p6  3d2  4s   9f
   26    5fe v  d2 4s10f         3p6  3d2  4s  10f
   26    5fe v  d2 4s11f         3p6  3d2  4s  11f
   26    5fe v  d1 4s2 4f        3p6  3d1  4s2  4f
   26    5fe v  d1 4s2 5f        3p6  3d1  4s2  5f
   26    5fe v  d1 4s2 6f        3p6  3d1  4s2  6f
   26    5fe v  d1 4s2 7f        3p6  3d1  4s2  7f
   26    5fe v  d1 4s2 8f        3p6  3d1  4s2  8f
   26    5fe v  d1 4s2 9f        3p6  3d1  4s2  9f
   26    5fe v  d1 4s2 10f       3p6  3d1  4s2 10f
   26    5fe v  d1 4s2 11f       3p6  3d1  4s2 11f
   26    5fe v  d3 6h            3p6  3d3  6h
   26    5fe v  d3 7h            3p6  3d3  7h
   26    5fe v  d3 8h            3p6  3d3  8h
   26    5fe v  d3 9h            3p6  3d3  9h
   26    5fe v  d2 4s6h          3p6  3d2  4s   6h
   26    5fe v  d2 4s7h          3p6  3d2  4s   7h
   26    5fe v  d2 4s8h          3p6  3d2  4s   8h
   26    5fe v  d2 4s9h          3p6  3d2  4s   9h
   26    5fe v  d3 8k            3p6  3d3  8k
   26    5fe v  d3 9k            3p6  3d3  9k
   26    5fe v  d2 4s8k          3p6  3d2  4s   8k
   26    5fe v  d2 4s9k          3p6  3d2  4s   9k
   26    5fe v  p5 3d5           3p5  3d5 
   -1
$run cray:rcn2c
$DELETE POOLG:HF260401.DAT;*
$DELETE POOLG:HF260402.DAT;*
$DELETE POOLG:HF260404.DAT;*
$DELETE POOLG:HF260431.DAT;*
$DELETE POOLG:HF260432.DAT;*
