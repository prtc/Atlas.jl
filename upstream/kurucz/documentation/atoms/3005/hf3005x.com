$set def 3005
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf300507.dat for007
$assign poolg:hf300501.dat for001
$assign poolg:hf300502.dat for002
$assign poolg:hf300504.dat for004
$assign hf3005x.pun for011
$assign hf3005x.rrr for012
$assign hf3005x.dat for013
$assign hf3005xe.dat for014
$assign poolg:hf300531.dat for031
$assign poolg:hf300532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   30    6zn vi d7               3d7
   30    6zn vi d6 4s            3d6  4s
   30    6zn vi d6 5s            3d6  5s
   30    6zn vi d6 6s            3d6  6s
   30    6zn vi d6 7s            3d6  7s
   30    6zn vi d6 8s            3d6  8s
   30    6zn vi d6 9s            3d6  9s
   30    6zn vi d5 4s2           3d5  4s2
   30    6zn vi d5 4s5s          3d5  4s   5s
   30    6zn vi d5 4s6s          3d5  4s   6s
   30    6zn vi d5 4s7s          3d5  4s   7s
   30    6zn vi d5 4s8s          3d5  4s   8s
   30    6zn vi d5 4s9s          3d5  4s   9s
   30    6zn vi d4 4s2 5s        3d4  4s2  5s
   30    6zn vi d6 4d            3d6  4d
   30    6zn vi d6 5d            3d6  5d
   30    6zn vi d6 6d            3d6  6d
   30    6zn vi d6 7d            3d6  7d
   30    6zn vi d6 8d            3d6  8d
   30    6zn vi d6 9d            3d6  9d
   30    6zn vi d5 4s4d          3d5  4s   4d
   30    6zn vi d5 4s5d          3d5  4s   5d
   30    6zn vi d5 4s6d          3d5  4s   6d
   30    6zn vi d5 4s7d          3d5  4s   7d
   30    6zn vi d5 4s8d          3d5  4s   8d
   30    6zn vi d5 4s9d          3d5  4s   9d
   30    6zn vi d4 4s2 4d        3d4  4s2  4d
   30    6zn vi d5 4p2           3d5  4p2
   30    6zn vi d6 5g            3d6  5g
   30    6zn vi d6 6g            3d6  6g
   30    6zn vi d6 7g            3d6  7g
   30    6zn vi d6 8g            3d6  8g
   30    6zn vi d6 9g            3d6  9g
   30    6zn vi d5 4s5g          3d5  4s   5g
   30    6zn vi d5 4s6g          3d5  4s   6g
   30    6zn vi d5 4s7g          3d5  4s   7g
   30    6zn vi d5 4s8g          3d5  4s   8g
   30    6zn vi d5 4s9g          3d5  4s   9g
   30    6zn vi d6 7i            3d6  7i
   30    6zn vi d6 8i            3d6  8i
   30    6zn vi d6 9i            3d6  9i
   30    6zn vi d5 4s7i          3d5  4s   7i
   30    6zn vi d5 4s8i          3d5  4s   8i
   30    6zn vi d5 4s9i          3d5  4s   9i
   30    6zn vi d6 4p            3p6  3d6  4p
   30    6zn vi d6 5p            3p6  3d6  5p
   30    6zn vi d6 6p            3p6  3d6  6p
   30    6zn vi d6 7p            3p6  3d6  7p
   30    6zn vi d6 8p            3p6  3d6  8p
   30    6zn vi d6 9p            3p6  3d6  9p
   30    6zn vi d5 4s4p          3p6  3d5  4s   4p
   30    6zn vi d5 4s5p          3p6  3d5  4s   5p
   30    6zn vi d5 4s6p          3p6  3d5  4s   6p
   30    6zn vi d5 4s7p          3p6  3d5  4s   7p
   30    6zn vi d5 4s8p          3p6  3d5  4s   8p
   30    6zn vi d5 4s9p          3p6  3d5  4s   9p
   30    6zn vi d4 4s2 4p        3p6  3d4  4s2  4p
   30    6zn vi d6 4f            3p6  3d6  4f
   30    6zn vi d6 5f            3p6  3d6  5f
   30    6zn vi d6 6f            3p6  3d6  6f
   30    6zn vi d6 7f            3p6  3d6  7f
   30    6zn vi d6 8f            3p6  3d6  8f
   30    6zn vi d6 9f            3p6  3d6  9f
   30    6zn vi d5 4s4f          3p6  3d5  4s   4f
   30    6zn vi d5 4s5f          3p6  3d5  4s   5f
   30    6zn vi d5 4s6f          3p6  3d5  4s   6f
   30    6zn vi d5 4s7f          3p6  3d5  4s   7f
   30    6zn vi d5 4s8f          3p6  3d5  4s   8f
   30    6zn vi d5 4s9f          3p6  3d5  4s   9f
   30    6zn vi d4 4s2 4f        3p6  3d4  4s2  4f
   30    6zn vi d6 6h            3p6  3d6  6h
   30    6zn vi d6 7h            3p6  3d6  7h
   30    6zn vi d6 8h            3p6  3d6  8h
   30    6zn vi d6 9h            3p6  3d6  9h
   30    6zn vi d5 4s6h          3p6  3d5  4s   6h
   30    6zn vi d5 4s7h          3p6  3d5  4s   7h
   30    6zn vi d5 4s8h          3p6  3d5  4s   8h
   30    6zn vi d5 4s9h          3p6  3d5  4s   9h
   30    6zn vi d6 8k            3p6  3d6  8k
   30    6zn vi d6 9k            3p6  3d6  9k
   30    6zn vi d5 4s8k          3p6  3d5  4s   8k
   30    6zn vi d5 4s9k          3p6  3d5  4s   9k
   30    6zn vi p5d8             3p5  3d8 
   -1
   30    6zn vi d6 9l            3p6  3d6  9l
   30    6zn vi d5 4s9i          3p6  3d5  4s   9l
   -1
$run cray:rcn2c
$DELETE POOLG:HF300501.DAT;*
$DELETE POOLG:HF300502.DAT;*
$DELETE POOLG:HF300504.DAT;*
$DELETE POOLG:HF300531.DAT;*
$DELETE POOLG:HF300532.DAT;*
