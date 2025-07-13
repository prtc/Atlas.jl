$set2603
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf260307.dat for007
$assign poolg:hf260301.dat for001
$assign poolg:hf260302.dat for002
$assign poolg:hf260304.dat for004
$assign hf2603x.pun for011
$assign hf2603x.rrr for012
$assign hf2603x.dat for013
$assign hf2603xe.dat for014
$assign poolg:hf260331.dat for031
$assign poolg:hf260332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   26    4fe iv d5               3d5
   26    4fe iv d4 4d            3d4  4d
   26    4fe iv d4 5d            3d4  5d
   26    4fe iv d4 6d            3d4  6d
   26    4fe iv d4 7d            3d4  7d
   26    4fe iv d4 8d            3d4  8d
   26    4fe iv d4 9d            3d4  9d
   26    4fe iv d4 10d           3d4 10d
   26    4fe iv d3 4s4d          3d3  4s   4d
   26    4fe iv d3 4s5d          3d3  4s   5d
   26    4fe iv d3 4s6d          3d3  4s   6d
   26    4fe iv d3 4s7d          3d3  4s   7d
   26    4fe iv d3 4s8d          3d3  4s   8d
   26    4fe iv d3 4s9d          3d3  4s   9d
   26    4fe iv d3 4s10d         3d3  4s  10d
   26    4fe iv d2 4s2 4d        3d2  4s2  4d
   26    4fe iv d2 4s2 5d        3d2  4s2  5d
   26    4fe iv d2 4s2 6d        3d2  4s2  6d
   26    4fe iv d2 4s2 7d        3d2  4s2  7d
   26    4fe iv d2 4s2 8d        3d2  4s2  8d
   26    4fe iv d2 4s2 9d        3d2  4s2  9d
   26    4fe iv d2 4s2 10d       3d2  4s2 10d
   26    4fe iv d4 4s            3d4  4s
   26    4fe iv d4 5s            3d4  5s
   26    4fe iv d4 6s            3d4  6s
   26    4fe iv d4 7s            3d4  7s
   26    4fe iv d4 8s            3d4  8s
   26    4fe iv d4 9s            3d4  9s
   26    4fe iv d4 10s           3d4 10s
   26    4fe iv d3 4s2           3d3  4s2
   26    4fe iv d3 4s5s          3d3  4s   5s
   26    4fe iv d3 4s6s          3d3  4s   6s
   26    4fe iv d3 4s7s          3d3  4s   7s
   26    4fe iv d3 4s8s          3d3  4s   8s
   26    4fe iv d3 4s9s          3d3  4s   9s
   26    4fe iv d3 4s10s         3d3  4s  10s
   26    4fe iv d2 4s2 5s        3d2  4s2  5s
   26    4fe iv d2 4s2 6s        3d2  4s2  6s
   26    4fe iv d2 4s2 7s        3d2  4s2  7s
   26    4fe iv d2 4s2 8s        3d2  4s2  8s
   26    4fe iv d2 4s2 9s        3d2  4s2  9s
   26    4fe iv d2 4s2 10s       3d2  4s2 10s
   26    4fe iv d4 5g            3d4  5g
   26    4fe iv d4 6g            3d4  6g
   26    4fe iv d4 7g            3d4  7g
   26    4fe iv d4 8g            3d4  8g
   26    4fe iv d4 9g            3d4  9g
   26    4fe iv d3 4s5g          3d3  4s   5g
   26    4fe iv d3 4s6g          3d3  4s   6g
   26    4fe iv d3 4s7g          3d3  4s   7g
   26    4fe iv d3 4s8g          3d3  4s   8g
   26    4fe iv d3 4s9g          3d3  4s   9g
   26    4fe iv d4 7i            3d4  7i
   26    4fe iv d4 8i            3d4  8i
   26    4fe iv d4 9i            3d4  9i
   26    4fe iv d3 4s7i          3d3  4s   7i
   26    4fe iv d3 4s8i          3d3  4s   8i
   26    4fe iv d3 4s9i          3d3  4s   9i
   26    4fe iv d4 9l            3d4 10l
   26    4fe iv d3 4s9l          3d3  4s  10l
   26    4fe iv d3 4p2           3d3  4p2
   26    4fe iv d4 4p            3d4  4p
   26    4fe iv d4 5p            3d4  5p
   26    4fe iv d4 6p            3d4  6p
   26    4fe iv d4 7p            3d4  7p
   26    4fe iv d4 8p            3d4  8p
   26    4fe iv d4 9p            3d4  9p
   26    4fe iv d4 10p           3d4 10p
   26    4fe iv d3 4s4p          3d3  4s   4p
   26    4fe iv d3 4s5p          3d3  4s   5p
   26    4fe iv d3 4s6p          3d3  4s   6p
   26    4fe iv d3 4s7p          3d3  4s   7p
   26    4fe iv d3 4s8p          3d3  4s   8p
   26    4fe iv d3 4s9p          3d3  4s   9p
   26    4fe iv d3 4s10p         3d3  4s  10p
   26    4fe iv d2 4s2 4p        3d2  4s2  4p
   26    4fe iv d2 4s2 5p        3d2  4s2  5p
   26    4fe iv d2 4s2 6p        3d2  4s2  6p
   26    4fe iv d2 4s2 7p        3d2  4s2  7p
   26    4fe iv d2 4s2 8p        3d2  4s2  8p
   26    4fe iv d2 4s2 9p        3d2  4s2  9p
   26    4fe iv d2 4s2 10p       3d2  4s2 10p
   26    4fe iv d4 4f            3d4  4f
   26    4fe iv d4 5f            3d4  5f
   26    4fe iv d4 6f            3d4  6f
   26    4fe iv d4 7f            3d4  7f
   26    4fe iv d4 8f            3d4  8f
   26    4fe iv d4 9f            3d4  9f
   26    4fe iv d4 10f           3d4 10f
   26    4fe iv d3 4s4f          3d3  4s   4f
   26    4fe iv d3 4s5f          3d3  4s   5f
   26    4fe iv d3 4s6f          3d3  4s   6f
   26    4fe iv d3 4s7f          3d3  4s   7f
   26    4fe iv d3 4s8f          3d3  4s   8f
   26    4fe iv d3 4s9f          3d3  4s   9f
   26    4fe iv d3 4s10f         3d3  4s  10f
   26    4fe iv d2 4s2 4f        3d2  4s2  4f
   26    4fe iv d2 4s2 5f        3d2  4s2  5f
   26    4fe iv d2 4s2 6f        3d2  4s2  6f
   26    4fe iv d2 4s2 7f        3d2  4s2  7f
   26    4fe iv d2 4s2 8f        3d2  4s2  8f
   26    4fe iv d2 4s2 9f        3d2  4s2  9f
   26    4fe iv d2 4s2 10f       3d2  4s2 10f
   26    4fe iv d4 6h            3d4  6h
   26    4fe iv d4 7h            3d4  7h
   26    4fe iv d4 8h            3d4  8h
   26    4fe iv d4 9h            3d4  9h
   26    4fe iv d3 4s6h          3d3  4s   6h
   26    4fe iv d3 4s7h          3d3  4s   7h
   26    4fe iv d3 4s8h          3d3  4s   8h
   26    4fe iv d3 4s9h          3d3  4s   9h
   26    4fe iv d4 8k            3d4  8k
   26    4fe iv d4 9k            3d4  9k
   26    4fe iv d3 4s8k          3d3  4s   8k
   26    4fe iv d3 4s9k          3d3  4s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF260301.DAT;*
$DELETE POOLG:HF260302.DAT;*
$DELETE POOLG:HF260304.DAT;*
$DELETE POOLG:HF260331.DAT;*
$DELETE POOLG:HF260332.DAT;*
