$set def 1704
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf170407.dat for007
$assign poolg:hf170401.dat for001
$assign poolg:hf170402.dat for002
$assign poolg:hf170404.dat for004
$assign hf1704x.pun for011
$assign hf1704x.RRR for012
$assign hf1704x.dat for013
$assign hf1704xe.dat for014
$assign poolg:hf170431.dat for031
$assign poolg:hf170432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   17    5cl v   s2 3p           3s2  3p
   17    5cl v   s2 4p           3s2  3p0  4p
   17    5cl v   s2 5p           3s2  3p0  5p
   17    5cl v   s2 6p           3s2  3p0  6p
   17    5cl v   s2 7p           3s2  3p0  7p
   17    5cl v   s2 8p           3s2  3p0  8p
   17    5cl v   s2 9p           3s2  3p0  9p
   17    5cl v   s2 10p          3s2  3p0 10p
   17    5cl v   s2 11p          3s2  3p0 11p
   17    5cl v   s2 12p          3s2  3p0 12p
   17    5cl v   p3              3s0  3p3
   17    5cl v   p2 4p           3s0  3p2  4p
   17    5cl v   p2 5p           3s0  3p2  5p
   17    5cl v   p2 6p           3s0  3p2  6p
   17    5cl v   p2 7p           3s0  3p2  7p
   17    5cl v   p2 8p           3s0  3p2  8p
   17    5cl v   p2 9p           3s0  3p2  9p
   17    5cl v   p2 10p          3s0  3p2 10p
   17    5cl v   p2 11p          3s0  3p2 11p
   17    5cl v   p2 12p          3s0  3p2 12p
   17    5cl v   s2 4f           3s2  3p0  4f
   17    5cl v   s2 5f           3s2  3p0  5f
   17    5cl v   s2 6f           3s2  3p0  6f
   17    5cl v   s2 7f           3s2  3p0  7f
   17    5cl v   s2 8f           3s2  3p0  8f
   17    5cl v   s2 9f           3s2  3p0  9f
   17    5cl v   s2 10f          3s2  3p0 10f
   17    5cl v   s2 11f          3s2  3p0 11f
   17    5cl v   s2 12f          3s2  3p0 12f
   17    5cl v   p2 4f           3s0  3p2  4f
   17    5cl v   p2 5f           3s0  3p2  5f
   17    5cl v   p2 6f           3s0  3p2  6f
   17    5cl v   p2 7f           3s0  3p2  7f
   17    5cl v   p2 8f           3s0  3p2  8f
   17    5cl v   p2 9f           3s0  3p2  9f
   17    5cl v   p2 10f          3s0  3p2 10f
   17    5cl v   p2 11f          3s0  3p2 11f
   17    5cl v   p2 12f          3s0  3p2 12f
   17    5cl v   s2 6h           3s2  3p0  6h
   17    5cl v   s2 7h           3s2  3p0  7h
   17    5cl v   s2 8h           3s2  3p0  8h
   17    5cl v   s2 9h           3s2  3p0  9h
   17    5cl v   s2 10h          3s2  3p0 10h
   17    5cl v   s2 8k           3s2  3p0  8k
   17    5cl v   s2 9k           3s2  3p0  9k
   17    5cl v   s2 10k          3s2  3p0 10k
   17    5cl v   sp 4s           3s   3p   4s
   17    5cl v   sp 5s           3s   3p   5s
   17    5cl v   sp 6s           3s   3p   6s
   17    5cl v   sp 7s           3s   3p   7s
   17    5cl v   sp 8s           3s   3p   8s
   17    5cl v   sp 9s           3s   3p   9s
   17    5cl v   sp 10s          3s   3p  10s
   17    5cl v   sp 3d           3s   3p   3d
   17    5cl v   sp 4d           3s   3p   4d
   17    5cl v   sp 5d           3s   3p   5d
   17    5cl v   sp 6d           3s   3p   6d
   17    5cl v   sp 7d           3s   3p   7d
   17    5cl v   sp 8d           3s   3p   8d
   17    5cl v   sp 9d           3s   3p   9d
   17    5cl v   sp 10d          3s   3p  10d
   17    5cl v   s2 4s           3s2  3p0  4s
   17    5cl v   s2 5s           3s2  3p0  5s
   17    5cl v   s2 6s           3s2  3p0  6s
   17    5cl v   s2 7s           3s2  3p0  7s
   17    5cl v   s2 8s           3s2  3p0  8s
   17    5cl v   s2 9s           3s2  3p0  9s
   17    5cl v   s2 10s          3s2  3p0 10s
   17    5cl v   s2 11s          3s2  3p0 11s
   17    5cl v   p2 4s           3s0  3p2  4s
   17    5cl v   p2 5s           3s0  3p2  5s
   17    5cl v   p2 6s           3s0  3p2  6s
   17    5cl v   p2 7s           3s0  3p2  7s
   17    5cl v   p2 8s           3s0  3p2  8s
   17    5cl v   p2 9s           3s0  3p2  9s
   17    5cl v   p2 10s          3s0  3p2 10s
   17    5cl v   p2 11s          3s0  3p2 11s
   17    5cl v   s2 3d           3s2  3p0  3d
   17    5cl v   s2 4d           3s2  3p0  4d
   17    5cl v   s2 5d           3s2  3p0  5d
   17    5cl v   s2 6d           3s2  3p0  6d
   17    5cl v   s2 7d           3s2  3p0  7d
   17    5cl v   s2 8d           3s2  3p0  8d
   17    5cl v   s2 9d           3s2  3p0  9d
   17    5cl v   s2 10d          3s2  3p0 10d
   17    5cl v   s2 11d          3s2  3p0 11d
   17    5cl v   p2 3d           3s0  3p2  3d
   17    5cl v   p2 4d           3s0  3p2  4d
   17    5cl v   p2 5d           3s0  3p2  5d
   17    5cl v   p2 6d           3s0  3p2  6d
   17    5cl v   p2 7d           3s0  3p2  7d
   17    5cl v   p2 8d           3s0  3p2  8d
   17    5cl v   p2 9d           3s0  3p2  9d
   17    5cl v   p2 10d          3s0  3p2 10d
   17    5cl v   p2 11d          3s0  3p2 11d
   17    5cl v   s2 5g           3s2  3p0  5g
   17    5cl v   s2 6g           3s2  3p0  6g
   17    5cl v   s2 7g           3s2  3p0  7g
   17    5cl v   s2 8g           3s2  3p0  8g
   17    5cl v   s2 9g           3s2  3p0  9g
   17    5cl v   s2 10g          3s2  3p0 10g
   17    5cl v   s2 11g          3s2  3p0 11g
   17    5cl v   s2 7i           3s2  3p0  7i
   17    5cl v   s2 8i           3s2  3p0  8i
   17    5cl v   s2 9i           3s2  3p0  9i
   17    5cl v   s2 10i          3s2  3p0 10i
   17    5cl v   s2 11i          3s2  3p0 11i
   17    5cl v   sp2             3s   3p2
   17    5cl v   sp 4p           3s   3p   4p
   17    5cl v   sp 5p           3s   3p   5p
   17    5cl v   sp 6p           3s   3p   6p
   17    5cl v   sp 7p           3s   3p   7p
   17    5cl v   sp 8p           3s   3p   8p
   17    5cl v   sp 9p           3s   3p   9p
   17    5cl v   sp 10p          3s   3p  10p
   17    5cl v   sp 4f           3s   3p   4f
   17    5cl v   sp 5f           3s   3p   5f
   17    5cl v   sp 6f           3s   3p   6f
   17    5cl v   sp 7f           3s   3p   7f
   17    5cl v   sp 8f           3s   3p   8f
   17    5cl v   sp 9f           3s   3p   9f
   17    5cl v   sp 10f          3s   3p  10f
   -1
$run cray:rcn2c
$DELETE POOLG:HF170401.DAT;*
$DELETE POOLG:HF170402.DAT;*
$DELETE POOLG:HF170404.DAT;*
$DELETE POOLG:HF170431.DAT;*
$DELETE POOLG:HF170432.DAT;*
