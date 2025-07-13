$set def ku6e:[kurucz.4203]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf420307.dat for007
$assign pool:hf420301.dat for001
$assign pool:hf420302.dat for002
$assign pool:hf420304.dat for004
$assign hf4203x.pun for011
$assign hf4203x.rrr for012
$assign hf4203x.dat for013
$assign hf4203xe.dat for014
$assign pool:hf420331.dat for031
$assign pool:hf420332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   42    4mo iv d3               4d3
   42    4mo iv d2 5s            4d2  5s
   42    4mo iv d2 6s            4d2  6s
   42    4mo iv d2 7s            4d2  7s
   42    4mo iv d2 8s            4d2  8s
   42    4mo iv d2 9s            4d2  9s
   42    4mo iv d2 10s           4d2 10s
   42    4mo iv d2 11s           4d2 11s
   42    4mo iv ds2              4d1  5s2
   42    4mo iv ds 6s            4d1  5s   6s
   42    4mo iv ds 7s            4d1  5s   7s
   42    4mo iv ds 8s            4d1  5s   8s
   42    4mo iv ds 9s            4d1  5s   9s
   42    4mo iv ds 10s           4d1  5s  10s
   42    4mo iv ds 11s           4d1  5s  11s
   42    4mo iv s2 6s            5s2  6s
   42    4mo iv s2 7s            5s2  7s
   42    4mo iv s2 8s            5s2  8s
   42    4mo iv s2 9s            5s2  9s
   42    4mo iv s2 10s           5s2 10s
   42    4mo iv d2 5d            4d2  5d
   42    4mo iv d2 6d            4d2  6d
   42    4mo iv d2 7d            4d2  7d
   42    4mo iv d2 8d            4d2  8d
   42    4mo iv d2 9d            4d2  9d
   42    4mo iv d2 10d           4d2 10d
   42    4mo iv ds 5d            4d1  5s   5d
   42    4mo iv ds 6d            4d1  5s   6d
   42    4mo iv ds 7d            4d1  5s   7d
   42    4mo iv ds 8d            4d1  5s   8d
   42    4mo iv ds 9d            4d1  5s   9d
   42    4mo iv ds 10d           4d1  5s  10d
   42    4mo iv s2 5d            5s2  5d
   42    4mo iv s2 6d            5s2  6d
   42    4mo iv s2 7d            5s2  7d
   42    4mo iv s2 8d            5s2  8d
   42    4mo iv s2 9d            5s2  9d
   42    4mo iv s2 10d           5s2 10d
   42    4mo iv d2 5g            4d2  5g
   42    4mo iv d2 6g            4d2  6g
   42    4mo iv d2 7g            4d2  7g
   42    4mo iv d2 8g            4d2  8g
   42    4mo iv d2 9g            4d2  9g
   42    4mo iv ds 5g            4d1  5s   5g
   42    4mo iv ds 6g            4d1  5s   6g
   42    4mo iv dS 7g            4d1  5s   7g
   42    4mo iv ds 8g            4d1  5s   8g
   42    4mo iv ds 9g            4d1  5s   9g
   42    4mo iv s2 5g            5s2  5g
   42    4mo iv s2 6g            5s2  6g
   42    4mo iv s2 7g            5s2  7g
   42    4mo iv s2 8g            5s2  8g
   42    4mo iv s2 9g            5s2  9g
   42    4mo iv d2 7i            5d2  7i
   42    4mo iv d2 8i            5d2  8i
   42    4mo iv d2 9i            5d2  9i
   42    4mo iv ds 7i            4d1  5s   7i
   42    4mo iv ds 8i            4d1  5s   8i
   42    4mo iv ds 9i            4d1  5s   9i
   42    4mo iv dp2              4d1  5p2
   42    4mo iv Sp2              5s1  5p2
   42    4mo iv d2 5p            4d2  5p
   42    4mo iv d2 6p            4d2  6p
   42    4mo iv d2 7p            4d2  7p
   42    4mo iv d2 8p            4d2  8p
   42    4mo iv d2 9p            4d2  9p
   42    4mo iv d2 10p           4d2 10p
   42    4mo iv d2 11p           4d2 11p
   42    4mo iv ds 5p            4d1  5s   5p
   42    4mo iv ds 6p            4d1  5s   6p
   42    4mo iv ds 7p            4d1  5s   7p
   42    4mo iv ds 8p            4d1  5s   8p
   42    4mo iv ds 9p            4d1  5s   9p
   42    4mo iv ds 10p           4d1  5s  10p
   42    4mo iv ds 11p           4d1  5s  11p
   42    4mo iv s2 5p            5s2  5p
   42    4mo iv s2 6p            5s2  6p
   42    4mo iv s2 7p            5s2  7p
   42    4mo iv s2 8p            5s2  8p
   42    4mo iv s2 9p            5s2  9p
   42    4mo iv s2 10p           5s2 10p
   42    4mo iv s2 11p           5s2 11p
   42    4mo iv d2 4f            4d2  4f
   42    4mo iv d2 5f            4d2  5f
   42    4mo iv d2 6f            4d2  6f
   42    4mo iv d2 7f            4d2  7f
   42    4mo iv d2 8f            4d2  8f
   42    4mo iv d2 9f            4d2  9f
   42    4mo iv d2 10f           4d2 10f
   42    4mo iv ds 4f            4d1  5s   4f
   42    4mo iv ds 5f            4d1  5s   5f
   42    4mo iv ds 6f            4d1  5s   6f
   42    4mo iv ds 7f            4d1  5s   7f
   42    4mo iv ds 8f            4d1  5s   8f
   42    4mo iv ds 9f            4d1  5s   9f
   42    4mo iv ds 10f           4d1  5s  10f
   42    4mo iv s2 4f            5s2  4f
   42    4mo iv s2 5f            5s2  5f
   42    4mo iv s2 6f            5s2  6f
   42    4mo iv s2 7f            5s2  7f
   42    4mo iv s2 8f            5s2  8f
   42    4mo iv s2 9f            5s2  9f
   42    4mo iv s2 10f           5s2 10f
   42    4mo iv d2 6h            4d2  6h
   42    4mo iv d2 7h            4d2  7h
   42    4mo iv d2 8h            4d2  8h
   42    4mo iv d2 9h            4d2  9h
   42    4mo iv ds 6h            4d1  5s   6h
   42    4mo iv ds 7h            4d1  5s   7h
   42    4mo iv ds 8h            4d1  5s   8h
   42    4mo iv ds 9h            4d1  5s   9h
   42    4mo iv s2 6h            5s2  6h
   42    4mo iv s2 7h            5s2  7h
   42    4mo iv s2 8h            5s2  8h
   42    4mo iv s2 9h            5s2  9h
   42    4mo iv ds 8k            4d1  5s   8k
   42    4mo iv ds 9k            4d1  5s   9k
   42    4mo iv d2 8k            4d2  8k
   42    4mo iv d2 9k            4d2  9k
   42    4mo iv s2 8k            5s2  8k
   42    4mo iv s2 9k            5s2  9k
   42    4mo iv p3               5p3  
   -1
$run cray:rcn2c
$DELETE POOL:HF420301.DAT;*
$DELETE POOL:HF420302.DAT;*
$DELETE POOL:HF420304.DAT;*
$DELETE POOL:HF420331.DAT;*
$DELETE POOL:HF420332.DAT;*
