$set def 3000
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf300007.dat for007
$assign poolg:hf300001.dat for001
$assign poolg:hf300002.dat for002
$assign poolg:hf300004.dat for004
$assign hf3000z.pun for011
$assign hf3000z.rrr for012
$assign hf3000z.dat for013
$assign hf3000ze.dat for014
$assign poolg:hf300031.dat for031
$assign poolg:hf300032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   30    1zn i  d10 4s2          3d10 4s2
   30    1zn i  d10 4s5s         3d10 4s   5s
   30    1zn i  d10 4s6s         3d10 4s   6s
   30    1zn i  d10 4s7s         3d10 4s   7s
   30    1zn i  d10 4s8s         3d10 4s   8s
   30    1zn i  d10 4s9s         3d10 4s   9s
   30    1zn i  d10 4s10s        3d10 4s  10s
   30    1zn i  d10 4s11s        3d10 4s  11s
   30    1zn i  d10 4s12s        3d10 4s  12s
   30    1zn i  d10 4s13s        3d10 4s  13s
   30    1zn i  d10 4s14s        3d10 4s  14s
   30    1zn i  d9s2 5s          3d9  4s2  5s
   30    1zn i  d9s2 6s          3d9  4s2  6s
   30    1zn i  d9s2 7s          3d9  4s2  7s
   30    1zn i  d9s2 8s          3d9  4s2  8s
   30    1zn i  d9s2 9s          3d9  4s2  9s
   30    1zn i  d9s2 10s         3d9  4s2 10s
   30    1zn i  d9s2 11s         3d9  4s2 11s
   30    1zn i  d9s2 12s         3d9  4s2 12s
   30    1zn i  d9s2 13s         3d9  4s2 13s
   30    1zn i  d9s2 14s         3d9  4s2 14s
   30    1zn i  d10 4s4d         3d10 4s   4d
   30    1zn i  d10 4s5d         3d10 4s   5d
   30    1zn i  d10 4s6d         3d10 4s   6d
   30    1zn i  d10 4s7d         3d10 4s   7d
   30    1zn i  d10 4s8d         3d10 4s   8d
   30    1zn i  d10 4s9d         3d10 4s   9d
   30    1zn i  d10 4s10d        3d10 4s  10d
   30    1zn i  d10 4s11d        3d10 4s  11d
   30    1zn i  d10 4s12d        3d10 4s  12d
   30    1zn i  d10 4s13d        3d10 4s  13d
   30    1zn i  d10 4s14d        3d10 4s  14d
   30    1zn i  d10 4s15d        3d10 4s  15d
   30    1zn i  d9s2 4d          3d9  4s2  4d
   30    1zn i  d9s2 5d          3d9  4s2  5d
   30    1zn i  d9s2 6d          3d9  4s2  6d
   30    1zn i  d9s2 7d          3d9  4s2  7d
   30    1zn i  d9s2 8d          3d9  4s2  8d
   30    1zn i  d9s2 9d          3d9  4s2  9d
   30    1zn i  d9s2 10d         3d9  4s2 10d
   30    1zn i  d9s2 11d         3d9  4s2 11d
   30    1zn i  d9s2 12d         3d9  4s2 12d
   30    1zn i  d9s2 13d         3d9  4s2 13d
   30    1zn i  d9s2 14d         3d9  4s2 14d
   30    1zn i  d10 4s5g         3d10 4s   5g
   30    1zn i  d10 4s6g         3d10 4s   6g
   30    1zn i  d10 4s7g         3d10 4s   7g
   30    1zn i  d10 4s8g         3d10 4s   8g
   30    1zn i  d10 4s9g         3d10 4s   9g
   30    1zn i  d9s2 5g          3d9  4s2  5g
   30    1zn i  d9s2 6g          3d9  4s2  6g
   30    1zn i  d9s2 7g          3d9  4s2  7g
   30    1zn i  d9s2 8g          3d9  4s2  8g
   30    1zn i  d9s2 9g          3d9  4s2  9g
   30    1zn i  d10 4s7i         3d10 4s   7i
   30    1zn i  d10 4s8i         3d10 4s   8i
   30    1zn i  d10 4s9i         3d10 4s   9i
   30    1zn i  d9s2 7i          3d9  4s2  7i
   30    1zn i  d9s2 8i          3d9  4s2  8i
   30    1zn i  d9s2 9i          3d9  4s2  9i
   30    1zn i  d10 4p2          3d10 4p2
   30    1zn i  d10 4s4p         3d10 4s   4p
   30    1zn i  d10 4s5p         3d10 4s   5p
   30    1zn i  d10 4s6p         3d10 4s   6p
   30    1zn i  d10 4s7p         3d10 4s   7p
   30    1zn i  d10 4s8p         3d10 4s   8p
   30    1zn i  d10 4s9p         3d10 4s   9p
   30    1zn i  d10 4s10p        3d10 4s  10p
   30    1zn i  d10 4s11p        3d10 4s  11p
   30    1zn i  d10 4s12p        3d10 4s  12p
   30    1zn i  d10 4s13p        3d10 4s  13p
   30    1zn i  d10 4s14p        3d10 4s  14p
   30    1zn i  d10 4s15p        3d10 4s  15p
   30    1zn i  d9s2 4p          3d9  4s2  4p
   30    1zn i  d9s2 5p          3d9  4s2  5p
   30    1zn i  d9s2 6p          3d9  4s2  6p
   30    1zn i  d9s2 7p          3d9  4s2  7p
   30    1zn i  d9s2 8p          3d9  4s2  8p
   30    1zn i  d9s2 9p          3d9  4s2  9p
   30    1zn i  d9s2 10p         3d9  4s2 10p
   30    1zn i  d9s2 11p         3d9  4s2 11p
   30    1zn i  d9s2 12p         3d9  4s2 12p
   30    1zn i  d9s2 13p         3d9  4s2 13p
   30    1zn i  d9s2 14p         3d9  4s2 14p
   30    1zn i  d9s2 15p         3d9  4s2 15p
   30    1zn i  d10 4s4f         3d10 4s   4f
   30    1zn i  d10 4s5f         3d10 4s   5f
   30    1zn i  d10 4s6f         3d10 4s   6f
   30    1zn i  d10 4s7f         3d10 4s   7f
   30    1zn i  d10 4s8f         3d10 4s   8f
   30    1zn i  d10 4s9f         3d10 4s   9f
   30    1zn i  d10 4s10f        3d10 4s  10f
   30    1zn i  d10 4s11f        3d10 4s  11f
   30    1zn i  d10 4s12f        3d10 4s  12f
   30    1zn i  d10 4s13f        3d10 4s  13f
   30    1zn i  d10 4s14f        3d10 4s  14f
   30    1zn i  d9s2 4f          3d9  4s2  4f
   30    1zn i  d9s2 5f          3d9  4s2  5f
   30    1zn i  d9s2 6f          3d9  4s2  6f
   30    1zn i  d9s2 7f          3d9  4s2  7f
   30    1zn i  d9s2 8f          3d9  4s2  8f
   30    1zn i  d9s2 9f          3d9  4s2  9f
   30    1zn i  d9s2 10f         3d9  4s2 10f
   30    1zn i  d9s2 11f         3d9  4s2 11f
   30    1zn i  d9s2 12f         3d9  4s2 12f
   30    1zn i  d9s2 13f         3d9  4s2 13f
   30    1zn i  d9s2 14f         3d9  4s2 13f
   30    1zn i  d10 4s6h         3d10 4s   6h
   30    1zn i  d10 4s7h         3d10 4s   7h
   30    1zn i  d10 4s8h         3d10 4s   8h
   30    1zn i  d10 4s9h         3d10 4s   9h
   30    1zn i  d9s2 6h          3d9  4s2  6h
   30    1zn i  d9s2 7h          3d9  4s2  7h
   30    1zn i  d9s2 8h          3d9  4s2  8h
   30    1zn i  d9s2 9h          3d9  4s2  9h
   30    1zn i  d10 4s8k         3d10 4s   8k
   30    1zn i  d10 4s9k         3d10 4s   9k
   30    1zn i  d9s2 8k          3d9  4s2  8k
   30    1zn i  d9s2 9k          3d9  4s2  9k
   30    1zn i  d10 4p5s         3d10 4p   5s
   30    1zn i  d10 5s5p         3d10 5s   5p
   30    1zn i  d9 4s4p5s        3d9  4s   4p   5s
   -1
   30    1zn i  d10 5s6p         3d10 5s   6p
   30    1zn i  d10 5s7p         3d10 5s   7p
   30    1zn i  d10 5s8p         3d10 5s   8p
   30    1zn i  d10 5s9p         3d10 5s   9p
   30    1zn i  d10 4p 6s        3d10 4p   6s
   30    1zn i  d10 4p 7s        3d10 4p   7s
   30    1zn i  d10 4p 8s        3d10 4p   8s
   30    1zn i  d10 4p 9s        3d10 4p   9s
   30    1zn i  d9 4s4p6s        3d9  4s   4p   6s
   30    1zn i  d9 4s4p7s        3d9  4s   4p   7s
   30    1zn i  d9 4s4p8s        3d9  4s   4p   8s
   30    1zn i  d9 4s4p9s        3d9  4s   4p   9s
   30    1zn i  d9 4s4p5d        3d9  4s   4p   5d
   30    1zn i  d9 4s4p6d        3d9  4s   4p   6d
   30    1zn i  d9 4s4p7d        3d9  4s   4p   7d
   30    1zn i  d9 4s4p8d        3d9  4s   4p   8d
   30    1zn i  d9 4s4p9d        3d9  4s   4p   9d
   30    1zn i  d10 4p 4d        3d10 4p   4d
   30    1zn i  d10 4p 5d        3d10 4p   5d
   30    1zn i  d10 4p 6d        3d10 4p   6d
   30    1zn i  d10 4p 7d        3d10 4p   7d
   30    1zn i  d10 4p 8d        3d10 4p   8d
   30    1zn i  d10 4p 9d        3d10 4p   9d
   30    1zn i  d9 4s4p4d        3d9  4s   4p   4d
   30    1zn i  d10 4p 5p        3d10 4p   5p
   -1
$run cray:rcn2c
$DELETE POOLG:HF300001.DAT;*
$DELETE POOLG:HF300002.DAT;*
$DELETE POOLG:HF300004.DAT;*
$DELETE POOLG:HF300031.DAT;*
$DELETE POOLG:HF300032.DAT;*
