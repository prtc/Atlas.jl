$set2200
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf220007.dat for007
$assign poolg:hf220001.dat for001
$assign poolg:hf220002.dat for002
$assign poolg:hf220004.dat for004
$assign hf2200y.pun for011
$assign hf2200y.rrr for012
$assign hf2200y.dat for013
$assign hf2200ye.dat for014
$assign poolg:hf220031.dat for031
$assign poolg:hf220032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   22    1ti i  d2 4s2           3d2  4s2
   22    1ti i  d2 4s5s          3d2  4s   5s
   22    1ti i  d2 4s6s          3d2  4s   6s
   22    1ti i  d2 4s7s          3d2  4s   7s
   22    1ti i  d2 4s8s          3d2  4s   8s
   22    1ti i  d2 4s9s          3d2  4s   9s
   22    1ti i  d2 4s10s         3d2  4s  10s
   22    1ti i  d3 4s            3d3  4s
   22    1ti i  d3 5s            3d3  5s
   22    1ti i  d3 6s            3d3  6s
   22    1ti i  d3 7s            3d3  7s
   22    1ti i  d3 8s            3d3  8s
   22    1ti i  d3 9s            3d3  9s
   22    1ti i  d3 10s           3d3 10s
   22    1ti i  ds2 5s           3d1  4s2  5s
   22    1ti i  ds2 6s           3d1  4s2  6s
   22    1ti i  ds2 7s           3d1  4s2  7s
   22    1ti i  ds2 8s           3d1  4s2  8s
   22    1ti i  ds2 9s           3d1  4s2  9s
   22    1ti i  d4               3d4
   22    1ti i  d3 4d            3d3  4d
   22    1ti i  d3 5d            3d3  5d
   22    1ti i  d3 6d            3d3  6d
   22    1ti i  d3 7d            3d3  7d
   22    1ti i  d3 8d            3d3  8d
   22    1ti i  d3 9d            3d3  9d
   22    1ti i  d3 10d           3d3 10d
   22    1ti i  d2 4s4d          3d2  4s   4d
   22    1ti i  d2 4s5d          3d2  4s   5d
   22    1ti i  d2 4s6d          3d2  4s   6d
   22    1ti i  d2 4s7d          3d2  4s   7d
   22    1ti i  d2 4s8d          3d2  4s   8d
   22    1ti i  d2 4s9d          3d2  4s   9d
   22    1ti i  d2 4s10d         3d2  4s  10d
   22    1ti i  ds2 4d           3d1  4s2  4d
   22    1ti i  ds2 5d           3d1  4s2  5d
   22    1ti i  ds2 6d           3d1  4s2  6d
   22    1ti i  ds2 7d           3d1  4s2  7d
   22    1ti i  ds2 8d           3d1  4s2  8d
   22    1ti i  ds2 9d           3d1  4s2  9d
   22    1ti i  ds2 10d          3d1  4s2 10d
   22    1ti i  d3 5g            3d3  5g
   22    1ti i  d3 6g            3d3  6g
   22    1ti i  d3 7g            3d3  7g
   22    1ti i  d3 8g            3d3  8g
   22    1ti i  d3 9g            3d3  9g
   22    1ti i  d2 4s5g          3d2  4s   5g
   22    1ti i  d2 4s6g          3d2  4s   6g
   22    1ti i  d2 4s7g          3d2  4s   7g
   22    1ti i  d2 4s8g          3d2  4s   8g
   22    1ti i  d2 4s9g          3d2  4s   9g
   22    1ti i  d3 7i            3d3  7i
   22    1ti i  d3 8i            3d3  8i
   22    1ti i  d3 9i            3d3  9i
   22    1ti i  d2 4s7i          3d2  4s   7i
   22    1ti i  d2 4s8i          3d2  4s   8i
   22    1ti i  d2 4s9i          3d2  4s   9i
   22    1ti i  d3 9l            3d3 10l
   22    1ti i  d2 4s9l          3d2  4s  10l
   22    1ti i  d2 4p2           3d2  4p2  
   22    1ti i  dp2 4s           3d   4p2  4s
   22    1ti i  d2 4s4p          3d2  4s   4p
   22    1ti i  d2 4s5p          3d2  4s   5p
   22    1ti i  d2 4s6p          3d2  4s   6p
   22    1ti i  d2 4s7p          3d2  4s   7p
   22    1ti i  d2 4s8p          3d2  4s   8p
   22    1ti i  d2 4s9p          3d2  4s   9p
   22    1ti i  d2 4s10p         3d2  4s  10p
   22    1ti i  d2 4s11p         3d2  4s  11p
   22    1ti i  d3 4p            3d3  4p
   22    1ti i  d3 5p            3d3  5p
   22    1ti i  d3 6p            3d3  6p
   22    1ti i  d3 7p            3d3  7p
   22    1ti i  d3 8p            3d3  8p
   22    1ti i  d3 9p            3d3  9p
   22    1ti i  d3 10p           3d3 10p
   22    1ti i  d3 11p           3d3 11p
   22    1ti i  ds2 4p           3d1  4s2  4p
   22    1ti i  ds2 5p           3d1  4s2  5p
   22    1ti i  ds2 6p           3d1  4s2  6p
   22    1ti i  ds2 7p           3d1  4s2  7p
   22    1ti i  ds2 8p           3d1  4s2  8p
   22    1ti i  ds2 9p           3d1  4s2  9p
   22    1ti i  ds2 10p          3d1  4s2 10p
   22    1ti i  ds2 11p          3d1  4s2 11p
   22    1ti i  d3 4f            3d3  4f
   22    1ti i  d3 5f            3d3  5f
   22    1ti i  d3 6f            3d3  6f
   22    1ti i  d3 7f            3d3  7f
   22    1ti i  d3 8f            3d3  8f
   22    1ti i  d3 9f            3d3  9f
   22    1ti i  d3 10f           3d3 10f
   22    1ti i  d3 11f           3d3 11f
   22    1ti i  d2 4s4f          3d2  4s   4f
   22    1ti i  d2 4s5f          3d2  4s   5f
   22    1ti i  d2 4s6f          3d2  4s   6f
   22    1ti i  d2 4s7f          3d2  4s   7f
   22    1ti i  d2 4s8f          3d2  4s   8f
   22    1ti i  d2 4s9f          3d2  4s   9f
   22    1ti i  d2 4s10f         3d2  4s  10f
   22    1ti i  d2 4s11f         3d2  4s  11f
   22    1ti i  ds2 4f           3d1  4s2  4f
   22    1ti i  ds2 5f           3d1  4s2  5f
   22    1ti i  ds2 6f           3d1  4s2  6f
   22    1ti i  ds2 7f           3d1  4s2  7f
   22    1ti i  ds2 8f           3d1  4s2  8f
   22    1ti i  ds2 9f           3d1  4s2  9f
   22    1ti i  ds2 10f          3d1  4s2 10f
   22    1ti i  ds2 11f          3d1  4s2 11f
   22    1ti i  d3 6h            3d3  6h
   22    1ti i  d3 7h            3d3  7h
   22    1ti i  d3 8h            3d3  8h
   22    1ti i  d3 9h            3d3  9h
   22    1ti i  d2 4s6h          3d2  4s   6h
   22    1ti i  d2 4s7h          3d2  4s   7h
   22    1ti i  d2 4s8h          3d2  4s   8h
   22    1ti i  d2 4s9h          3d2  4s   9h
   22    1ti i  d3 8k            3d3  8k
   22    1ti i  d3 9k            3d3  9k
   22    1ti i  d2 4s8k          3d2  4s   8k
   22    1ti i  d2 4s9k          3d2  4s   9k
   22    1ti i  dp3              3d   4p3
   -1
$run cray:rcn2c
$DELETE POOLG:HF220001.DAT;*
$DELETE POOLG:HF220002.DAT;*
$DELETE POOLG:HF220004.DAT;*
$DELETE POOLG:HF220031.DAT;*
$DELETE POOLG:HF220032.DAT;*
