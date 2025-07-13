$set def 2508
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf250807.dat for007
$assign poolg:hf250801.dat for001
$assign poolg:hf250802.dat for002
$assign poolg:hf250804.dat for004
$assign hf2508z.pun for011
$assign hf2508z.rrr for012
$assign hf2508z.dat for013
$assign hf2508ze.dat for014
$assign poolg:hf250831.dat for031
$assign poolg:hf250832.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   25    9mn ix s2p5             3s2  3p5
   25    9mn ix s2p4 4f          3s2  3p4  4f
   25    9mn ix s2p4 5f          3s2  3p4  5f
   25    9mn ix s2p4 6f          3s2  3p4  6f
   25    9mn ix s2p4 7f          3s2  3p4  7f
   25    9mn ix s2p4 8f          3s2  3p4  8f
   25    9mn ix s2p4 9f          3s2  3p4  9f
   25    9mn ix s2p4 10f         3s2  3p4 10f
   25    9mn ix s2p4 11f         3s2  3p4 11f
   25    9mn ix s2p4 12f         3s2  3p4 12f
   25    9mn ix s2p4 6h          3s2  3p4  6h
   25    9mn ix s2p4 7h          3s2  3p4  7h
   25    9mn ix s2p4 8h          3s2  3p4  8h
   25    9mn ix s2p4 9h          3s2  3p4  9h
   25    9mn ix s2p4 8k          3s2  3p4  8k
   25    9mn ix s2p4 9k          3s2  3p4  9k
   25    9mn ix s2p4 5g          3s2  3p4  5g
   25    9mn ix s2p4 6g          3s2  3p4  6g
   25    9mn ix s2p4 7g          3s2  3p4  7g
   25    9mn ix s2p4 8g          3s2  3p4  8g
   25    9mn ix s2p4 9g          3s2  3p4  9g
   25    9mn ix s2p4 7i          3s2  3p4  7i
   25    9mn ix s2p4 8i          3s2  3p4  8i
   25    9mn ix s2p4 9i          3s2  3p4  9i
   -1
$run cray:rcn2c
$DELETE POOLG:HF250801.DAT;*
$DELETE POOLG:HF250802.DAT;*
$DELETE POOLG:HF250804.DAT;*
$DELETE POOLG:HF250831.DAT;*
$DELETE POOLG:HF250832.DAT;*
