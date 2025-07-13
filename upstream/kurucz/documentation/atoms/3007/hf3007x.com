$set def 3007
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf300707.dat for007
$assign poolg:hf300701.dat for001
$assign poolg:hf300702.dat for002
$assign poolg:hf300704.dat for004
$assign hf3007x.pun for011
$assign hf3007x.rrr for012
$assign hf3007x.dat for013
$assign hf3007xe.dat for014
$assign poolg:hf300731.dat for031
$assign poolg:hf300732.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   30    8znviiid5               3p6  3d5
   30    8znviiid4 4d            3p6  3d4  4d
   30    8znviiid4 5d            3p6  3d4  5d
   30    8znviiid4 6d            3p6  3d4  6d
   30    8znviiid4 7d            3p6  3d4  7d
   30    8znviiid4 8d            3p6  3d4  8d
   30    8znviiid4 9d            3p6  3d4  9d
   30    8znviiid4 10d           3p6  3d4 10d
   30    8znviiid3 4s4d          3p6  3d3  4s   4d
   30    8znviiid3 4s5d          3p6  3d3  4s   5d
   30    8znviiid3 4s6d          3p6  3d3  4s   6d
   30    8znviiid3 4s7d          3p6  3d3  4s   7d
   30    8znviiid3 4s8d          3p6  3d3  4s   8d
   30    8znviiid3 4s9d          3p6  3d3  4s   9d
   30    8znviiid3 4s10d         3p6  3d3  4s  10d
   30    8znviiid2s2 4d          3p6  3d2  4s2  4d
   30    8znviiid2s2 5d          3p6  3d2  4s2  5d
   30    8znviiid2s2 6d          3p6  3d2  4s2  6d
   30    8znviiid2s2 7d          3p6  3d2  4s2  7d
   30    8znviiid2s2 8d          3p6  3d2  4s2  8d
   30    8znviiid2s2 9d          3p6  3d2  4s2  9d
   30    8znviiid2s2 10d         3p6  3d2  4s2 10d
   30    8znviiid4 4s            3p6  3d4  4s
   30    8znviiid4 5s            3p6  3d4  5s
   30    8znviiid4 6s            3p6  3d4  6s
   30    8znviiid4 7s            3p6  3d4  7s
   30    8znviiid4 8s            3p6  3d4  8s
   30    8znviiid4 9s            3p6  3d4  9s
   30    8znviiid4 10s           3p6  3d4 10s
   30    8znviiid3 4s2           3p6  3d3  4s2
   30    8znviiid3 4s5s          3p6  3d3  4s   5s
   30    8znviiid3 4s6s          3p6  3d3  4s   6s
   30    8znviiid3 4s7s          3p6  3d3  4s   7s
   30    8znviiid3 4s8s          3p6  3d3  4s   8s
   30    8znviiid3 4s9s          3p6  3d3  4s   9s
   30    8znviiid3 4s10s         3p6  3d3  4s  10s
   30    8znviiid2s2 5s          3p6  3d2  4s2  5s
   30    8znviiid2s2 6s          3p6  3d2  4s2  6s
   30    8znviiid2s2 7s          3p6  3d2  4s2  7s
   30    8znviiid2s2 8s          3p6  3d2  4s2  8s
   30    8znviiid2s2 9s          3p6  3d2  4s2  9s
   30    8znviiid2s2 10s         3p6  3d2  4s2 10s
   30    8znviiid4 5g            3p6  3d4  5g
   30    8znviiid4 6g            3p6  3d4  6g
   30    8znviiid4 7g            3p6  3d4  7g
   30    8znviiid4 8g            3p6  3d4  8g
   30    8znviiid4 9g            3p6  3d4  9g
   30    8znviiid4 10g           3p6  3d4 10g
   30    8znviiid3 4s5g          3p6  3d3  4s   5g
   30    8znviiid3 4s6g          3p6  3d3  4s   6g
   30    8znviiid3 4s7g          3p6  3d3  4s   7g
   30    8znviiid3 4s8g          3p6  3d3  4s   8g
   30    8znviiid3 4s9g          3p6  3d3  4s   9g
   30    8znviiid3 4s10g         3p6  3d3  4s  10g
   30    8znviiid4 7i            3p6  3d4  7i
   30    8znviiid4 8i            3p6  3d4  8i
   30    8znviiid4 9i            3p6  3d4  9i
   30    8znviiid3 4s7i          3p6  3d3  4s   7i
   30    8znviiid3 4s8i          3p6  3d3  4s   8i
   30    8znviiid3 4s9i          3p6  3d3  4s   9i
   30    8znviiid3 4p2           3p6  3d3  4p2
   30    8znviiid4 4p            3p6  3d4  4p
   30    8znviiid4 5p            3p6  3d4  5p
   30    8znviiid4 6p            3p6  3d4  6p
   30    8znviiid4 7p            3p6  3d4  7p
   30    8znviiid4 8p            3p6  3d4  8p
   30    8znviiid4 9p            3p6  3d4  9p
   30    8znviiid4 10p           3p6  3d4 10p
   30    8znviiid4 11p           3p6  3d4 11p
   30    8znviiid3 4s4p          3p6  3d3  4s   4p
   30    8znviiid3 4s5p          3p6  3d3  4s   5p
   30    8znviiid3 4s6p          3p6  3d3  4s   6p
   30    8znviiid3 4s7p          3p6  3d3  4s   7p
   30    8znviiid3 4s8p          3p6  3d3  4s   8p
   30    8znviiid3 4s9p          3p6  3d3  4s   9p
   30    8znviiid3 4s10p         3p6  3d3  4s  10p
   30    8znviiid3 4s11p         3p6  3d3  4s  11p
   30    8znviiid2s2 4p          3p6  3d2  4s2  4p
   30    8znviiid2s2 5p          3p6  3d2  4s2  5p
   30    8znviiid2s2 6p          3p6  3d2  4s2  6p
   30    8znviiid2s2 7p          3p6  3d2  4s2  7p
   30    8znviiid2s2 8p          3p6  3d2  4s2  8p
   30    8znviiid2s2 9p          3p6  3d2  4s2  9p
   30    8znviiid2s2 10p         3p6  3d2  4s2 10p
   30    8znviiid2s2 11p         3p6  3d2  4s2 11p
   30    8znviiid4 4f            3p6  3d4  4f
   30    8znviiid4 5f            3p6  3d4  5f
   30    8znviiid4 6f            3p6  3d4  6f
   30    8znviiid4 7f            3p6  3d4  7f
   30    8znviiid4 8f            3p6  3d4  8f
   30    8znviiid4 9f            3p6  3d4  9f
   30    8znviiid4 10f           3p6  3d4 10f
   30    8znviiid4 11f           3p6  3d4 11f
   30    8znviiid3 4s4f          3p6  3d3  4s   4f
   30    8znviiid3 4s5f          3p6  3d3  4s   5f
   30    8znviiid3 4s6f          3p6  3d3  4s   6f
   30    8znviiid3 4s7f          3p6  3d3  4s   7f
   30    8znviiid3 4s8f          3p6  3d3  4s   8f
   30    8znviiid3 4s9f          3p6  3d3  4s   9f
   30    8znviiid3 4s10f         3p6  3d3  4s  10f
   30    8znviiid3 4s11f         3p6  3d3  4s  11f
   30    8znviiid2s2 4f          3p6  3d2  4s2  4f
   30    8znviiid2s2 5f          3p6  3d2  4s2  5f
   30    8znviiid2s2 6f          3p6  3d2  4s2  6f
   30    8znviiid2s2 7f          3p6  3d2  4s2  7f
   30    8znviiid2s2 8f          3p6  3d2  4s2  8f
   30    8znviiid2s2 9f          3p6  3d2  4s2  9f
   30    8znviiid2s2 10f         3p6  3d2  4s2 10f
   30    8znviiid2s2 11f         3p6  3d2  4s2 11f
   30    8znviiid4 6h            3p6  3d4  6h
   30    8znviiid4 7h            3p6  3d4  7h
   30    8znviiid4 8h            3p6  3d4  8h
   30    8znviiid4 9h            3p6  3d4  9h
   30    8znviiid3 4s6h          3p6  3d3  4s   6h
   30    8znviiid3 4s7h          3p6  3d3  4s   7h
   30    8znviiid3 4s8h          3p6  3d3  4s   8h
   30    8znviiid3 4s9h          3p6  3d3  4s   9h
   30    8znviiid4 8k            3p6  3d4  8k
   30    8znviiid4 9k            3p6  3d4  9k
   30    8znviiid3 4s8k          3p6  3d3  4s   8k
   30    8znviiid3 4s9k          3p6  3d3  4s   9k
   30    8znviiip5d6             3p5  3d6
   -1
$run cray:rcn2c
$DELETE POOLG:HF300701.DAT;*
$DELETE POOLG:HF300702.DAT;*
$DELETE POOLG:HF300704.DAT;*
$DELETE POOLG:HF300731.DAT;*
$DELETE POOLG:HF300732.DAT;*
