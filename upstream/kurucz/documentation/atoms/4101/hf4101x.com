$set DEF KU6E:[KURUCZ.4101]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf410107.dat for007
$assign pool:hf410101.dat for001
$assign pool:hf410102.dat for002
$assign pool:hf410104.dat for004
$assign hf4101x.pun for011
$assign hf4101x.rrr for012
$assign hf4101x.dat for013
$assign hf4101xe.dat for014
$assign pool:hf410131.dat for031
$assign pool:hf410132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   41    2nb ii d4               4d4
   41    2nb ii d3 5s            4d3  5s
   41    2nb ii d3 6s            4d3  6s
   41    2nb ii d3 7s            4d3  7s
   41    2nb ii d3 8s            4d3  8s
   41    2nb ii d3 9s            4d3  9s
   41    2nb ii d3 10s           4d3 10s
   41    2nb ii d3 11s           4d3 11s
   41    2nb ii d2 5s2           4d2  5s2
   41    2nb ii d2 5s6s          4d2  5s   6s
   41    2nb ii d2 5s7s          4d2  5s   7s
   41    2nb ii d2 5s8s          4d2  5s   8s
   41    2nb ii d2 5s9s          4d2  5s   9s
   41    2nb ii d2 5s10s         4d2  5s  10s
   41    2nb ii d2 5s11s         4d2  5s  11s
   41    2nb ii ds2 6s           4d1  5s2  6s
   41    2nb ii ds2 7s           4d1  5s2  7s
   41    2nb ii ds2 8s           4d1  5s2  8s
   41    2nb ii ds2 9s           4d1  5s2  9s
   41    2nb ii ds2 10s          4d1  5s2 10s
   41    2nb ii ds2 11s          4d1  5s2 11s
   41    2nb ii d3 5d            4d3  5d
   41    2nb ii d3 6d            4d3  6d
   41    2nb ii d3 7d            4d3  7d
   41    2nb ii d3 8d            4d3  8d
   41    2nb ii d3 9d            4d3  9d
   41    2nb ii d3 10d           4d3 10d
   41    2nb ii d3 11d           4d3 11d
   41    2nb ii d2 5s5d          4d2  5s   5d
   41    2nb ii d2 5s6d          4d2  5s   6d
   41    2nb ii d2 5s7d          4d2  5s   7d
   41    2nb ii d2 5s8d          4d2  5s   8d
   41    2nb ii d2 5s9d          4d2  5s   9d
   41    2nb ii d2 5s10d         4d2  5s  10d
   41    2nb ii d2 5s11d         4d2  5s  11d
   41    2nb ii ds2 5d           4d1  5s2  5d
   41    2nb ii ds2 6d           4d1  5s2  6d
   41    2nb ii ds2 7d           4d1  5s2  7d
   41    2nb ii ds2 8d           4d1  5s2  8d
   41    2nb ii ds2 9d           4d1  5s2  9d
   41    2nb ii ds2 10d          4d1  5s2 10d
   41    2nb ii ds2 11d          4d1  5s2 11d
   41    2nb ii d3 5g            4d3  5g
   41    2nb ii d3 6g            4d3  6g
   41    2nb ii d3 7g            4d3  7g
   41    2nb ii d3 8g            4d3  8g
   41    2nb ii d3 9g            4d3  9g
   41    2nb ii d3 10g           4d3 10g
   41    2nb ii d2 5s5g          4d2  5s   5g
   41    2nb ii d2 5s6g          4d2  5s   6g
   41    2nb ii d2 5s7g          4d2  5s   7g
   41    2nb ii d2 5s8g          4d2  5s   8g
   41    2nb ii d2 5s9g          4d2  5s   9g
   41    2nb ii d2 5s10g         4d2  5s  10g
   41    2nb ii d3 7i            4d3  7i
   41    2nb ii d3 8i            4d3  8i
   41    2nb ii d3 9i            4d3  9i
   41    2nb ii d2 5s7i          4d2  5s   7i
   41    2nb ii d2 5s8i          4d2  5s   8i
   41    2nb ii d2 5s9i          4d2  5s   9i
   41    2nb ii d2 5p2           4d2  5p2
   41    2nb ii d3 5p            4d3  5p
   41    2nb ii d3 6p            4d3  6p
   41    2nb ii d3 7p            4d3  7p
   41    2nb ii d3 8p            4d3  8p
   41    2nb ii d3 9p            4d3  9p
   41    2nb ii d3 10p           4d3 10p
   41    2nb ii d3 11p           4d3 11p
   41    2nb ii d3 12p           4d3 12p
   41    2nb ii d2 5s5p          4d2  5s   5p
   41    2nb ii d2 5s6p          4d2  5s   6p
   41    2nb ii d2 5s7p          4d2  5s   7p
   41    2nb ii d2 5s8p          4d2  5s   8p
   41    2nb ii d2 5s9p          4d2  5s   9p
   41    2nb ii d2 5s10p         4d2  5s  10p
   41    2nb ii d2 5s11p         4d2  5s  11p
   41    2nb ii d2 5s12p         4d2  5s  12p
   41    2nb ii ds2 5p           4d1  5s2  5p
   41    2nb ii ds2 6p           4d1  5s2  6p
   41    2nb ii ds2 7p           4d1  5s2  7p
   41    2nb ii ds2 8p           4d1  5s2  8p
   41    2nb ii ds2 9p           4d1  5s2  9p
   41    2nb ii ds2 10p          4d1  5s2 10p
   41    2nb ii ds2 11p          4d1  5s2 11p
   41    2nb ii ds2 12p          4d1  5s2 12p
   41    2nb ii d3 4f            4d3  4f
   41    2nb ii d3 5f            4d3  5f
   41    2nb ii d3 6f            4d3  6f
   41    2nb ii d3 7f            4d3  7f
   41    2nb ii d3 8f            4d3  8f
   41    2nb ii d3 9f            4d3  9f
   41    2nb ii d3 10f           4d3 10f
   41    2nb ii d3 11f           4d3 11f
   41    2nb ii d2 5s4f          4d2  5s   4f
   41    2nb ii d2 5s5f          4d2  5s   5f
   41    2nb ii d2 5s6f          4d2  5s   6f
   41    2nb ii d2 5s7f          4d2  5s   7f
   41    2nb ii d2 5s8f          4d2  5s   8f
   41    2nb ii d2 5s9f          4d2  5s   9f
   41    2nb ii d2 5s10f         4d2  5s  10f
   41    2nb ii d2 5s11f         4d2  5s  11f
   41    2nb ii ds2 4f           4d1  5s2  4f
   41    2nb ii ds2 5f           4d1  5s2  5f
   41    2nb ii ds2 6f           4d1  5s2  6f
   41    2nb ii ds2 7f           4d1  5s2  7f
   41    2nb ii ds2 8f           4d1  5s2  8f
   41    2nb ii ds2 9f           4d1  5s2  9f
   41    2nb ii ds2 10f          4d1  5s2 10f
   41    2nb ii ds2 11f          4d1  5s2 11f
   41    2nb ii d3 6h            4d3  6h
   41    2nb ii d3 7h            4d3  7h
   41    2nb ii d3 8h            4d3  8h
   41    2nb ii d3 9h            4d3  9h
   41    2nb ii d3 10h           4d3 10h
   41    2nb ii d2 5s6h          4d2  5s   6h
   41    2nb ii d2 5s7h          4d2  5s   7h
   41    2nb ii d2 5s8h          4d2  5s   8h
   41    2nb ii d2 5s9h          4d2  5s   9h
   41    2nb ii d3 8k            4d3  8k
   41    2nb ii d3 9k            4d3  9k
   41    2nb ii d2 5s8k          4d2  5s   8k
   41    2nb ii d2 5s9k          4d2  5s   9k
   -1
$run cray:rcn2c
$DELETE POOL:HF410101.DAT;*
$DELETE POOL:HF410102.DAT;*
$DELETE POOL:HF410104.DAT;*
$DELETE POOL:HF410131.DAT;*
$DELETE POOL:HF410132.DAT;*
