$SET def ku6e:[kurucz.4300]
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN HF430007.DAT FOR007
$ASSIGN HF430001.DAT FOR001
$ASSIGN HF430002.DAT FOR002
$ASSIGN HF430004.DAT FOR004
$ASSIGN HF4300X.PUN FOR011
$ASSIGN HF4300X.RRR FOR012
$ASSIGN HF4300X.DAT FOR013
$ASSIGN HF4300XE.DAT FOR014
$ASSIGN HF430031.DAT FOR031
$ASSIGN HF430032.DAT FOR032
$RUN CRAY:RCN32C
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   43    1tc i  d6 5s            4d6  5s
   43    1tc i  d6 6s            4d6  6s
   43    1tc i  d6 7s            4d6  7s
   43    1tc i  d6 8s            4d6  8s
   43    1tc i  d6 9s            4d6  9s
   43    1tc i  d6 10s           4d6  10s
   43    1tc i  d5 5s2           4d5  5s2
   43    1tc i  d5 5s6s          4d5  5s   6s
   43    1tc i  d5 5s7s          4d5  5s   7s
   43    1tc i  d5 5s8s          4d5  5s   8s
   43    1tc i  d5 5s9s          4d5  5s   9s
   43    1tc i  d5 5s10s         4d5  5s  10s
   43    1tc i  d4s2 6s          4d4  5s2  6s
   43    1tc i  d7               4d7
   43    1tc i  d6 5d            4d6  5d
   43    1tc i  d6 6d            4d6  6d
   43    1tc i  d6 7d            4d6  7d
   43    1tc i  d6 8d            4d6  8d
   43    1tc i  d6 9d            4d6  9d
   43    1tc i  d6 10d           4d6 10d
   43    1tc i  d5 5s5d          4d5  5s   5d
   43    1tc i  d5 5s6d          4d5  5s   6d
   43    1tc i  d5 5s7d          4d5  5s   7d
   43    1tc i  d5 5s8d          4d5  5s   8d
   43    1tc i  d5 5s9d          4d5  5s   9d
   43    1tc i  d5 5s10d         4d5  5s  10d
   43    1tc i  d4s2 5d          4d4  5s2  5d
   43    1tc i  d5 4p2           4d5  5p2
   43    1tc i  d6 5g            4d6  5g
   43    1tc i  d6 6g            4d6  6g
   43    1tc i  d6 7g            4d6  7g
   43    1tc i  d6 8g            4d6  8g
   43    1tc i  d6 9g            4d6  9g
   43    1tc i  d6 10g           4d6 10g
   43    1tc i  d5 5s5g          4d5  5s   5g
   43    1tc i  d5 5s6g          4d5  5s   6g
   43    1tc i  d5 5s7g          4d5  5s   7g
   43    1tc i  d5 5s8g          4d5  5s   8g
   43    1tc i  d5 5s9g          4d5  5s   9g
   43    1tc i  d6 7i            4d6  7i
   43    1tc i  d6 8i            4d6  8i
   43    1tc i  d6 9i            4d6  9i
   43    1tc i  d5 5s7i          4d5  5s   7i
   43    1tc i  d5 5s8i          4d5  5s   8i
   43    1tc i  d5 5s9i          4d5  5s   9i
   43    1tc i  d6 5p            4d6  5p
   43    1tc i  d6 6p            4d6  6p
   43    1tc i  d6 7p            4d6  7p
   43    1tc i  d6 8p            4d6  8p
   43    1tc i  d6 9p            4d6  9p
   43    1tc i  d6 10p           4d6 10p
   43    1tc i  d5 5s5p          4d5  5s   5p
   43    1tc i  d5 5s6p          4d5  5s   6p
   43    1tc i  d5 5s7p          4d5  5s   7p
   43    1tc i  d5 5s8p          4d5  5s   8p
   43    1tc i  d5 5s9p          4d5  5s   9p
   43    1tc i  d5 5s10p         4d5  5s  10p
   43    1tc i  d4s2 5p          4d4  5s2  5p
   43    1tc i  d4s2 6p          4d4  5s2  6p
   43    1tc i  d6 4f            4d6  4f
   43    1tc i  d6 5f            4d6  5f
   43    1tc i  d6 6f            4d6  6f
   43    1tc i  d6 7f            4d6  7f
   43    1tc i  d6 8f            4d6  8f
   43    1tc i  d6 9f            4d6  9f
   43    1tc i  d5 5s4f          4d5  5s   4f
   43    1tc i  d5 5s5f          4d5  5s   5f
   43    1tc i  d5 5s6f          4d5  5s   6f
   43    1tc i  d5 5s7f          4d5  5s   7f
   43    1tc i  d5 5s8f          4d5  5s   8f
   43    1tc i  d5 5s9f          4d5  5s   9f
   43    1tc i  d4s2 4f          4d4  5s2  4f
   43    1tc i  d6 6h            4d6  6h
   43    1tc i  d6 7h            4d6  7h
   43    1tc i  d6 8h            4d6  8h
   43    1tc i  d6 9h            4d6  9h
   43    1tc i  d5 5s6h          4d5  5s   6h
   43    1tc i  d5 5s7h          4d5  5s   7h
   43    1tc i  d5 5s8h          4d5  5s   8h
   43    1tc i  d5 5s9h          4d5  5s   9h
   43    1tc i  d6 8k            4d6  8k
   43    1tc i  d6 9k            4d6  9k
   43    1tc i  d5 5s8k          4d5  5s   8k
   43    1tc i  d5 5s9k          4d5  5s   9k
   -1
$run cray:rcn2c
$DELETE HF430001.DAT;*
$DELETE HF430002.DAT;*
$DELETE HF430004.DAT;*
$DELETE HF430031.DAT;*
$DELETE HF430032.DAT;*
