$SET def ku6e:[kurucz.4502]
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN HF450207.DAT FOR007
$ASSIGN HF450201.DAT FOR001
$ASSIGN HF450202.DAT FOR002
$ASSIGN HF450204.DAT FOR004
$ASSIGN HF4502X.PUN FOR011
$ASSIGN HF4502X.RRR FOR012
$ASSIGN HF4502X.DAT FOR013
$ASSIGN HF4502XE.DAT FOR014
$ASSIGN HF450231.DAT FOR031
$ASSIGN HF450232.DAT FOR032
$RUN CRAY:RCN32C
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   45    3rh iiid7               4d7
   45    3rh iiid6 5s            4d6  5s
   45    3rh iiid6 6s            4d6  6s
   45    3rh iiid6 7s            4d6  7s
   45    3rh iiid6 8s            4d6  8s
   45    3rh iiid6 9s            4d6  9s
   45    3rh iiid6 10s           4d6  10s
   45    3rh iiid5 5s2           4d5  5s2
   45    3rh iiid5 5s6s          4d5  5s   6s
   45    3rh iiid5 5s7s          4d5  5s   7s
   45    3rh iiid5 5s8s          4d5  5s   8s
   45    3rh iiid5 5s9s          4d5  5s   9s
   45    3rh iiid5 5s10s         4d5  5s  10s
   45    3rh iiid4s2 6s          4d4  5s2  6s
   45    3rh iiid6 5d            4d6  5d
   45    3rh iiid6 6d            4d6  6d
   45    3rh iiid6 7d            4d6  7d
   45    3rh iiid6 8d            4d6  8d
   45    3rh iiid6 9d            4d6  9d
   45    3rh iiid6 10d           4d6 10d
   45    3rh iiid5 5s5d          4d5  5s   5d
   45    3rh iiid5 5s6d          4d5  5s   6d
   45    3rh iiid5 5s7d          4d5  5s   7d
   45    3rh iiid5 5s8d          4d5  5s   8d
   45    3rh iiid5 5s9d          4d5  5s   9d
   45    3rh iiid5 5s10d         4d5  5s  10d
   45    3rh iiid4s2 5d          4d4  5s2  5d
   45    3rh iiid5 4p2           4d5  5p2
   45    3rh iiid6 5g            4d6  5g
   45    3rh iiid6 6g            4d6  6g
   45    3rh iiid6 7g            4d6  7g
   45    3rh iiid6 8g            4d6  8g
   45    3rh iiid6 9g            4d6  9g
   45    3rh iiid6 10g           4d6 10g
   45    3rh iiid5 5s5g          4d5  5s   5g
   45    3rh iiid5 5s6g          4d5  5s   6g
   45    3rh iiid5 5s7g          4d5  5s   7g
   45    3rh iiid5 5s8g          4d5  5s   8g
   45    3rh iiid5 5s9g          4d5  5s   9g
   45    3rh iiid6 7i            4d6  7i
   45    3rh iiid6 8i            4d6  8i
   45    3rh iiid6 9i            4d6  9i
   45    3rh iiid5 5s7i          4d5  5s   7i
   45    3rh iiid5 5s8i          4d5  5s   8i
   45    3rh iiid5 5s9i          4d5  5s   9i
   45    3rh iiid6 5p            4d6  5p
   45    3rh iiid6 6p            4d6  6p
   45    3rh iiid6 7p            4d6  7p
   45    3rh iiid6 8p            4d6  8p
   45    3rh iiid6 9p            4d6  9p
   45    3rh iiid6 10p           4d6 10p
   45    3rh iiid5 5s5p          4d5  5s   5p
   45    3rh iiid5 5s6p          4d5  5s   6p
   45    3rh iiid5 5s7p          4d5  5s   7p
   45    3rh iiid5 5s8p          4d5  5s   8p
   45    3rh iiid5 5s9p          4d5  5s   9p
   45    3rh iiid5 5s10p         4d5  5s  10p
   45    3rh iiid4s2 5p          4d4  5s2  5p
   45    3rh iiid4s2 6p          4d4  5s2  6p
   45    3rh iiid6 4f            4d6  4f
   45    3rh iiid6 5f            4d6  5f
   45    3rh iiid6 6f            4d6  6f
   45    3rh iiid6 7f            4d6  7f
   45    3rh iiid6 8f            4d6  8f
   45    3rh iiid6 9f            4d6  9f
   45    3rh iiid5 5s4f          4d5  5s   4f
   45    3rh iiid5 5s5f          4d5  5s   5f
   45    3rh iiid5 5s6f          4d5  5s   6f
   45    3rh iiid5 5s7f          4d5  5s   7f
   45    3rh iiid5 5s8f          4d5  5s   8f
   45    3rh iiid5 5s9f          4d5  5s   9f
   45    3rh iiid4s2 4f          4d4  5s2  4f
   45    3rh iiid6 6h            4d6  6h
   45    3rh iiid6 7h            4d6  7h
   45    3rh iiid6 8h            4d6  8h
   45    3rh iiid6 9h            4d6  9h
   45    3rh iiid5 5s6h          4d5  5s   6h
   45    3rh iiid5 5s7h          4d5  5s   7h
   45    3rh iiid5 5s8h          4d5  5s   8h
   45    3rh iiid5 5s9h          4d5  5s   9h
   45    3rh iiid6 8k            4d6  8k
   45    3rh iiid6 9k            4d6  9k
   45    3rh iiid5 5s8k          4d5  5s   8k
   45    3rh iiid5 5s9k          4d5  5s   9k
   -1
$run cray:rcn2c
$DELETE HF450201.DAT;*
$DELETE HF450202.DAT;*
$DELETE HF450204.DAT;*
$DELETE HF450231.DAT;*
$DELETE HF450232.DAT;*
