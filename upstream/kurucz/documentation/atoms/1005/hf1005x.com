$set def 1005
$assign sys$input for010
$assign sys$output for009
$assign hf100507.dat for007
$assign hf100501.dat for001
$assign hf100502.dat for002
$assign hf100504.dat for004
$assign hf1005x.pun for011
$assign hf1005x.rrr for012
$assign hf1005x.dat for013
$assign hf1005xe.dat for014
$assign hf100531.dat for031
$assign hf100532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   10    6ne vi   s2 2p          2s2  2p
   10    6ne vi   s2 3p          2s2  3p
   10    6ne vi   s2 4p          2s2  4p
   10    6ne vi   s2 5p          2s2  5p
   10    6ne vi   s2 6p          2s2  6p
   10    6ne vi   s2 7p          2s2  7p
   10    6ne vi   s2 8p          2s2  8p
   10    6ne vi   s2 9p          2s2  9p
   10    6ne vi   p3             2s0  2p3  
   10    6ne vi   p2 3p          2s0  2p2  3p  
   10    6ne vi   p2 4p          2s0  2p2  4p  
   10    6ne vi   p2 5p          2s0  2p2  5p  
   10    6ne vi   p2 6p          2s0  2p2  6p  
   10    6ne vi   p2 7p          2s0  2p2  7p  
   10    6ne vi   p2 8p          2s0  2p2  8p  
   10    6ne vi   p2 9p          2s0  2p2  9p  
   10    6ne vi   s2 4f          2s2  4f
   10    6ne vi   s2 5f          2s2  5f
   10    6ne vi   s2 6f          2s2  6f
   10    6ne vi   s2 7f          2s2  7f
   10    6ne vi   s2 8f          2s2  8f
   10    6ne vi   s2 9f          2s2  9f
   10    6ne vi   p2 4f          2s0  2p2  4f  
   10    6ne vi   p2 5f          2s0  2p2  5f  
   10    6ne vi   p2 6f          2s0  2p2  6f  
   10    6ne vi   p2 7f          2s0  2p2  7f  
   10    6ne vi   p2 8f          2s0  2p2  8f  
   10    6ne vi   p2 9f          2s0  2p2  9f  
   10    6ne vi   s2 6h          2s2  6h
   10    6ne vi   s2 7h          2s2  7h
   10    6ne vi   s2 8h          2s2  8h
   10    6ne vi   s2 9h          2s2  9h
   10    6ne vi   p2 6h          2s0  2p2  6h  
   10    6ne vi   p2 7h          2s0  2p2  7h  
   10    6ne vi   p2 8h          2s0  2p2  8h  
   10    6ne vi   p2 9h          2s0  2p2  9h  
   10    6ne vi   sp 3s          2s   2p   3s
   10    6ne vi   sp 4s          2s   2p   4s
   10    6ne vi   sp 5s          2s   2p   5s
   10    6ne vi   sp 6s          2s   2p   6s
   10    6ne vi   sp 7s          2s   2p   7s
   10    6ne vi   sp 8s          2s   2p   8s
   10    6ne vi   sp 9s          2s   2p   9s
   10    6ne vi   sp 3d          2s   2p   3d
   10    6ne vi   sp 4d          2s   2p   4d
   10    6ne vi   sp 5d          2s   2p   5d
   10    6ne vi   sp 6d          2s   2p   6d
   10    6ne vi   sp 7d          2s   2p   7d
   10    6ne vi   sp 8d          2s   2p   8d
   10    6ne vi   sp 9d          2s   2p   9d
   10    6ne vi   s2 8k          2s2  8k
   10    6ne vi   s2 9k          2s2  9k
   10    6ne vi   p2 8k          2s0  2p2  8k  
   10    6ne vi   p2 9k          2s0  2p2  9k  
   10    6ne vi   s2 3s          2s2  3s
   10    6ne vi   s2 4s          2s2  4s
   10    6ne vi   s2 5s          2s2  5s
   10    6ne vi   s2 6s          2s2  6s
   10    6ne vi   s2 7s          2s2  7s
   10    6ne vi   s2 8s          2s2  8s
   10    6ne vi   s2 9s          2s2  9s
   10    6ne vi   p2 3s          2s0  2p2  3s  
   10    6ne vi   p2 4s          2s0  2p2  4s  
   10    6ne vi   p2 5s          2s0  2p2  5s  
   10    6ne vi   p2 6s          2s0  2p2  6s  
   10    6ne vi   p2 7s          2s0  2p2  7s  
   10    6ne vi   p2 8s          2s0  2p2  8s  
   10    6ne vi   p2 9s          2s0  2p2  9s  
   10    6ne vi   s2 3d          2s2  3d
   10    6ne vi   s2 4d          2s2  4d
   10    6ne vi   s2 5d          2s2  5d
   10    6ne vi   s2 6d          2s2  6d
   10    6ne vi   s2 7d          2s2  7d
   10    6ne vi   s2 8d          2s2  8d
   10    6ne vi   s2 9d          2s2  9d
   10    6ne vi   p2 3d          2s0  2p2  3d
   10    6ne vi   p2 4d          2s0  2p2  4d
   10    6ne vi   p2 5d          2s0  2p2  5d
   10    6ne vi   p2 6d          2s0  2p2  6d
   10    6ne vi   p2 7d          2s0  2p2  7d
   10    6ne vi   p2 8d          2s0  2p2  8d
   10    6ne vi   p2 9d          2s0  2p2  9d
   10    6ne vi   s2 5g          2s2  5g
   10    6ne vi   s2 6g          2s2  6g
   10    6ne vi   s2 7g          2s2  7g
   10    6ne vi   s2 8g          2s2  8g
   10    6ne vi   s2 9g          2s2  9g
   10    6ne vi   p2 5g          2s0  2p2  5g
   10    6ne vi   p2 6g          2s0  2p2  6g
   10    6ne vi   p2 7g          2s0  2p2  7g
   10    6ne vi   p2 8g          2s0  2p2  8g
   10    6ne vi   p2 9g          2s0  2p2  9g
   10    6ne vi   sp2            2s   2p2   
   10    6ne vi   sp 3p          2s   2p   3p
   10    6ne vi   sp 4p          2s   2p   4p
   10    6ne vi   sp 5p          2s   2p   5p
   10    6ne vi   sp 6p          2s   2p   6p
   10    6ne vi   sp 7p          2s   2p   7p
   10    6ne vi   sp 8p          2s   2p   8p
   10    6ne vi   sp 9p          2s   2p   9p
   10    6ne vi   sp 4f          2s   2p   4f
   10    6ne vi   sp 5f          2s   2p   5f
   10    6ne vi   sp 6f          2s   2p   6f
   10    6ne vi   sp 7f          2s   2p   7f
   10    6ne vi   sp 8f          2s   2p   8f
   10    6ne vi   sp 9f          2s   2p   9f
   10    6ne vi   s2 7i          2s2  7i
   10    6ne vi   s2 8i          2s2  8i
   10    6ne vi   s2 9i          2s2  9i
   10    6ne vi   p2 7i          2s0  2p2  7i
   10    6ne vi   p2 8i          2s0  2p2  8i
   10    6ne vi   p2 9i          2s0  2p2  9i
   -1
$run cray:rcn2c
$DELETE HF100501.DAT;*
$DELETE HF100502.DAT;*
$DELETE HF100504.DAT;*
$DELETE HF100531.DAT;*
$DELETE HF100532.DAT;*
