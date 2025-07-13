$set DEF KU6E:[KURUCZ.4000]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf400007.dat for007
$assign pool:hf400001.dat for001
$assign pool:hf400002.dat for002
$assign pool:hf400004.dat for004
$assign hf4000x.pun for011
$assign hf4000x.rrr for012
$assign hf4000x.dat for013
$assign hf4000xe.dat for014
$assign pool:hf400031.dat for031
$assign pool:hf400032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   40    1zr i  d2 5s2           4d2  5s2
   40    1zr i  d2 5s6s          4d2  5s   6s
   40    1zr i  d2 5s7s          4d2  5s   7s
   40    1zr i  d2 5s8s          4d2  5s   8s
   40    1zr i  d2 5s9s          4d2  5s   9s
   40    1zr i  d2 5s10s         4d2  5s  10s
   40    1zr i  d2 5s11s         4d2  5s  11s
   40    1zr i  d3 5s            4d3  5s
   40    1zr i  d3 6s            4d3  6s
   40    1zr i  d3 7s            4d3  7s
   40    1zr i  d3 8s            4d3  8s
   40    1zr i  d3 9s            4d3  9s
   40    1zr i  d3 10s           4d3 10s
   40    1zr i  d3 11s           4d3 11s
   40    1zr i  ds2 6s           4d1  5s2  6s
   40    1zr i  ds2 7s           4d1  5s2  7s
   40    1zr i  ds2 8s           4d1  5s2  8s
   40    1zr i  ds2 9s           4d1  5s2  9s
   40    1zr i  ds2 10s          4d1  5s2 10s
   40    1zr i  ds2 11s          4d1  5s2 11s
   40    1zr i  d4               4d4
   40    1zr i  d3 5d            4d3  5d
   40    1zr i  d3 6d            4d3  6d
   40    1zr i  d3 7d            4d3  7d
   40    1zr i  d3 8d            4d3  8d
   40    1zr i  d3 9d            4d3  9d
   40    1zr i  d3 10d           4d3 10d
   40    1zr i  d3 11d           4d3 11d
   40    1zr i  d2 5s5d          4d2  5s   5d
   40    1zr i  d2 5s6d          4d2  5s   6d
   40    1zr i  d2 5s7d          4d2  5s   7d
   40    1zr i  d2 5s8d          4d2  5s   8d
   40    1zr i  d2 5s9d          4d2  5s   9d
   40    1zr i  d2 5s10d         4d2  5s  10d
   40    1zr i  d2 5s11d         4d2  5s  11d
   40    1zr i  ds2 5d           4d1  5s2  5d
   40    1zr i  ds2 6d           4d1  5s2  6d
   40    1zr i  ds2 7d           4d1  5s2  7d
   40    1zr i  ds2 8d           4d1  5s2  8d
   40    1zr i  ds2 9d           4d1  5s2  9d
   40    1zr i  ds2 10d          4d1  5s2 10d
   40    1zr i  ds2 11d          4d1  5s2 11d
   40    1zr i  d3 5g            4d3  5g
   40    1zr i  d3 6g            4d3  6g
   40    1zr i  d3 7g            4d3  7g
   40    1zr i  d3 8g            4d3  8g
   40    1zr i  d3 9g            4d3  9g
   40    1zr i  d3 10g           4d3 10g
   40    1zr i  d2 5s5g          4d2  5s   5g
   40    1zr i  d2 5s6g          4d2  5s   6g
   40    1zr i  d2 5s7g          4d2  5s   7g
   40    1zr i  d2 5s8g          4d2  5s   8g
   40    1zr i  d2 5s9g          4d2  5s   9g
   40    1zr i  d2 5s10g         4d2  5s  10g
   40    1zr i  d3 7i            4d3  7i
   40    1zr i  d3 8i            4d3  8i
   40    1zr i  d3 9i            4d3  9i
   40    1zr i  d2 5s7i          4d2  5s   7i
   40    1zr i  d2 5s8i          4d2  5s   8i
   40    1zr i  d2 5s9i          4d2  5s   9i
   40    1zr i  d2 5p2           4d2  5p2
   40    1zr i  d2 5s5p          4d2  5s   5p
   40    1zr i  d2 5s6p          4d2  5s   6p
   40    1zr i  d2 5s7p          4d2  5s   7p
   40    1zr i  d2 5s8p          4d2  5s   8p
   40    1zr i  d2 5s9p          4d2  5s   9p
   40    1zr i  d2 5s10p         4d2  5s  10p
   40    1zr i  d2 5s11p         4d2  5s  11p
   40    1zr i  d2 5s12p         4d2  5s  12p
   40    1zr i  d3 5p            4d3  5p
   40    1zr i  d3 6p            4d3  6p
   40    1zr i  d3 7p            4d3  7p
   40    1zr i  d3 8p            4d3  8p
   40    1zr i  d3 9p            4d3  9p
   40    1zr i  d3 10p           4d3 10p
   40    1zr i  d3 11p           4d3 11p
   40    1zr i  d3 12p           4d3 12p
   40    1zr i  ds2 5p           4d1  5s2  5p
   40    1zr i  ds2 6p           4d1  5s2  6p
   40    1zr i  ds2 7p           4d1  5s2  7p
   40    1zr i  ds2 8p           4d1  5s2  8p
   40    1zr i  ds2 9p           4d1  5s2  9p
   40    1zr i  ds2 10p          4d1  5s2 10p
   40    1zr i  ds2 11p          4d1  5s2 11p
   40    1zr i  ds2 12p          4d1  5s2 12p
   40    1zr i  d3 4f            4d3  4f
   40    1zr i  d3 5f            4d3  5f
   40    1zr i  d3 6f            4d3  6f
   40    1zr i  d3 7f            4d3  7f
   40    1zr i  d3 8f            4d3  8f
   40    1zr i  d3 9f            4d3  9f
   40    1zr i  d3 10f           4d3 10f
   40    1zr i  d3 11f           4d3 11f
   40    1zr i  d2 5s4f          4d2  5s   4f
   40    1zr i  d2 5s5f          4d2  5s   5f
   40    1zr i  d2 5s6f          4d2  5s   6f
   40    1zr i  d2 5s7f          4d2  5s   7f
   40    1zr i  d2 5s8f          4d2  5s   8f
   40    1zr i  d2 5s9f          4d2  5s   9f
   40    1zr i  d2 5s10f         4d2  5s  10f
   40    1zr i  d2 5s11f         4d2  5s  11f
   40    1zr i  ds2 4f           4d1  5s2  4f
   40    1zr i  ds2 5f           4d1  5s2  5f
   40    1zr i  ds2 6f           4d1  5s2  6f
   40    1zr i  ds2 7f           4d1  5s2  7f
   40    1zr i  ds2 8f           4d1  5s2  8f
   40    1zr i  ds2 9f           4d1  5s2  9f
   40    1zr i  ds2 10f          4d1  5s2 10f
   40    1zr i  ds2 11f          4d1  5s2 11f
   40    1zr i  d3 6h            4d3  6h
   40    1zr i  d3 7h            4d3  7h
   40    1zr i  d3 8h            4d3  8h
   40    1zr i  d3 9h            4d3  9h
   40    1zr i  d3 10h           4d3 10h
   40    1zr i  d2 5s6h          4d2  5s   6h
   40    1zr i  d2 5s7h          4d2  5s   7h
   40    1zr i  d2 5s8h          4d2  5s   8h
   40    1zr i  d2 5s9h          4d2  5s   9h
   40    1zr i  d3 8k            4d3  8k
   40    1zr i  d3 9k            4d3  9k
   40    1zr i  d2 5s8k          4d2  5s   8k
   40    1zr i  d2 5s9k          4d2  5s   9k
   -1
$run cray:rcn2c
$DELETE POOL:HF400001.DAT;*
$DELETE POOL:HF400002.DAT;*
$DELETE POOL:HF400004.DAT;*
$DELETE POOL:HF400031.DAT;*
$DELETE POOL:HF400032.DAT;*
