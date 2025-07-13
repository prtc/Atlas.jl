$set4701
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf470107.dat for007
$assign poolg:hf470101.dat for001
$assign poolg:hf470102.dat for002
$assign poolg:hf470104.dat for004
$assign hf4701.pun for011
$assign hf4701.dat for013
$assign hf4701e.dat for014
$assign poolg:hf470131.dat for031
$assign poolg:hf470132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   47    2ag ii d10              4d10  
   47    2ag ii d9 5d            4d9  5d
   47    2ag ii d9 6d            4d9  6d
   47    2ag ii d9 7d            4d9  7d
   47    2ag ii d9 8d            4d9  8d
   47    2ag ii d9 9d            4d9  9d
   47    2ag ii d8 5s5d          4d8  5s   5d
   47    2ag ii d8 5s6d          4d8  5s   6d
   47    2ag ii d8 5s7d          4d8  5s   7d
   47    2ag ii d8 5s8d          4d8  5s   8d
   47    2ag ii d8 5s9d          4d8  5s   9d
   47    2ag ii d7s2 5d          4d7  5s2  5d
   47    2ag ii d9 5s            4d9  5s
   47    2ag ii d9 6s            4d9  6s
   47    2ag ii d9 7s            4d9  7s
   47    2ag ii d9 8s            4d9  8s
   47    2ag ii d9 9s            4d9  9s
   47    2ag ii d8 5s2           4d8  5s2
   47    2ag ii d8 5s6s          4d8  5s   6s
   47    2ag ii d8 5s7s          4d8  5s   7s
   47    2ag ii d8 5s8s          4d8  5s   8s
   47    2ag ii d8 5s9s          4d8  5s   9s
   47    2ag ii d7s2 6s          4d7  5s2  6s
   47    2ag ii d9 5g            4d9  5g
   47    2ag ii d9 6g            4d9  6g
   47    2ag ii d9 7g            4d9  7g
   47    2ag ii d9 8g            4d9  8g
   47    2ag ii d9 9g            4d9  9g
   47    2ag ii d8 5s5g          4d8  5s   5g
   47    2ag ii d8 5s6g          4d8  5s   6g
   47    2ag ii d8 5s7g          4d8  5s   7g
   47    2ag ii d8 5s8g          4d8  5s   8g
   47    2ag ii d8 5s9g          4d8  5s   9g
   47    2ag ii d9 7i            4d9  7i
   47    2ag ii d9 8i            4d9  8i
   47    2ag ii d9 9i            4d9  9i
   47    2ag ii d8 5s7i          4d8  5s   7i
   47    2ag ii d8 5s8i          4d8  5s   8i
   47    2ag ii d8 5s9i          4d8  5s   9i
   47    2ag ii d9 9l            4d9 10l
   47    2ag ii d8 5s9l          4d8  5s  10l
   47    2ag ii d8 5p2           4d8  5p2
   47    2ag ii d9 5p            4d9  5p
   47    2ag ii d9 6p            4d9  6p
   47    2ag ii d9 7p            4d9  7p
   47    2ag ii d9 8p            4d9  8p
   47    2ag ii d9 9p            4d9  9p
   47    2ag ii d8 5s5p          4d8  5s   5p
   47    2ag ii d8 5s6p          4d8  5s   6p
   47    2ag ii d8 5s7p          4d8  5s   7p
   47    2ag ii d8 5s8p          4d8  5s   8p
   47    2ag ii d8 5s9p          4d8  5s   9p
   47    2ag ii d7s2 5p          4d7  5s2  5p
   47    2ag ii d9 4f            4d9  4f
   47    2ag ii d9 5f            4d9  5f
   47    2ag ii d9 6f            4d9  6f
   47    2ag ii d9 7f            4d9  7f
   47    2ag ii d9 8f            4d9  8f
   47    2ag ii d9 9f            4d9  9f
   47    2ag ii d8 5s4f          4d8  5s   4f
   47    2ag ii d8 5s5f          4d8  5s   5f
   47    2ag ii d8 5s6f          4d8  5s   6f
   47    2ag ii d8 5s7f          4d8  5s   7f
   47    2ag ii d8 5s8f          4d8  5s   8f
   47    2ag ii d8 5s9f          4d8  5s   9f
   47    2ag ii d7s2 4f          4d7  5s2  4f
   47    2ag ii d9 6h            4d9  6h
   47    2ag ii d9 7h            4d9  7h
   47    2ag ii d9 8h            4d9  8h
   47    2ag ii d9 9h            4d9  9h
   47    2ag ii d8 5s6h          4d8  5s   6h
   47    2ag ii d8 5s7h          4d8  5s   7h
   47    2ag ii d8 5s8h          4d8  5s   8h
   47    2ag ii d8 5s9h          4d8  5s   9h
   47    2ag ii d9 8k            4d9  8k
   47    2ag ii d9 9k            4d9  9k
   47    2ag ii d8 5s8k          4d8  5s   8k
   47    2ag ii d8 5s9k          4d8  5s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF470101.DAT;*
$DELETE POOLG:HF470102.DAT;*
$DELETE POOLG:HF470104.DAT;*
$DELETE POOLG:HF470131.DAT;*
$DELETE POOLG:HF470132.DAT;*
