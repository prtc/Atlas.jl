$set def 2407
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf240707.dat for007
$assign poolg:hf240701.dat for001
$assign poolg:hf240702.dat for002
$assign poolg:hf240704.dat for004
$assign hf2407y.pun for011
$assign hf2407y.rrr for012
$assign hf2407y.dat for013
$assign hf2407ye.dat for014
$assign poolg:hf240731.dat for031
$assign poolg:hf240732.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   24    8crviiis2p5             3s2  3p5
   24    8crviiis2p4 4p          3s2  3p4  4p
   24    8crviiis2p4 5p          3s2  3p4  5p
   24    8crviiis2p4 6p          3s2  3p4  6p
   24    8crviiis2p4 7p          3s2  3p4  7p
   24    8crviiis2p4 8p          3s2  3p4  8p
   24    8crviiis2p4 9p          3s2  3p4  9p
   24    8crviiis2p4 10p         3s2  3p4 10p
   24    8crviiis2p4 11p         3s2  3p4 11p
   24    8crviiis2p4 12p         3s2  3p4 12p
   24    8crviiis2p4 4f          3s2  3p4  4f
   24    8crviiis2p4 5f          3s2  3p4  5f
   24    8crviiis2p4 6f          3s2  3p4  6f
   24    8crviiis2p4 7f          3s2  3p4  7f
   24    8crviiis2p4 8f          3s2  3p4  8f
   24    8crviiis2p4 9f          3s2  3p4  9f
   24    8crviiis2p4 10f         3s2  3p4 10f
   24    8crviiis2p4 11f         3s2  3p4 11f
   24    8crviiis2p4 12f         3s2  3p4 12f
   24    8crviiisp5 4s           3s   3p5  4s
   24    8crviiisp5 5s           3s   3p5  5s
   24    8crviiisp5 6s           3s   3p5  6s
   24    8crviiisp5 7s           3s   3p5  7s
   24    8crviiisp5 8s           3s   3p5  8s
   24    8crviiisp5 9s           3s   3p5  9s
   24    8crviiisp5 10s          3s   3p5 10s
   24    8crviiisp5 11s          3s   3p5 11s
   24    8crviiisp5 12s          3s   3p5 12s
   24    8crviiisp5 3d           3s   3p5  3d
   24    8crviiisp5 4d           3s   3p5  4d
   24    8crviiisp5 5d           3s   3p5  5d
   24    8crviiisp5 6d           3s   3p5  6d
   24    8crviiisp5 7d           3s   3p5  7d
   24    8crviiisp5 8d           3s   3p5  8d
   24    8crviiisp5 9d           3s   3p5  9d
   24    8crviiisp5 10d          3s   3p5 10d
   24    8crviiisp5 11d          3s   3p5 11d
   24    8crviiisp5 12d          3s   3p5 12d
   24    8crviiip6 4p            3s0  3p6  4p
   24    8crviiip6 4f            3s0  3p6  4f
   24    8crviiis2p3 3d2         3s2  3p3  3d2
   24    8crviiis2p3 3d4s        3s2  3p3  3d   4s
   24    8crviiis2p3 4s2         3s2  3p3  4s2
   24    8crviiip5 3d2           3s0  3p5  3d2
   24    8crviiis2p4 4s          3s2  3p4  4s
   24    8crviiis2p4 5s          3s2  3p4  5s
   24    8crviiis2p4 6s          3s2  3p4  6s
   24    8crviiis2p4 7s          3s2  3p4  7s
   24    8crviiis2p4 8s          3s2  3p4  8s
   24    8crviiis2p4 9s          3s2  3p4  9s
   24    8crviiis2p4 10s         3s2  3p4 10s
   24    8crviiis2p4 11s         3s2  3p4 11s
   24    8crviiis2p4 12s         3s2  3p4 12s
   24    8crviiis2p4 3d          3s2  3p4  3d
   24    8crviiis2p4 4d          3s2  3p4  4d
   24    8crviiis2p4 5d          3s2  3p4  5d
   24    8crviiis2p4 6d          3s2  3p4  6d
   24    8crviiis2p4 7d          3s2  3p4  7d
   24    8crviiis2p4 8d          3s2  3p4  8d
   24    8crviiis2p4 9d          3s2  3p4  9d
   24    8crviiis2p4 10d         3s2  3p4 10d
   24    8crviiis2p4 11d         3s2  3p4 11d
   24    8crviiis2p4 12d         3s2  3p4 12d
   24    8crviiisp6              3s   3p6
   24    8crviiisp5 4p           3s   3p5  4p
   24    8crviiisp5 5p           3s   3p5  5p
   24    8crviiisp5 6p           3s   3p5  6p
   24    8crviiisp5 7p           3s   3p5  7p
   24    8crviiisp5 8p           3s   3p5  8p
   24    8crviiisp5 9p           3s   3p5  9p
   24    8crviiisp5 10p          3s   3p5 10p
   24    8crviiisp5 11p          3s   3p5 11p
   24    8crviiisp5 12p          3s   3p5 12p
   24    8crviiisp5 4f           3s   3p5  4f
   24    8crviiisp5 5f           3s   3p5  5f
   24    8crviiisp5 6f           3s   3p5  6f
   24    8crviiisp5 7f           3s   3p5  7f
   24    8crviiisp5 8f           3s   3p5  8f
   24    8crviiisp5 9f           3s   3p5  9f
   24    8crviiisp5 10f          3s   3p5 10f
   24    8crviiisp5 11f          3s   3p5 11f
   24    8crviiisp5 12f          3s   3p5 12f
   24    8crviiip6 4s            3s0  3p6  4s
   24    8crviiip6 3d            3s0  3p6  3d
   24    8crviiip6 4d            3s0  3p6  4d
   24    8crviiis2p3 3d4p        3s2  3p3  3d   4p
   24    8crviiis2p3 4s4p        3s2  3p3  4s   4p
   24    8crviiisp4 3d2          3s   3p4  3d2
   24    8crviiisp4 3d4s         3s   3p4  3d   4s
   24    8crviiisp4 4s2          3s   3p4  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF240701.DAT;*
$DELETE POOLG:HF240702.DAT;*
$DELETE POOLG:HF240704.DAT;*
$DELETE POOLG:HF240731.DAT;*
$DELETE POOLG:HF240732.DAT;*
