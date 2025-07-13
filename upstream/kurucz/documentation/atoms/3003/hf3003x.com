$set def 3003
$assign sys$input for010
$assign sys$output for009
$assign pool:hf300307.dat for007
$assign pool:hf300301.dat for001
$assign pool:hf300302.dat for002
$assign pool:hf300304.dat for004
$assign hf3003x.pun for011
$assign hf3003x.rrr for012
$assign hf3003x.dat for013
$assign hf3003xe.dat for014
$assign pool:hf300331.dat for031
$assign pool:hf300332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   30    4zn iv d9               3d9
   30    4zn iv d8 4d            3d8  4d
   30    4zn iv d8 5d            3d8  5d
   30    4zn iv d8 6d            3d8  6d
   30    4zn iv d8 7d            3d8  7d
   30    4zn iv d8 8d            3d8  8d
   30    4zn iv d8 9d            3d8  9d
   30    4zn iv d8 10d           3d8 10d
   30    4zn iv d8 11d           3d8 11d
   30    4zn iv d8 12d           3d8 12d
   30    4zn iv d8 13d           3d8 13d
   30    4zn iv d7 4s4d          3d7  4s   4d
   30    4zn iv d7 4s5d          3d7  4s   5d
   30    4zn iv d7 4s6d          3d7  4s   6d
   30    4zn iv d7 4s7d          3d7  4s   7d
   30    4zn iv d7 4s8d          3d7  4s   8d
   30    4zn iv d7 4s9d          3d7  4s   9d
   30    4zn iv d7 4s10d         3d7  4s  10d
   30    4zn iv d7 4s11d         3d7  4s  11d
   30    4zn iv d7 4s12d         3d7  4s  12d
   30    4zn iv d7 4s13d         3d7  4s  13d
   30    4zn iv d6s2 4d          3d6  4s2  4d
   30    4zn iv d6s2 5d          3d6  4s2  5d
   30    4zn iv d6s2 6d          3d6  4s2  6d
   30    4zn iv d8 4s            3d8  4s
   30    4zn iv d8 5s            3d8  5s
   30    4zn iv d8 6s            3d8  6s
   30    4zn iv d8 7s            3d8  7s
   30    4zn iv d8 8s            3d8  8s
   30    4zn iv d8 9s            3d8  9s
   30    4zn iv d8 10s           3d8 10s
   30    4zn iv d8 11s           3d8 11s
   30    4zn iv d8 12s           3d8 12s
   30    4zn iv d8 13s           3d8 13s
   30    4zn iv d7 4s2           3d7  4s2
   30    4zn iv d7 4s5s          3d7  4s   5s
   30    4zn iv d7 4s6s          3d7  4s   6s
   30    4zn iv d7 4s7s          3d7  4s   7s
   30    4zn iv d7 4s8s          3d7  4s   8s
   30    4zn iv d7 4s9s          3d7  4s   9s
   30    4zn iv d7 4s10s         3d7  4s  10s
   30    4zn iv d7 4s11s         3d7  4s  11s
   30    4zn iv d7 4s12s         3d7  4s  12s
   30    4zn iv d6s2 5s          3d6  4s2  5s
   30    4zn iv d8 5g            3d8  5g
   30    4zn iv d8 6g            3d8  6g
   30    4zn iv d8 7g            3d8  7g
   30    4zn iv d8 8g            3d8  8g
   30    4zn iv d8 9g            3d8  9g
   30    4zn iv d7 4s5g          3d7  4s   5g
   30    4zn iv d7 4s6g          3d7  4s   6g
   30    4zn iv d7 4s7g          3d7  4s   7g
   30    4zn iv d7 4s8g          3d7  4s   8g
   30    4zn iv d7 4s9g          3d7  4s   9g
   30    4zn iv d8 7i            3d8  7i
   30    4zn iv d8 8i            3d8  8i
   30    4zn iv d8 9i            3d8  9i
   30    4zn iv d7 4s7i          3d7  4s   7i
   30    4zn iv d7 4s8i          3d7  4s   8i
   30    4zn iv d7 4s9i          3d7  4s   9i
   30    4zn iv d7 4p2           3d7  4p2
   30    4zn iv d8 4p            3d8  4p
   30    4zn iv d8 5p            3d8  5p
   30    4zn iv d8 6p            3d8  6p
   30    4zn iv d8 7p            3d8  7p
   30    4zn iv d8 8p            3d8  8p
   30    4zn iv d8 9p            3d8  9p
   30    4zn iv d8 10p           3d8 10p
   30    4zn iv d8 11p           3d8 11p
   30    4zn iv d8 12p           3d8 12p
   30    4zn iv d8 13p           3d8 13p
   30    4zn iv d8 14p           3d8 14p
   30    4zn iv d8 15p           3d8 15p
   30    4zn iv d7 4s4p          3d7  4s   4p
   30    4zn iv d7 4s5p          3d7  4s   5p
   30    4zn iv d7 4s6p          3d7  4s   6p
   30    4zn iv d7 4s7p          3d7  4s   7p
   30    4zn iv d7 4s8p          3d7  4s   8p
   30    4zn iv d7 4s9p          3d7  4s   9p
   30    4zn iv d7 4s10p         3d7  4s  10p
   30    4zn iv d7 4s11p         3d7  4s  11p
   30    4zn iv d7 4s12p         3d7  4s  12p
   30    4zn iv d7 4s13p         3d7  4s  13p
   30    4zn iv d7 4s14p         3d7  4s  14p
   30    4zn iv d6s2 4p          3d6  4s2  4p
   30    4zn iv d6s2 5p          3d6  4s2  5p
   30    4zn iv d6s2 6p          3d6  4s2  6p
   30    4zn iv d6s2 7p          3d6  4s2  7p
   30    4zn iv d6s2 8p          3d6  4s2  8p
   30    4zn iv d6s2 9p          3d6  4s2  9p
   30    4zn iv d8 4f            3d8  4f
   30    4zn iv d8 5f            3d8  5f
   30    4zn iv d8 6f            3d8  6f
   30    4zn iv d8 7f            3d8  7f
   30    4zn iv d8 8f            3d8  8f
   30    4zn iv d8 9f            3d8  9f
   30    4zn iv d8 10f           3d8 10f
   30    4zn iv d8 11f           3d8 11f
   30    4zn iv d8 12f           3d8 12f
   30    4zn iv d8 13f           3d8 13f
   30    4zn iv d7 4s4f          3d7  4s   4f
   30    4zn iv d7 4s5f          3d7  4s   5f
   30    4zn iv d7 4s6f          3d7  4s   6f
   30    4zn iv d7 4s7f          3d7  4s   7f
   30    4zn iv d7 4s8f          3d7  4s   8f
   30    4zn iv d7 4s9f          3d7  4s   9f
   30    4zn iv d7 4s10f         3d7  4s  10f
   30    4zn iv d7 4s11f         3d7  4s  11f
   30    4zn iv d7 4s12f         3d7  4s  12f
   30    4zn iv d7 4s13f         3d7  4s  13f
   30    4zn iv d6s2 4f          3d6  4s2  4f
   30    4zn iv d6s2 5f          3d6  4s2  5f
   30    4zn iv d6s2 6f          3d6  4s2  6f
   30    4zn iv d6s2 7f          3d6  4s2  7f
   30    4zn iv d6s2 8f          3d6  4s2  8f
   30    4zn iv d6s2 9f          3d6  4s2  9f
   30    4zn iv d8 6h            3d8  6h
   30    4zn iv d8 7h            3d8  7h
   30    4zn iv d8 8h            3d8  8h
   30    4zn iv d8 9h            3d8  9h
   30    4zn iv d8 8k            3d8  8k
   30    4zn iv d8 9k            3d8  9k
   -1
$run cray:rcn2c
$DELETE POOL:HF300301.DAT;*
$DELETE POOL:HF300302.DAT;*
$DELETE POOL:HF300304.DAT;*
$DELETE POOL:HF300331.DAT;*
$DELETE POOL:HF300332.DAT;*
