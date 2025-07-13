$set def ku6e:[kurucz.4602]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf460207.dat for007
$assign pool:hf460201.dat for001
$assign pool:hf460202.dat for002
$assign pool:hf460204.dat for004
$assign hf4602x.pun for011
$assign hf4602x.rrr for012
$assign hf4602x.dat for013
$assign hf4602xe.dat for014
$assign pool:hf460231.dat for031
$assign pool:hf460232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   46    3pd iiid8               4d8      
   46    3pd iiid7 5s            4d7  5s
   46    3pd iiid7 6s            4d7  6s
   46    3pd iiid7 7s            4d7  7s
   46    3pd iiid7 8s            4d7  8s
   46    3pd iiid7 9s            4d7  9s
   46    3pd iiid7 10s           4d7 10s
   46    3pd iiid7 11s           4d7 11s
   46    3pd iiid6s2             4d6  5s2
   46    3pd iiid6 5s6s          4d6  5s   6s
   46    3pd iiid6 5s7s          4d6  5s   7s
   46    3pd iiid6 5s8s          4d6  5s   8s
   46    3pd iiid6 5s9s          4d6  5s   9s
   46    3pd iiid6 5s10s         4d6  5s  10s
   46    3pd iiid6 5s11s         4d6  5s  11s
   46    3pd iiid5s2 6s          4d5  5s2  6s
   46    3pd iiid5s2 7s          4d5  5s2  7s
   46    3pd iiid5s2 8s          4d5  5s2  8s
   46    3pd iiid5s2 9s          4d5  5s2  9s
   46    3pd iiid5s2 10s         4d5  5s2 10s
   46    3pd iiid5s2 11s         4d5  5s2 11s
   46    3pd iiid7 5d            4d7  5d
   46    3pd iiid7 6d            4d7  6d
   46    3pd iiid7 7d            4d7  7d
   46    3pd iiid7 8d            4d7  8d
   46    3pd iiid7 9d            4d7  9d
   46    3pd iiid7 10d           4d7 10d
   46    3pd iiid7 11d           4d7 11d
   46    3pd iiid6 5s5d          4d6  5s   5d
   46    3pd iiid6 5s6d          4d6  5s   6d
   46    3pd iiid6 5s7d          4d6  5s   7d
   46    3pd iiid6 5s8d          4d6  5s   8d
   46    3pd iiid6 5s9d          4d6  5s   9d
   46    3pd iiid6 5s10d         4d6  5s  10d
   46    3pd iiid6 5s11d         4d6  5s  11d
   46    3pd iiid5s2 5d          4d5  5s2  5d
   46    3pd iiid5s2 6d          4d5  5s2  6d
   46    3pd iiid5s2 7d          4d5  5s2  7d
   46    3pd iiid5s2 8d          4d5  5s2  8d
   46    3pd iiid5s2 9d          4d5  5s2  9d
   46    3pd iiid5s2 10d         4d5  5s2 10d
   46    3pd iiid5s2 11d         4d5  5s2 11d
   46    3pd iiid7 5g            4d7  5g
   46    3pd iiid7 6g            4d7  6g
   46    3pd iiid7 7g            4d7  7g
   46    3pd iiid7 8g            4d7  8g
   46    3pd iiid7 9g            4d7  9g
   46    3pd iiid7 10g           4d7 10g
   46    3pd iiid6 5s5g          4d6  5s   5g
   46    3pd iiid6 5s6g          4d6  5s   6g
   46    3pd iiid6 5s7g          4d6  5s   7g
   46    3pd iiid6 5s8g          4d6  5s   8g
   46    3pd iiid6 5s9g          4d6  5s   9g
   46    3pd iiid7 7i            4d7  7i
   46    3pd iiid7 8i            4d7  8i
   46    3pd iiid7 9i            4d7  9i
   46    3pd iiid6 5s7i          4d6  5s   7i
   46    3pd iiid6 5s8i          4d6  5s   8i
   46    3pd iiid6 5s9i          4d6  5s   9i
   46    3pd iiid6p2             4d6  5p2
   46    3pd iiid7 5p            4d7  5p
   46    3pd iiid7 6p            4d7  6p
   46    3pd iiid7 7p            4d7  7p
   46    3pd iiid7 8p            4d7  8p
   46    3pd iiid7 9p            4d7  9p
   46    3pd iiid7 10p           4d7 10p
   46    3pd iiid7 11p           4d7 11p
   46    3pd iiid6 5s5p          4d6  5s   5p
   46    3pd iiid6 5s6p          4d6  5s   6p
   46    3pd iiid6 5s7p          4d6  5s   7p
   46    3pd iiid6 5s8p          4d6  5s   8p
   46    3pd iiid6 5s9p          4d6  5s   9p
   46    3pd iiid6 5s10p         4d6  5s  10p
   46    3pd iiid6 5s11p         4d6  5s  11p
   46    3pd iiid5s2 5p          4d5  5s2  5p
   46    3pd iiid5s2 6p          4d5  5s2  6p
   46    3pd iiid5s2 7p          4d5  5s2  7p
   46    3pd iiid5s2 8p          4d5  5s2  8p
   46    3pd iiid5s2 9p          4d5  5s2  9p
   46    3pd iiid5s2 10p         4d5  5s2 10p
   46    3pd iiid7 4f            4d7  4f
   46    3pd iiid7 5f            4d7  5f
   46    3pd iiid7 6f            4d7  6f
   46    3pd iiid7 7f            4d7  7f
   46    3pd iiid7 8f            4d7  8f
   46    3pd iiid7 9f            4d7  9f
   46    3pd iiid6 5s4f          4d6  5s   4f
   46    3pd iiid6 5s5f          4d6  5s   5f
   46    3pd iiid6 5s6f          4d6  5s   6f
   46    3pd iiid6 5s7f          4d6  5s   7f
   46    3pd iiid6 5s8f          4d6  5s   8f
   46    3pd iiid6 5s9f          4d6  5s   9f
   46    3pd iiid5s2 4f          4d5  5s2  4f
   46    3pd iiid5s2 5f          4d5  5s2  5f
   46    3pd iiid5s2 6f          4d5  5s2  6f
   46    3pd iiid5s2 7f          4d5  5s2  7f
   46    3pd iiid5s2 8f          4d5  5s2  8f
   46    3pd iiid5s2 9f          4d5  5s2  9f
   46    3pd iiid7 6h            4d7  6h
   46    3pd iiid7 7h            4d7  7h
   46    3pd iiid7 8h            4d7  8h
   46    3pd iiid7 9h            4d7  9h
   46    3pd iiid6 5s6h          4d6  5s   6h
   46    3pd iiid6 5s7h          4d6  5s   7h
   46    3pd iiid6 5s8h          4d6  5s   8h
   46    3pd iiid6 5s9h          4d6  5s   9h
   46    3pd iiid7 8k            4d7  8k
   46    3pd iiid7 9k            4d7  9k
   46    3pd iiid6 5s8k          4d6  5s   8k
   46    3pd iiid6 5s9k          4d6  5s   9k
   -1
$run cray:rcn2c
$DELETE POOL:HF460201.DAT;*
$DELETE POOL:HF460202.DAT;*
$DELETE POOL:HF460204.DAT;*
$DELETE POOL:HF460231.DAT;*
$DELETE POOL:HF460232.DAT;*
