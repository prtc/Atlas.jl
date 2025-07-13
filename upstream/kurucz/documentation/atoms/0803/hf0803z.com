$set def 0803
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf080307.dat for007
$assign poolg:hf080301.dat for001
$assign poolg:hf080302.dat for002
$assign poolg:hf080304.dat for004
$assign hf0803z.pun for011
$assign hf0803z.rrr for012
$assign hf0803z.dat for013
$assign hf0803ze.dat for014
$assign poolg:hf080331.dat for031
$assign poolg:hf080332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    8    4o iv    s2 2p          2s2  2p
    8    4o iv    s2 3p          2s2  3p
    8    4o iv    s2 4p          2s2  4p
    8    4o iv    s2 5p          2s2  5p
    8    4o iv    s2 6p          2s2  6p
    8    4o iv    s2 7p          2s2  7p
    8    4o iv    s2 8p          2s2  8p
    8    4o iv    s2 9p          2s2  9p
    8    4o iv    p3             2s0  2p3  
    8    4o iv    p2 3p          2s0  2p2  3p  
    8    4o iv    p2 4p          2s0  2p2  4p  
    8    4o iv    p2 5p          2s0  2p2  5p  
    8    4o iv    p2 6p          2s0  2p2  6p  
    8    4o iv    p2 7p          2s0  2p2  7p  
    8    4o iv    p2 8p          2s0  2p2  8p  
    8    4o iv    p2 9p          2s0  2p2  9p  
    8    4o iv    s2 4f          2s2  4f
    8    4o iv    s2 5f          2s2  5f
    8    4o iv    s2 6f          2s2  6f
    8    4o iv    s2 7f          2s2  7f
    8    4o iv    s2 8f          2s2  8f
    8    4o iv    s2 9f          2s2  9f
    8    4o iv    p2 4f          2s0  2p2  4f  
    8    4o iv    p2 5f          2s0  2p2  5f  
    8    4o iv    p2 6f          2s0  2p2  6f  
    8    4o iv    p2 7f          2s0  2p2  7f  
    8    4o iv    p2 8f          2s0  2p2  8f  
    8    4o iv    p2 9f          2s0  2p2  9f  
    8    4o iv    s2 6h          2s2  6h
    8    4o iv    s2 7h          2s2  7h
    8    4o iv    s2 8h          2s2  8h
    8    4o iv    s2 9h          2s2  9h
    8    4o iv    p2 6h          2p2  6h
    8    4o iv    p2 7h          2p2  7h
    8    4o iv    p2 8h          2p2  8h
    8    4o iv    p2 9h          2p2  9h
    8    4o iv    sp 3s          2s   2p   3s
    8    4o iv    sp 4s          2s   2p   4s
    8    4o iv    sp 5s          2s   2p   5s
    8    4o iv    sp 6s          2s   2p   6s
    8    4o iv    sp 7s          2s   2p   7s
    8    4o iv    sp 8s          2s   2p   8s
    8    4o iv    sp 9s          2s   2p   9s
    8    4o iv    sp 3d          2s   2p   3d
    8    4o iv    sp 4d          2s   2p   4d
    8    4o iv    sp 5d          2s   2p   5d
    8    4o iv    sp 6d          2s   2p   6d
    8    4o iv    sp 7d          2s   2p   7d
    8    4o iv    sp 8d          2s   2p   8d
    8    4o iv    sp 9d          2s   2p   9d
    8    4o iv    s2 8k          2s2  8k
    8    4o iv    s2 9k          2s2  9k
    8    4o iv    p2 8k          2p2  8k
    8    4o iv    p2 9k          2p2  9k
    8    4o iv    s2 3s          2s2  3s
    8    4o iv    s2 4s          2s2  4s
    8    4o iv    s2 5s          2s2  5s
    8    4o iv    s2 6s          2s2  6s
    8    4o iv    s2 7s          2s2  7s
    8    4o iv    s2 8s          2s2  8s
    8    4o iv    s2 9s          2s2  9s
    8    4o iv    p2 3s          2s0  2p2  3s  
    8    4o iv    p2 4s          2s0  2p2  4s  
    8    4o iv    p2 5s          2s0  2p2  5s  
    8    4o iv    p2 6s          2s0  2p2  6s  
    8    4o iv    p2 7s          2s0  2p2  7s  
    8    4o iv    p2 8s          2s0  2p2  8s  
    8    4o iv    p2 9s          2s0  2p2  9s  
    8    4o iv    s2 3d          2s2  3d
    8    4o iv    s2 4d          2s2  4d
    8    4o iv    s2 5d          2s2  5d
    8    4o iv    s2 6d          2s2  6d
    8    4o iv    s2 7d          2s2  7d
    8    4o iv    s2 8d          2s2  8d
    8    4o iv    s2 9d          2s2  9d
    8    4o iv    p2 3d          2s0  2p2  3d
    8    4o iv    p2 4d          2s0  2p2  4d
    8    4o iv    p2 5d          2s0  2p2  5d
    8    4o iv    p2 6d          2s0  2p2  6d
    8    4o iv    p2 7d          2s0  2p2  7d
    8    4o iv    p2 8d          2s0  2p2  8d
    8    4o iv    p2 9d          2s0  2p2  9d
    8    4o iv    s2 5g          2s2  5g
    8    4o iv    s2 6g          2s2  6g
    8    4o iv    s2 7g          2s2  7g
    8    4o iv    s2 8g          2s2  8g
    8    4o iv    s2 9g          2s2  9g
    8    4o iv    p2 5g          2p2  5g
    8    4o iv    p2 6g          2p2  6g
    8    4o iv    p2 7g          2p2  7g
    8    4o iv    p2 8g          2p2  8g
    8    4o iv    p2 9g          2p2  9g
    8    4o iv    sp2            2s   2p2   
    8    4o iv    sp 3p          2s   2p   3p
    8    4o iv    sp 4p          2s   2p   4p
    8    4o iv    sp 5p          2s   2p   5p
    8    4o iv    sp 6p          2s   2p   6p
    8    4o iv    sp 7p          2s   2p   7p
    8    4o iv    sp 8p          2s   2p   8p
    8    4o iv    sp 9p          2s   2p   9p
    8    4o iv    sp 4f          2s   2p   4f
    8    4o iv    sp 5f          2s   2p   5f
    8    4o iv    sp 6f          2s   2p   6f
    8    4o iv    sp 7f          2s   2p   7f
    8    4o iv    sp 8f          2s   2p   8f
    8    4o iv    sp 9f          2s   2p   9f
    8    4o iv    s2 7i          2s2  7i
    8    4o iv    s2 8i          2s2  8i
    8    4o iv    s2 9i          2s2  9i
    8    4o iv    p2 7i          2p2  7i
    8    4o iv    p2 8i          2p2  8i
    8    4o iv    p2 9i          2p2  9i
   -1
$run cray:rcn2c
$DELETE POOLG:HF080301.DAT;*
$DELETE POOLG:HF080302.DAT;*
$DELETE POOLG:HF080304.DAT;*
$DELETE POOLG:HF080331.DAT;*
$DELETE POOLG:HF080332.DAT;*
