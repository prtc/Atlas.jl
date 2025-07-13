$SET DEF 2801
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN POOL2:HF280107.DAT FOR007
$ASSIGN POOL2:HF280101.DAT FOR001
$ASSIGN POOL2:HF280102.DAT FOR002
$ASSIGN POOL2:HF280104.DAT FOR004
$ASSIGN HF2801X.PUN FOR011
$ASSIGN HF2801X.RRR FOR012
$ASSIGN HF2801X.DAT FOR013
$ASSIGN HF2801XE.DAT FOR014
$ASSIGN POOL2:HF280131.DAT FOR031
$ASSIGN POOL2:HF280132.DAT FOR032
$RUN CRAY:RCN32C
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   28    2ni ii d9               3d9
   28    2ni ii d8 4d            3d8  4d
   28    2ni ii d8 5d            3d8  5d
   28    2ni ii d8 6d            3d8  6d
   28    2ni ii d8 7d            3d8  7d
   28    2ni ii d8 8d            3d8  8d
   28    2ni ii d8 9d            3d8  9d
   28    2ni ii d8 10d           3d8 10d
   28    2ni ii d8 11d           3d8 11d
   28    2ni ii d8 12d           3d8 12d
   28    2ni ii d8 13d           3d8 13d
   28    2ni ii d7 4s4d          3d7  4s   4d
   28    2ni ii d7 4s5d          3d7  4s   5d
   28    2ni ii d7 4s6d          3d7  4s   6d
   28    2ni ii d7 4s7d          3d7  4s   7d
   28    2ni ii d7 4s8d          3d7  4s   8d
   28    2ni ii d7 4s9d          3d7  4s   9d
   28    2ni ii d7 4s10d         3d7  4s  10d
   28    2ni ii d7 4s11d         3d7  4s  11d
   28    2ni ii d7 4s12d         3d7  4s  12d
   28    2ni ii d7 4s13d         3d7  4s  13d
   28    2ni ii d6s2 4d          3d6  4s2  4d
   28    2ni ii d8 4s            3d8  4s
   28    2ni ii d8 5s            3d8  5s
   28    2ni ii d8 6s            3d8  6s
   28    2ni ii d8 7s            3d8  7s
   28    2ni ii d8 8s            3d8  8s
   28    2ni ii d8 9s            3d8  9s
   28    2ni ii d8 10s           3d8 10s
   28    2ni ii d8 11s           3d8 11s
   28    2ni ii d8 12s           3d8 12s
   28    2ni ii d8 13s           3d8 13s
   28    2ni ii d7 4s2           3d7  4s2
   28    2ni ii d7 4s5s          3d7  4s   5s
   28    2ni ii d7 4s6s          3d7  4s   6s
   28    2ni ii d7 4s7s          3d7  4s   7s
   28    2ni ii d7 4s8s          3d7  4s   8s
   28    2ni ii d7 4s9s          3d7  4s   9s
   28    2ni ii d7 4s10s         3d7  4s  10s
   28    2ni ii d7 4s11s         3d7  4s  11s
   28    2ni ii d7 4s12s         3d7  4s  12s
   28    2ni ii d6s2 5s          3d6  4s2  5s
   28    2ni ii d8 5g            3d8  5g
   28    2ni ii d8 6g            3d8  6g
   28    2ni ii d8 7g            3d8  7g
   28    2ni ii d8 8g            3d8  8g
   28    2ni ii d8 9g            3d8  9g
   28    2ni ii d7 4s5g          3d7  4s   5g
   28    2ni ii d7 4s6g          3d7  4s   6g
   28    2ni ii d7 4s7g          3d7  4s   7g
   28    2ni ii d7 4s8g          3d7  4s   8g
   28    2ni ii d7 4s9g          3d7  4s   9g
   28    2ni ii d8 7i            3d8  7i
   28    2ni ii d8 8i            3d8  8i
   28    2ni ii d8 9i            3d8  9i
   28    2ni ii d7 4s7i          3d7  4s   7i
   28    2ni ii d7 4s8i          3d7  4s   8i
   28    2ni ii d7 4s9i          3d7  4s   9i
   28    2ni ii d8 9l            3d8 10l                                               actually 9l
   28    2ni ii d7 4s9l          3d7  4s  10l                                          actually 9l
   28    2ni ii d7 4p2           3d7  4p2
   28    2ni ii d8 4p            3d8  4p
   28    2ni ii d8 5p            3d8  5p
   28    2ni ii d8 6p            3d8  6p
   28    2ni ii d8 7p            3d8  7p
   28    2ni ii d8 8p            3d8  8p
   28    2ni ii d8 9p            3d8  9p
   28    2ni ii d8 10p           3d8 10p
   28    2ni ii d8 11p           3d8 11p
   28    2ni ii d8 12p           3d8 12p
   28    2ni ii d8 13p           3d8 13p
   28    2ni ii d8 14p           3d8 14p
   28    2ni ii d8 15p           3d8 15p
   28    2ni ii d7 4s4p          3d7  4s   4p
   28    2ni ii d7 4s5p          3d7  4s   5p
   28    2ni ii d7 4s6p          3d7  4s   6p
   28    2ni ii d7 4s7p          3d7  4s   7p
   28    2ni ii d7 4s8p          3d7  4s   8p
   28    2ni ii d7 4s9p          3d7  4s   9p
   28    2ni ii d7 4s10p         3d7  4s  10p
   28    2ni ii d7 4s11p         3d7  4s  11p
   28    2ni ii d7 4s12p         3d7  4s  12p
   28    2ni ii d7 4s13p         3d7  4s  13p
   28    2ni ii d7 4s14p         3d7  4s  14p
   28    2ni ii d6s2 4p          3d6  4s2  4p
   28    2ni ii d6s2 5p          3d6  4s2  5p
   28    2ni ii d6s2 6p          3d6  4s2  6p
   28    2ni ii d6s2 7p          3d6  4s2  7p
   28    2ni ii d6s2 8p          3d6  4s2  8p
   28    2ni ii d6s2 9p          3d6  4s2  9p
   28    2ni ii d8 4f            3d8  4f
   28    2ni ii d8 5f            3d8  5f
   28    2ni ii d8 6f            3d8  6f
   28    2ni ii d8 7f            3d8  7f
   28    2ni ii d8 8f            3d8  8f
   28    2ni ii d8 9f            3d8  9f
   28    2ni ii d8 10f           3d8 10f
   28    2ni ii d8 11f           3d8 11f
   28    2ni ii d8 12f           3d8 12f
   28    2ni ii d8 13f           3d8 13f
   28    2ni ii d7 4s4f          3d7  4s   4f
   28    2ni ii d7 4s5f          3d7  4s   5f
   28    2ni ii d7 4s6f          3d7  4s   6f
   28    2ni ii d7 4s7f          3d7  4s   7f
   28    2ni ii d7 4s8f          3d7  4s   8f
   28    2ni ii d7 4s9f          3d7  4s   9f
   28    2ni ii d7 4s10f         3d7  4s  10f
   28    2ni ii d7 4s11f         3d7  4s  11f
   28    2ni ii d7 4s12f         3d7  4s  12f
   28    2ni ii d7 4s13f         3d7  4s  13f
   28    2ni ii d6s2 4f          3d6  4s2  4f
   28    2ni ii d6s2 5f          3d6  4s2  5f
   28    2ni ii d6s2 6f          3d6  4s2  6f
   28    2ni ii d6s2 7f          3d6  4s2  7f
   28    2ni ii d6s2 8f          3d6  4s2  8f
   28    2ni ii d6s2 9f          3d6  4s2  9f
   28    2ni ii d8 6h            3d8  6h
   28    2ni ii d8 7h            3d8  7h
   28    2ni ii d8 8h            3d8  8h
   28    2ni ii d8 9h            3d8  9h
   28    2ni ii d8 8k            3d8  8k
   28    2ni ii d8 9k            3d8  9k
   -1
$run cray:rcn2c
$DELETE POOL2:HF280101.DAT;*
$DELETE POOL2:HF280102.DAT;*
$DELETE POOL2:HF280104.DAT;*
$DELETE POOL2:HF280131.DAT;*
$DELETE POOL2:HF280132.DAT;*
