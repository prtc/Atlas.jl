$set def 0500
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf050007.dat for007
$assign poolg:hf050001.dat for001
$assign poolg:hf050002.dat for002
$assign poolg:hf050004.dat for004
$assign hf0500x.pun for011
$assign hf0500x.rrr for012
$assign hf0500x.dat for013
$assign hf0500ex.dat for014
$assign poolg:hf050031.dat for031
$assign poolg:hf050032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    5    1b i   s2 2p            1s2  2s2  2p
    5    1b i   s2 3p            1s2  2s2  3p
    5    1b i   s2 4p            1s2  2s2  4p
    5    1b i   s2 5p            1s2  2s2  5p
    5    1b i   s2 6p            1s2  2s2  6p
    5    1b i   s2 7p            1s2  2s2  7p
    5    1b i   s2 8p            1s2  2s2  8p
    5    1b i   s2 9p            1s2  2s2  9p
    5    1b i   s2 10p           1s2  2s2 10p
    5    1b i   s2 11p           1s2  2s2 11p
    5    1b i   s2 12p           1s2  2s2 12p
    5    1b i   p3               1s2  2s0  2p3  
    5    1b i   p2 3p            1s2  2s0  2p2  3p
    5    1b i   p2 4p            1s2  2s0  2p2  4p
    5    1b i   p2 5p            1s2  2s0  2p2  5p
    5    1b i   p2 6p            1s2  2s0  2p2  6p
    5    1b i   p2 7p            1s2  2s0  2p2  7p
    5    1b i   p2 8p            1s2  2s0  2p2  8p
    5    1b i   p2 9p            1s2  2s0  2p2  9p
    5    1b i   p2 10p           1s2  2s0  2p2 10p
    5    1b i   p2 11p           1s2  2s0  2p2 11p
    5    1b i   p2 12p           1s2  2s0  2p2 12p
    5    1b i   s2 4f            1s2  2s2  4f
    5    1b i   s2 5f            1s2  2s2  5f
    5    1b i   s2 6f            1s2  2s2  6f
    5    1b i   s2 7f            1s2  2s2  7f
    5    1b i   s2 8f            1s2  2s2  8f
    5    1b i   s2 9f            1s2  2s2  9f
    5    1b i   s2 10f           1s2  2s2 10f
    5    1b i   s2 11f           1s2  2s2 11f
    5    1b i   p2 3f            1s2  2s0  2p2  3f
    5    1b i   p2 4f            1s2  2s0  2p2  4f
    5    1b i   p2 5f            1s2  2s0  2p2  5f
    5    1b i   p2 6f            1s2  2s0  2p2  6f
    5    1b i   p2 7f            1s2  2s0  2p2  7f
    5    1b i   p2 8f            1s2  2s0  2p2  8f
    5    1b i   p2 9f            1s2  2s0  2p2  9f
    5    1b i   p2 10f           1s2  2s0  2p2 10f
    5    1b i   p2 11f           1s2  2s0  2p2 11f
    5    1b i   s2 6h            1s2  2s2  6h
    5    1b i   s2 7h            1s2  2s2  7h
    5    1b i   s2 8h            1s2  2s2  8h
    5    1b i   s2 9h            1s2  2s2  9h
    5    1b i   s2 8k            1s2  2s2  8k
    5    1b i   s2 9k            1s2  2s2  9k
    5    1b i   sp3s             1s2  2s   2p   3s
    5    1b i   sp4s             1s2  2s   2p   4s
    5    1b i   sp5s             1s2  2s   2p   5s
    5    1b i   sp6s             1s2  2s   2p   6s
    5    1b i   sp7s             1s2  2s   2p   7s
    5    1b i   sp8s             1s2  2s   2p   8s
    5    1b i   sp9s             1s2  2s   2p   9s
    5    1b i   sp10s            1s2  2s   2p  10s
    5    1b i   sp11s            1s2  2s   2p  11s
    5    1b i   sp12s            1s2  2s   2p  12s
    5    1b i   sp3d             1s2  2s   2p   3d
    5    1b i   sp4d             1s2  2s   2p   4d
    5    1b i   sp5d             1s2  2s   2p   5d
    5    1b i   sp6d             1s2  2s   2p   6d
    5    1b i   sp7d             1s2  2s   2p   7d
    5    1b i   sp8d             1s2  2s   2p   8d
    5    1b i   sp9d             1s2  2s   2p   9d
    5    1b i   sp10d            1s2  2s   2p  10d
    5    1b i   sp11d            1s2  2s   2p  11d
    5    1b i   sp12d            1s2  2s   2p  12d
    5    1b i   s2 3s            1s2  2s2  3s
    5    1b i   s2 4s            1s2  2s2  4s
    5    1b i   s2 5s            1s2  2s2  5s
    5    1b i   s2 6s            1s2  2s2  6s
    5    1b i   s2 7s            1s2  2s2  7s
    5    1b i   s2 8s            1s2  2s2  8s
    5    1b i   s2 9s            1s2  2s2  9s
    5    1b i   s2 10s           1s2  2s2 10s
    5    1b i   s2 11s           1s2  2s2 11s
    5    1b i   s2 12s           1s2  2s2 12s
    5    1b i   p2 3s            1s2  2s0  2p2  3s
    5    1b i   p2 4s            1s2  2s0  2p2  4s
    5    1b i   p2 5s            1s2  2s0  2p2  5s
    5    1b i   p2 6s            1s2  2s0  2p2  6s
    5    1b i   p2 7s            1s2  2s0  2p2  7s
    5    1b i   p2 8s            1s2  2s0  2p2  8s
    5    1b i   p2 9s            1s2  2s0  2p2  9s
    5    1b i   p2 10s           1s2  2s0  2p2 10s
    5    1b i   p2 11s           1s2  2s0  2p2 11s
    5    1b i   p2 12s           1s2  2s0  2p2 12s
    5    1b i   s2 3d            1s2  2s2  3d
    5    1b i   s2 4d            1s2  2s2  4d
    5    1b i   s2 5d            1s2  2s2  5d
    5    1b i   s2 6d            1s2  2s2  6d
    5    1b i   s2 7d            1s2  2s2  7d
    5    1b i   s2 8d            1s2  2s2  8d
    5    1b i   s2 9d            1s2  2s2  9d
    5    1b i   s2 10d           1s2  2s2 10d
    5    1b i   s2 11d           1s2  2s2 11d
    5    1b i   s2 12d           1s2  2s2 12d
    5    1b i   p2 3d            1s2  2s0  2p2  3d
    5    1b i   p2 4d            1s2  2s0  2p2  4d
    5    1b i   p2 5d            1s2  2s0  2p2  5d
    5    1b i   p2 6d            1s2  2s0  2p2  6d
    5    1b i   p2 7d            1s2  2s0  2p2  7d
    5    1b i   p2 8d            1s2  2s0  2p2  8d
    5    1b i   p2 9d            1s2  2s0  2p2  9d
    5    1b i   p2 10d           1s2  2s0  2p2 10d
    5    1b i   p2 11d           1s2  2s0  2p2 11d
    5    1b i   p2 12d           1s2  2s0  2p2 12d
    5    1b i   s2 5g            1s2  2s2  5g
    5    1b i   s2 6g            1s2  2s2  6g
    5    1b i   s2 7g            1s2  2s2  7g
    5    1b i   s2 8g            1s2  2s2  8g
    5    1b i   s2 9g            1s2  2s2  9g
    5    1b i   s2 7i            1s2  2s2  7i
    5    1b i   s2 8i            1s2  2s2  8i
    5    1b i   s2 9i            1s2  2s2  9i
    5    1b i   sp2              1s2  2s   2p2  
    5    1b i   sp3p             1s2  2s   2p   3p
    5    1b i   sp4p             1s2  2s   2p   4p
    5    1b i   sp5p             1s2  2s   2p   5p
    5    1b i   sp6p             1s2  2s   2p   6p
    5    1b i   sp7p             1s2  2s   2p   7p
    5    1b i   sp8p             1s2  2s   2p   8p
    5    1b i   sp9p             1s2  2s   2p   9p
    5    1b i   sp10p            1s2  2s   2p  10p
    5    1b i   sp11p            1s2  2s   2p  11p
    5    1b i   sp4f             1s2  2s   2p   4f
    5    1b i   sp5f             1s2  2s   2p   5f
    5    1b i   sp6f             1s2  2s   2p   6f
    5    1b i   sp7f             1s2  2s   2p   7f
    5    1b i   sp8f             1s2  2s   2p   8f
    5    1b i   sp9f             1s2  2s   2p   9f
    5    1b i   sp10f            1s2  2s   2p  10f
   -1
    5    1b i   ss2p2            1s   2s2  2p2  
   -1
$run cray:rcn2c
$DELETE POOLG:HF050001.DAT;*
$DELETE POOLG:HF050002.DAT;*
$DELETE POOLG:HF050004.DAT;*
$DELETE POOLG:HF050031.DAT;*
$DELETE POOLG:HF050032.DAT;*
