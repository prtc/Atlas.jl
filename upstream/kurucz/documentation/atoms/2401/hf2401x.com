$set def 2401
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf240107.dat for007
$assign poolg:hf240101.dat for001
$assign poolg:hf240102.dat for002
$assign poolg:hf240104.dat for004
$assign hf2401x.pun for011
$assign hf2401x.rrr for012
$assign hf2401x.dat for013
$assign hf2401xe.dat for014
$assign poolg:hf240131.dat for031
$assign poolg:hf240132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   24    2cr ii d4 4s            3d4  4s
   24    2cr ii d4 5s            3d4  5s
   24    2cr ii d4 6s            3d4  6s
   24    2cr ii d4 7s            3d4  7s
   24    2cr ii d4 8s            3d4  8s
   24    2cr ii d4 9s            3d4  9s
   24    2cr ii d4 10s           3d4 10s
   24    2cr ii d3 4s2           3d3  4s2
   24    2cr ii d3 4s5s          3d3  4s   5s
   24    2cr ii d3 4s6s          3d3  4s   6s
   24    2cr ii d3 4s7s          3d3  4s   7s
   24    2cr ii d3 4s8s          3d3  4s   8s
   24    2cr ii d3 4s9s          3d3  4s   9s
   24    2cr ii d3 4s10s         3d3  4s  10s
   24    2cr ii d2s2 5s          3d2  4s2  5s
   24    2cr ii d2s2 6s          3d2  4s2  6s
   24    2cr ii d2s2 7s          3d2  4s2  7s
   24    2cr ii d2s2 8s          3d2  4s2  8s
   24    2cr ii d2s2 9s          3d2  4s2  9s
   24    2cr ii d2s2 10s         3d2  4s2 10s
   24    2cr ii d5               3d5
   24    2cr ii d4 4d            3d4  4d
   24    2cr ii d4 5d            3d4  5d
   24    2cr ii d4 6d            3d4  6d
   24    2cr ii d4 7d            3d4  7d
   24    2cr ii d4 8d            3d4  8d
   24    2cr ii d4 9d            3d4  9d
   24    2cr ii d4 10d           3d4 10d
   24    2cr ii d3 4s4d          3d3  4s   4d
   24    2cr ii d3 4s5d          3d3  4s   5d
   24    2cr ii d3 4s6d          3d3  4s   6d
   24    2cr ii d3 4s7d          3d3  4s   7d
   24    2cr ii d3 4s8d          3d3  4s   8d
   24    2cr ii d3 4s9d          3d3  4s   9d
   24    2cr ii d3 4s10d         3d3  4s  10d
   24    2cr ii d2s2 4d          3d2  4s2  4d
   24    2cr ii d2s2 5d          3d2  4s2  5d
   24    2cr ii d2s2 6d          3d2  4s2  6d
   24    2cr ii d2s2 7d          3d2  4s2  7d
   24    2cr ii d2s2 8d          3d2  4s2  8d
   24    2cr ii d2s2 9d          3d2  4s2  9d
   24    2cr ii d2s2 10d         3d2  4s2 10d
   24    2cr ii d4 5g            3d4  5g
   24    2cr ii d4 6g            3d4  6g
   24    2cr ii d4 7g            3d4  7g
   24    2cr ii d4 8g            3d4  8g
   24    2cr ii d4 9g            3d4  9g
   24    2cr ii d3 4s5g          3d3  4s   5g
   24    2cr ii d3 4s6g          3d3  4s   6g
   24    2cr ii d3 4s7g          3d3  4s   7g
   24    2cr ii d3 4s8g          3d3  4s   8g
   24    2cr ii d3 4s9g          3d3  4s   9g
   24    2cr ii d4 7i            3d4  7i
   24    2cr ii d4 8i            3d4  8i
   24    2cr ii d4 9i            3d4  9i
   24    2cr ii d3 4s7i          3d3  4s   7i
   24    2cr ii d3 4s8i          3d3  4s   8i
   24    2cr ii d3 4s9i          3d3  4s   9i
   24    2cr ii d4 9l            3d4 10l
   24    2cr ii d3 4s9l          3d3  4s  10l
   24    2cr ii d3 4p2           3d3  4p2
   24    2cr ii d4 4p            3d4  4p
   24    2cr ii d4 5p            3d4  5p
   24    2cr ii d4 6p            3d4  6p
   24    2cr ii d4 7p            3d4  7p
   24    2cr ii d4 8p            3d4  8p
   24    2cr ii d4 9p            3d4  9p
   24    2cr ii d4 10p           3d4 10p
   24    2cr ii d4 11p           3d4 11p
   24    2cr ii d3 4s4p          3d3  4s   4p
   24    2cr ii d3 4s5p          3d3  4s   5p
   24    2cr ii d3 4s6p          3d3  4s   6p
   24    2cr ii d3 4s7p          3d3  4s   7p
   24    2cr ii d3 4s8p          3d3  4s   8p
   24    2cr ii d3 4s9p          3d3  4s   9p
   24    2cr ii d3 4s10p         3d3  4s  10p
   24    2cr ii d3 4s11p         3d3  4s  11p
   24    2cr ii d2s2 4p          3d2  4s2  4p
   24    2cr ii d2s2 5p          3d2  4s2  5p
   24    2cr ii d2s2 6p          3d2  4s2  6p
   24    2cr ii d2s2 7p          3d2  4s2  7p
   24    2cr ii d2s2 8p          3d2  4s2  8p
   24    2cr ii d2s2 9p          3d2  4s2  9p
   24    2cr ii d2s2 10p         3d2  4s2 10p
   24    2cr ii d2s2 11p         3d2  4s2 11p
   24    2cr ii d4 4f            3d4  4f
   24    2cr ii d4 5f            3d4  5f
   24    2cr ii d4 6f            3d4  6f
   24    2cr ii d4 7f            3d4  7f
   24    2cr ii d4 8f            3d4  8f
   24    2cr ii d4 9f            3d4  9f
   24    2cr ii d4 10f           3d4 10f
   24    2cr ii d4 11f           3d4 11f
   24    2cr ii d3 4s4f          3d3  4s   4f
   24    2cr ii d3 4s5f          3d3  4s   5f
   24    2cr ii d3 4s6f          3d3  4s   6f
   24    2cr ii d3 4s7f          3d3  4s   7f
   24    2cr ii d3 4s8f          3d3  4s   8f
   24    2cr ii d3 4s9f          3d3  4s   9f
   24    2cr ii d3 4s10f         3d3  4s  10f
   24    2cr ii d3 4s11f         3d3  4s  11f
   24    2cr ii d2s2 4f          3d2  4s2  4f
   24    2cr ii d2s2 5f          3d2  4s2  5f
   24    2cr ii d2s2 6f          3d2  4s2  6f
   24    2cr ii d2s2 7f          3d2  4s2  7f
   24    2cr ii d2s2 8f          3d2  4s2  8f
   24    2cr ii d2s2 9f          3d2  4s2  9f
   24    2cr ii d2s2 10f         3d2  4s2 10f
   24    2cr ii d2s2 11f         3d2  4s2 11f
   24    2cr ii d4 6h            3d4  6h
   24    2cr ii d4 7h            3d4  7h
   24    2cr ii d4 8h            3d4  8h
   24    2cr ii d4 9h            3d4  9h
   24    2cr ii d4 10h           3d4 10h
   24    2cr ii d3 4s6h          3d3  4s   6h
   24    2cr ii d3 4s7h          3d3  4s   7h
   24    2cr ii d3 4s8h          3d3  4s   8h
   24    2cr ii d3 4s9h          3d3  4s   9h
   24    2cr ii d4 8k            3d4  8k
   24    2cr ii d4 9k            3d4  9k
   24    2cr ii d3 4s8k          3d3  4s   8k
   24    2cr ii d3 4s9k          3d3  4s   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF240101.DAT;*
$DELETE POOLG:HF240102.DAT;*
$DELETE POOLG:HF240104.DAT;*
$DELETE POOLG:HF240131.DAT;*
$DELETE POOLG:HF240132.DAT;*
