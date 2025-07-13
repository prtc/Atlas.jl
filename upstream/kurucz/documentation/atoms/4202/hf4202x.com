$set DEF KU6E:[KURUCZ.4202]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf420207.dat for007
$assign pool:hf420201.dat for001
$assign pool:hf420202.dat for002
$assign pool:hf420204.dat for004
$assign hf4202x.pun for011
$assign hf4202x.rrr for012
$assign hf4202x.dat for013
$assign hf4202xe.dat for014
$assign pool:hf420231.dat for031
$assign pool:hf420232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   42    3mo iiid4               4d4
   42    3mo iiid3 5s            4d3  5s
   42    3mo iiid3 6s            4d3  6s
   42    3mo iiid3 7s            4d3  7s
   42    3mo iiid3 8s            4d3  8s
   42    3mo iiid3 9s            4d3  9s
   42    3mo iiid3 10s           4d3 10s
   42    3mo iiid3 11s           4d3 11s
   42    3mo iiid2 5s2           4d2  5s2
   42    3mo iiid2 5s6s          4d2  5s   6s
   42    3mo iiid2 5s7s          4d2  5s   7s
   42    3mo iiid2 5s8s          4d2  5s   8s
   42    3mo iiid2 5s9s          4d2  5s   9s
   42    3mo iiid2 5s10s         4d2  5s  10s
   42    3mo iiid2 5s11s         4d2  5s  11s
   42    3mo iiids2 6s           4d1  5s2  6s
   42    3mo iiids2 7s           4d1  5s2  7s
   42    3mo iiids2 8s           4d1  5s2  8s
   42    3mo iiids2 9s           4d1  5s2  9s
   42    3mo iiids2 10s          4d1  5s2 10s
   42    3mo iiids2 11s          4d1  5s2 11s
   42    3mo iiid3 5d            4d3  5d
   42    3mo iiid3 6d            4d3  6d
   42    3mo iiid3 7d            4d3  7d
   42    3mo iiid3 8d            4d3  8d
   42    3mo iiid3 9d            4d3  9d
   42    3mo iiid3 10d           4d3 10d
   42    3mo iiid3 11d           4d3 11d
   42    3mo iiid2 5s5d          4d2  5s   5d
   42    3mo iiid2 5s6d          4d2  5s   6d
   42    3mo iiid2 5s7d          4d2  5s   7d
   42    3mo iiid2 5s8d          4d2  5s   8d
   42    3mo iiid2 5s9d          4d2  5s   9d
   42    3mo iiid2 5s10d         4d2  5s  10d
   42    3mo iiid2 5s11d         4d2  5s  11d
   42    3mo iiids2 5d           4d1  5s2  5d
   42    3mo iiids2 6d           4d1  5s2  6d
   42    3mo iiids2 7d           4d1  5s2  7d
   42    3mo iiids2 8d           4d1  5s2  8d
   42    3mo iiids2 9d           4d1  5s2  9d
   42    3mo iiids2 10d          4d1  5s2 10d
   42    3mo iiids2 11d          4d1  5s2 11d
   42    3mo iiid3 5g            4d3  5g
   42    3mo iiid3 6g            4d3  6g
   42    3mo iiid3 7g            4d3  7g
   42    3mo iiid3 8g            4d3  8g
   42    3mo iiid3 9g            4d3  9g
   42    3mo iiid3 10g           4d3 10g
   42    3mo iiid2 5s5g          4d2  5s   5g
   42    3mo iiid2 5s6g          4d2  5s   6g
   42    3mo iiid2 5s7g          4d2  5s   7g
   42    3mo iiid2 5s8g          4d2  5s   8g
   42    3mo iiid2 5s9g          4d2  5s   9g
   42    3mo iiid2 5s10g         4d2  5s  10g
   42    3mo iiid3 7i            4d3  7i
   42    3mo iiid3 8i            4d3  8i
   42    3mo iiid3 9i            4d3  9i
   42    3mo iiid2 5s7i          4d2  5s   7i
   42    3mo iiid2 5s8i          4d2  5s   8i
   42    3mo iiid2 5s9i          4d2  5s   9i
   42    3mo iiid2 5p2           4d2  5p2
   42    3mo iiid3 5p            4d3  5p
   42    3mo iiid3 6p            4d3  6p
   42    3mo iiid3 7p            4d3  7p
   42    3mo iiid3 8p            4d3  8p
   42    3mo iiid3 9p            4d3  9p
   42    3mo iiid3 10p           4d3 10p
   42    3mo iiid3 11p           4d3 11p
   42    3mo iiid3 12p           4d3 12p
   42    3mo iiid2 5s5p          4d2  5s   5p
   42    3mo iiid2 5s6p          4d2  5s   6p
   42    3mo iiid2 5s7p          4d2  5s   7p
   42    3mo iiid2 5s8p          4d2  5s   8p
   42    3mo iiid2 5s9p          4d2  5s   9p
   42    3mo iiid2 5s10p         4d2  5s  10p
   42    3mo iiid2 5s11p         4d2  5s  11p
   42    3mo iiid2 5s12p         4d2  5s  12p
   42    3mo iiids2 5p           4d1  5s2  5p
   42    3mo iiids2 6p           4d1  5s2  6p
   42    3mo iiids2 7p           4d1  5s2  7p
   42    3mo iiids2 8p           4d1  5s2  8p
   42    3mo iiids2 9p           4d1  5s2  9p
   42    3mo iiids2 10p          4d1  5s2 10p
   42    3mo iiids2 11p          4d1  5s2 11p
   42    3mo iiids2 12p          4d1  5s2 12p
   42    3mo iiid3 4f            4d3  4f
   42    3mo iiid3 5f            4d3  5f
   42    3mo iiid3 6f            4d3  6f
   42    3mo iiid3 7f            4d3  7f
   42    3mo iiid3 8f            4d3  8f
   42    3mo iiid3 9f            4d3  9f
   42    3mo iiid3 10f           4d3 10f
   42    3mo iiid3 11f           4d3 11f
   42    3mo iiid2 5s4f          4d2  5s   4f
   42    3mo iiid2 5s5f          4d2  5s   5f
   42    3mo iiid2 5s6f          4d2  5s   6f
   42    3mo iiid2 5s7f          4d2  5s   7f
   42    3mo iiid2 5s8f          4d2  5s   8f
   42    3mo iiid2 5s9f          4d2  5s   9f
   42    3mo iiid2 5s10f         4d2  5s  10f
   42    3mo iiid2 5s11f         4d2  5s  11f
   42    3mo iiids2 4f           4d1  5s2  4f
   42    3mo iiids2 5f           4d1  5s2  5f
   42    3mo iiids2 6f           4d1  5s2  6f
   42    3mo iiids2 7f           4d1  5s2  7f
   42    3mo iiids2 8f           4d1  5s2  8f
   42    3mo iiids2 9f           4d1  5s2  9f
   42    3mo iiids2 10f          4d1  5s2 10f
   42    3mo iiids2 11f          4d1  5s2 11f
   42    3mo iiid3 6h            4d3  6h
   42    3mo iiid3 7h            4d3  7h
   42    3mo iiid3 8h            4d3  8h
   42    3mo iiid3 9h            4d3  9h
   42    3mo iiid3 10h           4d3 10h
   42    3mo iiid2 5s6h          4d2  5s   6h
   42    3mo iiid2 5s7h          4d2  5s   7h
   42    3mo iiid2 5s8h          4d2  5s   8h
   42    3mo iiid2 5s9h          4d2  5s   9h
   42    3mo iiid3 8k            4d3  8k
   42    3mo iiid3 9k            4d3  9k
   42    3mo iiid2 5s8k          4d2  5s   8k
   42    3mo iiid2 5s9k          4d2  5s   9k
   -1
$run cray:rcn2c
$DELETE POOL:HF420201.DAT;*
$DELETE POOL:HF420202.DAT;*
$DELETE POOL:HF420204.DAT;*
$DELETE POOL:HF420231.DAT;*
$DELETE POOL:HF420232.DAT;*
