$set def 4201
$assign sys$input for010
$assign sys$output for009
$assign pool:hf420107.dat for007
$assign pool:hf420101.dat for001
$assign pool:hf420102.dat for002
$assign pool:hf420104.dat for004
$assign hf4201x.pun for011
$assign hf4201x.rrr for012
$assign hf4201x.dat for013
$assign hf4201xe.dat for014
$assign pool:hf420131.dat for031
$assign pool:hf420132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   42    2mo ii d5               4d5
   42    2mo ii d4 5s            4d4  5s
   42    2mo ii d4 6s            4d4  6s
   42    2mo ii d4 7s            4d4  7s
   42    2mo ii d4 8s            4d4  8s
   42    2mo ii d4 9s            4d4  9s
   42    2mo ii d4 10s           4d4 10s
   42    2mo ii d4 11s           4d4 11s
   42    2mo ii d3 5s2           4d3  5s2
   42    2mo ii d3 5s6s          4d3  5s   6s
   42    2mo ii d3 5s7s          4d3  5s   7s
   42    2mo ii d3 5s8s          4d3  5s   8s
   42    2mo ii d3 5s9s          4d3  5s   9s
   42    2mo ii d3 5s10s         4d3  5s  10s
   42    2mo ii d3 5s11s         4d3  5s  11s
   42    2mo ii d2s2 6s          4d2  5s2  6s
   42    2mo ii d2s2 7s          4d2  5s2  7s
   42    2mo ii d2s2 8s          4d2  5s2  8s
   42    2mo ii d2s2 9s          4d2  5s2  9s
   42    2mo ii d2s2 10s         4d2  5s2 10s
   42    2mo ii d2s2 11s         4d2  5s2 11s
   42    2mo ii d4 5d            4d4  5d
   42    2mo ii d4 6d            4d4  6d
   42    2mo ii d4 7d            4d4  7d
   42    2mo ii d4 8d            4d4  8d
   42    2mo ii d4 9d            4d4  9d
   42    2mo ii d4 10d           4d4 10d
   42    2mo ii d4 11d           4d4 11d
   42    2mo ii d3 5s5d          4d3  5s   5d
   42    2mo ii d3 5s6d          4d3  5s   6d
   42    2mo ii d3 5s7d          4d3  5s   7d
   42    2mo ii d3 5s8d          4d3  5s   8d
   42    2mo ii d3 5s9d          4d3  5s   9d
   42    2mo ii d3 5s10d         4d3  5s  10d
   42    2mo ii d3 5s11d         4d3  5s  11d
   42    2mo ii d2s2 5d          4d2  5s2  5d
   42    2mo ii d2s2 6d          4d2  5s2  6d
   42    2mo ii d2s2 7d          4d2  5s2  7d
   42    2mo ii d2s2 8d          4d2  5s2  8d
   42    2mo ii d2s2 9d          4d2  5s2  9d
   42    2mo ii d2s2 10d         4d2  5s2 10d
   42    2mo ii d2s2 11d         4d2  5s2 11d
   42    2mo ii d4 5g            4d4  5g
   42    2mo ii d4 6g            4d4  6g
   42    2mo ii d4 7g            4d4  7g
   42    2mo ii d4 8g            4d4  8g
   42    2mo ii d4 9g            4d4  9g
   42    2mo ii d4 10g           4d4 10g
   42    2mo ii d3 5s5g          4d3  5s   5g
   42    2mo ii d3 5s6g          4d3  5s   6g
   42    2mo ii d3 5s7g          4d3  5s   7g
   42    2mo ii d3 5s8g          4d3  5s   8g
   42    2mo ii d3 5s9g          4d3  5s   9g
   42    2mo ii d3 5s10g         4d3  5s  10g
   42    2mo ii d4 7i            4d4  7i
   42    2mo ii d4 8i            4d4  8i
   42    2mo ii d4 9i            4d4  9i
   42    2mo ii d3 5s7i          4d3  5s   7i
   42    2mo ii d3 5s8i          4d3  5s   8i
   42    2mo ii d3 5s9i          4d3  5s   9i
   42    2mo ii d3 4p2           4d3  5p2
   42    2mo ii d4 5p            4d4  5p
   42    2mo ii d4 6p            4d4  6p
   42    2mo ii d4 7p            4d4  7p
   42    2mo ii d4 8p            4d4  8p
   42    2mo ii d4 9p            4d4  9p
   42    2mo ii d4 10p           4d4 10p
   42    2mo ii d4 11p           4d4 11p
   42    2mo ii d4 12p           4d4 12p
   42    2mo ii d3 5s5p          4d3  5s   5p
   42    2mo ii d3 5s6p          4d3  5s   6p
   42    2mo ii d3 5s7p          4d3  5s   7p
   42    2mo ii d3 5s8p          4d3  5s   8p
   42    2mo ii d3 5s9p          4d3  5s   9p
   42    2mo ii d3 5s10p         4d3  5s  10p
   42    2mo ii d3 5s11p         4d3  5s  11p
   42    2mo ii d3 5s12p         4d3  5s  12p
   42    2mo ii d2s2 5p          4d2  5s2  5p
   42    2mo ii d2s2 6p          4d2  5s2  6p
   42    2mo ii d2s2 7p          4d2  5s2  7p
   42    2mo ii d2s2 8p          4d2  5s2  8p
   42    2mo ii d2s2 9p          4d2  5s2  9p
   42    2mo ii d2s2 10p         4d2  5s2 10p
   42    2mo ii d2s2 11p         4d2  5s2 11p
   42    2mo ii d2s2 12p         4d2  5s2 12p
   42    2mo ii d4 4f            4d4  4f
   42    2mo ii d4 5f            4d4  5f
   42    2mo ii d4 6f            4d4  6f
   42    2mo ii d4 7f            4d4  7f
   42    2mo ii d4 8f            4d4  8f
   42    2mo ii d4 9f            4d4  9f
   42    2mo ii d4 10f           4d4 10f
   42    2mo ii d4 11f           4d4 11f
   42    2mo ii d3 5s4f          4d3  5s   4f
   42    2mo ii d3 5s5f          4d3  5s   5f
   42    2mo ii d3 5s6f          4d3  5s   6f
   42    2mo ii d3 5s7f          4d3  5s   7f
   42    2mo ii d3 5s8f          4d3  5s   8f
   42    2mo ii d3 5s9f          4d3  5s   9f
   42    2mo ii d3 5s10f         4d3  5s  10f
   42    2mo ii d3 5s11f         4d3  5s  11f
   42    2mo ii d2s2 4f          4d2  5s2  4f
   42    2mo ii d2s2 5f          4d2  5s2  5f
   42    2mo ii d2s2 6f          4d2  5s2  6f
   42    2mo ii d2s2 7f          4d2  5s2  7f
   42    2mo ii d2s2 8f          4d2  5s2  8f
   42    2mo ii d2s2 9f          4d2  5s2  9f
   42    2mo ii d2s2 10f         4d2  5s2 10f
   42    2mo ii d2s2 11f         4d2  5s2 11f
   42    2mo ii d4 6h            4d4  6h
   42    2mo ii d4 7h            4d4  7h
   42    2mo ii d4 8h            4d4  8h
   42    2mo ii d4 9h            4d4  9h
   42    2mo ii d4 10h           4d4 10h
   42    2mo ii d3 5s6h          4d3  5s   6h
   42    2mo ii d3 5s7h          4d3  5s   7h
   42    2mo ii d3 5s8h          4d3  5s   8h
   42    2mo ii d3 5s9h          4d3  5s   9h
   42    2mo ii d4 8k            4d4  8k
   42    2mo ii d4 9k            4d4  9k
   42    2mo ii d3 5s8k          4d3  5s   8k
   42    2mo ii d3 5s9k          4d3  5s   9k
   -1
$run cray:rcn2c
$DELETE POOL:HF420101.DAT;*
$DELETE POOL:HF420102.DAT;*
$DELETE POOL:HF420104.DAT;*
$DELETE POOL:HF420131.DAT;*
$DELETE POOL:HF420132.DAT;*
