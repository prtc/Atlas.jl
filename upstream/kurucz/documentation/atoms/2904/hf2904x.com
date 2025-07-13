$set def 2904
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf290407.dat for007
$assign poolg:hf290401.dat for001
$assign poolg:hf290402.dat for002
$assign poolg:hf290404.dat for004
$assign hf2904x.pun for011
$assign hf2904x.rrr for012
$assign hf2904x.dat for013
$assign hf2904xe.dat for014
$assign poolg:hf290431.dat for031
$assign poolg:hf290432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   29    5cu v  d7               3d7
   29    5cu v  d6 4s            3d6  4s
   29    5cu v  d6 5s            3d6  5s
   29    5cu v  d6 6s            3d6  6s
   29    5cu v  d6 7s            3d6  7s
   29    5cu v  d6 8s            3d6  8s
   29    5cu v  d6 9s            3d6  9s
   29    5cu v  d5 4s2           3d5  4s2
   29    5cu v  d5 4s5s          3d5  4s   5s
   29    5cu v  d5 4s6s          3d5  4s   6s
   29    5cu v  d5 4s7s          3d5  4s   7s
   29    5cu v  d5 4s8s          3d5  4s   8s
   29    5cu v  d5 4s9s          3d5  4s   9s
   29    5cu v  d4 4s2 5s        3d4  4s2  5s
   29    5cu v  d6 4d            3d6  4d
   29    5cu v  d6 5d            3d6  5d
   29    5cu v  d6 6d            3d6  6d
   29    5cu v  d6 7d            3d6  7d
   29    5cu v  d6 8d            3d6  8d
   29    5cu v  d6 9d            3d6  9d
   29    5cu v  d5 4s4d          3d5  4s   4d
   29    5cu v  d5 4s5d          3d5  4s   5d
   29    5cu v  d5 4s6d          3d5  4s   6d
   29    5cu v  d5 4s7d          3d5  4s   7d
   29    5cu v  d5 4s8d          3d5  4s   8d
   29    5cu v  d5 4s9d          3d5  4s   9d
   29    5cu v  d4 4s2 4d        3d4  4s2  4d
   29    5cu v  d5 4p2           3d5  4p2
   29    5cu v  d6 5g            3d6  5g
   29    5cu v  d6 6g            3d6  6g
   29    5cu v  d6 7g            3d6  7g
   29    5cu v  d6 8g            3d6  8g
   29    5cu v  d6 9g            3d6  9g
   29    5cu v  d5 4s5g          3d5  4s   5g
   29    5cu v  d5 4s6g          3d5  4s   6g
   29    5cu v  d5 4s7g          3d5  4s   7g
   29    5cu v  d5 4s8g          3d5  4s   8g
   29    5cu v  d5 4s9g          3d5  4s   9g
   29    5cu v  d6 7i            3d6  7i
   29    5cu v  d6 8i            3d6  8i
   29    5cu v  d6 9i            3d6  9i
   29    5cu v  d5 4s7i          3d5  4s   7i
   29    5cu v  d5 4s8i          3d5  4s   8i
   29    5cu v  d5 4s9i          3d5  4s   9i
   29    5cu v  d6 4p            3p6  3d6  4p
   29    5cu v  d6 5p            3p6  3d6  5p
   29    5cu v  d6 6p            3p6  3d6  6p
   29    5cu v  d6 7p            3p6  3d6  7p
   29    5cu v  d6 8p            3p6  3d6  8p
   29    5cu v  d6 9p            3p6  3d6  9p
   29    5cu v  d5 4s4p          3p6  3d5  4s   4p
   29    5cu v  d5 4s5p          3p6  3d5  4s   5p
   29    5cu v  d5 4s6p          3p6  3d5  4s   6p
   29    5cu v  d5 4s7p          3p6  3d5  4s   7p
   29    5cu v  d5 4s8p          3p6  3d5  4s   8p
   29    5cu v  d5 4s9p          3p6  3d5  4s   9p
   29    5cu v  d4 4s2 4p        3p6  3d4  4s2  4p
   29    5cu v  d6 4f            3p6  3d6  4f
   29    5cu v  d6 5f            3p6  3d6  5f
   29    5cu v  d6 6f            3p6  3d6  6f
   29    5cu v  d6 7f            3p6  3d6  7f
   29    5cu v  d6 8f            3p6  3d6  8f
   29    5cu v  d6 9f            3p6  3d6  9f
   29    5cu v  d5 4s4f          3p6  3d5  4s   4f
   29    5cu v  d5 4s5f          3p6  3d5  4s   5f
   29    5cu v  d5 4s6f          3p6  3d5  4s   6f
   29    5cu v  d5 4s7f          3p6  3d5  4s   7f
   29    5cu v  d5 4s8f          3p6  3d5  4s   8f
   29    5cu v  d5 4s9f          3p6  3d5  4s   9f
   29    5cu v  d4 4s2 4f        3p6  3d4  4s2  4f
   29    5cu v  d6 6h            3p6  3d6  6h
   29    5cu v  d6 7h            3p6  3d6  7h
   29    5cu v  d6 8h            3p6  3d6  8h
   29    5cu v  d6 9h            3p6  3d6  9h
   29    5cu v  d5 4s6h          3p6  3d5  4s   6h
   29    5cu v  d5 4s7h          3p6  3d5  4s   7h
   29    5cu v  d5 4s8h          3p6  3d5  4s   8h
   29    5cu v  d5 4s9h          3p6  3d5  4s   9h
   29    5cu v  d6 8k            3p6  3d6  8k
   29    5cu v  d6 9k            3p6  3d6  9k
   29    5cu v  d5 4s8k          3p6  3d5  4s   8k
   29    5cu v  d5 4s9k          3p6  3d5  4s   9k
   29    5cu v  p5d8             3p5  3d8 
   -1
   29    5cu v  d6 9l            3p6  3d6  9l
   29    5cu v  d5 4s9i          3p6  3d5  4s   9l
   -1
$run cray:rcn2c
$DELETE POOLG:HF290401.DAT;*
$DELETE POOLG:HF290402.DAT;*
$DELETE POOLG:HF290404.DAT;*
$DELETE POOLG:HF290431.DAT;*
$DELETE POOLG:HF290432.DAT;*
