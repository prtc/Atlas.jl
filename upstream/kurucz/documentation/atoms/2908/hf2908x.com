$set def 2908
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf290807.dat for007
$assign poolg:hf290801.dat for001
$assign poolg:hf290802.dat for002
$assign poolg:hf290804.dat for004
$assign hf2908X.pun for011
$assign hf2908X.RRR for012
$assign hf2908X.dat for013
$assign hf2908Xe.dat for014
$assign poolg:hf290831.dat for031
$assign poolg:hf290832.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   29    9cu ix d3               3p6  3d3
   29    9cu ix d2 4d            3p6  3d2  4d
   29    9cu ix d2 5d            3p6  3d2  5d
   29    9cu ix d2 6d            3p6  3d2  6d
   29    9cu ix d2 7d            3p6  3d2  7d
   29    9cu ix d2 8d            3p6  3d2  8d
   29    9cu ix d2 9d            3p6  3d2  9d
   29    9cu ix d2 10d           3p6  3d2 10d
   29    9cu ix d1 4s4d          3p6  3d1  4s   4d
   29    9cu ix d1 4s5d          3p6  3d1  4s   5d
   29    9cu ix d1 4s6d          3p6  3d1  4s   6d
   29    9cu ix d1 4s7d          3p6  3d1  4s   7d
   29    9cu ix d1 4s8d          3p6  3d1  4s   8d
   29    9cu ix d1 4s9d          3p6  3d1  4s   9d
   29    9cu ix d1 4s10d         3p6  3d1  4s  10d
   29    9cu ix 4s2 4d           3p6  4s2  4d
   29    9cu ix 4s2 5d           3p6  4s2  5d
   29    9cu ix 4s2 6d           3p6  4s2  6d
   29    9cu ix 4s2 7d           3p6  4s2  7d
   29    9cu ix 4s2 8d           3p6  4s2  8d
   29    9cu ix 4s2 9d           3p6  4s2  9d
   29    9cu ix 4s2 10d          3p6  4s2 10d
   29    9cu ix d2 4s            3p6  3d2  4s
   29    9cu ix d2 5s            3p6  3d2  5s
   29    9cu ix d2 6s            3p6  3d2  6s
   29    9cu ix d2 7s            3p6  3d2  7s
   29    9cu ix d2 8s            3p6  3d2  8s
   29    9cu ix d2 9s            3p6  3d2  9s
   29    9cu ix d2 10s           3p6  3d2 10s
   29    9cu ix d1 4s2           3p6  3d1  4s2
   29    9cu ix d1 4s5s          3p6  3d1  4s   5s
   29    9cu ix d1 4s6s          3p6  3d1  4s   6s
   29    9cu ix d1 4s7s          3p6  3d1  4s   7s
   29    9cu ix d1 4s8s          3p6  3d1  4s   8s
   29    9cu ix d1 4s9s          3p6  3d1  4s   9s
   29    9cu ix d1 4s10s         3p6  3d1  4s  10s
   29    9cu ix 4s2 5s           3p6  4s2  5s
   29    9cu ix 4s2 6s           3p6  4s2  6s
   29    9cu ix 4s2 7s           3p6  4s2  7s
   29    9cu ix 4s2 8s           3p6  4s2  8s
   29    9cu ix 4s2 9s           3p6  4s2  9s
   29    9cu ix 4s2 10s          3p6  4s2 10s
   29    9cu ix d2 5g            3p6  3d2  5g
   29    9cu ix d2 6g            3p6  3d2  6g
   29    9cu ix d2 7g            3p6  3d2  7g
   29    9cu ix d2 8g            3p6  3d2  8g
   29    9cu ix d2 9g            3p6  3d2  9g
   29    9cu ix d2 10g           3p6  3d2 10g
   29    9cu ix d1 4s5g          3p6  3d1  4s   5g
   29    9cu ix d1 4s6g          3p6  3d1  4s   6g
   29    9cu ix d1 4s7g          3p6  3d1  4s   7g
   29    9cu ix d1 4s8g          3p6  3d1  4s   8g
   29    9cu ix d1 4s9g          3p6  3d1  4s   9g
   29    9cu ix d1 4s10g         3p6  3d1  4s  10g
   29    9cu ix d2 7i            3p6  3d2  7i
   29    9cu ix d2 8i            3p6  3d2  8i
   29    9cu ix d2 9i            3p6  3d2  9i
   29    9cu ix d1 4s7i          3p6  3d1  4s   7i
   29    9cu ix d1 4s8i          3p6  3d1  4s   8i
   29    9cu ix d1 4s9i          3p6  3d1  4s   9i
   29    9cu ix d1 4p2           3p6  3d1  4p2
   29    9cu ix d2 4p            3p6  3d2  4p
   29    9cu ix d2 5p            3p6  3d2  5p
   29    9cu ix d2 6p            3p6  3d2  6p
   29    9cu ix d2 7p            3p6  3d2  7p
   29    9cu ix d2 8p            3p6  3d2  8p
   29    9cu ix d2 9p            3p6  3d2  9p
   29    9cu ix d2 10p           3p6  3d2 10p
   29    9cu ix d2 11p           3p6  3d2 11p
   29    9cu ix d2 12p           3p6  3d2 12p
   29    9cu ix d1 4s4p          3p6  3d1  4s   4p
   29    9cu ix d1 4s5p          3p6  3d1  4s   5p
   29    9cu ix d1 4s6p          3p6  3d1  4s   6p
   29    9cu ix d1 4s7p          3p6  3d1  4s   7p
   29    9cu ix d1 4s8p          3p6  3d1  4s   8p
   29    9cu ix d1 4s9p          3p6  3d1  4s   9p
   29    9cu ix d1 4s10p         3p6  3d1  4s  10p
   29    9cu ix d1 4s11p         3p6  3d1  4s  11p
   29    9cu ix d1 4s12p         3p6  3d1  4s  12p
   29    9cu ix 4s2 4p           3p6  4s2  4p
   29    9cu ix 4s2 5p           3p6  4s2  5p
   29    9cu ix 4s2 6p           3p6  4s2  6p
   29    9cu ix 4s2 7p           3p6  4s2  7p
   29    9cu ix 4s2 8p           3p6  4s2  8p
   29    9cu ix 4s2 9p           3p6  4s2  9p
   29    9cu ix 4s2 10p          3p6  4s2 10p
   29    9cu ix 4s2 11p          3p6  4s2 11p
   29    9cu ix d2 4f            3p6  3d2  4f
   29    9cu ix d2 5f            3p6  3d2  5f
   29    9cu ix d2 6f            3p6  3d2  6f
   29    9cu ix d2 7f            3p6  3d2  7f
   29    9cu ix d2 8f            3p6  3d2  8f
   29    9cu ix d2 9f            3p6  3d2  9f
   29    9cu ix d2 10f           3p6  3d2 10f
   29    9cu ix d2 11f           3p6  3d2 11f
   29    9cu ix d1 4s4f          3p6  3d1  4s   4f
   29    9cu ix d1 4s5f          3p6  3d1  4s   5f
   29    9cu ix d1 4s6f          3p6  3d1  4s   6f
   29    9cu ix d1 4s7f          3p6  3d1  4s   7f
   29    9cu ix d1 4s8f          3p6  3d1  4s   8f
   29    9cu ix d1 4s9f          3p6  3d1  4s   9f
   29    9cu ix d1 4s10f         3p6  3d1  4s  10f
   29    9cu ix d1 4s11f         3p6  3d1  4s  11f
   29    9cu ix 4s2 4f           3p6  4s2  4f
   29    9cu ix 4s2 5f           3p6  4s2  5f
   29    9cu ix 4s2 6f           3p6  4s2  6f
   29    9cu ix 4s2 7f           3p6  4s2  7f
   29    9cu ix 4s2 8f           3p6  4s2  8f
   29    9cu ix 4s2 9f           3p6  4s2  9f
   29    9cu ix d2 6h            3p6  3d2  6h
   29    9cu ix d2 7h            3p6  3d2  7h
   29    9cu ix d2 8h            3p6  3d2  8h
   29    9cu ix d2 9h            3p6  3d2  9h
   29    9cu ix d1 4s6h          3p6  3d1  4s   6h
   29    9cu ix d1 4s7h          3p6  3d1  4s   7h
   29    9cu ix d1 4s8h          3p6  3d1  4s   8h
   29    9cu ix d1 4s9h          3p6  3d1  4s   9h
   29    9cu ix d2 8k            3p6  3d2  8k
   29    9cu ix d2 9k            3p6  3d2  9k
   29    9cu ix d1 4s8k          3p6  3d1  4s   8k
   29    9cu ix d1 4s9k          3p6  3d1  4s   9k
   29    9cu ix p5d4             3p5  3d4  
   -1
$run cray:rcn2c
$DELETE POOLG:HF290801.DAT;*
$DELETE POOLG:HF290802.DAT;*
$DELETE POOLG:HF290804.DAT;*
$DELETE POOLG:HF290831.DAT;*
$DELETE POOLG:HF290832.DAT;*
