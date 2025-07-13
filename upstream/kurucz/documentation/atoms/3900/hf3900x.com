$set def 3900
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf390007.dat for007
$assign poolg:hf390001.dat for001
$assign poolg:hf390002.dat for002
$assign poolg:hf390004.dat for004
$assign hf3900x.pun for011
$assign hf3900x.dat for013
$assign hf3900xe.dat for014
$assign poolg:hf390031.dat for031
$assign poolg:hf390032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   39    1y i   ds2              4d1  5s2
   39    1y i   ds 6s            4d1  5s   6s
   39    1y i   ds 7s            4d1  5s   7s
   39    1y i   ds 8s            4d1  5s   8s
   39    1y i   ds 9s            4d1  5s   9s
   39    1y i   ds 10s           4d1  5s  10s
   39    1y i   d2 5s            4d2  5s
   39    1y i   d2 6s            4d2  6s
   39    1y i   d2 7s            4d2  7s
   39    1y i   d2 8s            4d2  8s
   39    1y i   d2 9s            4d2  9s
   39    1y i   d2 10s           4d2 10s
   39    1y i   s2 6s            5s2  6s
   39    1y i   s2 7s            5s2  7s
   39    1y i   s2 8s            5s2  8s
   39    1y i   s2 9s            5s2  9s
   39    1y i   s2 10s           5s2 10s
   39    1y i   d3               4d3
   39    1y i   d2 5d            4d2  5d
   39    1y i   d2 6d            4d2  6d
   39    1y i   d2 7d            4d2  7d
   39    1y i   d2 8d            4d2  8d
   39    1y i   d2 9d            4d2  9d
   39    1y i   d2 10d           4d2 10d
   39    1y i   ds 5d            4d1  5s   5d
   39    1y i   ds 6d            4d1  5s   6d
   39    1y i   ds 7d            4d1  5s   7d
   39    1y i   ds 8d            4d1  5s   8d
   39    1y i   ds 9d            4d1  5s   9d
   39    1y i   ds 10d           4d1  5s  10d
   39    1y i   s2 5d            5s2  5d
   39    1y i   s2 6d            5s2  6d
   39    1y i   s2 7d            5s2  7d
   39    1y i   s2 8d            5s2  8d
   39    1y i   s2 9d            5s2  9d
   39    1y i   s2 10d           5s2 10d
   39    1y i   ds 5g            4d1  5s   5g
   39    1y i   ds 6g            4d1  5s   6g
   39    1y i   d5 7g            4d1  5s   7g
   39    1y i   ds 8g            4d1  5s   8g
   39    1y i   ds 9g            4d1  5s   9g
   39    1y i   d2 5g            4d2  5g
   39    1y i   d2 6g            4d2  6g
   39    1y i   d2 7g            4d2  7g
   39    1y i   d2 8g            4d2  8g
   39    1y i   d2 9g            4d2  9g
   39    1y i   s2 5g            5s2  5g
   39    1y i   s2 6g            5s2  6g
   39    1y i   s2 7g            5s2  7g
   39    1y i   s2 8g            5s2  8g
   39    1y i   s2 9g            5s2  9g
   39    1y i   s2 7i            5s2  7i
   39    1y i   s2 8i            5s2  8i
   39    1y i   s2 9i            5s2  9i
   39    1y i   ds 7i            4d1  5s   7i
   39    1y i   ds 8i            4d1  5s   8i
   39    1y i   ds 9i            4d1  5s   9i
   39    1y i   s2 9l            5s2  9l
   39    1y i   ds 9l            4d1  5s   9l
   39    1y i   dp2              4d1  5p2
   39    1y i   sp2              5s1  5p2
   39    1y i   d2 5p            4d2  5p
   39    1y i   d2 6p            4d2  6p
   39    1y i   d2 7p            4d2  7p
   39    1y i   d2 8p            4d2  8p
   39    1y i   d2 9p            4d2  9p
   39    1y i   d2 10p           4d2 10p
   39    1y i   d2 11p           4d2 11p
   39    1y i   ds 5p            4d1  5s   5p
   39    1y i   ds 6p            4d1  5s   6p
   39    1y i   ds 7p            4d1  5s   7p
   39    1y i   ds 8p            4d1  5s   8p
   39    1y i   ds 9p            4d1  5s   9p
   39    1y i   ds 10p           4d1  5s  10p
   39    1y i   ds 11p           4d1  5s  11p
   39    1y i   s2 5p            5s2  5p
   39    1y i   s2 6p            5s2  6p
   39    1y i   s2 7p            5s2  7p
   39    1y i   s2 8p            5s2  8p
   39    1y i   s2 9p            5s2  9p
   39    1y i   s2 10p           5s2 10p
   39    1y i   s2 11p           5s2 11p
   39    1y i   d2 4f            4d2  4f
   39    1y i   d2 5f            4d2  5f
   39    1y i   d2 6f            4d2  6f
   39    1y i   d2 7f            4d2  7f
   39    1y i   d2 8f            4d2  8f
   39    1y i   d2 9f            4d2  9f
   39    1y i   d2 10f           4d2 10f
   39    1y i   ds 4f            4d1  5s   4f
   39    1y i   ds 5f            4d1  5s   5f
   39    1y i   ds 6f            4d1  5s   6f
   39    1y i   ds 7f            4d1  5s   7f
   39    1y i   ds 8f            4d1  5s   8f
   39    1y i   ds 9f            4d1  5s   9f
   39    1y i   ds 10f           4d1  5s  10f
   39    1y i   s2 4f            5s2  4f
   39    1y i   s2 5f            5s2  5f
   39    1y i   s2 6f            5s2  6f
   39    1y i   s2 7f            5s2  7f
   39    1y i   s2 8f            5s2  8f
   39    1y i   s2 9f            5s2  9f
   39    1y i   s2 10f           5s2 10f
   39    1y i   d2 6h            4d2  6h
   39    1y i   d2 7h            4d2  7h
   39    1y i   d2 8h            4d2  8h
   39    1y i   d2 9h            4d2  9h
   39    1y i   ds 6h            4d1  5s   6h
   39    1y i   ds 7h            4d1  5s   7h
   39    1y i   ds 8h            4d1  5s   8h
   39    1y i   ds 9h            4d1  5s   9h
   39    1y i   s2 6h            5s2  6h
   39    1y i   s2 7h            5s2  7h
   39    1y i   s2 8h            5s2  8h
   39    1y i   s2 9h            5s2  9h
   39    1y i   ds 8k            4d1  5s   8k
   39    1y i   ds 9k            4d1  5s   9k
   39    1y i   d2 8k            4d2  8k
   39    1y i   d2 9k            4d2  9k
   39    1y i   s2 8k            5s2  8k
   39    1y i   s2 9k            5s2  9k
   39    1y i   p3               5p3  
   -1
$run cray:rcn2c
$DELETE POOLG:HF390001.DAT;*
$DELETE POOLG:HF390002.DAT;*
$DELETE POOLG:HF390004.DAT;*
$DELETE POOLG:HF390031.DAT;*
$DELETE POOLG:HF390032.DAT;*
