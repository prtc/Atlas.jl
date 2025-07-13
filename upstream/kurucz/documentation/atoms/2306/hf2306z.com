$set def 2306
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf230607.dat for007
$assign poolg:hf230601.dat for001
$assign poolg:hf230602.dat for002
$assign poolg:hf230604.dat for004
$assign hf2306z.pun for011
$assign hf2306z.rrr for012
$assign hf2306z.dat for013
$assign hf2306ze.dat for014
$assign poolg:hf230631.dat for031
$assign poolg:hf230632.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   23    7v vii s2p5             3s2  3p5
   23    7v vii s2p4 4f          3s2  3p4  4f
   23    7v vii s2p4 5f          3s2  3p4  5f
   23    7v vii s2p4 6f          3s2  3p4  6f
   23    7v vii s2p4 7f          3s2  3p4  7f
   23    7v vii s2p4 8f          3s2  3p4  8f
   23    7v vii s2p4 9f          3s2  3p4  9f
   23    7v vii s2p4 10f         3s2  3p4 10f
   23    7v vii s2p4 11f         3s2  3p4 11f
   23    7v vii s2p4 12f         3s2  3p4 12f
   23    7v vii s2p4 6h          3s2  3p4  6h
   23    7v vii s2p4 7h          3s2  3p4  7h
   23    7v vii s2p4 8h          3s2  3p4  8h
   23    7v vii s2p4 9h          3s2  3p4  9h
   23    7v vii s2p4 8k          3s2  3p4  8k
   23    7v vii s2p4 9k          3s2  3p4  9k
   23    7v vii s2p4 5g          3s2  3p4  5g
   23    7v vii s2p4 6g          3s2  3p4  6g
   23    7v vii s2p4 7g          3s2  3p4  7g
   23    7v vii s2p4 8g          3s2  3p4  8g
   23    7v vii s2p4 9g          3s2  3p4  9g
   23    7v vii s2p4 7i          3s2  3p4  7i
   23    7v vii s2p4 8i          3s2  3p4  8i
   23    7v vii s2p4 9i          3s2  3p4  9i
   -1
$run cray:rcn2c
$DELETE POOLG:HF230601.DAT;*
$DELETE POOLG:HF230602.DAT;*
$DELETE POOLG:HF230604.DAT;*
$DELETE POOLG:HF230631.DAT;*
$DELETE POOLG:HF230632.DAT;*
