$set def 0904
$assign sys$input for010
$assign sys$output for009
$assign hf090407.dat for007
$assign hf090401.dat for001
$assign hf090402.dat for002
$assign hf090404.dat for004
$assign hf0904x.pun for011
$assign hf0904x.rrr for012
$assign hf0904x.dat for013
$assign hf0904xe.dat for014
$assign hf090431.dat for031
$assign hf090432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    9    5f v     s2 2p          2s2  2p
    9    5f v     s2 3p          2s2  3p
    9    5f v     s2 4p          2s2  4p
    9    5f v     s2 5p          2s2  5p
    9    5f v     s2 6p          2s2  6p
    9    5f v     s2 7p          2s2  7p
    9    5f v     s2 8p          2s2  8p
    9    5f v     s2 9p          2s2  9p
    9    5f v     p3             2s0  2p3  
    9    5f v     p2 3p          2s0  2p2  3p  
    9    5f v     p2 4p          2s0  2p2  4p  
    9    5f v     p2 5p          2s0  2p2  5p  
    9    5f v     p2 6p          2s0  2p2  6p  
    9    5f v     p2 7p          2s0  2p2  7p  
    9    5f v     p2 8p          2s0  2p2  8p  
    9    5f v     p2 9p          2s0  2p2  9p  
    9    5f v     s2 4f          2s2  4f
    9    5f v     s2 5f          2s2  5f
    9    5f v     s2 6f          2s2  6f
    9    5f v     s2 7f          2s2  7f
    9    5f v     s2 8f          2s2  8f
    9    5f v     s2 9f          2s2  9f
    9    5f v     p2 4f          2s0  2p2  4f  
    9    5f v     p2 5f          2s0  2p2  5f  
    9    5f v     p2 6f          2s0  2p2  6f  
    9    5f v     p2 7f          2s0  2p2  7f  
    9    5f v     p2 8f          2s0  2p2  8f  
    9    5f v     p2 9f          2s0  2p2  9f  
    9    5f v     s2 6h          2s2  6h
    9    5f v     s2 7h          2s2  7h
    9    5f v     s2 8h          2s2  8h
    9    5f v     s2 9h          2s2  9h
    9    5f v     p2 6h          2s0  2p2  6h  
    9    5f v     p2 7h          2s0  2p2  7h  
    9    5f v     p2 8h          2s0  2p2  8h  
    9    5f v     p2 9h          2s0  2p2  9h  
    9    5f v     sp 3s          2s   2p   3s
    9    5f v     sp 4s          2s   2p   4s
    9    5f v     sp 5s          2s   2p   5s
    9    5f v     sp 6s          2s   2p   6s
    9    5f v     sp 7s          2s   2p   7s
    9    5f v     sp 8s          2s   2p   8s
    9    5f v     sp 9s          2s   2p   9s
    9    5f v     sp 3d          2s   2p   3d
    9    5f v     sp 4d          2s   2p   4d
    9    5f v     sp 5d          2s   2p   5d
    9    5f v     sp 6d          2s   2p   6d
    9    5f v     sp 7d          2s   2p   7d
    9    5f v     sp 8d          2s   2p   8d
    9    5f v     sp 9d          2s   2p   9d
    9    5f v     s2 8k          2s2  8k
    9    5f v     s2 9k          2s2  9k
    9    5f v     p2 8k          2s0  2p2  8k  
    9    5f v     p2 9k          2s0  2p2  9k  
    9    5f v     s2 3s          2s2  3s
    9    5f v     s2 4s          2s2  4s
    9    5f v     s2 5s          2s2  5s
    9    5f v     s2 6s          2s2  6s
    9    5f v     s2 7s          2s2  7s
    9    5f v     s2 8s          2s2  8s
    9    5f v     s2 9s          2s2  9s
    9    5f v     p2 3s          2s0  2p2  3s  
    9    5f v     p2 4s          2s0  2p2  4s  
    9    5f v     p2 5s          2s0  2p2  5s  
    9    5f v     p2 6s          2s0  2p2  6s  
    9    5f v     p2 7s          2s0  2p2  7s  
    9    5f v     p2 8s          2s0  2p2  8s  
    9    5f v     p2 9s          2s0  2p2  9s  
    9    5f v     s2 3d          2s2  3d
    9    5f v     s2 4d          2s2  4d
    9    5f v     s2 5d          2s2  5d
    9    5f v     s2 6d          2s2  6d
    9    5f v     s2 7d          2s2  7d
    9    5f v     s2 8d          2s2  8d
    9    5f v     s2 9d          2s2  9d
    9    5f v     p2 3d          2s0  2p2  3d
    9    5f v     p2 4d          2s0  2p2  4d
    9    5f v     p2 5d          2s0  2p2  5d
    9    5f v     p2 6d          2s0  2p2  6d
    9    5f v     p2 7d          2s0  2p2  7d
    9    5f v     p2 8d          2s0  2p2  8d
    9    5f v     p2 9d          2s0  2p2  9d
    9    5f v     s2 5g          2s2  5g
    9    5f v     s2 6g          2s2  6g
    9    5f v     s2 7g          2s2  7g
    9    5f v     s2 8g          2s2  8g
    9    5f v     s2 9g          2s2  9g
    9    5f v     p2 5g          2s0  2p2  5g
    9    5f v     p2 6g          2s0  2p2  6g
    9    5f v     p2 7g          2s0  2p2  7g
    9    5f v     p2 8g          2s0  2p2  8g
    9    5f v     p2 9g          2s0  2p2  9g
    9    5f v     sp2            2s   2p2   
    9    5f v     sp 3p          2s   2p   3p
    9    5f v     sp 4p          2s   2p   4p
    9    5f v     sp 5p          2s   2p   5p
    9    5f v     sp 6p          2s   2p   6p
    9    5f v     sp 7p          2s   2p   7p
    9    5f v     sp 8p          2s   2p   8p
    9    5f v     sp 9p          2s   2p   9p
    9    5f v     sp 4f          2s   2p   4f
    9    5f v     sp 5f          2s   2p   5f
    9    5f v     sp 6f          2s   2p   6f
    9    5f v     sp 7f          2s   2p   7f
    9    5f v     sp 8f          2s   2p   8f
    9    5f v     sp 9f          2s   2p   9f
    9    5f v     s2 7i          2s2  7i
    9    5f v     s2 8i          2s2  8i
    9    5f v     s2 9i          2s2  9i
    9    5f v     p2 7i          2s0  2p2  7i
    9    5f v     p2 8i          2s0  2p2  8i
    9    5f v     p2 9i          2s0  2p2  9i
   -1
$run cray:rcn2c
$DELETE HF090401.DAT;*
$DELETE HF090402.DAT;*
$DELETE HF090404.DAT;*
$DELETE HF090431.DAT;*
$DELETE HF090432.DAT;*
