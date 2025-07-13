$set def 2700
$assign sys$input for010
$assign sys$output for009
$assign K1C:hf270007.dat for007
$assign K1C:hf270001.dat for001
$assign K1C:hf270002.dat for002
$assign K1C:hf270004.dat for004
$assign hf2700x.pun for011
$assign hf2700x.rrr for012
$assign hf2700x.dat for013
$assign hf2700xe.dat for014
$assign K1C:hf270031.dat for031
$assign K1C:hf270032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   27    1co i  d7 4s2           3d7  4s2
   27    1co i  d9               3d9
   27    1co i  d8 4s            3d8  4s
   27    1co i  d7 4s5s          3d7  4s   5s
   27    1co i  d7 4s6s          3d7  4s   6s
   27    1co i  d7 4s7s          3d7  4s   7s
   27    1co i  d7 4s8s          3d7  4s   8s
   27    1co i  d7 4s9s          3d7  4s   9s
   27    1co i  d7 4s10s         3d7  4s  10s
   27    1co i  d8 5s            3d8  5s
   27    1co i  d8 6s            3d8  6s
   27    1co i  d8 7s            3d8  7s
   27    1co i  d8 8s            3d8  8s
   27    1co i  d8 9s            3d8  9s
   27    1co i  d8 10s           3d8 10s
   27    1co i  d6s2 5s          3d6  4s2  5s
   27    1co i  d6s2 6s          3d6  4s2  6s
   27    1co i  d6s2 7s          3d6  4s2  7s
   27    1co i  d6s2 8s          3d6  4s2  8s
   27    1co i  d6s2 9s          3d6  4s2  9s
   27    1co i  d8 4d            3d8  4d
   27    1co i  d8 5d            3d8  5d
   27    1co i  d8 6d            3d8  6d
   27    1co i  d8 7d            3d8  7d
   27    1co i  d8 8d            3d8  8d
   27    1co i  d8 9d            3d8  9d
   27    1co i  d8 10d           3d8 10d
   27    1co i  d8 11d           3d8 11d
   27    1co i  d7 4s4d          3d7  4s   4d
   27    1co i  d7 4s5d          3d7  4s   5d
   27    1co i  d7 4s6d          3d7  4s   6d
   27    1co i  d7 4s7d          3d7  4s   7d
   27    1co i  d7 4s8d          3d7  4s   8d
   27    1co i  d7 4s9d          3d7  4s   9d
   27    1co i  d7 4s10d         3d7  4s  10d
   27    1co i  d7 4s11d         3d7  4s  11d
   27    1co i  d6s2 4d          3d6  4s2  4d
   27    1co i  d6s2 5d          3d6  4s2  5d
   27    1co i  d6s2 6d          3d6  4s2  6d
   27    1co i  d6s2 7d          3d6  4s2  7d
   27    1co i  d6s2 8d          3d6  4s2  8d
   27    1co i  d6s2 9d          3d6  4s2  9d
   27    1co i  d8 5g            3d8  5g
   27    1co i  d8 6g            3d8  6g
   27    1co i  d8 7g            3d8  7g
   27    1co i  d8 8g            3d8  8g
   27    1co i  d8 9g            3d8  9g
   27    1co i  d7 4s5g          3d7  4s   5g
   27    1co i  d7 4s6g          3d7  4s   6g
   27    1co i  d7 4s7g          3d7  4s   7g
   27    1co i  d7 4s8g          3d7  4s   8g
   27    1co i  d7 4s9g          3d7  4s   9g
   27    1co i  d8 7i            3d8  7i
   27    1co i  d8 8i            3d8  8i
   27    1co i  d8 9i            3d8  9i
   27    1co i  d7 4s7i          3d7  4s   7i
   27    1co i  d7 4s8i          3d7  4s   8i
   27    1co i  d7 4s9i          3d7  4s   9i
   27    1co i  d8 9l            3d8 10l                                               actually 9l
   27    1co i  d7 4s9l          3d7  4s  10l                                          actually 9l
   27    1co i  d7 4p2           3d7  4p2
   27    1co i  d8 4p            3d8  4p
   27    1co i  d8 5p            3d8  5p
   27    1co i  d8 6p            3d8  6p
   27    1co i  d8 7p            3d8  7p
   27    1co i  d8 8p            3d8  8p
   27    1co i  d8 9p            3d8  9p
   27    1co i  d8 10p           3d8 10p
   27    1co i  d8 11p           3d8 11p
   27    1co i  d8 12p           3d8 12p
   27    1co i  d8 13p           3d8 13p
   27    1co i  d7 4s4p          3d7  4s   4p
   27    1co i  d7 4s5p          3d7  4s   5p
   27    1co i  d7 4s6p          3d7  4s   6p
   27    1co i  d7 4s7p          3d7  4s   7p
   27    1co i  d7 4s8p          3d7  4s   8p
   27    1co i  d7 4s9p          3d7  4s   9p
   27    1co i  d7 4s10p         3d7  4s  10p
   27    1co i  d7 4s11p         3d7  4s  11p
   27    1co i  d7 4s12p         3d7  4s  12p
   27    1co i  d7 4s13p         3d7  4s  13p
   27    1co i  d6s2 4p          3d6  4s2  4p
   27    1co i  d6s2 5p          3d6  4s2  5p
   27    1co i  d6s2 6p          3d6  4s2  6p
   27    1co i  d6s2 7p          3d6  4s2  7p
   27    1co i  d6s2 8p          3d6  4s2  8p
   27    1co i  d6s2 9p          3d6  4s2  9p
   27    1co i  d8 4f            3d8  4f
   27    1co i  d8 5f            3d8  5f
   27    1co i  d8 6f            3d8  6f
   27    1co i  d8 7f            3d8  7f
   27    1co i  d8 8f            3d8  8f
   27    1co i  d8 9f            3d8  9f
   27    1co i  d8 10f           3d8 10f
   27    1co i  d8 11f           3d8 11f
   27    1co i  d8 12f           3d8 12f
   27    1co i  d7 4s4f          3d7  4s   4f
   27    1co i  d7 4s5f          3d7  4s   5f
   27    1co i  d7 4s6f          3d7  4s   6f
   27    1co i  d7 4s7f          3d7  4s   7f
   27    1co i  d7 4s8f          3d7  4s   8f
   27    1co i  d7 4s9f          3d7  4s   9f
   27    1co i  d7 4s10f         3d7  4s  10f
   27    1co i  d7 4s11f         3d7  4s  11f
   27    1co i  d6s2 4f          3d6  4s2  4f
   27    1co i  d6s2 5f          3d6  4s2  5f
   27    1co i  d6s2 6f          3d6  4s2  6f
   27    1co i  d6s2 7f          3d6  4s2  7f
   27    1co i  d6s2 8f          3d6  4s2  8f
   27    1co i  d6s2 9f          3d6  4s2  9f
   27    1co i  d8 6h            3d8  6h
   27    1co i  d8 7h            3d8  7h
   27    1co i  d8 8h            3d8  8h
   27    1co i  d8 9h            3d8  9h
   27    1co i  d7 4s6h          3d7  4s   6h
   27    1co i  d7 4s7h          3d7  4s   7h
   27    1co i  d7 4s8h          3d7  4s   8h
   27    1co i  d7 4s9h          3d7  4s   9h
   27    1co i  d8 8k            3d8  8k
   27    1co i  d8 9k            3d8  9k
   27    1co i  d7 4s8k          3d7  4s   8k
   27    1co i  d7 4s9k          3d7  4s   9k
   -1
$run cray:rcn2c
$DELETE K1C:HF270001.DAT;*
$DELETE K1C:HF270002.DAT;*
$DELETE K1C:HF270004.DAT;*
$DELETE K1C:HF270031.DAT;*
$DELETE K1C:HF270032.DAT;*
