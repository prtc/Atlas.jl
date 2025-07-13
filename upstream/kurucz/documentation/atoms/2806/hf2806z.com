$set def 2806
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf280607.dat for007
$assign poolg:hf280601.dat for001
$assign poolg:hf280602.dat for002
$assign poolg:hf280604.dat for004
$assign hf2806z.pun for011
$assign hf2806z.rrr for012
$assign hf2806z.dat for013
$assign hf2806zE.dat for014
$assign poolg:hf280631.dat for031
$assign poolg:hf280632.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   28    7ni viid4               3p6  3d4
   28    7ni viid3 4d            3p6  3d3  4d
   28    7ni viid3 5d            3p6  3d3  5d
   28    7ni viid3 6d            3p6  3d3  6d
   28    7ni viid3 7d            3p6  3d3  7d
   28    7ni viid3 8d            3p6  3d3  8d
   28    7ni viid3 9d            3p6  3d3  9d
   28    7ni viid3 10d           3p6  3d3 10d
   28    7ni viid2 4s4d          3p6  3d2  4s   4d
   28    7ni viid2 4s5d          3p6  3d2  4s   5d
   28    7ni viid2 4s6d          3p6  3d2  4s   6d
   28    7ni viid2 4s7d          3p6  3d2  4s   7d
   28    7ni viid2 4s8d          3p6  3d2  4s   8d
   28    7ni viid2 4s9d          3p6  3d2  4s   9d
   28    7ni viid2 4s10d         3p6  3d2  4s  10d
   28    7ni viids2 4d           3p6  3d1  4s2  4d
   28    7ni viids2 5d           3p6  3d1  4s2  5d
   28    7ni viids2 6d           3p6  3d1  4s2  6d
   28    7ni viids2 7d           3p6  3d1  4s2  7d
   28    7ni viids2 8d           3p6  3d1  4s2  8d
   28    7ni viids2 9d           3p6  3d1  4s2  9d
   28    7ni viids2 10d          3p6  3d1  4s2 10d
   28    7ni viid3 4s            3p6  3d3  4s
   28    7ni viid3 5s            3p6  3d3  5s
   28    7ni viid3 6s            3p6  3d3  6s
   28    7ni viid3 7s            3p6  3d3  7s
   28    7ni viid3 8s            3p6  3d3  8s
   28    7ni viid3 9s            3p6  3d3  9s
   28    7ni viid3 10s           3p6  3d3 10s
   28    7ni viid2 4s2           3p6  3d2  4s2
   28    7ni viid2 4s5s          3p6  3d2  4s   5s
   28    7ni viid2 4s6s          3p6  3d2  4s   6s
   28    7ni viid2 4s7s          3p6  3d2  4s   7s
   28    7ni viid2 4s8s          3p6  3d2  4s   8s
   28    7ni viid2 4s9s          3p6  3d2  4s   9s
   28    7ni viid2 4s10s         3p6  3d2  4s  10s
   28    7ni viids2 5s           3p6  3d1  4s2  5s
   28    7ni viids2 6s           3p6  3d1  4s2  6s
   28    7ni viids2 7s           3p6  3d1  4s2  7s
   28    7ni viids2 8s           3p6  3d1  4s2  8s
   28    7ni viids2 9s           3p6  3d1  4s2  9s
   28    7ni viids2 10s          3p6  3d1  4s2 10s
   28    7ni viid3 5g            3p6  3d3  5g
   28    7ni viid3 6g            3p6  3d3  6g
   28    7ni viid3 7g            3p6  3d3  7g
   28    7ni viid3 8g            3p6  3d3  8g
   28    7ni viid3 9g            3p6  3d3  9g
   28    7ni viid3 10g           3p6  3d3 10g
   28    7ni viid2 4s5g          3p6  3d2  4s   5g
   28    7ni viid2 4s6g          3p6  3d2  4s   6g
   28    7ni viid2 4s7g          3p6  3d2  4s   7g
   28    7ni viid2 4s8g          3p6  3d2  4s   8g
   28    7ni viid2 4s9g          3p6  3d2  4s   9g
   28    7ni viid2 4s10g         3p6  3d2  4s  10g
   28    7ni viid3 7i            3p6  3d3  7i
   28    7ni viid3 8i            3p6  3d3  8i
   28    7ni viid3 9i            3p6  3d3  9i
   28    7ni viid2 4s7i          3p6  3d2  4s   7i
   28    7ni viid2 4s8i          3p6  3d2  4s   8i
   28    7ni viid2 4s9i          3p6  3d2  4s   9i
   28    7ni viid2 4p2           3p6  3d2  4p2
   28    7ni viid3 4p            3p6  3d3  4p
   28    7ni viid3 5p            3p6  3d3  5p
   28    7ni viid3 6p            3p6  3d3  6p
   28    7ni viid3 7p            3p6  3d3  7p
   28    7ni viid3 8p            3p6  3d3  8p
   28    7ni viid3 9p            3p6  3d3  9p
   28    7ni viid3 10p           3p6  3d3 10p
   28    7ni viid3 11p           3p6  3d3 11p
   28    7ni viid2 4s4p          3p6  3d2  4s   4p
   28    7ni viid2 4s5p          3p6  3d2  4s   5p
   28    7ni viid2 4s6p          3p6  3d2  4s   6p
   28    7ni viid2 4s7p          3p6  3d2  4s   7p
   28    7ni viid2 4s8p          3p6  3d2  4s   8p
   28    7ni viid2 4s9p          3p6  3d2  4s   9p
   28    7ni viid2 4s10p         3p6  3d2  4s  10p
   28    7ni viid2 4s11p         3p6  3d2  4s  11p
   28    7ni viid1 4s2 4p        3p6  3d1  4s2  4p
   28    7ni viid1 4s2 5p        3p6  3d1  4s2  5p
   28    7ni viid1 4s2 6p        3p6  3d1  4s2  6p
   28    7ni viid1 4s2 7p        3p6  3d1  4s2  7p
   28    7ni viid1 4s2 8p        3p6  3d1  4s2  8p
   28    7ni viid1 4s2 9p        3p6  3d1  4s2  9p
   28    7ni viid1 4s2 10p       3p6  3d1  4s2 10p
   28    7ni viid1 4s2 11p       3p6  3d1  4s2 11p
   28    7ni viid3 4f            3p6  3d3  4f
   28    7ni viid3 5f            3p6  3d3  5f
   28    7ni viid3 6f            3p6  3d3  6f
   28    7ni viid3 7f            3p6  3d3  7f
   28    7ni viid3 8f            3p6  3d3  8f
   28    7ni viid3 9f            3p6  3d3  9f
   28    7ni viid3 10f           3p6  3d3 10f
   28    7ni viid3 11f           3p6  3d3 11f
   28    7ni viid2 4s4f          3p6  3d2  4s   4f
   28    7ni viid2 4s5f          3p6  3d2  4s   5f
   28    7ni viid2 4s6f          3p6  3d2  4s   6f
   28    7ni viid2 4s7f          3p6  3d2  4s   7f
   28    7ni viid2 4s8f          3p6  3d2  4s   8f
   28    7ni viid2 4s9f          3p6  3d2  4s   9f
   28    7ni viid2 4s10f         3p6  3d2  4s  10f
   28    7ni viid2 4s11f         3p6  3d2  4s  11f
   28    7ni viid1 4s2 4f        3p6  3d1  4s2  4f
   28    7ni viid1 4s2 5f        3p6  3d1  4s2  5f
   28    7ni viid1 4s2 6f        3p6  3d1  4s2  6f
   28    7ni viid1 4s2 7f        3p6  3d1  4s2  7f
   28    7ni viid1 4s2 8f        3p6  3d1  4s2  8f
   28    7ni viid1 4s2 9f        3p6  3d1  4s2  9f
   28    7ni viid1 4s2 10f       3p6  3d1  4s2 10f
   28    7ni viid1 4s2 11f       3p6  3d1  4s2 11f
   28    7ni viid3 6h            3p6  3d3  6h
   28    7ni viid3 7h            3p6  3d3  7h
   28    7ni viid3 8h            3p6  3d3  8h
   28    7ni viid3 9h            3p6  3d3  9h
   28    7ni viid2 4s6h          3p6  3d2  4s   6h
   28    7ni viid2 4s7h          3p6  3d2  4s   7h
   28    7ni viid2 4s8h          3p6  3d2  4s   8h
   28    7ni viid2 4s9h          3p6  3d2  4s   9h
   28    7ni viid3 8k            3p6  3d3  8k
   28    7ni viid3 9k            3p6  3d3  9k
   28    7ni viid2 4s8k          3p6  3d2  4s   8k
   28    7ni viid2 4s9k          3p6  3d2  4s   9k
   28    7ni viip5d5             3p5  3d5
   -1
$run cray:rcn2c
$DELETE POOLG:HF280601.DAT;*
$DELETE POOLG:HF280602.DAT;*
$DELETE POOLG:HF280604.DAT;*
$DELETE POOLG:HF280631.DAT;*
$DELETE POOLG:HF280632.DAT;*
