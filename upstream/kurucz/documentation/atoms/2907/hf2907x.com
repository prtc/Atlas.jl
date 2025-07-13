$set def 2907
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf290707.dat for007
$assign poolg:hf290701.dat for001
$assign poolg:hf290702.dat for002
$assign poolg:hf290704.dat for004
$assign hf2907x.pun for011
$assign hf2907x.rrr for012
$assign hf2907x.dat for013
$assign hf2907xE.dat for014
$assign poolg:hf290731.dat for031
$assign poolg:hf290732.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   29    8cuviiid4               3p6  3d4
   29    8cuviiid3 4d            3p6  3d3  4d
   29    8cuviiid3 5d            3p6  3d3  5d
   29    8cuviiid3 6d            3p6  3d3  6d
   29    8cuviiid3 7d            3p6  3d3  7d
   29    8cuviiid3 8d            3p6  3d3  8d
   29    8cuviiid3 9d            3p6  3d3  9d
   29    8cuviiid3 10d           3p6  3d3 10d
   29    8cuviiid2 4s4d          3p6  3d2  4s   4d
   29    8cuviiid2 4s5d          3p6  3d2  4s   5d
   29    8cuviiid2 4s6d          3p6  3d2  4s   6d
   29    8cuviiid2 4s7d          3p6  3d2  4s   7d
   29    8cuviiid2 4s8d          3p6  3d2  4s   8d
   29    8cuviiid2 4s9d          3p6  3d2  4s   9d
   29    8cuviiid2 4s10d         3p6  3d2  4s  10d
   29    8cuviiid1 4s2 4d        3p6  3d1  4s2  4d
   29    8cuviiid1 4s2 5d        3p6  3d1  4s2  5d
   29    8cuviiid1 4s2 6d        3p6  3d1  4s2  6d
   29    8cuviiid1 4s2 7d        3p6  3d1  4s2  7d
   29    8cuviiid1 4s2 8d        3p6  3d1  4s2  8d
   29    8cuviiid1 4s2 9d        3p6  3d1  4s2  9d
   29    8cuviiid1 4s2 10d       3p6  3d1  4s2 10d
   29    8cuviiid3 4s            3p6  3d3  4s
   29    8cuviiid3 5s            3p6  3d3  5s
   29    8cuviiid3 6s            3p6  3d3  6s
   29    8cuviiid3 7s            3p6  3d3  7s
   29    8cuviiid3 8s            3p6  3d3  8s
   29    8cuviiid3 9s            3p6  3d3  9s
   29    8cuviiid3 10s           3p6  3d3 10s
   29    8cuviiid2 4s2           3p6  3d2  4s2
   29    8cuviiid2 4s5s          3p6  3d2  4s   5s
   29    8cuviiid2 4s6s          3p6  3d2  4s   6s
   29    8cuviiid2 4s7s          3p6  3d2  4s   7s
   29    8cuviiid2 4s8s          3p6  3d2  4s   8s
   29    8cuviiid2 4s9s          3p6  3d2  4s   9s
   29    8cuviiid2 4s10s         3p6  3d2  4s  10s
   29    8cuviiid1 4s2 5s        3p6  3d1  4s2  5s
   29    8cuviiid1 4s2 6s        3p6  3d1  4s2  6s
   29    8cuviiid1 4s2 7s        3p6  3d1  4s2  7s
   29    8cuviiid1 4s2 8s        3p6  3d1  4s2  8s
   29    8cuviiid1 4s2 9s        3p6  3d1  4s2  9s
   29    8cuviiid1 4s2 10s       3p6  3d1  4s2 10s
   29    8cuviiid3 5g            3p6  3d3  5g
   29    8cuviiid3 6g            3p6  3d3  6g
   29    8cuviiid3 7g            3p6  3d3  7g
   29    8cuviiid3 8g            3p6  3d3  8g
   29    8cuviiid3 9g            3p6  3d3  9g
   29    8cuviiid3 10g           3p6  3d3 10g
   29    8cuviiid2 4s5g          3p6  3d2  4s   5g
   29    8cuviiid2 4s6g          3p6  3d2  4s   6g
   29    8cuviiid2 4s7g          3p6  3d2  4s   7g
   29    8cuviiid2 4s8g          3p6  3d2  4s   8g
   29    8cuviiid2 4s9g          3p6  3d2  4s   9g
   29    8cuviiid2 4s10g         3p6  3d2  4s  10g
   29    8cuviiid3 7i            3p6  3d3  7i
   29    8cuviiid3 8i            3p6  3d3  8i
   29    8cuviiid3 9i            3p6  3d3  9i
   29    8cuviiid2 4s7i          3p6  3d2  4s   7i
   29    8cuviiid2 4s8i          3p6  3d2  4s   8i
   29    8cuviiid2 4s9i          3p6  3d2  4s   9i
   29    8cuviiid2 4p2           3p6  3d2  4p2
   29    8cuviiid3 4p            3p6  3d3  4p
   29    8cuviiid3 5p            3p6  3d3  5p
   29    8cuviiid3 6p            3p6  3d3  6p
   29    8cuviiid3 7p            3p6  3d3  7p
   29    8cuviiid3 8p            3p6  3d3  8p
   29    8cuviiid3 9p            3p6  3d3  9p
   29    8cuviiid3 10p           3p6  3d3 10p
   29    8cuviiid3 11p           3p6  3d3 11p
   29    8cuviiid2 4s4p          3p6  3d2  4s   4p
   29    8cuviiid2 4s5p          3p6  3d2  4s   5p
   29    8cuviiid2 4s6p          3p6  3d2  4s   6p
   29    8cuviiid2 4s7p          3p6  3d2  4s   7p
   29    8cuviiid2 4s8p          3p6  3d2  4s   8p
   29    8cuviiid2 4s9p          3p6  3d2  4s   9p
   29    8cuviiid2 4s10p         3p6  3d2  4s  10p
   29    8cuviiid2 4s11p         3p6  3d2  4s  11p
   29    8cuviiid1 4s2 4p        3p6  3d1  4s2  4p
   29    8cuviiid1 4s2 5p        3p6  3d1  4s2  5p
   29    8cuviiid1 4s2 6p        3p6  3d1  4s2  6p
   29    8cuviiid1 4s2 7p        3p6  3d1  4s2  7p
   29    8cuviiid1 4s2 8p        3p6  3d1  4s2  8p
   29    8cuviiid1 4s2 9p        3p6  3d1  4s2  9p
   29    8cuviiid1 4s2 10p       3p6  3d1  4s2 10p
   29    8cuviiid1 4s2 11p       3p6  3d1  4s2 11p
   29    8cuviiid3 4f            3p6  3d3  4f
   29    8cuviiid3 5f            3p6  3d3  5f
   29    8cuviiid3 6f            3p6  3d3  6f
   29    8cuviiid3 7f            3p6  3d3  7f
   29    8cuviiid3 8f            3p6  3d3  8f
   29    8cuviiid3 9f            3p6  3d3  9f
   29    8cuviiid3 10f           3p6  3d3 10f
   29    8cuviiid3 11f           3p6  3d3 11f
   29    8cuviiid2 4s4f          3p6  3d2  4s   4f
   29    8cuviiid2 4s5f          3p6  3d2  4s   5f
   29    8cuviiid2 4s6f          3p6  3d2  4s   6f
   29    8cuviiid2 4s7f          3p6  3d2  4s   7f
   29    8cuviiid2 4s8f          3p6  3d2  4s   8f
   29    8cuviiid2 4s9f          3p6  3d2  4s   9f
   29    8cuviiid2 4s10f         3p6  3d2  4s  10f
   29    8cuviiid2 4s11f         3p6  3d2  4s  11f
   29    8cuviiid1 4s2 4f        3p6  3d1  4s2  4f
   29    8cuviiid1 4s2 5f        3p6  3d1  4s2  5f
   29    8cuviiid1 4s2 6f        3p6  3d1  4s2  6f
   29    8cuviiid1 4s2 7f        3p6  3d1  4s2  7f
   29    8cuviiid1 4s2 8f        3p6  3d1  4s2  8f
   29    8cuviiid1 4s2 9f        3p6  3d1  4s2  9f
   29    8cuviiid1 4s2 10f       3p6  3d1  4s2 10f
   29    8cuviiid1 4s2 11f       3p6  3d1  4s2 11f
   29    8cuviiid3 6h            3p6  3d3  6h
   29    8cuviiid3 7h            3p6  3d3  7h
   29    8cuviiid3 8h            3p6  3d3  8h
   29    8cuviiid3 9h            3p6  3d3  9h
   29    8cuviiid2 4s6h          3p6  3d2  4s   6h
   29    8cuviiid2 4s7h          3p6  3d2  4s   7h
   29    8cuviiid2 4s8h          3p6  3d2  4s   8h
   29    8cuviiid2 4s9h          3p6  3d2  4s   9h
   29    8cuviiid3 8k            3p6  3d3  8k
   29    8cuviiid3 9k            3p6  3d3  9k
   29    8cuviiid2 4s8k          3p6  3d2  4s   8k
   29    8cuviiid2 4s9k          3p6  3d2  4s   9k
   29    8cuviiip5d5             3p5  3d5
   -1
$run cray:rcn2c
$DELETE POOLG:HF290701.DAT;*
$DELETE POOLG:HF290702.DAT;*
$DELETE POOLG:HF290704.DAT;*
$DELETE POOLG:HF290731.DAT;*
$DELETE POOLG:HF290732.DAT;*
