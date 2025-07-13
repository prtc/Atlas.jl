$set def ku6e:[kurucz.4102]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf410207.dat for007
$assign pool:hf410201.dat for001
$assign pool:hf410202.dat for002
$assign pool:hf410204.dat for004
$assign hf4102x.pun for011
$assign hf4102x.rrr for012
$assign hf4102x.dat for013
$assign hf4102xe.dat for014
$assign pool:hf410231.dat for031
$assign pool:hf410232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   41    3nb iiid3               4d3
   41    3nb iiid2 5s            4d2  5s
   41    3nb iiid2 6s            4d2  6s
   41    3nb iiid2 7s            4d2  7s
   41    3nb iiid2 8s            4d2  8s
   41    3nb iiid2 9s            4d2  9s
   41    3nb iiid2 10s           4d2 10s
   41    3nb iiid2 11s           4d2 11s
   41    3nb iiids2              4d1  5s2
   41    3nb iiids 6s            4d1  5s   6s
   41    3nb iiids 7s            4d1  5s   7s
   41    3nb iiids 8s            4d1  5s   8s
   41    3nb iiids 9s            4d1  5s   9s
   41    3nb iiids 10s           4d1  5s  10s
   41    3nb iiids 11s           4d1  5s  11s
   41    3nb iiis2 6s            5s2  6s
   41    3nb iiis2 7s            5s2  7s
   41    3nb iiis2 8s            5s2  8s
   41    3nb iiis2 9s            5s2  9s
   41    3nb iiis2 10s           5s2 10s
   41    3nb iiid2 5d            4d2  5d
   41    3nb iiid2 6d            4d2  6d
   41    3nb iiid2 7d            4d2  7d
   41    3nb iiid2 8d            4d2  8d
   41    3nb iiid2 9d            4d2  9d
   41    3nb iiid2 10d           4d2 10d
   41    3nb iiids 5d            4d1  5s   5d
   41    3nb iiids 6d            4d1  5s   6d
   41    3nb iiids 7d            4d1  5s   7d
   41    3nb iiids 8d            4d1  5s   8d
   41    3nb iiids 9d            4d1  5s   9d
   41    3nb iiids 10d           4d1  5s  10d
   41    3nb iiis2 5d            5s2  5d
   41    3nb iiis2 6d            5s2  6d
   41    3nb iiis2 7d            5s2  7d
   41    3nb iiis2 8d            5s2  8d
   41    3nb iiis2 9d            5s2  9d
   41    3nb iiis2 10d           5s2 10d
   41    3nb iiid2 5g            4d2  5g
   41    3nb iiid2 6g            4d2  6g
   41    3nb iiid2 7g            4d2  7g
   41    3nb iiid2 8g            4d2  8g
   41    3nb iiid2 9g            4d2  9g
   41    3nb iiids 5g            4d1  5s   5g
   41    3nb iiids 6g            4d1  5s   6g
   41    3nb iiid5 7g            4d1  5s   7g
   41    3nb iiids 8g            4d1  5s   8g
   41    3nb iiids 9g            4d1  5s   9g
   41    3nb iiis2 5g            5s2  5g
   41    3nb iiis2 6g            5s2  6g
   41    3nb iiis2 7g            5s2  7g
   41    3nb iiis2 8g            5s2  8g
   41    3nb iiis2 9g            5s2  9g
   41    3nb iiid2 7i            5d2  7i
   41    3nb iiid2 8i            5d2  8i
   41    3nb iiid2 9i            5d2  9i
   41    3nb iiids 7i            4d1  5s   7i
   41    3nb iiids 8i            4d1  5s   8i
   41    3nb iiids 9i            4d1  5s   9i
   41    3nb iiidp2              4d1  5p2
   41    3nb iiisp2              5s1  5p2
   41    3nb iiid2 5p            4d2  5p
   41    3nb iiid2 6p            4d2  6p
   41    3nb iiid2 7p            4d2  7p
   41    3nb iiid2 8p            4d2  8p
   41    3nb iiid2 9p            4d2  9p
   41    3nb iiid2 10p           4d2 10p
   41    3nb iiid2 11p           4d2 11p
   41    3nb iiids 5p            4d1  5s   5p
   41    3nb iiids 6p            4d1  5s   6p
   41    3nb iiids 7p            4d1  5s   7p
   41    3nb iiids 8p            4d1  5s   8p
   41    3nb iiids 9p            4d1  5s   9p
   41    3nb iiids 10p           4d1  5s  10p
   41    3nb iiids 11p           4d1  5s  11p
   41    3nb iiis2 5p            5s2  5p
   41    3nb iiis2 6p            5s2  6p
   41    3nb iiis2 7p            5s2  7p
   41    3nb iiis2 8p            5s2  8p
   41    3nb iiis2 9p            5s2  9p
   41    3nb iiis2 10p           5s2 10p
   41    3nb iiis2 11p           5s2 11p
   41    3nb iiid2 4f            4d2  4f
   41    3nb iiid2 5f            4d2  5f
   41    3nb iiid2 6f            4d2  6f
   41    3nb iiid2 7f            4d2  7f
   41    3nb iiid2 8f            4d2  8f
   41    3nb iiid2 9f            4d2  9f
   41    3nb iiid2 10f           4d2 10f
   41    3nb iiids 4f            4d1  5s   4f
   41    3nb iiids 5f            4d1  5s   5f
   41    3nb iiids 6f            4d1  5s   6f
   41    3nb iiids 7f            4d1  5s   7f
   41    3nb iiids 8f            4d1  5s   8f
   41    3nb iiids 9f            4d1  5s   9f
   41    3nb iiids 10f           4d1  5s  10f
   41    3nb iiis2 4f            5s2  4f
   41    3nb iiis2 5f            5s2  5f
   41    3nb iiis2 6f            5s2  6f
   41    3nb iiis2 7f            5s2  7f
   41    3nb iiis2 8f            5s2  8f
   41    3nb iiis2 9f            5s2  9f
   41    3nb iiis2 10f           5s2 10f
   41    3nb iiid2 6h            4d2  6h
   41    3nb iiid2 7h            4d2  7h
   41    3nb iiid2 8h            4d2  8h
   41    3nb iiid2 9h            4d2  9h
   41    3nb iiids 6h            4d1  5s   6h
   41    3nb iiids 7h            4d1  5s   7h
   41    3nb iiids 8h            4d1  5s   8h
   41    3nb iiids 9h            4d1  5s   9h
   41    3nb iiis2 6h            5s2  6h
   41    3nb iiis2 7h            5s2  7h
   41    3nb iiis2 8h            5s2  8h
   41    3nb iiis2 9h            5s2  9h
   41    3nb iiids 8k            4d1  5s   8k
   41    3nb iiids 9k            4d1  5s   9k
   41    3nb iiid2 8k            4d2  8k
   41    3nb iiid2 9k            4d2  9k
   41    3nb iiis2 8k            5s2  8k
   41    3nb iiis2 9k            5s2  9k
   41    3nb iiip3               5p3  
   -1
$run cray:rcn2c
$DELETE POOL:HF410201.DAT;*
$DELETE POOL:HF410202.DAT;*
$DELETE POOL:HF410204.DAT;*
$DELETE POOL:HF410231.DAT;*
$DELETE POOL:HF410232.DAT;*
