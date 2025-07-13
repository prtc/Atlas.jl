$set def 2301
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf230107.dat for007
$assign poolg:hf230101.dat for001
$assign poolg:hf230102.dat for002
$assign poolg:hf230104.dat for004
$assign hf2301x.pun for011
$assign hf2301x.rrr for012
$assign hf2301x.dat for013
$assign hf2301xe.dat for014
$assign poolg:hf230131.dat for031
$assign poolg:hf230132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   23    2v ii  d3 4s            3d3  4s
   23    2v ii  d3 5s            3d3  5s
   23    2v ii  d3 6s            3d3  6s
   23    2v ii  d3 7s            3d3  7s
   23    2v ii  d3 8s            3d3  8s
   23    2v ii  d3 9s            3d3  9s
   23    2v ii  d3 10s           3d3 10s
   23    2v ii  d2 4s2           3d2  4s2
   23    2v ii  d2 4s5s          3d2  4s   5s
   23    2v ii  d2 4s6s          3d2  4s   6s
   23    2v ii  d2 4s7s          3d2  4s   7s
   23    2v ii  d2 4s8s          3d2  4s   8s
   23    2v ii  d2 4s9s          3d2  4s   9s
   23    2v ii  d2 4s10s         3d2  4s  10s
   23    2v ii  d1 4s2 5s        3d1  4s2  5s
   23    2v ii  d1 4s2 6s        3d1  4s2  6s
   23    2v ii  d1 4s2 7s        3d1  4s2  7s
   23    2v ii  d1 4s2 8s        3d1  4s2  8s
   23    2v ii  d1 4s2 10s       3d1  4s2 10s
   23    2v ii  d4               3d4
   23    2v ii  d3 4d            3d3  4d
   23    2v ii  d3 5d            3d3  5d
   23    2v ii  d3 6d            3d3  6d
   23    2v ii  d3 7d            3d3  7d
   23    2v ii  d3 8d            3d3  8d
   23    2v ii  d3 9d            3d3  9d
   23    2v ii  d3 10d           3d3 10d
   23    2v ii  d3 11d           3d3 11d
   23    2v ii  d2 4s4d          3d2  4s   4d
   23    2v ii  d2 4s5d          3d2  4s   5d
   23    2v ii  d2 4s6d          3d2  4s   6d
   23    2v ii  d2 4s7d          3d2  4s   7d
   23    2v ii  d2 4s8d          3d2  4s   8d
   23    2v ii  d2 4s9d          3d2  4s   9d
   23    2v ii  d2 4s10d         3d2  4s  10d
   23    2v ii  d1 4s2 4d        3d1  4s2  4d
   23    2v ii  d1 4s2 5d        3d1  4s2  5d
   23    2v ii  d1 4s2 6d        3d1  4s2  6d
   23    2v ii  d1 4s2 7d        3d1  4s2  7d
   23    2v ii  d1 4s2 8d        3d1  4s2  8d
   23    2v ii  d1 4s2 9d        3d1  4s2  9d
   23    2v ii  d1 4s2 10d       3d1  4s2 10d
   23    2v ii  d3 5g            3d3  5g
   23    2v ii  d3 6g            3d3  6g
   23    2v ii  d3 7g            3d3  7g
   23    2v ii  d3 8g            3d3  8g
   23    2v ii  d3 9g            3d3  9g
   23    2v ii  d2 4s5g          3d2  4s   5g
   23    2v ii  d2 4s6g          3d2  4s   6g
   23    2v ii  d2 4s7g          3d2  4s   7g
   23    2v ii  d2 4s8g          3d2  4s   8g
   23    2v ii  d2 4s9g          3d2  4s   9g
   23    2v ii  d3 7i            3d3  7i
   23    2v ii  d3 8i            3d3  8i
   23    2v ii  d3 9i            3d3  9i
   23    2v ii  d2 4s7i          3d2  4s   7i
   23    2v ii  d2 4s8i          3d2  4s   8i
   23    2v ii  d2 4s9i          3d2  4s   9i
   23    2v ii  d3 9l            3d3 10l
   23    2v ii  d2 4s9l          3d2  4s  10l
   23    2v ii  d2 4p2           3d2  4p2
   23    2v ii  d3 4p            3d3  4p
   23    2v ii  d3 5p            3d3  5p
   23    2v ii  d3 6p            3d3  6p
   23    2v ii  d3 7p            3d3  7p
   23    2v ii  d3 8p            3d3  8p
   23    2v ii  d3 9p            3d3  9p
   23    2v ii  d3 10p           3d3 10p
   23    2v ii  d3 11p           3d3 11p
   23    2v ii  d3 12p           3d3 12p
   23    2v ii  d2 4s4p          3d2  4s   4p
   23    2v ii  d2 4s5p          3d2  4s   5p
   23    2v ii  d2 4s6p          3d2  4s   6p
   23    2v ii  d2 4s7p          3d2  4s   7p
   23    2v ii  d2 4s8p          3d2  4s   8p
   23    2v ii  d2 4s9p          3d2  4s   9p
   23    2v ii  d2 4s10p         3d2  4s  10p
   23    2v ii  d2 4s11p         3d2  4s  11p
   23    2v ii  d1 4s2 4p        3d1  4s2  4p
   23    2v ii  d1 4s2 5p        3d1  4s2  5p
   23    2v ii  d1 4s2 6p        3d1  4s2  6p
   23    2v ii  d1 4s2 7p        3d1  4s2  7p
   23    2v ii  d1 4s2 8p        3d1  4s2  8p
   23    2v ii  d1 4s2 9p        3d1  4s2  9p
   23    2v ii  d1 4s2 10p       3d1  4s2 10p
   23    2v ii  d1 4s2 11p       3d1  4s2 11p
   23    2v ii  d3 4f            3d3  4f
   23    2v ii  d3 5f            3d3  5f
   23    2v ii  d3 6f            3d3  6f
   23    2v ii  d3 7f            3d3  7f
   23    2v ii  d3 8f            3d3  8f
   23    2v ii  d3 9f            3d3  9f
   23    2v ii  d3 10f           3d3 10f
   23    2v ii  d3 11f           3d3 11f
   23    2v ii  d2 4s4f          3d2  4s   4f
   23    2v ii  d2 4s5f          3d2  4s   5f
   23    2v ii  d2 4s6f          3d2  4s   6f
   23    2v ii  d2 4s7f          3d2  4s   7f
   23    2v ii  d2 4s8f          3d2  4s   8f
   23    2v ii  d2 4s9f          3d2  4s   9f
   23    2v ii  d2 4s10f         3d2  4s  10f
   23    2v ii  d2 4s11f         3d2  4s  11f
   23    2v ii  d1 4s2 4f        3d1  4s2  4f
   23    2v ii  d1 4s2 5f        3d1  4s2  5f
   23    2v ii  d1 4s2 6f        3d1  4s2  6f
   23    2v ii  d1 4s2 7f        3d1  4s2  7f
   23    2v ii  d1 4s2 8f        3d1  4s2  8f
   23    2v ii  d1 4s2 9f        3d1  4s2  9f
   23    2v ii  d1 4s2 10f       3d1  4s2 10f
   23    2v ii  d1 4s2 11f       3d1  4s2 11f
   23    2v ii  d3 6h            3d3  6h
   23    2v ii  d3 7h            3d3  7h
   23    2v ii  d3 8h            3d3  8h
   23    2v ii  d3 9h            3d3  9h
   23    2v ii  d2 4s6h          3d2  4s   6h
   23    2v ii  d2 4s7h          3d2  4s   7h
   23    2v ii  d2 4s8h          3d2  4s   8h
   23    2v ii  d2 4s9h          3d2  4s   9h
   23    2v ii  d3 8k            3d3  8k
   23    2v ii  d3 9k            3d3  9k
   23    2v ii  d2 4s8k          3d2  4s   8k
   23    2v ii  d2 4s9k          3d2  4s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF230101.DAT;*
$DELETE POOLG:HF230102.DAT;*
$DELETE POOLG:HF230104.DAT;*
$DELETE POOLG:HF230131.DAT;*
$DELETE POOLG:HF230132.DAT;*
