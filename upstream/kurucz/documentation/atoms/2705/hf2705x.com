$set def 2705
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf270507.dat for007
$assign poolg:hf270501.dat for001
$assign poolg:hf270502.dat for002
$assign poolg:hf270504.dat for004
$assign hf2705x.pun for011
$assign hf2705x.rrr for012
$assign hf2705x.dat for013
$assign hf2705xE.dat for014
$assign poolg:hf270531.dat for031
$assign poolg:hf270532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   27    6co vi d4               3p6  3d4
   27    6co vi d3 4d            3p6  3d3  4d
   27    6co vi d3 5d            3p6  3d3  5d
   27    6co vi d3 6d            3p6  3d3  6d
   27    6co vi d3 7d            3p6  3d3  7d
   27    6co vi d3 8d            3p6  3d3  8d
   27    6co vi d3 9d            3p6  3d3  9d
   27    6co vi d3 10d           3p6  3d3 10d
   27    6co vi d2 4s4d          3p6  3d2  4s   4d
   27    6co vi d2 4s5d          3p6  3d2  4s   5d
   27    6co vi d2 4s6d          3p6  3d2  4s   6d
   27    6co vi d2 4s7d          3p6  3d2  4s   7d
   27    6co vi d2 4s8d          3p6  3d2  4s   8d
   27    6co vi d2 4s9d          3p6  3d2  4s   9d
   27    6co vi d2 4s10d         3p6  3d2  4s  10d
   27    6co vi d1 4s2 4d        3p6  3d1  4s2  4d
   27    6co vi d1 4s2 5d        3p6  3d1  4s2  5d
   27    6co vi d1 4s2 6d        3p6  3d1  4s2  6d
   27    6co vi d1 4s2 7d        3p6  3d1  4s2  7d
   27    6co vi d1 4s2 8d        3p6  3d1  4s2  8d
   27    6co vi d1 4s2 9d        3p6  3d1  4s2  9d
   27    6co vi d1 4s2 10d       3p6  3d1  4s2 10d
   27    6co vi d3 4s            3p6  3d3  4s
   27    6co vi d3 5s            3p6  3d3  5s
   27    6co vi d3 6s            3p6  3d3  6s
   27    6co vi d3 7s            3p6  3d3  7s
   27    6co vi d3 8s            3p6  3d3  8s
   27    6co vi d3 9s            3p6  3d3  9s
   27    6co vi d3 10s           3p6  3d3 10s
   27    6co vi d2 4s2           3p6  3d2  4s2
   27    6co vi d2 4s5s          3p6  3d2  4s   5s
   27    6co vi d2 4s6s          3p6  3d2  4s   6s
   27    6co vi d2 4s7s          3p6  3d2  4s   7s
   27    6co vi d2 4s8s          3p6  3d2  4s   8s
   27    6co vi d2 4s9s          3p6  3d2  4s   9s
   27    6co vi d2 4s10s         3p6  3d2  4s  10s
   27    6co vi d1 4s2 5s        3p6  3d1  4s2  5s
   27    6co vi d1 4s2 6s        3p6  3d1  4s2  6s
   27    6co vi d1 4s2 7s        3p6  3d1  4s2  7s
   27    6co vi d1 4s2 8s        3p6  3d1  4s2  8s
   27    6co vi d1 4s2 9s        3p6  3d1  4s2  9s
   27    6co vi d1 4s2 10s       3p6  3d1  4s2 10s
   27    6co vi d3 5g            3p6  3d3  5g
   27    6co vi d3 6g            3p6  3d3  6g
   27    6co vi d3 7g            3p6  3d3  7g
   27    6co vi d3 8g            3p6  3d3  8g
   27    6co vi d3 9g            3p6  3d3  9g
   27    6co vi d3 10g           3p6  3d3 10g
   27    6co vi d2 4s5g          3p6  3d2  4s   5g
   27    6co vi d2 4s6g          3p6  3d2  4s   6g
   27    6co vi d2 4s7g          3p6  3d2  4s   7g
   27    6co vi d2 4s8g          3p6  3d2  4s   8g
   27    6co vi d2 4s9g          3p6  3d2  4s   9g
   27    6co vi d2 4s10g         3p6  3d2  4s  10g
   27    6co vi d3 7i            3p6  3d3  7i
   27    6co vi d3 8i            3p6  3d3  8i
   27    6co vi d3 9i            3p6  3d3  9i
   27    6co vi d2 4s7i          3p6  3d2  4s   7i
   27    6co vi d2 4s8i          3p6  3d2  4s   8i
   27    6co vi d2 4s9i          3p6  3d2  4s   9i
   27    6co vi d2 4p2           3p6  3d2  4p2
   27    6co vi d3 4p            3p6  3d3  4p
   27    6co vi d3 5p            3p6  3d3  5p
   27    6co vi d3 6p            3p6  3d3  6p
   27    6co vi d3 7p            3p6  3d3  7p
   27    6co vi d3 8p            3p6  3d3  8p
   27    6co vi d3 9p            3p6  3d3  9p
   27    6co vi d3 10p           3p6  3d3 10p
   27    6co vi d3 11p           3p6  3d3 11p
   27    6co vi d2 4s4p          3p6  3d2  4s   4p
   27    6co vi d2 4s5p          3p6  3d2  4s   5p
   27    6co vi d2 4s6p          3p6  3d2  4s   6p
   27    6co vi d2 4s7p          3p6  3d2  4s   7p
   27    6co vi d2 4s8p          3p6  3d2  4s   8p
   27    6co vi d2 4s9p          3p6  3d2  4s   9p
   27    6co vi d2 4s10p         3p6  3d2  4s  10p
   27    6co vi d2 4s11p         3p6  3d2  4s  11p
   27    6co vi d1 4s2 4p        3p6  3d1  4s2  4p
   27    6co vi d1 4s2 5p        3p6  3d1  4s2  5p
   27    6co vi d1 4s2 6p        3p6  3d1  4s2  6p
   27    6co vi d1 4s2 7p        3p6  3d1  4s2  7p
   27    6co vi d1 4s2 8p        3p6  3d1  4s2  8p
   27    6co vi d1 4s2 9p        3p6  3d1  4s2  9p
   27    6co vi d1 4s2 10p       3p6  3d1  4s2 10p
   27    6co vi d1 4s2 11p       3p6  3d1  4s2 11p
   27    6co vi d3 4f            3p6  3d3  4f
   27    6co vi d3 5f            3p6  3d3  5f
   27    6co vi d3 6f            3p6  3d3  6f
   27    6co vi d3 7f            3p6  3d3  7f
   27    6co vi d3 8f            3p6  3d3  8f
   27    6co vi d3 9f            3p6  3d3  9f
   27    6co vi d3 10f           3p6  3d3 10f
   27    6co vi d3 11f           3p6  3d3 11f
   27    6co vi d2 4s4f          3p6  3d2  4s   4f
   27    6co vi d2 4s5f          3p6  3d2  4s   5f
   27    6co vi d2 4s6f          3p6  3d2  4s   6f
   27    6co vi d2 4s7f          3p6  3d2  4s   7f
   27    6co vi d2 4s8f          3p6  3d2  4s   8f
   27    6co vi d2 4s9f          3p6  3d2  4s   9f
   27    6co vi d2 4s10f         3p6  3d2  4s  10f
   27    6co vi d2 4s11f         3p6  3d2  4s  11f
   27    6co vi d1 4s2 4f        3p6  3d1  4s2  4f
   27    6co vi d1 4s2 5f        3p6  3d1  4s2  5f
   27    6co vi d1 4s2 6f        3p6  3d1  4s2  6f
   27    6co vi d1 4s2 7f        3p6  3d1  4s2  7f
   27    6co vi d1 4s2 8f        3p6  3d1  4s2  8f
   27    6co vi d1 4s2 9f        3p6  3d1  4s2  9f
   27    6co vi d1 4s2 10f       3p6  3d1  4s2 10f
   27    6co vi d1 4s2 11f       3p6  3d1  4s2 11f
   27    6co vi d3 6h            3p6  3d3  6h
   27    6co vi d3 7h            3p6  3d3  7h
   27    6co vi d3 8h            3p6  3d3  8h
   27    6co vi d3 9h            3p6  3d3  9h
   27    6co vi d2 4s6h          3p6  3d2  4s   6h
   27    6co vi d2 4s7h          3p6  3d2  4s   7h
   27    6co vi d2 4s8h          3p6  3d2  4s   8h
   27    6co vi d2 4s9h          3p6  3d2  4s   9h
   27    6co vi d3 8k            3p6  3d3  8k
   27    6co vi d3 9k            3p6  3d3  9k
   27    6co vi d2 4s8k          3p6  3d2  4s   8k
   27    6co vi d2 4s9k          3p6  3d2  4s   9k
   27    6co vi p5 3d5           3p5  3d5 
   -1
$run cray:rcn2c
$DELETE POOLG:HF270501.DAT;*
$DELETE POOLG:HF270502.DAT;*
$DELETE POOLG:HF270504.DAT;*
$DELETE POOLG:HF270531.DAT;*
$DELETE POOLG:HF270532.DAT;*
