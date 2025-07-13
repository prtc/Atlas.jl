$set def 2504
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf250407.dat for007
$assign poolg:hf250401.dat for001
$assign poolg:hf250402.dat for002
$assign poolg:hf250404.dat for004
$assign hf2504X.pun for011
$assign hf2504X.rrr for012
$assign hf2504X.dat for013
$assign hf2504Xe.dat for014
$assign poolg:hf250431.dat for031
$assign poolg:hf250432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   25    5mn v  d3               3d3
   25    5mn v  d2 4d            3d2  4d
   25    5mn v  d2 5d            3d2  5d
   25    5mn v  d2 6d            3d2  6d
   25    5mn v  d2 7d            3d2  7d
   25    5mn v  d2 8d            3d2  8d
   25    5mn v  d2 9d            3d2  9d
   25    5mn v  d2 10d           3d2 10d
   25    5mn v  d1 4s4d          3d1  4s   4d
   25    5mn v  d1 4s5d          3d1  4s   5d
   25    5mn v  d1 4s6d          3d1  4s   6d
   25    5mn v  d1 4s7d          3d1  4s   7d
   25    5mn v  d1 4s8d          3d1  4s   8d
   25    5mn v  d1 4s9d          3d1  4s   9d
   25    5mn v  d1 4s10d         3d1  4s  10d
   25    5mn v  4s2 4d           4s2  4d
   25    5mn v  4s2 5d           4s2  5d
   25    5mn v  4s2 6d           4s2  6d
   25    5mn v  4s2 7d           4s2  7d
   25    5mn v  4s2 8d           4s2  8d
   25    5mn v  4s2 9d           4s2  9d
   25    5mn v  4s2 10d          4s2 10d
   25    5mn v  d2 4s            3d2  4s
   25    5mn v  d2 5s            3d2  5s
   25    5mn v  d2 6s            3d2  6s
   25    5mn v  d2 7s            3d2  7s
   25    5mn v  d2 8s            3d2  8s
   25    5mn v  d2 9s            3d2  9s
   25    5mn v  d2 10s           3d2 10s
   25    5mn v  d1 4s2           3d1  4s2
   25    5mn v  d1 4s5s          3d1  4s   5s
   25    5mn v  d1 4s6s          3d1  4s   6s
   25    5mn v  d1 4s7s          3d1  4s   7s
   25    5mn v  d1 4s8s          3d1  4s   8s
   25    5mn v  d1 4s9s          3d1  4s   9s
   25    5mn v  d1 4s10s         3d1  4s  10s
   25    5mn v  4s2 5s           4s2  5s
   25    5mn v  4s2 6s           4s2  6s
   25    5mn v  4s2 7s           4s2  7s
   25    5mn v  4s2 8s           4s2  8s
   25    5mn v  4s2 9s           4s2  9s
   25    5mn v  4s2 10s          4s2 10s
   25    5mn v  d2 5g            3d2  5g
   25    5mn v  d2 6g            3d2  6g
   25    5mn v  d2 7g            3d2  7g
   25    5mn v  d2 8g            3d2  8g
   25    5mn v  d2 9g            3d2  9g
   25    5mn v  d2 10g           3d2 10g
   25    5mn v  d1 4s5g          3d1  4s   5g
   25    5mn v  d1 4s6g          3d1  4s   6g
   25    5mn v  d1 4s7g          3d1  4s   7g
   25    5mn v  d1 4s8g          3d1  4s   8g
   25    5mn v  d1 4s9g          3d1  4s   9g
   25    5mn v  d1 4s10g         3d1  4s  10g
   25    5mn v  d2 7i            3d2  7i
   25    5mn v  d2 8i            3d2  8i
   25    5mn v  d2 9i            3d2  9i
   25    5mn v  d1 4s7i          3d1  4s   7i
   25    5mn v  d1 4s8i          3d1  4s   8i
   25    5mn v  d1 4s9i          3d1  4s   9i
   25    5mn v  d1 4p2           3d1  4p2
   25    5mn v  d2 4p            3d2  4p
   25    5mn v  d2 5p            3d2  5p
   25    5mn v  d2 6p            3d2  6p
   25    5mn v  d2 7p            3d2  7p
   25    5mn v  d2 8p            3d2  8p
   25    5mn v  d2 9p            3d2  9p
   25    5mn v  d2 10p           3d2 10p
   25    5mn v  d2 11p           3d2 11p
   25    5mn v  d2 12p           3d2 12p
   25    5mn v  d1 4s4p          3d1  4s   4p
   25    5mn v  d1 4s5p          3d1  4s   5p
   25    5mn v  d1 4s6p          3d1  4s   6p
   25    5mn v  d1 4s7p          3d1  4s   7p
   25    5mn v  d1 4s8p          3d1  4s   8p
   25    5mn v  d1 4s9p          3d1  4s   9p
   25    5mn v  d1 4s10p         3d1  4s  10p
   25    5mn v  d1 4s11p         3d1  4s  11p
   25    5mn v  d1 4s12p         3d1  4s  12p
   25    5mn v  4s2 4p           4s2  4p
   25    5mn v  4s2 5p           4s2  5p
   25    5mn v  4s2 6p           4s2  6p
   25    5mn v  4s2 7p           4s2  7p
   25    5mn v  4s2 8p           4s2  8p
   25    5mn v  4s2 9p           4s2  9p
   25    5mn v  4s2 10p          4s2 10p
   25    5mn v  4s2 11p          4s2 11p
   25    5mn v  d2 4f            3d2  4f
   25    5mn v  d2 5f            3d2  5f
   25    5mn v  d2 6f            3d2  6f
   25    5mn v  d2 7f            3d2  7f
   25    5mn v  d2 8f            3d2  8f
   25    5mn v  d2 9f            3d2  9f
   25    5mn v  d2 10f           3d2 10f
   25    5mn v  d2 11f           3d2 11f
   25    5mn v  d2 12f           3d2 12f
   25    5mn v  d1 4s4f          3d1  4s   4f
   25    5mn v  d1 4s5f          3d1  4s   5f
   25    5mn v  d1 4s6f          3d1  4s   6f
   25    5mn v  d1 4s7f          3d1  4s   7f
   25    5mn v  d1 4s8f          3d1  4s   8f
   25    5mn v  d1 4s9f          3d1  4s   9f
   25    5mn v  d1 4s10f         3d1  4s  10f
   25    5mn v  d1 4s11f         3d1  4s  11f
   25    5mn v  4s2 4f           4s2  4f
   25    5mn v  4s2 5f           4s2  5f
   25    5mn v  4s2 6f           4s2  6f
   25    5mn v  4s2 7f           4s2  7f
   25    5mn v  4s2 8f           4s2  8f
   25    5mn v  4s2 9f           4s2  9f
   25    5mn v  d2 6h            3d2  6h
   25    5mn v  d2 7h            3d2  7h
   25    5mn v  d2 8h            3d2  8h
   25    5mn v  d2 9h            3d2  9h
   25    5mn v  d1 4s6h          3d1  4s   6h
   25    5mn v  d1 4s7h          3d1  4s   7h
   25    5mn v  d1 4s8h          3d1  4s   8h
   25    5mn v  d1 4s9h          3d1  4s   9h
   25    5mn v  d2 8k            3d2  8k
   25    5mn v  d2 9k            3d2  9k
   25    5mn v  d1 4s8k          3d1  4s   8k
   25    5mn v  d1 4s9k          3d1  4s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF250401.DAT;*
$DELETE POOLG:HF250402.DAT;*
$DELETE POOLG:HF250404.DAT;*
$DELETE POOLG:HF250431.DAT;*
$DELETE POOLG:HF250432.DAT;*
