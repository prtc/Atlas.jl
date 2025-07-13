$set def 0800
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf080007.dat for007
$assign poolg:hf080001.dat for001
$assign poolg:hf080002.dat for002
$assign poolg:hf080004.dat for004
$assign hf0800x.pun for011
$assign hf0800x.rrr for012
$assign hf0800x.dat for013
$assign hf0800xe.dat for014
$assign poolg:hf080031.dat for031
$assign poolg:hf080032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    8    1o i   2p4              2s2  2p4
    8    1o i   2p3.3p           2s2  2p3  3p
    8    1o i   2p3.4p           2s2  2p3  4p
    8    1o i   2p3.5p           2s2  2p3  5p
    8    1o i   2p3.6p           2s2  2p3  6p
    8    1o i   2p3.7p           2s2  2p3  7p
    8    1o i   2p3.8p           2s2  2p3  8p
    8    1o i   2p3.9p           2s2  2p3  9p
    8    1o i   2p3.10p          2s2  2p3 10p
    8    1o i   2p3.11p          2s2  2p3 11p
    8    1o i   2p3.12p          2s2  2p3 12p
    8    1o i   2p3.13p          2s2  2p3 13p
    8    1o i   2p3.14p          2s2  2p3 14p
    8    1o i   2p3.15p          2s2  2p3 15p
    8    1o i   2p3.4f           2s2  2p3  4f
    8    1o i   2p3.5f           2s2  2p3  5f
    8    1o i   2p3.6f           2s2  2p3  6f
    8    1o i   2p3.7f           2s2  2p3  7f
    8    1o i   2p3.8f           2s2  2p3  8f
    8    1o i   2p3.9f           2s2  2p3  9f
    8    1o i   2p3.6h           2s2  2p3  6h
    8    1o i   2p3.7h           2s2  2p3  7h
    8    1o i   2p3.8h           2s2  2p3  8h
    8    1o i   2p3.9h           2s2  2p3  9h
    8    1o i   2p3.8k           2s2  2p3  8k
    8    1o i   2p3.9k           2s2  2p3  9k
    8    1o i   sp4 3s           2s   2p4  3s
    8    1o i   sp4 4s           2s   2p4  4s
    8    1o i   sp4 5s           2s   2p4  5s
    8    1o i   sp4 6s           2s   2p4  6s
    8    1o i   sp4 7s           2s   2p4  7s
    8    1o i   sp4 8s           2s   2p4  8s
    8    1o i   sp4 9s           2s   2p4  9s
    8    1o i   sp4 10s          2s   2p4 10s
    8    1o i   sp4 11s          2s   2p4 11s
    8    1o i   sp4 12s          2s   2p4 12s
    8    1o i   sp4 13s          2s   2p4 13s
    8    1o i   sp4 14s          2s   2p4 14s
    8    1o i   sp4 15s          2s   2p4 15s
    8    1o i   sp4 16s          2s   2p4 16s
    8    1o i   sp4 17s          2s   2p4 17s
    8    1o i   sp4 18s          2s   2p4 18s
    8    1o i   sp4 19s          2s   2p4 19s
    8    1o i   sp4 3d           2s   2p4  3d
    8    1o i   sp4 4d           2s   2p4  4d
    8    1o i   sp4 5d           2s   2p4  5d
    8    1o i   sp4 6d           2s   2p4  6d
    8    1o i   sp4 7d           2s   2p4  7d
    8    1o i   sp4 8d           2s   2p4  8d
    8    1o i   sp4 9d           2s   2p4  9d
    8    1o i   sp4 10d          2s   2p4 10d
    8    1o i   sp4 11d          2s   2p4 11d
    8    1o i   sp4 12d          2s   2p4 12d
    8    1o i   sp4 13d          2s   2p4 13d
    8    1o i   sp4 14d          2s   2p4 14d
    8    1o i   sp4 15d          2s   2p4 15d
    8    1o i   sp4 16d          2s   2p4 16d
    8    1o i   sp4 17d          2s   2p4 17d
    8    1o i   sp4 18d          2s   2p4 18d
    8    1o i   sp4 19d          2s   2p4 19d
    8    1o i   p6               2s0  2p6  
    8    1o i   2p3.3s           2s2  2p3  3s
    8    1o i   2p3.4s           2s2  2p3  4s
    8    1o i   2p3.5s           2s2  2p3  5s
    8    1o i   2p3.6s           2s2  2p3  6s
    8    1o i   2p3.7s           2s2  2p3  7s
    8    1o i   2p3.8s           2s2  2p3  8s
    8    1o i   2p3.9s           2s2  2p3  9s
    8    1o i   2p3.10s          2s2  2p3 10s
    8    1o i   2p3.11s          2s2  2p3 11s
    8    1o i   2p3.12s          2s2  2p3 12s
    8    1o i   2p3.13s          2s2  2p3 13s
    8    1o i   2p3.14s          2s2  2p3 14s
    8    1o i   2p3.15s          2s2  2p3 15s
    8    1o i   2p3.16s          2s2  2p3 16s
    8    1o i   2p3.17s          2s2  2p3 17s
    8    1o i   2p3.18s          2s2  2p3 18s
    8    1o i   2p3.19s          2s2  2p3 19s
    8    1o i   2p3.20s          2s2  2p3 20s
    8    1o i   2p3.3d           2s2  2p3  3d
    8    1o i   2p3.4d           2s2  2p3  4d
    8    1o i   2p3.5d           2s2  2p3  5d
    8    1o i   2p3.6d           2s2  2p3  6d
    8    1o i   2p3.7d           2s2  2p3  7d
    8    1o i   2p3.8d           2s2  2p3  8d
    8    1o i   2p3.9d           2s2  2p3  9d
    8    1o i   2p3.10d          2s2  2p3 10d
    8    1o i   2p3.11d          2s2  2p3 11d
    8    1o i   2p3.12d          2s2  2p3 12d
    8    1o i   2p3.13d          2s2  2p3 13d
    8    1o i   2p3.14d          2s2  2p3 14d
    8    1o i   2p3.15d          2s2  2p3 15d
    8    1o i   2p3.16d          2s2  2p3 16d
    8    1o i   2p3.17d          2s2  2p3 17d
    8    1o i   2p3.18d          2s2  2p3 18d
    8    1o i   2p3.19d          2s2  2p3 19d
    8    1o i   2p3.20d          2s2  2p3 20d
    8    1o i   2p3.5g           2s2  2p3  5g
    8    1o i   2p3.6g           2s2  2p3  6g
    8    1o i   2p3.7g           2s2  2p3  7g
    8    1o i   2p3.8g           2s2  2p3  8g
    8    1o i   2p3.9g           2s2  2p3  9g
    8    1o i   2p3.7i           2s2  2p3  7i
    8    1o i   2p3.8i           2s2  2p3  8i
    8    1o i   2p3.9i           2s2  2p3  9i
    8    1o i   2p3.9l           2s2  2p3 10i
    8    1o i   sp5              2s   2p5  
    8    1o i   sp4 3p           2s   2p4  3p
    8    1o i   sp4 4p           2s   2p4  4p
    8    1o i   sp4 5p           2s   2p4  5p
    8    1o i   sp4 6p           2s   2p4  6p
    8    1o i   sp4 7p           2s   2p4  7p
    8    1o i   sp4 8p           2s   2p4  8p
    8    1o i   sp4 9p           2s   2p4  9p
    8    1o i   sp4 10p          2s   2p4 10p
    8    1o i   sp4 11p          2s   2p4 11p
    8    1o i   sp4 12p          2s   2p4 12p
    8    1o i   sp4 13p          2s   2p4 13p
    8    1o i   sp4 14p          2s   2p4 14p
    8    1o i   sp4 15p          2s   2p4 15p
    8    1o i   sp4 16p          2s   2p4 16p
    8    1o i   sp4 17p          2s   2p4 17p
   -1
    8    1o i   sp4 18p          2s   2p4 18p
    8    1o i   sp4 19p          2s   2p4 19p
    8    1o i   sp4 20p          2s   2p4 20p
    8    1o i   sp2 7i           2s   2p2  7i
    8    1o i   sp2 8i           2s   2p2  8i
    8    1o i   sp2 9i           2s   2p2  9i
    8    1o i   2p7i             2s2  2p   7i
    8    1o i   2p8i             2s2  2p   8i
    8    1o i   2p9i             2s2  2p   9i
    8    1o i   2p8k             2s2  2p   8k
    8    1o i   2p9k             2s2  2p   9k
    8    1o i   sp2 8k           2s   2p2  8k
    8    1o i   sp2 9k           2s   2p2  9k
    8    1o i   sp2 10l          2s   2p2 10l
    8    1o i   2p10l            2s2  2p  10l
   -1
$run cray:rcn2c
$DELETE POOLG:HF080001.DAT;*
$DELETE POOLG:HF080002.DAT;*
$DELETE POOLG:HF080004.DAT;*
$DELETE POOLG:HF080031.DAT;*
$DELETE POOLG:HF080032.DAT;*
