$set2902
$assign sys$input for010
$assign sys$output for009
$assign pool2:hf290207.dat for007
$assign pool2:hf290201.dat for001
$assign pool2:hf290202.dat for002
$assign pool2:hf290204.dat for004
$assign hf2902x.pun for011
$assign hf2902x.rrr for012
$assign hf2902x.dat for013
$assign hf2902xe.dat for014
$assign pool2:hf290231.dat for031
$assign pool2:hf290232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   29    3cu iiid9               3d9
   29    3cu iiid8 4d            3d8  4d
   29    3cu iiid8 5d            3d8  5d
   29    3cu iiid8 6d            3d8  6d
   29    3cu iiid8 7d            3d8  7d
   29    3cu iiid8 8d            3d8  8d
   29    3cu iiid8 9d            3d8  9d
   29    3cu iiid8 10d           3d8 10d
   29    3cu iiid8 11d           3d8 11d
   29    3cu iiid8 12d           3d8 12d
   29    3cu iiid8 13d           3d8 13d
   29    3cu iiid7 4s4d          3d7  4s   4d
   29    3cu iiid7 4s5d          3d7  4s   5d
   29    3cu iiid7 4s6d          3d7  4s   6d
   29    3cu iiid7 4s7d          3d7  4s   7d
   29    3cu iiid7 4s8d          3d7  4s   8d
   29    3cu iiid7 4s9d          3d7  4s   9d
   29    3cu iiid7 4s10d         3d7  4s  10d
   29    3cu iiid7 4s11d         3d7  4s  11d
   29    3cu iiid7 4s12d         3d7  4s  12d
   29    3cu iiid7 4s13d         3d7  4s  13d
   29    3cu iiid6s2 4d          3d6  4s2  4d
   29    3cu iiid8 4s            3d8  4s
   29    3cu iiid8 5s            3d8  5s
   29    3cu iiid8 6s            3d8  6s
   29    3cu iiid8 7s            3d8  7s
   29    3cu iiid8 8s            3d8  8s
   29    3cu iiid8 9s            3d8  9s
   29    3cu iiid8 10s           3d8 10s
   29    3cu iiid8 11s           3d8 11s
   29    3cu iiid8 12s           3d8 12s
   29    3cu iiid8 13s           3d8 13s
   29    3cu iiid7 4s2           3d7  4s2
   29    3cu iiid7 4s5s          3d7  4s   5s
   29    3cu iiid7 4s6s          3d7  4s   6s
   29    3cu iiid7 4s7s          3d7  4s   7s
   29    3cu iiid7 4s8s          3d7  4s   8s
   29    3cu iiid7 4s9s          3d7  4s   9s
   29    3cu iiid7 4s10s         3d7  4s  10s
   29    3cu iiid7 4s11s         3d7  4s  11s
   29    3cu iiid7 4s12s         3d7  4s  12s
   29    3cu iiid6s2 5s          3d6  4s2  5s
   29    3cu iiid8 5g            3d8  5g
   29    3cu iiid8 6g            3d8  6g
   29    3cu iiid8 7g            3d8  7g
   29    3cu iiid8 8g            3d8  8g
   29    3cu iiid8 9g            3d8  9g
   29    3cu iiid7 4s5g          3d7  4s   5g
   29    3cu iiid7 4s6g          3d7  4s   6g
   29    3cu iiid7 4s7g          3d7  4s   7g
   29    3cu iiid7 4s8g          3d7  4s   8g
   29    3cu iiid7 4s9g          3d7  4s   9g
   29    3cu iiid8 7i            3d8  7i
   29    3cu iiid8 8i            3d8  8i
   29    3cu iiid8 9i            3d8  9i
   29    3cu iiid7 4s7i          3d7  4s   7i
   29    3cu iiid7 4s8i          3d7  4s   8i
   29    3cu iiid7 4s9i          3d7  4s   9i
   29    3cu iiid8 9l            3d8 10l                                               actually 9l
   29    3cu iiid7 4s9l          3d7  4s  10l                                          actually 9l
   29    3cu iiid7 4p2           3d7  4p2
   29    3cu iiid8 4p            3d8  4p
   29    3cu iiid8 5p            3d8  5p
   29    3cu iiid8 6p            3d8  6p
   29    3cu iiid8 7p            3d8  7p
   29    3cu iiid8 8p            3d8  8p
   29    3cu iiid8 9p            3d8  9p
   29    3cu iiid8 10p           3d8 10p
   29    3cu iiid8 11p           3d8 11p
   29    3cu iiid8 12p           3d8 12p
   29    3cu iiid8 13p           3d8 13p
   29    3cu iiid8 14p           3d8 14p
   29    3cu iiid8 15p           3d8 15p
   29    3cu iiid7 4s4p          3d7  4s   4p
   29    3cu iiid7 4s5p          3d7  4s   5p
   29    3cu iiid7 4s6p          3d7  4s   6p
   29    3cu iiid7 4s7p          3d7  4s   7p
   29    3cu iiid7 4s8p          3d7  4s   8p
   29    3cu iiid7 4s9p          3d7  4s   9p
   29    3cu iiid7 4s10p         3d7  4s  10p
   29    3cu iiid7 4s11p         3d7  4s  11p
   29    3cu iiid7 4s12p         3d7  4s  12p
   29    3cu iiid7 4s13p         3d7  4s  13p
   29    3cu iiid7 4s14p         3d7  4s  14p
   29    3cu iiid6s2 4p          3d6  4s2  4p
   29    3cu iiid6s2 5p          3d6  4s2  5p
   29    3cu iiid6s2 6p          3d6  4s2  6p
   29    3cu iiid6s2 7p          3d6  4s2  7p
   29    3cu iiid6s2 8p          3d6  4s2  8p
   29    3cu iiid6s2 9p          3d6  4s2  9p
   29    3cu iiid8 4f            3d8  4f
   29    3cu iiid8 5f            3d8  5f
   29    3cu iiid8 6f            3d8  6f
   29    3cu iiid8 7f            3d8  7f
   29    3cu iiid8 8f            3d8  8f
   29    3cu iiid8 9f            3d8  9f
   29    3cu iiid8 10f           3d8 10f
   29    3cu iiid8 11f           3d8 11f
   29    3cu iiid8 12f           3d8 12f
   29    3cu iiid8 13f           3d8 13f
   29    3cu iiid7 4s4f          3d7  4s   4f
   29    3cu iiid7 4s5f          3d7  4s   5f
   29    3cu iiid7 4s6f          3d7  4s   6f
   29    3cu iiid7 4s7f          3d7  4s   7f
   29    3cu iiid7 4s8f          3d7  4s   8f
   29    3cu iiid7 4s9f          3d7  4s   9f
   29    3cu iiid7 4s10f         3d7  4s  10f
   29    3cu iiid7 4s11f         3d7  4s  11f
   29    3cu iiid7 4s12f         3d7  4s  12f
   29    3cu iiid7 4s13f         3d7  4s  13f
   29    3cu iiid6s2 4f          3d6  4s2  4f
   29    3cu iiid6s2 5f          3d6  4s2  5f
   29    3cu iiid6s2 6f          3d6  4s2  6f
   29    3cu iiid6s2 7f          3d6  4s2  7f
   29    3cu iiid6s2 8f          3d6  4s2  8f
   29    3cu iiid6s2 9f          3d6  4s2  9f
   29    3cu iiid8 6h            3d8  6h
   29    3cu iiid8 7h            3d8  7h
   29    3cu iiid8 8h            3d8  8h
   29    3cu iiid8 9h            3d8  9h
   29    3cu iiid8 8k            3d8  8k
   29    3cu iiid8 9k            3d8  9k
   -1
$run cray:rcn2c
$DELETE POOL2:HF290201.DAT;*
$DELETE POOL2:HF290202.DAT;*
$DELETE POOL2:HF290204.DAT;*
$DELETE POOL2:HF290231.DAT;*
$DELETE POOL2:HF290232.DAT;*
