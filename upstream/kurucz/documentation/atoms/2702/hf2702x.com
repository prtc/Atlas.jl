$set def 2702
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf270207.dat for007
$assign poolg:hf270201.dat for001
$assign poolg:hf270202.dat for002
$assign poolg:hf270204.dat for004
$assign hf2702X.pun for011
$assign hf2702X.rrr for012
$assign hf2702X.dat for013
$assign hf2702Xe.dat for014
$assign poolg:hf270231.dat for031
$assign poolg:hf270232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   27    3co iiid7               3d7
   27    3co iiid6 4s            3d6  4s
   27    3co iiid6 5s            3d6  5s
   27    3co iiid6 6s            3d6  6s
   27    3co iiid6 7s            3d6  7s
   27    3co iiid6 8s            3d6  8s
   27    3co iiid6 9s            3d6  9s
   27    3co iiid5 4s2           3d5  4s2
   27    3co iiid5 4s5s          3d5  4s   5s
   27    3co iiid5 4s6s          3d5  4s   6s
   27    3co iiid5 4s7s          3d5  4s   7s
   27    3co iiid5 4s8s          3d5  4s   8s
   27    3co iiid5 4s9s          3d5  4s   9s
   27    3co iiid4 4s2 5s        3d4  4s2  5s
   27    3co iiid6 4d            3d6  4d
   27    3co iiid6 5d            3d6  5d
   27    3co iiid6 6d            3d6  6d
   27    3co iiid6 7d            3d6  7d
   27    3co iiid6 8d            3d6  8d
   27    3co iiid6 9d            3d6  9d
   27    3co iiid5 4s4d          3d5  4s   4d
   27    3co iiid5 4s5d          3d5  4s   5d
   27    3co iiid5 4s6d          3d5  4s   6d
   27    3co iiid5 4s7d          3d5  4s   7d
   27    3co iiid5 4s8d          3d5  4s   8d
   27    3co iiid5 4s9d          3d5  4s   9d
   27    3co iiid4 4s2 4d        3d4  4s2  4d
   27    3co iiid5 4p2           3d5  4p2
   27    3co iiid6 5g            3d6  5g
   27    3co iiid6 6g            3d6  6g
   27    3co iiid6 7g            3d6  7g
   27    3co iiid6 8g            3d6  8g
   27    3co iiid6 9g            3d6  9g
   27    3co iiid5 4s5g          3d5  4s   5g
   27    3co iiid5 4s6g          3d5  4s   6g
   27    3co iiid5 4s7g          3d5  4s   7g
   27    3co iiid5 4s8g          3d5  4s   8g
   27    3co iiid5 4s9g          3d5  4s   9g
   27    3co iiid6 7i            3d6  7i
   27    3co iiid6 8i            3d6  8i
   27    3co iiid6 9i            3d6  9i
   27    3co iiid5 4s7i          3d5  4s   7i
   27    3co iiid5 4s8i          3d5  4s   8i
   27    3co iiid5 4s9i          3d5  4s   9i
   27    3co iiid6 4p            3d6  4p
   27    3co iiid6 5p            3d6  5p
   27    3co iiid6 6p            3d6  6p
   27    3co iiid6 7p            3d6  7p
   27    3co iiid6 8p            3d6  8p
   27    3co iiid6 9p            3d6  9p
   27    3co iiid5 4s4p          3d5  4s   4p
   27    3co iiid5 4s5p          3d5  4s   5p
   27    3co iiid5 4s6p          3d5  4s   6p
   27    3co iiid5 4s7p          3d5  4s   7p
   27    3co iiid5 4s8p          3d5  4s   8p
   27    3co iiid5 4s9p          3d5  4s   9p
   27    3co iiid4 4s2 4p        3d4  4s2  4p
   27    3co iiid4 4s2 5p        3d4  4s2  5p
   27    3co iiid6 4f            3d6  4f
   27    3co iiid6 5f            3d6  5f
   27    3co iiid6 6f            3d6  6f
   27    3co iiid6 7f            3d6  7f
   27    3co iiid6 8f            3d6  8f
   27    3co iiid6 9f            3d6  9f
   27    3co iiid5 4s4f          3d5  4s   4f
   27    3co iiid5 4s5f          3d5  4s   5f
   27    3co iiid5 4s6f          3d5  4s   6f
   27    3co iiid5 4s7f          3d5  4s   7f
   27    3co iiid5 4s8f          3d5  4s   8f
   27    3co iiid5 4s9f          3d5  4s   9f
   27    3co iiid4 4s2 4f        3d4  4s2  4f
   27    3co iiid6 6h            3d6  6h
   27    3co iiid6 7h            3d6  7h
   27    3co iiid6 8h            3d6  8h
   27    3co iiid6 9h            3d6  9h
   27    3co iiid5 4s6h          3d5  4s   6h
   27    3co iiid5 4s7h          3d5  4s   7h
   27    3co iiid5 4s8h          3d5  4s   8h
   27    3co iiid5 4s9h          3d5  4s   9h
   27    3co iiid6 8k            3d6  8k
   27    3co iiid6 9k            3d6  9k
   27    3co iiid5 4s8k          3d5  4s   8k
   27    3co iiid5 4s9k          3d5  4s   9k
   -1
   27    3co iiid6 9l            3d6  9l
   27    3co iiid5 4s9i          3d5  4s   9l
   -1
$run cray:rcn2c
$DELETE POOLG:HF270201.DAT;*
$DELETE POOLG:HF270202.DAT;*
$DELETE POOLG:HF270204.DAT;*
$DELETE POOLG:HF270231.DAT;*
$DELETE POOLG:HF270232.DAT;*
