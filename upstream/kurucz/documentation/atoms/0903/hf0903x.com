$set def 0903
$assign sys$input for010
$assign sys$output for009
$assign hf090307.dat for007
$assign hf090301.dat for001
$assign hf090302.dat for002
$assign hf090304.dat for004
$assign hf0903x.pun for011
$assign hf0903x.rrr for012
$assign hf0903x.dat for013
$assign hf0903xe.dat for014
$assign hf090331.dat for031
$assign hf090332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    9    4f iv  2p2              2s2  2p2
    9    4f iv  2p3p             2s2  2p   3p
    9    4f iv  2p4p             2s2  2p   4p
    9    4f iv  2p5p             2s2  2p   5p
    9    4f iv  2p6p             2s2  2p   6p
    9    4f iv  2p7p             2s2  2p   7p
    9    4f iv  2p8p             2s2  2p   8p
    9    4f iv  2p9p             2s2  2p   9p
    9    4f iv  2p10p            2s2  2p  10p
    9    4f iv  2p11p            2s2  2p  11p
    9    4f iv  2p4              2s0  2p4  
    9    4f iv  2p3 3p           2s0  2p3  3p
    9    4f iv  2p3 4p           2s0  2p3  4p
    9    4f iv  2p3 5p           2s0  2p3  5p
    9    4f iv  2p3 6p           2s0  2p3  6p
    9    4f iv  2p3 7p           2s0  2p3  7p
    9    4f iv  2p3 8p           2s0  2p3  8p
    9    4f iv  2p3 9p           2s0  2p3  9p
    9    4f iv  2p3 10p          2s0  2p3 10p
    9    4f iv  2p3 11p          2s0  2p3 11p
    9    4f iv  2p4f             2s2  2p   4f
    9    4f iv  2p5f             2s2  2p   5f
    9    4f iv  2p6f             2s2  2p   6f
    9    4f iv  2p7f             2s2  2p   7f
    9    4f iv  2p8f             2s2  2p   8f
    9    4f iv  2p9f             2s2  2p   9f
    9    4f iv  2p10f            2s2  2p  10f
    9    4f iv  2p11f            2s2  2p  11f
    9    4f iv  2p3 4f           2s0  2p3  4f
    9    4f iv  2p3 5f           2s0  2p3  5f
    9    4f iv  2p3 6f           2s0  2p3  6f
    9    4f iv  2p3 7f           2s0  2p3  7f
    9    4f iv  2p3 8f           2s0  2p3  8f
    9    4f iv  2p3 9f           2s0  2p3  9f
    9    4f iv  2p3 10f          2s0  2p3 10f
    9    4f iv  2p3 11f          2s0  2p3 11f
    9    4f iv  2p6h             2s2  2p   6h
    9    4f iv  2p7h             2s2  2p   7h
    9    4f iv  2p8h             2s2  2p   8h
    9    4f iv  2p9h             2s2  2p   9h
    9    4f iv  2p10h            2s2  2p  10h
    9    4f iv  2p8k             2s2  2p   8k
    9    4f iv  2p9k             2s2  2p   9k
    9    4f iv  sp2 3s           2s   2p2  3s
    9    4f iv  sp2 4s           2s   2p2  4s
    9    4f iv  sp2 5s           2s   2p2  5s
    9    4f iv  sp2 6s           2s   2p2  6s
    9    4f iv  sp2 7s           2s   2p2  7s
    9    4f iv  sp2 8s           2s   2p2  8s
    9    4f iv  sp2 9s           2s   2p2  9s
    9    4f iv  sp2 10s          2s   2p2 10s
    9    4f iv  sp2 11s          2s   2p2 11s
    9    4f iv  sp2 3d           2s   2p2  3d
    9    4f iv  sp2 4d           2s   2p2  4d
    9    4f iv  sp2 5d           2s   2p2  5d
    9    4f iv  sp2 6d           2s   2p2  6d
    9    4f iv  sp2 7d           2s   2p2  7d
    9    4f iv  sp2 8d           2s   2p2  8d
    9    4f iv  sp2 9d           2s   2p2  9d
    9    4f iv  sp2 10d          2s   2p2 10d
    9    4f iv  sp2 11d          2s   2p2 11d
    9    4f iv  2p3s             2s2  2p   3s
    9    4f iv  2p4s             2s2  2p   4s
    9    4f iv  2p5s             2s2  2p   5s
    9    4f iv  2p6s             2s2  2p   6s
    9    4f iv  2p7s             2s2  2p   7s
    9    4f iv  2p8s             2s2  2p   8s
    9    4f iv  2p9s             2s2  2p   9s
    9    4f iv  2p10s            2s2  2p  10s
    9    4f iv  2p11s            2s2  2p  11s
    9    4f iv  2p3 3s           2s0  2p3  3s
    9    4f iv  2p3 4s           2s0  2p3  4s
    9    4f iv  2p3 5s           2s0  2p3  5s
    9    4f iv  2p3 6s           2s0  2p3  6s
    9    4f iv  2p3 7s           2s0  2p3  7s
    9    4f iv  2p3 8s           2s0  2p3  8s
    9    4f iv  2p3 9s           2s0  2p3  9s
    9    4f iv  2p3 10s          2s0  2p3 10s
    9    4f iv  2p3 11s          2s0  2p3 11s
    9    4f iv  2p3d             2s2  2p   3d
    9    4f iv  2p4d             2s2  2p   4d
    9    4f iv  2p5d             2s2  2p   5d
    9    4f iv  2p6d             2s2  2p   6d
    9    4f iv  2p7d             2s2  2p   7d
    9    4f iv  2p8d             2s2  2p   8d
    9    4f iv  2p9d             2s2  2p   9d
    9    4f iv  2p10d            2s2  2p  10d
    9    4f iv  2p11d            2s2  2p  11d
    9    4f iv  2p3 3d           2s0  2p3  3d
    9    4f iv  2p3 4d           2s0  2p3  4d
    9    4f iv  2p3 5d           2s0  2p3  5d
    9    4f iv  2p3 6d           2s0  2p3  6d
    9    4f iv  2p3 7d           2s0  2p3  7d
    9    4f iv  2p3 8d           2s0  2p3  8d
    9    4f iv  2p3 9d           2s0  2p3  9d
    9    4f iv  2p3 10d          2s0  2p3 10d
    9    4f iv  2p3 11d          2s0  2p3 11d
    9    4f iv  2p5g             2s2  2p   5g
    9    4f iv  2p6g             2s2  2p   6g
    9    4f iv  2p7g             2s2  2p   7g
    9    4f iv  2p8g             2s2  2p   8g
    9    4f iv  2p9g             2s2  2p   9g
    9    4f iv  2p7i             2s2  2p   7i
    9    4f iv  2p8i             2s2  2p   8i
    9    4f iv  2p9i             2s2  2p   9i
    9    4f iv  sp3              2s   2p3  
    9    4f iv  sp2 3p           2s   2p2  3p
    9    4f iv  sp2 4p           2s   2p2  4p
    9    4f iv  sp2 5p           2s   2p2  5p
    9    4f iv  sp2 6p           2s   2p2  6p
    9    4f iv  sp2 7p           2s   2p2  7p
    9    4f iv  sp2 8p           2s   2p2  8p
    9    4f iv  sp2 9p           2s   2p2  9p
    9    4f iv  sp2 10p          2s   2p2 10p
    9    4f iv  sp2 11p          2s   2p2 11p
    9    4f iv  sp2 4f           2s   2p2  4f
    9    4f iv  sp2 5f           2s   2p2  5f
    9    4f iv  sp2 6f           2s   2p2  6f
    9    4f iv  sp2 7f           2s   2p2  7f
    9    4f iv  sp2 8f           2s   2p2  8f
    9    4f iv  sp2 9f           2s   2p2  9f
    9    4f iv  sp2 10f          2s   2p2 10f
   -1
$run cray:rcn2c
$DELETE HF090301.DAT;*
$DELETE HF090302.DAT;*
$DELETE HF090304.DAT;*
$DELETE HF090331.DAT;*
$DELETE HF090332.DAT;*
