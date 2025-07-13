$SET2601
$ASSIGN SYS$INPUT FOR010
$ASSIGN SYS$OUTPUT FOR009
$ASSIGN POOLG:HF260107.DAT FOR007
$ASSIGN POOLG:HF260101.DAT FOR001
$ASSIGN POOLG:HF260102.DAT FOR002
$ASSIGN POOLG:HF260104.DAT FOR004
$ASSIGN HF2601X.PUN FOR011
$ASSIGN HF2601X.RRR FOR012
$ASSIGN HF2601X.DAT FOR013
$ASSIGN HF2601XE.DAT FOR014
$ASSIGN POOLG:HF260131.DAT FOR031
$ASSIGN POOLG:HF260132.DAT FOR032
$RUN CRAY:RCN32C
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   26    2fe ii d7               3d7
   26    2fe ii d6 4s            3d6  4s
   26    2fe ii d6 5s            3d6  5s
   26    2fe ii d6 6s            3d6  6s
   26    2fe ii d6 7s            3d6  7s
   26    2fe ii d6 8s            3d6  8s
   26    2fe ii d6 9s            3d6  9s
   26    2fe ii d5 4s2           3d5  4s2
   26    2fe ii d5 4s5s          3d5  4s   5s
   26    2fe ii d5 4s6s          3d5  4s   6s
   26    2fe ii d5 4s7s          3d5  4s   7s
   26    2fe ii d5 4s8s          3d5  4s   8s
   26    2fe ii d5 4s9s          3d5  4s   9s
   26    2fe ii d4s2 5s          3d4  4s2  5s
   26    2fe ii d6 4d            3d6  4d
   26    2fe ii d6 5d            3d6  5d
   26    2fe ii d6 6d            3d6  6d
   26    2fe ii d6 7d            3d6  7d
   26    2fe ii d6 8d            3d6  8d
   26    2fe ii d6 9d            3d6  9d
   26    2fe ii d5 4s4d          3d5  4s   4d
   26    2fe ii d5 4s5d          3d5  4s   5d
   26    2fe ii d5 4s6d          3d5  4s   6d
   26    2fe ii d5 4s7d          3d5  4s   7d
   26    2fe ii d5 4s8d          3d5  4s   8d
   26    2fe ii d5 4s9d          3d5  4s   9d
   26    2fe ii d4s2 4d          3d4  4s2  4d
   26    2fe ii d5 4p2           3d5  4p2
   26    2fe ii d6 5g            3d6  5g
   26    2fe ii d6 6g            3d6  6g
   26    2fe ii d6 7g            3d6  7g
   26    2fe ii d6 8g            3d6  8g
   26    2fe ii d6 9g            3d6  9g
   26    2fe ii d5 4s5g          3d5  4s   5g
   26    2fe ii d5 4s6g          3d5  4s   6g
   26    2fe ii d5 4s7g          3d5  4s   7g
   26    2fe ii d5 4s8g          3d5  4s   8g
   26    2fe ii d5 4s9g          3d5  4s   9g
   26    2fe ii d6 7i            3d6  7i
   26    2fe ii d6 8i            3d6  8i
   26    2fe ii d6 9i            3d6  9i
   26    2fe ii d5 4s7i          3d5  4s   7i
   26    2fe ii d5 4s8i          3d5  4s   8i
   26    2fe ii d5 4s9i          3d5  4s   9i
   26    2fe ii d6 9l            3d6 10l
   26    2fe ii d5 4s9l          3d5  4s  10l
   26    2fe ii d6 4p            3d6  4p
   26    2fe ii d6 5p            3d6  5p
   26    2fe ii d6 6p            3d6  6p
   26    2fe ii d6 7p            3d6  7p
   26    2fe ii d6 8p            3d6  8p
   26    2fe ii d6 9p            3d6  9p
   26    2fe ii d5 4s4p          3d5  4s   4p
   26    2fe ii d5 4s5p          3d5  4s   5p
   26    2fe ii d5 4s6p          3d5  4s   6p
   26    2fe ii d5 4s7p          3d5  4s   7p
   26    2fe ii d5 4s8p          3d5  4s   8p
   26    2fe ii d5 4s9p          3d5  4s   9p
   26    2fe ii d4s2 4p          3d4  4s2  4p
   26    2fe ii d4s2 5p          3d4  4s2  5p
   26    2fe ii d6 4f            3d6  4f
   26    2fe ii d6 5f            3d6  5f
   26    2fe ii d6 6f            3d6  6f
   26    2fe ii d6 7f            3d6  7f
   26    2fe ii d6 8f            3d6  8f
   26    2fe ii d6 9f            3d6  9f
   26    2fe ii d5 4s4f          3d5  4s   4f
   26    2fe ii d5 4s5f          3d5  4s   5f
   26    2fe ii d5 4s6f          3d5  4s   6f
   26    2fe ii d5 4s7f          3d5  4s   7f
   26    2fe ii d5 4s8f          3d5  4s   8f
   26    2fe ii d5 4s9f          3d5  4s   9f
   26    2fe ii d4s2 4f          3d4  4s2  4f
   26    2fe ii d6 6h            3d6  6h
   26    2fe ii d6 7h            3d6  7h
   26    2fe ii d6 8h            3d6  8h
   26    2fe ii d6 9h            3d6  9h
   26    2fe ii d5 4s6h          3d5  4s   6h
   26    2fe ii d5 4s7h          3d5  4s   7h
   26    2fe ii d5 4s8h          3d5  4s   8h
   26    2fe ii d5 4s9h          3d5  4s   9h
   26    2fe ii d6 8k            3d6  8k
   26    2fe ii d6 9k            3d6  9k
   26    2fe ii d5 4s8k          3d5  4s   8k
   26    2fe ii d5 4s9k          3d5  4s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF260101.DAT;*
$DELETE POOLG:HF260102.DAT;*
$DELETE POOLG:HF260104.DAT;*
$DELETE POOLG:HF260131.DAT;*
$DELETE POOLG:HF260132.DAT;*
