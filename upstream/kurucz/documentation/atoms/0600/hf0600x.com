$set DEF 0600
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf060007.dat for007
$assign poolg:hf060001.dat for001
$assign poolg:hf060002.dat for002
$assign poolg:hf060004.dat for004
$assign hf0600x.pun for011
$assign hf0600x.rrr for012
$assign hf0600x.dat for013
$assign hf0600xe.dat for014
$assign poolg:hf060031.dat for031
$assign poolg:hf060032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    6    1c i   2p2              2s2  2p2
    6    1c i   2p3p             2s2  2p   3p
    6    1c i   2p4p             2s2  2p   4p
    6    1c i   2p5p             2s2  2p   5p
    6    1c i   2p6p             2s2  2p   6p
    6    1c i   2p7p             2s2  2p   7p
    6    1c i   2p8p             2s2  2p   8p
    6    1c i   2p9p             2s2  2p   9p
    6    1c i   2p10p            2s2  2p  10p
    6    1c i   2p11p            2s2  2p  11p
    6    1c i   2p12p            2s2  2p  12p
    6    1c i   2p4              2s0  2p4  
    6    1c i   2p3 3p           2s0  2p3  3p
    6    1c i   2p3 4p           2s0  2p3  4p
    6    1c i   2p3 5p           2s0  2p3  5p
    6    1c i   2p3 6p           2s0  2p3  6p
    6    1c i   2p3 7p           2s0  2p3  7p
    6    1c i   2p3 8p           2s0  2p3  8p
    6    1c i   2p3 9p           2s0  2p3  9p
    6    1c i   2p3 10p          2s0  2p3 10p
    6    1c i   2p3 11p          2s0  2p3 11p
    6    1c i   2p3 12p          2s0  2p3 12p
    6    1c i   2p4f             2s2  2p   4f
    6    1c i   2p5f             2s2  2p   5f
    6    1c i   2p6f             2s2  2p   6f
    6    1c i   2p7f             2s2  2p   7f
    6    1c i   2p8f             2s2  2p   8f
    6    1c i   2p9f             2s2  2p   9f
    6    1c i   2p10f            2s2  2p  10f
    6    1c i   2p11f            2s2  2p  11f
    6    1c i   2p12f            2s2  2p  12f
    6    1c i   2p3 4f           2s0  2p3  4f
    6    1c i   2p3 5f           2s0  2p3  5f
    6    1c i   2p3 6f           2s0  2p3  6f
    6    1c i   2p3 7f           2s0  2p3  7f
    6    1c i   2p3 8f           2s0  2p3  8f
    6    1c i   2p3 9f           2s0  2p3  9f
    6    1c i   2p3 10f          2s0  2p3 10f
    6    1c i   2p3 11f          2s0  2p3 11f
    6    1c i   2p3 12f          2s0  2p3 12f
    6    1c i   2p6h             2s2  2p   6h
    6    1c i   2p7h             2s2  2p   7h
    6    1c i   2p8h             2s2  2p   8h
    6    1c i   2p9h             2s2  2p   9h
    6    1c i   2p10h            2s2  2p  10h
    6    1c i   2p11h            2s2  2p  11h
    6    1c i   2p12h            2s2  2p  12h
    6    1c i   2p8k             2s2  2p   8k
    6    1c i   2p9k             2s2  2p   9k
    6    1c i   2p10k            2s2  2p  10k
    6    1c i   2p11k            2s2  2p  11k
    6    1c i   2p12k            2s2  2p  12k
    6    1c i   sp2 3s           2s   2p2  3s
    6    1c i   sp2 4s           2s   2p2  4s
    6    1c i   sp2 5s           2s   2p2  5s
    6    1c i   sp2 6s           2s   2p2  6s
    6    1c i   sp2 7s           2s   2p2  7s
    6    1c i   sp2 8s           2s   2p2  8s
    6    1c i   sp2 9s           2s   2p2  9s
    6    1c i   sp2 10s          2s   2p2 10s
    6    1c i   sp2 11s          2s   2p2 11s
    6    1c i   sp2 12s          2s   2p2 12s
    6    1c i   sp2 3d           2s   2p2  3d
    6    1c i   sp2 4d           2s   2p2  4d
    6    1c i   sp2 5d           2s   2p2  5d
    6    1c i   sp2 6d           2s   2p2  6d
    6    1c i   sp2 7d           2s   2p2  7d
    6    1c i   sp2 8d           2s   2p2  8d
    6    1c i   sp2 9d           2s   2p2  9d
    6    1c i   sp2 10d          2s   2p2 10d
    6    1c i   sp2 11d          2s   2p2 11d
    6    1c i   sp2 12d          2s   2p2 12d
    6    1c i   2p3s             2s2  2p   3s
    6    1c i   2p4s             2s2  2p   4s
    6    1c i   2p5s             2s2  2p   5s
    6    1c i   2p6s             2s2  2p   6s
    6    1c i   2p7s             2s2  2p   7s
    6    1c i   2p8s             2s2  2p   8s
    6    1c i   2p9s             2s2  2p   9s
    6    1c i   2p10s            2s2  2p  10s
    6    1c i   2p11s            2s2  2p  11s
    6    1c i   2p12s            2s2  2p  12s
    6    1c i   2p3 3s           2s0  2p3  3s
    6    1c i   2p3 4s           2s0  2p3  4s
    6    1c i   2p3 5s           2s0  2p3  5s
    6    1c i   2p3 6s           2s0  2p3  6s
    6    1c i   2p3 7s           2s0  2p3  7s
    6    1c i   2p3 8s           2s0  2p3  8s
    6    1c i   2p3 9s           2s0  2p3  9s
    6    1c i   2p3 10s          2s0  2p3 10s
    6    1c i   2p3 11s          2s0  2p3 11s
    6    1c i   2p3 12s          2s0  2p3 12s
    6    1c i   2p3d             2s2  2p   3d
    6    1c i   2p4d             2s2  2p   4d
    6    1c i   2p5d             2s2  2p   5d
    6    1c i   2p6d             2s2  2p   6d
    6    1c i   2p7d             2s2  2p   7d
    6    1c i   2p8d             2s2  2p   8d
    6    1c i   2p9d             2s2  2p   9d
    6    1c i   2p10d            2s2  2p  10d
    6    1c i   2p11d            2s2  2p  11d
    6    1c i   2p12d            2s2  2p  12d
    6    1c i   2p3 3d           2s0  2p3  3d
    6    1c i   2p3 4d           2s0  2p3  4d
    6    1c i   2p3 5d           2s0  2p3  5d
    6    1c i   2p3 6d           2s0  2p3  6d
    6    1c i   2p3 7d           2s0  2p3  7d
    6    1c i   2p3 8d           2s0  2p3  8d
    6    1c i   2p3 9d           2s0  2p3  9d
    6    1c i   2p3 10d          2s0  2p3 10d
    6    1c i   2p3 11d          2s0  2p3 11d
    6    1c i   2p3 12d          2s0  2p3 12d
    6    1c i   2p5g             2s2  2p   5g
    6    1c i   2p6g             2s2  2p   6g
    6    1c i   2p7g             2s2  2p   7g
    6    1c i   2p8g             2s2  2p   8g
    6    1c i   2p9g             2s2  2p   9g
    6    1c i   2p10g            2s2  2p  10g
    6    1c i   2p11g            2s2  2p  11g
    6    1c i   2p12g            2s2  2p  12g
    6    1c i   2p7i             2s2  2p   7i
    6    1c i   2p8i             2s2  2p   8i
    6    1c i   2p9i             2s2  2p   9i
    6    1c i   2p10i            2s2  2p  10i
    6    1c i   2p11i            2s2  2p  11i
    6    1c i   2p12i            2s2  2p  12i
    6    1c i   sp3              2s   2p3  
    6    1c i   sp2 3p           2s   2p2  3p
    6    1c i   sp2 4p           2s   2p2  4p
    6    1c i   sp2 5p           2s   2p2  5p
    6    1c i   sp2 6p           2s   2p2  6p
    6    1c i   sp2 7p           2s   2p2  7p
    6    1c i   sp2 8p           2s   2p2  8p
    6    1c i   sp2 9p           2s   2p2  9p
    6    1c i   sp2 10p          2s   2p2 10p
    6    1c i   sp2 11p          2s   2p2 11p
    6    1c i   sp2 12p          2s   2p2 12p
    6    1c i   sp2 4f           2s   2p2  4f
    6    1c i   sp2 5f           2s   2p2  5f
    6    1c i   sp2 6f           2s   2p2  6f
    6    1c i   sp2 7f           2s   2p2  7f
    6    1c i   sp2 8f           2s   2p2  8f
    6    1c i   sp2 9f           2s   2p2  9f
    6    1c i   sp2 10f          2s   2p2 10f
    6    1c i   sp2 11f          2s   2p2 11f
    6    1c i   sp2 12f          2s   2p2 12f
   -1
$run cray:rcn2c
$DELETE POOLG:HF060001.DAT;*
$DELETE POOLG:HF060002.DAT;*
$DELETE POOLG:HF060004.DAT;*
$DELETE POOLG:HF060031.DAT;*
$DELETE POOLG:HF060032.DAT;*
