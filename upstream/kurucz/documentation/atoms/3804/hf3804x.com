$set def ku6e:[kurucz.3804]
$assign sys$input for010
$assign sys$output for009
$assign hf380407.dat for007
$assign hf380401.dat for001
$assign hf380402.dat for002
$assign hf380404.dat for004
$assign hf3804x.pun for011
$assign hf3804x.RRR for012
$assign hf3804x.dat for013
$assign hf3804xe.dat for014
$assign hf380431.dat for031
$assign hf380432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   38    5sr v  s2p4             3d10 4s2  4p4
   38    5sr v  s2p3 5p          3d10 4s2  4p3  5p
   38    5sr v  s2p3 6p          3d10 4s2  4p3  6p
   38    5sr v  s2p3 7p          3d10 4s2  4p3  7p
   38    5sr v  s2p3 8p          3d10 4s2  4p3  8p
   38    5sr v  s2p3 9p          3d10 4s2  4p3  9p
   38    5sr v  s2p3 10p         3d10 4s2  4p3 10p
   38    5sr v  s2p3 11p         3d10 4s2  4p3 11p
   38    5sr v  s2p3 12p         3d10 4s2  4p3 12p
   38    5sr v  s2p3 13p         3d10 4s2  4p3 13p
   38    5sr v  s2p3 4f          3d10 4s2  4p3  4f
   38    5sr v  s2p3 5f          3d10 4s2  4p3  5f
   38    5sr v  s2p3 6f          3d10 4s2  4p3  6f
   38    5sr v  s2p3 7f          3d10 4s2  4p3  7f
   38    5sr v  s2p3 8f          3d10 4s2  4p3  8f
   38    5sr v  s2p3 9f          3d10 4s2  4p3  9f
   38    5sr v  s2p3 10f         3d10 4s2  4p3 10f
   38    5sr v  s2p3 11f         3d10 4s2  4p3 11f
   38    5sr v  s2p3 12f         3d10 4s2  4p3 12f
   38    5sr v  s2p3 13f         3d10 4s2  4p3 13f
   38    5sr v  s2p3 6h          3d10 4s2  4p3  6h
   38    5sr v  s2p3 7h          3d10 4s2  4p3  7h
   38    5sr v  s2p3 8h          3d10 4s2  4p3  8h
   38    5sr v  s2p3 9h          3d10 4s2  4p3  9h
   38    5sr v  s2p3 8k          3d10 4s2  4p3  8k
   38    5sr v  s2p3 9k          3d10 4s2  4p3  9k
   38    5sr v  sp4 5s           3d10 4s   4p4  5s
   38    5sr v  sp4 6s           3d10 4s   4p4  6s
   38    5sr v  sp4 7s           3d10 4s   4p4  7s
   38    5sr v  sp4 8s           3d10 4s   4p4  8s
   38    5sr v  sp4 9s           3d10 4s   4p4  9s
   38    5sr v  sp4 10s          3d10 4s   4p4 10s
   38    5sr v  sp4 11s          3d10 4s   4p4 11s
   38    5sr v  sp4 12s          3d10 4s   4p4 12s
   38    5sr v  sp4 13s          3d10 4s   4p4 13s
   38    5sr v  sp4 4d           3d10 4s   4p4  4d
   38    5sr v  sp4 5d           3d10 4s   4p4  5d
   38    5sr v  sp4 6d           3d10 4s   4p4  6d
   38    5sr v  sp4 7d           3d10 4s   4p4  7d
   38    5sr v  sp4 8d           3d10 4s   4p4  8d
   38    5sr v  sp4 9d           3d10 4s   4p4  9d
   38    5sr v  sp4 10d          3d10 4s   4p4 10d
   38    5sr v  sp4 11d          3d10 4s   4p4 11d
   38    5sr v  sp4 12d          3d10 4s   4p4 12d
   38    5sr v  sp4 13d          3d10 4s   4p4 13d
   38    5sr v  s2p3 5s          3d10 4s2  4p3  5s
   38    5sr v  s2p3 6s          3d10 4s2  4p3  6s
   38    5sr v  s2p3 7s          3d10 4s2  4p3  7s
   38    5sr v  s2p3 8s          3d10 4s2  4p3  8s
   38    5sr v  s2p3 9s          3d10 4s2  4p3  9s
   38    5sr v  s2p3 10s         3d10 4s2  4p3 10s
   38    5sr v  s2p3 11s         3d10 4s2  4p3 11s
   38    5sr v  s2p3 12s         3d10 4s2  4p3 12s
   38    5sr v  s2p3 13s         3d10 4s2  4p3 13s
   38    5sr v  s2p3 4d          3d10 4s2  4p3  4d
   38    5sr v  s2p3 5d          3d10 4s2  4p3  5d
   38    5sr v  s2p3 6d          3d10 4s2  4p3  6d
   38    5sr v  s2p3 7d          3d10 4s2  4p3  7d
   38    5sr v  s2p3 8d          3d10 4s2  4p3  8d
   38    5sr v  s2p3 9d          3d10 4s2  4p3  9d
   38    5sr v  s2p3 10d         3d10 4s2  4p3 10d
   38    5sr v  s2p3 11d         3d10 4s2  4p3 11d
   38    5sr v  s2p3 12d         3d10 4s2  4p3 12d
   38    5sr v  s2p3 13d         3d10 4s2  4p3 13d
   38    5sr v  s2p3 5g          3d10 4s2  4p3  5g
   38    5sr v  s2p3 6g          3d10 4s2  4p3  6g
   38    5sr v  s2p3 7g          3d10 4s2  4p3  7g
   38    5sr v  s2p3 8g          3d10 4s2  4p3  8g
   38    5sr v  s2p3 9g          3d10 4s2  4p3  9g
   38    5sr v  s2p3 7i          3d10 4s2  4p3  7i
   38    5sr v  s2p3 8i          3d10 4s2  4p3  8i
   38    5sr v  s2p3 9i          3d10 4s2  4p3  9i
   38    5sr v  sp5              3d10 4s   4p5  
   38    5sr v  sp4 5p           3d10 4s   4p4  5p
   38    5sr v  sp4 6p           3d10 4s   4p4  6p
   38    5sr v  sp4 7p           3d10 4s   4p4  7p
   38    5sr v  sp4 8p           3d10 4s   4p4  8p
   38    5sr v  sp4 9p           3d10 4s   4p4  9p
   38    5sr v  sp4 10p          3d10 4s   4p4 10p
   38    5sr v  sp4 11p          3d10 4s   4p4 11p
   38    5sr v  sp4 12p          3d10 4s   4p4 12p
   38    5sr v  sp4 13p          3d10 4s   4p4 13p
   38    5sr v  sp4 4f           3d10 4s   4p4  4f
   38    5sr v  sp4 5f           3d10 4s   4p4  5f
   38    5sr v  sp4 6f           3d10 4s   4p4  6f
   38    5sr v  sp4 7f           3d10 4s   4p4  7f
   38    5sr v  sp4 8f           3d10 4s   4p4  8f
   38    5sr v  sp4 9f           3d10 4s   4p4  9f
   38    5sr v  sp4 10f          3d10 4s   4p4 10f
   38    5sr v  sp4 11f          3d10 4s   4p4 11f
   38    5sr v  sp4 12f          3d10 4s   4p4 12f
   38    5sr v  sp4 13f          3d10 4s   4p4 13f
   -1
$run cray:rcn2c
$DELETE HF380401.DAT;*
$DELETE HF380402.DAT;*
$DELETE HF380404.DAT;*
$DELETE HF380431.DAT;*
$DELETE HF380432.DAT;*
