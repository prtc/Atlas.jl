$set def 2502
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf250207.dat for007
$assign poolg:hf250201.dat for001
$assign poolg:hf250202.dat for002
$assign poolg:hf250204.dat for004
$assign hf2502x.pun for011
$assign hf2502x.rrr for012
$assign hf2502x.dat for013
$assign hf2502xe.dat for014
$assign poolg:hf250231.dat for031
$assign poolg:hf250232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   25    3mniii d5               3d5
   25    3mniii d4 4d            3d4  4d
   25    3mniii d4 5d            3d4  5d
   25    3mniii d4 6d            3d4  6d
   25    3mniii d4 7d            3d4  7d
   25    3mniii d4 8d            3d4  8d
   25    3mniii d4 9d            3d4  9d
   25    3mniii d4 10d           3d4 10d
   25    3mniii d3 4s4d          3d3  4s   4d
   25    3mniii d3 4s5d          3d3  4s   5d
   25    3mniii d3 4s6d          3d3  4s   6d
   25    3mniii d3 4s7d          3d3  4s   7d
   25    3mniii d3 4s8d          3d3  4s   8d
   25    3mniii d3 4s9d          3d3  4s   9d
   25    3mniii d3 4s10d         3d3  4s  10d
   25    3mniii d2s2 4d          3d2  4s2  4d
   25    3mniii d2s2 5d          3d2  4s2  5d
   25    3mniii d2s2 6d          3d2  4s2  6d
   25    3mniii d2s2 7d          3d2  4s2  7d
   25    3mniii d2s2 8d          3d2  4s2  8d
   25    3mniii d2s2 9d          3d2  4s2  9d
   25    3mniii d2s2 10d         3d2  4s2 10d
   25    3mniii d4 4s            3d4  4s
   25    3mniii d4 5s            3d4  5s
   25    3mniii d4 6s            3d4  6s
   25    3mniii d4 7s            3d4  7s
   25    3mniii d4 8s            3d4  8s
   25    3mniii d4 9s            3d4  9s
   25    3mniii d4 10s           3d4 10s
   25    3mniii d3 4s2           3d3  4s2
   25    3mniii d3 4s5s          3d3  4s   5s
   25    3mniii d3 4s6s          3d3  4s   6s
   25    3mniii d3 4s7s          3d3  4s   7s
   25    3mniii d3 4s8s          3d3  4s   8s
   25    3mniii d3 4s9s          3d3  4s   9s
   25    3mniii d3 4s10s         3d3  4s  10s
   25    3mniii d2s2 5s          3d2  4s2  5s
   25    3mniii d2s2 6s          3d2  4s2  6s
   25    3mniii d2s2 7s          3d2  4s2  7s
   25    3mniii d2s2 8s          3d2  4s2  8s
   25    3mniii d2s2 9s          3d2  4s2  9s
   25    3mniii d2s2 10s         3d2  4s2 10s
   25    3mniii d4 5g            3d4  5g
   25    3mniii d4 6g            3d4  6g
   25    3mniii d4 7g            3d4  7g
   25    3mniii d4 8g            3d4  8g
   25    3mniii d4 9g            3d4  9g
   25    3mniii d4 10g           3d4 10g
   25    3mniii d3 4s5g          3d3  4s   5g
   25    3mniii d3 4s6g          3d3  4s   6g
   25    3mniii d3 4s7g          3d3  4s   7g
   25    3mniii d3 4s8g          3d3  4s   8g
   25    3mniii d3 4s9g          3d3  4s   9g
   25    3mniii d3 4s10g         3d3  4s  10g
   25    3mniii d4 7i            3d4  7i
   25    3mniii d4 8i            3d4  8i
   25    3mniii d4 9i            3d4  9i
   25    3mniii d3 4s7i          3d3  4s   7i
   25    3mniii d3 4s8i          3d3  4s   8i
   25    3mniii d3 4s9i          3d3  4s   9i
   25    3mniii d3 4p2           3d3  4p2
   25    3mniii d4 4p            3d4  4p
   25    3mniii d4 5p            3d4  5p
   25    3mniii d4 6p            3d4  6p
   25    3mniii d4 7p            3d4  7p
   25    3mniii d4 8p            3d4  8p
   25    3mniii d4 9p            3d4  9p
   25    3mniii d4 10p           3d4 10p
   25    3mniii d4 11p           3d4 11p
   25    3mniii d3 4s4p          3d3  4s   4p
   25    3mniii d3 4s5p          3d3  4s   5p
   25    3mniii d3 4s6p          3d3  4s   6p
   25    3mniii d3 4s7p          3d3  4s   7p
   25    3mniii d3 4s8p          3d3  4s   8p
   25    3mniii d3 4s9p          3d3  4s   9p
   25    3mniii d3 4s10p         3d3  4s  10p
   25    3mniii d3 4s11p         3d3  4s  11p
   25    3mniii d2s2 4p          3d2  4s2  4p
   25    3mniii d2s2 5p          3d2  4s2  5p
   25    3mniii d2s2 6p          3d2  4s2  6p
   25    3mniii d2s2 7p          3d2  4s2  7p
   25    3mniii d2s2 8p          3d2  4s2  8p
   25    3mniii d2s2 9p          3d2  4s2  9p
   25    3mniii d2s2 10p         3d2  4s2 10p
   25    3mniii d2s2 11p         3d2  4s2 11p
   25    3mniii d4 4f            3d4  4f
   25    3mniii d4 5f            3d4  5f
   25    3mniii d4 6f            3d4  6f
   25    3mniii d4 7f            3d4  7f
   25    3mniii d4 8f            3d4  8f
   25    3mniii d4 9f            3d4  9f
   25    3mniii d4 10f           3d4 10f
   25    3mniii d4 11f           3d4 11f
   25    3mniii d3 4s4f          3d3  4s   4f
   25    3mniii d3 4s5f          3d3  4s   5f
   25    3mniii d3 4s6f          3d3  4s   6f
   25    3mniii d3 4s7f          3d3  4s   7f
   25    3mniii d3 4s8f          3d3  4s   8f
   25    3mniii d3 4s9f          3d3  4s   9f
   25    3mniii d3 4s10f         3d3  4s  10f
   25    3mniii d3 4s11f         3d3  4s  11f
   25    3mniii d2s2 4f          3d2  4s2  4f
   25    3mniii d2s2 5f          3d2  4s2  5f
   25    3mniii d2s2 6f          3d2  4s2  6f
   25    3mniii d2s2 7f          3d2  4s2  7f
   25    3mniii d2s2 8f          3d2  4s2  8f
   25    3mniii d2s2 9f          3d2  4s2  9f
   25    3mniii d2s2 10f         3d2  4s2 10f
   25    3mniii d2s2 11f         3d2  4s2 11f
   25    3mniii d4 6h            3d4  6h
   25    3mniii d4 7h            3d4  7h
   25    3mniii d4 8h            3d4  8h
   25    3mniii d4 9h            3d4  9h
   25    3mniii d4 10h           3d4 10h
   25    3mniii d3 4s6h          3d3  4s   6h
   25    3mniii d3 4s7h          3d3  4s   7h
   25    3mniii d3 4s8h          3d3  4s   8h
   25    3mniii d3 4s9h          3d3  4s   9h
   25    3mniii d4 8k            3d4  8k
   25    3mniii d4 9k            3d4  9k
   25    3mniii d3 4s8k          3d3  4s   8k
   25    3mniii d3 4s9k          3d3  4s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF250201.DAT;*
$DELETE POOLG:HF250202.DAT;*
$DELETE POOLG:HF250204.DAT;*
$DELETE POOLG:HF250231.DAT;*
$DELETE POOLG:HF250232.DAT;*
