$set2900
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf290007.dat for007
$assign poolg:hf290001.dat for001
$assign poolg:hf290002.dat for002
$assign poolg:hf290004.dat for004
$assign hf2900x.pun for011
$assign hf2900x.rrr for012
$assign hf2900x.dat for013
$assign hf2900xE.DAT for014
$assign poolg:hf290031.dat for031
$assign poolg:hf290032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   29    1cu i  d9 4s2           3d9  4s2
   29    1cu i  d9 4s5s          3d9  4s   5s
   29    1cu i  d9 4s6s          3d9  4s   6s
   29    1cu i  d9 4s7s          3d9  4s   7s
   29    1cu i  d9 4s8s          3d9  4s   8s
   29    1cu i  d9 4s9s          3d9  4s   9s
   29    1cu i  d9 4s10s         3d9  4s  10s
   29    1cu i  d9 4s11s         3d9  4s  11s
   29    1cu i  d9 4s12s         3d9  4s  12s
   29    1cu i  d9 4s13s         3d9  4s  13s
   29    1cu i  d9 4s14s         3d9  4s  14s
   29    1cu i  d10 4s           3d10 4s
   29    1cu i  d10 5s           3d10 5s
   29    1cu i  d10 6s           3d10 6s
   29    1cu i  d10 7s           3d10 7s
   29    1cu i  d10 8s           3d10 8s
   29    1cu i  d10 9s           3d10 9s
   29    1cu i  d10 10s          3d1010s
   29    1cu i  d10 11s          3d1011s
   29    1cu i  d10 12s          3d1012s
   29    1cu i  d10 13s          3d1013s
   29    1cu i  d10 14s          3d1014s
   29    1cu i  d10 15s          3d1015s
   29    1cu i  d8s2 5s          3d8  4s2  5s
   29    1cu i  d8s2 6s          3d8  4s2  6s
   29    1cu i  d9 4s4d          3d9  4s   4d
   29    1cu i  d9 4s5d          3d9  4s   5d
   29    1cu i  d9 4s6d          3d9  4s   6d
   29    1cu i  d9 4s7d          3d9  4s   7d
   29    1cu i  d9 4s8d          3d9  4s   8d
   29    1cu i  d9 4s9d          3d9  4s   9d
   29    1cu i  d9 4s10d         3d9  4s  10d
   29    1cu i  d10 4d           3d10 4d
   29    1cu i  d10 5d           3d10 5d
   29    1cu i  d10 6d           3d10 6d
   29    1cu i  d10 7d           3d10 7d
   29    1cu i  d10 8d           3d10 8d
   29    1cu i  d10 9d           3d10 9d
   29    1cu i  d10 10d          3d1010d
   29    1cu i  d10 11d          3d1011d
   29    1cu i  d8s2 4d          3d8  4s2  4d
   29    1cu i  d8s2 5d          3d8  4s2  5d
   29    1cu i  d9 4s5g          3d9  4s   5g
   29    1cu i  d9 4s6g          3d9  4s   6g
   29    1cu i  d9 4s7g          3d9  4s   7g
   29    1cu i  d9 4s8g          3d9  4s   8g
   29    1cu i  d9 4s9g          3d9  4s   9g
   29    1cu i  d10 5g           3d10 5g
   29    1cu i  d10 6g           3d10 6g
   29    1cu i  d10 7g           3d10 7g
   29    1cu i  d10 8g           3d10 8g
   29    1cu i  d10 9g           3d10 9g
   29    1cu i  d9 4s7i          3d9  4s   7i
   29    1cu i  d9 4s8i          3d9  4s   8i
   29    1cu i  d9 4s9i          3d9  4s   9i
   29    1cu i  d10 7i           3d10 7i
   29    1cu i  d10 8i           3d10 8i
   29    1cu i  d10 9i           3d10 9i
   29    1cu i  d9 4s9l          3d9  4s  10l
   29    1cu i  d10 9l           3d1010l
   29    1cu i  d9 4p2           3d9  4p2
   29    1cu i  d9 4s4p          3d9  4s   4p
   29    1cu i  d9 4s5p          3d9  4s   5p
   29    1cu i  d9 4s6p          3d9  4s   6p
   29    1cu i  d9 4s7p          3d9  4s   7p
   29    1cu i  d9 4s8p          3d9  4s   8p
   29    1cu i  d9 4s9p          3d9  4s   9p
   29    1cu i  d9 4s10p         3d9  4s  10p
   29    1cu i  d9 4s11p         3d9  4s  11p
   29    1cu i  d9 4s12p         3d9  4s  12p
   29    1cu i  d9 4s13p         3d9  4s  13p
   29    1cu i  d9 4s14p         3d9  4s  14p
   29    1cu i  d9 4s15p         3d9  4s  15p
   29    1cu i  d10 4p           3d10 4p
   29    1cu i  d10 5p           3d10 5p
   29    1cu i  d10 6p           3d10 6p
   29    1cu i  d10 7p           3d10 7p
   29    1cu i  d10 8p           3d10 8p
   29    1cu i  d10 9p           3d10 9p
   29    1cu i  d10 10p          3d1010p
   29    1cu i  d10 11p          3d1011p
   29    1cu i  d10 12p          3d1012p
   29    1cu i  d10 13p          3d1013p
   29    1cu i  d10 14p          3d1014p
   29    1cu i  d10 15p          3d1015p
   29    1cu i  d8s2 4p          3d8  4s2  4p
   29    1cu i  d8s2 5p          3d8  4s2  5p
   29    1cu i  d8s2 6p          3d8  4s2  6p
   29    1cu i  d8s2 7p          3d8  4s2  7p
   29    1cu i  d9 4s4f          3d9  4s   4f
   29    1cu i  d9 4s5f          3d9  4s   5f
   29    1cu i  d9 4s6f          3d9  4s   6f
   29    1cu i  d9 4s7f          3d9  4s   7f
   29    1cu i  d9 4s8f          3d9  4s   8f
   29    1cu i  d9 4s9f          3d9  4s   9f
   29    1cu i  d9 4s10f         3d9  4s  10f
   29    1cu i  d9 4s11f         3d9  4s  11f
   29    1cu i  d9 4s12f         3d9  4s  12f
   29    1cu i  d9 4s13f         3d9  4s  13f
   29    1cu i  d9 4s14f         3d9  4s  14f
   29    1cu i  d10 4f           3d10 4f
   29    1cu i  d10 5f           3d10 5f
   29    1cu i  d10 6f           3d10 6f
   29    1cu i  d10 7f           3d10 7f
   29    1cu i  d10 8f           3d10 8f
   29    1cu i  d10 9f           3d10 9f
   29    1cu i  d10 10f          3d1010f
   29    1cu i  d10 11f          3d1011f
   29    1cu i  d10 12f          3d1012f
   29    1cu i  d8s2 4f          3d8  4s2  4f
   29    1cu i  d9 4s6h          3d9  4s   6h
   29    1cu i  d9 4s7h          3d9  4s   7h
   29    1cu i  d9 4s8h          3d9  4s   8h
   29    1cu i  d9 4s9h          3d9  4s   9h
   29    1cu i  d10 6h           3d10 6h
   29    1cu i  d10 7h           3d10 7h
   29    1cu i  d10 8h           3d10 8h
   29    1cu i  d10 9h           3d10 9h
   29    1cu i  d9 4s8k          3d9  4s   8k
   29    1cu i  d9 4s9k          3d9  4s   9k
   29    1cu i  d10 8k           3d10 8k
   29    1cu i  d10 9k           3d10 9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF290001.DAT;*
$DELETE POOLG:HF290002.DAT;*
$DELETE POOLG:HF290004.DAT;*
$DELETE POOLG:HF290031.DAT;*
$DELETE POOLG:HF290032.DAT;*
