$set def 2208
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf220807.dat for007
$assign poolg:hf220801.dat for001
$assign poolg:hf220802.dat for002
$assign poolg:hf220804.dat for004
$assign hf2208z.pun for011
$assign hf2208z.rrr for012
$assign hf2208z.dat for013
$assign hf2208ze.dat for014
$assign poolg:hf220831.dat for031
$assign poolg:hf220832.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   22    9ti ix  s2p2            3s2  3p2
   22    9ti ix  s2p 4f          3s2  3p   4f
   22    9ti ix  s2p 5f          3s2  3p   5f
   22    9ti ix  s2p 6f          3s2  3p   6f
   22    9ti ix  s2p 7f          3s2  3p   7f
   22    9ti ix  s2p 8f          3s2  3p   8f
   22    9ti ix  s2p 9f          3s2  3p   9f
   22    9ti ix  s2p 10f         3s2  3p  10f
   22    9ti ix  p3 4f           3s0  3p3  4f
   22    9ti ix  p3 5f           3s0  3p3  5f
   22    9ti ix  p3 6f           3s0  3p3  6f
   22    9ti ix  p3 7f           3s0  3p3  7f
   22    9ti ix  p3 8f           3s0  3p3  8f
   22    9ti ix  p3 9f           3s0  3p3  9f
   22    9ti ix  p3 10f          3s0  3p3 10f
   22    9ti ix  s2p 6h          3s2  3p   6h
   22    9ti ix  s2p 7h          3s2  3p   7h
   22    9ti ix  s2p 8h          3s2  3p   8h
   22    9ti ix  s2p 9h          3s2  3p   9h
   22    9ti ix  s2p 10h         3s2  3p  10h
   22    9ti ix  p3 6h           3s0  3p3  6h
   22    9ti ix  p3 7h           3s0  3p3  7h
   22    9ti ix  p3 8h           3s0  3p3  8h
   22    9ti ix  p3 9h           3s0  3p3  9h
   22    9ti ix  p3 10h          3s0  3p3 10h
   22    9ti ix  s2p 8k          3s2  3p   8k
   22    9ti ix  s2p 9k          3s2  3p   9k
   22    9ti ix  s2p 10k         3s2  3p  10k
   22    9ti ix  p3 8k           3s0  3p3  8k
   22    9ti ix  p3 9k           3s0  3p3  9k
   22    9ti ix  p3 10k          3s0  3p3 10k
   22    9ti ix  s2p 5g          3s2  3p   5g
   22    9ti ix  s2p 6g          3s2  3p   6g
   22    9ti ix  s2p 7g          3s2  3p   7g
   22    9ti ix  s2p 8g          3s2  3p   8g
   22    9ti ix  s2p 9g          3s2  3p   9g
   22    9ti ix  s2p 10g         3s2  3p  10g
   22    9ti ix  p3 5g           3s0  3p3  5g
   22    9ti ix  p3 6g           3s0  3p3  6g
   22    9ti ix  p3 7g           3s0  3p3  7g
   22    9ti ix  p3 8g           3s0  3p3  8g
   22    9ti ix  p3 9g           3s0  3p3  9g
   22    9ti ix  p3 10g          3s0  3p3 10g
   22    9ti ix  s2p 7i          3s2  3p   7i
   22    9ti ix  s2p 8i          3s2  3p   8i
   22    9ti ix  s2p 9i          3s2  3p   9i
   22    9ti ix  s2p 10i         3s2  3p  10i
   22    9ti ix  p3 7i           3s0  3p3  7i
   22    9ti ix  p3 8i           3s0  3p3  8i
   22    9ti ix  p3 9i           3s0  3p3  9i
   22    9ti ix  p3 10i          3s0  3p3 10i
   -1
$run cray:rcn2c
$DELETE POOLG:HF220801.DAT;*
$DELETE POOLG:HF220802.DAT;*
$DELETE POOLG:HF220804.DAT;*
$DELETE POOLG:HF220831.DAT;*
$DELETE POOLG:HF220832.DAT;*
