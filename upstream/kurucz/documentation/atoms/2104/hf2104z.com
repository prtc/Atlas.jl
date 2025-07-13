$set def 2104
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf210407.dat for007
$assign poolg:hf210401.dat for001
$assign poolg:hf210402.dat for002
$assign poolg:hf210404.dat for004
$assign hf2104z.pun for011
$assign hf2104z.rrr for012
$assign hf2104z.dat for013
$assign hf2104ze.dat for014
$assign poolg:hf210431.dat for031
$assign poolg:hf210432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   21    5sc v  s2p5             3s2  3p5
   21    5sc v  s2p4 4f          3s2  3p4  4f
   21    5sc v  s2p4 5f          3s2  3p4  5f
   21    5sc v  s2p4 6f          3s2  3p4  6f
   21    5sc v  s2p4 7f          3s2  3p4  7f
   21    5sc v  s2p4 8f          3s2  3p4  8f
   21    5sc v  s2p4 9f          3s2  3p4  9f
   21    5sc v  s2p4 10f         3s2  3p4 10f
   21    5sc v  s2p4 11f         3s2  3p4 11f
   21    5sc v  s2p4 12f         3s2  3p4 12f
   21    5sc v  s2p4 6h          3s2  3p4  6h
   21    5sc v  s2p4 7h          3s2  3p4  7h
   21    5sc v  s2p4 8h          3s2  3p4  8h
   21    5sc v  s2p4 9h          3s2  3p4  9h
   21    5sc v  s2p4 8k          3s2  3p4  8k
   21    5sc v  s2p4 9k          3s2  3p4  9k
   21    5sc v  sp6              3s   3p6
   21    5sc v  s2p4 3d          3s2  3p4  3d
   21    5sc v  s2p4 4d          3s2  3p4  4d
   21    5sc v  s2p4 5d          3s2  3p4  5d
   21    5sc v  s2p4 6d          3s2  3p4  6d
   21    5sc v  s2p4 7d          3s2  3p4  7d
   21    5sc v  s2p4 8d          3s2  3p4  8d
   21    5sc v  s2p4 9d          3s2  3p4  9d
   21    5sc v  s2p4 10d         3s2  3p4 10d
   21    5sc v  s2p4 11d         3s2  3p4 11d
   21    5sc v  s2p4 12d         3s2  3p4 12d
   21    5sc v  s2p4 5g          3s2  3p4  5g
   21    5sc v  s2p4 6g          3s2  3p4  6g
   21    5sc v  s2p4 7g          3s2  3p4  7g
   21    5sc v  s2p4 8g          3s2  3p4  8g
   21    5sc v  s2p4 9g          3s2  3p4  9g
   21    5sc v  s2p4 7i          3s2  3p4  7i
   21    5sc v  s2p4 8i          3s2  3p4  8i
   21    5sc v  s2p4 9i          3s2  3p4  9i
   -1
$run cray:rcn2c
$DELETE POOLG:HF210401.DAT;*
$DELETE POOLG:HF210402.DAT;*
$DELETE POOLG:HF210404.DAT;*
$DELETE POOLG:HF210431.DAT;*
$DELETE POOLG:HF210432.DAT;*
