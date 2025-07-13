$set def 1500
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf150007.dat for007
$assign poolg:hf150001.dat for001
$assign poolg:hf150002.dat for002
$assign poolg:hf150004.dat for004
$assign hf1500x.pun for011
$assign hf1500x.rrr for012
$assign hf1500x.dat for013
$assign hf1500xe.dat for014
$assign poolg:hf150031.dat for031
$assign poolg:hf150032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   15    1p i   s2p3             3s2  3p3
   15    1p i   s2p2 4p          3s2  3p2  4p
   15    1p i   s2p2 5p          3s2  3p2  5p
   15    1p i   s2p2 6p          3s2  3p2  6p
   15    1p i   s2p2 7p          3s2  3p2  7p
   15    1p i   s2p2 8p          3s2  3p2  8p
   15    1p i   s2p2 9p          3s2  3p2  9p
   15    1p i   s2p2 4f          3s2  3p2  4f
   15    1p i   s2p2 5f          3s2  3p2  5f
   15    1p i   s2p2 6f          3s2  3p2  6f
   15    1p i   s2p2 7f          3s2  3p2  7f
   15    1p i   s2p2 8f          3s2  3p2  8f
   15    1p i   s2p2 9f          3s2  3p2  9f
   15    1p i   s2p2 6h          3s2  3p2  6h
   15    1p i   s2p2 7h          3s2  3p2  7h
   15    1p i   s2p2 8h          3s2  3p2  8h
   15    1p i   s2p2 9h          3s2  3p2  9h
   15    1p i   s2p2 8k          3s2  3p2  8k
   15    1p i   s2p2 9k          3s2  3p2  9k
   15    1p i   sp3 4s           3s   3p3  4s
   15    1p i   sp3 5s           3s   3p3  5s
   15    1p i   sp3 6s           3s   3p3  6s
   15    1p i   sp3 7s           3s   3p3  7s
   15    1p i   sp3 8s           3s   3p3  8s
   15    1p i   sp3 9s           3s   3p3  9s
   15    1p i   sp3 3d           3s   3p3  3d
   15    1p i   sp3 4d           3s   3p3  4d
   15    1p i   sp3 5d           3s   3p3  5d
   15    1p i   sp3 6d           3s   3p3  6d
   15    1p i   sp3 7d           3s   3p3  7d
   15    1p i   sp3 8d           3s   3p3  8d
   15    1p i   sp3 9d           3s   3p3  9d
   15    1p i   s2p2 4s          3s2  3p2  4s
   15    1p i   s2p2 5s          3s2  3p2  5s
   15    1p i   s2p2 6s          3s2  3p2  6s
   15    1p i   s2p2 7s          3s2  3p2  7s
   15    1p i   s2p2 8s          3s2  3p2  8s
   15    1p i   s2p2 9s          3s2  3p2  9s
   15    1p i   s2p2 3d          3s2  3p2  3d
   15    1p i   s2p2 4d          3s2  3p2  4d
   15    1p i   s2p2 5d          3s2  3p2  5d
   15    1p i   s2p2 6d          3s2  3p2  6d
   15    1p i   s2p2 7d          3s2  3p2  7d
   15    1p i   s2p2 8d          3s2  3p2  8d
   15    1p i   s2p2 9d          3s2  3p2  9d
   15    1p i   s2p2 5g          3s2  3p2  5g
   15    1p i   s2p2 6g          3s2  3p2  6g
   15    1p i   s2p2 7g          3s2  3p2  7g
   15    1p i   s2p2 8g          3s2  3p2  8g
   15    1p i   s2p2 9g          3s2  3p2  9g
   15    1p i   s2p2 7i          3s2  3p2  7i
   15    1p i   s2p2 8i          3s2  3p2  8i
   15    1p i   s2p2 9i          3s2  3p2  9i
   15    1p i   sp4              3s   3p4  
   15    1p i   sp3 4p           3s   3p3  4p
   15    1p i   sp3 5p           3s   3p3  5p
   15    1p i   sp3 6p           3s   3p3  6p
   15    1p i   sp3 7p           3s   3p3  7p
   15    1p i   sp3 8p           3s   3p3  8p
   15    1p i   sp3 9p           3s   3p3  9p
   15    1p i   sp3 4f           3s   3p3  4f
   15    1p i   sp3 5f           3s   3p3  5f
   15    1p i   sp3 6f           3s   3p3  6f
   15    1p i   sp3 7f           3s   3p3  7f
   15    1p i   sp3 8f           3s   3p3  8f
   15    1p i   sp3 9f           3s   3p3  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF150001.DAT;*
$DELETE POOLG:HF150002.DAT;*
$DELETE POOLG:HF150004.DAT;*
$DELETE POOLG:HF150031.DAT;*
$DELETE POOLG:HF150032.DAT;*
