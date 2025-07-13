$set def 1305
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf130507.dat for007
$assign poolg:hf130501.dat for001
$assign poolg:hf130502.dat for002
$assign poolg:hf130504.dat for004
$assign hf1305x.pun for011
$assign hf1305x.rrr for012
$assign hf1305x.dat for013
$assign hf1305xe.dat for014
$assign poolg:hf130531.dat for031
$assign poolg:hf130532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   13    6al vi 2p4              2s2  2p4
   13    6al vi 2p3.3p           2s2  2p3  3p
   13    6al vi 2p3.4p           2s2  2p3  4p
   13    6al vi 2p3.5p           2s2  2p3  5p
   13    6al vi 2p3.6p           2s2  2p3  6p
   13    6al vi 2p3.7p           2s2  2p3  7p
   13    6al vi 2p3.8p           2s2  2p3  8p
   13    6al vi 2p3.9p           2s2  2p3  9p
   13    6al vi 2p3.10p          2s2  2p3 10p
   13    6al vi 2p3.11p          2s2  2p3 11p
   13    6al vi 2p3.12p          2s2  2p3 12p
   13    6al vi 2p3.13p          2s2  2p3 13p
   13    6al vi 2p3.14p          2s2  2p3 14p
   13    6al vi 2p3.15p          2s2  2p3 15p
   13    6al vi 2p3.4f           2s2  2p3  4f
   13    6al vi 2p3.5f           2s2  2p3  5f
   13    6al vi 2p3.6f           2s2  2p3  6f
   13    6al vi 2p3.7f           2s2  2p3  7f
   13    6al vi 2p3.8f           2s2  2p3  8f
   13    6al vi 2p3.9f           2s2  2p3  9f
   13    6al vi 2p3.10f          2s2  2p3 10f
   13    6al vi 2p3.11f          2s2  2p3 11f
   13    6al vi 2p3.12f          2s2  2p3 12f
   13    6al vi 2p3.13f          2s2  2p3 13f
   13    6al vi 2p3.14f          2s2  2p3 14f
   13    6al vi 2p3.15f          2s2  2p3 15f
   13    6al vi 2p3.6h           2s2  2p3  6h
   13    6al vi 2p3.7h           2s2  2p3  7h
   13    6al vi 2p3.8h           2s2  2p3  8h
   13    6al vi 2p3.9h           2s2  2p3  9h
   13    6al vi 2p3.8k           2s2  2p3  8k
   13    6al vi 2p3.9k           2s2  2p3  9k
   13    6al vi sp4 3s           2s   2p4  3s
   13    6al vi sp4 4s           2s   2p4  4s
   13    6al vi sp4 5s           2s   2p4  5s
   13    6al vi sp4 6s           2s   2p4  6s
   13    6al vi sp4 7s           2s   2p4  7s
   13    6al vi sp4 8s           2s   2p4  8s
   13    6al vi sp4 9s           2s   2p4  9s
   13    6al vi sp4 10s          2s   2p4 10s
   13    6al vi sp4 11s          2s   2p4 11s
   13    6al vi sp4 12s          2s   2p4 12s
   13    6al vi sp4 13s          2s   2p4 13s
   13    6al vi sp4 14s          2s   2p4 14s
   13    6al vi sp4 15s          2s   2p4 15s
   13    6al vi sp4 3d           2s   2p4  3d
   13    6al vi sp4 4d           2s   2p4  4d
   13    6al vi sp4 5d           2s   2p4  5d
   13    6al vi sp4 6d           2s   2p4  6d
   13    6al vi sp4 7d           2s   2p4  7d
   13    6al vi sp4 8d           2s   2p4  8d
   13    6al vi sp4 9d           2s   2p4  9d
   13    6al vi sp4 10d          2s   2p4 10d
   13    6al vi sp4 11d          2s   2p4 11d
   13    6al vi sp4 12d          2s   2p4 12d
   13    6al vi sp4 13d          2s   2p4 13d
   13    6al vi sp4 14d          2s   2p4 14d
   13    6al vi sp4 15d          2s   2p4 15d
   13    6al vi p6               2s0  2p6  
   13    6al vi 2p3.3s           2s2  2p3  3s
   13    6al vi 2p3.4s           2s2  2p3  4s
   13    6al vi 2p3.5s           2s2  2p3  5s
   13    6al vi 2p3.6s           2s2  2p3  6s
   13    6al vi 2p3.7s           2s2  2p3  7s
   13    6al vi 2p3.8s           2s2  2p3  8s
   13    6al vi 2p3.9s           2s2  2p3  9s
   13    6al vi 2p3.10s          2s2  2p3 10s
   13    6al vi 2p3.11s          2s2  2p3 11s
   13    6al vi 2p3.12s          2s2  2p3 12s
   13    6al vi 2p3.13s          2s2  2p3 13s
   13    6al vi 2p3.14s          2s2  2p3 14s
   13    6al vi 2p3.15s          2s2  2p3 15s
   13    6al vi 2p3.3d           2s2  2p3  3d
   13    6al vi 2p3.4d           2s2  2p3  4d
   13    6al vi 2p3.5d           2s2  2p3  5d
   13    6al vi 2p3.6d           2s2  2p3  6d
   13    6al vi 2p3.7d           2s2  2p3  7d
   13    6al vi 2p3.8d           2s2  2p3  8d
   13    6al vi 2p3.9d           2s2  2p3  9d
   13    6al vi 2p3.10d          2s2  2p3 10d
   13    6al vi 2p3.11d          2s2  2p3 11d
   13    6al vi 2p3.12d          2s2  2p3 12d
   13    6al vi 2p3.13d          2s2  2p3 13d
   13    6al vi 2p3.14d          2s2  2p3 14d
   13    6al vi 2p3.15d          2s2  2p3 15d
   13    6al vi 2p3.5g           2s2  2p3  5g
   13    6al vi 2p3.6g           2s2  2p3  6g
   13    6al vi 2p3.7g           2s2  2p3  7g
   13    6al vi 2p3.8g           2s2  2p3  8g
   13    6al vi 2p3.9g           2s2  2p3  9g
   13    6al vi 2p3.7i           2s2  2p3  7i
   13    6al vi 2p3.8i           2s2  2p3  8i
   13    6al vi 2p3.9i           2s2  2p3  9i
   13    6al vi sp5              2s   2p5  
   13    6al vi sp4 3p           2s   2p4  3p
   13    6al vi sp4 4p           2s   2p4  4p
   13    6al vi sp4 5p           2s   2p4  5p
   13    6al vi sp4 6p           2s   2p4  6p
   13    6al vi sp4 7p           2s   2p4  7p
   13    6al vi sp4 8p           2s   2p4  8p
   13    6al vi sp4 9p           2s   2p4  9p
   13    6al vi sp4 10p          2s   2p4 10p
   13    6al vi sp4 11p          2s   2p4 11p
   13    6al vi sp4 12p          2s   2p4 12p
   13    6al vi sp4 13p          2s   2p4 13p
   13    6al vi sp4 14p          2s   2p4 14p
   13    6al vi sp4 15p          2s   2p4 15p
   13    6al vi sp4 4f           2s   2p4  4f
   13    6al vi sp4 5f           2s   2p4  5f
   13    6al vi sp4 6f           2s   2p4  6f
   13    6al vi sp4 7f           2s   2p4  7f
   13    6al vi sp4 8f           2s   2p4  8f
   13    6al vi sp4 9f           2s   2p4  9f
   13    6al vi sp4 10f          2s   2p4 10f
   13    6al vi sp4 11f          2s   2p4 11f
   13    6al vi sp4 12f          2s   2p4 12f
   13    6al vi sp4 13f          2s   2p4 13f
   13    6al vi sp4 14f          2s   2p4 14f
   13    6al vi sp4 15f          2s   2p4 15f
   -1
$run cray:rcn2c
$DELETE POOLG:HF130501.DAT;*
$DELETE POOLG:HF130502.DAT;*
$DELETE POOLG:HF130504.DAT;*
$DELETE POOLG:HF130531.DAT;*
$DELETE POOLG:HF130532.DAT;*
