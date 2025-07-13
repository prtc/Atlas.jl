$set def 1300
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf130007.dat for007
$assign poolg:hf130001.dat for001
$assign poolg:hf130002.dat for002
$assign poolg:hf130004.dat for004
$assign hf1300x.pun for011
$assign hf1300x.RRR for012
$assign hf1300x.dat for013
$assign hf1300xe.dat for014
$assign poolg:hf130031.dat for031
$assign poolg:hf130032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   13    1al i   s2 3p           3s2  3p
   13    1al i   s2 4p           3s2  3p0  4p
   13    1al i   s2 5p           3s2  3p0  5p
   13    1al i   s2 6p           3s2  3p0  6p
   13    1al i   s2 7p           3s2  3p0  7p
   13    1al i   s2 8p           3s2  3p0  8p
   13    1al i   s2 9p           3s2  3p0  9p
   13    1al i   s2 10p          3s2  3p0 10p
   13    1al i   s2 11p          3s2  3p0 11p
   13    1al i   s2 12p          3s2  3p0 12p
   13    1al i   s2 13p          3s2  3p0 13p
   13    1al i   p3              3s0  3p3  
   13    1al i   p2 4p           3s0  3p2  4p  
   13    1al i   p2 5p           3s0  3p2  5p  
   13    1al i   p2 6p           3s0  3p2  6p  
   13    1al i   p2 7p           3s0  3p2  7p  
   13    1al i   p2 8p           3s0  3p2  8p  
   13    1al i   p2 9p           3s0  3p2  9p  
   13    1al i   p2 10p          3s0  3p2 10p
   13    1al i   p2 11p          3s0  3p2 11p
   13    1al i   p2 12p          3s0  3p2 12p
   13    1al i   p2 13p          3s0  3p2 13p
   13    1al i   s2 4f           3s2  3p0  4f
   13    1al i   s2 5f           3s2  3p0  5f
   13    1al i   s2 6f           3s2  3p0  6f
   13    1al i   s2 7f           3s2  3p0  7f
   13    1al i   s2 8f           3s2  3p0  8f
   13    1al i   s2 9f           3s2  3p0  9f
   13    1al i   s2 10f          3s2  3p0 10f
   13    1al i   s2 11f          3s2  3p0 11f
   13    1al i   s2 12f          3s2  3p0 12f
   13    1al i   s2 13f          3s2  3p0 13f
   13    1al i   p2 4f           3s0  3p2  4f
   13    1al i   p2 5f           3s0  3p2  5f
   13    1al i   p2 6f           3s0  3p2  6f
   13    1al i   p2 7f           3s0  3p2  7f
   13    1al i   p2 8f           3s0  3p2  8f
   13    1al i   p2 9f           3s0  3p2  9f
   13    1al i   p2 10f          3s0  3p2 10f
   13    1al i   p2 11f          3s0  3p2 11f
   13    1al i   p2 12f          3s0  3p2 12f
   13    1al i   p2 13f          3s0  3p2 13f
   13    1al i   s2 6h           3s2  3p0  6h
   13    1al i   s2 7h           3s2  3p0  7h
   13    1al i   s2 8h           3s2  3p0  8h
   13    1al i   s2 9h           3s2  3p0  9h
   13    1al i   p2 6h           3s0  3p2  6h
   13    1al i   p2 7h           3s0  3p2  7h
   13    1al i   p2 8h           3s0  3p2  8h
   13    1al i   p2 9h           3s0  3p2  9h
   13    1al i   s2 8k           3s2  3p0  8k
   13    1al i   s2 9k           3s2  3p0  9k
   13    1al i   p2 8k           3s0  3p2  8k
   13    1al i   p2 9k           3s0  3p2  9k
   13    1al i   sp 4s           3s   3p   4s
   13    1al i   sp 5s           3s   3p   5s
   13    1al i   sp 6s           3s   3p   6s
   13    1al i   sp 7s           3s   3p   7s
   13    1al i   sp 8s           3s   3p   8s
   13    1al i   sp 9s           3s   3p   9s
   13    1al i   sp 3d           3s   3p   3d
   13    1al i   sp 4d           3s   3p   4d
   13    1al i   sp 5d           3s   3p   5d
   13    1al i   sp 6d           3s   3p   6d
   13    1al i   sp 7d           3s   3p   7d
   13    1al i   sp 8d           3s   3p   8d
   13    1al i   sp 9d           3s   3p   9d
   13    1al i   s2 4s           3s2  3p0  4s
   13    1al i   s2 5s           3s2  3p0  5s
   13    1al i   s2 6s           3s2  3p0  6s
   13    1al i   s2 7s           3s2  3p0  7s
   13    1al i   s2 8s           3s2  3p0  8s
   13    1al i   s2 9s           3s2  3p0  9s
   13    1al i   s2 10s          3s2  3p0 10s
   13    1al i   s2 11s          3s2  3p0 11s
   13    1al i   s2 12s          3s2  3p0 12s
   13    1al i   s2 13s          3s2  3p0 13s
   13    1al i   p2 4s           3s0  3p2  4s  
   13    1al i   p2 5s           3s0  3p2  5s  
   13    1al i   p2 6s           3s0  3p2  6s  
   13    1al i   p2 7s           3s0  3p2  7s  
   13    1al i   p2 8s           3s0  3p2  8s  
   13    1al i   p2 9s           3s0  3p2  9s  
   13    1al i   p2 10s          3s0  3p2 10s  
   13    1al i   p2 11s          3s0  3p2 11s  
   13    1al i   p2 12s          3s0  3p2 12s  
   13    1al i   p2 13s          3s0  3p2 13s  
   13    1al i   s2 3d           3s2  3p0  3d
   13    1al i   s2 4d           3s2  3p0  4d
   13    1al i   s2 5d           3s2  3p0  5d
   13    1al i   s2 6d           3s2  3p0  6d
   13    1al i   s2 7d           3s2  3p0  7d
   13    1al i   s2 8d           3s2  3p0  8d
   13    1al i   s2 9d           3s2  3p0  9d
   13    1al i   s2 10d          3s2  3p0 10d
   13    1al i   s2 11d          3s2  3p0 11d
   13    1al i   s2 12d          3s2  3p0 12d
   13    1al i   s2 13d          3s2  3p0 13d
   13    1al i   p2 3d           3s0  3p2  3d
   13    1al i   p2 4d           3s0  3p2  4d
   13    1al i   p2 5d           3s0  3p2  5d
   13    1al i   p2 6d           3s0  3p2  6d
   13    1al i   p2 7d           3s0  3p2  7d
   13    1al i   p2 8d           3s0  3p2  8d
   13    1al i   p2 9d           3s0  3p2  9d
   13    1al i   p2 10d          3s0  3p2 10d
   13    1al i   p2 11d          3s0  3p2 11d
   13    1al i   p2 12d          3s0  3p2 12d
   13    1al i   p2 13d          3s0  3p2 13d
   13    1al i   s2 5g           3s2  3p0  5g
   13    1al i   s2 6g           3s2  3p0  6g
   13    1al i   s2 7g           3s2  3p0  7g
   13    1al i   s2 8g           3s2  3p0  8g
   13    1al i   s2 9g           3s2  3p0  9g
   13    1al i   p2 5g           3s0  3p2  5g
   13    1al i   p2 6g           3s0  3p2  6g
   13    1al i   p2 7g           3s0  3p2  7g
   13    1al i   p2 8g           3s0  3p2  8g
   13    1al i   p2 9g           3s0  3p2  9g
   13    1al i   s2 7i           3s2  3p0  7i
   13    1al i   s2 8i           3s2  3p0  8i
   13    1al i   s2 9i           3s2  3p0  9i
   13    1al i   p2 7i           3s0  3p2  7i
   13    1al i   p2 8i           3s0  3p2  8i
   13    1al i   p2 9i           3s0  3p2  9i
   13    1al i   sp2             3s   3p2
   13    1al i   sp 4p           3s   3p   4p
   13    1al i   sp 5p           3s   3p   5p
   13    1al i   sp 6p           3s   3p   6p
   13    1al i   sp 7p           3s   3p   7p
   13    1al i   sp 8p           3s   3p   8p
   13    1al i   sp 9p           3s   3p   9p
   13    1al i   sp 4f           3s   3p   4f
   13    1al i   sp 5f           3s   3p   5f
   13    1al i   sp 6f           3s   3p   6f
   13    1al i   sp 7f           3s   3p   7f
   13    1al i   sp 8f           3s   3p   8f
   13    1al i   sp 9f           3s   3p   9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF130001.DAT;*
$DELETE POOLG:HF130002.DAT;*
$DELETE POOLG:HF130004.DAT;*
$DELETE POOLG:HF130031.DAT;*
$DELETE POOLG:HF130032.DAT;*
