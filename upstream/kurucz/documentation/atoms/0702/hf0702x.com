$set def 0702
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf070207.dat for007
$assign poolg:hf070201.dat for001
$assign poolg:hf070202.dat for002
$assign poolg:hf070204.dat for004
$assign hf0702X.pun for011
$assign hf0702X.rrr for012
$assign hf0702X.dat for013
$assign hf0702eX.dat for014
$assign poolg:hf070231.dat for031
$assign poolg:hf070232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    7    3n iii s2 2p            1s2  2s2  2p
    7    3n iii s2 3p            1s2  2s2  3p
    7    3n iii s2 4p            1s2  2s2  4p
    7    3n iii s2 5p            1s2  2s2  5p
    7    3n iii s2 6p            1s2  2s2  6p
    7    3n iii s2 7p            1s2  2s2  7p
    7    3n iii s2 8p            1s2  2s2  8p
    7    3n iii s2 9p            1s2  2s2  9p
    7    3n iii s2 10p           1s2  2s2 10p
    7    3n iii s2 11p           1s2  2s2 11p
    7    3n iii s2 12p           1s2  2s2 12p
    7    3n iii s2 13p           1s2  2s2 13p
    7    3n iii s2 14p           1s2  2s2 14p
    7    3n iii p3               1s2  2s0  2p3  
    7    3n iii p2 3p            1s2  2s0  2p2  3p
    7    3n iii p2 4p            1s2  2s0  2p2  4p
    7    3n iii p2 5p            1s2  2s0  2p2  5p
    7    3n iii p2 6p            1s2  2s0  2p2  6p
    7    3n iii p2 7p            1s2  2s0  2p2  7p
    7    3n iii p2 8p            1s2  2s0  2p2  8p
    7    3n iii p2 9p            1s2  2s0  2p2  9p
    7    3n iii p2 10p           1s2  2s0  2p2 10p
    7    3n iii p2 11p           1s2  2s0  2p2 11p
    7    3n iii p2 12p           1s2  2s0  2p2 12p
    7    3n iii p2 13p           1s2  2s0  2p2 13p
    7    3n iii p2 14p           1s2  2s0  2p2 14p
    7    3n iii s2 4f            1s2  2s2  4f
    7    3n iii s2 5f            1s2  2s2  5f
    7    3n iii s2 6f            1s2  2s2  6f
    7    3n iii s2 7f            1s2  2s2  7f
    7    3n iii s2 8f            1s2  2s2  8f
    7    3n iii s2 9f            1s2  2s2  9f
    7    3n iii s2 10f           1s2  2s2 10f
    7    3n iii s2 11f           1s2  2s2 11F
    7    3n iii s2 12f           1s2  2s2 12f
    7    3n iii s2 13f           1s2  2s2 13f
    7    3n iii s2 14f           1s2  2s2 14f
    7    3n iii p2 4f            1s2  2s0  2p2  4f
    7    3n iii p2 5f            1s2  2s0  2p2  5f
    7    3n iii p2 6f            1s2  2s0  2p2  6f
    7    3n iii p2 7f            1s2  2s0  2p2  7f
    7    3n iii p2 8f            1s2  2s0  2p2  8f
    7    3n iii p2 9f            1s2  2s0  2p2  9f
    7    3n iii p2 10f           1s2  2s0  2p2 10f
    7    3n iii p2 11f           1s2  2s0  2p2 11f
    7    3n iii p2 12f           1s2  2s0  2p2 12f
    7    3n iii p2 13f           1s2  2s0  2p2 13f
    7    3n iii p2 14f           1s2  2s0  2p2 14f
    7    3n iii s2 6h            1s2  2s2  6h
    7    3n iii s2 7h            1s2  2s2  7h
    7    3n iii s2 8h            1s2  2s2  8h
    7    3n iii s2 9h            1s2  2s2  9h
    7    3n iii s2 8k            1s2  2s2  8k
    7    3n iii s2 9k            1s2  2s2  9k
    7    3n iii sp3s             1s2  2s   2p   3s
    7    3n iii sp4s             1s2  2s   2p   4s
    7    3n iii sp5s             1s2  2s   2p   5s
    7    3n iii sp6s             1s2  2s   2p   6s
    7    3n iii sp7s             1s2  2s   2p   7s
    7    3n iii sp8s             1s2  2s   2p   8s
    7    3n iii sp9s             1s2  2s   2p   9s
    7    3n iii sp10s            1s2  2s   2p  10s
    7    3n iii sp11s            1s2  2s   2p  11s
    7    3n iii sp12s            1s2  2s   2p  12s
    7    3n iii sp13s            1s2  2s   2p  13s
    7    3n iii sp14s            1s2  2s   2p  14s
    7    3n iii sp3d             1s2  2s   2p   3d
    7    3n iii sp4d             1s2  2s   2p   4d
    7    3n iii sp5d             1s2  2s   2p   5d
    7    3n iii sp6d             1s2  2s   2p   6d
    7    3n iii sp7d             1s2  2s   2p   7d
    7    3n iii sp8d             1s2  2s   2p   8d
    7    3n iii sp9d             1s2  2s   2p   9d
    7    3n iii sp10d            1s2  2s   2p  10d
    7    3n iii sp11d            1s2  2s   2p  11d
    7    3n iii sp12d            1s2  2s   2p  12d
    7    3n iii sp13d            1s2  2s   2p  13d
    7    3n iii sp14d            1s2  2s   2p  14d
    7    3n iii s2 3s            1s2  2s2  3s
    7    3n iii s2 4s            1s2  2s2  4s
    7    3n iii s2 5s            1s2  2s2  5s
    7    3n iii s2 6s            1s2  2s2  6s
    7    3n iii s2 7s            1s2  2s2  7s
    7    3n iii s2 8s            1s2  2s2  8s
    7    3n iii s2 9s            1s2  2s2  9s
    7    3n iii s2 10s           1s2  2s2 10s
    7    3n iii s2 11s           1s2  2s2 11s
    7    3n iii s2 12s           1s2  2s2 12s
    7    3n iii s2 13s           1s2  2s2 13s
    7    3n iii s2 14s           1s2  2s2 14s
    7    3n iii p2 3s            1s2  2s0  2p2  3s
    7    3n iii p2 4s            1s2  2s0  2p2  4s
    7    3n iii p2 5s            1s2  2s0  2p2  5s
    7    3n iii p2 6s            1s2  2s0  2p2  6s
    7    3n iii p2 7s            1s2  2s0  2p2  7s
    7    3n iii p2 8s            1s2  2s0  2p2  8s
    7    3n iii p2 9s            1s2  2s0  2p2  9s
    7    3n iii p2 10s           1s2  2s0  2p2 10s
    7    3n iii p2 11s           1s2  2s0  2p2 11s
    7    3n iii p2 12s           1s2  2s0  2p2 12s
    7    3n iii p2 13s           1s2  2s0  2p2 13s
    7    3n iii p2 14s           1s2  2s0  2p2 14s
    7    3n iii s2 3d            1s2  2s2  3d
    7    3n iii s2 4d            1s2  2s2  4d
    7    3n iii s2 5d            1s2  2s2  5d
    7    3n iii s2 6d            1s2  2s2  6d
    7    3n iii s2 7d            1s2  2s2  7d
    7    3n iii s2 8d            1s2  2s2  8d
    7    3n iii s2 9d            1s2  2s2  9d
    7    3n iii s2 10d           1s2  2s2 10d
    7    3n iii s2 11d           1s2  2s2 11d
    7    3n iii s2 12d           1s2  2s2 12d
    7    3n iii s2 13d           1s2  2s2 13d
    7    3n iii s2 14d           1s2  2s2 14d
    7    3n iii p2 3d            1s2  2s0  2p2  3d
    7    3n iii p2 4d            1s2  2s0  2p2  4d
    7    3n iii p2 5d            1s2  2s0  2p2  5d
    7    3n iii p2 6d            1s2  2s0  2p2  6d
    7    3n iii p2 7d            1s2  2s0  2p2  7d
    7    3n iii p2 8d            1s2  2s0  2p2  8d
    7    3n iii p2 9d            1s2  2s0  2p2  9d
    7    3n iii p2 10d           1s2  2s0  2p2 10d
    7    3n iii p2 11d           1s2  2s0  2p2 11d
    7    3n iii p2 12d           1s2  2s0  2p2 12d
    7    3n iii p2 13d           1s2  2s0  2p2 13d
    7    3n iii p2 14d           1s2  2s0  2p2 14d
    7    3n iii s2 5g            1s2  2s2  5g
    7    3n iii s2 6g            1s2  2s2  6g
    7    3n iii s2 7g            1s2  2s2  7g
    7    3n iii s2 8g            1s2  2s2  8g
    7    3n iii s2 9g            1s2  2s2  9g
    7    3n iii s2 7i            1s2  2s2  7i
    7    3n iii s2 8i            1s2  2s2  8i
    7    3n iii s2 9i            1s2  2s2  9i
    7    3n iii sp2              1s2  2s   2p2  
    7    3n iii sp3p             1s2  2s   2p   3p
    7    3n iii sp4p             1s2  2s   2p   4p
    7    3n iii sp5p             1s2  2s   2p   5p
    7    3n iii sp6p             1s2  2s   2p   6p
    7    3n iii sp7p             1s2  2s   2p   7p
    7    3n iii sp8p             1s2  2s   2p   8p
    7    3n iii sp9p             1s2  2s   2p   9p
    7    3n iii sp10p            1s2  2s   2p  10p
    7    3n iii sp11p            1s2  2s   2p  11p
    7    3n iii sp12p            1s2  2s   2p  12p
    7    3n iii sp13p            1s2  2s   2p  13p
    7    3n iii sp14p            1s2  2s   2p  14p
    7    3n iii sp4f             1s2  2s   2p   4f
    7    3n iii sp5f             1s2  2s   2p   5f
    7    3n iii sp6f             1s2  2s   2p   6f
    7    3n iii sp7f             1s2  2s   2p   7f
    7    3n iii sp8f             1s2  2s   2p   8f
    7    3n iii sp9f             1s2  2s   2p   9f
    7    3n iii sp10f            1s2  2s   2p  10f
    7    3n iii sp11f            1s2  2s   2p  11f
    7    3n iii sp12f            1s2  2s   2p  12f
    7    3n iii sp13f            1s2  2s   2p  13f
    7    3n iii sp14f            1s2  2s   2p  14f
   -1
   -1
   -1
   -1
$run cray:rcn2c
$DELETE POOLG:HF070201.DAT;*
$DELETE POOLG:HF070202.DAT;*
$DELETE POOLG:HF070204.DAT;*
$DELETE POOLG:HF070231.DAT;*
$DELETE POOLG:HF070232.DAT;*
