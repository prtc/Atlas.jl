$set def 2003
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf200307.dat for007
$assign poolg:hf200301.dat for001
$assign poolg:hf200302.dat for002
$assign poolg:hf200304.dat for004
$assign hf2003z.pun for011
$assign hf2003z.rrr for012
$assign hf2003z.dat for013
$assign hf2003ze.dat for014
$assign poolg:hf200331.dat for031
$assign poolg:hf200332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   20    4ca iv s2p5             3s2  3p5
   20    4ca iv s2p4 4f          3s2  3p4  4f
   20    4ca iv s2p4 5f          3s2  3p4  5f
   20    4ca iv s2p4 6f          3s2  3p4  6f
   20    4ca iv s2p4 7f          3s2  3p4  7f
   20    4ca iv s2p4 8f          3s2  3p4  8f
   20    4ca iv s2p4 9f          3s2  3p4  9f
   20    4ca iv s2p4 10f         3s2  3p4 10f
   20    4ca iv s2p4 11f         3s2  3p4 11f
   20    4ca iv s2p4 12f         3s2  3p4 12f
   20    4ca iv s2p4 6h          3s2  3p4  6h
   20    4ca iv s2p4 7h          3s2  3p4  7h
   20    4ca iv s2p4 8h          3s2  3p4  8h
   20    4ca iv s2p4 9h          3s2  3p4  9h
   20    4ca iv s2p4 8k          3s2  3p4  8k
   20    4ca iv s2p4 9k          3s2  3p4  9k
   20    4ca iv s2p4 5g          3s2  3p4  5g
   20    4ca iv s2p4 6g          3s2  3p4  6g
   20    4ca iv s2p4 7g          3s2  3p4  7g
   20    4ca iv s2p4 8g          3s2  3p4  8g
   20    4ca iv s2p4 9g          3s2  3p4  9g
   20    4ca iv s2p4 7i          3s2  3p4  7i
   20    4ca iv s2p4 8i          3s2  3p4  8i
   20    4ca iv s2p4 9i          3s2  3p4  9i
   -1
$run cray:rcn2c
$DELETE POOLG:HF200301.DAT;*
$DELETE POOLG:HF200302.DAT;*
$DELETE POOLG:HF200304.DAT;*
$DELETE POOLG:HF200331.DAT;*
$DELETE POOLG:HF200332.DAT;*
