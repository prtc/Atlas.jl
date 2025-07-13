$set def 5601
$assign sys$input for010
$assign sys$output for009
$assign pool:hf560107.dat for007
$assign pool:hf560101.dat for001
$assign pool:hf560102.dat for002
$assign pool:hf560104.dat for004
$assign hf5601X.pun for011
$assign hf5601X.rrr for012
$assign hf5601X.dat for013
$assign hf5601Xe.dat for014
$assign pool:hf560131.dat for031
$assign pool:hf560132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   56    2baii   5p6 6s          5p6  6s
   56    2baii   5p6 7s          5p6  7s
   56    2baii   5p6 8s          5p6  8s
   56    2baii   5p6 9s          5p6  9s
   56    2baii   5p6 10s         5p6 10s
   56    2baii   5p6 11s         5p6 11s
   56    2baii   5p6 12s         5p6 12s
   56    2baii   5p6 13s         5p6 13s
   56    2baii   5p6 14s         5p6 14s
   56    2baii   5p6 5d          5p6  5d
   56    2baii   5p6 6d          5p6  6d
   56    2baii   5p6 7d          5p6  7d
   56    2baii   5p6 8d          5p6  8d
   56    2baii   5p6 9d          5p6  9d
   56    2baii   5p6 10d         5p6 10d
   56    2baii   5p6 11d         5p6 11d
   56    2baii   5p6 12d         5p6 12d
   56    2baii   5p6 13d         5p6 13d
   56    2baii   5p6 14d         5p6 14d
   56    2baii   5p6 5g          5p6  5g
   56    2baii   5p6 6g          5p6  6g
   56    2baii   5p6 7g          5p6  7g
   56    2baii   5p6 8g          5p6  8g
   56    2baii   5p6 9g          5p6  9g
   56    2baii   5p6 10g         5p6 10g
   56    2baii   5p6 11g         5p6 11g
   56    2baii   5p6 12g         5p6 12g
   56    2baii   5p6 13g         5p6 13g
   56    2baii   5p6 14g         5p6 14g
   56    2baii   5p6 7i          5p6  7i
   56    2baii   5p6 8i          5p6  8i
   56    2baii   5p6 9i          5p6  9i
   56    2baii   5p6 10i         5p6 10i
   56    2baii   5p6 11i         5p6 11i
   56    2baii   5p6 6p          5p6  6p
   56    2baii   5p6 7p          5p6  7p
   56    2baii   5p6 8p          5p6  8p
   56    2baii   5p6 9p          5p6  9p
   56    2baii   5p6 10p         5p6 10p
   56    2baii   5p6 11p         5p6 11p
   56    2baii   5p6 12p         5p6 12p
   56    2baii   5p6 13p         5p6 13p
   56    2baii   5p6 14p         5p6 14p
   56    2baii   5p6 4f          5p6  4f
   56    2baii   5p6 5f          5p6  5f
   56    2baii   5p6 6f          5p6  6f
   56    2baii   5p6 7f          5p6  7f
   56    2baii   5p6 8f          5p6  8f
   56    2baii   5p6 9f          5p6  9f
   56    2baii   5p6 10f         5p6 10f
   56    2baii   5p6 11f         5p6 11f
   56    2baii   5p6 12f         5p6 12f
   56    2baii   5p6 13f         5p6 13f
   56    2baii   5p6 14f         5p6 14f
   56    2baii   5p6 6h          5p6  6h
   56    2baii   5p6 7h          5p6  7h
   56    2baii   5p6 8h          5p6  8h
   56    2baii   5p6 9h          5p6  9h
   56    2baii   5p6 10h         5p6 10h
   56    2baii   5p6 11h         5p6 11h
   56    2baii   5p6 8k          5p6  8k
   56    2baii   5p6 9k          5p6  9k
   56    2baii   5p6 10k         5p6 10k
   56    2baii   5p6 11k         5p6 11k
   -1
$run cray:rcn2c
$DELETE POOL:HF560101.DAT;*
$DELETE POOL:HF560102.DAT;*
$DELETE POOL:HF560104.DAT;*
$DELETE POOL:HF560131.DAT;*
$DELETE POOL:HF560132.DAT;*
