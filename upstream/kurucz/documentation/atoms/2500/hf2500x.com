$set2500
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf250007.dat for007
$assign poolg:hf250001.dat for001
$assign poolg:hf250002.dat for002
$assign poolg:hf250004.dat for004
$assign hf2500x.pun for011
$assign hf2500x.rrr for012
$assign hf2500x.dat for013
$assign hf2500xe.dat for014
$assign poolg:hf250031.dat for031
$assign poolg:hf250032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   25    1mn i  d5 4s2           3d5  4s2
   25    1mn i  d5 4s5s          3d5  4s   5s
   25    1mn i  d5 4s6s          3d5  4s   6s
   25    1mn i  d5 4s7s          3d5  4s   7s
   25    1mn i  d5 4s8s          3d5  4s   8s
   25    1mn i  d5 4s9s          3d5  4s   9s
   25    1mn i  d6 4s            3d6  4s
   25    1mn i  d6 5s            3d6  5s
   25    1mn i  d6 6s            3d6  6s
   25    1mn i  d6 7s            3d6  7s
   25    1mn i  d6 8s            3d6  8s
   25    1mn i  d6 9s            3d6  9s
   25    1mn i  d4s2 5s          3d4  4s2  5s
   25    1mn i  d5 4s4d          3d5  4s   4d
   25    1mn i  d5 4s5d          3d5  4s   5d
   25    1mn i  d5 4s6d          3d5  4s   6d
   25    1mn i  d5 4s7d          3d5  4s   7d
   25    1mn i  d5 4s8d          3d5  4s   8d
   25    1mn i  d5 4s9d          3d5  4s   9d
   25    1mn i  d7               3d7
   25    1mn i  d6 4d            3d6  4d
   25    1mn i  d6 5d            3d6  5d
   25    1mn i  d6 6d            3d6  6d
   25    1mn i  d6 7d            3d6  7d
   25    1mn i  d6 8d            3d6  8d
   25    1mn i  d6 9d            3d6  9d
   25    1mn i  d4s2 4d          3d4  4s2  4d
   25    1mn i  d5 4s5g          3d5  4s   5g
   25    1mn i  d5 4s6g          3d5  4s   6g
   25    1mn i  d5 4s7g          3d5  4s   7g
   25    1mn i  d5 4s8g          3d5  4s   8g
   25    1mn i  d5 4s9g          3d5  4s   9g
   25    1mn i  d6 5g            3d6  5g
   25    1mn i  d6 6g            3d6  6g
   25    1mn i  d6 7g            3d6  7g
   25    1mn i  d6 8g            3d6  8g
   25    1mn i  d6 9g            3d6  9g
   25    1mn i  d5 4s7i          3d5  4s   7i
   25    1mn i  d5 4s8i          3d5  4s   8i
   25    1mn i  d5 4s9i          3d5  4s   9i
   25    1mn i  d6 7i            3d6  7i
   25    1mn i  d6 8i            3d6  8i
   25    1mn i  d6 9i            3d6  9i
   25    1mn i  d5 4p2           3d5  4p2
   25    1mn i  d5 4s4p          3d5  4s   4p
   25    1mn i  d5 4s5p          3d5  4s   5p
   25    1mn i  d5 4s6p          3d5  4s   6p
   25    1mn i  d5 4s7p          3d5  4s   7p
   25    1mn i  d5 4s8p          3d5  4s   8p
   25    1mn i  d5 4s9p          3d5  4s   9p
   25    1mn i  d6 4p            3d6  4p
   25    1mn i  d6 5p            3d6  5p
   25    1mn i  d6 6p            3d6  6p
   25    1mn i  d6 7p            3d6  7p
   25    1mn i  d6 8p            3d6  8p
   25    1mn i  d6 9p            3d6  9p
   25    1mn i  d4s2 4p          3d4  4s2  4p
   25    1mn i  d4s2 5p          3d4  4s2  5p
   25    1mn i  d5 4s4f          3d5  4s   4f
   25    1mn i  d5 4s5f          3d5  4s   5f
   25    1mn i  d5 4s6f          3d5  4s   6f
   25    1mn i  d5 4s7f          3d5  4s   7f
   25    1mn i  d5 4s8f          3d5  4s   8f
   25    1mn i  d5 4s9f          3d5  4s   9f
   25    1mn i  d6 4f            3d6  4f
   25    1mn i  d6 5f            3d6  5f
   25    1mn i  d6 6f            3d6  6f
   25    1mn i  d6 7f            3d6  7f
   25    1mn i  d6 8f            3d6  8f
   25    1mn i  d6 9f            3d6  9f
   25    1mn i  d4s2 4f          3d4  4s2  4f
   25    1mn i  d5 4s6h          3d5  4s   6h
   25    1mn i  d5 4s7h          3d5  4s   7h
   25    1mn i  d5 4s8h          3d5  4s   8h
   25    1mn i  d5 4s9h          3d5  4s   9h
   25    1mn i  d6 6h            3d6  6h
   25    1mn i  d6 7h            3d6  7h
   25    1mn i  d6 8h            3d6  8h
   25    1mn i  d6 9h            3d6  9h
   25    1mn i  d5 4s8k          3d5  4s   8k
   25    1mn i  d5 4s9k          3d5  4s   9k
   25    1mn i  d6 8k            3d6  8k
   25    1mn i  d6 9k            3d6  9k
   -1
   25    1mn i  d5 4s9l          3d5  4s  10l                                       actually 9l
   25    1mn i  d6 9l            3d6 10l                                            actually 9l
   -1
$run cray:rcn2c
$DELETE POOLG:HF250001.DAT;*
$DELETE POOLG:HF250002.DAT;*
$DELETE POOLG:HF250004.DAT;*
$DELETE POOLG:HF250031.DAT;*
$DELETE POOLG:HF250032.DAT;*
