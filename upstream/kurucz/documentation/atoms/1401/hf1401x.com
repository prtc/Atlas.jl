$set def 1401
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf140107.dat for007
$assign poolg:hf140101.dat for001
$assign poolg:hf140102.dat for002
$assign poolg:hf140104.dat for004
$assign hf1401x.pun for011
$assign hf1401x.RRR for012
$assign hf1401x.dat for013
$assign hf1401xe.dat for014
$assign poolg:hf140131.dat for031
$assign poolg:hf140132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   14    2si ii  s2 3p           3s2  3p
   14    2si ii  s2 4p           3s2  3p0  4p
   14    2si ii  s2 5p           3s2  3p0  5p
   14    2si ii  s2 6p           3s2  3p0  6p
   14    2si ii  s2 7p           3s2  3p0  7p
   14    2si ii  s2 8p           3s2  3p0  8p
   14    2si ii  s2 9p           3s2  3p0  9p
   14    2si ii  s2 10p          3s2  3p0 10p
   14    2si ii  s2 11p          3s2  3p0 11p
   14    2si ii  p3              3s0  3p3  
   14    2si ii  p2 4p           3s0  3p2  4p  
   14    2si ii  p2 5p           3s0  3p2  5p  
   14    2si ii  p2 6p           3s0  3p2  6p  
   14    2si ii  p2 7p           3s0  3p2  7p  
   14    2si ii  p2 8p           3s0  3p2  8p  
   14    2si ii  p2 9p           3s0  3p2  9p  
   14    2si ii  p2 10p          3s0  3p2 10p  
   14    2si ii  p2 11p          3s0  3p2 11p  
   14    2si ii  s2 4f           3s2  3p0  4f
   14    2si ii  s2 5f           3s2  3p0  5f
   14    2si ii  s2 6f           3s2  3p0  6f
   14    2si ii  s2 7f           3s2  3p0  7f
   14    2si ii  s2 8f           3s2  3p0  8f
   14    2si ii  s2 9f           3s2  3p0  9f
   14    2si ii  s2 10f          3s2  3p0 10f
   14    2si ii  s2 11f          3s2  3p0 11f
   14    2si ii  p2 4f           3s0  3p2  4f
   14    2si ii  p2 5f           3s0  3p2  5f
   14    2si ii  p2 6f           3s0  3p2  6f
   14    2si ii  p2 7f           3s0  3p2  7f
   14    2si ii  p2 8f           3s0  3p2  8f
   14    2si ii  p2 9f           3s0  3p2  9f
   14    2si ii  p2 10f          3s0  3p2 10f
   14    2si ii  p2 11f          3s0  3p2 11f
   14    2si ii  s2 6h           3s2  3p0  6h
   14    2si ii  s2 7h           3s2  3p0  7h
   14    2si ii  s2 8h           3s2  3p0  8h
   14    2si ii  s2 9h           3s2  3p0  9h
   14    2si ii  p2 6h           3s0  3p2  6h
   14    2si ii  p2 7h           3s0  3p2  7h
   14    2si ii  p2 8h           3s0  3p2  8h
   14    2si ii  p2 9h           3s0  3p2  9h
   14    2si ii  s2 8k           3s2  3p0  8k
   14    2si ii  s2 9k           3s2  3p0  9k
   14    2si ii  p2 8k           3s0  3p2  8k
   14    2si ii  p2 9k           3s0  3p2  9k
   14    2si ii  sp 4s           3s   3p   4s
   14    2si ii  sp 5s           3s   3p   5s
   14    2si ii  sp 6s           3s   3p   6s
   14    2si ii  sp 7s           3s   3p   7s
   14    2si ii  sp 8s           3s   3p   8s
   14    2si ii  sp 9s           3s   3p   9s
   14    2si ii  sp 10s          3s   3p  10s
   14    2si ii  sp 3d           3s   3p   3d
   14    2si ii  sp 4d           3s   3p   4d
   14    2si ii  sp 5d           3s   3p   5d
   14    2si ii  sp 6d           3s   3p   6d
   14    2si ii  sp 7d           3s   3p   7d
   14    2si ii  sp 8d           3s   3p   8d
   14    2si ii  sp 9d           3s   3p   9d
   14    2si ii  sp 10d          3s   3p  10d
   14    2si ii  s2 4s           3s2  3p0  4s
   14    2si ii  s2 5s           3s2  3p0  5s
   14    2si ii  s2 6s           3s2  3p0  6s
   14    2si ii  s2 7s           3s2  3p0  7s
   14    2si ii  s2 8s           3s2  3p0  8s
   14    2si ii  s2 9s           3s2  3p0  9s
   14    2si ii  s2 10s          3s2  3p0 10s
   14    2si ii  s2 11s          3s2  3p0 11s
   14    2si ii  p2 4s           3s0  3p2  4s  
   14    2si ii  p2 5s           3s0  3p2  5s  
   14    2si ii  p2 6s           3s0  3p2  6s  
   14    2si ii  p2 7s           3s0  3p2  7s  
   14    2si ii  p2 8s           3s0  3p2  8s  
   14    2si ii  p2 9s           3s0  3p2  9s  
   14    2si ii  p2 10s          3s0  3p2 10s  
   14    2si ii  p2 11s          3s0  3p2 11s  
   14    2si ii  s2 3d           3s2  3p0  3d
   14    2si ii  s2 4d           3s2  3p0  4d
   14    2si ii  s2 5d           3s2  3p0  5d
   14    2si ii  s2 6d           3s2  3p0  6d
   14    2si ii  s2 7d           3s2  3p0  7d
   14    2si ii  s2 8d           3s2  3p0  8d
   14    2si ii  s2 9d           3s2  3p0  9d
   14    2si ii  s2 10d          3s2  3p0 10d
   14    2si ii  p2 3d           3s0  3p2  3d
   14    2si ii  p2 4d           3s0  3p2  4d
   14    2si ii  p2 5d           3s0  3p2  5d
   14    2si ii  p2 6d           3s0  3p2  6d
   14    2si ii  p2 7d           3s0  3p2  7d
   14    2si ii  p2 8d           3s0  3p2  8d
   14    2si ii  p2 9d           3s0  3p2  9d
   14    2si ii  p2 10d          3s0  3p2 10d
   14    2si ii  s2 5g           3s2  3p0  5g
   14    2si ii  s2 6g           3s2  3p0  6g
   14    2si ii  s2 7g           3s2  3p0  7g
   14    2si ii  s2 8g           3s2  3p0  8g
   14    2si ii  s2 9g           3s2  3p0  9g
   14    2si ii  s2 10g          3s2  3p0 10g
   14    2si ii  s2 11g          3s2  3p0 11g
   14    2si ii  p2 5g           3s0  3p2  5g
   14    2si ii  p2 6g           3s0  3p2  6g
   14    2si ii  p2 7g           3s0  3p2  7g
   14    2si ii  p2 8g           3s0  3p2  8g
   14    2si ii  p2 9g           3s0  3p2  9g
   14    2si ii  p2 10g          3s0  3p2 10g
   14    2si ii  p2 11g          3s0  3p2 11g
   14    2si ii  s2 7i           3s2  3p0  7i
   14    2si ii  s2 8i           3s2  3p0  8i
   14    2si ii  s2 9i           3s2  3p0  9i
   14    2si ii  p2 7i           3s0  3p2  7i
   14    2si ii  p2 8i           3s0  3p2  8i
   14    2si ii  p2 9i           3s0  3p2  9i
   14    2si ii  sp2             3s   3p2
   14    2si ii  sp 4p           3s   3p   4p
   14    2si ii  sp 5p           3s   3p   5p
   14    2si ii  sp 6p           3s   3p   6p
   14    2si ii  sp 7p           3s   3p   7p
   14    2si ii  sp 8p           3s   3p   8p
   14    2si ii  sp 9p           3s   3p   9p
   14    2si ii  sp 4f           3s   3p   4f
   14    2si ii  sp 5f           3s   3p   5f
   14    2si ii  sp 6f           3s   3p   6f
   14    2si ii  sp 7f           3s   3p   7f
   14    2si ii  sp 8f           3s   3p   8f
   14    2si ii  sp 9f           3s   3p   9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF140101.DAT;*
$DELETE POOLG:HF140102.DAT;*
$DELETE POOLG:HF140104.DAT;*
$DELETE POOLG:HF140131.DAT;*
$DELETE POOLG:HF140132.DAT;*
