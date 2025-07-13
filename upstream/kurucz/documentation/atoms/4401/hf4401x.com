$SET def ku6e:[kurucz.4401]
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN HF440107.DAT FOR007
$ASSIGN HF440101.DAT FOR001
$ASSIGN HF440102.DAT FOR002
$ASSIGN HF440104.DAT FOR004
$ASSIGN HF4401X.PUN FOR011
$ASSIGN HF4401X.RRR FOR012
$ASSIGN HF4401X.DAT FOR013
$ASSIGN HF4401XE.DAT FOR014
$ASSIGN HF440131.DAT FOR031
$ASSIGN HF440132.DAT FOR032
$RUN CRAY:RCN32C
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   44    2ru ii d7               4d7
   44    2ru ii d6 5s            4d6  5s
   44    2ru ii d6 6s            4d6  6s
   44    2ru ii d6 7s            4d6  7s
   44    2ru ii d6 8s            4d6  8s
   44    2ru ii d6 9s            4d6  9s
   44    2ru ii d6 10s           4d6  10s
   44    2ru ii d5 5s2           4d5  5s2
   44    2ru ii d5 5s6s          4d5  5s   6s
   44    2ru ii d5 5s7s          4d5  5s   7s
   44    2ru ii d5 5s8s          4d5  5s   8s
   44    2ru ii d5 5s9s          4d5  5s   9s
   44    2ru ii d5 5s10s         4d5  5s  10s
   44    2ru ii d4s2 6s          4d4  5s2  6s
   44    2ru ii d6 5d            4d6  5d
   44    2ru ii d6 6d            4d6  6d
   44    2ru ii d6 7d            4d6  7d
   44    2ru ii d6 8d            4d6  8d
   44    2ru ii d6 9d            4d6  9d
   44    2ru ii d6 10d           4d6 10d
   44    2ru ii d5 5s5d          4d5  5s   5d
   44    2ru ii d5 5s6d          4d5  5s   6d
   44    2ru ii d5 5s7d          4d5  5s   7d
   44    2ru ii d5 5s8d          4d5  5s   8d
   44    2ru ii d5 5s9d          4d5  5s   9d
   44    2ru ii d5 5s10d         4d5  5s  10d
   44    2ru ii d4s2 5d          4d4  5s2  5d
   44    2ru ii d5 4p2           4d5  5p2
   44    2ru ii d6 5g            4d6  5g
   44    2ru ii d6 6g            4d6  6g
   44    2ru ii d6 7g            4d6  7g
   44    2ru ii d6 8g            4d6  8g
   44    2ru ii d6 9g            4d6  9g
   44    2ru ii d6 10g           4d6 10g
   44    2ru ii d5 5s5g          4d5  5s   5g
   44    2ru ii d5 5s6g          4d5  5s   6g
   44    2ru ii d5 5s7g          4d5  5s   7g
   44    2ru ii d5 5s8g          4d5  5s   8g
   44    2ru ii d5 5s9g          4d5  5s   9g
   44    2ru ii d6 7i            4d6  7i
   44    2ru ii d6 8i            4d6  8i
   44    2ru ii d6 9i            4d6  9i
   44    2ru ii d5 5s7i          4d5  5s   7i
   44    2ru ii d5 5s8i          4d5  5s   8i
   44    2ru ii d5 5s9i          4d5  5s   9i
   44    2ru ii d6 5p            4d6  5p
   44    2ru ii d6 6p            4d6  6p
   44    2ru ii d6 7p            4d6  7p
   44    2ru ii d6 8p            4d6  8p
   44    2ru ii d6 9p            4d6  9p
   44    2ru ii d6 10p           4d6 10p
   44    2ru ii d5 5s5p          4d5  5s   5p
   44    2ru ii d5 5s6p          4d5  5s   6p
   44    2ru ii d5 5s7p          4d5  5s   7p
   44    2ru ii d5 5s8p          4d5  5s   8p
   44    2ru ii d5 5s9p          4d5  5s   9p
   44    2ru ii d5 5s10p         4d5  5s  10p
   44    2ru ii d4s2 5p          4d4  5s2  5p
   44    2ru ii d4s2 6p          4d4  5s2  6p
   44    2ru ii d6 4f            4d6  4f
   44    2ru ii d6 5f            4d6  5f
   44    2ru ii d6 6f            4d6  6f
   44    2ru ii d6 7f            4d6  7f
   44    2ru ii d6 8f            4d6  8f
   44    2ru ii d6 9f            4d6  9f
   44    2ru ii d5 5s4f          4d5  5s   4f
   44    2ru ii d5 5s5f          4d5  5s   5f
   44    2ru ii d5 5s6f          4d5  5s   6f
   44    2ru ii d5 5s7f          4d5  5s   7f
   44    2ru ii d5 5s8f          4d5  5s   8f
   44    2ru ii d5 5s9f          4d5  5s   9f
   44    2ru ii d4s2 4f          4d4  5s2  4f
   44    2ru ii d6 6h            4d6  6h
   44    2ru ii d6 7h            4d6  7h
   44    2ru ii d6 8h            4d6  8h
   44    2ru ii d6 9h            4d6  9h
   44    2ru ii d5 5s6h          4d5  5s   6h
   44    2ru ii d5 5s7h          4d5  5s   7h
   44    2ru ii d5 5s8h          4d5  5s   8h
   44    2ru ii d5 5s9h          4d5  5s   9h
   44    2ru ii d6 8k            4d6  8k
   44    2ru ii d6 9k            4d6  9k
   44    2ru ii d5 5s8k          4d5  5s   8k
   44    2ru ii d5 5s9k          4d5  5s   9k
   -1
$run cray:rcn2c
$DELETE HF440101.DAT;*
$DELETE HF440102.DAT;*
$DELETE HF440104.DAT;*
$DELETE HF440131.DAT;*
$DELETE HF440132.DAT;*
