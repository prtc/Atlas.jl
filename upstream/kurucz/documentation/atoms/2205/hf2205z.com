$set def 2205
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf220507.dat for007
$assign poolg:hf220501.dat for001
$assign poolg:hf220502.dat for002
$assign poolg:hf220504.dat for004
$assign hf2205z.pun for011
$assign hf2205z.rrr for012
$assign hf2205z.dat for013
$assign hf2205ze.dat for014
$assign poolg:hf220531.dat for031
$assign poolg:hf220532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   22    6ti vi s2p5             3s2  3p5
   22    6ti vi s2p4 4f          3s2  3p4  4f
   22    6ti vi s2p4 5f          3s2  3p4  5f
   22    6ti vi s2p4 6f          3s2  3p4  6f
   22    6ti vi s2p4 7f          3s2  3p4  7f
   22    6ti vi s2p4 8f          3s2  3p4  8f
   22    6ti vi s2p4 9f          3s2  3p4  9f
   22    6ti vi s2p4 10f         3s2  3p4 10f
   22    6ti vi s2p4 11f         3s2  3p4 11f
   22    6ti vi s2p4 12f         3s2  3p4 12f
   22    6ti vi s2p4 6h          3s2  3p4  6h
   22    6ti vi s2p4 7h          3s2  3p4  7h
   22    6ti vi s2p4 8h          3s2  3p4  8h
   22    6ti vi s2p4 9h          3s2  3p4  9h
   22    6ti vi s2p4 8k          3s2  3p4  8k
   22    6ti vi s2p4 9k          3s2  3p4  9k
   22    6ti vi s2p4 5g          3s2  3p4  5g
   22    6ti vi s2p4 6g          3s2  3p4  6g
   22    6ti vi s2p4 7g          3s2  3p4  7g
   22    6ti vi s2p4 8g          3s2  3p4  8g
   22    6ti vi s2p4 9g          3s2  3p4  9g
   22    6ti vi s2p4 7i          3s2  3p4  7i
   22    6ti vi s2p4 8i          3s2  3p4  8i
   22    6ti vi s2p4 9i          3s2  3p4  9i
   -1
$run cray:rcn2c
$DELETE POOLG:HF220501.DAT;*
$DELETE POOLG:HF220502.DAT;*
$DELETE POOLG:HF220504.DAT;*
$DELETE POOLG:HF220531.DAT;*
$DELETE POOLG:HF220532.DAT;*
