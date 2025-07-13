$set def 0601
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf060107.dat for007
$assign poolg:hf060101.dat for001
$assign poolg:hf060102.dat for002
$assign poolg:hf060104.dat for004
$assign hf0601Z.pun for011
$assign hf0601Z.dat for013
$assign hf0601eZ.dat for014
$assign poolg:hf060131.dat for031
$assign poolg:hf060132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    6    2c ii  2p               1s2  2s2  2p
    6    2c ii  3p               1s2  2s2  3p
    6    2c ii  4p               1s2  2s2  4p
    6    2c ii  5p               1s2  2s2  5p
    6    2c ii  6p               1s2  2s2  6p
    6    2c ii  7p               1s2  2s2  7p
    6    2c ii  8p               1s2  2s2  8p
    6    2c ii  9p               1s2  2s2  9p
    6    2c ii  10p              1s2  2s2 10p
    6    2c ii  11p              1s2  2s2 11p
    6    2c ii  12p              1s2  2s2 12p
    6    2c ii  p3               1s2  2s0  2p3  
    6    2c ii  p2 3p            1s2  2s0  2p2  3p
    6    2c ii  p2 4p            1s2  2s0  2p2  4p
    6    2c ii  p2 5p            1s2  2s0  2p2  5p
    6    2c ii  p2 6p            1s2  2s0  2p2  6p
    6    2c ii  p2 7p            1s2  2s0  2p2  7p
    6    2c ii  p2 8p            1s2  2s0  2p2  8p
    6    2c ii  p2 9p            1s2  2s0  2p2  9p
    6    2c ii  p2 10p           1s2  2s0  2p2 10p
    6    2c ii  p2 11p           1s2  2s0  2p2 11p
    6    2c ii  p2 12p           1s2  2s0  2p2 12p
    6    2c ii  4f               1s2  2s2  4f
    6    2c ii  5f               1s2  2s2  5f
    6    2c ii  6f               1s2  2s2  6f
    6    2c ii  7f               1s2  2s2  7f
    6    2c ii  8f               1s2  2s2  8f
    6    2c ii  9f               1s2  2s2  9f
    6    2c ii 10f               1s2  2s2 10f
    6    2c ii  p2 3f            1s2  2s0  2p2  3f
    6    2c ii  p2 4f            1s2  2s0  2p2  4f
    6    2c ii  p2 5f            1s2  2s0  2p2  5f
    6    2c ii  p2 6f            1s2  2s0  2p2  6f
    6    2c ii  p2 7f            1s2  2s0  2p2  7f
    6    2c ii  p2 8f            1s2  2s0  2p2  8f
    6    2c ii  p2 9f            1s2  2s0  2p2  9f
    6    2c ii  p2 10f           1s2  2s0  2p2 10f
    6    2c ii  6h               1s2  2s2  6h
    6    2c ii  7h               1s2  2s2  7h
    6    2c ii  8h               1s2  2s2  8h
    6    2c ii  9h               1s2  2s2  9h
    6    2c ii  8k               1s2  2s2  8k
    6    2c ii  9k               1s2  2s2  9k
    6    2c ii  sp3s             1s2  2s   2p   3s
    6    2c ii  sp4s             1s2  2s   2p   4s
    6    2c ii  sp5s             1s2  2s   2p   5s
    6    2c ii  sp6s             1s2  2s   2p   6s
    6    2c ii  sp7s             1s2  2s   2p   7s
    6    2c ii  sp8s             1s2  2s   2p   8s
    6    2c ii  sp9s             1s2  2s   2p   9s
    6    2c ii  sp10s            1s2  2s   2p  10s
    6    2c ii  sp11s            1s2  2s   2p  11s
    6    2c ii  sp12s            1s2  2s   2p  12s
    6    2c ii  sp4d             1s2  2s   2p   4d
    6    2c ii  sp5d             1s2  2s   2p   5d
    6    2c ii  sp6d             1s2  2s   2p   6d
    6    2c ii  sp7d             1s2  2s   2p   7d
    6    2c ii  sp8d             1s2  2s   2p   8d
    6    2c ii  sp9d             1s2  2s   2p   9d
    6    2c ii  sp10d            1s2  2s   2p  10d
    6    2c ii  sp11d            1s2  2s   2p  11d
    6    2c ii  sp12d            1s2  2s   2p  12d
    6    2c ii  3s               1s2  2s2  3s
    6    2c ii  4s               1s2  2s2  4s
    6    2c ii  5s               1s2  2s2  5s
    6    2c ii  6s               1s2  2s2  6s
    6    2c ii  7s               1s2  2s2  7s
    6    2c ii  8s               1s2  2s2  8s
    6    2c ii  9s               1s2  2s2  9s
    6    2c ii  10s              1s2  2s2 10s
    6    2c ii  11s              1s2  2s2 11s
    6    2c ii  12s              1s2  2s2 12s
    6    2c ii  p2 3s            1s2  2s0  2p2  3s
    6    2c ii  p2 4s            1s2  2s0  2p2  4s
    6    2c ii  p2 5s            1s2  2s0  2p2  5s
    6    2c ii  p2 6s            1s2  2s0  2p2  6s
    6    2c ii  p2 7s            1s2  2s0  2p2  7s
    6    2c ii  p2 8s            1s2  2s0  2p2  8s
    6    2c ii  p2 9s            1s2  2s0  2p2  9s
    6    2c ii  p2 10s           1s2  2s0  2p2 10s
    6    2c ii  p2 11s           1s2  2s0  2p2 11s
    6    2c ii  p2 12s           1s2  2s0  2p2 12s
    6    2c ii  3d               1s2  2s2  3d
    6    2c ii  4d               1s2  2s2  4d
    6    2c ii  5d               1s2  2s2  5d
    6    2c ii  6d               1s2  2s2  6d
    6    2c ii  7d               1s2  2s2  7d
    6    2c ii  8d               1s2  2s2  8d
    6    2c ii  9d               1s2  2s2  9d
    6    2c ii  10d              1s2  2s2 10d
    6    2c ii  11d              1s2  2s2 11d
    6    2c ii  12d              1s2  2s2 12d
    6    2c ii  p2 3d            1s2  2s0  2p2  3d
    6    2c ii  p2 4d            1s2  2s0  2p2  4d
    6    2c ii  p2 5d            1s2  2s0  2p2  5d
    6    2c ii  p2 6d            1s2  2s0  2p2  6d
    6    2c ii  p2 7d            1s2  2s0  2p2  7d
    6    2c ii  p2 8d            1s2  2s0  2p2  8d
    6    2c ii  p2 9d            1s2  2s0  2p2  9d
    6    2c ii  p2 10d           1s2  2s0  2p2 10d
    6    2c ii  p2 11d           1s2  2s0  2p2 11d
    6    2c ii  p2 12d           1s2  2s0  2p2 12d
    6    2c ii  5g               1s2  2s2  5g
    6    2c ii  6g               1s2  2s2  6g
    6    2c ii  7g               1s2  2s2  7g
    6    2c ii  8g               1s2  2s2  8g
    6    2c ii  9g               1s2  2s2  9g
    6    2c ii  7i               1s2  2s2  7i
    6    2c ii  8i               1s2  2s2  8i
    6    2c ii  9i               1s2  2s2  9i
    6    2c ii  9l               1s2  2s2 10l
    6    2c ii  sp2              1s2  2s   2p2  
    6    2c ii  sp3p             1s2  2s   2p   3p
    6    2c ii  sp4p             1s2  2s   2p   4p
    6    2c ii  sp5p             1s2  2s   2p   5p
    6    2c ii  sp6p             1s2  2s   2p   6p
    6    2c ii  sp7p             1s2  2s   2p   7p
    6    2c ii  sp8p             1s2  2s   2p   8p
    6    2c ii  sp9p             1s2  2s   2p   9p
    6    2c ii  sp10p            1s2  2s   2p  10p
    6    2c ii  sp11p            1s2  2s   2p  11p
    6    2c ii  sp4f             1s2  2s   2p   4f
    6    2c ii  ss2p2            1s   2s2  2p2  
   -1
   -1
$run cray:rcn2c
$DELETE POOLG:HF060101.DAT;*
$DELETE POOLG:HF060102.DAT;*
$DELETE POOLG:HF060104.DAT;*
$DELETE POOLG:HF060131.DAT;*
$DELETE POOLG:HF060132.DAT;*
