$set def 1502
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf150207.dat for007
$assign poolg:hf150201.dat for001
$assign poolg:hf150202.dat for002
$assign poolg:hf150204.dat for004
$assign hf1502x.pun for011
$assign hf1502x.RRR for012
$assign hf1502x.dat for013
$assign hf1502xe.dat for014
$assign poolg:hf150231.dat for031
$assign poolg:hf150232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   15    3p iii  s2 3p           3s2  3p
   15    3p iii  s2 4p           3s2  3p0  4p
   15    3p iii  s2 5p           3s2  3p0  5p
   15    3p iii  s2 6p           3s2  3p0  6p
   15    3p iii  s2 7p           3s2  3p0  7p
   15    3p iii  s2 8p           3s2  3p0  8p
   15    3p iii  s2 9p           3s2  3p0  9p
   15    3p iii  s2 10p          3s2  3p0 10p
   15    3p iii  s2 11p          3s2  3p0 11p
   15    3p iii  s2 12p          3s2  3p0 12p
   15    3p iii  p3              3s0  3p3  
   15    3p iii  p2 4p           3s0  3p2  4p  
   15    3p iii  p2 5p           3s0  3p2  5p  
   15    3p iii  p2 6p           3s0  3p2  6p  
   15    3p iii  p2 7p           3s0  3p2  7p  
   15    3p iii  p2 8p           3s0  3p2  8p  
   15    3p iii  p2 9p           3s0  3p2  9p  
   15    3p iii  p2 10p          3s0  3p2 10p  
   15    3p iii  p2 11p          3s0  3p2 11p  
   15    3p iii  p2 12p          3s0  3p2 12p  
   15    3p iii  s2 4f           3s2  3p0  4f
   15    3p iii  s2 5f           3s2  3p0  5f
   15    3p iii  s2 6f           3s2  3p0  6f
   15    3p iii  s2 7f           3s2  3p0  7f
   15    3p iii  s2 8f           3s2  3p0  8f
   15    3p iii  s2 9f           3s2  3p0  9f
   15    3p iii  s2 10f          3s2  3p0 10f
   15    3p iii  s2 11f          3s2  3p0 11f
   15    3p iii  s2 12f          3s2  3p0 12f
   15    3p iii  p2 4f           3s0  3p2  4f
   15    3p iii  p2 5f           3s0  3p2  5f
   15    3p iii  p2 6f           3s0  3p2  6f
   15    3p iii  p2 7f           3s0  3p2  7f
   15    3p iii  p2 8f           3s0  3p2  8f
   15    3p iii  p2 9f           3s0  3p2  9f
   15    3p iii  p2 10f          3s0  3p2 10f
   15    3p iii  p2 11f          3s0  3p2 11f
   15    3p iii  p2 12f          3s0  3p2 12f
   15    3p iii  s2 6h           3s2  3p0  6h
   15    3p iii  s2 7h           3s2  3p0  7h
   15    3p iii  s2 8h           3s2  3p0  8h
   15    3p iii  s2 9h           3s2  3p0  9h
   15    3p iii  s2 10h          3s2  3p0 10h
   15    3p iii  s2 8k           3s2  3p0  8k
   15    3p iii  s2 9k           3s2  3p0  9k
   15    3p iii  s2 10k          3s2  3p0 10k
   15    3p iii  sp 4s           3s   3p   4s
   15    3p iii  sp 5s           3s   3p   5s
   15    3p iii  sp 6s           3s   3p   6s
   15    3p iii  sp 7s           3s   3p   7s
   15    3p iii  sp 8s           3s   3p   8s
   15    3p iii  sp 9s           3s   3p   9s
   15    3p iii  sp 10s          3s   3p  10s
   15    3p iii  sp 3d           3s   3p   3d
   15    3p iii  sp 4d           3s   3p   4d
   15    3p iii  sp 5d           3s   3p   5d
   15    3p iii  sp 6d           3s   3p   6d
   15    3p iii  sp 7d           3s   3p   7d
   15    3p iii  sp 8d           3s   3p   8d
   15    3p iii  sp 9d           3s   3p   9d
   15    3p iii  sp 10d          3s   3p  10d
   15    3p iii  s2 4s           3s2  3p0  4s
   15    3p iii  s2 5s           3s2  3p0  5s
   15    3p iii  s2 6s           3s2  3p0  6s
   15    3p iii  s2 7s           3s2  3p0  7s
   15    3p iii  s2 8s           3s2  3p0  8s
   15    3p iii  s2 9s           3s2  3p0  9s
   15    3p iii  s2 10s          3s2  3p0 10s
   15    3p iii  s2 11s          3s2  3p0 11s
   15    3p iii  p2 4s           3s0  3p2  4s  
   15    3p iii  p2 5s           3s0  3p2  5s  
   15    3p iii  p2 6s           3s0  3p2  6s  
   15    3p iii  p2 7s           3s0  3p2  7s  
   15    3p iii  p2 8s           3s0  3p2  8s  
   15    3p iii  p2 9s           3s0  3p2  9s  
   15    3p iii  p2 10s          3s0  3p2 10s  
   15    3p iii  p2 11s          3s0  3p2 11s  
   15    3p iii  s2 3d           3s2  3p0  3d
   15    3p iii  s2 4d           3s2  3p0  4d
   15    3p iii  s2 5d           3s2  3p0  5d
   15    3p iii  s2 6d           3s2  3p0  6d
   15    3p iii  s2 7d           3s2  3p0  7d
   15    3p iii  s2 8d           3s2  3p0  8d
   15    3p iii  s2 9d           3s2  3p0  9d
   15    3p iii  s2 10d          3s2  3p0 10d
   15    3p iii  s2 11d          3s2  3p0 11d
   15    3p iii  p2 3d           3s0  3p2  3d
   15    3p iii  p2 4d           3s0  3p2  4d
   15    3p iii  p2 5d           3s0  3p2  5d
   15    3p iii  p2 6d           3s0  3p2  6d
   15    3p iii  p2 7d           3s0  3p2  7d
   15    3p iii  p2 8d           3s0  3p2  8d
   15    3p iii  p2 9d           3s0  3p2  9d
   15    3p iii  p2 10d          3s0  3p2 10d
   15    3p iii  p2 11d          3s0  3p2 11d
   15    3p iii  s2 5g           3s2  3p0  5g
   15    3p iii  s2 6g           3s2  3p0  6g
   15    3p iii  s2 7g           3s2  3p0  7g
   15    3p iii  s2 8g           3s2  3p0  8g
   15    3p iii  s2 9g           3s2  3p0  9g
   15    3p iii  s2 10g          3s2  3p0 10g
   15    3p iii  s2 11g          3s2  3p0 11g
   15    3p iii  s2 7i           3s2  3p0  7i
   15    3p iii  s2 8i           3s2  3p0  8i
   15    3p iii  s2 9i           3s2  3p0  9i
   15    3p iii  s2 10i          3s2  3p0 10i
   15    3p iii  s2 11i          3s2  3p0 11i
   15    3p iii  sp2             3s   3p2
   15    3p iii  sp 4p           3s   3p   4p
   15    3p iii  sp 5p           3s   3p   5p
   15    3p iii  sp 6p           3s   3p   6p
   15    3p iii  sp 7p           3s   3p   7p
   15    3p iii  sp 8p           3s   3p   8p
   15    3p iii  sp 9p           3s   3p   9p
   15    3p iii  sp 10p          3s   3p  10p
   15    3p iii  sp 4f           3s   3p   4f
   15    3p iii  sp 5f           3s   3p   5f
   15    3p iii  sp 6f           3s   3p   6f
   15    3p iii  sp 7f           3s   3p   7f
   15    3p iii  sp 8f           3s   3p   8f
   15    3p iii  sp 9f           3s   3p   9f
   15    3p iii  sp 10f          3s   3p  10f
   -1
$run cray:rcn2c
$DELETE POOLG:HF150201.DAT;*
$DELETE POOLG:HF150202.DAT;*
$DELETE POOLG:HF150204.DAT;*
$DELETE POOLG:HF150231.DAT;*
$DELETE POOLG:HF150232.DAT;*
