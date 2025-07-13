$set def 1002
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf100207.dat for007
$assign poolg:hf100201.dat for001
$assign poolg:hf100202.dat for002
$assign poolg:hf100204.dat for004
$assign hf1002x.pun for011
$assign hf1002x.rrr for012
$assign hf1002x.dat for013
$assign hf1002xe.dat for014
$assign poolg:hf100231.dat for031
$assign poolg:hf100232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   10    3ne iii2p4              2s2  2p4
   10    3ne iii2p3.3p           2s2  2p3  3p
   10    3ne iii2p3.4p           2s2  2p3  4p
   10    3ne iii2p3.5p           2s2  2p3  5p
   10    3ne iii2p3.6p           2s2  2p3  6p
   10    3ne iii2p3.7p           2s2  2p3  7p
   10    3ne iii2p3.8p           2s2  2p3  8p
   10    3ne iii2p3.9p           2s2  2p3  9p
   10    3ne iii2p3.10p          2s2  2p3 10p
   10    3ne iii2p3.11p          2s2  2p3 11p
   10    3ne iii2p3.12p          2s2  2p3 12p
   10    3ne iii2p3.13p          2s2  2p3 13p
   10    3ne iii2p3.14p          2s2  2p3 14p
   10    3ne iii2p3.15p          2s2  2p3 15p
   10    3ne iii2p3.4f           2s2  2p3  4f
   10    3ne iii2p3.5f           2s2  2p3  5f
   10    3ne iii2p3.6f           2s2  2p3  6f
   10    3ne iii2p3.7f           2s2  2p3  7f
   10    3ne iii2p3.8f           2s2  2p3  8f
   10    3ne iii2p3.9f           2s2  2p3  9f
   10    3ne iii2p3.10f          2s2  2p3 10f
   10    3ne iii2p3.11f          2s2  2p3 11f
   10    3ne iii2p3.12f          2s2  2p3 12f
   10    3ne iii2p3.13f          2s2  2p3 13f
   10    3ne iii2p3.14f          2s2  2p3 14f
   10    3ne iii2p3.15f          2s2  2p3 15f
   10    3ne iii2p3.6h           2s2  2p3  6h
   10    3ne iii2p3.7h           2s2  2p3  7h
   10    3ne iii2p3.8h           2s2  2p3  8h
   10    3ne iii2p3.9h           2s2  2p3  9h
   10    3ne iii2p3.8k           2s2  2p3  8k
   10    3ne iii2p3.9k           2s2  2p3  9k
   10    3ne iiisp4 3s           2s   2p4  3s
   10    3ne iiisp4 4s           2s   2p4  4s
   10    3ne iiisp4 5s           2s   2p4  5s
   10    3ne iiisp4 6s           2s   2p4  6s
   10    3ne iiisp4 7s           2s   2p4  7s
   10    3ne iiisp4 8s           2s   2p4  8s
   10    3ne iiisp4 9s           2s   2p4  9s
   10    3ne iiisp4 10s          2s   2p4 10s
   10    3ne iiisp4 11s          2s   2p4 11s
   10    3ne iiisp4 12s          2s   2p4 12s
   10    3ne iiisp4 13s          2s   2p4 13s
   10    3ne iiisp4 14s          2s   2p4 14s
   10    3ne iiisp4 15s          2s   2p4 15s
   10    3ne iiisp4 3d           2s   2p4  3d
   10    3ne iiisp4 4d           2s   2p4  4d
   10    3ne iiisp4 5d           2s   2p4  5d
   10    3ne iiisp4 6d           2s   2p4  6d
   10    3ne iiisp4 7d           2s   2p4  7d
   10    3ne iiisp4 8d           2s   2p4  8d
   10    3ne iiisp4 9d           2s   2p4  9d
   10    3ne iiisp4 10d          2s   2p4 10d
   10    3ne iiisp4 11d          2s   2p4 11d
   10    3ne iiisp4 12d          2s   2p4 12d
   10    3ne iiisp4 13d          2s   2p4 13d
   10    3ne iiisp4 14d          2s   2p4 14d
   10    3ne iiisp4 15d          2s   2p4 15d
   10    3ne iiip6               2s0  2p6  
   10    3ne iii2p3.3s           2s2  2p3  3s
   10    3ne iii2p3.4s           2s2  2p3  4s
   10    3ne iii2p3.5s           2s2  2p3  5s
   10    3ne iii2p3.6s           2s2  2p3  6s
   10    3ne iii2p3.7s           2s2  2p3  7s
   10    3ne iii2p3.8s           2s2  2p3  8s
   10    3ne iii2p3.9s           2s2  2p3  9s
   10    3ne iii2p3.10s          2s2  2p3 10s
   10    3ne iii2p3.11s          2s2  2p3 11s
   10    3ne iii2p3.12s          2s2  2p3 12s
   10    3ne iii2p3.13s          2s2  2p3 13s
   10    3ne iii2p3.14s          2s2  2p3 14s
   10    3ne iii2p3.15s          2s2  2p3 15s
   10    3ne iii2p3.3d           2s2  2p3  3d
   10    3ne iii2p3.4d           2s2  2p3  4d
   10    3ne iii2p3.5d           2s2  2p3  5d
   10    3ne iii2p3.6d           2s2  2p3  6d
   10    3ne iii2p3.7d           2s2  2p3  7d
   10    3ne iii2p3.8d           2s2  2p3  8d
   10    3ne iii2p3.9d           2s2  2p3  9d
   10    3ne iii2p3.10d          2s2  2p3 10d
   10    3ne iii2p3.11d          2s2  2p3 11d
   10    3ne iii2p3.12d          2s2  2p3 12d
   10    3ne iii2p3.13d          2s2  2p3 13d
   10    3ne iii2p3.14d          2s2  2p3 14d
   10    3ne iii2p3.15d          2s2  2p3 15d
   10    3ne iii2p3.5g           2s2  2p3  5g
   10    3ne iii2p3.6g           2s2  2p3  6g
   10    3ne iii2p3.7g           2s2  2p3  7g
   10    3ne iii2p3.8g           2s2  2p3  8g
   10    3ne iii2p3.9g           2s2  2p3  9g
   10    3ne iii2p3.7i           2s2  2p3  7i
   10    3ne iii2p3.8i           2s2  2p3  8i
   10    3ne iii2p3.9i           2s2  2p3  9i
   10    3ne iiisp5              2s   2p5  
   10    3ne iiisp4 3p           2s   2p4  3p
   10    3ne iiisp4 4p           2s   2p4  4p
   10    3ne iiisp4 5p           2s   2p4  5p
   10    3ne iiisp4 6p           2s   2p4  6p
   10    3ne iiisp4 7p           2s   2p4  7p
   10    3ne iiisp4 8p           2s   2p4  8p
   10    3ne iiisp4 9p           2s   2p4  9p
   10    3ne iiisp4 10p          2s   2p4 10p
   10    3ne iiisp4 11p          2s   2p4 11p
   10    3ne iiisp4 12p          2s   2p4 12p
   10    3ne iiisp4 13p          2s   2p4 13p
   10    3ne iiisp4 14p          2s   2p4 14p
   10    3ne iiisp4 15p          2s   2p4 15p
   10    3ne iiisp4 4f           2s   2p4  4f
   10    3ne iiisp4 5f           2s   2p4  5f
   10    3ne iiisp4 6f           2s   2p4  6f
   10    3ne iiisp4 7f           2s   2p4  7f
   10    3ne iiisp4 8f           2s   2p4  8f
   10    3ne iiisp4 9f           2s   2p4  9f
   10    3ne iiisp4 10f          2s   2p4 10f
   10    3ne iiisp4 11f          2s   2p4 11f
   10    3ne iiisp4 12f          2s   2p4 12f
   10    3ne iiisp4 13f          2s   2p4 13f
   10    3ne iiisp4 14f          2s   2p4 14f
   10    3ne iiisp4 15f          2s   2p4 15f
   -1
$run cray:rcn2c
$DELETE POOLG:HF100201.DAT;*
$DELETE POOLG:HF100202.DAT;*
$DELETE POOLG:HF100204.DAT;*
$DELETE POOLG:HF100231.DAT;*
$DELETE POOLG:HF100232.DAT;*
