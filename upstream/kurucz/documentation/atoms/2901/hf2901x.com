$set def 2901
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf290107.dat for007
$assign poolg:hf290101.dat for001
$assign poolg:hf290102.dat for002
$assign poolg:hf290104.dat for004
$assign hf2901x.pun for011
$assign hf2901x.rrr for012
$assign hf2901x.dat for013
$assign hf2901xe.dat for014
$assign poolg:hf290131.dat for031
$assign poolg:hf290132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   29    2cu ii d10              3d10
   29    2cu ii d9 4d            3d9  4d
   29    2cu ii d9 5d            3d9  5d
   29    2cu ii d9 6d            3d9  6d
   29    2cu ii d9 7d            3d9  7d
   29    2cu ii d9 8d            3d9  8d
   29    2cu ii d9 9d            3d9  9d
   29    2cu ii d8 4s4d          3d8  4s   4d
   29    2cu ii d8 4s5d          3d8  4s   5d
   29    2cu ii d8 4s6d          3d8  4s   6d
   29    2cu ii d8 4s7d          3d8  4s   7d
   29    2cu ii d8 4s8d          3d8  4s   8d
   29    2cu ii d8 4s9d          3d8  4s   9d
   29    2cu ii d7s2 4d          3d7  4s2  4d
   29    2cu ii d7s2 5d          3d7  4s2  5d
   29    2cu ii d7s2 6d          3d7  4s2  6d
   29    2cu ii d7s2 7d          3d7  4s2  7d
   29    2cu ii d7s2 8d          3d7  4s2  8d
   29    2cu ii d7s2 9d          3d7  4s2  9d
   29    2cu ii d9 4s            3d9  4s
   29    2cu ii d9 5s            3d9  5s
   29    2cu ii d9 6s            3d9  6s
   29    2cu ii d9 7s            3d9  7s
   29    2cu ii d9 8s            3d9  8s
   29    2cu ii d9 9s            3d9  9s
   29    2cu ii d9 10s           3d9 10s
   29    2cu ii d9 11s           3d9 11s
   29    2cu ii d9 12s           3d9 12s
   29    2cu ii d8 4s2           3d8  4s2
   29    2cu ii d8 4s5s          3d8  4s   5s
   29    2cu ii d8 4s6s          3d8  4s   6s
   29    2cu ii d8 4s7s          3d8  4s   7s
   29    2cu ii d8 4s8s          3d8  4s   8s
   29    2cu ii d8 4s9s          3d8  4s   9s
   29    2cu ii d8 4s10s         3d8  4s  10s
   29    2cu ii d8 4s11s         3d8  4s  11s
   29    2cu ii d8 4s12s         3d8  4s  12s
   29    2cu ii d7s2 5s          3d7  4s2  5s
   29    2cu ii d7s2 6s          3d7  4s2  6s
   29    2cu ii d7s2 7s          3d7  4s2  7s
   29    2cu ii d7s2 8s          3d7  4s2  8s
   29    2cu ii d7s2 9s          3d7  4s2  9s
   29    2cu ii d8 4s5g          3d8  4s   5g
   29    2cu ii d8 4s6g          3d8  4s   6g
   29    2cu ii d8 4s7g          3d8  4s   7g
   29    2cu ii d8 4s8g          3d8  4s   8g
   29    2cu ii d8 4s9g          3d8  4s   9g
   29    2cu ii d9 5g            3d9  5g
   29    2cu ii d9 6g            3d9  6g
   29    2cu ii d9 7g            3d9  7g
   29    2cu ii d9 8g            3d9  8g
   29    2cu ii d9 9g            3d9  9g
   29    2cu ii d8 4s7i          3d8  4s   7i
   29    2cu ii d8 4s8i          3d8  4s   8i
   29    2cu ii d8 4s9i          3d8  4s   9i
   29    2cu ii d9 7i            3d9  7i
   29    2cu ii d9 8i            3d9  8i
   29    2cu ii d9 9i            3d9  9i
   29    2cu ii d9 9l            3d9 10l
   29    2cu ii d8 4s9l          3d8  4s  10l
   29    2cu ii d8 4p2           3d8  4p2
   29    2cu ii d9 4p            3d9  4p
   29    2cu ii d9 5p            3d9  5p
   29    2cu ii d9 6p            3d9  6p
   29    2cu ii d9 7p            3d9  7p
   29    2cu ii d9 8p            3d9  8p
   29    2cu ii d9 9p            3d9  9p
   29    2cu ii d9 10p           3d9 10p
   29    2cu ii d9 11p           3d9 11p
   29    2cu ii d9 12p           3d9 12p
   29    2cu ii d9 13p           3d9 13p
   29    2cu ii d8 4s4p          3d8  4s   4p
   29    2cu ii d8 4s5p          3d8  4s   5p
   29    2cu ii d8 4s6p          3d8  4s   6p
   29    2cu ii d8 4s7p          3d8  4s   7p
   29    2cu ii d8 4s8p          3d8  4s   8p
   29    2cu ii d8 4s9p          3d8  4s   9p
   29    2cu ii d8 4s10p         3d8  4s  10p
   29    2cu ii d8 4s11p         3d8  4s  11p
   29    2cu ii d8 4s12p         3d8  4s  12p
   29    2cu ii d8 4s13p         3d8  4s  13p
   29    2cu ii d7s2 4p          3d7  4s2  4p
   29    2cu ii d7s2 5p          3d7  4s2  5p
   29    2cu ii d7s2 6p          3d7  4s2  6p
   29    2cu ii d7s2 7p          3d7  4s2  7p
   29    2cu ii d7s2 8p          3d7  4s2  8p
   29    2cu ii d7s2 9p          3d7  4s2  9p
   29    2cu ii d7s2 10p         3d7  4s2 10p
   29    2cu ii d7s2 11p         3d7  4s2 11p
   29    2cu ii d7s2 12p         3d7  4s2 12p
   29    2cu ii d7s2 13p         3d7  4s2 13p
   29    2cu ii d7s2 14p         3d7  4s2 14p
   29    2cu ii d8 4s4f          3d8  4s   4f
   29    2cu ii d8 4s5f          3d8  4s   5f
   29    2cu ii d8 4s6f          3d8  4s   6f
   29    2cu ii d8 4s7f          3d8  4s   7f
   29    2cu ii d8 4s8f          3d8  4s   8f
   29    2cu ii d8 4s9f          3d8  4s   9f
   29    2cu ii d9 4f            3d9  4f
   29    2cu ii d9 5f            3d9  5f
   29    2cu ii d9 6f            3d9  6f
   29    2cu ii d9 7f            3d9  7f
   29    2cu ii d9 8f            3d9  8f
   29    2cu ii d9 9f            3d9  9f
   29    2cu ii d7s2 4f          3d7  4s2  4f
   29    2cu ii d7s2 5f          3d7  4s2  5f
   29    2cu ii d7s2 6f          3d7  4s2  6f
   29    2cu ii d7s2 7f          3d7  4s2  7f
   29    2cu ii d7s2 8f          3d7  4s2  8f
   29    2cu ii d7s2 9f          3d7  4s2  9f
   29    2cu ii d8 4s6h          3d8  4s   6h
   29    2cu ii d8 4s7h          3d8  4s   7h
   29    2cu ii d8 4s8h          3d8  4s   8h
   29    2cu ii d8 4s9h          3d8  4s   9h
   29    2cu ii d9 6h            3d9  6h
   29    2cu ii d9 7h            3d9  7h
   29    2cu ii d9 8h            3d9  8h
   29    2cu ii d9 9h            3d9  9h
   29    2cu ii d8 4s8k          3d8  4s   8k
   29    2cu ii d8 4s9k          3d8  4s   9k
   29    2cu ii d9 8k            3d9  8k
   29    2cu ii d9 9k            3d9  9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF290101.DAT;*
$DELETE POOLG:HF290102.DAT;*
$DELETE POOLG:HF290104.DAT;*
$DELETE POOLG:HF290131.DAT;*
$DELETE POOLG:HF290132.DAT;*
