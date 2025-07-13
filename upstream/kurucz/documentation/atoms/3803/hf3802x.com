$set def ku6e:[kurucz.3802]
$assign sys$input for010
$assign sys$output for009
$assign pool:hf380207.dat for007
$assign pool:hf380201.dat for001
$assign pool:hf380202.dat for002
$assign pool:hf380204.dat for004
$assign hf3802x.pun for011
$assign hf3802x.rrr for012
$assign hf3802x.dat for013
$assign hf3802xe.dat for014
$assign pool:hf380231.dat for031
$assign pool:hf380232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   38    3sr iii s2p6            4s2  4p6
   38    3sr iii s2p5 5p         4s2  4p5  5p
   38    3sr iii s2p5 6p         4s2  4p5  6p
   38    3sr iii s2p5 7p         4s2  4p5  7p
   38    3sr iii s2p5 8p         4s2  4p5  8p
   38    3sr iii s2p5 9p         4s2  4p5  9p
   38    3sr iii s2p5 10p        4s2  4p5 10p
   38    3sr iii s2p5 11p        4s2  4p5 11p
   38    3sr iii s2p5 12p        4s2  4p5 12p
   38    3sr iii s2p5 13p        4s2  4p5 13p
   38    3sr iii s2p5 4f         4s2  4p5  4f
   38    3sr iii s2p5 5f         4s2  4p5  5f
   38    3sr iii s2p5 6f         4s2  4p5  6f
   38    3sr iii s2p5 7f         4s2  4p5  7f
   38    3sr iii s2p5 8f         4s2  4p5  8f
   38    3sr iii s2p5 9f         4s2  4p5  9f
   38    3sr iii s2p5 10f        4s2  4p5 10f
   38    3sr iii s2p5 11f        4s2  4p5 11f
   38    3sr iii s2p5 12f        4s2  4p5 12f
   38    3sr iii s2p5 13f        4s2  4p5 13f
   38    3sr iii s2p5 6h         4s2  4p5  6h
   38    3sr iii s2p5 7h         4s2  4p5  7h
   38    3sr iii s2p5 8h         4s2  4p5  8h
   38    3sr iii s2p5 9h         4s2  4p5  9h
   38    3sr iii s2p5 10h        4s2  4p5 10h
   38    3sr iii s2p5 11h        4s2  4p5 11h
   38    3sr iii s2p5 12h        4s2  4p5 12h
   38    3sr iii s2p5 13h        4s2  4p5 13h
   38    3sr iii s2p5 8k         4s2  4p5  8k
   38    3sr iii s2p5 9k         4s2  4p5  9k
   38    3sr iii sp6 5s          4s   4p6  5s
   38    3sr iii sp6 6s          4s   4p6  6s
   38    3sr iii sp6 7s          4s   4p6  7s
   38    3sr iii sp6 8s          4s   4p6  8s
   38    3sr iii sp6 9s          4s   4p6  9s
   38    3sr iii sp6 10s         4s   4p6 10s
   38    3sr iii sp6 11s         4s   4p6 11s
   38    3sr iii sp6 12s         4s   4p6 12s
   38    3sr iii sp6 13s         4s   4p6 13s
   38    3sr iii sp6 4d          4s   4p6  4d
   38    3sr iii sp6 5d          4s   4p6  5d
   38    3sr iii sp6 6d          4s   4p6  6d
   38    3sr iii sp6 7d          4s   4p6  7d
   38    3sr iii sp6 8d          4s   4p6  8d
   38    3sr iii sp6 9d          4s   4p6  9d
   38    3sr iii sp6 10d         4s   4p6 10d
   38    3sr iii sp6 11d         4s   4p6 11d
   38    3sr iii sp6 12d         4s   4p6 12d
   38    3sr iii sp6 13d         4s   4p6 13d
   38    3sr iii s2p5 5s         4s2  4p5  5s
   38    3sr iii s2p5 6s         4s2  4p5  6s
   38    3sr iii s2p5 7s         4s2  4p5  7s
   38    3sr iii s2p5 8s         4s2  4p5  8s
   38    3sr iii s2p5 9s         4s2  4p5  9s
   38    3sr iii s2p5 10s        4s2  4p5 10s
   38    3sr iii s2p5 11s        4s2  4p5 11s
   38    3sr iii s2p5 12s        4s2  4p5 12s
   38    3sr iii s2p5 14s        4s2  4p5 14s
   38    3sr iii s2p5 4d         4s2  4p5  4d
   38    3sr iii s2p5 5d         4s2  4p5  5d
   38    3sr iii s2p5 6d         4s2  4p5  6d
   38    3sr iii s2p5 7d         4s2  4p5  7d
   38    3sr iii s2p5 8d         4s2  4p5  8d
   38    3sr iii s2p5 9d         4s2  4p5  9d
   38    3sr iii s2p5 10d        4s2  4p5 10d
   38    3sr iii s2p5 11d        4s2  4p5 11d
   38    3sr iii s2p5 12d        4s2  4p5 12d
   38    3sr iii s2p5 13d        4s2  4p5 13d
   38    3sr iii s2p5 5g         4s2  4p5  5g
   38    3sr iii s2p5 6g         4s2  4p5  6g
   38    3sr iii s2p5 7g         4s2  4p5  7g
   38    3sr iii s2p5 8g         4s2  4p5  8g
   38    3sr iii s2p5 9g         4s2  4p5  9g
   38    3sr iii s2p5 10g        4s2  4p5 10g
   38    3sr iii s2p5 11g        4s2  4p5 11g
   38    3sr iii s2p5 12g        4s2  4p5 12g
   38    3sr iii s2p5 13g        4s2  4p5 13g
   38    3sr iii s2p5 7i         4s2  4p5  7i
   38    3sr iii s2p5 8i         4s2  4p5  8i
   38    3sr iii s2p5 9i         4s2  4p5  9i
   38    3sr iii sp6 5p          4s   4p6  5p
   38    3sr iii sp6 6p          4s   4p6  6p
   38    3sr iii sp6 7p          4s   4p6  7p
   38    3sr iii sp6 8p          4s   4p6  8p
   38    3sr iii sp6 9p          4s   4p6  9p
   38    3sr iii sp6 10p         4s   4p6 10p
   38    3sr iii sp6 11p         4s   4p6 11p
   38    3sr iii sp6 12p         4s   4p6 12p
   38    3sr iii sp6 14p         4s   4p6 13p
   38    3sr iii sp6 4f          4s   4p6  4f
   38    3sr iii sp6 5f          4s   4p6  5f
   38    3sr iii sp6 6f          4s   4p6  6f
   38    3sr iii sp6 7f          4s   4p6  7f
   38    3sr iii sp6 8f          4s   4p6  8f
   38    3sr iii sp6 9f          4s   4p6  9f
   38    3sr iii sp6 10f         4s   4p6 10f
   38    3sr iii sp6 11f         4s   4p6 11f
   38    3sr iii sp6 12f         4s   4p6 12f
   38    3sr iii sp6 13f         4s   4p6 13f
   -1
$run cray:rcn2c
$DELETE POOL:HF380201.DAT;*
$DELETE POOL:HF380202.DAT;*
$DELETE POOL:HF380204.DAT;*
$DELETE POOL:HF380231.DAT;*
$DELETE POOL:HF380232.DAT;*
