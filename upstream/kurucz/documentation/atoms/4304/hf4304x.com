$set def KU6E:[KURUCZ.4304]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf430407.dat for007
$assign pool:hf430401.dat for001
$assign pool:hf430402.dat for002
$assign pool:hf430404.dat for004
$assign hf4304x.pun for011
$assign hf4304x.dat for013
$assign hf4304xe.dat for014
$assign pool:hf430431.dat for031
$assign pool:hf430432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   43    5tc v  d3               4d3
   43    5tc v  d2 5s            4d2  5s
   43    5tc v  d2 6s            4d2  6s
   43    5tc v  d2 7s            4d2  7s
   43    5tc v  d2 8s            4d2  8s
   43    5tc v  d2 9s            4d2  9s
   43    5tc v  d2 10s           4d2 10s
   43    5tc v  d2 11s           4d2 11s
   43    5tc v  ds2              4d1  5s2
   43    5tc v  ds 6s            4d1  5s   6s
   43    5tc v  ds 7s            4d1  5s   7s
   43    5tc v  ds 8s            4d1  5s   8s
   43    5tc v  ds 9s            4d1  5s   9s
   43    5tc v  ds 10s           4d1  5s  10s
   43    5tc v  ds 11s           4d1  5s  11s
   43    5tc v  s2 6s            5s2  6s
   43    5tc v  s2 7s            5s2  7s
   43    5tc v  s2 8s            5s2  8s
   43    5tc v  s2 9s            5s2  9s
   43    5tc v  s2 10s           5s2 10s
   43    5tc v  d2 5d            4d2  5d
   43    5tc v  d2 6d            4d2  6d
   43    5tc v  d2 7d            4d2  7d
   43    5tc v  d2 8d            4d2  8d
   43    5tc v  d2 9d            4d2  9d
   43    5tc v  d2 10d           4d2 10d
   43    5tc v  ds 5d            4d1  5s   5d
   43    5tc v  ds 6d            4d1  5s   6d
   43    5tc v  ds 7d            4d1  5s   7d
   43    5tc v  ds 8d            4d1  5s   8d
   43    5tc v  ds 9d            4d1  5s   9d
   43    5tc v  ds 10d           4d1  5s  10d
   43    5tc v  s2 5d            5s2  5d
   43    5tc v  s2 6d            5s2  6d
   43    5tc v  s2 7d            5s2  7d
   43    5tc v  s2 8d            5s2  8d
   43    5tc v  s2 9d            5s2  9d
   43    5tc v  s2 10d           5s2 10d
   43    5tc v  d2 5g            4d2  5g
   43    5tc v  d2 6g            4d2  6g
   43    5tc v  d2 7g            4d2  7g
   43    5tc v  d2 8g            4d2  8g
   43    5tc v  d2 9g            4d2  9g
   43    5tc v  ds 5g            4d1  5s   5g
   43    5tc v  ds 6g            4d1  5s   6g
   43    5tc v  d5 7g            4d1  5s   7g
   43    5tc v  ds 8g            4d1  5s   8g
   43    5tc v  ds 9g            4d1  5s   9g
   43    5tc v  s2 5g            5s2  5g
   43    5tc v  s2 6g            5s2  6g
   43    5tc v  s2 7g            5s2  7g
   43    5tc v  s2 8g            5s2  8g
   43    5tc v  s2 9g            5s2  9g
   43    5tc v  d2 7i            5d2  7i
   43    5tc v  d2 8i            5d2  8i
   43    5tc v  d2 9i            5d2  9i
   43    5tc v  ds 7i            4d1  5s   7i
   43    5tc v  ds 8i            4d1  5s   8i
   43    5tc v  ds 9i            4d1  5s   9i
   43    5tc v  dp2              4d1  5p2
   43    5tc v  Sp2              5s1  5p2
   43    5tc v  d2 5p            4d2  5p
   43    5tc v  d2 6p            4d2  6p
   43    5tc v  d2 7p            4d2  7p
   43    5tc v  d2 8p            4d2  8p
   43    5tc v  d2 9p            4d2  9p
   43    5tc v  d2 10p           4d2 10p
   43    5tc v  d2 11p           4d2 11p
   43    5tc v  ds 5p            4d1  5s   5p
   43    5tc v  ds 6p            4d1  5s   6p
   43    5tc v  ds 7p            4d1  5s   7p
   43    5tc v  ds 8p            4d1  5s   8p
   43    5tc v  ds 9p            4d1  5s   9p
   43    5tc v  ds 10p           4d1  5s  10p
   43    5tc v  ds 11p           4d1  5s  11p
   43    5tc v  s2 5p            5s2  5p
   43    5tc v  s2 6p            5s2  6p
   43    5tc v  s2 7p            5s2  7p
   43    5tc v  s2 8p            5s2  8p
   43    5tc v  s2 9p            5s2  9p
   43    5tc v  s2 10p           5s2 10p
   43    5tc v  s2 11p           5s2 11p
   43    5tc v  d2 4f            4d2  4f
   43    5tc v  d2 5f            4d2  5f
   43    5tc v  d2 6f            4d2  6f
   43    5tc v  d2 7f            4d2  7f
   43    5tc v  d2 8f            4d2  8f
   43    5tc v  d2 9f            4d2  9f
   43    5tc v  d2 10f           4d2 10f
   43    5tc v  ds 4f            4d1  5s   4f
   43    5tc v  ds 5f            4d1  5s   5f
   43    5tc v  ds 6f            4d1  5s   6f
   43    5tc v  ds 7f            4d1  5s   7f
   43    5tc v  ds 8f            4d1  5s   8f
   43    5tc v  ds 9f            4d1  5s   9f
   43    5tc v  ds 10f           4d1  5s  10f
   43    5tc v  s2 4f            5s2  4f
   43    5tc v  s2 5f            5s2  5f
   43    5tc v  s2 6f            5s2  6f
   43    5tc v  s2 7f            5s2  7f
   43    5tc v  s2 8f            5s2  8f
   43    5tc v  s2 9f            5s2  9f
   43    5tc v  s2 10f           5s2 10f
   43    5tc v  d2 6h            4d2  6h
   43    5tc v  d2 7h            4d2  7h
   43    5tc v  d2 8h            4d2  8h
   43    5tc v  d2 9h            4d2  9h
   43    5tc v  ds 6h            4d1  5s   6h
   43    5tc v  ds 7h            4d1  5s   7h
   43    5tc v  ds 8h            4d1  5s   8h
   43    5tc v  ds 9h            4d1  5s   9h
   43    5tc v  s2 6h            5s2  6h
   43    5tc v  s2 7h            5s2  7h
   43    5tc v  s2 8h            5s2  8h
   43    5tc v  s2 9h            5s2  9h
   43    5tc v  ds 8k            4d1  5s   8k
   43    5tc v  ds 9k            4d1  5s   9k
   43    5tc v  d2 8k            4d2  8k
   43    5tc v  d2 9k            4d2  9k
   43    5tc v  s2 8k            5s2  8k
   43    5tc v  s2 9k            5s2  9k
   43    5tc v  p3               5p3  
   -1
$run cray:rcn2c
$DELETE POOL:HF430401.DAT;*
$DELETE POOL:HF430402.DAT;*
$DELETE POOL:HF430404.DAT;*
$DELETE POOL:HF430431.DAT;*
$DELETE POOL:HF430432.DAT;*
